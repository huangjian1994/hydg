<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">巡查考评管理</a>
				</li>
				<li>
					<a href="#">巡查人员考核评价</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
				<table width="90%" align="center" style="text-align:center;">
					<tr>
						<td>巡查单位：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="第一支队">第一支队</option>
								<option value="第二支队">第二支队</option>
								<option value="崇明第一分队">崇明第一分队</option>
								<option value="奉贤第一分队">奉贤第一分队</option>
							</select>

						</td>
						<td>巡查人：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>巡查时间段：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:100px;" /> 至
							<input name="" type="text" class="dfinput1" value="" style="width:100px;" /></td>
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
		<div style="float:right"><input name="" type="button" class="scbtn1" value="导出表" />
			<input name="" type="button" class="scbtn1" value="打印" /></div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="" type="checkbox" value="" checked="checked" /></th>
					<th>姓名<i class="sort"><img src="${contextPath}/images/seasInspection/px.gif" /></i></th>
					<th>所属巡查单位</th>
					<th>巡查办理数(个)</th>
					<th>重要性(重要/一般)</th>
					<th>响应度(及时/不及时)</th>s
					<th>考核分数</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>李四</td>
					<td>崇明第一分队</td>
					<td>6</td>
					<td>3/3</td>
					<td>6/0</td>
					<td>92</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>张三</td>
					<td>第一支队</td>
					<td>10</td>
					<td>6/4</td>
					<td>8/2</td>
					<td>90</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>王五</td>
					<td>第二支队</td>
					<td>9</td>
					<td>8/1</td>
					<td>7/2</td>
					<td>95</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>李四</td>
					<td>崇明第一分队</td>
					<td>6</td>
					<td>3/3</td>
					<td>6/0</td>
					<td>92</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>张三</td>
					<td>第一支队</td>
					<td>10</td>
					<td>6/4</td>
					<td>8/2</td>
					<td>90</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>王五</td>
					<td>第二支队</td>
					<td>9</td>
					<td>8/1</td>
					<td>7/2</td>
					<td>95</td>
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