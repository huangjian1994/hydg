<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
//代码
$(document).ready(function(){
	//var jgfsY=document.getElementById("jgfsY").value;
	//getDictionary("监管方式","jgfs",jgfsY);
	//getXmmc();
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

function getXmmc(){
	$.ajax({		  		
		type: "post",
		dataType:"json",
		url: "${contextPath}/business/business_fetchXmmc.do",
		//data: "dictionary.key="+keyZ,
		success: function(d){
			for(var i=0;i<d.length;i++){
				//alert(d);
				$("<option value= '"+d[i][0]+","+d[i][1]+"'>"+d[i][1]+"</option>").appendTo("#yhxmmc");
			//	$("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
				}
		}
	});	  
}

//返回
function goBack(){
	document.myForm.action="<%=basePath%>/business/business_fetchYjxm.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

//项目详情
function xmxxDetail(){
	
	document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchYhxmDetaile.do";
	document.myForm.target="_blank";
	document.myForm.submit();
}

</script>
	</head>

	<body>
<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海域使用动态管理</a></li>
				<li><a href="#">用海项目批后监管</a></li>
				<li><a href="#">用海项目变化预警</a></li>
			</ul>
		</div>
		<input name="xmID" id="xmID" value="${hysyywHysydtYhxmphjgYj.xmid }" type="hidden" />
		
		<div class="formbody">
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td style="background-color:#f5f8fa;" width="20%">用海项目名称：</td>
					<td colspan="2" width="30%">${hysyywHysydtYhxmphjgYj.xmmc }</td>
					<td width="50%">
					<div class="tools">
						<ul class="toolbar">
							<li>
								<a href="###" onclick="xmxxDetail()">
								<span><img src="${contextPath}/images/f06.png" width="24" height="24"/></span>用海项目详情</a>
							</li>
						</ul>
					</div>
					
					</td>
				</tr>
				
				<tr>
					<td style="background-color:#f5f8fa;">预警监控起始日期：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgYj.yjjkqsrq }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">预警监控终止日期：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgYj.yjjkzzrq }</td>
				</tr>
				<tr>
					<th colspan="4">预警条件</th>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">用海界址改变：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgYj.yhjzsfgb }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">用海面积改变：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgYj.yhmjsfgb }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">实际用途改变：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgYj.sjytsfgb }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">占用海域：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgYj.sfzyhy }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">有非法围填海活动：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgYj.sfffwth }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">擅自改变海域用途：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgYj.sfszgbhyyt }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">新增用户姓名：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgYj.addusername }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">新增时间：</td>
					<td>${hysyywHysydtYhxmphjgYj.addtime }</td>
					<td  style="background-color:#f5f8fa;">最后修改时间：</td>
					<td>${hysyywHysydtYhxmphjgYj.lastupdatetime }</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack()" />
					</td>
				</tr>
			</table>
			</div>
			
			
		</div>
</form>
		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

	</body>

</html>