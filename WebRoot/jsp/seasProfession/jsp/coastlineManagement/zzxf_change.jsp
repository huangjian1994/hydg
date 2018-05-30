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
					<a href="#">海岸线管理</a>
				</li>
				<li>
					<a href="#">海岸线整治修复</a>
				</li>
			</ul>
		</div>

		<div class="formbody">

			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">工程项目名称</td>
					<td><input name="" type="text" class="scinput" value="大风厂" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">项目形式</td>
					<td><input name="" type="text" class="scinput" value="1.6" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">位置</td>
					<td><input name="" type="text" class="scinput" value="一号海岸" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">轮廓</td>
					<td><input name="" type="text" class="scinput" value="1.6" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">岸段序号</td>
					<td><input name="" type="text" class="scinput" value="一号海岸线" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">是否沙滩修复养护</td>
					<td>
						<input name="choose1" type="radio" class="scinput" checked style="vertical-align: middle;" />是
						<input name="choose1" type="radio" class="scinput" style="vertical-align: middle;" />否
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">是否近岸构筑物清理</td>
					<td>
						<input name="choose5" type="radio" class="scinput" checked style="vertical-align: middle;" />是
						<input name="choose5" type="radio" class="scinput" style="vertical-align: middle;" />否
					</td>
					<td style="background-color:#e8edef;">是否清淤疏浚整治</td>
					<td>
						<input name="choose2" type="radio" class="scinput" style="vertical-align: middle;" />是
						<input name="choose2" type="radio" class="scinput" checked style="vertical-align: middle;" />否
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">是否滨海湿地植被种植与恢复</td>
					<td>
						<input name="choose3" type="radio" class="scinput" style="vertical-align: middle;" />是
						<input name="choose3" type="radio" class="scinput" checked style="vertical-align: middle;" />否
					</td>
					<td style="background-color:#e8edef;">是否海岸生态廊道建设</td>
					<td>
						<input name="choose4" type="radio" class="scinput" checked style="vertical-align: middle;" />是
						<input name="choose4" type="radio" class="scinput" style="vertical-align: middle;" />否
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">修复时间</td>
					<td><input name="" type="text" class="scinput" value="2017-09-11" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">修复情况</td>
					<td>
						<select>
							<option>----请选择----</option>
							<option>已完成</option>
							<option selected>实施中</option>
							<option>计划中</option>
							<option>尚未有计划</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='zzxf.jsp'" value="保存">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='zzxf.jsp'" />
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