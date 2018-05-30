<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<title>数据备份与恢复</title>
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
			function add_yonghu() {
				open("Yhgl_add.html", "rightFrame");
			}
		</script>
		<style>
			strong {
				font-size: 18px;
				color: #FF0000;
			}
		</style>
	</head>

	<body>

		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">系统管理</a>
				</li>
				<li>
					<a href="#">数据备份与恢复</a>
				</li>
			</ul>
		</div>

		<table class="filetable3">

			<tbody>

				<tr height="40px" style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:center" width="20%"><input type="button" value="数据恢复" class="btn" style="width:137px;height:35px;" /></td>
					<td style=" border:1px solid #b5bfc4;text-align:center" width="10%">一共有<strong>4</strong>个备份文件</td>
				</tr>

			</tbody>

		</table>

		<br/>

		<table class="tablelist">
			<thead>
				<tr>
					<th width="5%">序号<i class="sort"><img src="${contextPath}/images/seasInspection/px.gif" /></i></th>
					<th width="10%">文件类型</th>
					<th width="15%">文件名（年月日时分秒）</th>
					<th width="10%">操作</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>1</td>
					<td>文件</td>
					<td>20150207 11000.dmp</td>
					<td>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>

				<tr>
					<td>2</td>
					<td>文件</td>
					<td>20150208 11000.dmp</td>
					<td>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>

				<tr>
					<td>3</td>
					<td>文件</td>
					<td>20150209 11000.dmp</td>
					<td>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>

				<tr>
					<td>4</td>
					<td>文件</td>
					<td>20150210 11000.dmp</td>
					<td>
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