<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<div class="lefttop"><span></span>首页</div>
    
    <dl class="leftmenu">
    
	 <dd>
    <div class="title">
    <span><img src="${contextPath}/images/leftico01.png" /></span>我的工作
    </div>
    	   
    </dd>
	
	 <dd>
    <div class="title">
    <span><img src="${contextPath}/images/leftico01.png" /></span>我的学习
    </div>
    	   
    </dd>
	
	<dd>
    <div class="title">
    <span><img src="${contextPath}/images/leftico01.png" /></span>我的生活
    </div>
    	   
    </dd>
	
	<dd>
    <div class="title">
    <span><img src="${contextPath}/images/leftico01.png" /></span>我的档案
    </div>
    	   
    </dd>
	
    <dd>
    <div class="title">
    <span><img src="${contextPath}/images/leftico03.png" /></span>系统管理
    </div>
    	<ul class="menuson">
        <li class="active"><cite></cite><a href="${contextPath}/jsp/Sckzz_daoru.html" target="rightFrame">文号申请</a><i></i></li>
        <li ><cite></cite><a href="${contextPath}/jsp/right.html" target="rightFrame">文号审批</a><i></i></li>
        <li><cite></cite><a href="${contextPath}/jsp/imgtable.jsp" target="rightFrame">文号类别设置</a><i></i></li>
        <li><cite></cite><a href="${contextPath}/jsp/form.jsp" target="rightFrame">信息报送统计报表</a><i></i></li>
        </ul>    
    </dd>
        
    
    
    </dl>
    
</body>
</html>
