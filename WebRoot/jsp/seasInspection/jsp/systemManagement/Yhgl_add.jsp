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
					<a href="#">用户新增</a>
				</li>
			</ul>
		</div>

		<table class="filetable2">

			<tbody>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">用户名：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">密码：</td>
					<td style="border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
				</tr>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">姓名：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">性别：</td>
					<td style="border:1px solid #b5bfc4;text-align:left" width="20%">
						<select>
							<option id="s0" value="请选择">-请选择-</option>
							<option id="s1" value="男">男</option>
							<option id="s2" value="女"> 女</option>
						</select>
					</td>
				</tr>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">身份证号：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">公安警号：</td>
					<td style="border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
				</tr>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">所属单位：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">单位编码：</td>
					<td style="border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
				</tr>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">所属部门：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">部门编码：</td>
					<td style="border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
				</tr>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">手机号码：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">邮箱地址：</td>
					<td style="border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
				</tr>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">地址信息：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
					<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">角色设置：</td>
					<td style="border:1px solid #b5bfc4;text-align:left" width="20%">
						<select>
							<option id="s0" value="请选择">-请选择-</option>
							<option id="s1" value="业务人员">业务人员</option>
							<option id="s2" value="一般访问人员"> 一般访问人员</option>
							<option id="s3" value="管理员">管理员</option>
							<option id="s4" value="普通管理员">普通管理员</option>
						</select>
					</td>
				</tr>

			</tbody>

		</table>
		<table class="filetable2">
			<tbody>
				<tr style=" border:1px solid #b5bfc4; height:40px;">
					<td width="30%"></td>
					<td style="text-align:center" width="10%"><input type="submit" value="提交" class="btn02" style="width:60px;height:20px;" /></td>
					<td style=" text-align:center" width="10%"><input type="reset" value="重置" class="btn02" style="width:60px;height:20px;" /></td>
					<td style=" text-align:center" width="10%"><input type="button" value="取消" class="btn02" style="width:60px;height:20px;" onclick="javascript:history.back(-1);" /></td>
					<td width="30%"></td>
				</tr>
			</tbody>
		</table>
		<br/>

	</body>

</html>