//船舶监控信息可视化
var host = window.location.host;// 获取当前页面域名
var pageurl = 'http://'+ host;
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
    //画图用
    "esri/toolbars/draw", "esri/symbols/TextSymbol",
    "esri/symbols/Font",
    "esri/Color", "esri/symbols/SimpleLineSymbol", "esri/symbols/SimpleMarkerSymbol",
    "esri/symbols/SimpleFillSymbol",
    
    "esri/dijit/Scalebar",
    "esri/geometry/geometryEngine"
], function(
    parser, Map, Tiled, ArcGISDynamicMapServiceLayer,
    Graphic, GraphicsLayer, Extent, Point,
    PictureMarkerSymbol, InfoTemplate,
    //画图用
    Draw, TextSymbol, Font, Color, SimpleLineSymbol, SimpleMarkerSymbol, SimpleFillSymbol,
    
    Scalebar,
    geometryEngine
) {
    var tiled = new Tiled("http://31.16.1.101/arcgis/rest/services/shsw_JCDXT2016/MapServer");

    var yewuUrl = "http://31.16.1.101/arcgis/rest/services/shsw_HYJCXX/MapServer";
    var yewuLayers = new ArcGISDynamicMapServiceLayer(yewuUrl);
    var visibleId = [2, 12, 13, 14, 15, 16, 36, 37, 38, 39, 40];
    yewuLayers.setVisibleLayers(visibleId);

    var shipLayer = new GraphicsLayer();
    var map = new Map("map", {
        logo: false,
        zoom: 2,
        maxZoom: 9,
        slider: false
    });
    map.addLayer(tiled); //底图
    map.addLayer(yewuLayers);
    map.addLayer(shipLayer);

    map.on("load", function() {
        var mapCenter = new Point(50000, -30000, map.spatialReference);
        map.centerAt(mapCenter);
        $('body').addClass('loaded');
        $('#loader-wrapper .load_title').remove();
    });
    /*
     * mmsi查询
     */
    doSearch = function() {
        shipLayer.clear();
        var mmsi = $(".search-input").val();
        var data = {mmsi: mmsi};
        var shipos = getInfo(1, data); //位置
        dataShipos(shipos);
    }
  /**
   **二次查询单船历史轨迹
   **/
    reHistory = function(btn) { 
        var mmsi = btn.value;
        var data = {mmsi: mmsi, 
        			startDt: "1516809600",
        			endDt: "1516955198",
        			compress: 0 };
        var historys = getInfo(4, data);
        showHistory(historys);
    }

    function showHistory(historys) { //显示历史轨迹
        console.log(historys);
    }
    /*
     * 
     *画图查询 
     * 
     */
    var toolbar = new Draw(map);
    queryNow = function(btn) { //区域实时
    	toolbar.deactivate();
        drawToquery(btn.value);
        querytype = "Now";
    }
    queryHistory = function(btn) { //区域历史
    	toolbar.deactivate();
        drawToquery(btn.value);
        querytype = "History";
    }
  /*
   *
   * 圈选查询
   * */
    function drawToquery(drawtype) {
        shipLayer.clear();
        toolbar = new Draw(map);
        toolbar.on("draw-end", addToMap);//画图结束
        if (drawtype == "EXTENT") {
            toolbar.activate(Draw.EXTENT);
        } else {
            toolbar.activate(Draw.CIRCLE);
        }
    };

    function addToMap(evt) { //显示画图结果
        toolbar.deactivate();
        map.showZoomSlider();
        var geometry = evt.geometry;
        symbol = new SimpleLineSymbol(
            esri.symbol.SimpleLineSymbol.STYLE_DASH, // 样式,STYLE_DASH(破折号),STYLE_DASHDOT(点划线),STYLE_DASHDOTDOT,STYLE_DOT(点),STYLE_NULL,STYLE_SOLID(实线)
            new dojo.Color([0, 255, 0]), // 颜色  
            3 // 像素  
        );
        var shipline = new Graphic(geometry, symbol);
        shipLayer.add(shipline);
        drawQdata(geometry);//计算
    }
/***
 * 查询所用地理数据
 * *****/
    function drawQdata(geometry) {
        var mathtype = "toLB"; //xy转gps
        //step1：数据计算
        if (geometry.type == "extent") {
            var pRright = mathCoord(mathtype, geometry.xmax, geometry.ymax);
            var pLeft = mathCoord(mathtype, geometry.xmin, geometry.ymin);
            querygeo = [pRright, pLeft];
        } else {
            var pCenter = mathCoord(mathtype, geometry.xmin, geometry.ymax);
            querygeo = pCenter;
        }
        //step2：执行区域查询
        if (querytype == "Now") { //实时位置查询
            if (geometry.type == "extent") { //矩形
                var data = {
                    leftDown: querygeo[1][0] + "," + querygeo[1][1],
                    rightTop: querygeo[0][0] + "," + querygeo[0][1]
                }; //{lb:"116.403401,38.377243",rt:"119.919026,39.583515"}
            } else { //圆形
            	var center = geometry.getCentroid();
            	var centerBL = mathCoord("toBL",center.x,center.y).toString();
            	var ring = new Point(geometry.rings[0][0],geometry.rings[0][1],map.spatialReference);
            	var radius = geometryEngine.distance(center, ring, "nautical-miles");
            	console.log(radius);
                var data = { circleRadius: centerBL + "," + radius};
            }
            var allship = getInfo(5, data);
            console.log(allship);
            dataShipos(allship); //处理位置结果
        } else { //历史轨迹查询
            if (geometry.type == "extent") { //矩形
                var data = {
                    startdt: "1444379330461",
                    enddt: "1444379930461",
                    area: querygeo[0][0] + "," + querygeo[0][1] + "|" +
                        querygeo[1][0] + "," + querygeo[0][1] + "|" +
                        querygeo[1][0] + "," + querygeo[1][1] + "|" +
                        querygeo[0][0] + "," + querygeo[1][1],
                    compress: "0"
                };
            } else { //圆形
                var data = { startdt: "1444379330461", enddt: "1444379930461", circle: "117.72,38.99,5", compress: "0" };
            }
            //					var lineInfo = getInfo(6,data);
            //					showLineHistory(lineInfo);
        }
    }

    function dataShipos(allship) {
	      for (var i = 0; i < allship.length; i++) {
	    	  var shipinfo = allship[i];
              var mathtype = "toXL";
              var mapxy = mathCoord(mathtype, shipinfo.longitude, shipinfo.latitude);
              var pos = new Point(mapxy[0], mapxy[1], map.spatialReference);
              var sms = new PictureMarkerSymbol('../../../../images/ship0.png', 50, 50);
              var attr = {mmsi:shipinfo.mmsi};
              var shipgra = new Graphic(pos,sms,attr,null);
              shipLayer.add(shipgra);
	      }
	      shipLayer.on("click",function(evt){
	    	  showShipInfo(evt.graphic);
	      })
    }
    /*
     * 在地图上显示船的位置（需要位置、档案、静态）
     */
    function showShipInfo(graphic){
    	var data = graphic.attributes;
    	var shipfile = getInfo(2, data)[0];//船舶档案
    	var destina = getInfo(3, data)[0];//静态数据
    	var attr = {
    			"MMSI": graphic.attributes.mmsi
    	}
    	if(shipfile != null){
    		var filechilds = {
    				"LocalName": shipfile.LocalName,
                    "InlandShipMark": shipfile.InlandShipMark,
                    "IMONO": shipfile.IMONO,
                    "Callsign": shipfile.Callsign,
                    "LOA": shipfile.LOA,
                    "BM": shipfile.BM,
                    "Depth": shipfile.Depth,
                    "BuildDate": shipfile.BuildDate,
                    "ClassificationCode": shipfile.ClassificationCode,
                    "Owner": shipfile.Owner,
                    "Operator": shipfile.Operator,
    		}
    		attr = $.extend(attr,filechilds);
    	}
    	if(destina != null){
    		var deschilds = {
    				"draft": destina.draft,
    				"Destination": destina.dest,
                    "ETA": destina.receivetime,
                    "Name":destina.Name
    		}
    		attr = $.extend(attr,deschilds);
    	}
    	if(shipfile != null && destina != null){
    		var infoTemplate = new InfoTemplate("船名： ${LocalName}",
    				"船舶性质：${InlandShipMark}<br>IMO号码: ${IMONO}" +
                    "<br>呼号: ${Callsign}<br>吃水:${draft}分米" +
                    "<br>船舶长度:${LOA}米<br>船舶型宽:${BM}米<br>船舶型深:${Depth}米" +
                    "<br>建成日期:${BuildDate}<br>船级社:${ClassificationCode}" +
                    "<br>船舶所有人:${Owner}<br>船舶经营人:${Operator}" +
                    "<br>下一个目的港:${Destination}<br>预计到港时间:${ETA}" +
                    "<br><button value=${MMSI} onclick='reHistory(this)'>历史轨迹</button>");
    	}
    	if(shipfile != null && destina == null){
    		var infoTemplate = new InfoTemplate("船名： ${LocalName}",
                    "船舶性质：${InlandShipMark}<br>IMO号码: ${IMONO}" +
                    "<br>呼号: ${Callsign}" +
                    "<br>船舶长度:${LOA}米<br>船舶型宽:${BM}米<br>船舶型深:${Depth}米" +
                    "<br>建成日期:${BuildDate}<br>船级社:${ClassificationCode}" +
                    "<br>船舶所有人:${Owner}<br>船舶经营人:${Operator}" +
                    "<br><button value=${MMSI} onclick='reHistory(this)'>历史轨迹</button>");
    	}
    	if(shipfile == null && destina != null){
            var infoTemplate = new InfoTemplate("船名： ${Name}",
                "吃水:${draft}分米" +
                "<br>下一个目的港:${Destination}<br>预计到港时间:${ETA}" +
                "<br><button value=${MMSI} onclick='reHistory(this)'>历史轨迹</button>");
            graphic.setAttributes(attr);
            graphic.setInfoTemplate(infoTemplate);
    	}
    }
});
/*
 * 查询方法
 */
