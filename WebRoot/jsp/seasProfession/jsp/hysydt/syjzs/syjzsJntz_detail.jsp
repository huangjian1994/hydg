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
	var jnfsTD = document.getElementById("jnfsTD").innerHTML;
	getDictionaryFy("使用金缴纳方式","jnfsTD",jnfsTD);
});
//翻译字典
function getDictionaryFy(keyZ,tableTdID,historyZ){
	$.ajax({		  		
		type: "post",
		dataType:"json",
		url: "${contextPath}/business/business_fetchDictionary.do",
		data: "dictionary.key="+keyZ,
		success: function(d){
			for(var i=0;i<d.length;i++){
				//alert(d);
				if(d[i].dm==historyZ){
					document.getElementById(tableTdID).innerHTML=d[i].value;
				}else{
					
				}
			}
		}
	});	  
}

//返回
function goBack(){
	var indexNum = document.getElementById("indexNum").value;
	if(indexNum=="1"){
		document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchJnjlByXmid.do";
	}else{
		document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchZhxxList2.do";
	}
	document.myForm.target="_self";
	document.myForm.submit();
}
</script>
	</head>

	<body>
<form name="myForm" method="post" >
<input name="indexNum" id="indexNum" type="hidden" value="${indexNum }" />
<input name="zsID" id="zsID" type="hidden" value="${zsID }" />
<input name="xmID" id="xmID" type="hidden" value="${xmID }" />
<input name="zsbh" id="zsbh" type="hidden" value="${zsbh }" />

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
			<table width="100%" align="center" style="text-align:left;" class="tablelist2" >
				<tr>
					<th colspan="4" style="text-align:left;">
						<img src="${contextPath}/images/f03.png" width="20" height="20" />详情
					</th>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域管理号：</td>
					<td colspan="3">${hysyywHysydtYhxmHysyjJntz.hyglh }</td>
				</tr>
				<tr>
					<td width="20%" style="background-color:#f5f8fa;">海域使用权人：</td>
					<td width="30%">${hysyywHysydtYhxmHysyjJntz.hysyqr }</td>
					<td width="20%" style="background-color:#f5f8fa;">用海面积：</td>
					<td width="30%">${hysyywHysydtYhxmHysyjJntz.yhmj }公顷</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">受理时间：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.slsj }</td>
					<td style="background-color:#f5f8fa;">批准单位：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.pzdw }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">用海起始时间：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.yhqssj }</td>
					<td style="background-color:#f5f8fa;">用海终止时间：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.yhzzsj }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域使用总金额：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.syjze }元</td>
					<td style="background-color:#f5f8fa;">海域使用金缴纳方式：</td>
					<td id="jnfsTD">${hysyywHysydtYhxmHysyjJntz.syjjnfs }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域使用金征收标准：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.syjzsbz }</td>
					<td style="background-color:#f5f8fa;">海域使用金征收标准依据：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.syjzsbzyj }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">通知日期：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.tzrq }</td>
					<td style="background-color:#f5f8fa;">缴纳地点：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.jndd }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">缴纳开始日期：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.jnksrq }</td>
					<td style="background-color:#f5f8fa;">缴纳结束日期：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.jnjsrq }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">开户行：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.khh }</td>
					<td style="background-color:#f5f8fa;">户名：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.hm }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">账号：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.zh }</td>
					<td style="background-color:#f5f8fa;">通知机关：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.tzjg }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">登记开始日期：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.djksrq }</td>
					<td style="background-color:#f5f8fa;">登记结束日期：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.djjsrq }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">登记地点：</td>
					<td colspan="3">${hysyywHysydtYhxmHysyjJntz.djdd }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">新增用户姓名：</td>
					<td colspan="3">${hysyywHysydtYhxmHysyjJntz.addusername }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">新增时间：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.addtime }</td>
					<td  style="background-color:#f5f8fa;">最后修改时间：</td>
					<td>${hysyywHysydtYhxmHysyjJntz.lastupdatetime }</td>
				</tr>
				
				<tr>
					<td colspan="4" style="text-align:center;">
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