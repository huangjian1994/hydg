<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
        <style type="text/css">
            html,body {
  	            margin: 0;
  	            padding: 0;
  	            width: 100%;
  	            height: 100%;
  	            background-image: url('${contextPath}/images/noAuth_bg.png');
  	            background-size: cover;
                filter: progid:DXImageTransform.Microsoft.AlphaImageLoader( src='${contextPath}/images/noAuth_bg.png', sizingMethod='scale');
            }
            .wrap {
            	position: absolute;
            	left: 50%;
            	top: 50%;
            	margin-left: -250px;
            	margin-top: -50px;
            	width: 500px;
            	height: 300px;
            }      
            .contain {
            	text-align: center;
            }            
            .pic {
            	width: 100px;
            	margin: 0 auto;
            }            
            .pic img {
            	width: 100%;
            }
         </style>
    </head>
    <body>
        <div class="wrap">
            <div class="contain">
                <div class="pic">
                    <img src="${contextPath}/images/locked.png" alt="">
                </div>
                <p>对不起，你对该模块没有操作权限，请联系管理员！</p>
            </div>
        </div>
    </body>
</html>
