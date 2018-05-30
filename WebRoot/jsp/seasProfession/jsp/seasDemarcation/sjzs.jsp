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
				<li>
					<a href="#">海域勘界管理</a>
				</li>
				<li>
					<a href="#">多媒体信息管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="90%" align="center" style="text-align:center;">
					<tr>
						<td>多媒体名称：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>所属部门：</td>
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
		<div class="tools">
			<ul class="toolbar">
				<li>
					<a href="sjzs_add.jsp"><span><img src="${contextPath}/images/seasProfession/t01.png"/></span>新增</a>
				</li>
				<li>
					<a href="sjzs_change.jsp"><span><img src="${contextPath}/images/seasProfession/t02.png"/></span>修改</a>
				</li>
			</ul>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="" type="checkbox" value="" checked="checked" /></th>
					<th>项目名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif"/></i></th>
					<th>矢量数据</th>
					<th>数据类型</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>外高桥港区</td>
					<td>东经121.67度北纬39.88度</td>
					<td>CAD</td>
					<td>
						<a href="#" onclick="docheck()" class="tablelink">数据格式转换</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>长江口区域</td>
					<td>东经121.34度北纬39.56度</td>
					<td>SHP</td>
					<td>
						<a href="#" onclick="docheck()" class="tablelink">数据格式转换</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>杭州湾区域</td>
					<td>东经121.69度北纬39.38度</td>
					<td>CAD</td>
					<td>
						<a href="#" onclick="docheck()" class="tablelink">数据格式转换</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>崇头边滩保留区</td>
					<td>东经121.67度北纬39.88度</td>
					<td>GeoDatabase</td>
					<td>
						<a href="#" onclick="docheck()" class="tablelink">数据格式转换</a>
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

		<script type="text/javascript">
			function docheck() {
				window.open("change.jsp", "displayWindow", "menubar=yes,width=260,height=200");
			}
		</script>


	</body>

</html>