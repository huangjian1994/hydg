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
	//var yhxzY=document.getElementById("yhxzY").value;
	//getDictionary("用海性质","yhxz",yhxzY);
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
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchZhxxList2.do";
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
//新增
function goJntzadd(){
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_goJntzaddJsp.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

//详情
function goJntzDetail(jntzID){
	document.getElementById("jntzID").value=jntzID;
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchJntzDetail.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//修改
function goUpdateJntz(jntzID){
	document.getElementById("jntzID").value=jntzID;
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_getJntzUpdate.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//删除
function goDeleteJntz(jntzID){
	if(confirm("确定删除该记录吗？")){
	document.getElementById("jntzID").value=jntzID;
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_deleteJntz.do";
	document.myForm.target="_self";
	document.myForm.submit();
	}
}

function goJntzadd(){
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_goJntzaddJsp.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goBack(){
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchZhxxList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
</script>
	</head>

	<body>
<form name="myForm" method="post" >
<input name="zsID" id="zsID" type="hidden" value="${zsID }" />
<input name="xmID" id="xmID" type="hidden" value="${xmID }" />
<input name="zsbh" id="zsbh" type="hidden" value="${zsbh }" />
<input name="jntzID" id="jntzID" type="hidden" value="" />
<input name="indexNum" id="indexNum" type="hidden" value="1" />

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
		
						
				<div class="tools">
					<ul class="toolbar">
						<li>
							<a href="javaScript:goJntzadd()" ><span>
							<img src="${contextPath}/images/seasProfession/t01.png" /></span>新增</a>
						</li>
						<li>
							<a href="javaScript:goBack()" ><span>
							<img src="${contextPath}/images/goback.png" /></span>返回</a>
						</li>
					</ul>
				</div>
				
				<table class="tablelist">
					<thead>
						<tr>
							<!-- 
							<th><input name="" type="checkbox" value="" style="border:0;"/></th>
							<td><input name="" type="checkbox" value="" style="border:0;"/></td>
							 -->
							<th>序号</th>
							<th>海域管理号</th>
							<th>海域使用权人</th>
							<th>海域使用金总额</th>
							<th>使用金缴纳方式</th>
							<th>通知日期</th>
							<th>开户行</th>
							<th width="15%">操作</th>
						</tr>
					</thead>
					<tbody>
					<!-- t.id,t.XMID,t.ZSID,t.HYGLH,t.HYSYQR,t.SYJZE,t.SYJJNFS,t.TZRQ,t.KHH -->
					<c:forEach items="${ zhxxList }" var="r" varStatus="j">
						<tr>
							<td>${ j.count }</td>
							<td><a href="#" onclick="zsxxDetail('${r[1] }','${r[2] }')" class="tablelink">${r[3] }</a></td>
							<td>${r[4] }</td>
							<td>${r[5] }元</td>
							<td>${r[6] }</td>
							<td>${r[7] }</td>
							<td>${r[8] }</td>
							<td>
								<a href="###" onclick="goJntzDetail('${r[0] }')" class="tablelink">详情</a>
								<a href="###" onclick="goUpdateJntz('${r[0] }')" class="tablelink">修改</a>
								<a href="###" onclick="goDeleteJntz('${r[0] }')" class="tablelink">删除</a>
								
							</td>
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