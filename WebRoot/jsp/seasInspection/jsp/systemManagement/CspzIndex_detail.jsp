<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<title>参数配置</title>
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

	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">系统管理</a>
				</li>
				<li>
					<a href="#">参数配置</a>
				</li>
				<li>
					<a href="#">参数配置详情</a>
				</li>
			</ul>
		</div>

		<table class="filetable3">
			<tbody>
				<tr>
					<td style="text-align:center;">参数名称：建设单位</td>
				</tr>
			</tbody>
		</table>

		<table class="tablelist">
			<thead>
				<tr>
					<th width="40%">序号</th>
					<th width="60%">参数值名称</th>
				</tr>

			</thead>

			<tbody>

				<tr>
					<td style="text-align:center;" width="10%">1</td>
					<td style="text-align:center" width="20%">指挥部</td>
				</tr>

				<tr>
					<td style="text-align:center;" width="10%">2</td>
					<td style=" text-align:center" width="20%">政治部</td>
				</tr>

				<tr>
					<td style="text-align:center;" width="10%">3</td>
					<td style="text-align:center" width="20%">警保部</td>
				</tr>

				<tr>
					<td style="text-align:center;" width="10%">4</td>
					<td style="text-align:center" width="20%">纪委</td>
				</tr>

				<tr>
					<td style="text-align:center;" width="10%">5</td>
					<td style="text-align:center" width="20%">审计室</td>
				</tr>

				<tr>
					<td style="text-align:center;" colspan="2" width="10%">
						<input type="button" value="返回" class="btn02" style="width:60px;height:20px;" onclick="javascript:history.back(-1);" />
					</td>
				</tr>

			</tbody>
		</table>

	</body>

</html>