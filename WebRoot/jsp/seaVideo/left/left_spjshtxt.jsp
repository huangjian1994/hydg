<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<%@include file="../../message.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${contextPath}/js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span><s:property value="#session.user.role.roleName"/>：<s:property value="#session.user.name"/></div>
    
    <dl class="leftmenu">
    
	
    
   <dd>
    <div class="title">
    <span><img src="${contextPath}/images/seabedPipeline/leftico01.png" /></span>海底管线安全
    </div>
     <ul class="menuson">
        <li><cite></cite><a href="${contextPath}/jsp/seabedPipeline/jsp/seabedPipelineSafe/hdgxaq_index.jsp" target="rightFrame">海底管线可视化</a><i></i></li>
		<li><cite></cite><a href="${contextPath}/jsp/seabedPipeline/jsp/seabedPipelineSafe/hdgxaq_cbjkxxksh.jsp" target="rightFrame">船舶监控信息可视化</a><i></i></li>
		<li><cite></cite><a href="${contextPath}/jsp/seabedPipeline/jsp/seabedPipelineSafe/hdgxaq_znyj.jsp" target="rightFrame">智能预警</a><i></i></li>
		<li><cite></cite><a href="${contextPath}/jsp/seabedPipeline/jsp/seabedPipelineSafe/hdgxaq_hztj.jsp" target="rightFrame">汇总统计</a><i></i></li>
		<li><cite></cite><a href="${contextPath}/jsp/seabedPipeline/jsp/seabedPipelineSafe/hdgxaq_wgjbgl.jsp" target="rightFrame">违规举报管理</a><i></i></li>
    </ul>
	</dd>
    
    
   
    </dl>
    
</body>
</html>
