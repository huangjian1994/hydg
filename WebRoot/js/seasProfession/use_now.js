var host = window.location.host;// 获取当前页面域名
var pageurl = 'http://'+ host;
require([
	"esri/map","esri/geometry/Extent",
	"esri/layers/ArcGISTiledMapServiceLayer",
	"esri/geometry/Polygon",
	"esri/geometry/Point","esri/graphic","esri/layers/GraphicsLayer",
	"esri/symbols/SimpleFillSymbol",
	"esri/Color","esri/InfoTemplate"
],function(
	Map,Extent,Tiled,Polygon,
	Point,Graphic,GraphicsLayer,
	SimpleFillSymbol,Color,InfoTemplate
){
	var infos = null;
	var tiled = new Tiled("http://31.16.1.101/arcgis/rest/services/shsw_JCDXT2016/MapServer");
	var polyLayer = new GraphicsLayer();
	//用海方式地图
	var	map = new Map("map", {
		logo: false,
		zoom: 6,
		maxZoom:7,
		slider: false,
		spatialReference:tiled.spatialReference
	});
	map.addLayer(tiled); //底图
	map.addLayer(polyLayer);
	map.on("load",function(){
		var center = new Point(-10000,-55000,map.spatialReference);
		map.centerAt(center);
		searchData();
	})
	//查询用海区域坐标
	function searchData(){
//		var xmID = document.getElementById("xmID").value;
//		var zsID = document.getElementById("zsID").value;
		$.ajax({
			async: false,
	        type: 'post',
	        url: pageurl+'/hydg/business/business_getYhxmJzd.do',
//	        data: "xmID="+xmID+"&zsID="+zsID,
	        datatype: "json",
	        cache: false,
	        success: function(json) {
	            infos = eval(json);
//	            console.log(infos);
	            analysisData(infos);
	        }
		})
	}
	//整理查询得到的数据
	function analysisData(infos){
		var rings = [];
		var opoint = toXY(infos[0].jd,infos[0].wd);
		rings.push(opoint);
		for(var i = 1;i<infos.length;i++){
			if(infos[i].xmid == infos[i-1].xmid && i < infos.length-1){
				var pos = toXY(infos[i].jd,infos[i].wd);
				rings.push(pos);
			}else if(i < infos.length-1){
				var xmid = infos[i-1].xmid;
				var zsid = infos[i-1].zsid;
				rings.push(opoint);
				getDetail(rings,xmid);
//				showPolygen(rings,xmid,zsid);
				//按项目将数据分类，项目不同时，整理好的数据在地图上显示，新数据从0整理
				rings = [];
				opoint = toXY(infos[i].jd,infos[i].wd);
				rings.push(opoint);
			}else{
				var xmid = infos[i].xmid;
				var zsid = infos[i].zsid;
				rings.push(opoint);
				getDetail(rings,xmid);
//				showPolygen(rings,xmid);
			}
		}
	}
	//获取用海项目详情
	function getDetail(rings,xmid){
		$.ajax({		  		
			type: "post",
			dataType:"json",
			url: pageurl+'/hydg/business/business_getYhxmDetail.do',
			data: "xmID="+xmid,
			success: function(d){
//				console.log(d);
				showPolygen(rings,xmid,d);
			}
		});
	}
	//在地图上显示各个项目
	function showPolygen(rings,xmid,detail){
		var polygon = new Polygon();
		polygon.addRing(rings);
		var symbol = new SimpleFillSymbol();
		var attr = {xmID:xmid,
				Name:detail[0][1],
				Position:detail[0][2],
				Area:detail[0][3]+detail[0][4],
				Level:detail[0][5],
				acceptDate:detail[0][6],
				approveDate:detail[0][7],
				Owner:detail[0][8]};
		var infoTemplate = new InfoTemplate("用海项目信息",
								"用海项目名称:${Name}<br/>项目位置:${Position}"+
								"<br/>用海总面积:${Area}<br/>海域等别:${Level}"+
								"<br/>受理日期:${acceptDate}<br/>用海批准日期:${approveDate}"+
								"<br/>海域使用权人:${Owner}"+
								"<br><button value=${xmID} onclick='showDetail(this)'>详情</button>");
		var graphic = new Graphic(polygon,symbol,attr,infoTemplate);
		polyLayer.add(graphic);
		//展示详情页面
		showDetail = function(btn){
//			var xmID = "xmID="+btn.value;
//			document.getElementById("xmID").value = btn.value;
			document.myForm.action = pageurl+'/hydg/sbdcpt/sbdcpt_fetchYhxmDetaile.do?xmID='+btn.value;
			document.myForm.target = "_blank";
			document.myForm.submit();
		}
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
})