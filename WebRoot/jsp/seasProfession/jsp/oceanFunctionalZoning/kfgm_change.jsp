<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />

		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>

		<script type="text/javascript">
			function checkAll() {
				var cb = document.getElementById("cb");
				var chks = document.getElementsByName("chk");
				if(cb.checked == true) {
					for(var i = 0; i < chks.length; i++) {
						chks[i].checked = true;
					}
				} else {
					for(var i = 0; i < chks.length; i++) {
						chks[i].checked = false;
					}
				}
			}

			<!--使用onchange="jumpMenu()"触发jumpMenu()方法-->
			function jumpMenu(e) {
				window.location.href = e.value;
			}
		</script>
	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海洋功能区划管理</a>
				</li>
				<li>
					<a href="#">利用保护与现状跟踪</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="choice">请选择修改类型：
				<select name="ssbm" id="ssbm" onchange="jumpMenu(this)" style="width:180px;height:25px;">
					<option value="">-请选择-</option>
					<option value="kfgm_change.jsp" selected="selected">开发规模</option>
					<option value="zlbh_change.jsp">质量变化</option>
					<option value="plyx_change.jsp">对毗邻功能区影响</option>
				</select>
			</div>
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">功能区名称：</td>
					<td><input name="" type="text" class="scinput" value="上海滨江森林公园" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">开发规模：</td>
					<td><input name="" type="text" class="scinput" value="500平方米" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">围填海界址坐标：</td>
					<td><input name="" type="text" class="scinput" value="东经121度北纬39度" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">新增人：</td>
					<td><input name="" type="text" class="scinput" value="李四" style="width:180px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">新增时间：</td>
					<td colspan="3"><input name="" type="text" class="scinput" value="2016-9-25" style="width:180px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='lygz_xzgz.jsp'" value="保存">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='lygz_xzgz.jsp'" />
					</td>
				</tr>
			</table>
		</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

		</div>

	</body>

</html>