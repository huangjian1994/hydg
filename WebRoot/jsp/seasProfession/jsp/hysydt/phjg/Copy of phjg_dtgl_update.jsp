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
	var jgfsY=document.getElementById("jgfsY").value;
	getDictionary("监管方式","jgfs",jgfsY);
	getJgfs(jgfsY);
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

//监管方式
function getJgfs(jgfs){
	if(jgfs=="1"){
		//1-7
		document.getElementById("jsgcjgTR1").style.display="";
		document.getElementById("jsgcjgTR2").style.display="";
		document.getElementById("jsgcjgTR3").style.display="";
		document.getElementById("jsgcjgTR4").style.display="";
		document.getElementById("jsgcjgTR5").style.display="";
		document.getElementById("jsgcjgTR6").style.display="";
		document.getElementById("jsgcjgTR7").style.display="";

		document.getElementById("jgyhfhTR8").style.display="";
		//document.getElementById("jgyhfhTR9").style.display="none";
		document.getElementById("jgyhfhTR10").style.display="";
		//document.getElementById("jgyhfhTR11").style.display="none";

		document.getElementById("rcjgTR12").style.display="none";
		document.getElementById("rcjgTR13").style.display="none";
		document.getElementById("rcjgTR14").style.display="none";
		document.getElementById("rcjgTR15").style.display="none";
		document.getElementById("rcjgTR16").style.display="none";
		document.getElementById("rcjgTR17").style.display="none";

		document.getElementById("hcjsjcTR18").style.display="none";
	}
	if(jgfs=="2"){
		document.getElementById("jsgcjgTR1").style.display="";
		document.getElementById("jsgcjgTR2").style.display="";
		document.getElementById("jsgcjgTR3").style.display="none";
		document.getElementById("jsgcjgTR4").style.display="none";
		document.getElementById("jsgcjgTR7").style.display="none";
		
		document.getElementById("jsgcjgTR5").style.display="";
		document.getElementById("jsgcjgTR6").style.display="";
		document.getElementById("jgyhfhTR8").style.display="";
		//document.getElementById("jgyhfhTR9").style.display="";
		document.getElementById("jgyhfhTR10").style.display="";
		//document.getElementById("jgyhfhTR11").style.display="";

		document.getElementById("rcjgTR12").style.display="none";
		document.getElementById("rcjgTR13").style.display="none";
		document.getElementById("rcjgTR14").style.display="none";
		document.getElementById("rcjgTR15").style.display="none";
		document.getElementById("rcjgTR16").style.display="none";
		document.getElementById("rcjgTR17").style.display="none";

		document.getElementById("hcjsjcTR18").style.display="none";
	}

	if(jgfs=="3"){
		document.getElementById("jsgcjgTR1").style.display="none";
		document.getElementById("jsgcjgTR2").style.display="none";
		document.getElementById("jsgcjgTR3").style.display="none";
		document.getElementById("jsgcjgTR4").style.display="none";
		document.getElementById("jsgcjgTR7").style.display="none";
		
		document.getElementById("jsgcjgTR5").style.display="none";
		document.getElementById("jsgcjgTR6").style.display="none";
		document.getElementById("jgyhfhTR8").style.display="none";
		//document.getElementById("jgyhfhTR9").style.display="none";
		document.getElementById("jgyhfhTR10").style.display="none";
		//document.getElementById("jgyhfhTR11").style.display="none";

		//12-17
		document.getElementById("rcjgTR12").style.display="";
		document.getElementById("rcjgTR13").style.display="";
		document.getElementById("rcjgTR14").style.display="";
		document.getElementById("rcjgTR15").style.display="";
		document.getElementById("rcjgTR16").style.display="";
		document.getElementById("rcjgTR17").style.display="";

		document.getElementById("hcjsjcTR18").style.display="none";
	}

	if(jgfs=="4"){
		document.getElementById("jsgcjgTR1").style.display="none";
		document.getElementById("jsgcjgTR2").style.display="none";
		document.getElementById("jsgcjgTR3").style.display="none";
		document.getElementById("jsgcjgTR4").style.display="none";
		document.getElementById("jsgcjgTR7").style.display="none";
		
		document.getElementById("jsgcjgTR5").style.display="none";
		document.getElementById("jsgcjgTR6").style.display="none";
		document.getElementById("jgyhfhTR8").style.display="none";
		//document.getElementById("jgyhfhTR9").style.display="none";
		document.getElementById("jgyhfhTR10").style.display="none";
		//document.getElementById("jgyhfhTR11").style.display="none";

		//12-17
		document.getElementById("rcjgTR12").style.display="none";
		document.getElementById("rcjgTR13").style.display="none";
		document.getElementById("rcjgTR14").style.display="none";
		document.getElementById("rcjgTR15").style.display="none";
		document.getElementById("rcjgTR16").style.display="none";
		document.getElementById("rcjgTR17").style.display="none";

		document.getElementById("hcjsjcTR18").style.display="";
	}
}


