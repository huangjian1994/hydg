<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	    <title>无标题文档</title>
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/load.css" />   	   
	    <link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/dijit/themes/tundra/tundra.css" />
		<link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/esri/css/esri.css" />
	    <script type="text/javascript" src="${contextPath}/js/jquery.js"></script> 
		<script type="text/Javascript" src="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/init.js"></script>	
		<style>
			html,body{
				margin:0;
				padding:0;
				height:100%;
				overflow:hidden;
			}
		</style>    
	</head>	
	<body>
	    <!--<div id="loader-wrapper">
			<div id="loader"></div>
			<div class="loader-section section-left"></div>
			<div class="loader-section section-right"></div>
			<div class="load_title">正在加载地图</div>
		</div> -->
		<!--页面加载end-->
	  	<div id="map" style="height:100%;"></div>
	</body>
	<script type="text/Javascript" src="${contextPath}/js/seaVideo/ajjs.js"></script>
</html>