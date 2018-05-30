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
	//var yhfs_ej=document.getElementById("yhfsY").value;
	getDictionary("用海方式","yhfs_ej","");
	getDictionary("使用金缴纳方式","jnfs","");

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



function goZsxxAdd1(){
	document.myForm.action="<%=basePath%>/business/business_getUpdateZhxx.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goZsxxAdd2(){
	document.myForm.action="<%=basePath%>/business/business_fetchYhfs.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goZsxxAdd3(){
	document.myForm.action="<%=basePath%>/business/business_fetchHysyj.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goZsxxAdd4(){
	document.myForm.action="<%=basePath%>/business/business_fetchZhtList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goZsxxAdd5(){
	document.myForm.action="<%=basePath%>/business/business_fetchSqclList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goZsxxAdd6(){
	document.myForm.action="<%=basePath%>/business/business_goDtdw.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//保存
function addHysyj(){
	
	//校验
	if(document.getElementById("hysyywHysydtYhxmHysyj.jnrq").value ==""){
		alert("缴纳日期不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.djr").value ==""){
		alert("登记人不允许为空！");
		return false;
	}
	if(document.getElementById("yhfs_ej").value ==""){
		alert("用海方式（二级）不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.yhmj").value ==""){
		alert("用海面积（公顷）不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.syjdqrq").value ==""){
		alert("使用金到期日期不允许为空！");
		return false;
	}
	if(document.getElementById("jnfs").value ==""){
		alert("缴纳方式不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.yzje_ze").value ==""){
		alert("海域使用金应征金额-总额不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.yzje_zygk").value ==""){
		alert("海域使用金应征金额-中央 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.yzje_dfgk").value ==""){
		alert("海域使用金应征金额-地方 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.yzje_s").value ==""){
		alert("海域使用金应征金额-省 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.yzje_shi").value ==""){
		alert("海域使用金应征金额-市 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.yzje_q").value ==""){
		alert("海域使用金应征金额-区县 不允许为空！");
		return false;
	}
	
	if(document.getElementById("hysyywHysydtYhxmHysyj.zsje_xj").value ==""){
		alert("海域使用金征收金额-总额 不允许为空！");
		return false;
	}
	//alert(document.getElementById("hysyywHysydtYhxmHysyj.zsje_xj").value);
	if(document.getElementById("hysyywHysydtYhxmHysyj.zsje_zygk").value ==""){
		alert("海域使用金征收金额-中央 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.zsje_dfgk").value ==""){
		alert("海域使用金征收金额-地方 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.zsje_s").value ==""){
		alert("海域使用金征收金额-省 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.zsje_shi").value ==""){
		alert("海域使用金征收金额-市 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.zsje_q").value ==""){
		alert("海域使用金征收金额-区县 不允许为空！");
		return false;
	}
	
	if(document.getElementById("hysyywHysydtYhxmHysyj.jmje_xj").value ==""){
		alert("海域使用金减免金额-总额 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.jmje_zygk").value ==""){
		alert("海域使用金减免金额-中央 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.jmje_dfgk").value ==""){
		alert("海域使用金减免金额-地方 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.jmje_s").value ==""){
		alert("海域使用金减免金额-省 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.jmje_shi").value ==""){
		alert("海域使用金减免金额-市 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.jmje_q").value ==""){
		alert("海域使用金减免金额-区县 不允许为空！");
		return false;
	}
	
	document.myForm.action="<%=basePath%>/business/business_saveHysyj.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//获取修改
function getUpdate(id,addtime,lastupdatetime,addusername,adduserid,xmid,zsid,
		yhfs_ej,yhmj,yzje_zygk,yzje_dfgk,zsje_zygk,zsje_dfgk,zsje_xj,
		jmje_zygk,jmje_dfgk,jmje_xj,jnrq,xmlx,djr,djsj,
		sfwlsyh,yhsx,sm,syjdqrq,jnfs,
		yzje_ze,yzje_s,yzje_shi,yzje_q,
		zsje_s,zsje_shi,zsje_q,
		jmje_s,jmje_shi,jmje_q){
	document.getElementById("hysyywHysydtYhxmHysyj.id").value=id;
	document.getElementById("hysyywHysydtYhxmHysyj.addtime").value=addtime;
	document.getElementById("hysyywHysydtYhxmHysyj.lastupdatetime").value=lastupdatetime;
	document.getElementById("hysyywHysydtYhxmHysyj.addusername").value=addusername;
	document.getElementById("hysyywHysydtYhxmHysyj.adduserid").value=adduserid;
	document.getElementById("hysyywHysydtYhxmHysyj.xmid").value=xmid;
	document.getElementById("hysyywHysydtYhxmHysyj.zsid").value=zsid;
	
	document.getElementById("yhfs_ej").value=yhfs_ej;
	document.getElementById("hysyywHysydtYhxmHysyj.yhmj").value=yhmj;
	document.getElementById("hysyywHysydtYhxmHysyj.yzje_zygk").value=yzje_zygk;
	document.getElementById("hysyywHysydtYhxmHysyj.yzje_dfgk").value=yzje_dfgk;
	
	document.getElementById("hysyywHysydtYhxmHysyj.zsje_zygk").value=zsje_zygk;
	document.getElementById("hysyywHysydtYhxmHysyj.zsje_dfgk").value=zsje_dfgk;
	document.getElementById("hysyywHysydtYhxmHysyj.zsje_xj").value=zsje_xj;
	
	document.getElementById("hysyywHysydtYhxmHysyj.jmje_zygk").value=jmje_zygk;
	document.getElementById("hysyywHysydtYhxmHysyj.jmje_dfgk").value=jmje_dfgk;
	document.getElementById("hysyywHysydtYhxmHysyj.jmje_xj").value=jmje_xj;

	document.getElementById("hysyywHysydtYhxmHysyj.jnrq").value=jnrq;
	if(xmlx=="原有项目"){
		document.getElementById("xmlx1").checked=true;
		document.getElementById("xmlx2").checked=false;
	}
	if(xmlx=="新增项目"){
		document.getElementById("xmlx2").checked=true;
		document.getElementById("xmlx1").checked=false;
	}
	if(sfwlsyh=="是"){
		document.getElementById("sfwlsyh1").checked=true;
		document.getElementById("sfwlsyh2").checked=false;
	}
	if(sfwlsyh=="否"){
		document.getElementById("sfwlsyh2").checked=true;
		document.getElementById("sfwlsyh1").checked=false;
	}
	
	document.getElementById("yhsx").value=yhsx;
	document.getElementById("hysyywHysydtYhxmHysyj.sm").value=sm;
	document.getElementById("hysyywHysydtYhxmHysyj.syjdqrq").value=syjdqrq;
	document.getElementById("jnfs").value=jnfs;
	document.getElementById("hysyywHysydtYhxmHysyj.yzje_ze").value=yzje_ze;
	document.getElementById("hysyywHysydtYhxmHysyj.yzje_s").value=yzje_s;
	document.getElementById("hysyywHysydtYhxmHysyj.yzje_shi").value=yzje_shi;
	document.getElementById("hysyywHysydtYhxmHysyj.yzje_q").value=yzje_q;
	
	document.getElementById("hysyywHysydtYhxmHysyj.zsje_s").value=zsje_s;
	document.getElementById("hysyywHysydtYhxmHysyj.zsje_shi").value=zsje_shi;
	document.getElementById("hysyywHysydtYhxmHysyj.zsje_q").value=zsje_q;
	
	document.getElementById("hysyywHysydtYhxmHysyj.jmje_s").value=jmje_s;
	document.getElementById("hysyywHysydtYhxmHysyj.jmje_shi").value=jmje_shi;
	document.getElementById("hysyywHysydtYhxmHysyj.jmje_q").value=jmje_q;
		
	document.getElementById("hysyywHysydtYhxmHysyj.djr").value=djr;
	document.getElementById("hysyywHysydtYhxmHysyj.djsj").value=djsj;
	document.getElementById("xgButton").style.display="";
	document.getElementById("bcButton").style.display="none";
}

//修改
function updateHysyj(){
	//校验
	if(document.getElementById("hysyywHysydtYhxmHysyj.jnrq").value ==""){
		alert("缴纳日期不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.djr").value ==""){
		alert("登记人不允许为空！");
		return false;
	}
	if(document.getElementById("yhfs_ej").value ==""){
		alert("用海方式（二级）不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.yhmj").value ==""){
		alert("用海面积（公顷）不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.syjdqrq").value ==""){
		alert("使用金到期日期不允许为空！");
		return false;
	}
	if(document.getElementById("jnfs").value ==""){
		alert("缴纳方式不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.yzje_ze").value ==""){
		alert("海域使用金应征金额-总额允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.yzje_zygk").value ==""){
		alert("海域使用金应征金额-中央 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.yzje_dfgk").value ==""){
		alert("海域使用金应征金额-地方 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.yzje_s").value ==""){
		alert("海域使用金应征金额-省 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.yzje_shi").value ==""){
		alert("海域使用金应征金额-市 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.yzje_q").value ==""){
		alert("海域使用金应征金额-区县 不允许为空！");
		return false;
	}
	//alert(document.getElementById("hysyywHysydtYhxmHysyj.zsje_xj").value);
	if(document.getElementById("hysyywHysydtYhxmHysyj.zsje_xj").value ==""){
		alert("海域使用金征收金额-总额 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.zsje_zygk").value ==""){
		alert("海域使用金征收金额-中央 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.zsje_dfgk").value ==""){
		alert("海域使用金征收金额-地方 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.zsje_s").value ==""){
		alert("海域使用金征收金额-省 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.zsje_shi").value ==""){
		alert("海域使用金征收金额-市 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.zsje_q").value ==""){
		alert("海域使用金征收金额-区县 不允许为空！");
		return false;
	}
	
	if(document.getElementById("hysyywHysydtYhxmHysyj.jmje_xj").value ==""){
		alert("海域使用金减免金额-总额 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.jmje_zygk").value ==""){
		alert("海域使用金减免金额-中央 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.jmje_dfgk").value ==""){
		alert("海域使用金减免金额-地方 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.jmje_s").value ==""){
		alert("海域使用金减免金额-省 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.jmje_shi").value ==""){
		alert("海域使用金减免金额-市 不允许为空！");
		return false;
	}
	if(document.getElementById("hysyywHysydtYhxmHysyj.jmje_q").value ==""){
		alert("海域使用金减免金额-区县 不允许为空！");
		return false;
	}
	document.myForm.action="<%=basePath%>/business/business_updateHysyj.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//删除
function deleteHysyj(hysyjID){
	if(confirm("确定删除该记录吗？")){
		document.getElementById("hysyjID").value = hysyjID;
		document.myForm.action="<%=basePath%>/business/business_deleteHysyj.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
}


</script>
</head>
<body>
<form name="myForm" method="post" >
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="leftinfo1">
				<div class="itab">
					<ul>
						<li>
							<a href="###" onclick="goZsxxAdd1()">证书信息
							<c:if test="${not empty zsID}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty zsID}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if>
							</a>
						</li>
						<li><a href="###" onclick="goZsxxAdd2()" >用海方式
							<c:if test="${not empty yhxmyhfsList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmyhfsList }">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if></a>
						</li>
						<li><a href="###" onclick="goZsxxAdd3()" class="selected">海域使用金
							<c:if test="${not empty yhxmsyjList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmsyjList}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if></a>
						</li>
						<li><a href="###" onclick="goZsxxAdd4()">宗海图
							<c:if test="${not empty yhxmzhtList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmzhtList}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if></a>
						</li>
						<li><a href="###" onclick="goZsxxAdd5()">申请材料
							<c:if test="${not empty yhxmsqclList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmsqclList}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if></a>
						</li>
						<li><a href="###" onclick="goZsxxAdd6()">地图定位
							<c:if test="${not empty yhxmyhfsjzdList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmyhfsjzdList}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if></a>
						</li>
					</ul>
				</div>
				
			<div id="tab9" class="tabson" >
			<table width="100%" align="center" class="tablelist2" style="text-align:left;">
					<!-- 
					t.id tid,y.id yid,t.zsh,y.yhxmmc,y.xmwz,y.hysyqr,t.QQFS,
				t.YHLXA,t.YHLXB,t.SFWLSYH,t.YHSX
					 -->
					<tr>
						<th colspan="10" style="text-align:left;">
						<img src="${contextPath}/images/ico04.png" width="20" height="20" />缴纳明细
						</th>
					</tr>
					<c:forEach items="${ zsxxList }" var="r" varStatus="j">
					<tr>
						<td style="background-color:#f5f8fa;">海域管理号：</td>
						<td colspan="3">${r[2]}
						<input name="hysyywHysydtYhxmHysyj.hyglh" id="hysyywHysydtYhxmHysyj.hyglh" type="hidden" value="${r[2]}" />
						</td>
					</tr>
					<tr>
						<td width="20%" style="background-color:#f5f8fa;">项目名称：</td>
						<td width="30%">${r[3] }
						<input name="hysyywHysydtYhxmHysyj.xmmc" id="xmmc" type="hidden" value="${r[3] }" />
						</td>
						<td width="20%" style="background-color:#f5f8fa;">项目位置：</td>
						<td width="30%">${r[11] }
						<input name="hysyywHysydtYhxmHysyj.xmwz" id="xmwz" type="hidden" value="${r[4] }" />
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海域使用权人：</td>
						<td>${r[5] }
						<input name="hysyywHysydtYhxmHysyj.hysyqr" id="hysyqr" type="hidden" value="${r[5] }" />
						</td>
						<td style="background-color:#f5f8fa;">确权方式：</td>
						<td>${r[12] }
						<input name="hysyywHysydtYhxmHysyj.qqfs" id="qqfs" type="hidden" value="${r[6] }" />
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">用海类型A：</td>
						<td>${r[13] }
						<input name="hysyywHysydtYhxmHysyj.yhlxa" id="yhlxa" type="hidden" value="${r[7] }" />
						</td>
						<td style="background-color:#f5f8fa;">用海类型B：</td>
						<td>${r[14] }
						<input name="hysyywHysydtYhxmHysyj.yhlxb" id="yhlxb" type="hidden" value="${r[8] }" />
						</td>
					</tr>
					
					<tr>
						<td style="background-color:#f5f8fa;">是否为临时用海：</td>
						<td>
							<input type="radio" name="hysyywHysydtYhxmHysyj.sfwlsyh" id="sfwlsyh1" value="是" style="border:0;" />是
							<input type="radio" name="hysyywHysydtYhxmHysyj.sfwlsyh" id="sfwlsyh2" value="否" style="border:0;" />否
							<font color="red">*</font>
							<!-- ${r[9] } -->
							<input name="sfwlsyhY" id="sfwlsyhY" type="hidden" value="" />
						</td>
						<td style="background-color:#f5f8fa;">用海时限（日）：</td>
						<td>
						<input name="hysyywHysydtYhxmHysyj.yhsx" id="yhsx" type="text" value="${r[10] }" />
						</td>
					</tr>
					</c:forEach>
				</table><br />
				
			
			<input name="xmID" id="xmID" value="${xmID }" type="hidden" />
			<input name="zsID" id="zsID" value="${zsID }" type="hidden" />
			<input name="hysyjID" id="hysyjID" value="" type="hidden" />
			
			
				<table class="tablelist"  width="100%">
					<tr>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th colspan="6">海域使用金应征金额（元）</th>
						<th colspan="6">海域使用金征收金额（元）</th>
						<th colspan="6">海域使用金减免金额（元）</th>
						<th></th>
					</tr>
					<tr>
						<th>序号</th>
						<th>缴纳日期</th>
						<th>用海方式<!-- （二级） --></th>
						<th>用海面积<!-- （公顷） --></th>
						
						<th>总额</th>
						<th>中央</th>
						<th>地方</th>
						<th>省</th>
						<th>市</th>
						<th>区县</th>
						
						<th>总额</th>
						<th>中央</th>
						<th>地方</th>
						<th>省</th>
						<th>市</th>
						<th>区县</th>
						
						<th>总额</th>
						<th>中央</th>
						<th>地方</th>
						<th>省</th>
						<th>市</th>
						<th>区县</th>
						
						<th>操作</th>
					</tr>
					<c:forEach items="${ yhxmsyjList }" var="r" varStatus="j">
					<tr>
						<td>${ j.count }</td>
						<td>${r.jnrq }</td>
						<td>
						<c:if test="${r.yhfs_ej=='11' }">建设填海造地</c:if>
						<c:if test="${r.yhfs_ej=='12' }">农业填海造地</c:if>
						<c:if test="${r.yhfs_ej=='13' }">废弃物处置填海造地</c:if>
						<c:if test="${r.yhfs_ej=='21' }">非透水构筑物</c:if>
						<c:if test="${r.yhfs_ej=='22' }">跨海桥梁、海底隧道等</c:if>
						<c:if test="${r.yhfs_ej=='23' }">透水构筑物</c:if>
						<c:if test="${r.yhfs_ej=='31' }">港池、蓄水等</c:if>
						<c:if test="${r.yhfs_ej=='32' }">盐业</c:if>
						<c:if test="${r.yhfs_ej=='33' }">围海养殖</c:if>
						<c:if test="${r.yhfs_ej=='41' }">开放式养殖</c:if>
						<c:if test="${r.yhfs_ej=='42' }">浴场</c:if>
						<c:if test="${r.yhfs_ej=='43' }">游乐场</c:if>
						<c:if test="${r.yhfs_ej=='44' }">专用航道、锚地及其它开放式</c:if>
						<c:if test="${r.yhfs_ej=='51' }">人工岛式油气开采</c:if>
						<c:if test="${r.yhfs_ej=='52' }">平台式油气开采</c:if>
						<c:if test="${r.yhfs_ej=='53' }">海底电缆管道</c:if>
						<c:if test="${r.yhfs_ej=='54' }">海砂等矿产开采</c:if>
						<c:if test="${r.yhfs_ej=='55' }">取、排水口</c:if>
						<c:if test="${r.yhfs_ej=='56' }">污水达标排放</c:if>
						<c:if test="${r.yhfs_ej=='57' }">倾倒</c:if>
						</td>
						
						
						<td>${r.yhmj }公顷</td>
						
						<td>${r.yzje_ze }</td>
						<td>${r.yzje_zygk }</td>
						<td>${r.yzje_dfgk }</td>
						<td>${r.yzje_s }</td>
						<td>${r.yzje_shi }</td>
						<td>${r.yzje_q }</td>
						
						<td>${r.zsje_xj }</td>
						<td>${r.zsje_zygk }</td>
						<td>${r.zsje_dfgk }</td>
						<td>${r.zsje_s }</td>
						<td>${r.zsje_shi }</td>
						<td>${r.zsje_q }</td>
						
						<td>${r.jmje_xj }</td>
						<td>${r.jmje_zygk }</td>
						<td>${r.jmje_dfgk }</td>
						<td>${r.jmje_s }</td>
						<td>${r.jmje_shi }</td>
						<td>${r.jmje_q }</td>
						
						<td>
							<a href="###" onclick="getUpdate('${r.id }','${r.addtime }','${r.lastupdatetime }','${r.addusername }','${r.adduserid }','${r.xmid }','${r.zsid }',
							'${r.yhfs_ej }','${r.yhmj }','${r.yzje_zygk }','${r.yzje_dfgk }','${r.zsje_zygk }','${r.zsje_dfgk }',
							'${r.zsje_xj }','${r.jmje_zygk }','${r.jmje_dfgk }','${r.jmje_xj }','${r.jnrq }','${r.xmlx }','${r.djr}','${r.djsj }',
							'${r.sfwlsyh }','${r.yhsx }','${r.sm }','${r.syjdqrq }','${r.jnfs }',
							'${r.yzje_ze }','${r.yzje_s }','${r.yzje_shi }','${r.yzje_q }',
							'${r.zsje_s }','${r.zsje_shi }','${r.zsje_q }',
							'${r.jmje_s }','${r.jmje_shi }','${r.jmje_q }')" class="tablelink">修改</a>
							<a href="###" onclick="deleteHysyj('${r.id }')" class="tablelink">删除</a>
						</td>
					</tr>
					</c:forEach>
				</table>
				<br />
				
				<table class="tablelist"  width="100%">
					<tr>
						<th colspan="18" style="text-align:left;">
						<img src="${contextPath}/images/ico04.png" width="20" height="20" />新增/修改
						</th>
					</tr>
					<tr>
					<td colspan="18">
					<table width="100%" align="center" class="tableXQ" style="text-align:left;">
					<tr>
						<td width="20%" style="background-color:#f5f8fa;">缴纳日期：</td>
						<td width="30%" style="background-color:#ffffff;">
							<input name="hysyywHysydtYhxmHysyj.jnrq" onclick="WdatePicker()" readonly="readonly" id="hysyywHysydtYhxmHysyj.jnrq" type="text" value="" />
							<font color="red">*</font>
						</td>
						<td width="20%" style="background-color:#f5f8fa;">项目类型：</td>
						<td width="30%" style="background-color:#ffffff;">
							<input type="radio" name="hysyywHysydtYhxmHysyj.xmlx" id="xmlx1" value="原有项目" style="border:0;"/>原有项目
							<input type="radio" name="hysyywHysydtYhxmHysyj.xmlx" id="xmlx2" value="新增项目" style="border:0;" checked="checked"/>新增项目
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">登记人：</td>
						<td style="background-color:#ffffff;">
							<input name="hysyywHysydtYhxmHysyj.djr" id="hysyywHysydtYhxmHysyj.djr" type="text" value="" />
							<font color="red">*</font>
						</td>
						<td style="background-color:#f5f8fa;">缴纳登记日期：</td>
						<td style="background-color:#ffffff;">
							<input name="hysyywHysydtYhxmHysyj.djsj" id="hysyywHysydtYhxmHysyj.djsj" disabled="disabled" readonly="readonly" type="text" value="" />
							
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">说明：</td>
						<td colspan="3" style="background-color:#ffffff;">
							<textarea name="hysyywHysydtYhxmHysyj.sm" id="hysyywHysydtYhxmHysyj.sm" cols="60" rows="4"></textarea>
						</td>
					</tr>
					</table>
					</td>
					</tr>
					<tr>
						<th colspan="6">海域使用金应征金额（元）</th>
						<th colspan="6">海域使用金征收金额（元）</th>
						<th colspan="6">海域使用金减免金额（元）</th>
					</tr>
					<tr>
						
						<th width="5%">总额</th>
						<th width="5%">中央</th>
						<th width="5%">地方</th>
						<th width="5%">省</th>
						<th width="5%">市</th>
						<th width="5%">区县</th>
						
						<th width="5%">总额</th>
						<th width="5%">中央</th>
						<th width="5%">地方</th>
						<th width="5%">省</th>
						<th width="5%">市</th>
						<th width="5%">区县</th>
						
						<th width="5%">总额</th>
						<th width="5%">中央</th>
						<th width="5%">地方</th>
						<th width="5%">省</th>
						<th width="5%">市</th>
						<th width="5%">区县</th>
						
					</tr>
					<tr>
						
						<td><input name="hysyywHysydtYhxmHysyj.yzje_ze" id="hysyywHysydtYhxmHysyj.yzje_ze" class="NumDecText" type="text" value="" style="width:50px;" /></td>
						<td><input name="hysyywHysydtYhxmHysyj.yzje_zygk" id="hysyywHysydtYhxmHysyj.yzje_zygk" class="NumDecText" type="text" value="" style="width:50px;" /></td>
						<td><input name="hysyywHysydtYhxmHysyj.yzje_dfgk" id="hysyywHysydtYhxmHysyj.yzje_dfgk" class="NumDecText" type="text" value="" style="width:50px;" /></td>
						<td><input name="hysyywHysydtYhxmHysyj.yzje_s" id="hysyywHysydtYhxmHysyj.yzje_s" class="NumDecText" type="text" value="0" style="width:40px;" /></td>
						<td><input name="hysyywHysydtYhxmHysyj.yzje_shi" id="hysyywHysydtYhxmHysyj.yzje_shi" class="NumDecText" type="text" value="0" style="width:40px;" /></td>
						<td><input name="hysyywHysydtYhxmHysyj.yzje_q" id="hysyywHysydtYhxmHysyj.yzje_q" class="NumDecText" type="text" value="0" style="width:40px;" /></td>
						
						<td><input name="hysyywHysydtYhxmHysyj.zsje_xj" id="hysyywHysydtYhxmHysyj.zsje_xj" class="NumDecText" type="text" value="" style="width:50px;" /></td>
						<td><input name="hysyywHysydtYhxmHysyj.zsje_zygk" id="hysyywHysydtYhxmHysyj.zsje_zygk" class="NumDecText" type="text" value="" style="width:50px;" /></td>
						<td><input name="hysyywHysydtYhxmHysyj.zsje_dfgk" id="hysyywHysydtYhxmHysyj.zsje_dfgk" class="NumDecText" type="text" value="" style="width:50px;" /></td>
						<td><input name="hysyywHysydtYhxmHysyj.zsje_s" id="hysyywHysydtYhxmHysyj.zsje_s" class="NumDecText" type="text" value="0" style="width:40px;" /></td>
						<td><input name="hysyywHysydtYhxmHysyj.zsje_shi" id="hysyywHysydtYhxmHysyj.zsje_shi" class="NumDecText" type="text" value="0" style="width:40px;" /></td>
						<td><input name="hysyywHysydtYhxmHysyj.zsje_q" id="hysyywHysydtYhxmHysyj.zsje_q" class="NumDecText" type="text" value="0" style="width:40px;" /></td>
						
						<td><input name="hysyywHysydtYhxmHysyj.jmje_xj" id="hysyywHysydtYhxmHysyj.jmje_xj" class="NumDecText" type="text" value="" style="width:50px;" /></td>
						<td><input name="hysyywHysydtYhxmHysyj.jmje_zygk" id="hysyywHysydtYhxmHysyj.jmje_zygk" class="NumDecText" type="text" value="" style="width:50px;" /></td>
						<td><input name="hysyywHysydtYhxmHysyj.jmje_dfgk" id="hysyywHysydtYhxmHysyj.jmje_dfgk" class="NumDecText" type="text" value="" style="width:50px;" /></td>
						<td><input name="hysyywHysydtYhxmHysyj.jmje_s" id="hysyywHysydtYhxmHysyj.jmje_s" class="NumDecText" type="text" value="0" style="width:40px;" /></td>
						<td><input name="hysyywHysydtYhxmHysyj.jmje_shi" id="hysyywHysydtYhxmHysyj.jmje_shi" class="NumDecText" type="text" value="0" style="width:40px;" /></td>
						<td><input name="hysyywHysydtYhxmHysyj.jmje_q" id="hysyywHysydtYhxmHysyj.jmje_q" class="NumDecText" type="text" value="0" style="width:40px;" /></td>
						
					</tr>
					<tr>
						<td colspan="5">
						用海方式（二级）：
							<select name="hysyywHysydtYhxmHysyj.yhfs_ej" id="yhfs_ej" style="width:100px;">
								<option value="">-请选择-</option>
							</select><font color="red">*</font>
						</td>
						<td colspan="4">
						用海面积：
						<input name="hysyywHysydtYhxmHysyj.yhmj" id="hysyywHysydtYhxmHysyj.yhmj" class="NumDecText" type="text" value="" style="width:80px;" />
						公顷<font color="red">*</font>
						</td>
						
						<td colspan="5">
						使用金到期日期：
						<input name="hysyywHysydtYhxmHysyj.syjdqrq" id="hysyywHysydtYhxmHysyj.syjdqrq" type="text" value="" onclick="WdatePicker()" readonly="readonly" style="width:80px;" />
						<font color="red">*</font>
						</td>
						<td colspan="4">缴纳方式：
							<select name="hysyywHysydtYhxmHysyj.jnfs" id="jnfs" style="width:100px;">
								<option value="">-请选择-</option>
							</select><font color="red">*</font>
						</td>
						
					</tr>
					<tr>
						<td colspan="18" style="text-align:center;">
							<span id="bcButton">
							<input name="bc" type="button" class="scbtn1" onclick="addHysyj()" value="保存" />
							<input name="cz" type="reset" class="scbtn1"  value="重置" />
							</span>
							<span id="xgButton" style="display:none;">	
							<input name="xg" type="button" class="scbtn1" onclick="updateHysyj()" value="修改" />
							<font color="red">保存完再新增</font>
							</span>
							<input name="hysyywHysydtYhxmHysyj.id" id="hysyywHysydtYhxmHysyj.id" type="hidden" value="" />
							<input name="hysyywHysydtYhxmHysyj.addtime" id="hysyywHysydtYhxmHysyj.addtime" type="hidden" value="" />
							<input name="hysyywHysydtYhxmHysyj.lastupdatetime" id="hysyywHysydtYhxmHysyj.lastupdatetime" type="hidden" value="" />
							<input name="hysyywHysydtYhxmHysyj.addusername" id="hysyywHysydtYhxmHysyj.addusername" type="hidden" value="" />
							<input name="hysyywHysydtYhxmHysyj.adduserid" id="hysyywHysydtYhxmHysyj.adduserid" type="hidden" value="" />
							<input name="hysyywHysydtYhxmHysyj.xmid" id="hysyywHysydtYhxmHysyj.xmid" type="hidden" value="" />
							<input name="hysyywHysydtYhxmHysyj.zsid" id="hysyywHysydtYhxmHysyj.zsid" type="hidden" value="" />
					
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
	</div>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
			var sfwlsyh = document.getElementById("sfwlsyhY").value;
			if(sfwlsyh=="是"){
				document.getElementById("sfwlsyh1").checked=true;
				document.getElementById("sfwlsyh2").checked=false;
			}
			else if(sfwlsyh=="否"){
				document.getElementById("sfwlsyh2").checked=true;
				document.getElementById("sfwlsyh1").checked=false;
			}else{
				document.getElementById("sfwlsyh2").checked=true;
				document.getElementById("sfwlsyh1").checked=false;
			}
			
		</script>
		
</form>
</body>
</html>