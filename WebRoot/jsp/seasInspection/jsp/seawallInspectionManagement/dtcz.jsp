<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/select.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>

	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海塘巡查管理</a>
				</li>
				<li>
					<a href="#">地图操作</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<!--<div class="leftinfo1">
<table width="98%" align="center" style="text-align:center;">
  <tr>
    <td><input name="" type="button" class="scbtn1" value="放大"/></td>
    <td><input name="" type="button" class="scbtn1" value="缩小"/></td>
    <td><input name="" type="button" class="scbtn1" value="漫游"/></td>
    <td><input name="" type="button" class="scbtn1" value="距离量测"/></td>

  </tr>
</table></div><br />-->

			<table class="tablelist">
				<tr>
					<td><img src="${contextPath}/images/seasInspection/clgj/clgj.PNG" width="100%" height="100%" /></td>
					<td>
						<input name="" type="button" class="scbtn1" value="放大" />
						<input name="" type="button" class="scbtn1" value="缩小" />
						<input name="" type="button" class="scbtn1" value="漫游" />
						<input name="" type="button" class="scbtn1" value="距离量测" />
					</td>
				</tr>
			</table>

			<script type="text/javascript">
				$("#usual1 ul").idTabs();
			</script>

			<script type="text/javascript">
				$('.tablelist tbody tr:odd').addClass('odd');
			</script>

		</div>

	</body>

</html>