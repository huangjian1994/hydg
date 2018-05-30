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
    "esri/geometry/Point","esri/graphic","esri/layers/GraphicsLayer"
],function(
	Map,Extent,
	Tiled,ArcGISDynamicMapServiceLayer,
	BufferParameters,GeometryService,
    Query, QueryTask,
    IdentifyTask, IdentifyParameters,
    SimpleLineSymbol,SimpleFillSymbol,Color,
    PictureMarkerSymbol,
    Point,Graphic,GraphicsLayer
){
//	esriConfig.defaults.io.proxyUrl = "http://localhost/DotNet/proxy.ashx";
//	esri.config.defaults.io.corsDetection=false;
//	esri.config.defaults.io._processedCorsServers["http://31.16.1.101/arcgis/rest/services"]=1;
	
	var tiled = new Tiled("http://31.16.1.101/arcgis/rest/services/shsw_JCDXT2016/MapServer");
    var yewuUrl = "http://31.16.1.101/arcgis/rest/services/shsw_HYJCXX/MapServer";   
	var	map = new Map("map", {
		logo: false,
		zoom: 0,
		maxZoom:7,
		slider: false
	});
	map.addLayer(tiled); //底图
    var drawLayer = new GraphicsLayer();
    map.addLayer(drawLayer);//海底管线图层
    var bufferLayer = new GraphicsLayer();
    map.addLayer(bufferLayer);//buffer图层
    var shipLayer = new GraphicsLayer();
    map.addLayer(shipLayer);//ship图层
    /*********加载金山岛视频点***********/
    loadPoint();
    function loadPoint(){
        var symbol = new PictureMarkerSymbol('../../../../images/video.png', 50, 50);
        //大金山岛1
        var point1 = new Point(-4447.367940562527,-60446.668133655985,map.spatialReference);
        var attr1 = {num:'1000056$1$0$0'};
        var graphic1 = new Graphic(point1,symbol,attr1,null);
        graLayer.add(graphic1);
        //大金山岛2
        var point2 = new Point(-4518.805583437813,-60269.39694578027,map.spatialReference);
        var attr2 = {num:'1000055$1$0$0'};
        var graphic2 = new Graphic(point2,symbol,attr2,null);
        graLayer.add(graphic2);
    }


	tiled.on("load",function(){		
		$('body').addClass('loaded');
        $('#loader-wrapper .load_title').remove();
        loadTiaoJ();
	});
/*********加载初始预警条件**********/
    var geoserver = new GeometryService("http://31.16.1.101/arcgis/rest/services/Utilities/Geometry/GeometryServer");
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
                gxyjtj = infos[0].gxyjtjEntities;
                var snum = 0;
                analysisTJ(snum);
            }
        });
    }
  //逐条分析条件
    function analysisTJ(snum){
    	if(snum <= 27){
    		var pipeinfo = gxyjtj[snum];
    		loadData(pipeinfo,snum);
    	}
    	if(snum == 28){
    		searchShip();//管线加载完成查询船舶
    	}
    }
    function loadData(pipeinfo,snum){
    	var piplineid = pipeinfo.piplineid;
		var sqlid = pipeinfo.id;
		var distance = pipeinfo.distance;
    	//按管线piplineid查询
    	searchLine();  
    	function searchLine(){
        	var queryTask = new QueryTask(yewuUrl+"/16");
            var query = new Query();
            query.where = "OBJECTID =" + piplineid;
            query.outFields = ["*"];
            query.returnGeometry = true;
            queryTask.execute(query,function(res){
            	if(res.features.length > 0){
            		showPipe(res.features[0]);
            	}
            });
    	}
    	//查询有结果则展示管线
		function showPipe(feature){
			var symbol = new SimpleLineSymbol(
	                esri.symbol.SimpleLineSymbol.STYLE_DASHDOT,
	                new dojo.Color([0, 0, 0]),
	                2
	            );
	    	var geo = feature.geometry;
	    	var attr = $.extend(feature.attributes,pipeinfo);
	    	var linegra = new Graphic(geo,symbol,attr,null);
	    	map.graphics.add(linegra);
	    	loadMenu(feature);//填充menu
	    	lineBuffer(feature,distance);
		}
		//根据查询到的管线信息填充menu
        function loadMenu(feature){
        	var listObj = feature.attributes;
        	var linegeo = feature.geometry;
        	var li = document.createElement("li");
        	$(li).attr("objId",listObj.OBJECTID);
        	$(li).attr("name",listObj.名称);
        	$(li).attr("sqlid",sqlid);
        	//获取 OBJECTID
        	li.onclick = function(){
                $(".seabedSet").show();
                $("#object").val($(this).attr("objId"));
        		$(".menuList li").removeClass("active");
        		$(this).addClass("active");
        		listId = $(this).attr("objId");
        		listName = $(this).attr("name");
        		listSqlid = $(this).attr("sqlid");
        		selectLine(linegeo);//选择管线
        	}
        	var a = document.createElement("a");
        	a.herf = "#";
        	a.innerHTML = listObj.名称;        	
        	li.appendChild(a);       	
        	$(".menuList").append(li);
        }
        //生成buffer参数params
    	function lineBuffer(feature,distance){
    		var buffergeo = feature.geometry;
        	var params = new BufferParameters();
        	params.geometries = [buffergeo];
        	params.distances = [distance];
        	params.outSpatialReference = map.spatialReference;
        	params.unit = GeometryService.UNIT_METER;
        	if(snum == 0){
        		setTimeout(function(){
        			doBuffer(params,feature);
        		},1000)
        	}else{
        		doBuffer(params,feature);
        	}
    	}
    	//执行buffer
    	function doBuffer(params,feature){
        	geoserver.buffer(params, function(results){
        		showBuffer(results,feature);
        		snum = snum + 1;
        		analysisTJ(snum);
        	});
    	}
    	//展示缓冲区
    	function showBuffer(res,feature){
 	        var symbol = new SimpleFillSymbol(
 	                SimpleFillSymbol.STYLE_SOLID,
 	                new SimpleLineSymbol(
 	                  SimpleLineSymbol.STYLE_SOLID,
 	                  new Color([255,0,0,0.65]),
 	                  0.5
 	                ),
 	                new Color([255,0,0,0.35])
 	              );
 	        var geometry = res[0];
 	        var attr = feature.attributes;
 	        var buffers = new Graphic(geometry,symbol,attr,null);
 	        bufferLayer.add(buffers);
 	    }
    }
  //展示列表选择的管线
    function selectLine(linegeo){
    	drawLayer.clear();
    	var symbol = new SimpleLineSymbol(
                esri.symbol.SimpleLineSymbol.STYLE_SOLID,
                new dojo.Color([0, 0, 255]),
                5
            );
    	var line = linegeo.getExtent();
        map.setExtent(line.expand(1));
        var selectgra = new Graphic(linegeo,symbol,null,null);
        drawLayer.add(selectgra);
    }
/*******修改缓冲区条件*********/
    makeChange = function(data){
    	changeBuffer(data);
    	changeData(data);
    }
    function changeData(data){
        $.ajax({
            async: false,
            type: 'post',
            data: data,
            url: pageurl + '/hydg/pip/pip_updateYjtj.do',
            datatype: "json",
            cache: false,
            success: function() {
        		alert("ok!!!");
            }
        });
    }
    function changeBuffer(data){//修改数值后改变地图显示
    	console.log(data);
    }
    
/*******查询船舶并判断是否预警********/
//	setInterval(function() {
    //  searchShip();
//}, 3000);
    function searchShip(){//查询AIS船舶位置
    	$.ajax({
            async: false,
            type: 'post',
            data: {leftDown:"122.46928635402679,31.258482969685343",
    			rightTop:"122.978342362726,31.65675566741944"},		
            url: pageurl+'/hydg/ais/ais_areaQuery.do',
            datatype: "json",
            cache: false,
            success: function(json) {
    			var allship = eval(json);
    			console.log(allship);
                analysisShip(allship);
            }
        });
    }
    function analysisShip(allship){
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
        	saveAIScb(linename,shipgra,linename);
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
