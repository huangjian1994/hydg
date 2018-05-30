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
		
		<!-- 
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/seasProfession/jiaona.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap.min.css" />
		<script type="text/javascript" src="${contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
		 -->
<script type="text/javascript">
//代码
$(document).ready(function(){
	//var xmwzY=document.getElementById("xmwzY").value;
	//var yhxzY=document.getElementById("yhxzY").value;

	//getDictionary("项目位置","xmwz",xmwzY);
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
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchHysyjList3.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function resert(){
	document.getElementById("zsbh").value="";
	document.getElementById("xmmc").value="";
	document.getElementById("syqr").value="";
	document.getElementById("sfwlsyh1").checked=false;
	document.getElementById("sfwlsyh2").checked=false;
	
	//document.getElementById("yhxz").value="";
	//document.getElementById("xmwz").value="";
}

function goJnmx(xmID,zsID){
	document.getElementById("zsID").value=zsID;
	document.getElementById("xmID").value=xmID;
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchJnmx31.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goJnmx2(xmmc){
	//document.getElementById("zsID").value=zsID;
	//document.getElementById("xmID").value=xmID;
	if(xmmc==""){
		//alert("项目");
	}else{
		document.getElementById("xmmc").value=xmmc;
		document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchJnmx32.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
}
function goHysjyjn1(){
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchHysyjList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goHysjyjn2(){
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchHysyjList2.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goHysjyjn3(){
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchHysyjList3.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//证书详情
function zsxxDetail(xmID,zsID,zsbh){
	document.getElementById("xmID").value=xmID;
	document.getElementById("zsID").value=zsID;
	document.getElementById("zsbh").value=zsbh;
	//document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchZsxxDetail.do?indexNum=3";
	//document.myForm.target="_self";
	document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchZhxxDetailByHyglh.do";
	document.myForm.target="_blank";
	document.myForm.submit();
}
//项目详情
function xmxxDetail(xmID,xmmc){
	document.getElementById("xmID").value=xmID;
	document.getElementById("xmmc").value=xmmc;
	document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchYhxmDetaile.do";
	document.myForm.target="_blank";//_self
	//document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchXmxxDetail.do?indexNum=3";
	//document.myForm.target="_self";
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
				<a href="#">台账管理</a>
			</li>
		</ul>
	</div>
	<div class="formbody" >
		<div id="usual1" class="usual" >
			<div class="leftinfo1">
				<div class="itab" >
					<ul>
						<li><a href="###" onclick="goHysjyjn1()">已确权项目海域使用金缴纳</a></li>
						<li><a href="###" onclick="goHysjyjn2()">临时用海海域使用金缴纳</a></li>
						<li><a href="###" onclick="goHysjyjn3()" class="selected">海域使用金缴纳记录</a></li>
					</ul>
				</div>
				
					<div class="listtitle"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
					<table width="100%" align="center" style="text-align:center;">
							<tr>
								<td>海域管理号：</td>
								<td><input name="hysyywHysydtHysyjForm.zsbh" id="zsbh" type="text" value="${hysyywHysydtHysyjForm.zsbh }" style="width:180px;" /></td>
								<td>项目名称：</td>
								<td><input name="hysyywHysydtHysyjForm.xmmc" id="xmmc" type="text" value="${hysyywHysydtHysyjForm.xmmc }" style="width:180px;" /></td>
								</tr>
							<tr>
								<td>海域使用权人：</td>
								<td><input name="hysyywHysydtHysyjForm.syqr" id="syqr" type="text" value="${hysyywHysydtHysyjForm.syqr }" style="width:180px;" /></td>
								<td>是否临时项目：</td>
								<td>
									<input name="hysyywHysydtHysyjForm.sfwlsyh" id="sfwlsyh1" type="radio" value="是" style="border:0;"/>是
									<input name="hysyywHysydtHysyjForm.sfwlsyh" id="sfwlsyh2" type="radio" value="否" style="border:0;"/>否
								</td>
							</tr>
							<!-- 
							<tr>
								<td>用海性质：</td>
								<td>
									<select name="hysyywHysydtHysyjForm.yhxz" id="yhxz" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
									</select>
									<input name="yhxzY" id="yhxzY" type="hidden" value="${hysyywHysydtHysyjForm.yhxz }" />
								</td>
								<td>项目位置：</td>
								<td>
									<select name="hysyywHysydtHysyjForm.xmwz" id="xmwz" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
									</select>
									<input name="xmwzY" id="xmwzY" type="hidden" value="${hysyywHysydtHysyjForm.xmwz }" />
								</td>
							</tr>
							 -->
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
							<a href="${contextPath}/jsp/seasProfession/jsp/hysydt/syjzs/syjzs_add.jsp"><span><img src="${contextPath}/images/seasProfession/t01.png" /></span>新增</a>
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
							<th>缴纳日期</th>
							<th>海域管理号</th>
							<th>项目名称</th>
							<th>海域使用权人</th>
							<th>是否临时项目</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${ hysyjList }" var="r" varStatus="j">
						<tr><!-- t.zsid,t.xmid,t.jnrq, t.zsbh,t.xmmc,t.hysyqr,t.SFWLSYH -->
							<td>${ j.count }</td>
							<td>${r[2] }</td>
							<td><a href="#" onclick="zsxxDetail('${r[1]}','${r[0] }','${r[3] }')"  class="tablelink">${r[3] }</a></td>
							<td><a href="#" onclick="xmxxDetail('${r[1]}','${r[4] }')"  class="tablelink">${r[4] }</a></td>
							<td>${r[5] }</td>
							<td>${r[6] }</td>
							<td>
								<c:if test="${ empty r[0] && empty r[1] }">
								<a href="###" onclick="goJnmx2('${r[4]}')" class="tablelink">缴纳明细2</a>
								</c:if>
								<c:if test="${not empty r[1] && not empty r[0] }">
								<a href="#" onclick="goJnmx('${r[1]}','${r[0] }')" class="tablelink">缴纳明细</a>
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