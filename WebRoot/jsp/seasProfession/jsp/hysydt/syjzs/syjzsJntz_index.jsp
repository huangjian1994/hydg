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
//代码
$(document).ready(function(){
	var yhxzY=document.getElementById("yhxzY").value;
	getDictionary("用海性质","yhxz",yhxzY);
});
//加载字典
function getDictionary(keyZ,selectID,historyZ){
	$.ajax({		  		
		type: "post",
		dataType:"json",
		url: "${contextPath}/business/business_fetchDictionary.do",
		data: "dictionary.key="+keyZ,
		success: function(d){
			for(var i=0;i<d.length;i++){
				//alert(d);
				if(d[i].dm==historyZ){
					$("<option value= '"+d[i].dm+"' selected>"+d[i].value+"</option>").appendTo("#"+selectID);
				}else{
					$("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
				}
				}
		}
	});	  
}
//查询
function search(){
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchZhxxList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function resert(){
	document.getElementById("yhxmmc").value="";
	document.getElementById("hysyqr").value="";
	document.getElementById("hyglh").value="";
	document.getElementById("yhxz").value="";
}

//证书详情
function zsxxDetail(xmID,zsID){
	document.getElementById("xmID").value=xmID;
	document.getElementById("zsID").value=zsID;
	document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchZhxxDetailByHyglh.do";
	document.myForm.target="_blank";
	document.myForm.submit();
}
//项目详情
function xmxxDetail(xmID){
	document.getElementById("xmID").value=xmID;
	document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchYhxmDetaile.do";
	document.myForm.target="_blank";//_self
	document.myForm.submit();
}
//新增
function goJntzadd(xmID,zsID,zsbh){
	document.getElementById("xmID").value=xmID;
	document.getElementById("zsID").value=zsID;
	document.getElementById("zsbh").value=zsbh;
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_goJntzaddJsp.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function goJntz1(){
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchZhxxList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function goJntz2(){
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchZhxxList2.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function goJntzList(xmID,zsID,zsbh){
	document.getElementById("xmID").value=xmID;
	document.getElementById("zsID").value=zsID;
	document.getElementById("zsbh").value=zsbh;
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchJnjlByXmid.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
</script>
	</head>

	<body>
<form name="myForm" method="post" >
<input name="zsID" id="zsID" type="hidden" value="" />
<input name="xmID" id="xmID" type="hidden" value="" />
<input name="zsbh" id="zsbh" type="hidden" value="" />
<input name="xmmc" id="xmmc" type="hidden" value="" />

	<div class="place">
		<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">海域使用动态管理</a></li>
			<li>
				<a href="#">海域使用金征收管理</a>
			</li>
			<li>
				<a href="#">海域使用金缴纳通知</a>
			</li>
		</ul>
	</div>
	<div class="formbody" >
		<div id="usual1" class="usual" >
			<div class="leftinfo1">
				<div class="itab" >
					<ul>
						<li><a href="###" onclick="goJntz1()" class="selected">用海项目缴纳通知</a></li>
						<li><a href="###" onclick="goJntz2()">缴纳通知记录</a></li>
					</ul>
				</div>
			
				<div class="listtitle"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
					<table width="100%" align="center" style="text-align:left;">
							<tr>
								<td>海域管理号：</td>
								<td><input name="searchForm.hyglh" id="hyglh" type="text" value="${searchForm.hyglh }" style="width:180px;" /></td>
								<td>项目名称：</td>
								<td><input name="searchForm.yhxmmc" id="yhxmmc" type="text" value="${searchForm.yhxmmc }" style="width:180px;" /></td>
								</tr>
							<tr>
								<td>用海性质：</td>
								<td>
									<select name="searchForm.yhxz" id="yhxz" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
									</select>
									<input name="yhxzY" id="yhxzY" type="hidden" value="${searchForm.yhxz }" />
								</td>
								<td>海域使用权人：</td>
								<td><input name="searchForm.hysyqr" id="hysyqr" type="text" value="${searchForm.hysyqr }" style="width:180px;" /></td>
							</tr>
							<tr>
								<td colspan="4">
									<input name="查询" type="button" class="scbtn" value="查询" onclick="search()" />
									<input name="重置" type="button" class="scbtn" value="重置" onclick="resert()" />
								</td>
							</tr>
						</table>
				</div><br />
				
				<table class="tablelist">
					<thead>
						<tr>
							<!-- 
							<th><input name="" type="checkbox" value="" style="border:0;"/></th>
							<td><input name="" type="checkbox" value="" style="border:0;"/></td>
							 -->
							<th>序号</th>
							<th>海域管理号</th>
							<th>项目名称</th>
							<th>用海性质</th>
							<th>海域使用权人</th>
							<th>使用金缴纳方式</th>
							<th>缴纳通知记录数</th>
							<th width="6%">操作</th>
						</tr>
					</thead>
					<tbody>
					<!-- t.id,t.xmid,t.hyglh,y.yhxmmc,t.yhxz,'',y.hysyqr, -->
					<c:forEach items="${ zhxxList }" var="r" varStatus="j">
						<tr>
							<td>${ j.count }</td>
							<td><a href="#" onclick="zsxxDetail('${r[1] }','${r[0] }')" class="tablelink">${r[2] }</a></td>
							<td><a href="#" onclick="xmxxDetail('${r[1] }')" class="tablelink">${r[3] }</a></td>
							<td>${r[5] }</td>
							<td>${r[6] }</td>
							<td>${r[9] }</td>
							<td>${r[7] }</td>
							<td>
								<c:if test="${r[7]=='0' }">
								<a href="###" onclick="goJntzadd('${r[1] }','${r[0] }','${r[2] }')" class="tablelink">新增</a>
								</c:if>
												
								<c:if test="${r[7]!='0' }">
								<a href="###" onclick="goJntzList('${r[1] }','${r[0] }','${r[2] }')" class="tablelink">查看</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				
			
		</div>
	</div>
</form>
<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
		

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		

	</body>

</html>