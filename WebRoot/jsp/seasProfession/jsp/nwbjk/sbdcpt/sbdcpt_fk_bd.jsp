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
	var xmxzTD = document.getElementById("xmxzTD").innerHTML;
	var yhlxbTD = document.getElementById("yhlxbTD").innerHTML;
	var yhlxaTD = document.getElementById("yhlxaTD").innerHTML;
	var yhfsTD = document.getElementById("yhfsTD").innerHTML;
	getDictionaryFy("用海性质","xmxzTD",xmxzTD);
	getDictionaryFy("用海类型B","yhlxbTD",yhlxbTD);
	getDictionaryFy("用海类型A","yhlxaTD",yhlxaTD);
	getDictionaryFy("用海方式","yhfsTD",yhfsTD);

	var xmxzTD2 = document.getElementById("xmxzTD2").innerHTML;
	var yhlxbTD2 = document.getElementById("yhlxbTD2").innerHTML;
	var yhlxaTD2 = document.getElementById("yhlxaTD2").innerHTML;
	var yhfsTD2 = document.getElementById("yhfsTD2").innerHTML;
	getDictionaryFy("用海性质","xmxzTD2",xmxzTD2);
	getDictionaryFy("用海类型B","yhlxbTD2",yhlxbTD2);
	getDictionaryFy("用海类型A","yhlxaTD2",yhlxaTD2);
	getDictionaryFy("用海方式","yhfsTD2",yhfsTD2);
	
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
	document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchSbhcptFk.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function updateBd(tableName,zdName,zdValue){
	document.getElementById("tableName").value =tableName;
	document.getElementById("zdName").value =zdName;
	document.getElementById("zdValue").value =zdValue;
	document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_updateSbhcptFk.do";
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
				<li><a href="#">内外部接口</a></li>
				<li><a href="#">市不动产登记平台</a></li>
			</ul>
		</div>
		
		<input name="xmID" id="xmID" value="${sbdcptFkbdForm.xmid }" type="hidden" />
		<input name="zsID" id="zsID" value="${sbdcptFkbdForm.zsid }" type="hidden" />
		<input name="fkID" id="fkID" value="${fkID }" type="hidden" />
		<input name="approvalNum" id="approvalNum" value="${approvalNum }" type="hidden" />
		<input name="tableName" id="tableName" value="" type="hidden" />
		<input name="zdName" id="zdName" value="" type="hidden" />
		<input name="zdValue" id="zdValue" value="" type="hidden" />
		
		<div class="formbody">
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />比对信息</div>
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				
				<tr>
					<th colspan="2">市规土局反馈信息</th>
					<th>市动管系统信息</th>
					<th>采用市规土局反馈信息</th>
				</tr>
				<tr>
					<th colspan="4">申请人信息</th>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">法定代表人姓名：</td>
					<td>${hysyywNwbjkSbdcptFk.legalname }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.legalname != sbdcptFkbdForm.fddbr}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.fddbr }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.legalname != sbdcptFkbdForm.fddbr}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM','fddbr','${hysyywNwbjkSbdcptFk.legalname }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">法定代表人职务：</td>
					<td>${hysyywNwbjkSbdcptFk.legalposition }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.legalposition != sbdcptFkbdForm.fddbrzw}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.fddbrzw }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.legalposition != sbdcptFkbdForm.fddbrzw}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM','fddbrzw','${hysyywNwbjkSbdcptFk.legalposition }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				
				<tr>
					<td style="background-color:#f5f8fa;">法定代表人身份证：</td>
					<td>${hysyywNwbjkSbdcptFk.legalcardno }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.legalcardno != sbdcptFkbdForm.fddbrsfz}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.fddbrsfz }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.legalcardno != sbdcptFkbdForm.fddbrsfz}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM','fddbrsfz','${hysyywNwbjkSbdcptFk.legalcardno }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">通讯地址：</td>
					<td>${hysyywNwbjkSbdcptFk.agentaddress }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.agentaddress != sbdcptFkbdForm.txdz}">style="color: red;" </c:if> > 
					${sbdcptFkbdForm.txdz }
					</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.agentaddress != sbdcptFkbdForm.txdz}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM','TXDZ','${hysyywNwbjkSbdcptFk.agentaddress }')" class="tablelink">更新</a>
					</c:if>
					</td>
				</tr>
				
				<tr>
					<td style="background-color:#f5f8fa;">邮政编码：</td>
					<td>${hysyywNwbjkSbdcptFk.agentzip }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.agentzip != sbdcptFkbdForm.yzbm}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.yzbm }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.agentzip != sbdcptFkbdForm.yzbm}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM','yzbm','${hysyywNwbjkSbdcptFk.agentzip }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">联系人姓名：</td>
					<td>${hysyywNwbjkSbdcptFk.agentname }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.agentname != sbdcptFkbdForm.lxrxm}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.lxrxm }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.agentname != sbdcptFkbdForm.lxrxm}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM','lxrxm','${hysyywNwbjkSbdcptFk.agentname }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">联系人电话：</td>
					<td>${hysyywNwbjkSbdcptFk.agenttel }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.agenttel != sbdcptFkbdForm.lxrdh}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.lxrdh }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.agenttel != sbdcptFkbdForm.lxrdh}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM','lxrdh','${hysyywNwbjkSbdcptFk.agenttel }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<th colspan="4">登记表信息</th>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">项目名称：</td>
					<td>${hysyywNwbjkSbdcptFk.projectname }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.projectname != sbdcptFkbdForm.yhxmmc}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.yhxmmc }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.projectname != sbdcptFkbdForm.yhxmmc}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM','yhxmmc','${hysyywNwbjkSbdcptFk.projectname }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">权利人名称：</td>
					<td>${hysyywNwbjkSbdcptFk.name }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.name != sbdcptFkbdForm.hysyqr}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.hysyqr }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.name != sbdcptFkbdForm.hysyqr}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM','hysyqr','${hysyywNwbjkSbdcptFk.name }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">联系电话：</td>
					<td>${hysyywNwbjkSbdcptFk.tel }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.tel != sbdcptFkbdForm.sj}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.sj }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.tel != sbdcptFkbdForm.sj}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM','sj','${hysyywNwbjkSbdcptFk.tel }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">项目性质：</td>
					<td id="xmxzTD">${hysyywNwbjkSbdcptFk.seausekind }</td>
					<td id="xmxzTD2" <c:if test="${hysyywNwbjkSbdcptFk.seausekind != sbdcptFkbdForm.xmxz}">style="color: red;" </c:if> >${sbdcptFkbdForm.xmxz }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.seausekind != sbdcptFkbdForm.xmxz}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM','xmxz','${hysyywNwbjkSbdcptFk.seausekind }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">是否抵押：</td>
					<td>${hysyywNwbjkSbdcptFk.other }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">抵押时间：</td>
					<td>${hysyywNwbjkSbdcptFk.other_passdate }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">是否查封：</td>
					<td>${hysyywNwbjkSbdcptFk.limit }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">查封时间：</td>
					<td>${hysyywNwbjkSbdcptFk.limit_passdate }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">是否异议登记：</td>
					<td>${hysyywNwbjkSbdcptFk.dissent }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">异议时间：</td>
					<td>${hysyywNwbjkSbdcptFk.dissent_passdate }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">是否已受理更正登记：</td>
					<td>${hysyywNwbjkSbdcptFk.correct }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">不动产权证书编号：</td>
					<td>${hysyywNwbjkSbdcptFk.realno }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.realno != sbdcptFkbdForm.bdcqzsbh}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.bdcqzsbh }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.realno != sbdcptFkbdForm.bdcqzsbh}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM_ZHXX','bdcqzsbh','${hysyywNwbjkSbdcptFk.realno }')" class="tablelink">更新</a>
					</c:if>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">不动产单元编号：</td>
					<td>${hysyywNwbjkSbdcptFk.unitcode }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.unitcode != sbdcptFkbdForm.bdcdyh}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.bdcdyh }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.unitcode != sbdcptFkbdForm.bdcdyh}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM_ZHXX','bdcdyh','${hysyywNwbjkSbdcptFk.unitcode }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">初始登记日期：</td>
					<td>${hysyywNwbjkSbdcptFk.passdate }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.passdate != sbdcptFkbdForm.csdjrq}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.csdjrq }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.passdate != sbdcptFkbdForm.csdjrq}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM_ZHXX','csdjrq','${hysyywNwbjkSbdcptFk.passdate }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">发证日期：</td>
					<td>${hysyywNwbjkSbdcptFk.enddate }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.enddate != sbdcptFkbdForm.fzrq}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.fzrq }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.enddate != sbdcptFkbdForm.fzrq}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM_ZHXX','BDCQZSFZRQ','${hysyywNwbjkSbdcptFk.enddate }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">登记人：</td>
					<td>${hysyywNwbjkSbdcptFk.acceptuser }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.acceptuser != sbdcptFkbdForm.djr}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.djr }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.acceptuser != sbdcptFkbdForm.djr}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM_ZHXX','djr','${hysyywNwbjkSbdcptFk.acceptuser }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">审核人：</td>
					<td>${hysyywNwbjkSbdcptFk.audituser }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.audituser != sbdcptFkbdForm.shrxm}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.shrxm }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.audituser != sbdcptFkbdForm.shrxm}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM_ZHXX','shrxm','${hysyywNwbjkSbdcptFk.audituser }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				
				<tr>
					<th colspan="4">宗海表信息</th>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">用海批文编号：</td>
					<td>${hysyywNwbjkSbdcptFk.approvalnum }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.approvalnum != sbdcptFkbdForm.spbh}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.spbh }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.approvalnum != sbdcptFkbdForm.spbh}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM_ZHXX','spbh','${hysyywNwbjkSbdcptFk.approvalnum }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">用海期限（年）：</td>
					<td>${hysyywNwbjkSbdcptFk.applyyear }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.applyyear != sbdcptFkbdForm.yhnx}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.yhnx }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.applyyear != sbdcptFkbdForm.yhnx}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM_ZHXX','yhnx','${hysyywNwbjkSbdcptFk.applyyear }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">用海起始日期：</td>
					<td>${hysyywNwbjkSbdcptFk.begindate }</td>
					<td  <c:if test="${hysyywNwbjkSbdcptFk.begindate != sbdcptFkbdForm.yhqsnx}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.yhqsnx }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.begindate != sbdcptFkbdForm.yhqsnx}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM_ZHXX','yhqsnx','${hysyywNwbjkSbdcptFk.begindate }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">用海终止日期：</td>
					<td>${hysyywNwbjkSbdcptFk.duedate }</td>
					<td <c:if test="${hysyywNwbjkSbdcptFk.duedate != sbdcptFkbdForm.yhzznx}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.yhzznx }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.duedate != sbdcptFkbdForm.yhzznx}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM_ZHXX','yhzznx','${hysyywNwbjkSbdcptFk.duedate }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">用海总面积（公顷）：</td>
					<td>${hysyywNwbjkSbdcptFk.usedarea }</td>
					<td  <c:if test="${hysyywNwbjkSbdcptFk.usedarea != sbdcptFkbdForm.yhzmj}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.yhzmj }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.usedarea != sbdcptFkbdForm.yhzmj}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM_ZHXX','yhzmj','${hysyywNwbjkSbdcptFk.usedarea }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">宗海面积（公顷）：</td>
					<td>${hysyywNwbjkSbdcptFk.area }</td>
					<td  <c:if test="${hysyywNwbjkSbdcptFk.area != sbdcptFkbdForm.zhmj}">style="color: red;" </c:if> >
					${sbdcptFkbdForm.zhmj }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.area != sbdcptFkbdForm.zhmj}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM_ZHXX','zhmj','${hysyywNwbjkSbdcptFk.area }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">用海类型A：</td>
					<td id="yhlxaTD">${hysyywNwbjkSbdcptFk.seausetypea }</td>
					<td id="yhlxaTD2"  <c:if test="${hysyywNwbjkSbdcptFk.seausetypea != sbdcptFkbdForm.yhlxa}">style="color: red;" </c:if> >${sbdcptFkbdForm.yhlxa }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.seausetypea != sbdcptFkbdForm.yhlxa}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM_ZHXX','yhlxa','${hysyywNwbjkSbdcptFk.seausetypea }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">用海类型B：</td>
					<td id="yhlxbTD">${hysyywNwbjkSbdcptFk.seausetypeb }</td>
					<td id="yhlxbTD2"  <c:if test="${hysyywNwbjkSbdcptFk.seausetypeb != sbdcptFkbdForm.yhlxb}">style="color: red;" </c:if> >${sbdcptFkbdForm.yhlxb }</td>
					<td>
					<c:if test="${hysyywNwbjkSbdcptFk.seausetypeb != sbdcptFkbdForm.yhlxb}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM_ZHXX','yhlxb','${hysyywNwbjkSbdcptFk.seausetypeb }')" class="tablelink">更新</a>
					</c:if></td>
				</tr>
				<tr>
					<td width="20%" style="background-color:#f5f8fa;">用海方式：</td>
					<td width="30%" id="yhfsTD">${hysyywNwbjkSbdcptFk.seausemode }</td>
					<td width="30%" id="yhfsTD2"  <c:if test="${hysyywNwbjkSbdcptFk.seausemode != sbdcptFkbdForm.yhfs}">style="color: red;" </c:if> >${sbdcptFkbdForm.yhfs }</td>
					<td width="20%">
					<c:if test="${hysyywNwbjkSbdcptFk.seausemode != sbdcptFkbdForm.yhfs}">
					<a href="###" onclick="updateBd('T_HYSYYW_HYSYDT_YHXM_YHFS','yhfs','${hysyywNwbjkSbdcptFk.seausemode }')" class="tablelink">更新</a>
					</c:if>
					</td>
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