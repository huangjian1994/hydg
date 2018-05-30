<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/mycharts/echarts-all.js"></script>
<script type="text/javascript">
function goHysyxzt1(){
	document.myForm.action="<%=basePath%>/statisticalAnalysis/statisticalAnalysis_fetchHysyxzt.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function goHysyxzt2(){
	document.myForm.action="<%=basePath%>/statisticalAnalysis/statisticalAnalysis_fetchHysyxzt2.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function goHysyxzt3(){
	document.myForm.action="<%=basePath%>/statisticalAnalysis/statisticalAnalysis_fetchHysyxzt3.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//查询
function search(){
	document.myForm.action="<%=basePath%>/statisticalAnalysis/statisticalAnalysis_fetchHysyxzt3.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

</script>
	</head>

	<body>
<form name="myForm" method="post" >
	<div class="place">
		<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">海域使用动态管理</a></li>
			<li><a href="#">统计分析</a></li>
			<li><a href="#">海域使用现状图</a></li>
		</ul>
	</div>
	
	<div class="formbody" >
		<div id="usual1" class="usual" >
			<div class="leftinfo1">
			<div class="itab" >
				<ul>
					<li><a href="###" onclick="goHysyxzt1()" >地图展示</a></li>
					<li><a href="###" onclick="goHysyxzt2()" >统计图</a></li>
					<li><a href="###" onclick="goHysyxzt3()" class="selected">统计表</a></li>
				</ul>
			</div>
			
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td width="20%">统计方式：</td>
						<td width="80%" style="text-align:left;">&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs0" type="radio" value="按用海批准年份" checked="checked" style="border:0;"/>按用海批准年份&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs1" type="radio" value="按初始登记年份" style="border:0;"/>按初始登记年份&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs2" type="radio" value="按配号年份" style="border:0;"/>按配号年份&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs3" type="radio" value="按用海类型" style="border:0;"/>按用海类型&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs4" type="radio" value="按用海方式" style="border:0;"/>按用海方式&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs5" type="radio" value="按项目位置" style="border:0;"/>按项目位置&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs6" type="radio" value="按批准级别" style="border:0;"/>按批准级别
						</td>
					</tr>
					<tr>
						<td>统计要素：</td>
						<td style="text-align:left;">&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjys" id="tjys1" type="radio" value="证书数量" checked="checked" style="border:0;"/>证书数量&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjys" id="tjys2" type="radio" value="用海项目数量" style="border:0;"/>用海项目数量&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjys" id="tjys3" type="radio" value="宗海面积" style="border:0;"/>宗海面积&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjys" id="tjys4" type="radio" value="海域使用金应征收总额" style="border:0;"/>海域使用金应征收总额&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjys" id="tjys5" type="radio" value="海域使用金实际征收总额" style="border:0;"/>海域使用金实际征收总额&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjys" id="tjys6" type="radio" value="占用岸线" style="border:0;"/>占用岸线
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input name="查询" type="button" class="scbtn" value="查询" onclick="search()" />
						</td>
					</tr>
				</table>
				<input name="tjys" type="hidden" id="tjys"  value="${tjfxForm.tjys }"/>
				<input name="tjfs" type="hidden" id="tjfs"  value="${tjfxForm.tjfs }"/>
				<br />
				
				
		<table class="tablelist">
			<thead>
				<tr>
					<th width="10%">序号</th>
					<th width="40%">${tjfxForm.tjfs }</th>
					<th width="40%">${tjfxForm.tjys }</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ tjbList }" var="r" varStatus="j">
				<tr>
					<td>${j.count }</td>
					<td>${r[0] }</td>
					<td>${r[1] }${jldw }</td>
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
			var tjys = document.getElementById("tjys").value;

			var selects = document.getElementsByName("tjfxForm.tjfs");
			for(var i=0;i<selects.length;i++){
				if(selects[i].value==tjfs){
					selects[i].checked=true;
					break;
				}
			}

			var selects2 = document.getElementsByName("tjfxForm.tjys");
			for(var i=0;i<selects2.length;i++){
				if(selects2[i].value==tjys){
					selects2[i].checked=true;
					break;
				}
			}
		</script>
	</body>
</html>