//监管方式
function getJgfsInput(obj){
	//alert(obj.value);
	var jgfs=obj.value;
	if(jgfs=="1"){
		//1-7
		document.getElementById("jsgcjgTR1").style.display="";
		document.getElementById("jsgcjgTR2").style.display="";
		document.getElementById("jsgcjgTR3").style.display="";
		document.getElementById("jsgcjgTR4").style.display="";
		document.getElementById("jsgcjgTR5").style.display="";
		document.getElementById("jsgcjgTR6").style.display="";
		document.getElementById("jsgcjgTR7").style.display="";
		document.getElementById("jgyhfhTR8").style.display="";
		//document.getElementById("jgyhfhTR9").style.display="none";
		document.getElementById("jgyhfhTR10").style.display="";
		//document.getElementById("jgyhfhTR11").style.display="none";

		document.getElementById("rcjgTR12").style.display="none";
		document.getElementById("rcjgTR13").style.display="none";
		document.getElementById("rcjgTR14").style.display="none";
		document.getElementById("rcjgTR15").style.display="none";
		document.getElementById("rcjgTR16").style.display="none";
		document.getElementById("rcjgTR17").style.display="none";

		document.getElementById("hcjsjcTR18").style.display="none";
	}
	if(jgfs=="2"){
		document.getElementById("jsgcjgTR1").style.display="";
		document.getElementById("jsgcjgTR2").style.display="";
		document.getElementById("jsgcjgTR3").style.display="none";
		document.getElementById("jsgcjgTR4").style.display="none";
		document.getElementById("jsgcjgTR7").style.display="none";
		
		document.getElementById("jsgcjgTR5").style.display="";
		document.getElementById("jsgcjgTR6").style.display="";
		document.getElementById("jgyhfhTR8").style.display="";
		//document.getElementById("jgyhfhTR9").style.display="";
		document.getElementById("jgyhfhTR10").style.display="";
		//document.getElementById("jgyhfhTR11").style.display="";

		document.getElementById("rcjgTR12").style.display="none";
		document.getElementById("rcjgTR13").style.display="none";
		document.getElementById("rcjgTR14").style.display="none";
		document.getElementById("rcjgTR15").style.display="none";
		document.getElementById("rcjgTR16").style.display="none";
		document.getElementById("rcjgTR17").style.display="none";

		document.getElementById("hcjsjcTR18").style.display="none";
	}

	if(jgfs=="3"){
		document.getElementById("jsgcjgTR1").style.display="none";
		document.getElementById("jsgcjgTR2").style.display="none";
		document.getElementById("jsgcjgTR3").style.display="none";
		document.getElementById("jsgcjgTR4").style.display="none";
		document.getElementById("jsgcjgTR7").style.display="none";
		
		document.getElementById("jsgcjgTR5").style.display="none";
		document.getElementById("jsgcjgTR6").style.display="none";
		document.getElementById("jgyhfhTR8").style.display="none";
		//document.getElementById("jgyhfhTR9").style.display="none";
		document.getElementById("jgyhfhTR10").style.display="none";
		//document.getElementById("jgyhfhTR11").style.display="none";

		//12-17
		document.getElementById("rcjgTR12").style.display="";
		document.getElementById("rcjgTR13").style.display="";
		document.getElementById("rcjgTR14").style.display="";
		document.getElementById("rcjgTR15").style.display="";
		document.getElementById("rcjgTR16").style.display="";
		document.getElementById("rcjgTR17").style.display="";

		document.getElementById("hcjsjcTR18").style.display="none";
	}

	if(jgfs=="4"){
		document.getElementById("jsgcjgTR1").style.display="none";
		document.getElementById("jsgcjgTR2").style.display="none";
		document.getElementById("jsgcjgTR3").style.display="none";
		document.getElementById("jsgcjgTR4").style.display="none";
		document.getElementById("jsgcjgTR7").style.display="none";
		
		document.getElementById("jsgcjgTR5").style.display="none";
		document.getElementById("jsgcjgTR6").style.display="none";
		document.getElementById("jgyhfhTR8").style.display="none";
		//document.getElementById("jgyhfhTR9").style.display="none";
		document.getElementById("jgyhfhTR10").style.display="none";
		//document.getElementById("jgyhfhTR11").style.display="none";

		//12-17
		document.getElementById("rcjgTR12").style.display="none";
		document.getElementById("rcjgTR13").style.display="none";
		document.getElementById("rcjgTR14").style.display="none";
		document.getElementById("rcjgTR15").style.display="none";
		document.getElementById("rcjgTR16").style.display="none";
		document.getElementById("rcjgTR17").style.display="none";

		document.getElementById("hcjsjcTR18").style.display="";
	}
}


