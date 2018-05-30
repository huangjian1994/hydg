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

//新增
function goAdd(){
	document.myForm.action="<%=basePath%>/patorlReport/patorlReport_goAddXcxxfk.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//修改
function xcxxfkUpdate(fkID){
	document.getElementById("fkID").value=fkID;
	document.myForm.action="<%=basePath%>/patorlReport/patorlReport_getXcxxfkForUpdate.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//删除
function deleteXcxxfk(fkID){
	if(confirm("确定删除该记录吗？")){
		document.getElementById("fkID").value=fkID;
		document.myForm.action="<%=basePath%>/patorlReport/patorlReport_deleteXcxxfk.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
}
//详情
function xcxxfkDetail(fkID){
	document.getElementById("fkID").value=fkID;
	document.myForm.action="<%=basePath%>/patorlReport/patorlReport_fetchXcxxfkDetail.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

//查询
function goSearch(){
	document.myForm.action="<%=basePath%>/patorlReport/patorlReport_fetchPatorlFk.do";
	document.myForm.target="_self";
	document.myForm.submit();
	
}

//重置
function goCz(){
	document.getElementById("xcdw").value="";
	document.getElementById("xcqsrq").value="";
	document.getElementById("xcjsrq").value="";
	document.getElementById("fknrfl").value="";
	document.getElementById("fkrxm").value="";
	document.getElementById("fkrq").value="";
}

			
		</script>
	</head>
	<body>
	<form name="myForm" method="post" >
	<input name="fkID" id="fkID" type="hidden" value="" />
	<input name="xcjhID" id="xcjhID" type="hidden" value="${xcjhID }" />
	
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
						<td>巡查单位：</td>
						<td>
							<input name="patorlSearchForm.xcdw" id="xcdw" type="text" class="dfinput1" value="${patorlSearchForm.xcdw }" style="width:180px;" />
						</td>
						<td>巡查起始日期：</td>
						<td>
							<input name="patorlSearchForm.xcqsrq" id="xcqsrq" type="text" class="dfinput1" value="${patorlSearchForm.xcqsrq }" style="width:180px;" onclick="WdatePicker()" readonly="readonly" />
						</td>
						<td>巡查结束日期：</td>
						<td><input name="patorlSearchForm.xcjsrq" id="xcjsrq" type="text" class="dfinput1" value="${patorlSearchForm.xcjsrq }" style="width:180px;" onclick="WdatePicker()" readonly="readonly" /></td>
						
					</tr>
					<tr>
						<td>反馈内容分类：</td>
						<td><input name="patorlSearchForm.fknrfl" id="fknrfl" type="text" class="dfinput1" value="${patorlSearchForm.fknrfl }" style="width:180px;" /></td>
						<td>反馈人姓名：</td>
						<td><input name="patorlSearchForm.fkrxm" id="fkrxm" type="text" class="dfinput1" value="${patorlSearchForm.fkrxm }" style="width:180px;" /></td>
						<td>反馈日期：</td>
						<td>
							<input name="patorlSearchForm.fkrq" id="fkrq" type="text" class="dfinput1" value="${patorlSearchForm.fkrq }" style="width:180px;" onclick="WdatePicker()" readonly="readonly" />
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<input name="cx" type="button" class="scbtn1" value="查询" onclick="goSearch()"/>
							<input name="cz" type="button" class="scbtn1" value="重置" onclick="goCz()"/>
						</td>
					</tr>
				</table>
			</div>
			<br/>
			<div class="tools">
				<ul class="toolbar">
					<li>
						<a href="###" onclick="goAdd()"><span><img src="${contextPath}/images/seasInspection/t01.png" /></span>新增</a>
					</li>
					<li>
						<a href="${contextPath}/patorlReport/patorlReport_fetchXcjhList.do"><span><img src="${contextPath}/images/goback.png" /></span>返回</a>
					</li>	
					
				</ul>
			</div>
			<table class="tablelist">
				<thead>
					<tr>
						<th><input type="checkbox" id="cb" onclick="checkAll()" /></th>
						<th>序号</th>
						<th>巡查单位</th>
						<th>巡查起始日期</th>
						<th>巡查结束日期</th>
						
						<th>反馈内容分类</th>
						<th>反馈人姓名</th>
						<th>反馈日期</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach items="${ xcfkList }" var="r" varStatus="j">
					<tr>
						<td><input type="checkbox" name="chk" id="chk" value="" /></td>
						<td>${j.count }</td>
						<td>${r.fillingunit }</td>
						<td>${r.begintime }</td>
						<td>${r.endtime }</td>
						
						<td>${r.classify }</td>
						<td>${r.feedbackname }</td>
						<td>${r.feedbacktime }</td>
						<td>
							<!-- 
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/hyhdxc_index.jsp" class="tablelink">上报</a>
							 -->
							<a href="###" onclick="xcxxfkDetail('${r.id }')" class="tablelink">详情</a>
							<a href="###" onclick="xcxxfkUpdate('${r.id }')" class="tablelink">修改</a>
							<a href="###" onclick="deleteXcxxfk('${r.id }')" class="tablelink">删除</a>
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