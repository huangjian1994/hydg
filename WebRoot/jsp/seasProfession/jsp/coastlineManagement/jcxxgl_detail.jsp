<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海域勘界管理</a>
				</li>
				<li>
					<a href="#">基础信息管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">

			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">海岸线名称</td>
					<td><input name="" type="text" class="scinput" value="一号海岸线" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">海岸线长度(千米)</td>
					<td><input name="" type="text" class="scinput" value="1.6" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">岸段序号</td>
					<td><input name="" type="text" class="scinput" value="H108313" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">海岸线所在行政区划</td>
					<td><input name="" type="text" class="scinput" value="崇明" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海岸线位置</td>
					<td><input name="" type="text" class="scinput" value="一号海岸线" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">端点坐标</td>
					<td><input name="" type="text" class="scinput" value="1.6" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海岸线类型</td>
					<td><input name="" type="text" class="scinput" value="划分" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">所在海域</td>
					<td><input name="" type="text" class="scinput" value="东海" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">管辖单位</td>
					<td><input name="" type="text" class="scinput" value="上海市海洋局" style="width:180px;height:20px;" /></td>

					<td style="background-color:#e8edef;">管辖人</td>
					<td><input name="" type="text" class="scinput" value="张三" style="width:180px;height:20px;" /></td>

				</tr>
				<tr>
					<td style="background-color:#e8edef;">新增人</td>
					<td><input name="" type="text" class="scinput" value="李四" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">新增时间</td>
					<td><input name="" type="text" class="scinput" value="2016-9-25" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">备注</td>
					<td><input name="" type="text" class="scinput" value="李四" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">最近修改时间</td>
					<td><input name="" type="text" class="scinput" value="2016-9-25" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='jcxxgl.jsp'" value="保存">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='jcxxgl.jsp'" />
					</td>
				</tr>
			</table>
		</div>
		<div>
			<script type="text/javascript">
				$("#usual1 ul").idTabs();
			</script>

			<script type="text/javascript">
				$('.tablelist tbody tr:odd').addClass('odd');
			</script>

		</div>

	</body>

</html>