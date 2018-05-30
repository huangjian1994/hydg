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
	var xmwzY=document.getElementById("xmwzY").value;
	var hydbY=document.getElementById("hydbY").value;
	var sljgjbY=document.getElementById("sljgjbY").value;
	var tzedwY=document.getElementById("tzedwY").value;
	var fzjgjbY=document.getElementById("fzjgjbY").value;
	var zbxmcY=document.getElementById("zbxmcY").value;
	var tyY=document.getElementById("tyY").value;
	var xmxzY =document.getElementById("xmxzY").value;
	var zzdjY =document.getElementById("zzdjY").value;
	
	getDictionary("项目位置","xmwz",xmwzY);
	getDictionary("海域等别","hydb",hydbY);
	getDictionary("受理机关级别","sljgjb",sljgjbY);
	getDictionary("投资额","tzedw",tzedwY);	
	getDictionary("发证机关级别","fzjgjb",fzjgjbY);
	getDictionary("投影","ty",tyY);
	getDictionary("坐标系名称","zbxmc",zbxmcY);
	getDictionary("用海性质","xmxz",xmxzY);
	getDictionary("资质等级","zzdj",zzdjY);
	
	/*JQuery 限制文本框只能输入数字*/
	$(".NumText").keyup(function(){    
	                $(this).val($(this).val().replace(/\D|^0/g,''));
	            }).bind("paste",function(){  //CTR+V事件处理    
	                $(this).val($(this).val().replace(/\D|^0/g,''));     
	            }).css("ime-mode", "disabled"); //CSS设置输入法不可用
	/*JQuery 限制文本框只能输入数字和小数点*/
	$(".NumDecText").keyup(function(){    
	                $(this).val($(this).val().replace(/[^0-9.]/g,''));    
	                }).bind("paste",function(){  //CTR+V事件处理    
	                    $(this).val($(this).val().replace(/[^0-9.]/g,''));     
	                }).css("ime-mode", "disabled"); //CSS设置输入法不可用 
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
</script>

	<script type="text/javascript">
	
	function goBack(){
		document.myForm.action="<%=basePath%>/business/business_fetchYhxmBack.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	function goAdd1(){
		document.myForm.action="<%=basePath%>/business/business_addYhxmSuccess.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	function goAdd2(){
		document.myForm.action="<%=basePath%>/business/business_addYhxmFj.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	function goAdd3(){
		document.myForm.action="<%=basePath%>/business/business_addYhxmZhxx.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	//保存-修改
	function saveYhxm(){
		if(document.getElementById("hysyywHysydtYhxm.yhxmmc").value ==""){
			alert("用海项目名称不允许为空！");
			return false;
		}
		if(document.getElementById("xmwz").value ==""){
			alert("项目位置不允许为空！");
			return false;
		}
		if(document.getElementById("hysyywHysydtYhxm.zssl").value ==""){
			alert("证书数量不允许为空！");
			return false;
		}
		if(document.getElementById("hysyywHysydtYhxm.yhzmj").value ==""){
			alert("用海总面积不允许为空！");
			return false;
		}
		if(document.getElementById("hysyywHysydtYhxm.zyax").value ==""){
			alert("占用岸线不允许为空！");
			return false;
		}
		if(document.getElementById("hysyywHysydtYhxm.xzax").value ==""){
			alert("新增岸线不允许为空！");
			return false;
		}
		if(document.getElementById("slrq").value ==""){
			alert("受理日期不允许为空！");
			return false;
		}
		if(document.getElementById("hydb").value ==""){
			alert("海域等别不允许为空！");
			return false;
		}
		if(document.getElementById("hysyywHysydtYhxm.yhpzrq").value ==""){
			alert("用海批准日期不允许为空！");
			return false;
		}
		
		if(document.getElementById("fzjgjb").value ==""){
			alert("发证机关级别不允许为空！");
			return false;
		}
		if(document.getElementById("hysyywHysydtYhxm.spjg").value ==""){
			alert("审批机关不允许为空！");
			return false;
		}
		
		if(document.getElementById("hysyywHysydtYhxm.hysyqr").value ==""){
			alert("海域使用权人不允许为空！");
			return false;
		}
		if(document.getElementById("zbxmc").value ==""){
			alert("坐标系名称不允许为空！");
			return false;
		}
		document.myForm.action="<%=basePath%>/business/business_updateYhxm.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
    </script>
	</head>

<body>
<form name="myForm" method="post" >
	<div class="place" >
		<span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="###">海域使用动态管理</a></li>
			<li><a href="###" >用海项目信息管理</a></li>
			<li><a href="###">新增</a></li>
		</ul>
	</div>
	<input name="xmID" id="xmID" value="${xmID }" type="hidden" />
	<input name="zsID" id="zsID" value="" type="hidden" />
	
	
	<div class="formbody" >
		<div id="usual1" class="usual">
			<div class="leftinfo1">
				<div class="itab" >
					<ul>
						<li><a href="###" onclick="goAdd1()" class="selected">
							项目信息
							<c:if test="${not empty xmID}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty xmID}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if>
						</a></li>
						<li><a href="###" onclick="goAdd2()">项目附件
							<c:if test="${not empty yhxmfjList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmfjList}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if>
						</a></li>
						<li><a href="###" onclick="goAdd3()">宗海信息
							<c:if test="${not empty yhxmzsxxList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmzsxxList}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if>
						</a></li>
					</ul>
				</div>
					
				<div id="tab1" class="tabson">
					<input name="hysyywHysydtYhxm.id" id="hysyywHysydtYhxm.id" value="${hysyywHysydtYhxm.id }" type="hidden" />
					<input name="hysyywHysydtYhxm.addtime" id="hysyywHysydtYhxm.addtime" value="${hysyywHysydtYhxm.addtime }" type="hidden" />
					<input name="hysyywHysydtYhxm.addusername" id="hysyywHysydtYhxm.addusername" value="${hysyywHysydtYhxm.addusername }" type="hidden" />
					<input name="hysyywHysydtYhxm.adduserid" id="hysyywHysydtYhxm.adduserid" value="${hysyywHysydtYhxm.adduserid }" type="hidden" />
					<input name="hysyywHysydtYhxm.zt" id="hysyywHysydtYhxm.zt" value="${hysyywHysydtYhxm.zt }" type="hidden" />
	
				
					<table style="width:98%;" class="tablelist2" align="center">
							<tr>
								<th colspan="4">基本信息</th>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">用海项目名称：</td>
								<td colspan="3">
									<input name="hysyywHysydtYhxm.yhxmmc" id="hysyywHysydtYhxm.yhxmmc" type="text" value="${hysyywHysydtYhxm.yhxmmc }" style="width:400px;" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td width="22%"  style="background-color:#f5f8fa;">项目位置：</td>
								<td width="28%">
									<select name="hysyywHysydtYhxm.xmwz" id="xmwz" style="width:200px;">
										<option value="">-请选择-</option>
									</select><font color="red">*</font>
									<input name="xmwzY" id="xmwzY" type="hidden" value="${hysyywHysydtYhxm.xmwz }" style="width:200px;" />
								</td>
								<td width="20%"  style="background-color:#f5f8fa;">证书数量：</td>
								<td width="30%">
									<input name="hysyywHysydtYhxm.zssl" id="hysyywHysydtYhxm.zssl" class="NumText" type="text" value="${hysyywHysydtYhxm.zssl }" style="width:200px;" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">用海总面积：</td>
								<td>
									<input name="hysyywHysydtYhxm.yhzmj" id="hysyywHysydtYhxm.yhzmj" class="NumDecText" type="text" value="${hysyywHysydtYhxm.yhzmj }" style="width:200px;" />
									公顷
									<input name="hysyywHysydtYhxm.mjdw" id="hysyywHysydtYhxm.mjdw" type="hidden" value="3" style="width:100px;" />
									<font color="red">*</font>
								</td>
								<td  style="background-color:#f5f8fa;">投资额：</td>
								<td>
									<input name="hysyywHysydtYhxm.tze" id="hysyywHysydtYhxm.tze" class="NumDecText" type="text" value="${hysyywHysydtYhxm.tze }" style="width:100px;" />
									<select name="hysyywHysydtYhxm.tzedw" id="tzedw">
									</select>
									<input name="tzedwY" id="tzedwY" type="hidden" value="${hysyywHysydtYhxm.tzedw }" style="width:100px;" />
									</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">占用岸线：</td>
								<td>
								<input name="hysyywHysydtYhxm.zyax" id="hysyywHysydtYhxm.zyax" class="NumDecText" type="text" value="${hysyywHysydtYhxm.zyax }" style="width:200px;" />
								米<font color="red">*</font>
								</td>
								<td  style="background-color:#f5f8fa;">新增岸线：</td>
								<td>
								<input name="hysyywHysydtYhxm.xzax" id="hysyywHysydtYhxm.xzax" class="NumDecText" type="text" value="${hysyywHysydtYhxm.xzax }" style="width:200px;" />
								米<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">其中占用自然岸线：</td>
								<td>
								<input name="hysyywHysydtYhxm.zyax_zr" id="hysyywHysydtYhxm.zyax_zr" class="NumDecText" type="text" value="${hysyywHysydtYhxm.zyax_zr }" style="width:200px;" />
								米</td>
								<td  style="background-color:#f5f8fa;">占用人工岸线：</td>
								<td>
								<input name="hysyywHysydtYhxm.zyax_rg" id="hysyywHysydtYhxm.zyax_rg" class="NumDecText" type="text" value="${hysyywHysydtYhxm.zyax_rg }" style="width:200px;" />
								米</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">预计就业人数：</td>
								<td>
								<input name="hysyywHysydtYhxm.yjjyrs" id="hysyywHysydtYhxm.yjjyrs" class="NumDecText" type="text" value="${hysyywHysydtYhxm.yjjyrs }" style="width:200px;" />
								人</td>
								<td  style="background-color:#f5f8fa;">预计拉动区域经济产值：</td>
								<td>
								<input name="hysyywHysydtYhxm.yjldqyjjcz" id="hysyywHysydtYhxm.yjldqyjjcz" class="NumDecText" type="text" value="${hysyywHysydtYhxm.yjldqyjjcz }" style="width:200px;" />
								万元</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">临近土地平均价格：</td>
								<td>
								<input name="hysyywHysydtYhxm.ljtdpjjg" id="hysyywHysydtYhxm.ljtdpjjg" class="NumDecText" type="text" value="${hysyywHysydtYhxm.ljtdpjjg }" style="width:180px;" />
								万元/公顷</td>
								<td  style="background-color:#f5f8fa;">填海成本：</td>
								<td>
								<input name="hysyywHysydtYhxm.thcb" id="hysyywHysydtYhxm.thcb" class="NumDecText" type="text" value="${hysyywHysydtYhxm.thcb }" style="width:180px;" />
								万元/公顷</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">项目性质：</td>
								<td colspan="3">
									<select name="hysyywHysydtYhxm.xmxz" id="xmxz" style="width:200px;">
										<option value="">-请选择-</option>
									</select>
									<input name="xmxzY" id="xmxzY" type="hidden" value="${hysyywHysydtYhxm.xmxz }" style="width:100px;" />
								</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">受理机关级别：</td>
								<td>
									<select name="hysyywHysydtYhxm.sljgjb" id="sljgjb" style="width:200px;">
										<option value="">-请选择-</option>
									</select>
									<input name="sljgjbY" id="sljgjbY" type="hidden" value="${hysyywHysydtYhxm.sljgjb }" />
								</td>
								<td  style="background-color:#f5f8fa;">受理日期：</td>
								<td>
									<input name="hysyywHysydtYhxm.slrq" id="slrq" type="text" value="${hysyywHysydtYhxm.slrq }" onclick="WdatePicker()" readonly="readonly" style="width:200px;" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">海域等别：</td>
								<td>
									<select name="hysyywHysydtYhxm.hydb" id="hydb" style="width:200px;">
										<option value="">-请选择-</option>
									</select><font color="red">*</font>
									<input name="hydbY" id="hydbY" type="hidden" value="${hysyywHysydtYhxm.hydb }" style="width:100px;" />
								</td>
								<td  style="background-color:#f5f8fa;">用海批准日期：</td>
								<td>
								<input name="hysyywHysydtYhxm.yhpzrq" id="hysyywHysydtYhxm.yhpzrq" onclick="WdatePicker()" readonly="readonly" type="text" value="${hysyywHysydtYhxm.yhpzrq }" style="width:200px;" />
								<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">登记机关：</td>
								<td>
								<input name="hysyywHysydtYhxm.djjg" id="hysyywHysydtYhxm.djjg" type="text" value="${hysyywHysydtYhxm.djjg }" style="width:200px;" />
								</td>
								<td  style="background-color:#f5f8fa;">发证机关级别：</td>
								<td>
									<select name="hysyywHysydtYhxm.fzjgjb" id="fzjgjb" style="width:200px;">
										<option value="">-请选择-</option>
									</select><font color="red">*</font>
									<input name="fzjgjbY" id="fzjgjbY" type="hidden" value="${hysyywHysydtYhxm.fzjgjb }" />
								</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">发证机关：</td>
								<td>
								<input name="hysyywHysydtYhxm.fzjg" id="hysyywHysydtYhxm.fzjg" type="text" value="${hysyywHysydtYhxm.fzjg }" style="width:200px;" />
								</td>
								<td  style="background-color:#f5f8fa;">审批机关：</td>
								<td>
								<input name="hysyywHysydtYhxm.spjg" id="hysyywHysydtYhxm.spjg" type="text" value="${hysyywHysydtYhxm.spjg }" style="width:200px;" />
								<font color="red">*</font>
								</td>
							</tr>
							<!-- 
							<tr>
								<td  style="background-color:#f5f8fa;">用海位置文字说明：</td>
								<td colspan="3">
									<textarea name="hysyywHysydtYhxm.yhwzwzsm" id="hysyywHysydtYhxm.yhwzwzsm" rows="3" cols="80" ></textarea>
									<font color="red">*</font>
								</td>
							</tr>
							 -->
							<tr>
								<td  style="background-color:#f5f8fa;">项目其他相关批准文件和材料：</td>
								<td colspan="3">
									<textarea name="hysyywHysydtYhxm.xmwjcl" id="hysyywHysydtYhxm.xmwjcl" rows="3" cols="80" >${hysyywHysydtYhxm.xmwjcl }</textarea>
								</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">备注：</td>
								<td colspan="3">
									<textarea name="hysyywHysydtYhxm.bz" id="hysyywHysydtYhxm.bz" rows="3" cols="80" >${hysyywHysydtYhxm.bz }</textarea>
								</td>
							</tr>
							<tr>
								<th colspan="4">使用权人信息</th>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">社会信用代码：</td>
								<td colspan="3">
									<input name="hysyywHysydtYhxm.shxydm" id="hysyywHysydtYhxm.shxydm" type="text" value="${hysyywHysydtYhxm.shxydm }" style="width:400px;" />
								</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">海域使用权人：</td>
								<td colspan="3">
									<input name="hysyywHysydtYhxm.hysyqr" id="hysyywHysydtYhxm.hysyqr" type="text" value="${hysyywHysydtYhxm.hysyqr }" style="width:400px;" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">法定代表人：</td>
								<td colspan="3">
								<input name="hysyywHysydtYhxm.fddbr" id="hysyywHysydtYhxm.fddbr" type="text" value="${hysyywHysydtYhxm.fddbr }" style="width:200px;" />
								</td>
								
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">法定代表人职务：</td>
								<td>
								<input name="hysyywHysydtYhxm.fddbrzw" id="hysyywHysydtYhxm.fddbrzw" type="text" value="${hysyywHysydtYhxm.fddbrzw }" style="width:200px;" />
								</td>
								<td  style="background-color:#f5f8fa;">法定代表人身份证：</td>
								<td>
								<input name="hysyywHysydtYhxm.fddbrsfz" id="hysyywHysydtYhxm.fddbrsfz" type="text" value="${hysyywHysydtYhxm.fddbrsfz }" style="width:200px;" />
								</td>
								
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">联系人姓名：</td>
								<td>
								<input name="hysyywHysydtYhxm.lxrxm" id="hysyywHysydtYhxm.lxrxm" type="text" value="${hysyywHysydtYhxm.lxrxm }" style="width:200px;" />
								</td>
								<td  style="background-color:#f5f8fa;">联系人电话：</td>
								<td>
								<input name="hysyywHysydtYhxm.lxrdh" id="hysyywHysydtYhxm.lxrdh" type="text" value="${hysyywHysydtYhxm.lxrdh }" style="width:200px;" />
								</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">手机：</td>
								<td>
								<input name="hysyywHysydtYhxm.sj" id="hysyywHysydtYhxm.sj" class="NumDecText" type="text" value="${hysyywHysydtYhxm.sj }" style="width:200px;" />
								</td>
								<td  style="background-color:#f5f8fa;">传真：</td>
								<td>
								<input name="hysyywHysydtYhxm.cz" id="hysyywHysydtYhxm.cz" type="text" value="${hysyywHysydtYhxm.cz }" style="width:200px;" />
								</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">邮政编码：</td>
								<td>
								<input name="hysyywHysydtYhxm.yzbm" id="hysyywHysydtYhxm.yzbm" class="NumDecText" type="text" value="${hysyywHysydtYhxm.yzbm }" style="width:200px;" />
								</td>
								<td style="background-color:#f5f8fa;">通讯地址：</td>
								<td>
								<input name="hysyywHysydtYhxm.txdz" id="hysyywHysydtYhxm.txdz" type="text" value="${hysyywHysydtYhxm.txdz }" style="width:200px;" />
								</td>
							</tr>
							
							<tr>
								<th colspan="4">海籍调查信息</th>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">测绘负责人：</td>
								<td>
								<input name="hysyywHysydtYhxm.chfzr" id="hysyywHysydtYhxm.chfzr" type="text" value="${hysyywHysydtYhxm.chfzr }" style="width:200px;" />
								</td>
								<td  style="background-color:#f5f8fa;">测绘单位：</td>
								<td>
								<input name="hysyywHysydtYhxm.chdw" id="hysyywHysydtYhxm.chdw" type="text" value="${hysyywHysydtYhxm.chdw }" style="width:200px;" />
								</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">测绘日期：</td>
								<td>
								<input name="hysyywHysydtYhxm.chrq" id="hysyywHysydtYhxm.chrq" type="text"  value="${hysyywHysydtYhxm.chrq }" style="width:200px;" onclick="WdatePicker()" readonly="readonly" />
								</td>
								<td  style="background-color:#f5f8fa;">测绘点数：</td>
								<td>
								<input name="hysyywHysydtYhxm.chds" id="hysyywHysydtYhxm.chds" class="NumText" type="text" value="${hysyywHysydtYhxm.chds }" style="width:200px;" />
								</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">投影：</td>
								<td>
									<select name="hysyywHysydtYhxm.ty" id="ty" style="width:200px;">
										<option value="">-请选择-</option>
									</select>
									<input name="tyY" id="tyY" type="hidden" value="${hysyywHysydtYhxm.ty }" />
								</td>
								<td  style="background-color:#f5f8fa;">概略比例尺：</td>
								<td>
								<input name="hysyywHysydtYhxm.glblc" id="hysyywHysydtYhxm.glblc" type="text" value="${hysyywHysydtYhxm.glblc }" style="width:200px;" />
								</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">坐标系名称：</td>
								<td colspan="3">
									<select name="hysyywHysydtYhxm.zbxmc" id="zbxmc" style="width:200px;">
										<option value="">-请选择-</option>
									</select><font color="red">*</font>
									<input name="zbxmcY" id="zbxmcY" type="hidden" value="${hysyywHysydtYhxm.zbxmc }" />
								</td>
							</tr>
							<tr>
								<th colspan="4">论证报告</th>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">论证报告名称：</td>
								<td><input name="hysyywHysydtYhxm.lzbgmc" id="hysyywHysydtYhxm.lzbgmc" type="text" value="${hysyywHysydtYhxm.lzbgmc }" style="width:200px;" /></td>
								<td  style="background-color:#f5f8fa;">论证单位：</td>
								<td><input name="hysyywHysydtYhxm.lzdw" id="hysyywHysydtYhxm.lzdw" type="text" value="${hysyywHysydtYhxm.lzdw }" style="width:200px;" /></td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">资质等级：</td>
								<td>
									<select name="hysyywHysydtYhxm.zzdj" id="zzdj" style="width:200px;">
										<option value="">-请选择-</option>
									</select>
									<input name="zzdjY" id="zzdjY" type="hidden" value="${hysyywHysydtYhxm.zzdj }" />
								</td>
								<td  style="background-color:#f5f8fa;">项目负责人：</td>
								<td><input name="hysyywHysydtYhxm.xmfzr" id="hysyywHysydtYhxm.xmfzr" type="text" value="${hysyywHysydtYhxm.xmfzr }" style="width:200px;" /></td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">组织评审部门：</td>
								<td><input name="hysyywHysydtYhxm.zzpsbm" id="hysyywHysydtYhxm.zzpsbm" type="text" value="${hysyywHysydtYhxm.zzpsbm }" style="width:200px;" /></td>
								<td  style="background-color:#f5f8fa;">评审专家组组长：</td>
								<td><input name="hysyywHysydtYhxm.pszjzzz" id="hysyywHysydtYhxm.pszjzzz" type="text" value="${hysyywHysydtYhxm.pszjzzz }" style="width:200px;" /></td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">评审日期：</td>
								<td><input name="hysyywHysydtYhxm.psrq" id="hysyywHysydtYhxm.psrq" type="text" value="${hysyywHysydtYhxm.psrq }" onclick="WdatePicker()" readonly="readonly" style="width:200px;" /></td>
								<td  style="background-color:#f5f8fa;">质量评估分：</td>
								<td><input name="hysyywHysydtYhxm.zlpgf" id="hysyywHysydtYhxm.zlpgf" class="NumText" type="text" value="${hysyywHysydtYhxm.zlpgf }" style="width:200px;" /></td>
							</tr>
							
							
							<tr>
								<td colspan="4" style="text-align:center;">
								<input name="save" type="button" class="scbtn" onclick="saveYhxm()" value="保存" />
								<input name="back" type="button" class="scbtn" onclick="goBack()" value="返回" />
								
								</td>
							</tr>
					</table>
				</div>

		</div>
		</div>
	</div>


		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');

			if(document.getElementById("xmwzY").value ==""){
				document.getElementById("xmwz").value ="";
			}else{
				document.getElementById("xmwz").value =document.getElementById("xmwzY").value;
			}
			
			if(document.getElementById("tzedwY").value ==""){
				document.getElementById("tzedw").value ="";
			}else{
				document.getElementById("tzedw").value =document.getElementById("tzedwY").value;
			}
			
			if(document.getElementById("hydbY").value ==""){
				document.getElementById("hydb").value ="";
			}else{
				document.getElementById("hydb").value =document.getElementById("hydbY").value;
			}

			if(document.getElementById("sljgjbY").value ==""){
				document.getElementById("sljgjb").value ="";
			}else{
				document.getElementById("sljgjb").value =document.getElementById("sljgjbY").value;
			}

		</script>

</form>
</body>
</html>