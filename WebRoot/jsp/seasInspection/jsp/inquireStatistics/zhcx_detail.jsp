<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>巡查信息</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript">
			function loadFlows(){
				location = "${contextPath}/seaPatorl/swPatorl_loadPatrolFlowsByEventsn.do?spfw.st_eventsn=${spfw.st_eventsn}";
			}
		</script>
	</head>

	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置</span>
			<ul class="placeul">
				<li><a href="#">查询统计</a></li>
				<li><a href="#">综合查询</a></li>
				<li><a href="#">巡查信息</a></li>
			</ul>
		</div>
		<div class="mainbox">
			<div class="leftinfo1">
				<div class="listtitle3">
					<img src="${contextPath}/images/seasInspection/i02.png" width="25" height="25" />详情
				</div>
				<div id="tab1" class="tabson">
					<table width="100%" style="text-align:center;" class="tablelist2" >
						<col style="width: 15%" />
						<col style="width: 35%" />
						<col style="width: 15%" />
						<col style="width: 35%" />
						<tr>
							<td style="background-color:#e8edef;">类型</td>
							<td>
								<c:choose>
									<c:when test="${spfw.nm_dhtype == '1' }">堤防</c:when>
									<c:when test="${spfw.nm_dhtype == '2' }">海塘</c:when>
								</c:choose>
							</td>
							<td style="background-color:#e8edef;">任务号</td>
							<td>${spfw.st_eventsn }</td>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">状态</td>
							<td>
								<c:choose>
									<c:when test="${spfw.nm_state == '1' }">发现</c:when>
									<c:when test="${spfw.nm_state == '2' }">立案</c:when>
									<c:when test="${spfw.nm_state == '3' }">派发</c:when>
									<c:when test="${spfw.nm_state == '4' }">处理</c:when>
									<c:when test="${spfw.nm_state == '5' }">结案</c:when>
								</c:choose>
							</td>
							<td style="background-color:#e8edef;">发现时间</td>
							<td>${spfw.dt_discovertime }</td>
						</tr>

						<tr>
							<td style="background-color:#e8edef;">立案时间</td>
							<td>${spfw.dt_createtime }</td>
							<td style="background-color:#e8edef;">立案备注</td>
							<td>${spfw.st_createnote }</td>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">反映来源</td>
							<td>${spfw.st_claimsource }</td>
							<td style="background-color:#e8edef;">反映人</td>
							<td>${spfw.st_claimperson }</td>

						</tr>
						<tr>
							<td style="background-color:#e8edef;">联系电话</td>
							<td>${spfw.st_phoneno }</td>
							<td style="background-color:#e8edef;">范围</td>
							<td>${spfw.st_name }</td>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">问题类别</td>
							<td>${spfw.st_esclass }(大类) - ${spfw.st_ebclass }(小类)</td>
							<td style="background-color:#e8edef;">发生地址</td>
							<td>${spfw.st_address }</td>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">问题描述</td>
							<td>${spfw.st_description }</td>
							<td style="background-color:#e8edef;">问题来源</td>
							<td>${spfw.st_eventsource }</td>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">事件类别</td>
							<td>${spfw.st_eventtype }</td>
							<td style="background-color:#e8edef;">发现时间</td>
							<td>${spfw.dt_dispatchtime }</td>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">处理时间</td>
							<td>${spfw.dt_solvingtime }</td>
							<td style="background-color:#e8edef;">确认时间</td>
							<td>${spfw.dt_checktime }</td>
						</tr>
						<tr>
							<td colspan="4" style="text-align:center;">
								<input name="fh" type="button" value="流程" class="scbtn1" onclick="loadFlows()" />
								<input name="fh" type="button" value="返回" class="scbtn1" onclick="history.go(-1)" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>

</html>