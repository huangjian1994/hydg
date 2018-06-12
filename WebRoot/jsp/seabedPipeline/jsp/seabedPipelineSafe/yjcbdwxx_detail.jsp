<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>预警船舶详细信息</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="http://localhost/arcgis_js_v316_sdk/arcgis_js_api/library/3.16/3.16/dijit/themes/tundra/tundra.css" />
	    <link rel="stylesheet" type="text/css" href="http://localhost/arcgis_js_v316_sdk/arcgis_js_api/library/3.16/3.16/esri/css/esri.css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
		<script type="text/Javascript" src="http://localhost/arcgis_js_v316_sdk/arcgis_js_api/library/3.16/3.16/init.js"></script>
		<style type="text/css">  
	       #extra {  
	            float: left;
	            border: 1px solid #000;  
	            background-color: #2d7cd4;  
	            top : 40px;
	            left : 40px;
	            position : absolute;
	            width : 600px; 
	            height : 360px;
	            z-index : 100;
	        } 
	        #top {  
	        	height : 5%;
	            background-color: #2d7cd4;  
	            color: #999; 
	        }
	        #DWmap {  
	        	height : 95%;
	        	z-index : 999
	        }  
		</style>  
	</head>
	<script>
	    var jd = ${dtjd};
	    var wd = ${dtwd};
        //返回	
        function goBack(){
            document.myForm.action="<%=basePath%>/pip/pip_fetchWgcb.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }

		//地图定位
		function showShip(){
			var exdiv = document.createElement("div");
			var divattr = document.createAttribute("id");  
    		divattr.value = "extra";
    		exdiv.setAttributeNode(divattr);
    		
    		var topdiv = document.createElement("div");
			var topattr = document.createAttribute("id");
			topattr.value = "top"; 
			topdiv.setAttributeNode(topattr); 
    		exdiv.append(topdiv);
    		topdiv.onclick = function(){
    			exdiv.remove();
    		}
    		
    		var mapdiv = document.createElement("div");
			var mapattr = document.createAttribute("id");
			mapattr.value = "DWmap"; 
			mapdiv.setAttributeNode(mapattr); 
    		exdiv.append(mapdiv);
    		
    		var formbody = document.getElementsByTagName("body");
    		formbody[0].append(exdiv);
    		
    		
    		var host = window.location.host;// 获取当前页面域名
			var pageurl = 'http://'+ host;	
    		var mmsi = document.getElementById("mmsivalue").outerText;

    		//查询船只
			require([
	            "esri/map","esri/layers/ArcGISTiledMapServiceLayer",
			    "esri/layers/ArcGISDynamicMapServiceLayer",
				"esri/geometry/Point","esri/graphic","esri/layers/GraphicsLayer",
				"esri/symbols/PictureMarkerSymbol"
	         ],function(
	            Map,Tiled,ArcGISDynamicMapServiceLayer,
	            Point,Graphic,GraphicsLayer,
	            PictureMarkerSymbol
	         ){
	            var tiled = new Tiled("http://31.16.1.101/arcgis/rest/services/shsw_JCDXT2016/MapServer");
				var yewuUrl = "http://31.16.1.101/arcgis/rest/services/shsw_HYJCXX/MapServer";   
				var	map = new Map("DWmap", {
					logo: false,
					zoom: 0,
					maxZoom:7,
					slider: false
				});
				map.addLayer(tiled); //底图
				var shipLayer = new GraphicsLayer();
				map.addLayer(shipLayer);//ship图层
				
				var mapxy = toXY(jd, wd);
				var point = new Point(mapxy[0],mapxy[1], map.spatialReference);
				var symbol = new PictureMarkerSymbol('../images/ship0.png', 50, 50);
				var graphic = new Graphic(point,symbol,null,null);
				shipLayer.add(graphic);
				
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
	          });    
		}
	</script>

	<body>
	<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seabedPipeline/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">预警船舶详细信息</a></li>
			</ul>
		</div>
        <input name="mmsi" id="mmsi" value="" type="hidden" />

		<div class="formbody">
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<th style="background-color:#f5f8fa;" colspan="4">船舶档案信息</th>
				<c:forEach items="${boatRecords}" var="br" >
				<tr>
					<td style="background-color:#f5f8fa;" width="20%">船舶编号：</td>
					<td width="30%">${br.shipNo }</td>
					<td style="background-color:#f5f8fa;" width="20%">船舶MMSI：</td>
					<td width="30%">${br.mmsi }</td>

				</tr>
				<tr>
					<td style="background-color:#f5f8fa;" width="20%">船舶经营人：</td>
					<td width="20%">${br.operator }</td>
					<td style="background-color:#f5f8fa;" width="20%">船舶所有人：</td>
					<td width="30%">${br.owner }</td>
				</tr>

				<tr>
					<td style="background-color:#f5f8fa;" width="20%">本地船名：</td>
					<td width="20%">${br.localName }</td>
					<td style="background-color:#f5f8fa;" width="20%">英文船名：</td>
					<td width="30%">${br.shipNameEn }</td>
				</tr>
                    <tr>
					<td style="background-color:#f5f8fa;" width="20%">国籍：</td>
					<td width="20%">${br.flagCode }</td>
					<td style="background-color:#f5f8fa;" width="20%">初始登记号：</td>
					<td width="30%">${br.initialregistrationNo }</td>
				</tr>
                    <tr>
					<td style="background-color:#f5f8fa;" width="20%">船舶呼号：</td>
					<td width="20%">${br.callsign }</td>
					<td style="background-color:#f5f8fa;" width="20%">IC卡号：</td>
					<td width="30%">${br.icNo }</td>
				</tr>
                    <tr>
					<td style="background-color:#f5f8fa;" width="20%">总吨：</td>
					<td width="20%">${br.gross }</td>
					<td style="background-color:#f5f8fa;" width="20%">净吨：</td>
					<td width="30%">${br.net }</td>
				</tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">载重吨：</td>
                    <td width="20%">${br.dWT }</td>
                    <td style="background-color:#f5f8fa;" width="20%">最低安全配员数：</td>
                    <td width="30%">${br.minSafeManningNO }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">救生设备最大数：</td>
                    <td width="20%">${br.maxSurvivalEquipmentNO }</td>
                    <td style="background-color:#f5f8fa;" width="20%">船舶性质：</td>
                    <td width="30%">${br.inlandshipMark }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">船舶类型：</td>
                    <td width="20%">${br.shiptypeCode }</td>
                    <td style="background-color:#f5f8fa;" width="20%">船检登记号：</td>
                    <td width="30%">${br.shipsurveyNo }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">造船厂：</td>
                    <td width="20%">${br.shipyard }</td>
                    <td style="background-color:#f5f8fa;" width="20%">建成日期：</td>
                    <td width="30%">${br.buildDate }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">船体材料：</td>
                    <td width="20%">${br.hullMaterialCode }</td>
                    <td style="background-color:#f5f8fa;" width="20%">主机数量：</td>
                    <td width="30%">${br.powerNO }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">主机功率：</td>
                    <td width="20%">${br.power }</td>
                    <td style="background-color:#f5f8fa;" width="20%">船舶长度：</td>
                    <td width="30%">${br.loa }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">船舶型宽：</td>
                    <td width="20%">${br.bm }</td>
                    <td style="background-color:#f5f8fa;" width="20%">船籍港：</td>
                    <td width="30%">${br.registrationPort }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">推进器种类：</td>
                    <td width="20%">${br.propellerType }</td>
                    <td style="background-color:#f5f8fa;" width="20%">船舶型深：</td>
                    <td width="30%">${br.depth }</td>
                </tr>
                </c:forEach>

            <th style="background-color:#f5f8fa;" colspan="4" >船舶静态数据信息</th>
            <c:forEach items="${boatStaticList}" var="bs" >
            <tr>
                <td style="background-color:#f5f8fa;" width="20%">船舶MMSI：</td>
                <td id="mmsivalue" width="30%">${bs.mmsi }</td>
                <td style="background-color:#f5f8fa;" width="20%">呼号：</td>
                <td width="30%">${bs.callno }</td>
            </tr>
            <tr>
                <td style="background-color:#f5f8fa;" width="20%">名称：</td>
                <td width="30%">${bs.shipname }</td>
                <td style="background-color:#f5f8fa;" width="20%">船舶和货物类型：</td>
                <td width="30%">${bs.shipAndCargType }</td>
            </tr>
            <tr>
                <td style="background-color:#f5f8fa;" width="20%">船长：</td>
                <td width="30%">${bs.length }</td>
                <td style="background-color:#f5f8fa;" width="20%">船宽：</td>
                <td width="30%">${bs.width }</td>
            </tr>
            <tr>
                <td style="background-color:#f5f8fa;" width="20%">预计到港时间：</td>
                <td width="30%">${bs.eta }</td>
                <td style="background-color:#f5f8fa;" width="20%">目前最大静态吃水：</td>
                <td width="30%">${bs.draft }</td>
            </tr>
            <tr>
                <td style="background-color:#f5f8fa;" width="20%">目的港：</td>
                <td width="30%">${bs.dest }</td>
            </tr>



            </c:forEach>
                <tr>
                    <td colspan="4" style="text-align:center;">
                        <input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack()" />
                        <input name="dw" type="button" value="定位" class="scbtn1" onclick="showShip()" />
                    </td>
                </tr>
			</table>
		</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</form>
	</body>

</html>