//智能预警
var host = window.location.host;// 获取当前页面域名
var pageurl = 'http://'+ host;
require([
	"esri/map","esri/geometry/Extent",
	"esri/layers/ArcGISTiledMapServiceLayer",
	"esri/layers/ArcGISDynamicMapServiceLayer",
	"esri/tasks/BufferParameters",
	"esri/tasks/GeometryService",
    "esri/tasks/query", "esri/tasks/QueryTask",
    "esri/tasks/IdentifyTask", "esri/tasks/IdentifyParameters",
    "esri/symbols/SimpleLineSymbol","esri/symbols/SimpleFillSymbol","esri/Color",
    "esri/symbols/PictureMarkerSymbol",
    "esri/geometry/Point","esri/graphic","esri/layers/GraphicsLayer",
    "esri/InfoTemplate"
],function(
	Map,Extent,
	Tiled,ArcGISDynamicMapServiceLayer,
	BufferParameters,GeometryService,
    Query, QueryTask,
    IdentifyTask, IdentifyParameters,
    SimpleLineSymbol,SimpleFillSymbol,Color,
    PictureMarkerSymbol,
    Point,Graphic,GraphicsLayer,
    InfoTemplate
){
	
	var tiled = new Tiled("http://31.16.1.101/arcgis/rest/services/shsw_JCDXT2016/MapServer");
    var yewuUrl = "http://31.16.1.101/arcgis/rest/services/shsw_HYJCXX/MapServer";   
	var	map = new Map("map", {
		logo: false,
		zoom: 0,
		maxZoom:7,
		slider: false
	});
	map.addLayer(tiled); //底图
    var pipeLayer = new GraphicsLayer();
    map.addLayer(pipeLayer);//海底管线图层
    var bufferLayer = new GraphicsLayer();
    map.addLayer(bufferLayer);//buffer图层
    var shipLayer = new GraphicsLayer();
    map.addLayer(shipLayer);//ship图层
    var videoLayer = new GraphicsLayer();
    map.addLayer(videoLayer);//video图层
    
    var Sym_PIPE = new SimpleLineSymbol(
            esri.symbol.SimpleLineSymbol.STYLE_DASH,
            new dojo.Color([0, 0, 0]),
            1
        );
    var Sym_Slect = new SimpleLineSymbol(
            esri.symbol.SimpleLineSymbol.STYLE_SOLID,
            new dojo.Color([0, 0, 255]),
            5
        );
    var select = 0;//选中状态
    /*********加载金山岛视频点***********/
    function loadPoint(){
        var symbol = new PictureMarkerSymbol('../../../hydg/images/video.png', 50, 50);
        var infoTemplate = new InfoTemplate("船名","${name}");
        //大金山岛1
        var point1 = new Point(-4447.367940562527,-60446.668133655985,map.spatialReference);
        var attr1 = {name:"大金山岛1",num:'1000056$1$0$0'};
        var graphic1 = new Graphic(point1,symbol,attr1,infoTemplate);
        videoLayer.add(graphic1);
        //大金山岛2
        var point2 = new Point(-4518.805583437813,-60269.39694578027,map.spatialReference);
        var attr2 = {name:"大金山岛2",num:'1000055$1$0$0'};
        var graphic2 = new Graphic(point2,symbol,attr2,infoTemplate);
        videoLayer.add(graphic2);
    }

	tiled.on("load",function(){		
		$('body').addClass('loaded');
        $('#loader-wrapper .load_title').remove();
        searchLine();
        loadPoint();
	});
	map.on("click",function(){
		if(select == 1){
			var pipes = pipeLayer.graphics;
	    	for(var i = 0;i<pipes.length;i++){
	    		var pipe = pipes[i];
	    		pipe.setSymbol(Sym_PIPE);
	    		select = 0;
	    	}
		}
	});
	reloadpipe = function(){
		pipeLayer.clear();
		searchLine();
		$(".menuList").empty();
	}
/*********加载初始预警条件**********/
    var geoserver = new GeometryService("http://31.16.1.101/arcgis/rest/services/Utilities/Geometry/GeometryServer");

    //加载管线
    function searchLine(){
    	var queryTask = new QueryTask(yewuUrl+"/16");
        var query = new Query();
        query.where = "OBJECTID >= 0 ";
        query.outFields = ["*"];
        query.returnGeometry = true;
        queryTask.execute(query,function(res){
        	for(var i = 0;i<res.features.length;i++){
        		var line = res.features[i];
        		var infoTemplate = new InfoTemplate("名称：${名称}",
                        "OBJECTID：${OBJECTID}<br>长度：${LENGTH}米" +
                        "<br>OUTPUT84_：${OUTPUT84_}<br>OUTPUT84_I:${OUTPUT84_I}<br>光缆类别:${光缆类别}");
        		line.setSymbol(Sym_PIPE);
        		line.setInfoTemplate(infoTemplate);
        		pipeLayer.add(line);
        	}
        	//按照管线id查询对应预警条件
        	loadTiaoJ();
        });     
    }
    
    //读取预警条件的数据库
    function loadTiaoJ(){
    	$.ajax({
            async: false,
            type: 'post',
            url: pageurl+'/hydg/pip/pip_fetchGxyjtj.do',
            datatype: "json",
            cache: false,
            success: function(json) {
                infos = eval("["+json+"]");
                tjs = infos[0].gxyjtjEntities;
                analysisTJ(tjs);
            }
        });
    }
    //逐条分析管线
    function analysisTJ(tjs){
    	var pipes = pipeLayer.graphics;
    	for(var i = 0;i < pipes.length;i++){
    		var pipe = pipes[i];
    		var objid = pipe.attributes.OBJECTID
    		for(var j = 0;j < tjs.length;j++){
    			var pipelineid = tjs[j].piplineid;
    			var sqlid = tjs[j].id;
    			if(pipelineid == objid){
    				loadMenu(pipe,tjs[j]);
    				lineBuffer(pipe,tjs[j]);
    				break;
    			}
    		}
    	}
    }
   
	//根据查询到的管线信息填充menu
    function loadMenu(pipe,tj){
    	var listObj = pipe.attributes;
        var linegeo = pipe.geometry;
        
        var li = document.createElement("li");
        $(li).attr("objId",listObj.OBJECTID);
        $(li).attr("name",listObj.名称);
        $(li).attr("sqlid",tj.id);
        $(li).attr("distance",tj.distance);
        $(li).attr("linesog1",tj.soglevel1);
        $(li).attr("linesog2",tj.soglevel2);
        $(li).attr("linesog3",tj.soglevel3);
        //获取 OBJECTID
        li.onclick = function(){
        	$(".seabedSet").show();
            $("#object").val($(this).attr("objId"));
            $("#distance").val($(this).attr("distance"));
            $("#linesog1").val($(this).attr("linesog1"));
            $("#linesog2").val($(this).attr("linesog2"));
            $("#linesog3").val($(this).attr("linesog3"));
        	$(".menuList li").removeClass("active");
        	$(this).addClass("active");
        	listId = $(this).attr("objId");	
        	listName = $(this).attr("name");
        	listSqlid = $(this).attr("sqlid");
        	selectLine($(this).attr("objId"));//选择管线
        }
        var a = document.createElement("a");
        a.herf = "#";
        a.innerHTML = listObj.名称;        	
        li.appendChild(a);       	
        $(".menuList").append(li);
    }
    //生成buffer参数params
    function lineBuffer(pipe,tj){
    	var buffergeo = pipe.geometry;
    	var distance = tj.distance;
        var params = new BufferParameters();
        params.geometries = [buffergeo];
        params.distances = [distance];
        params.outSpatialReference = map.spatialReference;
        params.unit = GeometryService.UNIT_METER;
        //展示该线缓冲区
        geoserver.buffer(params, function(results){
        	var symbol = new SimpleFillSymbol(
        			SimpleFillSymbol.STYLE_SOLID,
 	                new SimpleLineSymbol(
 	                		SimpleLineSymbol.STYLE_SOLID,
 	                		new Color([255,0,0,0.65]),
 	                		0.5
 	                ),
 	                new Color([255,0,0,0.35])
 	              );
 	        var geometry = results[0];
 	        var attr = pipe.attributes;
 	        attr.soglevel1 = tj.soglevel1;
 	        attr.soglevel2 = tj.soglevel2;
 	       	attr.soglevel3 = tj.soglevel3;
 	        var buffers = new Graphic(geometry,symbol,attr,null);
 	        bufferLayer.add(buffers);
        });
    }
    
  //展示列表选择的管线
    function selectLine(lineid){
    	var pipes = pipeLayer.graphics;
    	for(var i = 0;i<pipes.length;i++){
    		var pipe = pipes[i];
    		if(lineid == pipe.attributes.OBJECTID){
    			pipe.setSymbol(Sym_Slect);
    			select = 1;
    		}
    	}
    }
/*******修改缓冲区条件*********/
    makeChange = function(data){
        $.ajax({
            async: false,
            type: 'post',
            data: data,
            url: pageurl + '/hydg/pip/pip_updateYjtj.do',
            datatype: "json",
            cache: false,
            success: function() {
        		changeBuffer(data);
        		for(var i = 0;i<pipes.length;i++){
    	    		var pipe = pipes[i];
    	    		pipe.setSymbol(Sym_PIPE);
    	    		select = 0;
    	    	}
            }
        });
    }
    function changeBuffer(data){//修改数值后改变地图显示
    	var currentid = data["gxyjtjEntity.piplineid"];
    	var buffers = bufferLayer.graohics;
    	//删除原buffer
    	for(var i = 0;i < buffers.length;i++){
    		var pipe = buffers[i];
    		if(currentid == buffer.attributes.OBJECTID){
    			bufferLayer.remove(pipe);		
    		}
    	}
    	//建立新buffer
    	var pipes = pipeLayer.graphics;
    	for(var i = 0;i < pipes.length;i++){
    		var pipe = pipes[i];
    		if(currentid == pipe.attributes.OBJECTID){
    			console.log(pipe);
    			var tj = {};
    			tj.distance = data["gxyjtjEntity.distance"];
    			tj.soglevel1 = data["gxyjtjEntity.soglevel1"];
    			tj.soglevel2 = data["gxyjtjEntity.soglevel2"];
    			tj.soglevel3 = data["gxyjtjEntity.soglevel3"];
    			lineBuffer(pipe,tj);
    		}
    	}
    }

/*******查询所有船舶预警记录********/
    showALLship = function(){
    	$.ajax({
            async: false,
            type: 'post',
//            data: data,	
            url: pageurl+'/hydg/pip/pip_fetchWgcbAll.do',
            datatype: "json",
            cache: false,
            success: function(json) {
    			var allship = eval(json);
    			console.log(i+"---"+allship.length);
                showWGship(allship);
            }
        });
    }
    function showWGship(allship){
    	shipLayer.clear();
    	for(var i = 0;i<100;i++){
    		var shipinfo = allship[i];
            var mapxy = toXY(shipinfo.longitude, shipinfo.latitude);
            var pos = new Point(mapxy[0], mapxy[1], map.spatialReference);
            var symbol = new PictureMarkerSymbol('../images/ship0.png', 50, 50);
        	var attr = {cablename : shipinfo.cablename,
        			addtime : shipinfo.addtime,
        			warningrank : shipinfo.warningrank,
        			mmsi : shipinfo.mmsi,
        			sog : shipinfo.sog,
        			cog : shipinfo.cog,
        			thead : shipinfo.thead};
        	var infoTemplate = new InfoTemplate("mmsi：${mmsi}",
                    "预警时速：${sog}<br>对地航向：${cog}米" +
                    "<br>预警级别:${warningrank}<br>预警时间:${addtime}<br>所近海缆：${cablename}");
        	var shipgra = new Graphic(pos,symbol,attr,infoTemplate);
        	shipLayer.add(shipgra);
    	}
    }
/*******查询预警记录结束*********/

/*******查询船舶并判断是否预警********/
	setInterval(function() {
//      searchShip();
}, 300000);
    searchShip = function(){//查询AIS船舶位置
    	var areas = [{leftDown: "121.2125544595674,31.830022415195486", rightTop: "121.30858289925477,31.89031504823554"},
    	         	{leftDown: "121.64290604387003,31.653616388706254", rightTop: "121.70875056343641,31.771627362573955"},
    	         	{leftDown: "121.32516263521605,31.49877001884931", rightTop: "121.41864026867658,31.646790727854903"},
    	         	{leftDown: "121.4421450030734,31.4454039447371", rightTop: "121.60816384167073,31.544131159983504"},
    	         	{leftDown: "121.65689095915971,31.31552936299345", rightTop: "121.78923346215635,31.496629977609537"},
    	         	{leftDown: "121.78926383520536,31.33770676253352", rightTop: "121.81994272838118,31.364831800642712"},
    	         	{leftDown: "121.88449490477709,31.558161625663132", rightTop: "123.51578646607689,31.874135777710837"},
    	         	{leftDown: "123.01851322056585,31.043709896640657", rightTop: "123.50576199790945,31.542716339166514"},
    	         	{leftDown: "122.27293515312739,31.36067147726973", rightTop: "123.05004953925294,31.608779805932098"},
    	         	{leftDown: "121.83525822774656,30.33179205040375", rightTop: "123.53174384331514,30.945995228015086"}];

    	for(var i = 0;i<areas.length;i++){
    		var data = areas[i];
    		$.ajax({
                async: false,
                type: 'post',
                data: data,	
                url: pageurl+'/hydg/ais/ais_areaQuery.do',
                datatype: "json",
                cache: false,
                success: function(json) {
        			var allship = eval(json);
        			console.log(i+"---"+allship.length);
                    analysisShip(allship);
                }
            });
    	}
    }
    function analysisShip(allship){
    	shipLayer.clear();
    	for(var i = 0;i < allship.length;i++){
	    	  var shipinfo = allship[i];
              var mapxy = toXY(shipinfo.longitude, shipinfo.latitude);
              var pos = new Point(mapxy[0], mapxy[1], map.spatialReference); 
            //判断是否与管线相交
              for(var j = 0;j<bufferLayer.graphics.length;j++){
  	    		var buffer = bufferLayer.graphics[j];
  	    		if(buffer.geometry.contains(pos)){//geometry相比较
  	    			//判断级别
  	    			var sog = shipinfo.sog;
  	    			var sog1 = buffer.attributes.soglevel1;
  	    			var sog2 = buffer.attributes.soglevel2;
  	    			var sog3 = buffer.attributes.soglevel3;
  	    			var linename = buffer.attributes.名称;
  	    			if(parseFloat(sog)<= parseFloat(sog1)){
  	    				var bjly = '一级预警';
  	  	    			showShip(pos,linename,shipinfo,bjly);
  	    			}else if(sog <= sog2){
  	    				var bjly = '二级预警';
  	  	    			showShip(pos,linename,shipinfo,bjly);
  	    			}else if(sog <= sog3){
  	    				var bjly = '三级预警';
  	  	    			showShip(pos,linename,shipinfo,bjly);
  	    			}else{
  	    				var bjly = '三级预警';
  	    				showShip(pos,linename,shipinfo,bjly);
  	    			}
  	    		}
  	    	}
    	}
    	function showShip(pos,linename,shipinfo,bjly){
        	var symbol = new PictureMarkerSymbol('../images/ship0.png', 50, 50);
        	var attr = {mmsi : shipinfo.mmsi,
        			sog : shipinfo.sog,
        			cog : shipinfo.cog,
        			thead : shipinfo.thead,
        			longitude : shipinfo.longitude,
        			latitude : shipinfo.latitude};
        	var shipgra = new Graphic(pos,symbol,attr,null);
        	shipLayer.add(shipgra);
        	saveAIScb(linename,shipgra,bjly);
    	}
    }
/********根据雷达信息判断*************/
    //获取当前时间
    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;//月
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        var strDate = date.getDate();//日
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var hour = date.getHours();//时
        if (hour >= 0 && hour <= 9) {
        	hour = "0" + hour;
        }
        var minutes = date.getMinutes();//分
        if (minutes >= 0 && minutes <= 9) {
        	minutes = "0" + minutes;
        }
        var preminutes = minutes + 1;//向前查询一分钟
        if (preminutes >= 0 && preminutes <= 9) {
        	preminutes = "0" + preminutes;
        }
        var seconds = date.getSeconds();//秒
        if (seconds >= 0 && seconds <= 9) {
        	seconds = "0" + seconds;
        }
        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
                + " " + hour + seperator2 + minutes
                + seperator2 + seconds;
        var predata = date.getFullYear() + seperator1 + month + seperator1 + strDate
        		+ " " + hour + seperator2 + preminutes
        		+ seperator2 + seconds;
        return [predata,currentdate];
    }
//    searchRadio();
    function searchRadio(){//查询雷达数据
    	setInterval(function() {
    		var time = getNowFormatDate();
    		console.log(time);
    		getRadio(time);
        }, 3000);
    }
})


