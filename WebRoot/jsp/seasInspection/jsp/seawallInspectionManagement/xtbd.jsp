<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>系统比对</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>

	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海塘巡查管理</a>
				</li>
				<li>
					<a href="#">系统比对</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>

						<td>所在区域：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="崇明县">崇明县</option>
								<option value="宝山区">宝山区</option>
								<option value="浦东新区">浦东新区</option>
								<option value="奉贤区">奉贤区</option>
								<option value="金山区">金山区</option>
							</select>
						</td>
						<td>任务编号：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>任务名称：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
					</tr>
					<tr>
						<td colspan="6">
							<input name="" type="button" class="scbtn1" onclick="addCompare();" value="新增" />
							<input name="" type="button" class="scbtn1" value="查询" />
							<input name="" type="reset" class="scbtn1" value="重置" />
						</td>
					</tr>

				</table>
			</div>
			<br />
			<table class="tablelist">
				<thead>
					<tr>
						<th style="width:25px;"></th>
						<th>项目名称</th>
						<th>海域名称</th>
						<th>海域用途</th>
						<th>用海方式</th>
						<th>用海范围</th>
						<th>用海面积(平方米)</th>
						<th>使用期限</th>
						<th>是否已缴纳海域使用金</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${compareResults}" var="c" varStatus="i">
						<tr>
							<td>${i.index + 1 }</td>
							<td>${c.projectName }</td>
							<td>海域名称</td>
							<td>
								<c:choose>
									<c:when test="${c.seaAreaUse[0] eq '1' }">
										<font color="green">一致</font>
									</c:when>
									<c:otherwise>
										<font color="red">不一致</font>
									</c:otherwise>
								</c:choose>
								<%--  - ${c.seaAreaUse[1]} - ${c.seaAreaUse[2] } --%>
							</td>
							<td>
								<c:choose>
									<c:when test="${c.seaUseWay[0] eq '1' }">
										<font color="green">一致</font>
									</c:when>
									<c:otherwise>
										<font color="red">不一致</font>
									</c:otherwise>
								</c:choose>
								<%-- - ${c.seaUseWay[1]} - ${c.seaUseWay[2] } --%>
							</td>
							<td>
								<c:choose>
									<c:when test="${c.seaUseRange[0] eq '1' }">
										<font color="green">一致</font>
									</c:when>
									<c:otherwise>
										<font color="red">不一致</font>
									</c:otherwise>
								</c:choose>
								<%-- - ${c.seaUseRange[1]} - ${c.seaUseRange[2] } --%>
							</td>
							<td>
								<c:choose>
									<c:when test="${c.seaUseAreage[0] eq '1' }">
										<font color="green">一致</font>
									</c:when>
									<c:otherwise>
										<font color="red">不一致</font>
									</c:otherwise>
								</c:choose>
								<%-- - ${c.seaUseAreage[1]} - ${c.seaUseAreage[2] } --%>
							</td>
							<td>
								<c:choose>
									<c:when test="${c.seaUseDeadline[0] eq '1' }">
										<font color="green">一致</font>
									</c:when>
									<c:otherwise>
										<font color="red">不一致</font>
									</c:otherwise>
								</c:choose>
								<%-- - ${c.seaUseDeadline[1]} - ${c.seaUseDeadline[2] } --%>
							</td>
							<td>
								<c:choose>
									<c:when test="${c.isPay[0] eq '1' }">
										<font color="green">一致</font>
									</c:when>
									<c:otherwise>
										<font color="red">不一致</font>
									</c:otherwise>
								</c:choose>
								<%-- - ${c.isPay[1]} - ${c.isPay[2] } --%>
							</td>
							<td>
								<a href="javascript:void(0)" onclick="loadCompareResult('${c.id}')" class="tablelink">查看</a>
								&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)" onclick="delCompareResult('${c.id}')" class="tablelink">删除</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pagin"  align="center">
				${pageBean }
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
				$('.tablelist tbody tr:odd').addClass('odd');
			})
			function addCompare(){
				location = "${contextPath}/seaPatorl/swPatorl_toCompare.do";
			}
			function loadCompareResult(id){
				location = "${contextPath}/seaPatorl/swPatorl_loadCompareResult.do?compare.id=" + id;
			}

			function delCompareResult(id){
				var r = confirm("确定删除此记录？");
				if (r) {
					location = "${contextPath}/seaPatorl/swPatorl_delCompareResult.do?compare.id=" + id;
				}
			}
		</script>
	</body>

</html>