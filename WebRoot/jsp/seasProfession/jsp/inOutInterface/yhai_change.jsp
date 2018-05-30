<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${contextPath}/jsp/seasProfession/css/bootstrap.min.css" />
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<!--<link rel="stylesheet" type="text/css" href="${contextPath}/jsp/seasProfession/css/zhai-add.css" />-->
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>

	<body>
		<div class="place">
			<span><img src="${contextPath}/jsp/seasProfession/images/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">内外部接口</a>
				</li>
				<li>
					<a href="#">用海批文</a>
				</li>
				<li>
					<a href="#">用海批文修改</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">批文编号</td>
					<td><input name="" type="text" class="scinput" value="H1000003776" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">批文号</td>
					<td><input name="" type="text" class="scinput" value="31238882" style="width:180px;height:20px;" /></td>

				</tr>
				<tr>
					<td style="background-color:#e8edef;">项目名称</td>
					<td><input name="" type="text" class="scinput" value="大风厂" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">用海总面积</td>
					<td><input name="" type="text" class="scinput" value="34" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">面积单位</td>
					<td><input name="" type="text" class="scinput" value="公顷" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">使用金征收标准</td>
					<td><input name="" type="text" class="scinput" value="标准1" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">使用金缴纳方式</td>
					<td><input name="" type="text" class="scinput" value="一次性" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">海岛名称</td>
					<td><input name="" type="text" class="scinput" value="崇明岛" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">使用金征收标准依据</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>

					<td style="background-color:#e8edef;">用海性质</td>
					<td><input name="" type="text" class="scinput" value="商业用海" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">状态</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='yhai.jsp'" value="提交申请">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='yhai.jsp'" />
					</td>
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