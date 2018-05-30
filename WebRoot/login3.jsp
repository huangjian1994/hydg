<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="jsp/common.jsp" %>
<html>

	<head>
		<meta charset="UTF-8">
		<title>上海市海域动态监视检测管理系统</title>
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/button.css" />
	</head>
	<style type="text/css">
		html,
		body {
			width: 100%;
			height: 100%;
			margin: 0;
			padding: 0;
		}
		
		.wrap {
			width: 100%;
			height: 100%;
			background-image: url(${contextPath}/images/login.png);
			background-size: 100% 100%;
		}
		
		.contain {
			width: 100%;
		}	
		.contain .right {
			width: 18%;
			position: absolute;
			left: 54.5%;
			top: 40%;
		}
		
		.contain .right div {
			width: 100%;
		}
		
		.contain .right .top input {
			width: 100%;
			height: 30px;
			line-height: 30px;
			border-radius: 5px;
		}		
		#login {
			margin-top: 40px;
			background-color: white;
			width: 100%;
			height: 36px;
		}
	</style>
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

	<body>
		<div class="wrap">
			<div class="contain">
				<s:form id="loginForm" action="/user/user_login2.do" theme="simple" onsubmit="return validate()" >
				<div class="right">
					<div class="top">
						
						<input name="user.userName" id="loginForm_user_userName" type="text" value="" placeholder="请输入用户名："/>
						<input name="user.password" id="loginForm_user_password" type="password" value="" placeholder="密码：" style="margin-top: 30px;" />
					
					</div>					
					<button class="button" type="submit" id="login" />登录</button>
				</div>
				</s:form>
			</div>
		</div>
	</body>
	<script src="${contextPath}/js/jquery.js"></script>
	

</html>