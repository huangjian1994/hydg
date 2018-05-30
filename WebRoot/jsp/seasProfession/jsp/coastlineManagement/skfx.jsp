<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/load.css" />
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/seasProfession/hykj_hjfa.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/dijit/themes/tundra/tundra.css" />
    	<link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/esri/css/esri.css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>		
		<script type="text/javascript" src="${contextPath}/js/seasProfession/skfx.js"></script>	
		<script type="text/Javascript" src="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/init.js"></script>
		<script type="text/javascript" src="${contextPath}/js/seasProfession/coastlineSearch.js"></script>			
	</head>

	<body>
		
		<div id="loader-wrapper">
	        <div id="loader"></div>
	        <div class="loader-section section-left"></div>
	        <div class="loader-section section-right"></div>
	        <div class="load_title">正在加载地图</div>
	    </div>
	     
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海岸线管理</a>
				</li>
				<li>
					<a href="#">时空分析</a>
				</li>
			</ul>
		</div>
		<div id="map" style="position:absolute;left:0;right:0;top:40px;bottom:0;"></div>	
		<div class="option">
			<div class="option-icon">
				<img src="${contextPath}/images/seasProfession/menu-icon.png"  />
			</div>			
		</div>
        <div class="option-contain">
            <div class="menu-top">
                <div>
                    <span>海岸线列表</span>
                    <img class="close fr" src="${contextPath}/images/menu-close.png" title="关闭" />
                </div>
            </div>
            <div class="menu"> 
                <ul></ul>
            </div>
         </div>  
	</body>	
</html>