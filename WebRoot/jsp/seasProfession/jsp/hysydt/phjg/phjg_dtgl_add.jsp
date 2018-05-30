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
function getJgfsInput(obj){
	//alert(obj.value);
	var jgfs=obj.value;
	if(jgfs=="1"){
		document.getElementById("jsjcTR1").style.display="";
		document.getElementById("jsjcTR2").style.display="none";
		document.getElementById("jsjcTR3").style.display="";
		document.getElementById("jsjcTR4").style.display="";
		document.getElementById("jsjcTR5").style.display="";
		document.getElementById("jsjcTR6").style.display="";
		document.getElementById("jsjcTR7").style.display="";
		document.getElementById("jsjcTR8").style.display="";
		document.getElementById("jsjcTR9").style.display="";
		document.getElementById("jsjcTR10").style.display="";

		document.getElementById("jsjcTR11").style.display="none";
		document.getElementById("jsjcTR12").style.display="none";
		document.getElementById("jsjcTR13").style.display="none";
		document.getElementById("jsjcTR14").style.display="none";
		document.getElementById("jsjcTR15").style.display="none";
		document.getElementById("jsjcTR16").style.display="none";
		document.getElementById("jsjcTR17").style.display="none";
		document.getElementById("jsjcTR18").style.display="none";
		document.getElementById("jsjcTR19").style.display="none";
	}
	if(jgfs=="2"){
		document.getElementById("jsjcTR1").style.display="none";
		document.getElementById("jsjcTR2").style.display="";
		document.getElementById("jsjcTR3").style.display="";
		document.getElementById("jsjcTR4").style.display="";
		document.getElementById("jsjcTR5").style.display="";
		document.getElementById("jsjcTR6").style.display="none";
		document.getElementById("jsjcTR7").style.display="none";
		document.getElementById("jsjcTR8").style.display="";
		document.getElementById("jsjcTR9").style.display="";
		document.getElementById("jsjcTR10").style.display="none";

		document.getElementById("jsjcTR11").style.display="none";
		document.getElementById("jsjcTR12").style.display="none";
		document.getElementById("jsjcTR13").style.display="none";
		document.getElementById("jsjcTR14").style.display="none";
		document.getElementById("jsjcTR15").style.display="none";
		document.getElementById("jsjcTR16").style.display="none";
		document.getElementById("jsjcTR17").style.display="none";
		document.getElementById("jsjcTR18").style.display="none";
		document.getElementById("jsjcTR19").style.display="none";
	}

	if(jgfs=="3"){
		document.getElementById("jsjcTR1").style.display="none";
		document.getElementById("jsjcTR2").style.display="none";
		document.getElementById("jsjcTR3").style.display="none";
		document.getElementById("jsjcTR4").style.display="none";
		document.getElementById("jsjcTR5").style.display="none";
		document.getElementById("jsjcTR6").style.display="none";
		document.getElementById("jsjcTR7").style.display="none";
		document.getElementById("jsjcTR8").style.display="none";
		document.getElementById("jsjcTR9").style.display="none";
		document.getElementById("jsjcTR10").style.display="none";

		document.getElementById("jsjcTR11").style.display="";
		document.getElementById("jsjcTR12").style.display="";
		document.getElementById("jsjcTR13").style.display="";
		document.getElementById("jsjcTR14").style.display="";
		document.getElementById("jsjcTR15").style.display="";
		document.getElementById("jsjcTR16").style.display="";
		document.getElementById("jsjcTR17").style.display="none";
		document.getElementById("jsjcTR18").style.display="none";
		document.getElementById("jsjcTR19").style.display="none";
	}

	if(jgfs=="4"){
		document.getElementById("jsjcTR1").style.display="none";
		document.getElementById("jsjcTR2").style.display="none";
		document.getElementById("jsjcTR3").style.display="none";
		document.getElementById("jsjcTR4").style.display="none";
		document.getElementById("jsjcTR5").style.display="";
		document.getElementById("jsjcTR6").style.display="none";
		document.getElementById("jsjcTR7").style.display="none";
		document.getElementById("jsjcTR8").style.display="none";
		document.getElementById("jsjcTR9").style.display="none";
		document.getElementById("jsjcTR10").style.display="none";

		document.getElementById("jsjcTR11").style.display="none";
		document.getElementById("jsjcTR12").style.display="none";
		document.getElementById("jsjcTR13").style.display="none";
		document.getElementById("jsjcTR14").style.display="none";
		document.getElementById("jsjcTR15").style.display="none";
		document.getElementById("jsjcTR16").style.display="none";
		document.getElementById("jsjcTR17").style.display="";
		document.getElementById("jsjcTR18").style.display="";
		document.getElementById("jsjcTR19").style.display="";
	}
}