//修改
function xgJgxx(){
	//校验
	if(document.getElementById("hysyywHysydtYhxmphjgDt.yhxmmc").value ==""){
		alert("用海项目名称不允许为空！");
		return false;
	}
	if(document.getElementById("jgfs").value ==""){
		alert("监管方式不允许为空！");
		return false;
	}else if(document.getElementById("jgrq").value ==""){
		alert("监管日期不允许为空！");
		return false;
	}else {
		var jgfsV = document.getElementById("jgfs").value;
		if(jgfsV=="1"){
			//radio
			var yhjzsfgb = $('input:radio[name="hysyywHysydtYhxmphjgDt.yhjzsfgb"]:checked').val();
			if(yhjzsfgb==null){
				alert("用海界址是否改变不允许为空！");
				return false;
			}
			if(document.getElementById("hysyywHysydtYhxmphjgDt.yhjz").value ==""){
				alert("用海界址不允许为空！");
				return false;
			}
			//radio
			var yhmjsfgb = $('input:radio[name="hysyywHysydtYhxmphjgDt.yhmjsfgb"]:checked').val();
			if(yhmjsfgb==null){
				alert("用海面积是否改变不允许为空！");
				return false;
			}
			if(document.getElementById("hysyywHysydtYhxmphjgDt.yhmj").value ==""){
				alert("用海面积不允许为空！");
				return false;
			}
			if(document.getElementById("hysyywHysydtYhxmphjgDt.sgfs").value ==""){
				alert("施工方式不允许为空！");
				return false;
			}
			if(document.getElementById("hysyywHysydtYhxmphjgDt.sgjzqk").value ==""){
				alert("施工进展情况不允许为空！");
				return false;
			}
			//radio
			var sjytsfgb = $('input:radio[name="hysyywHysydtYhxmphjgDt.sjytsfgb"]:checked').val();
			if(sjytsfgb==null){
				alert("实际用途是否改变不允许为空！");
				return false;
			}
			if(document.getElementById("hysyywHysydtYhxmphjgDt.sjytgbnr").value ==""){
				alert("实际用途改变内容不允许为空！");
				return false;
			}
			if(document.getElementById("hysyywHysydtYhxmphjgDt.atybqk").value ==""){
				alert("岸滩演变情况不允许为空！");
				return false;
			}
		}else if(jgfsV=="2"){
			//radio
			var yhjzsfgb = $('input:radio[name="hysyywHysydtYhxmphjgDt.yhjzsfgb"]:checked').val();
			if(yhjzsfgb==null){
				alert("用海界址是否改变不允许为空！");
				return false;
			}
			if(document.getElementById("hysyywHysydtYhxmphjgDt.yhjz").value ==""){
				alert("用海界址不允许为空！");
				return false;
			}
			//radio
			var yhmjsfgb = $('input:radio[name="hysyywHysydtYhxmphjgDt.yhmjsfgb"]:checked').val();
			if(yhmjsfgb==null){
				alert("用海面积是否改变不允许为空！");
				return false;
			}
			if(document.getElementById("hysyywHysydtYhxmphjgDt.yhmj").value ==""){
				alert("用海面积不允许为空！");
				return false;
			}
			var sjytsfgb = $('input:radio[name="hysyywHysydtYhxmphjgDt.sjytsfgb"]:checked').val();
			if(sjytsfgb==null){
				alert("实际用途是否改变不允许为空！");
				return false;
			}
			if(document.getElementById("hysyywHysydtYhxmphjgDt.sjytgbnr").value ==""){
				alert("实际用途改变内容不允许为空！");
				return false;
			}
			
		}else if(jgfsV=="3"){
			//radio
			var sfzyhy = $('input:radio[name="hysyywHysydtYhxmphjgDt.sfzyhy"]:checked').val();
			if(sfzyhy==null){
				alert("是否占用海域是否改变不允许为空！");
				return false;
			}
			if(document.getElementById("hysyywHysydtYhxmphjgDt.zyhyqk").value ==""){
				alert("占用海域情况不允许为空！");
				return false;
			}
			//radio
			var sfffwth = $('input:radio[name="hysyywHysydtYhxmphjgDt.sfffwth"]:checked').val();
			if(sfffwth==null){
				alert("是否有非法围填海活动不允许为空！");
				return false;
			}
			if(document.getElementById("hysyywHysydtYhxmphjgDt.ffwthqk").value ==""){
				alert("非法围填海活动情况不允许为空！");
				return false;
			}
			//radio
			var sfszgbhyyt = $('input:radio[name="hysyywHysydtYhxmphjgDt.sfszgbhyyt"]:checked').val();
			if(sfszgbhyyt==null){
				alert("是否擅自改变海域用途不允许为空！");
				return false;
			}
			if(document.getElementById("hysyywHysydtYhxmphjgDt.szgbhyytqk").value ==""){
				alert("擅自改变海域用途情况不允许为空！");
				return false;
			}
		}else if(jgfsV=="4"){
			if(document.getElementById("hysyywHysydtYhxmphjgDt.hcjsjc").value ==""){
				alert("核查监视监测信息不允许为空！");
				return false;
			}
		}
	}

	document.myForm.action="<%=basePath%>/business/business_updateJgxx.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//返回
function goBack(){
	document.myForm.action="<%=basePath%>/business/business_fetchXmDtjgList.do";
	document.myForm.target="_self";
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
					<a href="#">用海项目动态管理</a>
				</li>
			</ul>
		</div>
	<input name="xmID" id="xmID" value="${jgxmID }" type="hidden" />
	<input name="jgXmmc" id="jgXmmc" value="${jgXmmc }" type="hidden" />
	
	<div class="formbody">
	<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/ticon.png" width="20" height="20" />修改</div>
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#f5f8fa;" width="20%">用海项目名称：</td>
					<td colspan="3" width="80%">
					<input readonly="readonly" name="hysyywHysydtYhxmphjgDt.yhxmmc" id="hysyywHysydtYhxmphjgDt.yhxmmc" type="text" class="scinput" value="${jgXmmc }" style="width:180px; " /><font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">监管方式：</td>
					<td colspan="3">
					<select name="hysyywHysydtYhxmphjgDt.jgfs" id="jgfs" onchange="getJgfsInput(this)" style="width:180px;">
						<option value="">-请选择-</option>
					</select><font color="red">*</font>
					<input name="jgfsY" id="jgfsY" type="hidden" class="scinput" value="${hysyywHysydtYhxmphjgDt.jgfs }" style="width:180px; " />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">监管日期：</td>
					<td colspan="3">
					<input name="hysyywHysydtYhxmphjgDt.jgrq" id="jgrq" type="text" class="scinput" value="${hysyywHysydtYhxmphjgDt.jgrq }" onclick="WdatePicker()" readonly="readonly" style="width:180px; " />
					<font color="red">*</font>
					</td>
				</tr>
				<!-- 建设过程监管 -->
				<tr id="jgyhfhTR8">
					<td style="background-color:#f5f8fa;">用海界址是否改变：</td>
					<td colspan="3">
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.yhjzsfgb" id="yhjzsfgb1" type="radio" value="是" />是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.yhjzsfgb" id="yhjzsfgb2" type="radio" value="否" />否
						<font color="red">*</font>
						<input name="yhjzsfgbY" id="yhjzsfgbY" type="hidden" class="scinput" value="${hysyywHysydtYhxmphjgDt.yhjzsfgb }" style="width:180px; " />
					</td>
				</tr>
				<tr id="jsgcjgTR1">
					<td style="background-color:#f5f8fa;">用海界址：</td>
					<td colspan="3"><input name="hysyywHysydtYhxmphjgDt.yhjz" id="hysyywHysydtYhxmphjgDt.yhjz" type="text" class="scinput" value="${hysyywHysydtYhxmphjgDt.yhjz }" style="width:180px; " />
					<font color="red">*</font>
					</td>
				</tr>
				<tr id="jgyhfhTR10" >
					<td style="background-color:#f5f8fa;">用海面积是否改变：</td>
					<td colspan="3">
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.yhmjsfgb" id="yhmjsfgb1" type="radio" value="是" />是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.yhmjsfgb" id="yhmjsfgb2" type="radio" value="否" />否
						<font color="red">*</font>
						<input name="yhmjsfgbY" id="yhmjsfgbY" type="hidden" class="scinput" value="${hysyywHysydtYhxmphjgDt.yhmjsfgb }" style="width:180px; " />
					</td>
				</tr>
				<tr id="jsgcjgTR2">
					<td style="background-color:#f5f8fa;">用海面积：</td>
					<td colspan="3"><input name="hysyywHysydtYhxmphjgDt.yhmj" id="hysyywHysydtYhxmphjgDt.yhmj"  type="text" class="scinput" value="${hysyywHysydtYhxmphjgDt.yhmj }" style="width:180px; " />
					公顷<font color="red">*</font>
					</td>
				</tr>
				<tr id="jsgcjgTR3">
					<td style="background-color:#f5f8fa;">施工方式：</td>
					<td colspan="3">
					<input name="hysyywHysydtYhxmphjgDt.sgfs" id="hysyywHysydtYhxmphjgDt.sgfs"  type="text" class="scinput" value="${hysyywHysydtYhxmphjgDt.sgfs }" style="width:180px; " />
					<font color="red">*</font>
					</td>
				</tr>
				<tr id="jsgcjgTR4">
					<td style="background-color:#f5f8fa;">施工进展情况：</td>
					<td colspan="3">
					<textarea name="hysyywHysydtYhxmphjgDt.sgjzqk" id="hysyywHysydtYhxmphjgDt.sgjzqk" rows="4" cols="60">${hysyywHysydtYhxmphjgDt.sgjzqk }</textarea>
					<font color="red">*</font>
					</td>
				</tr>
				<tr id="jsgcjgTR5">
					<td style="background-color:#f5f8fa;">实际用途是否改变：</td>
					<td colspan="3">
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sjytsfgb" id="sjytsfgb1" type="radio" value="是" />是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sjytsfgb" id="sjytsfgb2" type="radio" value="否" />否
						<font color="red">*</font>
						<input name="jgfsY" id="sjytsfgbY" type="hidden" class="scinput" value="${hysyywHysydtYhxmphjgDt.sjytsfgb }" style="width:180px; " />
					</td>
				</tr>
				<tr id="jsgcjgTR6">
					<td style="background-color:#f5f8fa;">实际用途改变内容：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.sjytgbnr" id="hysyywHysydtYhxmphjgDt.sjytgbnr" rows="4" cols="60">${hysyywHysydtYhxmphjgDt.sjytgbnr }</textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr id="jsgcjgTR7">
					<td style="background-color:#f5f8fa;">岸滩演变情况：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.atybqk" id="hysyywHysydtYhxmphjgDt.atybqk" rows="4" cols="60">${hysyywHysydtYhxmphjgDt.atybqk }</textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<!-- 竣工用海复核 -->
				<!-- 
				<tr id="jgyhfhTR9">
					<td style="background-color:#f5f8fa;">用海界址改变内容：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.yhjzgbnr" id="hysyywHysydtYhxmphjgDt.yhjzgbnr" rows="4" cols="60">${hysyywHysydtYhxmphjgDt.yhjzgbnr }</textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr id="jgyhfhTR11" >
					<td style="background-color:#f5f8fa;">用海面积改变内容：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.yhmjgbnr" id="hysyywHysydtYhxmphjgDt.yhmjgbnr" rows="4" cols="60">${hysyywHysydtYhxmphjgDt.yhmjgbnr }</textarea>
						<font color="red">*</font>
					</td>
				</tr>
				 -->
				<!-- 日常监管 -->
				<tr id="rcjgTR12" >
					<td style="background-color:#f5f8fa;">是否占用海域：</td>
					<td colspan="3">
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfzyhy" id="sfzyhy1" type="radio" value="是"/>是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfzyhy" id="sfzyhy2" type="radio" value="否" />否
						<font color="red">*</font>
						<input name="sfzyhyY" id="sfzyhyY" type="hidden" class="scinput" value="${hysyywHysydtYhxmphjgDt.sfzyhy }" style="width:180px; " />
					</td>
				</tr>
				<tr id="rcjgTR13" >
					<td style="background-color:#f5f8fa;">占用海域情况：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.zyhyqk" id="hysyywHysydtYhxmphjgDt.zyhyqk" rows="4" cols="60">${hysyywHysydtYhxmphjgDt.zyhyqk }</textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr id="rcjgTR14" >
					<td style="background-color:#f5f8fa;">是否有非法围填海活动：</td>
					<td colspan="3">
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfffwth" id="sfffwth1" type="radio" value="是" />是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfffwth" id="sfffwth2" type="radio" value="否" />否
						<font color="red">*</font>
						<input name="sfffwthY" id="sfffwthY" type="hidden" class="scinput" value="${hysyywHysydtYhxmphjgDt.sfffwth }" style="width:180px; " />
					</td>
				</tr>
				<tr id="rcjgTR15" >
					<td style="background-color:#f5f8fa;">非法围填海活动情况：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.ffwthqk" id="hysyywHysydtYhxmphjgDt.ffwthqk" rows="4" cols="60">${hysyywHysydtYhxmphjgDt.ffwthqk }</textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr id="rcjgTR16" >
					<td style="background-color:#f5f8fa;">是否擅自改变海域用途：</td>
					<td colspan="3">
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfszgbhyyt" id="sfszgbhyyt1" type="radio" value="是" />是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfszgbhyyt" id="sfszgbhyyt2" type="radio" value="否" />否
						<font color="red">*</font>
						<input name="sfszgbhyytY" id="sfszgbhyytY" type="hidden" class="scinput" value="${hysyywHysydtYhxmphjgDt.sfszgbhyyt }" style="width:180px; " />
					</td>
				</tr>
				<tr id="rcjgTR17" >
					<td style="background-color:#f5f8fa;">擅自改变海域用途情况：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.szgbhyytqk" id="hysyywHysydtYhxmphjgDt.szgbhyytqk" rows="4" cols="60">${hysyywHysydtYhxmphjgDt.szgbhyytqk }</textarea>
						<font color="red">*</font>
					</td>
				</tr>
				
				<!-- 核查监视监测信息 -->
				<tr id="hcjsjcTR18" >
					<td style="background-color:#f5f8fa;">核查监视监测信息：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.hcjsjc" id="hysyywHysydtYhxmphjgDt.hcjsjc" rows="4" cols="60">${hysyywHysydtYhxmphjgDt.hcjsjc }</textarea>
						<font color="red">*</font>
					</td>
				</tr>
				
				<tr>
					<td style="background-color:#f5f8fa;">新增用户姓名：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.addusername }</td>
				</tr>
				<tr>
					<td width="20%" style="background-color:#f5f8fa;">新增时间：</td>
					<td width="30%">${hysyywHysydtYhxmphjgDt.addtime }</td>
					<td width="20%" style="background-color:#f5f8fa;">最后修改时间：</td>
					<td width="30%">${hysyywHysydtYhxmphjgDt.lastupdatetime }</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="xgJgxx()" value="修改" />
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack()" />
					</td>
				</tr>
			</table>
			<input name="hysyywHysydtYhxmphjgDt.id" id="hysyywHysydtYhxmphjgDt.id" type="hidden" value="${hysyywHysydtYhxmphjgDt.id }" />
			<input name="hysyywHysydtYhxmphjgDt.addtime" id="hysyywHysydtYhxmphjgDt.addtime" type="hidden" value="${hysyywHysydtYhxmphjgDt.addtime }" />
			<input name="hysyywHysydtYhxmphjgDt.lastupdatetime" id="hysyywHysydtYhxmphjgDt.lastupdatetime" type="hidden" value="${hysyywHysydtYhxmphjgDt.lastupdatetime }" />
			<input name="hysyywHysydtYhxmphjgDt.addusername" id="hysyywHysydtYhxmphjgDt.addusername" type="hidden" value="${hysyywHysydtYhxmphjgDt.addusername }" />
			<input name="hysyywHysydtYhxmphjgDt.adduserid" id="hysyywHysydtYhxmphjgDt.adduserid" type="hidden" value="${hysyywHysydtYhxmphjgDt.adduserid }" />
			<input name="hysyywHysydtYhxmphjgDt.xmid" id="hysyywHysydtYhxmphjgDt.xmid" type="hidden" value="${hysyywHysydtYhxmphjgDt.xmid }" />
					
			</div>
			
	</div>
</form>
	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		var sjytsfgbY = document.getElementById("sjytsfgbY").value;
		var yhjzsfgbY = document.getElementById("yhjzsfgbY").value;
		var yhmjsfgbY = document.getElementById("yhmjsfgbY").value;
		var sfzyhyY = document.getElementById("sfzyhyY").value;
		var sfffwthY = document.getElementById("sfffwthY").value;
		var sfszgbhyytY = document.getElementById("sfszgbhyytY").value;
		
		if(sjytsfgbY =="是"){
			document.getElementById("sjytsfgb1").checked = true;
			document.getElementById("sjytsfgb2").checked = false;
		}else if(sjytsfgbY =="否"){
			document.getElementById("sjytsfgb1").checked = false;
			document.getElementById("sjytsfgb2").checked = true;
		}

		if(yhjzsfgbY =="是"){
			document.getElementById("yhjzsfgb1").checked = true;
			document.getElementById("yhjzsfgb2").checked = false;
		}else if(yhjzsfgbY =="否"){
			document.getElementById("yhjzsfgb1").checked = false;
			document.getElementById("yhjzsfgb2").checked = true;
		}
		
		if(yhmjsfgbY =="是"){
			document.getElementById("yhmjsfgb1").checked = true;
			document.getElementById("yhmjsfgb2").checked = false;
		}else if(yhmjsfgbY =="否"){
			document.getElementById("yhmjsfgb1").checked = false;
			document.getElementById("yhmjsfgb2").checked = true;
		}

		if(sfzyhyY =="是"){
			document.getElementById("sfzyhy1").checked = true;
			document.getElementById("sfzyhy2").checked = false;
		}else if(sfzyhyY =="否"){
			document.getElementById("sfzyhy1").checked = false;
			document.getElementById("sfzyhy2").checked = true;
		}

		if(sfffwthY =="是"){
			document.getElementById("sfffwth1").checked = true;
			document.getElementById("sfffwth2").checked = false;
		}else if(sfffwthY =="否"){
			document.getElementById("sfffwth1").checked = false;
			document.getElementById("sfffwth2").checked = true;
		}

		if(sfszgbhyytY =="是"){
			document.getElementById("sfszgbhyyt1").checked = true;
			document.getElementById("sfszgbhyyt2").checked = false;
		}else if(sfszgbhyytY =="否"){
			document.getElementById("sfszgbhyyt1").checked = false;
			document.getElementById("sfszgbhyyt2").checked = true;
		}
	</script>
	</body>
</html>