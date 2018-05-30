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
	<link href="${contextPath}/css/jQueryUI/jquery-ui-1.8.2.custom.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${contextPath}/js/jQueryUI/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/jQueryUI/jquery-ui-1.8.2.custom.min.js"></script>
	
	
<script type="text/javascript">
//代码
$(document).ready(function(){
	var yhxzY=document.getElementById("yhxzY").value;
	getDictionary("用海性质","yhxz",yhxzY);

	var jnfsY=document.getElementById("jnfsY").value;
	getDictionary("使用金缴纳方式","jnfs",jnfsY);

	//indexDialog();//预警
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
	document.myForm.action="<%=basePath%>/seaRecord/seaRecord_fetchImgList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function resert(){
	document.getElementById("yhxmmc").value="";
	document.getElementById("hyglh").value="";
}
function goHjgl1(){
	document.myForm.action="<%=basePath%>/seaRecord/seaRecord_fetchYhxm.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goHjgl2(){
	document.myForm.action="<%=basePath%>/seaRecord/seaRecord_fetchFileList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function goHjgl3(){
	document.myForm.action="<%=basePath%>/seaRecord/seaRecord_fetchImgList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
</script>
	</head>

	<body>
<form name="myForm" method="post" >
<input type="hidden" id="indexNum" value="1" />

<input name="zsID" id="zsID" type="hidden" value="" />
<input name="xmID" id="xmID" type="hidden" value="" />
<input name="zsbh" id="zsbh" type="hidden" value="" />
<input name="jntzID" id="jntzID" type="hidden" value="" />
<input name="indexNum" id="indexNum" type="hidden" value="2" />

	<div class="place">
		<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">海域使用动态管理</a></li>
			<li><a href="#">海籍管理</a></li>
			<li><a href="#">海籍历史资料管理</a></li>
		</ul>
	</div>
	<div class="formbody" >
		<div id="usual1" class="usual" >
			<div class="leftinfo1">
				<div class="itab" >
					<ul>
						<li><a href="###" onclick="goHjgl1()">海籍信息</a></li>
						<li><a href="###" onclick="goHjgl2()">文件信息</a></li>
						<li><a href="###" onclick="goHjgl3()" class="selected">图册信息</a></li>
					</ul>
				</div>
			
				<div class="listtitle"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
					<table width="100%" align="center" style="text-align:left;">
							<tr>
								<td>项目名称：</td>
								<td><input name="searchForm.yhxmmc2" id="yhxmmc" type="text" value="${searchForm.yhxmmc2 }" style="width:180px;" /></td>
								<td>海域管理号：</td>
								<td>
								<input name="searchForm.hyglh2" id="hyglh" type="text" value="${searchForm.hyglh2 }" style="width:180px;" />
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
				<!-- 
				<div class="tools">
					<ul class="toolbar">
						<li>
							<a href="${contextPath}/jsp/seasProfession/jsp/hysydt/syjzs/syjzsJntz_add2.jsp"><span>
							<img src="${contextPath}/images/seasProfession/t01.png" /></span>新增</a>
						</li>
					</ul>
				</div>
				 -->	
				<table width="100%" class="tablelist" style="text-align:center;">
				<tr>
					<th width="5%">序号</th>
					<th width="15%">项目名称</th>
					<th width="15%">海域管理号</th>
					<th width="15%">用海位置图</th>
					<th width="15%">界址图</th>
					<th width="15%">新增人</th>
					<th width="15%">新增时间</th>
					
				</tr>
				<c:forEach items="${ imgList }" var="r" varStatus="j">
				<tr>
					<td>${j.count }</td>
					<td>
						<a href="#" onclick="xmxxDetail('${r[1]}','${r[5] }')" class="tablelink">
						${r[5] }</a>
					</td>
					<td>
						<a href="#" onclick="zsxxDetail('${r[1]}','${r[2] }','${r[6] }')" class="tablelink">
						${r[6] }</a>
					</td>
					<td>
					<a href="<%=basePath%>/business/business_fetchZhtDetail.do?zhtID=${r[0]}&zhttype=yhwzt" target="_blank">
					<img src="<%=basePath%>/business/business_fetchZht.do?zhtID=${r[0]}&zhttype=yhwzt" width="138" height="164"/>
					</a>
					</td>
					<td>
					<a href="<%=basePath%>/business/business_fetchZhtDetail.do?zhtID=${r[0]}&zhttype=jzt" target="_blank">
					<img src="<%=basePath%>/business/business_fetchZht.do?zhtID=${r[0]}&zhttype=jzt" width="138" height="164"/>
					</a>
					</td>
					<td>${r[3] }</td>
					<td>${r[4] }</td>
				</tr>
				</c:forEach>
			</table>
				
			
		</div>
	</div>

</form>
<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
		

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
			if(document.getElementById("ztY").value ==""){
				document.getElementById("zt").value ="";
			}else{
				document.getElementById("zt").value =document.getElementById("ztY").value;
			}
			
		</script>
		

	</body>

</html>