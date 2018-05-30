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
					<a href="#">执行情况监督</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>功能区名称：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="长江口区域">长江口区域</option>
								<option value="杭州湾区域">杭州湾区域</option>
								<option value="外高桥港区">外高桥港区</option>
								<option value="崇头边滩保留区">崇头边滩保留区</option>
								<option value="上海滨江森林公园">上海滨江森林公园</option>
								<option value="东海大桥海上风电场区">东海大桥海上风电场区</option>
							</select>
						</td>
						<td>功能区划类型：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="农渔业">农渔业</option>
								<option value="港口航运">港口航运</option>
								<option value="工业与城镇用海">工业与城镇用海</option>
								<option value="矿产与能源">矿产与能源</option>
								<option value="旅游休闲娱乐">旅游休闲娱乐</option>
								<option value="海洋保护">海洋保护</option>
								<option value="特殊利用">特殊利用</option>
								<option value="保留区">保留区</option>
							</select>
						</td>
						<td>管理单位：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="上海市海洋局">上海市海洋局</option>
								<option value="崇明分局">崇明分局</option>
							</select>
						</td>
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
		<div style="padding-left:20px;margin-bottom:10px;font-size:16px;">注意：近期不符合海洋功能区划的有2个，不符合用海面积的2个，审批通过10个，不通过3个。</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="" type="checkbox" value="" checked="checked" /></th>
					<th>功能区名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
					<th>功能区划类型</th>
					<th>规定区划面积(平方米)</th>
					<th>实际用海面积(平方米)</th>
					<th>是否符合区划要求</th>
					<th>是否新增</th>
					<th>是否减少</th>
					<th>审核结果</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>外高桥港区</td>
					<td>港口航运</td>
					<td>800</td>
					<td>900</td>
					<td>是</td>
					<td>是</td>
					<td>否</td>
					<td>通过</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>上海滨江森林公园</td>
					<td>旅游休闲娱乐</td>
					<td>500</td>
					<td>400</td>
					<td>是</td>
					<td>否</td>
					<td>是</td>
					<td>通过</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>外高桥港区</td>
					<td>港口航运</td>
					<td>800</td>
					<td>900</td>
					<td>是</td>
					<td>是</td>
					<td>否</td>
					<td>通过</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>东海大桥海上风电场区</td>
					<td>矿产与能源</td>
					<td>700</td>
					<td>800</td>
					<td>是</td>
					<td>是</td>
					<td>否</td>
					<td>通过</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>崇头边滩保留区</td>
					<td>保留区</td>
					<td>300</td>
					<td>300</td>
					<td>是</td>
					<td>否</td>
					<td>否</td>
					<td>通过</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>上海滨江森林公园</td>
					<td>旅游休闲娱乐</td>
					<td>500</td>
					<td>400</td>
					<td>是</td>
					<td>否</td>
					<td>是</td>
					<td>通过</td>
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