//保存
function addJgxx(){
	//校验
	if(document.getElementById("yhxmmc").value ==""){
		alert("用海项目名称不允许为空！");
		return false;
	}
	if(document.getElementById("jgfs").value ==""){
		alert("监测类型不允许为空！");
		return false;
	}else if(document.getElementById("rwmc").value ==""){
		alert("任务名称不允许为空！");
		return false;
	}else if(document.getElementById("dcrymd").value ==""){
		alert("监测人员名单不允许为空！");
		return false;
	}else if(document.getElementById("jgrq").value ==""){
		alert("监测日期不允许为空！");
		return false;
	}else if(document.getElementById("dcdwmc").value ==""){
		alert("监测单位名称不允许为空！");
		return false;
	}else {
		var jgfsV = document.getElementById("jgfs").value;
		if(jgfsV=="1"){
			//if(document.getElementById("hysyywHysydtYhxmphjgDt.yhjz").value ==""){
			//	alert("用海界址不允许为空！");
			//	return false;
			//}
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
			//if(document.getElementById("hysyywHysydtYhxmphjgDt.yhjz").value ==""){
			//	alert("用海界址不允许为空！");
			//	return false;
			//}
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
			if(document.getElementById("hysyywHysydtYhxmphjgDt.zyhyqk").value ==""){
				alert("占用海域情况不允许为空！");
				return false;
			}
			
			if(document.getElementById("hysyywHysydtYhxmphjgDt.ffwthqk").value ==""){
				alert("非法围填海活动情况不允许为空！");
				return false;
			}
			
			if(document.getElementById("hysyywHysydtYhxmphjgDt.szgbhyytqk").value ==""){
				alert("擅自改变海域用途情况不允许为空！");
				return false;
			}
		}else if(jgfsV=="4"){
			if(document.getElementById("hysyywHysydtYhxmphjgDt.yhmj").value ==""){
				alert("用海面积不允许为空！");
				return false;
			}
			if(document.getElementById("ydyqwz").value ==""){
				alert("异点异区位置不允许为空！");
				return false;
			}
			if(document.getElementById("yhfs").value ==""){
				alert("用海方式不允许为空！");
				return false;
			}
			if(document.getElementById("sjyt").value ==""){
				alert("实际用途不允许为空！");
				return false;
			}
		}
	}

	document.myForm.action="<%=basePath%>/business/business_saveJgxx.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//返回
function goBack(){
	document.myForm.action="<%=basePath%>/business/business_fetchXmDtjgList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//项目详情
function xmxxDetail(){
	//校验
	if(document.getElementById("yhxmmc").value ==""){
		alert("用海项目名称不允许为空！");
		return false;
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
					<a href="#">用海项目动态管理</a>
				</li>
			</ul>
		</div>
		<input name="xmID" id="xmID" value="${jgxmID }" type="hidden" />
		<input name="jgXmmc" id="jgXmmc" value="${jgXmmc }" type="hidden" />
	
		<div class="formbody">
			<div id="usual1" class="usual">
				<div class="leftinfo1">
					<div class="itab">
						<ul>
							<li>
								<a href="#tab1" class="selected">基本信息<img src="${contextPath}/images/t03.png" width="15" height="15"/></a>
							</li>
							<li>
								<a href="#tab2" >监测范围<img src="${contextPath}/images/t03.png" width="15" height="15"/></a>
							</li>
							<li>
								<a href="#tab3" >监测附件<img src="${contextPath}/images/t03.png" width="15" height="15"/></a>
							</li>
						</ul>
					</div>
			
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td style="background-color:#f5f8fa;">监测类型：</td>
					<td colspan="3">
					<select name="hysyywHysydtYhxmphjgDt.jgfs" id="jgfs" onchange="getJgfsInput(this)" style="width:180px;">
						<option value="">-请选择-</option>
					</select><font color="red">*</font>
					<input name="jgfsY" id="jgfsY" type="hidden" class="scinput" value="1" style="width:180px; " />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;" width="20%">用海项目名称：</td>
					<td  width="30%">
						<input name="hysyywHysydtYhxmphjgDt.yhxmmc" id="yhxmmc" type="text" readonly="readonly" class="scinput" value="${jgXmmc }" style="width:180px; " />
						<font color="red">*</font>
					</td>
					<td width="50%" colspan="2">
					<div class="tools">
						<ul class="toolbar">
							<li>
								<a href="###" onclick="xmxxDetail()">
								<span><img src="${contextPath}/images/f06.png" width="24" height="24"/></span>用海项目详情</a>
							</li>
							<!-- 
							<li>
								<a href="###">
								<span><img src="${contextPath}/images/main/31.png" width="24" height="24"/></span>视频监视</a>
							</li>
							<li>
								<a href="###">
								<span><img src="${contextPath}/images/main/pdahchl.png" width="24" height="24"/></span>海域巡查</a>
							</li>
							 -->
						</ul>
					</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">任务名称：</td>
					<td colspan="3">
						<input name="hysyywHysydtYhxmphjgDt.rwmc" id="rwmc" type="text" class="scinput" value="" style="width:500px; " />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">监测人员名单：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.hcrymd" id="dcrymd" rows="2" cols="70"></textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td width="20%" style="background-color:#f5f8fa;">监测日期：</td>
					<td width="30%">
					<input name="hysyywHysydtYhxmphjgDt.jgrq" id="jgrq" type="text" class="scinput" value="" onclick="WdatePicker()" readonly="readonly" style="width:180px; " />
					<font color="red">*</font>
					</td>
					<td width="20%" style="background-color:#f5f8fa;">监测单位名称：</td>
					<td width="30%">
						<input name="hysyywHysydtYhxmphjgDt.hcdwmc" id="dcdwmc"  type="text" class="scinput" value="" style="width:180px; " />
						<font color="red">*</font>
					</td>
				</tr>
				
				<tr>
					<th colspan="4">监测内容</th>
				</tr>
				
				<tr id="jsjcTR1"><!-- 建设过程监管 -->
					<td style="background-color:#f5f8fa;">是否已动工：</td>
					<td colspan="3">
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfydg" type="radio" value="是" />是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfydg" type="radio" value="否" checked="checked" />否
					</td>
				</tr>
				<tr id="jsjcTR2" style="display:none;"><!-- 竣工用海复核 -->
					<td style="background-color:#f5f8fa;">是否按规定有序施工：</td>
					<td colspan="3">
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfagdyxsg" type="radio" value="是" />是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfagdyxsg" type="radio" value="否" checked="checked" />否
					</td>
				</tr>
				<tr id="jsjcTR3"><!-- 建设过程监管、竣工用海复核 -->
					<td style="background-color:#f5f8fa;">是否超范围填海：</td>
					<td colspan="3">
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfcfwth" type="radio" value="是" />是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfcfwth" type="radio" value="否" checked="checked" />否
					</td>
				</tr>
				<tr id="jsjcTR4" ><!-- 建设过程监管、竣工用海复核 -->
					<td style="background-color:#f5f8fa;">用海界址是否改变：</td>
					<td>
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.yhjzsfgb" type="radio" value="是" />是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.yhjzsfgb" type="radio" value="否" checked="checked" />否
						<font color="red">*</font>
					</td>
					<td style="background-color:#f5f8fa;">用海面积是否改变：</td>
					<td>
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.yhmjsfgb" type="radio" value="是" />是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.yhmjsfgb" type="radio" value="否" checked="checked" />否
						<font color="red">*</font>
					</td>
				</tr>
				<tr id="jsjcTR5"><!-- 建设过程监管、竣工用海复核、核查监视监测信息 -->
					<td style="background-color:#f5f8fa;">用海面积：</td>
					<td colspan="3"><input name="hysyywHysydtYhxmphjgDt.yhmj" id="hysyywHysydtYhxmphjgDt.yhmj"  type="text" class="scinput" value="" style="width:180px; " />公顷<font color="red">*</font></td>
				</tr>
				<tr id="jsjcTR6"><!-- 建设过程监管 -->
					<td style="background-color:#f5f8fa;">施工方式：</td>
					<td colspan="3"><input name="hysyywHysydtYhxmphjgDt.sgfs" id="hysyywHysydtYhxmphjgDt.sgfs"  type="text" class="scinput" value="" style="width:180px; " /><font color="red">*</font></td>
				</tr>
				<tr id="jsjcTR7"><!-- 建设过程监管 -->
					<td style="background-color:#f5f8fa;">施工进展情况：</td>
					<td colspan="3">
					<textarea name="hysyywHysydtYhxmphjgDt.sgjzqk" id="hysyywHysydtYhxmphjgDt.sgjzqk" rows="4" cols="60"></textarea><font color="red">*</font>
					</td>
				</tr>
				<tr id="jsjcTR8"><!-- 建设过程监管、竣工用海复核 -->
					<td style="background-color:#f5f8fa;">实际用途是否改变：</td>
					<td colspan="3">
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sjytsfgb" type="radio" value="是" />是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sjytsfgb" type="radio" value="否" checked="checked" />否
						<font color="red">*</font>
					</td>
				</tr>
				<tr id="jsjcTR9"><!-- 建设过程监管、竣工用海复核 -->
					<td style="background-color:#f5f8fa;">实际用途改变内容：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.sjytgbnr" id="hysyywHysydtYhxmphjgDt.sjytgbnr" rows="4" cols="60"></textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr id="jsjcTR10"><!-- 建设过程监管 -->
					<td style="background-color:#f5f8fa;">岸滩演变情况：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.atybqk" id="hysyywHysydtYhxmphjgDt.atybqk" rows="4" cols="60"></textarea>
						<font color="red">*</font>
					</td>
				</tr>
				
				<tr id="jsjcTR11" style="display:none;"><!-- 日常监管 -->
					<td style="background-color:#f5f8fa;">是否占用海域：</td>
					<td colspan="3">
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfzyhy" type="radio" value="是" />是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfzyhy" type="radio" value="否" checked="checked" />否
						<font color="red">*</font>
					</td>
				</tr>
				<tr id="jsjcTR12" style="display:none;"><!-- 日常监管 -->
					<td style="background-color:#f5f8fa;">占用海域情况：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.zyhyqk" id="hysyywHysydtYhxmphjgDt.zyhyqk" rows="4" cols="60"></textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr id="jsjcTR13" style="display:none;"><!-- 日常监管 -->
					<td style="background-color:#f5f8fa;">是否有非法围填海活动：</td>
					<td colspan="3">
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfffwth" type="radio" value="是" />是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfffwth" type="radio" value="否" checked="checked" />否
						<font color="red">*</font>
					</td>
				</tr>
				<tr id="jsjcTR14" style="display:none;"><!-- 日常监管 -->
					<td style="background-color:#f5f8fa;">非法围填海活动情况：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.ffwthqk" id="hysyywHysydtYhxmphjgDt.ffwthqk" rows="4" cols="60"></textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr id="jsjcTR15" style="display:none;"><!-- 日常监管 -->
					<td style="background-color:#f5f8fa;">是否擅自改变海域用途：</td>
					<td colspan="3">
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfszgbhyyt" type="radio" value="是"  />是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfszgbhyyt" type="radio" value="否" checked="checked"/>否
						<font color="red">*</font>
					</td>
				</tr>
				<tr id="jsjcTR16" style="display:none;"><!-- 日常监管 -->
					<td style="background-color:#f5f8fa;">擅自改变海域用途情况：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.szgbhyytqk" id="hysyywHysydtYhxmphjgDt.szgbhyytqk" rows="4" cols="60"></textarea>
						<font color="red">*</font>
					</td>
				</tr>

				<tr id="jsjcTR17" style="display:none;"><!-- 核查监视监测信息 -->
					<td style="background-color:#f5f8fa;">异点异区位置：</td>
					<td>
						<input name="hysyywHysydtYhxmphjgDt.ydyqwz" id="ydyqwz"  type="text" class="scinput" value="" style="width:180px; " />
						<font color="red">*</font>
					</td>
					<td style="background-color:#f5f8fa;">用海方式：</td>
					<td>
						<input name="hysyywHysydtYhxmphjgDt.yhfs" id="yhfs"  type="text" class="scinput" value="" style="width:180px; " />
						<font color="red">*</font>
					</td>
				</tr>
				<tr id="jsjcTR18" style="display:none;"><!-- 核查监视监测信息 -->
					<td style="background-color:#f5f8fa;">实际用途：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.sjyt" id="sjyt" rows="4" cols="60"></textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr id="jsjcTR19" style="display:none;"><!-- 核查监视监测信息 -->
					<td style="background-color:#f5f8fa;">是否违规用海：</td>
					<td colspan="3">
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfwgyh" type="radio" value="是"  />是
						<input style="border:0;" name="hysyywHysydtYhxmphjgDt.sfwgyh" type="radio" value="否" checked="checked"/>否
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">备注：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtYhxmphjgDt.bz" id="hysyywHysydtYhxmphjgDt.bz" rows="4" cols="60"></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="addJgxx()" value="保存" />
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack()" />
					</td>
				</tr>
			</table>
			
		</div>
	</div>
</div>
</form>
		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

	</body>

</html>