<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${contextPath}/js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
</head>

<body style="background:url(images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="${contextPath}/default.jsp" target="bottomFrame"><img src="${contextPath}/images/logo.png" title="系统首页" /></a>
    </div>
        
            
   <div class="topright"> 
   <div class="user">
    <span>admin</span>
    <a href="#"><i>登录</i></a>
	<a href="#"><i><font color="#FFFFFF" style="font-size:16px;">退出</font></i></a>
    </div> 

    </div>

</body>
</html>
