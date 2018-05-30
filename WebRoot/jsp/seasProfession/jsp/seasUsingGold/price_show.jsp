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
					<a href="#">使用金征收管理</a>
				</li>
				<li>
					<a href="#">使用金征收标准</a>
				</li>
			</ul>
		</div>
		<div class="tools">
			<ul class="toolbar">
				<li>
					<a href="zhengshoujin-add.jsp"><span><img src="${contextPath}/images/seasProfession/t01.png" /></span>新增</a>
				</li>
				<li>
					<a href="#"><span><img src="${contextPath}/images/seasProfession/t02.png" /></span>修改</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<table class="tablelist">
				<thead>
					<tr>
						<th><input name="" type="checkbox" value="" checked="checked" /></th>
						<th>海域名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
						<th>海域使用权价格(万元/平方千米)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input name="" type="checkbox" value="" /></td>
						<td>外高桥港区</td>
						<td>5</td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" /></td>
						<td>机构户外</td>
						<td>8</td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" /></td>
						<td>饿哦日语</td>
						<td>3</td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" /></td>
						<td>花多少了符</td>
						<td>6</td>
					</tr>
				</tbody>
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