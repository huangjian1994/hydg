<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>

	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li><a href="#">海域使用动态管理</a></li>
				<li>
					<a href="#">海域勘界管理</a>
				</li>
				<li>
					<a href="#">矢量数据管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>海域名称：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>所在区县：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
					</tr>
					<tr>
						<td colspan="4">
							<input name="" type="button" class="scbtn1" value="查询" />
							<input name="" type="reset" class="scbtn1" value="重置" />
						</td>
					</tr>
				</table>
			</div>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="" type="checkbox" value="" checked="checked" /></th>
					<th>海域名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif"/></i></th>
					<th>所在区县</th>
					<th>用海面积(平方米)</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>外高桥港区</td>
					<td>浦东新区</td>
					<td>300</td>
					<td>
						<a href="sjzs.jsp" class="tablelink">数据展示</a>
						<a href="dtzs.jsp" class="tablelink">地图展示</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>上海滨江森林公园</td>
					<td>金山区</td>
					<td>100</td>
					<td>
						<a href="sjzs.jsp" class="tablelink">数据展示</a>
						<a href="dtzs.jsp" class="tablelink">地图展示</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>长江口区域</td>
					<td>奉贤区</td>
					<td>300</td>
					<td>
						<a href="sjzs.jsp" class="tablelink">数据展示</a>
						<a href="dtzs.jsp" class="tablelink">地图展示</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>崇头边滩保留区</td>
					<td>崇明县</td>
					<td>100</td>
					<td>
						<a href="sjzs.jsp" class="tablelink">数据展示</a>
						<a href="dtzs.jsp" class="tablelink">地图展示</a>
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

	</body>

</html>