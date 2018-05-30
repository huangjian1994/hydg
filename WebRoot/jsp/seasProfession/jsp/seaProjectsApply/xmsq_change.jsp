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
					<a href="#">信息管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">

			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">用海项目名称：</td>
					<td><input name="" type="text" class="scinput" value="外高桥港区" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">项目类型：</td>
					<td>
						<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
							<option value="">-请选择-</option>
							<option value="非填海项目用海行政许可">非填海项目用海行政许可</option>
							<option value="填海项目用海行政许可">填海项目用海行政许可</option>
							<option value="临时用海审批">临时用海审批</option>
							<option value="无居民海岛使用项目审批">无居民海岛使用项目审批</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用海面积：</td>
					<td><input name="" type="text" class="scinput" value="300平方米" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">使用年限：</td>
					<td><input name="" type="text" class="scinput" value="5" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">申请人：</td>
					<td><input name="" type="text" class="scinput" value="张三" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">申请时间：</td>
					<td><input name="" type="text" class="scinput" value="2016-9-1" style="width:180px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">备注：</td>
					<td colspan="3"><textarea style="width:180px;height:20px; overflow:auto;" />无</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='xmsq.jsp'" value="保存">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='xmsq.jsp'" />
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