﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<title>权限管理</title>
		<link href="${contextPath}/css/style_tt.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>

		<script language="javascript">
			$(function() {
				//导航切换
				$(".disklist li").click(function() {
					$(".disklist li.selected").removeClass("selected")
					$(this).addClass("selected");
				})
			})
		</script>
		<script language="javascript">
			function add_juese() {
				open("Qxgl_add.html", "rightFrame");
			}
		</script>
	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">系统管理</a>
				</li>
				<li>
					<a href="#">权限管理</a>
				</li>
			</ul>
		</div>

		<table class="filetable3">

			<tbody>

				<tr>
					<td width="30%"></td>
					<td style="text-align:center" width="10%">角色名：</td>
					<td style="text-align:left" width="15%"><input type="text" class="scinput02" style="width:100px" /></td>
					<td width="30%"></td>
				</tr>

				<tr>
					<td></td>
					<td style="text-align:right; height:30px;"><input type="button" value="查询" class="btn02" style="width:60px;height:20px;" /></td>
					<td style="text-align:left;height:30px;"><input type="button" value="新增" class="btn02" style="width:60px;height:20px;" onclick="add_juese()" /></td>
					<td></td>
				</tr>

			</tbody>

		</table>

		<br/>

		<table class="tablelist">
			<thead>
				<tr>
					<th width="5%">序号<i class="sort"><img src="${contextPath}/images/seasInspection/px.gif" /></i></th>
					<th width="20%">角色名称</th>
					<th width="20%">操作</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>1</td>
					<td>业务人员</td>
					<td>
						<a href="Qxgl_add2.jsp" class="tablelink"> 修改</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>

				<tr>
					<td>2</td>
					<td>一般访问人员</td>
					<td>
						<a href="Qxgl_add2.jsp" class="tablelink"> 修改</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>

				<tr>
					<td>3</td>
					<td>管理员</td>
					<td>
						<a href="Qxgl_add2.jsp" class="tablelink"> 修改</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>

				<tr>
					<td>3</td>
					<td>普通管理员</td>
					<td>
						<a href="Qxgl_add2.jsp" class="tablelink"> 修改</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>

			</tbody>
		</table>

		<div class="pagin">
			<div class="message">共<i class="blue">4</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
			<ul class="paginList">
				<li class="paginItem">
					<a href="javascript:;"><span class="pagepre"></span></a>
				</li>
				<li class="paginItem current">
					<a href="javascript:;">1</a>
				</li>
				<li class="paginItem" onclick="">
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
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</body>

</html>