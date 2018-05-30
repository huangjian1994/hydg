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
					<a href="#">海岸线管理</a>
				</li>
				<li>
					<a href="#">海籍历史资料管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="80%" class="table_6">
					<tr>
						<td>项目名称：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>

						<td>使用权人：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>证书编号：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
					</tr>
					<tr>
						<td>用海性质：</td>
						<td>
							<select name="" id="" style="width:180px;">
								<option value="全部">全部</option>
							</select>
						</td>

						<td>发证级别：</td>
						<td>
							<label><input type="checkbox" checked="checked" class="checkbox"/>国家级</label>
							<label><input type="checkbox" class="checkbox"/>省级</label>
							<label><input type="checkbox" class="checkbox"/>市级</label>
							<label><input type="checkbox" class="checkbox"/>区县级</label>
						</td>
						<td>项目位置：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
					</tr>
					<tr>
						<td colspan="6">
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
					<a href="word_add.jsp"><span><img src="${contextPath}/images/seasProfession/t01.png" /></span>新增</a>
				</li>
				<li>
					<a href="word_add.jsp"><span><img src="${contextPath}/images/seasProfession/t03.png" /></span>删除</a>
				</li>
			</ul>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="" type="checkbox" value="" checked="checked" /></th>
					<th>项目名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
					<th>使用权人</th>
					<th>证书信息</th>
					<th>发证级别</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>人工岛工程</td>
					<td>招商局开发有限公司</td>
					<td>
						<p>1、071100026</p>
						<p>2、071100066</p>
					</td>
					<td>国家级</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>珊瑚礁国家级自然保护区内旅游用海</td>
					<td>海底世界旅游有限公司</td>
					<td>
						<p>1、071100045</p>
					</td>
					<td>国家级</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>东通道工程</td>
					<td>路桥建设投资总公司</td>
					<td>
						<p>1、071100030</p>
					</td>
					<td>国家级</td>
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
		</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</body>

</html>