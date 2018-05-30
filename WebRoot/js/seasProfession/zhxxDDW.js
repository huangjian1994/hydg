//用海项目信息管理：地图展示
var host = window.location.host;// 获取当前页面域名
var pageurl = 'http://'+ host;
require([
	"esri/map",
	"esri/layers/ArcGISTiledMapServiceLayer",
	"esri/geometry/Polygon",
	"esri/geometry/Point","esri/graphic","esri/layers/GraphicsLayer",
	"esri/symbols/SimpleFillSymbol",
	"esri/Color"
],function(
	Map,Tiled,Polygon,
	Point,Graphic,GraphicsLayer,
	SimpleFillSymbol,Color
){
	var infos = null;
	var tiled = new Tiled("http://31.16.1.101/arcgis/rest/services/shsw_JCDXT2016/MapServer");
	var polyLayer = new GraphicsLayer();
	//用海方式地图
	var	map = new Map("mapDW", {
		logo: false,
		zoom: 4,
		maxZoom:7,
		slider: false,
		spatialReference:tiled.spatialReference
	});
	map.addLayer(tiled); //底图
	map.addLayer(polyLayer);
	map.on("load",function(){
		searchData();
	})
	function searchData(){//查询用海区域坐标
		var xmID = document.getElementById("xmID").value;
		var zsID = document.getElementById("zsID").value;
		$.ajax({
			async: false,
	        type: 'post',
	        url: pageurl+'/hydg/business/business_getYhfsJzd.do',
	        data: "xmID="+xmID+"&zsID="+zsID,
	        datatype: "json",
	        cache: false,
	        success: function(json) {
	            infos = eval(json);
//	            console.log(infos);
	            showPolygen(infos);
	        }
		})
	}
	function showPolygen(infos){
		var rings = [];
		for(var i = 0;i < infos.length;i++){
			var pos = toXY(infos[i].jd,infos[i].wd);
			if(i == 0){
				var endpos = pos;
			}
			rings.push(pos);
		}
		rings.push(endpos);
		var polygon = new Polygon();
		polygon.addRing(rings);
		var symbol = new SimpleFillSymbol();
		var graphic = new Graphic(polygon,symbol,null,null);
		polyLayer.add(graphic);
		var ext = polygon.getExtent();
		ext.spatialReference = tiled.spatialReference;
		map.setExtent(ext.expand(4));
//		console.log(ext);
	}
	function toXY(jd, wd){
		var Aa = DegreeConvertBack(jd);
		var Bb = DegreeConvertBack(wd);
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
	reloadDWMap = function(){
		polyLayer.clean();
		searchData();
//		console.log(2);
	}
})
