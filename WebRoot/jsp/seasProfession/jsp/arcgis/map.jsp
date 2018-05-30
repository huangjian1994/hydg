<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/load.css" />   
    <link href="${contextPath}/css/seasProfession/map.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/dijit/themes/tundra/tundra.css" />
	<link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/esri/css/esri.css" />
    <script type="text/javascript" src="${contextPath}/js/jquery.js"></script> 
	<script type="text/Javascript" src="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/init.js"></script>
    <script type="text/javascript" src="${contextPath}/js/seasProfession/left-map.js"></script>
</head>

<body>
    <div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
		<div class="load_title">正在加载地图</div>
	</div>
	<!--页面加载end-->
  	<div class="map" id="map1"></div>
	<div class="map" id="map2"></div>
  	<div class="map" id="map3"></div>
	<div class="map" id="map4"></div>
	<div class="map" id="map5"></div>
	<div class="map" id="map6"></div> 
			
 	
	<script type="text/javascript">
	    var url = window.location.href;//获取当前页面url
		//console.log(url);
		function parseURL(url){//获取url中传递的参数
		    var url = url.split("?")[1];
		    var para = url.split("&");
		    var len = para.length;
		    var mapId = {};
		    var arr = [];
		    for(var i=0;i<len;i++){
		        arr = para[i].split("=");
		        mapId[arr[0]] = arr[1];
		    }
		    return mapId;
		}
		mapId = parseURL(url);
	</script>
	<script type="text/javascript" src="${contextPath}/js/seasProfession/map/map1.js"></script>
    <script type="text/javascript" src="${contextPath}/js/seasProfession/map/map2.js"></script>
    <script type="text/javascript" src="${contextPath}/js/seasProfession/map/map3.js"></script>
    <script type="text/javascript" src="${contextPath}/js/seasProfession/map/map4.js"></script>
    <script type="text/javascript" src="${contextPath}/js/seasProfession/map/map5.js"></script>
    <script type="text/javascript" src="${contextPath}/js/seasProfession/map/map6.js"></script>

    <script type="text/javascript">
        function showmap (){
            for(var i = 0;i < $('input[type="checkbox"]',window.parent.document).length;i++){
                (function(indexI){
                    $('input[type="checkbox"]',window.parent.document).eq(indexI).on("click",function(event){
                        //mapIndex = indexI; 
                        //console.log(mapIndex);
                        controlLayer();
                        event.stopPropagation();//阻止事件冒泡即可
                    })
                })(i)
            }
        }
        showmap(); 
        for (var i = 0; i < $("input",window.parent.document).length; i++) {
            $("input",window.parent.document).eq(i).prop("checked", "true");
        } 
    </script>
    </body>
</html>