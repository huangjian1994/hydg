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
	getJgfs(jgfsY);
});

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

//返回
function goBack(){
	var jgfs = document.getElementById("jgfs").value;
	if(jgfs=="1"){
		document.myForm.action="<%=basePath%>/business/business_fetchXmjgList1.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	if(jgfs=="2"){
		document.myForm.action="<%=basePath%>/business/business_fetchXmjgList2.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	if(jgfs=="3"){
		document.myForm.action="<%=basePath%>/business/business_fetchXmjgList3.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
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
				<li>
					<a href="#">监管信息</a>
				</li>
				<li>
					<a href="#">详情</a>
				</li>
			</ul>
		</div>
	<input name="xmID" id="xmID" value="${hysyywHysydtYhxmphjgDt.xmid }" type="hidden" />
	<input name="jgXmmc" id="jgXmmc" value="${jgXmmc }" type="hidden" />
	<input name="jgfs" id="jgfs" value="${jgfs }" type="hidden" />
	<input name="hysyywHysydtYhxmphjgDtForm.yjid" id="yjid" value="${hysyywHysydtYhxmphjgDtForm.yjid }" type="hidden" />
	
	
	<div class="formbody">
		<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/i02.png" width="20" height="20" />详情</div>
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#f5f8fa;" width="20%">用海项目名称：</td>
					<td colspan="3" width="80%">${hysyywHysydtYhxmphjgDt.yhxmmc }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">监管方式：</td>
					<td colspan="3">
					
					<c:if test="${hysyywHysydtYhxmphjgDt.jgfs=='1' }">
					建设过程监管
					</c:if>
					<c:if test="${hysyywHysydtYhxmphjgDt.jgfs=='2' }">
					竣工用海复核
					</c:if>
					<c:if test="${hysyywHysydtYhxmphjgDt.jgfs=='3' }">
					日常监管
					</c:if>
					<c:if test="${hysyywHysydtYhxmphjgDt.jgfs=='4' }">
					核查监视监测
					</c:if>
					
					<input name="jgfsY" id="jgfsY" type="hidden" class="scinput" value="${hysyywHysydtYhxmphjgDt.jgfs }" style="width:180px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">监管日期：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.jgrq }</td>
				</tr>
				<!-- 建设过程监管 -->
				<tr id="jgyhfhTR8">
					<td style="background-color:#f5f8fa;">用海界址是否改变：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.yhjzsfgb }</td>
				</tr>
				<tr id="jsgcjgTR1">
					<td style="background-color:#f5f8fa;">用海界址：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.yhjz }</td>
				</tr>
				<tr id="jgyhfhTR10" >
					<td style="background-color:#f5f8fa;">用海面积是否改变：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.yhmjsfgb }</td>
				</tr>
				<tr id="jsgcjgTR2">
					<td style="background-color:#f5f8fa;">用海面积：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.yhmj }公顷</td>
				</tr>
				<tr id="jsgcjgTR3">
					<td style="background-color:#f5f8fa;">施工方式：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sgfs }</td>
				</tr>
				<tr id="jsgcjgTR4">
					<td style="background-color:#f5f8fa;">施工进展情况：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sgjzqk }</td>
				</tr>
				<tr id="jsgcjgTR5">
					<td style="background-color:#f5f8fa;">实际用途是否改变：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sjytsfgb }</td>
				</tr>
				<tr id="jsgcjgTR6">
					<td style="background-color:#f5f8fa;">实际用途改变内容：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sjytgbnr }</td>
				</tr>
				<tr id="jsgcjgTR7">
					<td style="background-color:#f5f8fa;">岸滩演变情况：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.atybqk }</td>
				</tr>
				<!-- 竣工用海复核 -->
				<!-- 
				<tr id="jgyhfhTR9">
					<td style="background-color:#f5f8fa;">用海界址改变内容：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.yhjzgbnr }</td>
				</tr>
				<tr id="jgyhfhTR11" >
					<td style="background-color:#f5f8fa;">用海面积改变内容：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.yhmjgbnr }</td>
				</tr>
				 -->
				<!-- 日常监管 -->
				<tr id="rcjgTR12" >
					<td style="background-color:#f5f8fa;">是否占用海域：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sfzyhy }</td>
				</tr>
				<tr id="rcjgTR13" >
					<td style="background-color:#f5f8fa;">占用海域情况：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.zyhyqk }</td>
				</tr>
				<tr id="rcjgTR14" >
					<td style="background-color:#f5f8fa;">是否有非法围填海活动：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sfffwth }</td>
				</tr>
				<tr id="rcjgTR15" >
					<td style="background-color:#f5f8fa;">非法围填海活动情况：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.ffwthqk }</td>
				</tr>
				<tr id="rcjgTR16" >
					<td style="background-color:#f5f8fa;">是否擅自改变海域用途：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sfszgbhyyt }</td>
				</tr>
				<tr id="rcjgTR17" >
					<td style="background-color:#f5f8fa;">擅自改变海域用途情况：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.szgbhyytqk }</td>
				</tr>
				
				<!-- 核查监视监测信息 -->
				<tr id="hcjsjcTR18" >
					<td style="background-color:#f5f8fa;">核查监视监测信息：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.hcjsjc }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">新增用户姓名：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.addusername }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">新增时间：</td>
					<td>${hysyywHysydtYhxmphjgDt.addtime }</td>
					<td  style="background-color:#f5f8fa;">最后修改时间：</td>
					<td>${hysyywHysydtYhxmphjgDt.lastupdatetime }</td>
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