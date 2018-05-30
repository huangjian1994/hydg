<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	    <title>无标题文档</title>	    
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/seaVideo/znspfx.css" />
	    <script type="text/javascript" src="${contextPath}/js/jquery.js"></script> 
	    <script type="text/javascript" src="${contextPath}/js/seaVideo/znspfx.js"></script>   
	</head>	
	<body>        
		<div class="top">
			<div class="ctrol_button">
				<input type="button" value="切换摄像头：当前为摄像头A" onclick="ctrol_button()" />
			</div>
			<div class="left">
				<div class="dt">
					<canvas id="myCanvas1"></canvas>	
					<div class="butter">
						<input type="button" value="全景图" class="qjt" onclick="qjt(this,'A')" />
						<input type="button" value="停止追踪" class="tzzz" onclick="tzzz(this,'A')" />
					</div>			
				</div>
		    	<div class="pt">
		    		<canvas id="myCanvas2"></canvas>
		    		<div class="butter">
						<input type="button" value="全景图" class="qjt" onclick="qjt(this,'B')"/>
						<input type="button" value="停止追踪" class="tzzz" onclick="tzzz(this,'B')"/>
					</div>
		    	</div>
			</div>
			<div class="right"></div>
		</div>
	    <div class="bottom"></div>	
	</body>
	
</html>