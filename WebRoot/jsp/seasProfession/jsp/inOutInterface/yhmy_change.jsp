<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap.min.css" />
		<!--<link href="${contextPath}/jsp/seasProfession/css/style.css" rel="stylesheet" type="text/css" />-->
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/style.css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>

	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">内外部接口</a>
				</li>
				<li>
					<a href="#">用海面域定点顺序</a>
				</li>
				<li>
					<a href="#">用海面域定点顺序修改</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">宗海代码</td>
					<td><input name="" type="text" class="scinput" value="H123123123" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">坐标编号</td>
					<td><input name="" type="text" class="scinput" value="HJ123123" style="width:180px;height:20px;" /></td>

				</tr>
				<tr>
					<td style="background-color:#e8edef;">用海编号</td>
					<td><input name="" type="text" class="scinput" value="KK12312312" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">序号</td>
					<td><input name="" type="text" class="scinput" value="1231231" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">批文编号</td>
					<td><input name="" type="text" class="scinput" value="12333323" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='yhmy.jsp'" value="提交申请">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='yhmy.jsp'" />
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