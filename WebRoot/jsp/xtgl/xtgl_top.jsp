<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上海市海域动态监视检测管理系统</title>
<link href="${contextPath}/css/style_xtgl.css" rel="stylesheet" type="text/css" />
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

<body style="background:url(${contextPath}/images/topbg.gif) repeat-x;">
	<div style="width:100%;height:88px;overflow:hidden;position:relative;">
	<img alt="" src="${contextPath}/images/bg.png" style="z-index:-100;width:100%;height:88px;position:absolute;left:0;top:0" />
	<div class="topleft">
    <a href="${contextPath}/jsp/xtgl/xtgl.jsp" target="_parent">
    <img src="${contextPath}/images/logo.png" title="上海市海域动态监视检测管理系统" /></a>
    </div>

  <div class="topright"> 
	<ul>

    <li><span><img src="${contextPath}/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
	
	<li><a href="${contextPath}/jsp/homepage.jsp" target="_top">返回</a></li>
    <li><a href="${contextPath}/user/user_logOut.do" target="_parent">退出</a></li>
    </ul>
    <div class="user">
    <a href="${contextPath}/user/user_edit_maintop.do?method=init" title="用户修改" target="_blank">
    <span><s:property value="#session.user.role.roleName"/>：<s:property value="#session.user.name"/></span>
    </a>
    </div> 
  </div></div>
    

</body>
</html>