/****上传AIS预警船舶信息*****/
function saveAIScb(linename,shipinfo,bjly){
	var data = {
		"wgcbEntity.mmsi":shipinfo.attributes.mmsi,
		"wgcbEntity.sog":shipinfo.attributes.sog,
		"wgcbEntity.longitude":shipinfo.attributes.longitude,
		"wgcbEntity.latitude":shipinfo.attributes.latitude,
		"wgcbEntity.cog":shipinfo.attributes.cog,
		"wgcbEntity.thead":shipinfo.attributes.thead,
		"wgcbEntity.cablename":linename,//船舶名称
		"wgcbEntity.bjly":"船舶预警",
		"wgcbEntity.warningrank":bjly
	}
	$.ajax({	
		url : pageurl + '/hydg/pip/pip_saveWgcb.do', 
		data : data,
		type : "post",
		async : false,
		success : function(result){
//			alert("ok!!!!!");
			
		}
	})
}
/****查询雷达信息*****/
function getRadio(time){
	data = {startTime:"2017-10-26",
			endTime:"2017-10-27"};
	$.ajax({
        async: false,
        type: 'post',
        data:data, 
        url: pageurl+'/hydg/dbld/dbld_fetchByTime.do',
        datatype: "json",
        cache: false,
        success: function(json) {
            infos = eval("["+json+"]");
//            console.log(infos);
        }
    });
}
/****坐标计算*****/
function toXY(Aa, Bb){
//	var Aa = DegreeConvertBack(jd);
//	var Bb = DegreeConvertBack(wd);
    var a = 6378245.0; //'椭球体长半轴				 
    var b = 6356863.0188;; // '椭球体短半轴				 
    var f = (a - b) / a;; //'扁率				 
    var e1 = Math.sqrt(2 * f - MZ(f, 2)); // '第一偏心率				 
    var e2 = e1 / Math.sqrt(1 - MZ(e1, 2)); //'第二偏心率				 
    var falseE = 8.0; //EastOffset东偏移 			 
    var falseN = -3457143.04; //NorthOffset北偏移
    var L0 = 121.4671519444444; //CentralMeridian中央经				 
    var W0 = 0.0; //OriginLatitude原点纬线				 
    var k0 = 1; //'比例因子							 
    var PI = 3.14159265358979;
    /*
     * 输入参数分别是：经度、纬度
     */
    var BR = (Bb - W0) * PI / 180; //纬度弧长				 
    var lo = (Aa - L0) * PI / 180; //经差弧度				 
    var N = a / Math.sqrt(1 - MZ((e1 * Math.sin(BR)), 2)) //卯酉圈曲率半径
    //求解参数s
    var B0;
    var B2;
    var B4;
    var B6;
    var B8;
    var C = MZ(a, 2) / b;
    B0 = 1 - 3 * MZ(e2, 2) / 4 + 45 * MZ(e2, 4) / 64 - 175 * MZ(e2, 6) / 256 + 11025 * MZ(e2, 8) / 16384;
    B2 = B0 - 1
    B4 = 15 / 32 * MZ(e2, 4) - 175 / 384 * MZ(e2, 6) + 3675 / 8192 * MZ(e2, 8);
    B6 = 0 - 35 / 96 * MZ(e2, 6) + 735 / 2048 * MZ(e2, 8);
    B8 = 315 / 1024 * MZ(e2, 8);
    s = C * (B0 * BR + Math.sin(BR) * (B2 * Math.cos(BR) + B4 * MZ((Math.cos(BR)), 3) + B6 * MZ((Math.cos(BR)), 5) + B8 * MZ((Math.cos(BR)), 7)))

    var t = Math.tan(BR);
    var g = e2 * Math.cos(BR);
    var XR = s + MZ(lo, 2) / 2 * N * Math.sin(BR) * Math.cos(BR) + MZ(lo, 4) * N * Math.sin(BR) * MZ((Math.cos(BR)), 3) / 24 * (5 - MZ(t, 2) + 9 * MZ(g, 2) + 4 * MZ(g, 4)) + MZ(lo, 6) * N * Math.sin(BR) * MZ((Math.cos(BR)), 5) * (61 - 58 * MZ(t, 2) + MZ(t, 4)) / 720; 
    var YR = lo * N * Math.cos(BR) + MZ(lo, 3) * N / 6 * MZ((Math.cos(BR)), 3) * (1 - MZ(t, 2) + MZ(g, 2)) + MZ(lo, 5) * N / 120 * MZ((Math.cos(BR)), 5) * (5 - 18 * MZ(t, 2) + MZ(t, 4) + 14 * MZ(g, 2) - 58 * MZ(g, 2) * MZ(t, 2));
    mapX = YR + falseE;
    mapY = XR + falseN; 
    return [mapX, mapY]; 
}
function MZ(x, y) {
    var res = Math.pow(x, y);
    return res;
}
//度分秒转换成为度 
function DegreeConvertBack(dvalue){ 
    var du = dvalue.split("°")[0];  
    var fen = dvalue.split("°")[1].split("′")[0];   
    var miao = dvalue.split("°")[1].split("′")[1].split('″')[0];
    return Math.abs(du) + (Math.abs(fen)/60) + (Math.abs(miao)/3600);  
}
