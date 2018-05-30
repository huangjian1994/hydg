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
	getXmmc();
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
				if(d.length>=1){
				$("<option value= '"+d[i][0]+","+d[i][1]+"'>"+d[i][1]+"</option>").appendTo("#yhxmmc");
				}
				//	$("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
				}
		}
	});	  
}

//保存
function addYjxx(){
	//校验
	if(document.getElementById("yhxmmc").value ==""){
		alert("用海项目名称不允许为空！");
		return false;
	}else{
		//分割yhxmmc
		var yhxmmc=document.getElementById("yhxmmc").value;
		var strarray = new Array();
		strarray = yhxmmc.split(",");
		document.getElementById("hysyywHysydtYhxmphjgYj.xmmc").value=strarray[1];
		document.getElementById("xmID").value=strarray[0];
	}
	if(document.getElementById("yjjkqsrq").value ==""){
		alert("预警监控起始日期不允许为空！");
		return false;
	}
	if(document.getElementById("yjjkzzrq").value ==""){
		alert("预警监控终止日期不允许为空！");
		return false;
	}
	if(document.getElementById("yjjkqsrq").value> document.getElementById("yjjkzzrq").value){
		alert("预警监控终止日期必须大于预警监控起始日期！");
		return false;
	}
	document.getElementById("hysyywHysydtYhxmphjgYj.yhjzsfgb").value="";
	document.getElementById("hysyywHysydtYhxmphjgYj.yhmjsfgb").value="";
	document.getElementById("hysyywHysydtYhxmphjgYj.sjytsfgb").value="";
	document.getElementById("hysyywHysydtYhxmphjgYj.sfzyhy").value="";
	document.getElementById("hysyywHysydtYhxmphjgYj.sfffwth").value="";
	document.getElementById("hysyywHysydtYhxmphjgYj.yhjzsfgb").value="";
	
	var str = document.getElementsByName("yhjzsfgb");
	var sfxz="";
	if(str[0].checked == true){
		sfxz+=str[0].value;
		document.getElementById("hysyywHysydtYhxmphjgYj.yhjzsfgb").value=str[0].value;
	}
	
	var str2 = document.getElementsByName("yhmjsfgb");
	if(str2[0].checked == true){
		sfxz+=str2[0].value;
		document.getElementById("hysyywHysydtYhxmphjgYj.yhmjsfgb").value=str2[0].value;
	}
	
	var str3 = document.getElementsByName("sjytsfgb");
	if(str3[0].checked == true){
		sfxz+=str3[0].value;
		document.getElementById("hysyywHysydtYhxmphjgYj.sjytsfgb").value=str3[0].value;
	}
	
	var str4 = document.getElementsByName("sfzyhy");
	if(str4[0].checked == true){
		sfxz+=str4[0].value;
		document.getElementById("hysyywHysydtYhxmphjgYj.sfzyhy").value=str4[0].value;
	}

	var str5 = document.getElementsByName("sfffwth");
	if(str5[0].checked == true){
		sfxz+=str5[0].value;
		document.getElementById("hysyywHysydtYhxmphjgYj.sfffwth").value=str5[0].value;
	}

	var str6 = document.getElementsByName("sfszgbhyyt");
	if(str6[0].checked == true){
		sfxz+=str6[0].value;
		document.getElementById("hysyywHysydtYhxmphjgYj.sfszgbhyyt").value=str6[0].value;
	}
	if(sfxz==""){
		alert("请至少选择一个预警条件！");
		return false;
	}
	document.myForm.action="<%=basePath%>/business/business_saveYhxmBhyjxx.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//返回
function goBack(){
	document.myForm.action="<%=basePath%>/business/business_fetchYjxm.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

//项目详情
function xmxxDetail(){
	//校验
	if(document.getElementById("yhxmmc").value ==""){
		alert("用海项目名称不允许为空！");
		return false;
	}else{
		//分割yhxmmc
		var yhxmmc=document.getElementById("yhxmmc").value;
		var strarray = new Array();
		strarray = yhxmmc.split(",");
		document.getElementById("hysyywHysydtYhxmphjgYj.xmmc").value=strarray[0];
		document.getElementById("xmID").value=strarray[0];
	}
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
				<li>
					<a href="#">用海项目批后监管</a>
				</li>
				<li>
					<a href="#">用海项目变化预警</a>
				</li>
			</ul>
		</div>
		<input name="xmID" id="xmID" value="" type="hidden" />
		<input name="hysyywHysydtYhxmphjgYj.yhjzsfgb" id="hysyywHysydtYhxmphjgYj.yhjzsfgb" value="" type="hidden" />
		<input name="hysyywHysydtYhxmphjgYj.yhmjsfgb" id="hysyywHysydtYhxmphjgYj.yhmjsfgb" value="" type="hidden" />
		<input name="hysyywHysydtYhxmphjgYj.sjytsfgb" id="hysyywHysydtYhxmphjgYj.sjytsfgb" value="" type="hidden" />
		<input name="hysyywHysydtYhxmphjgYj.sfzyhy" id="hysyywHysydtYhxmphjgYj.sfzyhy" value="" type="hidden" />
		<input name="hysyywHysydtYhxmphjgYj.sfffwth" id="hysyywHysydtYhxmphjgYj.sfffwth" value="" type="hidden" />
		<input name="hysyywHysydtYhxmphjgYj.sfszgbhyyt" id="hysyywHysydtYhxmphjgYj.sfszgbhyyt" value="" type="hidden" />
		
		<div class="formbody">
			
			
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/ico02.png" width="20" height="20" />新增</div>
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td style="background-color:#f5f8fa;" width="20%">用海项目名称：</td>
					<td colspan="2" width="30%">
					<select name="yhxmmc" id="yhxmmc" style="width:180px;">
						<option value="">-请选择-</option>
					</select><font color="red">*</font>
					<input name="hysyywHysydtYhxmphjgYj.xmmc" id="hysyywHysydtYhxmphjgYj.xmmc" type="hidden" value="" />
					</td>
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
					<td colspan="3">
					<input name="hysyywHysydtYhxmphjgYj.yjjkqsrq" id="yjjkqsrq" type="text" class="scinput" value="" onclick="WdatePicker()" readonly="readonly" style="width:180px; " />
					<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">预警监控终止日期：</td>
					<td colspan="3">
					<input name="hysyywHysydtYhxmphjgYj.yjjkzzrq" id="yjjkzzrq" type="text" class="scinput" value="" onclick="WdatePicker()" readonly="readonly" style="width:180px; " />
					<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<th colspan="4">预警条件</th>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">用海界址改变：</td>
					<td colspan="3">
						<input style="border:0;" name="yhjzsfgb" id="yhjzsfgb" type="checkbox" value="是" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">用海面积改变：</td>
					<td colspan="3">
						<input style="border:0;" name="yhmjsfgb" id="yhmjsfgb" type="checkbox" value="是" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">实际用途改变：</td>
					<td colspan="3">
						<input style="border:0;" name="sjytsfgb" id="sjytsfgb" type="checkbox" value="是" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">占用海域：</td>
					<td colspan="3">
						<input style="border:0;" name="sfzyhy" id="sfzyhy" type="checkbox" value="是" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">有非法围填海活动：</td>
					<td colspan="3">
						<input style="border:0;" name="sfffwth" id="sfffwth" type="checkbox" value="是" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">擅自改变海域用途：</td>
					<td colspan="3">
						<input style="border:0;" name="sfszgbhyyt" id="sfszgbhyyt" type="checkbox" value="是" />
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="addYjxx()" value="保存" />
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