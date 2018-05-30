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
	var jnfsY=document.getElementById("jnfsY").value;
	getDictionary("使用金缴纳方式","jnfs",jnfsY);

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
//保存
function saveJntz(){
	if(document.getElementById("hysyqr").value ==""){
		alert("海域使用权人不允许为空！");
		return false;
	}
	if(document.getElementById("yhmj").value ==""){
		alert("用海面积不允许为空！");
		return false;
	}
	if(document.getElementById("slsj").value ==""){
		alert("受理时间不允许为空！");
		return false;
	}
	if(document.getElementById("pzdw").value ==""){
		alert("批准单位不允许为空！");
		return false;
	}
	if(document.getElementById("yhqssj").value ==""){
		alert("用海起始时间不允许为空！");
		return false;
	}
	if(document.getElementById("yhzzsj").value ==""){
		alert("用海终止时间不允许为空！");
		return false;
	}
	if(document.getElementById("yhqssj").value>document.getElementById("yhzzsj").value){
		alert("用海起始时间必须大于用海终止时间！");
		return false;
	}
	if(document.getElementById("syjze").value ==""){
		alert("海域使用总金额不允许为空！");
		return false;
	}
	if(document.getElementById("jnfs").value ==""){
		alert("海域使用金缴纳方式不允许为空！");
		return false;
	}
	if(document.getElementById("tzrq").value ==""){
		alert("通知日期不允许为空！");
		return false;
	}
	if(document.getElementById("khh").value ==""){
		alert("开户行不允许为空！");
		return false;
	}
	if(document.getElementById("jnksrq").value !="" && document.getElementById("jnjsrq").value !=""){
		if(document.getElementById("jnksrq").value>document.getElementById("jnjsrq").value){
			alert("缴纳结束日期必须大于缴纳开始日期！");
			return false;
		}
	}
	if(document.getElementById("djksrq").value !="" && document.getElementById("djjsrq").value !=""){
		if(document.getElementById("djksrq").value>document.getElementById("djjsrq").value){
			alert("登记结束日期必须大于登记开始日期！");
			return false;
		}
	}
	
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_addJntz.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

//返回
function goBack(){
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchZhxxList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
</script>
	</head>

	<body>
<form name="myForm" method="post" >

	<div class="place">
		<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">海域使用动态管理</a></li>
			<li>
				<a href="#">海域使用金征收管理</a>
			</li>
			<li>
				<a href="#">海域使用金缴纳通知</a>
			</li>
		</ul>
	</div>
	<div class="formbody" >
		<input name="zsID" id="zsID" type="hidden" value="${zsID }" />
		<input name="xmID" id="xmID" type="hidden" value="${xmID }" />
		<input name="zsbh" id="zsbh" type="hidden" value="${zsbh }" />

			<table width="100%" align="center" style="text-align:left;" class="tablelist2" >
				<tr>
					<th colspan="4" style="text-align:left;">
						<img src="${contextPath}/images/ico02.png" width="20" height="20" />新增
					</th>
				</tr>
				<!-- 
				t.id tid,z.id zid,t.hysyqr,t.yhzmj,t.SLRQ,t.FZJG,
				z.YHQSNX,z.YHZZNX,z.SYJZE,z.SYJJNFS,z.SYJZSBZ,z.SYJZSBZYJ
				 -->
				<c:forEach items="${ zsxxList }" var="r" varStatus="j">
				<c:if test="${ j.count=='1' }">
				<tr>
					<td width="20%" style="background-color:#f5f8fa;">海域使用权人：</td>
					<td width="30%"><input name="hysyywHysydtYhxmHysyjJntz.hysyqr" id="hysyqr" type="text" value="${r[2] }" style="width:180px;height:20px;" /><font color="red">*</font></td>
					<td width="20%" style="background-color:#f5f8fa;">用海面积：</td>
					<td width="30%"><input name="hysyywHysydtYhxmHysyjJntz.yhmj" id="yhmj" type="text" class="NumDecText" value="${r[3] }" style="width:180px;height:20px;" />公顷<font color="red">*</font></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">受理时间：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.slsj" id="slsj" onclick="WdatePicker()" readonly="readonly" type="text" value="${r[4] }" style="width:180px;height:20px;" /><font color="red">*</font></td>
					<td style="background-color:#f5f8fa;">批准单位：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.pzdw" id="pzdw" type="text" value="${r[5] }" style="width:180px;height:20px;" /><font color="red">*</font></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">用海起始时间：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.yhqssj" id="yhqssj" onclick="WdatePicker()" readonly="readonly" type="text" value="${r[6] }" style="width:180px;height:20px;" /><font color="red">*</font></td>
					<td style="background-color:#f5f8fa;">用海终止时间：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.yhzzsj" id="yhzzsj" onclick="WdatePicker()" readonly="readonly" type="text" value="${r[7] }" style="width:180px;height:20px;" /><font color="red">*</font></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域使用总金额：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.syjze" id="syjze" type="text" value="${r[8] }" class="NumDecText" style="width:180px;height:20px;" />元<font color="red">*</font></td>
					<td style="background-color:#f5f8fa;">海域使用金缴纳方式：</td>
					<td>
						<select name="hysyywHysydtYhxmHysyjJntz.syjjnfs" id="jnfs" style="width:180px;height:25px;">
							<option value="">-请选择-</option>
							
						</select><font color="red">*</font>
						<input name="jnfsY" id="jnfsY" type="hidden" value="${r[9] }" />
						
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域使用金征收标准：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.syjzsbz" id="syjzsbz" type="text" value="${r[10] }" style="width:180px;height:20px;" /></td>
					<td style="background-color:#f5f8fa;">海域使用金征收标准依据：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.syjzsbzyj" id="syjzsbzyj" type="text" value="${r[11] }" style="width:180px;height:20px;" /></td>
				</tr>
				</c:if>
				</c:forEach>
				<tr>
					<td style="background-color:#f5f8fa;">通知日期：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.tzrq" id="tzrq" onclick="WdatePicker()" readonly="readonly" type="text" value="" style="width:180px;height:20px;" /><font color="red">*</font></td>
					<td style="background-color:#f5f8fa;">缴纳地点：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.jndd" id="jndd" type="text" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">缴纳开始日期：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.jnksrq" id="jnksrq" onclick="WdatePicker()" readonly="readonly" type="text" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#f5f8fa;">缴纳结束日期：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.jnjsrq" id="jnjsrq" onclick="WdatePicker()" readonly="readonly" type="text" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">开户行：</td>
					<td>
						<select name="hysyywHysydtYhxmHysyjJntz.khh" id="khh" style="width:180px;height:25px;">
							<option value="">-请选择-</option>
							<option value="工商银行">工商银行</option>
							<option value="建设银行">建设银行</option>
						</select><font color="red">*</font>
					</td>
					<td style="background-color:#f5f8fa;">户名：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.hm" id="hm" type="text" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">账号：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.zh" id="zh" type="text" value="" class="NumText" style="width:180px;height:20px;" /></td>
					<td style="background-color:#f5f8fa;">通知机关：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.tzjg" id="tzjg" type="text" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">登记开始日期：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.djksrq" id="djksrq" onclick="WdatePicker()" readonly="readonly" type="text" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#f5f8fa;">登记结束日期：</td>
					<td><input name="hysyywHysydtYhxmHysyjJntz.djjsrq" id="djjsrq" onclick="WdatePicker()" readonly="readonly" type="text" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">登记地点：</td>
					<td colspan="3"><input name="hysyywHysydtYhxmHysyjJntz.djdd" id="djdd" type="text" value="" style="width:600px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="saveJntz()" value="保存" />
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack()" />
					</td>
				</tr>
			</table>
	
	</div>
</form>
<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
		

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		

	</body>

</html>