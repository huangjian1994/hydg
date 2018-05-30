<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		
		<script type="text/javascript" src="${contextPath}/js/mycharts/echarts-all.js"></script>
<script type="text/javascript">	
//查询
function search(){
	document.myForm.action="<%=basePath%>/statisticalAnalysis/statisticalAnalysis_fetchHyzyjzzbEwjcb.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function goTjt(){
	document.myForm.action="<%=basePath%>/statisticalAnalysis/statisticalAnalysis_fetchHyzyjzzb.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function goEwjcb(){
	document.myForm.action="<%=basePath%>/statisticalAnalysis/statisticalAnalysis_fetchHyzyjzzbEwjcb.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goHbtjt(){
	document.myForm.action="<%=basePath%>/statisticalAnalysis/statisticalAnalysis_fetchHyzyjzzbHbtj.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
</script>
	</head>

	<body>
<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li><a href="#">海域使用动态管理</a></li>
				<li><a href="#">统计分析</a></li>
				<li><a href="#">海域资源价值指标统计</a></li>
			</ul>
		</div>

		<div class="formbody">
		<div id="usual1" class="usual" >
			<div class="leftinfo1">
				<div class="itab" >
					<ul>
						<li><a href="###" onclick="goTjt()" >统计图</a></li>
						<li><a href="###" onclick="goHbtjt()" >对比统计图</a></li>
						<li><a href="###" onclick="goEwjcb()" class="selected">二维交叉表</a></li>
					</ul>
				</div>
			
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td width="20%">统计方式：</td>
						<td width="80%" style="text-align:left;">&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs1" type="radio" value="按用海批准年份" checked="checked" style="border:0;"/>按用海批准年份&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs2" type="radio" value="按项目位置" style="border:0;"/>按项目位置&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input name="cx" type="button" class="scbtn" value="查询" onclick="search()" />
						</td>
					</tr>
				</table><br />
			<input name="tjfs" type="hidden" id="tjfs"  value="${tjfxForm.tjfs }"/>
		<table class="tablelist">
			<thead>
				<tr>
					<th width="20%">
					<c:if test="${tjfxForm.tjfs =='按用海批准年份'}">年份</c:if>
					<c:if test="${tjfxForm.tjfs =='按项目位置'}">项目位置</c:if>
					</th>
					<th width="40%">预计就业人数（人）</th>
					<th width="40%">预计拉动区域经济产值（万元）</th>
					<!-- 
					<th>填海成本（万元/公顷）</th>
					<td>${r[3] }</td>
					 -->
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ ewjcbList }" var="r" varStatus="j">
				<tr>
					<td>${r[0] }</td>
					<td>${r[1] }
					<c:if test="${empty r[1] }">0</c:if>
					</td>
					<td>${r[2] }
					<c:if test="${empty r[2] }">0</c:if></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
			</div>
			
		</div>
		
	</div>
		
</form>
		
		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
			var tjfs = document.getElementById("tjfs").value;
			var selects = document.getElementsByName("tjfxForm.tjfs");
			for(var i=0;i<selects.length;i++){
				if(selects[i].value==tjfs){
					selects[i].checked=true;
					break;
				}
			}
			
		</script>

	</body>

</html>