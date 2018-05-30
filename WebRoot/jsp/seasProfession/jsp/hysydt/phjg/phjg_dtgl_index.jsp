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
//代码
$(document).ready(function(){
	var xmwzY=document.getElementById("xmwzY").value;
	getDictionary("项目位置","xmwz",xmwzY);
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

//全选
function checkAll(){
	var cb = document.getElementById("cb");
	var chks = document.getElementsByName("chk");
	if(cb.checked==true){
		for(var i=0;i<chks.length;i++){
			chks[i].checked=true;
		}
	}else{
		for(var i=0;i<chks.length;i++){
			chks[i].checked=false;
		}
	}
}

//查询
function search(){
	document.myForm.action="<%=basePath%>/business/business_fetchYhxmdtgl.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//查看该项目的监管信息
function goJG(xmID,jgXmmc){
	document.getElementById("xmID").value = xmID;
	document.getElementById("jgXmmc").value = jgXmmc;
	document.myForm.action="<%=basePath%>/business/business_fetchXmDtjgList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function resert(){
	document.getElementById("yhxmmc").value="";
	document.getElementById("xmwz").value="";
}
//项目详情
function xmxxDetail(xmID){
	document.getElementById("xmID").value = xmID;
	document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchYhxmDetaile.do";
	document.myForm.target="_blank";
	document.myForm.submit();
}
</script>
</head>
<body>
<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li><a href="#">海域使用动态管理</a></li>
				<li>
					<a href="#">用海项目批后监管</a>
				</li>
				<li>
					<a href="#">用海项目动态管理</a>
				</li>
			</ul>
		</div>
		<input name="xmID" id="xmID" value="" type="hidden" />
		<input name="jgXmmc" id="jgXmmc" value="" type="hidden" />
		
		
		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td style="height:35px;">用海项目名称：</td>
						<td><input name="hysyywHysydtYhxmForm.yhxmmc" id="yhxmmc" value="${hysyywHysydtYhxmForm.yhxmmc }"  type="text" style="width:180px;" /></td>
						<td>项目位置：</td>
						<td>
						<select name="hysyywHysydtYhxmForm.xmwz" id="xmwz" style="width:180px;">
								<option value="">-请选择-</option>
						</select>
						<input name="xmwzY" id="xmwzY" type="hidden" value="${hysyywHysydtYhxmForm.xmwz }" style="width:200px;" />
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
				<a href="${contextPath}/jsp/seasProfession/jsp/hysydt/phjg/phjg_dtgl_addZ.jsp">
				<span><img src="${contextPath}/images/t01.png"/></span>新增</a>
			</li>
		</ul>
	</div>
		<table class="tablelist">
			<thead>
				<tr>
					<!--  
					<th><input type="checkbox" id ="cb" onclick="checkAll()" style="border:0;"/></th>
					<td><input type="checkbox" name="chk" id="chk${ j.count }" value="${r[0]}" style="border:0;"/></td>
					-->
					<th>序号</th>
					<th>用海项目名称</th>
					<th>用海面积</th>
					<th>海域使用权人</th>
					<th>项目位置</th>
					<th>监管记录数</th>
					<th width="8%">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${ phjgDtglList }" var="r" varStatus="j">
				<tr>
					<td>${j.count}</td>
					<td><a href="###" onclick="xmxxDetail('${r[0] }')" class="tablelink">${r[1]}</a></td>
					<td>${r[2]}公顷</td>
					<td>${r[3]}</td>
					<td>${r[4]}</td>
					<td>${r[5]}</td>
					<td>
						<a href="###" onclick="goJG('${r[0] }','${r[1]}')" class="tablelink">监管</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		</div>
	</form>	
	<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
</body>

</html>