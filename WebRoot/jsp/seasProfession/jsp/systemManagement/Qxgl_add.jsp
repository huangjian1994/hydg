<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<title>权限管理</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />

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
		<script language="javascript">
			function yhqx_add_next() {
				open("Qxgl_add2.jsp", "rightFrame");
			}
		</script>
	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">系统管理</a>
				</li>
				<li>
					<a href="#">权限管理</a>
				</li>
				<li>
					<a href="#">权限新增</a>
				</li>
			</ul>
		</div>

		<table class="filetable3">

			<tbody>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right" width="10%">角色名：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
					<td style=" border:1px solid #b5bfc4;text-align:right" width="10%">角色描述：</td>
					<td style="border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
				</tr>

				<tr style=" border:1px solid #b5bfc4; height:40px;">

					<td style="text-align:right" colspan="2"><input type="submit" value="下一步" class="btn02" style="width:60px;height:20px;" onclick="yhqx_add_next()" /></td>
					<td style=" text-align:left" colspan="2"><input type="button" value="取消" class="btn02" style="width:60px;height:20px;" onclick="javascript:history.back(-1);" /></td>
				</tr>

			</tbody>

		</table>

	</body>

</html>