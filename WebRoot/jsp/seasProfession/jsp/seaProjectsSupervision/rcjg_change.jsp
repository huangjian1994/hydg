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
					<a href="#">用海项目批后监管</a>
				</li>
				<li>
					<a href="#">批后监管</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<input type="button" class="scbtn1" name="btn" onclick="window.location='spjs.jsp'" value="视频监视">
			<input name="fh" type="button" value="海域巡查" class="scbtn1" onclick="window.location='hyxc.jsp'" />
			<table width="100%" align="center" style="text-align:left;margin-top:10px;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">用海项目名称：</td>
					<td><input name="" type="text" class="scinput" value="外高桥港" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">占用海域：</td>
					<td><input name="" type="text" class="scinput" value="东海" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">有无非法围填海活动：</td>
					<td><input name="group1" type="radio" value="是" />有
						<input name="group1" type="radio" value="否" checked="checked" />无</td>
					<td style="background-color:#e8edef;">是否擅自改变海域用途：</td>
					<td><input name="group2" type="radio" value="是" />是
						<input name="group2" type="radio" value="否" checked="checked" />否</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='jg.jsp'" value="保存">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='jg.jsp'" />
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