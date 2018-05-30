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
					<a href="#">海洋功能区划管理</a>
				</li>
				<li>
					<a href="#">海籍历史资料管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">

			<div class="tools">
				<ul class="toolbar">
					<li>
						<a href="word_add.jsp"><span><img src="${contextPath}/images/seasProfession/t01.png" /></span>新增</a>
					</li>
					<li>
						<a href="word_change.jsp"><span><img src="${contextPath}/images/seasProfession/t02.png" /></span>修改</a>
					</li>
				</ul>
			</div>
			<table class="tablelist">
				<thead>
					<tr>
						<th><input name="" type="checkbox" value="" checked="checked" /></th>
						<th>序号<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
						<th>文档名称</th>
						<th>上传时间</th>
						<th>上传人</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input name="" type="checkbox" value="" /></td>
						<td>1</td>
						<td>单方事故</td>
						<td>2016-5-12</td>
						<td>张三</td>
						<td>
							<a href="download.jsp" class="tablelink">下载</a>
							<a href="prepare.jsp" class="tablelink">预览</a>
							<a href="#" class="tablelink"> 删除</a>
						</td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" /></td>
						<td>2</td>
						<td>谁说的话</td>
						<td>2016-8-01</td>
						<td>李四</td>
						<td>
							<a href="download.jsp" class="tablelink">下载</a>
							<a href="prepare.jsp" class="tablelink">预览</a>
							<a href="#" class="tablelink"> 删除</a>
						</td>
					</tr>
					<tr>
						<td><input name="" type="checkbox" value="" /></td>
						<td>3</td>
						<td>世纪花园</td>
						<td>2016-10-21</td>
						<td>王五</td>
						<td>
							<a href="download.jsp" class="tablelink">下载</a>
							<a href="prepare.jsp" class="tablelink">预览</a>
							<a href="#" class="tablelink"> 删除</a>
						</td>
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