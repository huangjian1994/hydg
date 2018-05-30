<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海域海岛巡查</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>		
		<script type="text/javascript">

		</script>
	</head>
	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海域海岛巡查</a></li>
				<li><a href="#">巡查问题上报</a></li>
			</ul>
		</div>
		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>检查方式：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="定期" selected="selected">定期</option>
								<option value="不定期">不定期</option>
							</select>
						</td>
						<td>巡查范围：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="崇明县" selected="selected">崇明县</option>
								<option value="宝山区">宝山区</option>
								<option value="浦东新区">浦东新区</option>
								<option value="奉贤区">奉贤区</option>
								<option value="金山区">金山区</option>
							</select>
						</td>
						<td>问题分类：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="巡视" selected="selected">巡视</option>
								<option value="巡航">巡航</option>
								<option value="监察">监察</option>
								<option value="检查">检查</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>上报状态：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="已上报" selected="selected">已上报</option>
								<option value="未上报">未上报</option>
							</select>
						</td>
						<td>填表日期：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>上报人：</td>
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
			<br/>
			<div class="tools">
				<ul class="toolbar">
					<li>
						<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcjhgl_add.jsp"><span><img src="${contextPath}/images/seasInspection/t01.png" /></span>新增</a>
					</li>
				</ul>
			</div>
			<table class="tablelist">
				<thead>
					<tr>

						<th>序号</th>
						<th>问题分类</th>
						<th>检测海岛</th>
						<th>上报人</th>
						<th>检查方式</th>
						<th>巡查范围</th>
						<th>上报状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>巡视</td>
						<td>鸡骨礁</td>
						<td>黄翔</td>
						<td>定期</td>
						<td>崇明县</td>
						<td>已上报</td>
						<td>
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/hyhdxc_index.jsp" class="tablelink">上报</a>
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_sbdetail.jsp" class="tablelink">详情</a>
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_sbxg.jsp" class="tablelink">修改</a>
							<a href="#" class="tablelink">删除</a>
						</td>
					</tr>
				</tbody>


			</table>			
		</div>
	</body>
</html>