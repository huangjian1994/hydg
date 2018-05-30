<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
//代码
$(document).ready(function(){
	var xzqhY=document.getElementById("xzqhY").value;
	getDictionary("行政区划","xzqh",xzqhY);

});

//加载字典
function getDictionary(keyZ,selectID,historyZ){
	//alert(historyZ);
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


function search(){
	document.myForm.action="<%=basePath%>/patorl/patorl_fetchXckpRykpTj4cx.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//重置
function resert(){
	document.getElementById("xclx").value ="";
	document.getElementById("xzqh").value ="";
	document.getElementById("dwmc").value ="";
	document.getElementById("year").value ="";
	document.getElementById("month").value ="";
}



//详情
function detailDwkh(dwkhID){
	document.getElementById("dwkhID").value = dwkhID;
	document.myForm.action="<%=basePath%>/patorl/patorl_fetchXckpDwkhDetail.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goTj1(){
	document.myForm.action="<%=basePath%>/patorl/patorl_fetchXckpRykpTj.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goTj2(){
	document.myForm.action="<%=basePath%>/patorl/patorl_fetchXckpRykpTj2.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goTj3(){
	document.myForm.action="<%=basePath%>/patorl/patorl_fetchXckpRykpTj3.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goTj4(){
	document.myForm.action="<%=basePath%>/patorl/patorl_fetchXckpRykpTj4.do";
	document.myForm.target="_self";
	document.myForm.submit();
}


function goDownloadData(){
	document.myForm.action="<%=basePath%>/patorl/patorl_downLoadRykhData.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
</script>

	</head>
	<body>
<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li><a href="#">巡查考评管理</a></li>
				<li><a href="#">巡查人员考核评价统计</a></li>
			</ul>
		</div>
		<input name="dwkhID" id="dwkhID" value="" type="hidden" />
		
		<div class="formbody">
			<div id="usual1" class="usual" >
			<div class="leftinfo1">
				<div class="itab" >
					<ul>
						<li><a href="###" onclick="goTj1()">月报</a></li>
						<li><a href="###" onclick="goTj2()" >季度报</a></li>
						<li><a href="###" onclick="goTj3()">年报</a></li>
						<li><a href="###" onclick="goTj4()" class="selected">二维表</a></li>
					</ul>
				</div>
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>巡查类型：</td>
						<td>
						<select name="searchForm.xclx" id="xclx" style="width:180px;">
							<option value="">-请选择-</option>
							<option value="堤防">堤防</option>
							<option value="海监">海监</option>
						</select>
						<input name="xclxY" id="xclxY" type="hidden" value="${searchForm.xclx }"  />
						</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td width="20%">行政区划：</td>
						<td width="30%">
						<select name="searchForm.xzqh" id="xzqh" style="width:180px;">
							<option value="">-请选择-</option>
						</select>
						<input name="xzqhY" id="xzqhY" type="hidden" value="${searchForm.xzqh }"  />
					
						</td>
						<td width="20%">单位名称：</td>
						<td width="30%">
							<input name="searchForm.dwmc" id="dwmc" type="text" value="${searchForm.dwmc }" style="width:180px;" />
						</td>
					</tr>
					
					<tr>
					<td >年份：</td>
					<td>
						<select name="searchForm.year" id="year" style="width:180px;">
							<option value="">-请选择-</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
						</select>
						<input name="yearY" id="yearY" type="hidden" value="${searchForm.year }"  />
					</td>
					<td >月份：</td>
					<td>
						<select name="searchForm.month" id="month" style="width:180px;">
							<option value="">-请选择-</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						<input name="monthY" id="monthY" type="hidden" value="${searchForm.month }"  />
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
					<a href="javascript:goDownloadData()"><span>
					<img src="${contextPath}/images/seasProfession/icon05.png" width="25px" height="25px"/></span>导出</a>
				</li>
			</ul>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th>序号</th>
					<th>巡查类型</th>
					<th>姓名</th>
					<th>行政区划</th>
					<th>单位名称</th>
					<th>年份</th>
					<th>月份</th>
					<th>总分</th>
					<th>巡查办理数(个)</th>
					<th>重要性(重要/一般/不重要)</th>
					<th>响应时间(快速/一般/不及时)</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${ rykhList }" var="r" varStatus="j">
				<tr>
					<td>${j.count }</td>
					<td>${r.xclx }</td>
					<td>${r.xm }</td>
					<td>${r.xzqhmc }</td>
					<td>${r.dwmc }</td>
					<td>${r.year }年</td>
					<td>${r.month }月</td>
					<td>${r.zf }</td>
					
					<td>${r.xcbls }</td>
					<td>${r.zyx_zy }/${r.zyx_yb }/${r.zyx_b }</td>
					<td>${r.xysj_ks }/${r.xysj_yb }/${r.xysj_b }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
</form>
	<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>

	
		<script type="text/javascript">
		if(document.getElementById("yearY").value ==""){
			document.getElementById("year").value ="";
		}else{
			document.getElementById("year").value =document.getElementById("yearY").value;
		}
		if(document.getElementById("monthY").value ==""){
			document.getElementById("month").value ="";
		}else{
			document.getElementById("month").value =document.getElementById("monthY").value;
		}
		if(document.getElementById("xclxY").value ==""){
			document.getElementById("xclx").value ="";
		}else{
			document.getElementById("xclx").value =document.getElementById("xclxY").value;
		}
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

	</body>

</html>