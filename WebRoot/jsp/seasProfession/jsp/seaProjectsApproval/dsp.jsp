<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/jsp/seasProfession/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/jsp/seasProfession/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/jsp/seasProfession/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/seasProfession/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/seasProfession/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/seasProfession/editor/kindeditor.js"></script>

	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/jsp/seasProfession/images/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">用海项目审批</a>
				</li>
			</ul>
		</div>
		<div style="padding-top:20px;">
			<table align="center" style="text-align:left;" class="tableXQ">
				<th>局内单位审核</th>
				<tr>
					<td style="background-color:#e8edef;">审核结果：</td>
					<td><input name="group1" type="radio" value="通过" checked="checked" />通过
						<input name="group1" type="radio" value="不通过" />不通过
					</td>
					<td style="background-color:#e8edef;">审核时间：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">审核人：</td>
					<td colspan="3"><input name="" type="text" class="scinput" value="" style="width:140px;height:20px;" /><input name="" type="button" class="scbtn1" value="业务数据" style="margin-left:140px;margin-right:20px;" /><input name="" type="button" class="scbtn1" value="GIS遥感数据" style="width:100px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">审核意见：</td>
					<td colspan="3"><textarea style=" width:700px;height:40px;"></textarea></td>
				</tr>
				<th>局外单位审核</th>
				<tr>
					<td style="background-color:#e8edef;">审核结果：</td>
					<td><input name="group2" type="radio" value="通过" checked="checked" />通过
						<input name="group2" type="radio" value="不通过" />不通过
					</td>
					<td style="background-color:#e8edef;">审核时间：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">是否及时缴纳海域使用金：</td>
					<td><input name="group3" type="radio" value="是" checked="checked" />是
						<input name="group3" type="radio" value="否" />否</td>
					<td style="background-color:#e8edef;">审核人：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">审核意见：</td>
					<td colspan="3"><textarea style=" width:700px;height:40px;"></textarea></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='xmsp.jsp'" value="提交">
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