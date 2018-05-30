<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>

	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">用海项目审批</a>
				</li>
			</ul>
		</div>
		<div style="padding-top:20px;">
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<th>局内单位审核</th>
				<tr>
					<td style="background-color:#e8edef;">审核结果：</td>
					<td>通过</td>
					<td style="background-color:#e8edef;">审核时间：</td>
					<td>2016-9-1</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">审核人：</td>
					<td>李四</td>
					<td style="background-color:#e8edef;">审核意见：</td>
					<td>予以通过</td>
				</tr>
				<th>局外单位审核</th>
				<tr>
					<td style="background-color:#e8edef;">审核结果：</td>
					<td>通过</td>
					<td style="background-color:#e8edef;">是否及时缴纳海域使用金：</td>
					<td>是</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">审核人：</td>
					<td>张三</td>
					<td style="background-color:#e8edef;">审核意见：</td>
					<td>予以通过</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='xmsp.jsp'" />
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

	</body>

</html>