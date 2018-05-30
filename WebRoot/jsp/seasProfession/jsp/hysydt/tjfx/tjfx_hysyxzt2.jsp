﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/mycharts/echarts-all.js"></script>
<script type="text/javascript">
function goHysyxzt1(){
	document.myForm.action="<%=basePath%>/statisticalAnalysis/statisticalAnalysis_fetchHysyxzt.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function goHysyxzt2(){
	document.myForm.action="<%=basePath%>/statisticalAnalysis/statisticalAnalysis_fetchHysyxzt2.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goHysyxzt3(){
	document.myForm.action="<%=basePath%>/statisticalAnalysis/statisticalAnalysis_fetchHysyxzt3.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function reinitIframe(){ 
	var iframe = document.getElementById("zhxxFrame"); 
	try{ 
	var bHeight = iframe.contentWindow.document.body.scrollHeight; 
	var dHeight = iframe.contentWindow.document.documentElement.scrollHeight; 
	var height = Math.max(bHeight, dHeight); 
	iframe.height = height; 
	}catch (ex){} 
	} 		
	window.setInterval("reinitIframe()", 200); 	
</script>
	</head>

	<body>
<form name="myForm" method="post" >
	<div class="place">
		<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">海域使用动态管理</a></li>
			<li><a href="#">统计分析</a></li>
			<li><a href="#">海域使用现状图</a></li>
		</ul>
	</div>
	
	<div class="formbody" >
		<div id="usual1" class="usual" >
			<div class="leftinfo1">
			<div class="itab" >
				<ul>
					<li><a href="###" onclick="goHysyxzt1()" >地图展示</a></li>
					<li><a href="###" onclick="goHysyxzt2()" class="selected">统计图</a></li>
					<li><a href="###" onclick="goHysyxzt3()">统计表</a></li>
				</ul>
			</div>
			
			<iframe src="<%=basePath%>/statisticalAnalysis/statisticalAnalysis_fetchHysytj2.do" name="zhxxFrame" id="zhxxFrame" style="text-align:center;width:100%;border: 0px solid red" align="middle" scrolling="no" frameborder="0"  onLoad="reinitIframe()" ></iframe>
				
			
			
			</div>
		</div>
	</div>
	
</form>
		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</body>
</html>