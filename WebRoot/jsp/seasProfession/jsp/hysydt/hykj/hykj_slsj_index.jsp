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
<script type="text/javascript">
//查询
function search(){
	document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_fetchSlsj.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//重置
function resert(){
	document.getElementById("sjlx").value ="";
	document.getElementById("slsjmc").value ="";
}

//删除
function deleteSlsj(slsjID){
	if(confirm("确定删除该记录吗？")){
		document.getElementById("slsjID").value = slsjID;
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_deleteSlsj.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
}


//详情
function detailDetail(slsjID){
	document.getElementById("slsjID").value = slsjID;
	document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_fetchSlsjDetail.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

//修改
function goUpdateSlsj(slsjID){
	document.getElementById("slsjID").value = slsjID;
	document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_getUpdateSlsj.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function goGszh(slsjID){
	document.getElementById("slsjID").value = slsjID;
	document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_goGszh.do";
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
				<li><a href="#">海域勘界管理</a></li>
				<li><a href="#">矢量数据管理</a></li>
			</ul>
		</div>
		
		<input name="slsjID" id="slsjID" value="" type="hidden" />
		<input name="fileName" id="fileName" value="" type="hidden" />

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td width="20%">数据文件名：</td>
						<td width="30%">
							<input name="hysyywHygnqhHykjSlsj.slsjmc" id="slsjmc" type="text" value="${hysyywHygnqhHykjSlsj.sjwjm }" style="width:180px;" />
						</td>
						<td width="20%">矢量数据类型：</td>
						<td width="30%">
							<select name="hysyywHygnqhHykjSlsj.sjlx" id="sjlx" style="width:180px;">
								<option value="">-请选择-</option>
								<option value="CAD">CAD</option>
								<option value="SHP">SHP</option>
								<option value="GeoDatabase">GeoDatabase</option>
							</select>
							<input name="sjlxY" id="sjlxY" type="hidden" value="${hysyywHygnqhHykjSlsj.sjlx }" />
						</td>
						
					</tr>
					<tr>
						<td colspan="4">
							<input name="查询" type="button" class="scbtn" value="查询" onclick="search()" />
							<input name="重置" type="button" class="scbtn" value="重置" onclick="resert()" />
						</td>
					</tr>
				</table>
			</div><br />
		
		<div class="tools">
			<ul class="toolbar">
				<li>
					<a href="${contextPath}/jsp/seasProfession/jsp/hysydt/hykj/hykj_slsj_add.jsp"><span>
					<img src="${contextPath}/images/t01.png"/></span>新增</a>
				</li>
				<li>
					<a href="${contextPath}/jsp/seasProfession/jsp/hysydt/hykj/hykj_slsj_gszh.jsp"><span>
					<img src="${contextPath}/images/icon05.png" width="24px" height="24px"/></span>格式转换</a>
				</li>
			</ul>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th width="5%">序号</th>
					<th width="15%">矢量数据名称</th>
					<th width="10%">矢量数据类型</th>
					<!-- 
					<th width="10%">数据保存路径</th><td>${r.sjbclj}</td>
					 -->
					<th width="10%">数据链接</th>
					<th width="10%">数据来源</th>
					<th width="10%">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${ slsjList }" var="r" varStatus="j">
				<tr>
					<td>${j.count}</td>
					<td>${r.slsjmc}</td>
					<td>${r.sjlx}</td>
					<td>${r.sjlj}</td>
					<td>${r.sjly}</td>
					<td>
						<a href="###" onclick="detailDetail('${r.id}')" class="tablelink">详情</a>
						<a href="###" onclick="goUpdateSlsj('${r.id}')" class="tablelink">修改</a>
						<a href="###" onclick="deleteSlsj('${r.id}')" class="tablelink">删除</a>
						<!-- 
						<a href="${contextPath}/jsp/seasProfession/jsp/hysydt/hykj/hykj_slsj_dtzs.jsp" class="tablelink">地图展示</a>
						<a href="###" onclick="goGszh('${r.id}')" class="tablelink">格式转换</a>
					 	-->
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</form>
	<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
		
		
		<script type="text/javascript">
		
		if(document.getElementById("sjlxY").value==""){
			document.getElementById("sjlx").value = "";
		}else{
			document.getElementById("sjlx").value = document.getElementById("sjlxY").value;
		}
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

	</body>

</html>