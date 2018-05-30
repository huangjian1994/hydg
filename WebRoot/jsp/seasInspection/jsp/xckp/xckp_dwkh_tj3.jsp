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
		<script type="text/javascript" src="${contextPath}/js/mycharts/echarts-all.js"></script>
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
				
				if(d[i].value==historyZ){
					$("<option value= '"+d[i].value+"' selected>"+d[i].value+"</option>").appendTo("#"+selectID);
				}else{
					$("<option value= '"+d[i].value+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
				}
				}
		}
	});	  
}


function search(){
	document.myForm.action="<%=basePath%>/patorl/patorl_fetchXckpDwkpTj3.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//重置
function resert(){
	document.getElementById("xclx").value ="";
	document.getElementById("xzqh").value ="";
	document.getElementById("year").value ="";
}
function goTj1(){
	document.myForm.action="<%=basePath%>/patorl/patorl_fetchXckpDwkpTj.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goTj2(){
	document.myForm.action="<%=basePath%>/patorl/patorl_fetchXckpDwkpTj2.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goTj3(){
	document.myForm.action="<%=basePath%>/patorl/patorl_fetchXckpDwkpTj3.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goTj4(){
	document.myForm.action="<%=basePath%>/patorl/patorl_fetchXckpDwkpTj4.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goDownloadData(){
	document.myForm.action="<%=basePath%>/patorl/patorl_downLoadDwkh.do";
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
				<li><a href="#">巡查单位考核统计</a></li>
			</ul>
		</div>
		<input name="dwkhID" id="dwkhID" value="" type="hidden" />
		
		<div class="formbody">
		<div id="usual1" class="usual" >
			<div class="leftinfo1">
				<div class="itab" >
					<ul>
						<li><a href="###" onclick="goTj1()" >月报</a></li>
						<li><a href="###" onclick="goTj2()" >季度报</a></li>
						<li><a href="###" onclick="goTj3()" class="selected">年报</a></li>
						<li><a href="###" onclick="goTj4()">二维表</a></li>
					</ul>
				</div>
		
		
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td width="10%">巡查类型：</td>
						<td width="20%">
						<select name="searchForm.xclx" id="xclx" style="width:180px;">
							<option value="">-请选择-</option>
							<option value="堤防">堤防</option>
							<option value="海监">海监</option>
						</select>
						<input name="xclxY" id="xclxY" type="hidden" value="${searchForm.xclx }"  />
						</td>
						<td width="10%">行政区划：</td>
						<td width="20%">
						<select name="searchForm.xzqh" id="xzqh" style="width:180px;">
							<option value="">-请选择-</option>
						</select>
						<input name="xzqhY" id="xzqhY" type="hidden" value="${searchForm.xzqh }"  />
						</td>
						<td width="10%">时间：</td>
						<td width="30%">
						<select name="searchForm.year" id="year" style="width:180px;">
							<option value="">-请选择-</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
						</select>年&nbsp;&nbsp;&nbsp;
						<input name="yearY" id="yearY" type="hidden" value="${searchForm.year }"  />
						</td>
					</tr>
					<tr>
						<td colspan="6">
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
		
		<input name="tjData_x" type="hidden" id="tjData_x"  value="${tjData_x }"/>
		<input name="tjData_y" type="hidden" id="tjData_y"  value="${tjData_y }"/>
		<input name="dwkhType" type="hidden" id="dwkhType"  value="${dwkhType }"/>
		
		</div>
		</div>
		
		<div id="main" style="height:400px;width:98%;border:0px solid #ccc;margin:auto;">
		</div>
		<script type="text/javascript">
			var hysytjData_y = document.getElementById("tjData_y").value;
			var hysytjData_x = document.getElementById("tjData_x").value;

			var xzqh = document.getElementById("xzqhY").value;
			var year = document.getElementById("yearY").value;
			//alert(year);
			var jldw = "分";
			var titlemc="巡查单位考核统计-"+xzqh+year+"年报";
			
			var strarray = new Array();
			strarray = hysytjData_x.split(",");
			//alert("strarray="+strarray);
			var strarray2 = new Array();
			strarray2 = hysytjData_y.split(",");
			//alert("strarray2="+strarray2);
			
			var myChart = echarts.init(document.getElementById("main"));
			var option = {
				title: {
					text: titlemc
				},
				tooltip: {
					trigger: 'axis',
					formatter:'{c}'+jldw,//单位
				},
				legend: {
			        data:["考核评分"]
			    },
				color: [
					//'#3cb371',//绿色
					//'#ffa500',//橘色
					//'#da70d6', //枚红色
					//'#ff69b4', //粉色
					//'#ba55d3', //紫色
					//'#cd5c5c', //深红色
					//'#6495ed'//宝蓝色
					//'#40e0d0',//亮蓝色
					//'#30e0e0',//亮蓝色
					//'#1e90ff' //蓝色
					//'#ff6347', //橙色
					//'#7b68ee', //紫色
					//'#00fa9a', //亮绿色
					//'#ffd700',//黄色
					'#6b8e23' //青色
					//'#b8860b', //土黄色
				],
				toolbox: {
					show: true,
					feature: {
						mark: {
							show: true
						},
						dataView: {
							show: true,
							readOnly: false
						},
						magicType: {
							show: true,
							type: ['bar','line']
						},
						restore: {
							show: true
						},
						saveAsImage: {
							show: true
						}
					}
				},
				calculable: true,
				xAxis: [{
					type: 'category',
					data: strarray
				}],
				yAxis: [{
					type: 'value'//,
					//splitArea:{show:true}//背景白灰分界
				}],
				series: [{
					name: "考核评分",
					type: 'bar',
					data: strarray2,
					//顶部数字展示
					itemStyle:{
						normal:{
							label:{
								show:true,//是否展示柱状图的数字
								//position:'inside',//数据在柱子中间显示
								formatter:'{c}'+jldw,//单位
								textStyle:{
									fontWeight:'bolder',
									fontSize:'12',
									fontFamily:'微软雅黑'
								}
							}
						}
					}
				}]
			};

			myChart.setOption(option);
			
		</script>
</form>
	<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>

	
		<script type="text/javascript">
		if(document.getElementById("yearY").value ==""){
			document.getElementById("year").value ="";
		}else{
			document.getElementById("year").value =document.getElementById("yearY").value;
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