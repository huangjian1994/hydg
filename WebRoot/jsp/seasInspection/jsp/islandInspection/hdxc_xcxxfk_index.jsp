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
			function checkAll() {
				var cb = document.getElementById("cb");
				var chks = document.getElementsByName("chk");
				if(cb.checked == true) {
					for(var i = 0; i < chks.length; i++) {
						chks[i].checked = true;
					}
				} else {
					for(var i = 0; i < chks.length; i++) {
						chks[i].checked = false;
					}
				}
			}

//反馈
function goXcxxfk(xcjhID){
	document.getElementById("xcjhID").value=xcjhID;
	document.myForm.action="<%=basePath%>/patorlReport/patorlReport_fetchPatorlFk.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

//查询
function goSearch(){
	document.myForm.action="<%=basePath%>/patorlReport/patorlReport_fetchXcjhList.do";
	document.myForm.target="_self";
	document.myForm.submit();
	
}

//重置
function goCz(){
	document.getElementById("xcjhmc").value="";
	//document.getElementById("ssqx").value="";
	
}

//详情
function xcjhDetail(jhId){
    document.getElementById("jhId").value = jhId;
    document.myForm.action="<%=basePath%>/seaIslandPatrol/seaIslandPatrol_xcjhShDetail.do";
    document.myForm.target="_self";
    document.myForm.submit();
}

//上报？？
			
		</script>
	</head>
	<body>
	<form name="myForm" method="post" >
	<input name="xcjhID" id="xcjhID" type="hidden" value="" />
	<input name="jhId" id="jhId" value="" type="hidden" />
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海域海岛巡查</a>
				</li>
				<li>
					<a href="#">执法信息反馈</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>巡查计划名称：</td>
						<td>
							<input name="patorlSearchForm.xcjhmc" id="xcjhmc" type="text" class="dfinput1" value="${patorlSearchForm.xcjhmc }" style="width:180px;" />
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<input name="cx" type="button" class="scbtn1" value="查询" onclick="goSearch()"/>
							<input name="cz" type="button" class="scbtn1" value="重置" onclick="goCz()"/>
						</td>
					</tr>
				</table>
			</div>
			<br/>
			<!-- 
			<div class="tools">
				<ul class="toolbar">
					<li>
						<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/hdxc_xcxxfk_add.jsp"><span><img src="${contextPath}/images/seasInspection/t01.png" /></span>新增</a>
					</li>	
				</ul>
			</div>
			 -->
			<table class="tablelist">
				<thead>
					<tr>
						<th><input type="checkbox" id="cb" onclick="checkAll()" /></th>
						<th>序号</th>
						<th>计划任务名称</th>
						<th>填表单位</th>
						<th>领队姓名</th>
						<th>巡查方式</th>
						<th>制定人姓名</th>
						<th>制定日期</th>
						<th>计划推送状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${ xcjhList }" var="r" varStatus="j">
					<tr>
						<td><input type="checkbox" name="chk" id="chk" value="" /></td>
						<td>${j.count }</td>
						<td>${r.patrolname }</td>
						<td>${r.fillingdw }</td>
						<td>${r.leadername }</td>
						<td>${r.inspectionmode }</td>
						<td>${r.drafetdate }</td>
						<td>${r.drafepeoplename }</td>
						<td>${r.planstatus }</td>
						<td>
							<a href="###" onclick="xcjhDetail('${r.id }')" class="tablelink">详情</a>
						
							<a href="###" onclick="goXcxxfk('${r.id }')" class="tablelink">反馈</a>
						</td>
					</tr>
				</c:forEach>
					
				</tbody>
				
			</table>			
		</div>
		</form>
		<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
	</body>
</html>