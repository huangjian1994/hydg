<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'noAuth.jsp' starting page</title>
   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="<%=basePath%>/js/jquery.js"></script>

    <style type="text/css">
    	*{margin:0px;padding:0px}
		body{margin:0px;padding:0px;width:700px;height:400px;border:1px solid #BEBEBE}
		.main_div{width:680px;margin-left:10px;height:400px;line-height:400px;text-align:center}
   
.error{background:url(<%=basePath%>/images/405.png) no-repeat; width:490px; margin-top:75px;padding-top:65px;}
.error h2{font-size:22px; padding-left:154px;}
.error p{padding-left:154px; line-height:35px;color:#717678;}
.reindex{padding-left:154px;}
.reindex a{width:115px; height:35px; font-size:14px; font-weight:bold;
color:#fff; background:#3c95c8; display:block; line-height:35px;
text-align:center;border-radius: 3px;margin-top:20px;}
    </style>
    <script language="javascript">
	$(function(){
    $('.error').css({'position':'absolute','left':($(window).width()-490)/2});
	$(window).resize(function(){  
    $('.error').css({'position':'absolute','left':($(window).width()-490)/2});
    })  
});  
</script>
  </head>
  <body style="background:#edf6fa">
  <div class="error">   
    <div class="reindex"><h4>对不起，登录超时，请您点击右上角“退出”链接，退出系统，重新登录！</h4>
    <!--  -->
    <a href="<%=basePath%>/user/user_logOut.do" target="_parent">返回登录页面</a> 
    
    </div>
    </div>
  </body>
</html>
