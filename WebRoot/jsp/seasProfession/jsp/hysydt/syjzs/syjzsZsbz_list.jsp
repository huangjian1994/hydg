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
	var yhlxaY=document.getElementById("yhlxaY").value;
	var yhlxbY=document.getElementById("yhlxbY").value;
	//var hydbY=document.getElementById("hydbY").value;
	var zsfsY=document.getElementById("zsfsY").value;

	getDictionary("使用金征收标准用海类别A","yhlxa",yhlxaY);
	getDictionary("使用金征收标准用海类别B","yhlxb",yhlxbY);
	//getDictionary("海域等别","hydb",hydbY);
	getDictionary("征收方式","zsfs",zsfsY);
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
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchHysyjZsbz.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//
function goBack(){
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchZsbzIndex.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function resert(){
	document.getElementById("yhlxa").value="";
	document.getElementById("yhlxb").value="";
	document.getElementById("hydb").value="";
	document.getElementById("zsfs").value="";
}


//详情
function goZsbzDetail(zsbzID){
	document.getElementById("zsbzID").value=zsbzID;
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchZsbzDetail.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//修改
function goZsbzUpdate(zsbzID){
	document.getElementById("zsbzID").value=zsbzID;
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_getZsbzUpdate.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//删除
function goZsbzDelete(zsbzID){
	if(confirm("确定删除该记录吗？")){
	document.getElementById("zsbzID").value=zsbzID;
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_deleteZsbz.do";
	document.myForm.target="_self";
	document.myForm.submit();
	}
}
//获取用海类型B
function getYhlxb(){
	$("option","#yhlxb").remove();
	var yhlxa = document.getElementById("yhlxa").value;
	$.ajax({	  		
			type: "post",
			dataType:"json",
			url: "${contextPath}/business/business_fetchZsbzYhlxa.do",
			data: "dictionary.key="+yhlxa+"&yhlxa="+yhlxa,
			success: function(d){
				$("<option value= ''>"+"-请选择-"+"</option>").appendTo("#yhlxb");
				//alert(d.length);
				if(d.length>1){
				for(var i=0;i<d.length;i++){
					$("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#yhlxb");
				}
				}
			}
		});
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
		<div class="leftinfo1">
			<div class="listtitle3"><img src="${contextPath}/images/ico06.png" width="25" height="25" />条件查询</div>
		<table width="100%" align="center" style="text-align:left;">
			<tr>
				<td width="20%" style="background-color:#f5f8fa;">用海类别A：</td>
				<td width="30%">
				<select name="searchForm.yhlxa" id="yhlxa" onchange="getYhlxb()" style="width:180px;">
					<option value="">-请选择-</option>
				</select>
				<input name="yhlxaY" id="yhlxaY" type="hidden" value="${searchForm.yhlxa }" />
				</td>
				<td width="20%" style="background-color:#f5f8fa;">用海类别B：</td>
				<td width="30%">
					<select name="searchForm.yhlxb" id="yhlxb" style="width:180px;">
						<option value="">-请选择-</option>
					</select>
				<input name="yhlxbY" id="yhlxbY" type="hidden" value="${searchForm.yhlxb }" />
				</td>
			</tr>
			<tr>
				<!-- 
				<td style="background-color:#f5f8fa;">海域等别：</td>
				<td>
					<select name="searchForm.hydb" id="hydb" style="width:180px;">
						<option value="">-请选择-</option>
					</select>
					<input name="hydbY" id="hydbY" type="hidden" value="${searchForm.hydb }" />
				</td>
				 -->
				<td style="background-color:#f5f8fa;">征收方式：</td>
				<td >
					<select name="searchForm.zsfs" id="zsfs" style="width:180px;height:25px;">
						<option value="">-请选择-</option>
					</select>
					<input name="zsfsY" id="zsfsY" type="hidden" value="${searchForm.zsfs }" />
				</td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="4">
					<input name="查询" type="button" class="scbtn" value="查询" onclick="search()" />
					<input name="重置" type="button" class="scbtn" value="重置" onclick="resert()" />
				</td>
			</tr>
		</table>
		</div>
		<br />
		
	<div>
		<div class="tools" style="float: left;">
			<ul class="toolbar" >
				<li>
					<a href="${contextPath}/jsp/seasProfession/jsp/hysydt/syjzs/syjzsZsbz_add.jsp"><span>
					<img src="${contextPath}/images/t01.png" /></span>新增</a>
				</li>
				<li>
					<a href="javaScript:goBack()" ><span>
					<img src="${contextPath}/images/goback.png" /></span>返回</a>
				</li>
			</ul>
		</div>
		<div style="float: right;">单位：万元/公顷</div>
	</div>
		
		
				<table class="tablelist">
					<thead>
						<tr>
							<th>序号</th>
							<th>用海类别A</th>
							<th>用海类别B</th>
							<th>海域等别一等</th>
							<th>海域等别二等</th>
							<th>海域等别三等</th>
							<th>海域等别四等</th>
							<th>海域等别五等</th>
							<th>海域等别六等</th>
							<th>征收方式</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
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
							<td>${r[3] }</td>
							<td>${r[4] }</td>
							<td>${r[5] }</td>
							<td>${r[6] }</td>
							<td>${r[7] }</td>
							<td>${r[8] }</td>
							</c:if>
							<td>${r[11] }</td>
							<td>
								<a href="###" onclick="goZsbzDetail('${r[0] }')" class="tablelink">详情</a>
								<a href="###" onclick="goZsbzUpdate('${r[0] }')" class="tablelink">修改</a>
								<a href="###" onclick="goZsbzDelete('${r[0] }')" class="tablelink">删除</a>
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