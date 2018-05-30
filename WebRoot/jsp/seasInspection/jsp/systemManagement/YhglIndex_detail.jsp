<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<title>用户管理</title>
		<link href="${contextPath}/css/style_tt.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>

		<script language="javascript">
			$(function() {
				//导航切换
				$(".disklist li").click(function() {
					$(".disklist li.selected").removeClass("selected")
					$(this).addClass("selected");
				})
			})
		</script>

	</head>

	<body>

		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">系统管理</a>
				</li>
				<li>
					<a href="#">用户管理</a>
				</li>
				<li>
					<a href="#">用户详情</a>
				</li>
			</ul>
		</div>

		<table class="filetable2">

			<tbody>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">用户名：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%">zs</td>
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">密码：</td>
					<td style="border:1px solid #b5bfc4;text-align:left" width="20%">000000</td>
				</tr>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">姓名：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%">张三</td>
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">性别：</td>
					<td style="border:1px solid #b5bfc4;text-align:left" width="20%">男</td>
				</tr>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">身份证号：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%">310021196512034562</td>
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">公安警号：</td>
					<td style="border:1px solid #b5bfc4;text-align:left" width="20%">132456</td>
				</tr>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">所属单位：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%">科技处</td>
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">单位编码：</td>
					<td style="border:1px solid #b5bfc4;text-align:left" width="20%"></td>
				</tr>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">所属部门：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%">科技处</td>
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">部门编码：</td>
					<td style="border:1px solid #b5bfc4;text-align:left" width="20%"></td>
				</tr>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">手机号码：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%"></td>
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">邮箱地址：</td>
					<td style="border:1px solid #b5bfc4;text-align:left" width="20%"></td>
				</tr>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">地址信息：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%"></td>
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">角色设置：</td>
					<td style="border:1px solid #b5bfc4;text-align:left" width="20%">业务人员</td>
				</tr>

				<tr style=" border:1px solid #b5bfc4; height:40px;">
					<td style=" text-align:center" colspan="4"><input type="button" value="返回" class="btn02" style="width:60px;height:20px;" onclick="javascript:history.back(-1);" /></td>
				</tr>

			</tbody>

		</table>

	</body>

</html>