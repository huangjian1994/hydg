<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海洋自然保护区管理</title>
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
					<a href="#">海洋自然保护区管理</a>
				</li>
				<li>
					<a href="#">保护区基础信息管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>保护区名称：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="保护区一">保护区一</option>
								<option value="保护区二">保护区二</option>
							</select>
						</td>

						<td>管辖单位：</td>
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

		<div class="tools">
			<ul class="toolbar">
				<li>
					<a href="jcxx_add.jsp"><span><img src="${contextPath}/images/seasProfession/t01.png" /></span>新增</a>
				</li>
				<li>
					<a href="jcxx_change.jsp"><span><img src="${contextPath}/images/seasProfession/t02.png" /></span>修改</a>
				</li>
			</ul>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th>序号</th>
					<th>保护区名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
					<th>保护区总面积(公顷)</th>
					<th>主管部门</th>
					<th>级别</th>
					<th>行政区域</th>
					<th>分类名称</th>
                    <th>批建时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
            <c:forEach items="${hysydtHyzrbhqs}" var="bhq" varStatus="j">
				<tr>
                    <td>${j.count}</td>
                    <td>${bhq.st_bhqmc}</td>
                    <td>${bhq.nm_zmj}</td>
                    <td>${bhq.st_zgbm}</td>
                    <td>${bhq.st_jbmc}</td>
                    <td>${bhq.st_xzqy}</td>
                    <td>${bhq.st_flmc}</td>
                    <td>${bhq.dt_pjsj}</td>

					<td>
						<a href="weizhang.jsp" class="tablelink">地图展示</a>
					</td>
				</tr>
            </c:forEach>
			</tbody>
		</table>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		</div>
		</div>
	</body>
</html>