<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp"%>
<%@include file="../../message.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title> <
		<link href="${contextPath}/css/left.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/icon.css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.easyui.min.js"></script>
		<script type="text/javascript">
			$(function() {
				//导航切换
				$(".menuson li").click(function() {
					$(".menuson li.active").removeClass("active")
					$(this).addClass("active");
				});
		
				$('.title').click(function() {
					var $ul = $(this).next('ul');
					$('dd').find('ul').slideUp();
					if ($ul.is(':visible')) {
						$(this).next('ul').slideUp();
					} else {
						$(this).next('ul').slideDown();
					}
				});
			})
		</script>


	</head>

	<body style="background: #f0f9fd;">
		<div class="lefttop">
			<span></span>
			<s:property value="#session.user.role.roleName" />
			：
			<s:property value="#session.user.name" />
		</div>

		<dl class="leftmenu">
			<dd>
				<div class="title">
					<span><img src="${contextPath}//leftico01.png" /></span>
					<a href="${contextPath}/jsp/seabedPipeline/jsp/groundWaveRadarInformation/dbldxx_index.jsp" target="rightFrame">视频</a>
				</div>
			</dd>
		</dl>

	</body>
</html>
