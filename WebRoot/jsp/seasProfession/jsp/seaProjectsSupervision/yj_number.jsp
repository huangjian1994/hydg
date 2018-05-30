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
					<a href="#">变化预警</a>
				</li>
			</ul>
		</div>

		<div class="formbody">

			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<th>突发事件信息</th>
				<tr>
					<td style="background-color:#e8edef;">用海项目名称：</td>
					<td>外高桥港区</td>
					<td style="background-color:#e8edef;">突发事件说明：</td>
					<td>港口航运</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">发生时间：</td>
					<td>2016-9-10</td>
					<td style="background-color:#e8edef;">发生地点：</td>
					<td>浦东新区</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">发现人：</td>
					<td colspan="3">张三</td>
				</tr>
				<th>处理内容</th>
				<tr>
					<td style="background-color:#e8edef;">填写处理结果：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">处理说明：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>

				<tr>
					<td style="background-color:#e8edef;">处理人：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">处理时间：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">处理后续：</td>
					<td colspan="3"><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<tr>
						<td colspan="4" style="text-align:center;">
							<input type="button" class="scbtn1" name="btn" onclick="window.location='bhyj.jsp'" value="提交">
							<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='bhyj.jsp'" />
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