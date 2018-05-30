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

//详情
function detailWjlx(wjlx){
	document.getElementById("wjlx").value = wjlx;
	document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_fetchHjfaTjDetail.do";
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
				<li>
					<a href="#">海域勘界管理</a>
				</li>
				<li>
					<a href="#">划界方案综合分析</a>
				</li>
			</ul>
		</div>
		<input name="wjlx" id="wjlx" value="" type="hidden" />		
		<div class="formbody">
			
		
		<div class="tools">
			<ul class="toolbar">
				<li>
					<a href="${contextPath}/seaDemarcation/seaDemarcation_fetchHjfa.do"><span>
					<img src="${contextPath}/images/ico05.png" width="24" height="24"/></span>材料管理</a>
				</li>
				<li>
					<a href="${contextPath}/jsp/seasProfession/jsp/hysydt/hykj/hykj_hjfa.jsp"><span>
					<img src="${contextPath}/images/goback.png"/></span>返回</a>
				</li>
			</ul>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th width="5%">序号</th>
					<th width="40%">海域勘界材料文件类型</th>
					<th width="10%">文件个数</th>
					<th width="15%">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${ hjfaList }" var="r" varStatus="j">
				<tr>
					<td>${j.count }</td>
					<td>${r[0] }</td>
					<td>${r[1] }</td>
					<td>
						<a href="###" onclick="detailWjlx('${r[0] }')"  class="tablelink">详情</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
</form>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

	</body>

</html>