<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>综合查询</title>
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
					<a href="#">海域综合查询</a>
				</li>
				<li>
					<a href="#">资源可视化</a>
				</li>
			</ul>
		</div>

		<div class="formbody">

			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="90%" align="center" style="text-align:center;" align="center">
					<tr align="center">
						<td align="right">区域：</td>
						<td align="left">
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="崇明县" selected="selected">崇明县</option>
								<option value="宝山区">宝山区</option>
								<option value="浦东新区">浦东新区</option>
								<option value="奉贤区">奉贤区</option>
								<option value="金山区">金山区</option>
							</select>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input name="" type="button" class="scbtn1" value="查询" />
						</td>
					</tr> 
				</table>
			</div><br />

			<div><img src="${contextPath}/images/seasProfession/zhcx/shhy.png" width="1130px" style="margin-top:4px;"></div>
		</div>

	</body>

</html>