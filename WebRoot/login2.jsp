
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@include file="jsp/common.jsp" %> 
<!DOCTYPE html>
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
			background-image: url(${contextPath}/images/bg.png);
			background-size: 100% 100%;
		}
		
		.contain {
			width: 100%;
		}
		
		.contain .left {
			width: 70%;
			position: absolute;
			left: 8%;
			top: 42.5%;
		}
		
		.contain .right {
			width: 25%;
			position: absolute;
			left: 54.5%;
			top: 30%;
		}
		
		.contain .right div {
			width: 100%;
		}
		
		.contain .right .top input {
			
			height: 30px;
			line-height: 30px;
			border-radius: 5px;
		}
		
		.contain .right .bottom {
			text-align: center;
			margin: 20px;
		}
		
		#login {
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
				<div class="left">
					<span style="font-size: 30px;color:#109ad9;">上海市海域动态监视监测管理系统</span>
				</div>
				<s:form id="loginForm" action="/user/user_login2.do" theme="simple" onsubmit="return validate()" >		
				<div class="right">
					<div class="top">
					<table width="100%">
						<tr>
						<td width="30%">用户名：</td>
						<td width="70%">
						<input name="user.userName" id="loginForm_user_userName" type="text" value="" style="width:150px;" />
						</td>
						</tr>
						<tr>
						<td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
						<td>
						<input name="user.password" id="loginForm_user_password" type="password" value="" style="width:150px;" />
						</td>
						</tr>
					</table>
					
					<br />
					
						
					</div>
					<div class="bottom">
						
					</div>
					<button class="button" type="submit" id="login" />登录</button>
				</div>
				</s:form>
			</div>
		</div>
	</body>
	<script type="text/javascript">
	/*
		$(document).ready(function() {
			$('#username').val("用户名：");
			$('#password').val("密  码：");	
			search("#username","用户名：");
			search("#password","密  码：");
		});
		function search (name,val) {
			$(name).focus(function() {
				//获得焦点时，如果值为默认值，则设置为空
				if($(this).val() == val) {
					$(this).val("");
				}
			});
			$(name).blur(function() {
				//失去焦点时，如果值为空，则设置为默认值
				if($(this).val() == "") {
					$(this).val(val);
				}
			});
		}
		*/
	</script>

</html>