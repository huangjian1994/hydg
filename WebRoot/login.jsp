<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="jsp/common.jsp" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<html>
	<head>
		<meta charset="UTF-8">
		<title>上海市海域动态监视检测管理系统</title>
		<link rel="stylesheet" href="${contextPath}/css/reset.css">
        <link rel="stylesheet" href="${contextPath}/css/supersized.css">
        <link rel="stylesheet" href="${contextPath}/css/login.css">
        <script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
        <script src="${contextPath}/js/supersized.3.2.7.min.js"></script>
        <!--<script src="${contextPath}/js/relogin.js"></script>-->
        <script src="${contextPath}/js/login.js"></script>
        <style>
        	body,html{
				width:100%;
				height:100%;
			}       	
        				
        </style>
	</head>	
	<script type="text/javascript">
		if("${message}"){
			alert("${message}");
		}
		function validate(){
				if(!$("#loginForm_user_userName").val()){
						alert("用户名不能为空");
						return false;
				}
				if(!$("#loginForm_user_password").val()){
					alert("密码不能为空");
					return false;
			}
				return true;
			}
	</script>
	</head>
	<body oncontextmenu="return false">	
		<div id="all" style="display:none;">
			<div class="page-container" style="display:none;">            
	            <s:form id="loginForm" action="/user/user_login.do" theme="simple" onsubmit="return validate()" >
					<div>
						<input type="text" name="user.userName" id="loginForm_user_userName" class="username" placeholder="请输入用户名：" autocomplete="off"/>
					</div>
	                <div>
						<input type="password" name="user.password" id="loginForm_user_password" class="password" placeholder="密码：" oncontextmenu="return false" onpaste="return false" />
	                </div>
	                <button class="button" type="submit" id="login" />登录</button>
	            </s:form>            
	        </div>
	        <div class="connect">                
				<img src="${contextPath}/images/login-bg.png" alt="上海市海域动态监视监测管理系统">
	        </div>
		</div>
				
		<script>			
			window.onload = function(){
				$(".connect").animate({"left":"8%"}, 600);
				$(".page-container").fadeIn();
			}		
		</script>
	</body>
	
</html>