
//海岸线动态修订管理
	var host = window.location.host;// 获取当前页面域名
	var pageurl = 'http://'+ host;
	var geoData = null;
require([
	"dojo/parser",
	"esri/map",
	"esri/layers/ArcGISTiledMapServiceLayer",
	"esri/layers/ArcGISDynamicMapServiceLayer",
	"esri/graphic",
	"esri/layers/GraphicsLayer",
	"esri/geometry/Extent",
	"esri/geometry/Point",
	"esri/symbols/PictureMarkerSymbol",
	"esri/InfoTemplate",
	"dojo/dom-construct", "esri/geometry/geometryEngine",
	//画图用
	"esri/toolbars/edit","esri/dijit/Popup", 
	"esri/toolbars/draw","esri/symbols/TextSymbol",
	"esri/symbols/Font",
	"esri/Color","esri/symbols/SimpleLineSymbol","esri/symbols/SimpleMarkerSymbol",
    "esri/symbols/SimpleFillSymbol"
	
],function(
	parser,Map,Tiled,ArcGISDynamicMapServiceLayer,
	Graphic,GraphicsLayer,Extent,Point,
	PictureMarkerSymbol,InfoTemplate,domConstruct,geometryEngine,
	//画图用
	Edit,Popup,Draw,TextSymbol,Font,Color,
	SimpleLineSymbol,SimpleMarkerSymbol,SimpleFillSymbol
){
	var tiled = new Tiled("http://31.16.1.101/arcgis/rest/services/shsw_JCDXT2016/MapServer");
	
	var yewuUrl = "http://31.16.1.101/arcgis/rest/services/shsw_HYJCXX/MapServer";
	var yewuLayers = new ArcGISDynamicMapServiceLayer(yewuUrl);
//	var visibleId = [2,12,13,14,15,16,36,37,38,39,40];
	var visibleId = [14];
	yewuLayers.setVisibleLayers(visibleId);
	
	var drawLayer = new GraphicsLayer();
	var	map = new Map("map", {
			logo: false,
			zoom: 2,
			maxZoom:7,
			extent: new Extent(yewuLayers.initialExtent),
			slider: false
		});
	map.addLayer(tiled); //底图
	map.addLayer(yewuLayers);
	map.addLayer(drawLayer);
	map.on("load",function(){		
		$('body').addClass('loaded');
        $('#loader-wrapper .load_title').remove();
	});
	/****
	 * yewulayer渲染
	 ***/
	addLine = function(){//修订
		editToolbar = new Edit(map);
		toolbar = new Draw(map);
		clearDrawLayer();
		endEdit();
		toolbar.activate(Draw.POLYLINE);
		toolbar.on("draw-end",showLine); 
	}
	getLineData = function(){//上传
		endEdit();
		var graphic = drawLayer.graphics[0];
		var geolength = getLength(graphic);
		var geoData = graphic.geometry.paths.toString();
		return[geolength,geoData];	
	}
   function endEdit(){
		editToolbar.deactivate();//编辑结束
   }
//	function showLine(evt){//画线
//		toolbar.deactivate();
//        map.showZoomSlider();
//        var geometry = evt.geometry;
//        var symbol = new SimpleLineSymbol(
//      			esri.symbol.SimpleLineSymbol.STYLE_SOLID,  // 样式,STYLE_DASH(破折号),STYLE_DASHDOT(点划线),STYLE_DASHDOTDOT,STYLE_DOT(点),STYLE_NULL,STYLE_SOLID(实线)
//                new dojo.Color([255,0,0]),  // 颜色  
//                3   // 像素  
//            );
//		var coastgra = new Graphic(geometry,symbol);
//		drawLayer.add(coastgra);
//		EditLine(coastgra);
//	}
	
//	function EditLine(graphic){//编辑线
//		editToolbar.activate(Edit.EDIT_VERTICES,graphic);
//	}
//	function getGeo(graphic){//json地理数据
//		var graphicStr=dojo.toJson(graphic.toJson());
//		return graphicStr;
//	}
	function getLength(graphic){//计算长度
		var length = geometryEngine.planarLength(graphic.geometry, "meters");
		return length;
	}
	
	var lineLayer = new GraphicsLayer();
	map.addLayer(lineLayer);
	showSingleLine = function(num,lineid){//控制checkbox选中线
		if(num == 0){//不显示这条线
			var gras = lineLayer.graphics;
			for(i = 0;i<gras.length;i++){
				if(gras[i].attributes.id == lineid){
					lineLayer.remove(gras[i]);
					break;
				}
			}
		}else{//显示该线
			var data = {"coastline.id":lineid};
			url = pageurl+'/hydg/coastline/cl_loadAnalyzeById.do';
		    $.ajax({
		        async: false,
		        type: 'post',
		        data: data,
		        url: url,
		        datatype: "json",
		        cache: false,
		        success: function(json) {
		    		result = JSON.parse(json);
		    		singleline = result.coastline;
		        }
		    });
		    
		    var coords = singleline.lineGeo;//一个点的记录（序号、纬度、经度）
		    var str = coords.charAt(coords.length-1);
		    coords = coords.split(';');
		    if(str == ";"){
		    	var colength = coords.length-1;
		    }else{
		    	var colength = coords.length;
		    }
	
			var paths = new Array();
			for(i = 0;i<colength;i++){
				var path = toXY(coords[i].split(',')[1],coords[i].split(',')[2]);
				paths.push(path);
			}
			
			var linejson={"geometry":{"paths":[paths],
				    "spatialReference":map.spatialReference}};
			var line = new Graphic(linejson);
			
			if(singleline.lineLength == ""){
				var lineLength = getLength(line);
				var data = {"coastlineU.lineLength" : lineLength,
						"coastlineU.type" : 1,
						"coastlineU.id" : singleline.id};
				UpdataLength(data);
			}
			
			var symbol = new SimpleLineSymbol(
	      			esri.symbol.SimpleLineSymbol.STYLE_SOLID,  // 样式,STYLE_DASH(破折号),STYLE_DASHDOT(点划线),STYLE_DASHDOTDOT,STYLE_DOT(点),STYLE_NULL,STYLE_SOLID(实线)
	                new dojo.Color([200,200,0]),  // 颜色  
	                5   // 像素  
	           );
			var attr = {"id":singleline.id,"lastupdatetime":singleline.lastupdatetime,
					"name":singleline.lineName,"person":singleline.lineUpdatePerson,
					"long":singleline.lineLength,
					"beizhu":singleline.lineUpdateReason,"time":singleline.lineUpdateTime};
			var template = new InfoTemplate("名称：${name}",
					"上传人：${person}<br/>修订时间：${time}" +
					"<br/>长度：${long}米<br/>备注:${beizhu}");
			line.setSymbol(symbol);
			line.setAttributes(attr);
			line.setInfoTemplate(template);
			lineLayer.add(line);	
		}
	}
	
	clearDrawLayer = function(){
		drawLayer.clear();
	}
});//reqire结束

function removeLine(lineid){
	var data = {"coastline.id":lineid};
	var url = pageurl+'/hydg/coastline/cl_removeAnalyzeById.do';
    $.ajax({
        async: false,
        type: 'post',
        url: url,
        data: data,
        datatype: "json",
        cache: false,
        success: function(json) {
	    	if(json == 1){
	    		alert("删除成功！");
	    	}
        }
    });
}
function UpdataLength(data){
	var url = pageurl+'/hydg/coastline/cl_editDefine.do';
    $.ajax({
        async: false,
        type: 'post',
        url: url,
        data: data,
        datatype: "json",
        cache: false,
        success: function(json) {
	    	if(json == 1){
	    		console.log("上传长度成功！");
	    	}
        }
    });
}
/****坐标计算*****/
function toXY(wd,jd){
	var Wd = DegreeConvertBack(wd);
	var Jd = DegreeConvertBack(jd);
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
    var BR = (Jd - W0) * PI / 180;			 
    var lo = (Wd - L0) * PI / 180;		 
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