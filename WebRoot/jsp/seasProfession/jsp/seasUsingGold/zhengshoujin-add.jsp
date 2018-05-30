<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap.min.css" />
		<!--<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />-->
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/seasProfession/usemoney-add.css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>

	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">使用金征收管理</a>
				</li>
				<li>
					<a href="#">使用金征收标准</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">征收标准</td>
					<td colspan="3"><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">定义标准时间</td>
					<td colspan="3"><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">登记人</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">登记时间</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;" colspan="2">验收标准内容</td>
					<td colspan="2"></td>
				</tr>

			</table>
		</div>
	</body>
	<script type="text/javascript">
		$("#usual1 ul").idTabs();
	</script>

	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</html>