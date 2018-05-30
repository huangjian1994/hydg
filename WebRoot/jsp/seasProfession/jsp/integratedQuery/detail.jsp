<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href=".${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href=".${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src=".${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src=".${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src=".${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src=".${contextPath}/js/editor/kindeditor.js"></script>

	</head>

	<body>
		<table class="tablelist">
			<thead>
				<tr>
					<th>联系人姓名</th>
					<th>联系人电话</th>
					<th>项目名称</th>
					<th>使用性质</th>
					<th>用海起始日期</th>
					<th>用海终止日期</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>张晓涛</td>
					<td>12564387954</td>
					<td>浅海贝壳</td>
					<td>经营性</td>
					<td>2012-5-6</td>
					<td>2012-12-30</td>
				</tr>
				<tr>
					<td>来福</td>
					<td>15369784658</td>
					<td>浅海贝壳</td>
					<td>经营性</td>
					<td>2013-5-4</td>
					<td>2014-6-9</td>
				</tr>
				<tr>
					<td>万福明</td>
					<td>14986738957</td>
					<td>浅海贝壳</td>
					<td>经营性</td>
					<td>2012-4-6</td>
					<td>2015-6-8</td>
				</tr>
				<tr>
					<td>程云燕</td>
					<td>14987653269</td>
					<td>浅海贝壳</td>
					<td>经营性</td>
					<td>2012-6-7</td>
					<td>2014-5-6</td>
				</tr>
				<tr>		
					<td>程云增</td>
					<td>14563289756</td>
					<td>浅海贝壳</td>
					<td>经营性</td>
					<td>2012-8-12</td>
					<td>2015-6-8</td>

				</tr>
				<tr>
					<td>谢冠明</td>
					<td>14523697856</td>
					<td>浅海贝壳</td>
					<td>经营性</td>
					<td>2013-5-6</td>
					<td>2016-7-8</td>
				</tr>
			</tbody>
		</table>
		<div class="pagin">
			<div class="message">共<i class="blue">10</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
			<ul class="paginList">
				<li class="paginItem">
					<a href="javascript:;"><span class="pagepre"></span></a>
				</li>
				<li class="paginItem">
					<a href="javascript:;">1</a>
				</li>
				<li class="paginItem current">
					<a href="javascript:;">2</a>
				</li>
				<li class="paginItem">
					<a href="javascript:;">3</a>
				</li>
				<li class="paginItem">
					<a href="javascript:;">4</a>
				</li>
				<li class="paginItem">
					<a href="javascript:;">5</a>
				</li>
				<li class="paginItem more">
					<a href="javascript:;">...</a>
				</li>
				<li class="paginItem">
					<a href="javascript:;">10</a>
				</li>
				<li class="paginItem">
					<a href="javascript:;"><span class="pagenxt"></span></a>
				</li>
			</ul>
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