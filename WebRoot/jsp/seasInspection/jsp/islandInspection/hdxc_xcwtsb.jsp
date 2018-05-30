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

//修改
function reportUpdate(prID){
	document.getElementById("prID").value=prID;
	document.myForm.action="<%=basePath%>/patorlReport/patorlReport_getReportUpdate.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//删除
function deleteReport(prID){
	if(confirm("确定删除该记录吗？")){
		document.getElementById("prID").value=prID;
		document.myForm.action="<%=basePath%>/patorlReport/patorlReport_deleteReport.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
}
//详情
function reportDetail(prID){
	document.getElementById("prID").value=prID;
	document.myForm.action="<%=basePath%>/patorlReport/patorlReport_reportDetail.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

//查询
function goSearch(){
	document.myForm.action="<%=basePath%>/patorlReport/patorlReport_fetchPatorlReport.do";
	document.myForm.target="_self";
	document.myForm.submit();
	
}

//重置
function goCz(){
	document.getElementById("wtlb").value="";
	document.getElementById("ssqx").value="";
	document.getElementById("dwmc").value="";
	document.getElementById("sbr").value="";
	document.getElementById("sbrq").value="";
	document.getElementById("sbzt").value="";
}

//上报？？
			
		</script>
	</head>
	<body>
	<form name="myForm" method="post" >
	<input name="prID" id="prID" type="hidden" value="" />
	
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海域海岛巡查</a>
				</li>
				<li>
					<a href="#">巡查问题上报</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>问题类别：</td>
						<td>
							<select name="patorlSearchForm.wtlb" id="wtlb" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="海岛">海岛</option>
							</select>
						</td>
						<td>所属区县：</td>
						<td>
							<select name="patorlSearchForm.ssqx" id="ssqx" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="崇明县">崇明县</option>
								<option value="宝山区">宝山区</option>
								<option value="浦东新区">浦东新区</option>
								<option value="奉贤区">奉贤区</option>
								<option value="金山区">金山区</option>
							</select>
						</td>
						<td>上报单位名称：</td>
						<td><input name="patorlSearchForm.dwmc" id="dwmc" type="text" class="dfinput1" value="${patorlSearchForm.dwmc }" style="width:180px;" /></td>
						
					</tr>
					<tr>
						<td>上报日期：</td>
						<td><input name="patorlSearchForm.sbrq" id="sbrq" type="text" class="dfinput1" value="${patorlSearchForm.sbrq }" style="width:180px;" onclick="WdatePicker()" readonly="readonly" /></td>
						<td>上报人：</td>
						<td><input name="patorlSearchForm.sbr" id="sbr" type="text" class="dfinput1" value="${patorlSearchForm.sbr }" style="width:180px;" /></td>
						<td>问题状态：</td>
						<td>
							<select name="patorlSearchForm.sbzt" id="sbzt" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="未解决">未解决</option>
								<option value="已上报">已上报</option>
								<option value="未上报">未上报</option>
							</select>
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
						<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/hdxc_xcwtsb_add.jsp"><span><img src="${contextPath}/images/seasInspection/t01.png" /></span>新增</a>
					</li>	
					<!-- 	
					<li>
						<a href="#"><span><img src="${contextPath}/images/seasInspection/t02.png" /></span>批量上报</a>
					</li>
					 -->
				</ul>
			</div>
			<table class="tablelist">
				<thead>
					<tr>
						<th><input type="checkbox" id="cb" onclick="checkAll()" /></th>
						<th>序号</th>
						<th>问题类别</th>
						<th>发生地点所属区县</th>
						<th>上报单位名称</th>
						<th>上报日期</th>
						<th>上报人</th>
						<th>问题状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach items="${ reportList }" var="r" varStatus="j">
					<tr>
						<td><input type="checkbox" name="chk" id="chk" value="" /></td>
						<td>${j.count }</td>
						<td>${r.wtlb }</td>
						<td>${r.ssqx }</td>
						<td>${r.sbrdwmc }</td>
						<td>${r.sbsj }</td>
						<td>${r.sbrxm }</td>
						<td>${r.sbzt }</td>
						<td>
							<!-- 
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/hyhdxc_index.jsp" class="tablelink">上报</a>
							 -->
							<a href="###" onclick="reportDetail('${r.id }')" class="tablelink">详情</a>
							<a href="###" onclick="reportUpdate('${r.id }')" class="tablelink">修改</a>
							<a href="###" onclick="deleteReport('${r.id }')" class="tablelink">删除</a>
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