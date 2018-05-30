//海底管线可视化
var host = window.location.host;// 获取当前页面域名
var pageurl = 'http://'+ host;
require([
    "dojo/parser",
    "esri/map",
    "esri/dijit/Scalebar",
    "esri/layers/ArcGISTiledMapServiceLayer",
    "esri/layers/ArcGISDynamicMapServiceLayer",
    "esri/graphic",
    "esri/layers/GraphicsLayer",
    "esri/geometry/Extent",
    "esri/geometry/Point",
    "esri/symbols/PictureMarkerSymbol",
    "esri/InfoTemplate",
    "esri/tasks/query", "esri/tasks/QueryTask",
    "esri/tasks/IdentifyTask", "esri/tasks/IdentifyParameters",
    "esri/symbols/SimpleLineSymbol",
    "esri/geometry/Polyline"
], function(
    parser, Map, ScaleBar, Tiled, ArcGISDynamicMapServiceLayer,
    Graphic, GraphicsLayer, Extent, Point,
    PictureMarkerSymbol, InfoTemplate,
    Query, QueryTask,
    IdentifyTask, IdentifyParameters,
    SimpleLineSymbol,Polyline
) {
    var tiled = new Tiled("http://31.16.1.101/arcgis/rest/services/shsw_JCDXT2016/MapServer");

    var yewuUrl = "http://31.16.1.101/arcgis/rest/services/shsw_HYJCXX/MapServer";
    var yewuLayers = new ArcGISDynamicMapServiceLayer(yewuUrl);
    var visibleId = [16, 36]; //海底管线、公共航道
    yewuLayers.setVisibleLayers(visibleId);
    
    var LineinfoLayer = new GraphicsLayer();
    var pipeLineLayer = new GraphicsLayer();
    var map = new Map("map", {
        logo: false,
        zoom: 1,
        maxZoom: 7,
        slider: false
    });
    var scaleBar = new ScaleBar({
        map: map,
        attachTo: "bottom-left",
        scalebarUnit: "metric"
    });
    map.addLayer(tiled); //底图
    map.on("load", function() {
//        var mapCenter = new Point(80000, -40000, map.spatialReference);
//        map.centerAt(mapCenter);
        $('body').addClass('loaded');
        $('#loader-wrapper .load_title').remove();
        map.addLayer(yewuLayers);
        map.addLayer(pipeLineLayer);
        map.addLayer(LineinfoLayer);
        searchLine();
    });
    map.on("Click", mapSearch);

    function mapSearch(evt) { //地图点击查询
        var identifyTask = new IdentifyTask(yewuUrl);
        var params = new IdentifyParameters();
        params.tolerance = 3;
        params.returnGeometry = true;
        params.layerIds = [16];
        params.layerOption = IdentifyParameters.LAYER_OPTION_ALL;
        params.width = map.width;
        params.height = map.height;
        params.geometry = evt.mapPoint;;
        params.mapExtent = map.extent;
        identifyTask.execute(params, showMap);
    }

    function showMap(res) { //点击显示信息
        if (res.length > 0) {
        	LineinfoLayer.clear();
            var result = res[0];
            var geo = result.feature.geometry;
            var attrs = result.feature.attributes;
            var symbol = new SimpleLineSymbol(
                esri.symbol.SimpleLineSymbol.STYLE_SOLID,
                new dojo.Color([200, 200, 0]),
                5
            );
            var attr = {
                "名称": attrs.名称,
                "LENGTH": attrs.LENGTH,
                "OBJECTID": attrs.OBJECTID,
                "OUTPUT84_": attrs.OUTPUT84_,
                "OUTPUT84_I": attrs.OUTPUT84_I,
                "光缆类别": attrs.光缆类别
            };
            var infoTemplate = new InfoTemplate("名称：${名称}",
                "OBJECTID：${OBJECTID}<br>长度：${LENGTH}米" +
                "<br>OUTPUT84_：${OUTPUT84_}<br>OUTPUT84_I:${OUTPUT84_I}<br>光缆类别:${光缆类别}");
            var line = new Graphic(geo, symbol, attr, infoTemplate);
            LineinfoLayer.add(line);
        }else{
        	LineinfoLayer.clear();
        }
    }
    doSearch = function() { //查询框查询
        var tj = $(".search-input").val();
        var queryTask = new QueryTask(yewuUrl + '/' + 16);
        var query = new Query();
        query.where = "名称 LIKE '%" + tj + "%'";
        query.outFields = ["*"];
        query.returnGeometry = true;
        queryTask.execute(query, showQuery);
    }

    function showQuery(res) { //显示查询结果
        $(".result-container").empty();
        if (!res.features.length) {
            alert("结果不存在");
        } else {
            var result = res.features;
            var table = document.createElement("table");
            table.style.whiteSpace = "nowrap";
            table.className = "tablelist";
            var thead = document.createElement("thead");
            var tbody = document.createElement("tbody");
            var tr = document.createElement("tr");
            $.each(res.features[1].attributes, function(key, val) {
                var th = document.createElement("th");
                th.innerHTML = key;
                th.style.padding = "1px 5px";
                tr.append(th);
            })
            $.each(res.features, function() {
                var tr = document.createElement("tr");
                tr.style.backgroundColor = "#fff";
                $.each(this.attributes, function(key, val) {
                    var td = document.createElement("td");
                    td.innerHTML = val;
                    tr.append(td);
                })
                tbody.append(tr);
            })
            thead.append(tr);
            table.append(thead, tbody);
            $(".result-container").append(table);
            $('.result-container').fadeIn(100);
        }
    }

    function showLine(geo) { //显示所选line,infoTemplate可为null
        var symbol = new SimpleLineSymbol(
            esri.symbol.SimpleLineSymbol.STYLE_SOLID,
            new dojo.Color([200, 200, 0]),
            5
        );
        var line = new Graphic(geo, symbol);
        LineinfoLayer.add(line);
    }
/*********查询数据库显示************/
    var bls = ["SMW3","APCN2S3","APCN2S4","APG S3","TPES1S","TPES4"];
    function searchLine(){
    	for(var i = 0;i<bls.length;i++){
    		var type = bls[i];
    		bldata(type);
    	}
    }
    function bldata(type){
    	var data = {type:type};
    	$.ajax({
            async: false,
            type: 'post',
            data: data,
            url: pageurl+'/hydg/sca/sca_loadScaByType.do',
            datatype: "json",
            cache: false,
            success: function(json) {
    			info = JSON.parse(json);
    			showLine(info.result,type);
            }
        });
    }
    function showLine(data,type){
    	"APCN2S4","APG S3","TPES1S","TPES4"
    	switch(type){
	    	case "SMW3":
	    		var name = "欧亚光缆（SMW3 ）";
	    		var time = "1999年";
	    		break;
	    	case "APCN2S3":
	    		var name = "亚太光缆S3（APCN2S3）";
	    		var time = "2001年";
	    		break;
	    	case "APCN2S4":
	    		var name = "亚太光缆S4（APCN2S4）";
	    		var time = "2001年";
	    		break;
	    	case "APG S3":
	    		var name = "APG S3";
	    		var time = "2016年";
	    		break;
	    	case "TPES1S":
	    		var name = "TPES1S";
	    		var time = "2008年";
	    		break;
	    	case "TPES4":
	    		var name = "TPES4";
	    		var time = "2016年";
	    		break;
    	}
    	var pipeline = new Graphic();
    	var path = [];
    	for(var i = 0;i<data.length;i++){
    		var xx = data[i].x;
    		var yy = data[i].y;
    		var con = [xx,yy];
    		path.push(con);
    	}
		var symbol = new SimpleLineSymbol(
      			esri.symbol.SimpleLineSymbol.STYLE_SOLID,  // 样式,STYLE_DASH(破折号),STYLE_DASHDOT(点划线),STYLE_DASHDOTDOT,STYLE_DOT(点),STYLE_NULL,STYLE_SOLID(实线)
                new dojo.Color([0,200,0]),  // 颜色  
                3   // 像素  
           );
		var attr = {"name":name,"time":time,"owner":"电信公司"};
		var template = new InfoTemplate("名称：${name}",
				"建设时间：${time}<br/>所有者：${owner}");
		var linejson={"geometry":{"paths":[path],
			    "spatialReference":map.spatialReference}};
		var pipeline = new Graphic(linejson);
		pipeline.setSymbol(symbol);
		pipeline.setAttributes(attr);
		pipeline.setInfoTemplate(template);
    	pipeLineLayer.add(pipeline);
    }
});
function math(Aa, Bb){
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
function DegreeConvertBack(dvalue)  
{ ///<summary>度分秒转换成为度</summary>  
    var du = dvalue.split("°")[0];  
    var fen = dvalue.split("°")[1].split("'")[0];   

    return Math.abs(du) + (Math.abs(fen)/60);  
}
/**************上传xy数据****************/
function newData(type){
	var data = {type:type};
	$.ajax({
        async: false,
        type: 'post',
        data: data,
        url: pageurl+'/hydg/sca/sca_loadScaByType.do',
        datatype: "json",
        cache: false,
        success: function(json) {
			info = JSON.parse(json);
			upLoadXY(info.result);
        }
    });
}
function upLoadXY(data){
	var path = [];
	for(var i = 0;i<data.length;i++){
		var Aa = DegreeConvertBack(data[i].posLon);
		var Bb = DegreeConvertBack(data[i].posLat);
		var con = math(Aa,Bb);
		var dd = [data[i].id,con];
		path.push(dd);
	}
	repath = path.toString();
	var data = {coordinateJson:repath};
	
	$.ajax({	
		url : pageurl+'/hydg/sca/sca_saveXyCoordinate.do', 
		data : data,
		type : "post",
		async : false,
		success : function(result){
		}
	});
	console.log(data);
}