function getInfo(urlNum, data) {
//	console.log(data);
    var url = getURL(urlNum);
    $.ajax({
        async: false,
        type: 'post',
        data: data,
        url: url,
        datatype: "json",
        cache: false,
        success: function(json) {
            infos = eval(json);
        }
    });
    return infos;
}
/*****
 * 获取查询url
 * */
function getURL(urlNum) {
    switch (urlNum) {
        case 1: //实时位置
            url = pageurl+'/hydg/ais/ais_shiPosition.do';
            break;
        case 2: //船舶档案
            url = pageurl+'/hydg/ais/ais_shipFile.do';
            break;
        case 3: //静态数据
            url = pageurl+'/hydg/ais/ais_aisStaticRecordGis.do';
            break;
        case 4: //单船历史轨迹
            url = pageurl+'/hydg/ais/ais_historyLocus.do';
            break;
        case 5: //区域实时位置
            url = pageurl+'/hydg/ais/ais_areaQuery.do';
//        	url = 'http://localhost:8080/hydg/ais/ais_areaQuery.do';
            break;
        case 6: //区域历史轨迹
            url = '';
            break;
    }
    return url;
}

/*
 * 
 * 
 * 坐标计算
 * 
 * */
function mathCoord(mathtype, Aa, Bb) {
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
    if (mathtype == "toXL") {
        var querygeo = LBgetXY(Aa, Bb);
    } else {
        var querygeo = XYgetLB(Aa, Bb);
    }
    return querygeo;  
    /*
     * 输入参数分别是：经度、纬度
     */
     
    function LBgetXY(J, W) {  //'给出经纬度坐标，转换为高克投影坐标
        var BR = (W - W0) * PI / 180; //纬度弧长				 
        var lo = (J - L0) * PI / 180; //经差弧度				 
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
    /*
     * 输入参数分别为：X、Y
     */
     
    function XYgetLB(X, Y) {  //'给出高克投影坐标，转换为经纬度坐标
        var El1 = (1 - Math.sqrt(1 - MZ(e1, 2))) / (1 + Math.sqrt(1 - MZ(e1, 2)));
        var Mf = (Y - falseN) / k0; //真实坐标值

        var Q = Mf / (a * (1 - MZ(e1, 2) / 4 - 3 * MZ(e1, 4) / 64 - 5 * MZ(e1, 6) / 256)); //角度
        Bf = Q + (3 * El1 / 2 - 27 * MZ(El1, 3) / 32) * Math.sin(2 * Q) + (21 * MZ(El1, 2) / 16 - 55 * MZ(El1, 4) / 32) * Math.sin(4 * Q) + (151 * MZ(El1, 3) / 96) * Math.sin(6 * Q) + 1097 / 512 * MZ(El1, 4) * Math.sin(8 * Q);
        Rf = a * (1 - MZ(e1, 2)) / Math.sqrt(MZ((1 - MZ((e1 * Math.sin(Bf)), 2)), 3));
        Nf = a / Math.sqrt(1 - MZ((e1 * Math.sin(Bf)), 2)); //卯酉圈曲率半径
        Tf = MZ((Math.tan(Bf)), 2);
        D = (X - falseE) / (k0 * Nf); 
        Cf = MZ(e2, 2) * MZ((Math.cos(Bf)), 2);

        var B = Bf - Nf * Math.tan(Bf) / Rf * (MZ(D, 2) / 2 - (5 + 3 * Tf + 10 * Cf - 9 * Tf * Cf - 4 * MZ(Cf, 2) - 9 * MZ(e2, 2)) * MZ(D, 4) / 24 + (61 + 90 * Tf + 45 * MZ(Tf, 2) - 256 * MZ(e2, 2) - 3 * MZ(Cf, 2)) * MZ(D, 6) / 720);
        var L = L0 * PI / 180 + 1 / Math.cos(Bf) * (D - (1 + 2 * Tf + Cf) * MZ(D, 3) / 6 + (5 - 2 * Cf + 28 * Tf - 3 * MZ(Cf, 2) + 8 * MZ(e2, 2) + 24 * MZ(Tf, 2)) * MZ(D, 5) / 120);
        var Bangle = B * 180 / PI;
        var Langle = L * 180 / PI;   
        var mapL = Langle + 0.01; //RW * 180 / PI;				 
        var mapB = Bangle + W0 + 0.004; //RJ * 180 / PI;				 
        return [mapL, mapB];
    }

    function MZ(x, y) {
        var res = Math.pow(x, y);
        return res;
    }
}