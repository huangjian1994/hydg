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

<script type="text/javascript">
$(function(){
    hebingRows(1);
})
function hebingRows(col){
    var trs = $("table tr");
    var rows = 1;
    for(var i=trs.length;i>0;i--){
        var cur = $($(trs[i]).find("td")[col]).text();
        var next = $($(trs[i-1]).find("td")[col]).text();
        if(cur==next){
            rows++;
            $($(trs[i]).find("td")[col]).remove();
        } else {
            $($(trs[i]).find("td")[col]).attr("rowspan",rows);
            rows=1;
        }
    }
}



</script>
	</head>

	<body>
<form name="myForm" method="post" >
<input name="zsbzID" id="zsbzID" type="hidden" value="" />


	<div class="place">
		<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">海域使用动态管理</a></li>
			<li>
				<a href="#">海域使用金征收管理</a>
			</li>
			<li>
				<a href="#">海域使用金征收标准</a>
			</li>
		</ul>
	</div>
	<div class="formbody" >
	<div>
		<div class="tools" style="float: left;">
			<ul class="toolbar">
				<li>
					<a href="<%=basePath%>/seaUseGold/seaUseGold_fetchHysyjZsbz.do"><span>
					<img src="${contextPath}/images/f02.png" /></span>标准维护</a>
				</li>
			</ul>
		</div>
		<div style="float: right;">单位：万元/公顷</div>
	</div>
		
				<table class="tablelist">
					
						<tr>
							<th>序号</th>
							<th colspan="2">用海类别</th>
							<th colspan="6">海域等别</th>
							<th>征收方式</th>
						</tr>
						<tr>
							<th></th>
							<th>A</th>
							<th>B</th>
							<th>一等</th>
							<th>二等</th>
							<th>三等</th>
							<th>四等</th>
							<th>五等</th>
							<th>六等</th>
							<th></th>
						</tr>
					<tbody>
					<!-- id,yhlxa,yhlxb, hydb,jnfs,jnbz,dw  -->
					<c:forEach items="${ zsbzList }" var="r" varStatus="j">
						<tr>
							<td>${ j.count }</td>
							<td>${r[1] }</td>
							<td>${r[2] }</td>
							<c:if test="${ not empty r[9] }">
								<td colspan="6">${r[9] }</td>
							</c:if>
							<c:if test="${  empty r[9] }">
								<c:if test="${r[3]==r[4] && r[3]==r[5] && r[3]==r[6] && r[3]==r[7] && r[3]==r[8]}">
									<td colspan="6">${r[3] }</td>
								</c:if>
								<c:if test="${r[3]!=r[4] && r[3]!=r[5] && r[3]!=r[6] && r[3]!=r[7] && r[3]!=r[8] }">
									<td>${r[3] }</td>
									<td>${r[4] }</td>
									<td>${r[5] }</td>
									<td>${r[6] }</td>
									<td>${r[7] }</td>
									<td>${r[8] }</td>
								</c:if>
							</c:if>
							<td>${r[11] }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

	</div>
</form>
<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
		

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		

	</body>

</html>