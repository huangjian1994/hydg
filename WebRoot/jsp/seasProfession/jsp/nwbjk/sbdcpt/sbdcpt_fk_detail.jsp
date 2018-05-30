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
		
		<div class="formbody">
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<th colspan="4">申请人信息</th>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">法定代表人姓名：</td>
					<td >${hysyywNwbjkSbdcptFk.legalname }</td>
					<td style="background-color:#f5f8fa;">法定代表人职务：</td>
					<td>${hysyywNwbjkSbdcptFk.legalposition }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">法定代表人身份证：</td>
					<td>${hysyywNwbjkSbdcptFk.legalcardno }</td>
					<td  style="background-color:#f5f8fa;">通讯地址：</td>
					<td>${hysyywNwbjkSbdcptFk.agentaddress }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">邮政编码：</td>
					<td>${hysyywNwbjkSbdcptFk.agentzip }</td>
					<td  style="background-color:#f5f8fa;">联系人姓名：</td>
					<td>${hysyywNwbjkSbdcptFk.agentname }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">联系人电话：</td>
					<td colspan="3">${hysyywNwbjkSbdcptFk.agenttel }</td>
				</tr>
				<tr>
					<th colspan="4">登记表信息</th>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">项目名称：</td>
					<td>${hysyywNwbjkSbdcptFk.projectname }</td>
					<td  style="background-color:#f5f8fa;">权利人名称：</td>
					<td>${hysyywNwbjkSbdcptFk.name }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">联系电话：</td>
					<td>${hysyywNwbjkSbdcptFk.tel }</td>
					<td  style="background-color:#f5f8fa;">项目性质：</td>
					<td id="xmxzTD">${hysyywNwbjkSbdcptFk.seausekind }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">是否抵押：</td>
					<td>${hysyywNwbjkSbdcptFk.other }</td>
					<td  style="background-color:#f5f8fa;">抵押时间：</td>
					<td>${hysyywNwbjkSbdcptFk.other_passdate }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">是否查封：</td>
					<td>${hysyywNwbjkSbdcptFk.limit }</td>
					<td  style="background-color:#f5f8fa;">查封时间：</td>
					<td>${hysyywNwbjkSbdcptFk.limit_passdate }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">是否异议登记：</td>
					<td>${hysyywNwbjkSbdcptFk.dissent }</td>
					<td  style="background-color:#f5f8fa;">异议时间：</td>
					<td>${hysyywNwbjkSbdcptFk.dissent_passdate }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">是否已受理更正登记：</td>
					<td>${hysyywNwbjkSbdcptFk.correct }</td>
					<td  style="background-color:#f5f8fa;">不动产权证书编号：</td>
					<td>${hysyywNwbjkSbdcptFk.realno }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">不动产单元编号：</td>
					<td>${hysyywNwbjkSbdcptFk.unitcode }</td>
					<td  style="background-color:#f5f8fa;">初始登记日期：</td>
					<td>${hysyywNwbjkSbdcptFk.passdate }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">发证日期：</td>
					<td>${hysyywNwbjkSbdcptFk.enddate }</td>
					<td  style="background-color:#f5f8fa;">登记人：</td>
					<td>${hysyywNwbjkSbdcptFk.acceptuser }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">审核人：</td>
					<td colspan="3">${hysyywNwbjkSbdcptFk.audituser }</td>
				</tr>
				
				<tr>
					<th colspan="4">宗海表信息</th>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">用海批文编号：</td>
					<td>${hysyywNwbjkSbdcptFk.approvalnum }</td>
					<td  style="background-color:#f5f8fa;">用海期限（年）：</td>
					<td>${hysyywNwbjkSbdcptFk.applyyear }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">用海起始日期：</td>
					<td>${hysyywNwbjkSbdcptFk.begindate }</td>
					<td  style="background-color:#f5f8fa;">用海终止日期：</td>
					<td>${hysyywNwbjkSbdcptFk.duedate }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">用海总面积（公顷）：</td>
					<td>${hysyywNwbjkSbdcptFk.usedarea }</td>
					<td  style="background-color:#f5f8fa;">宗海面积（公顷）：</td>
					<td>${hysyywNwbjkSbdcptFk.area }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">用海类型A：</td>
					<td id="yhlxaTD">${hysyywNwbjkSbdcptFk.seausetypea }</td>
					<td  style="background-color:#f5f8fa;">用海类型B：</td>
					<td id="yhlxbTD">${hysyywNwbjkSbdcptFk.seausetypeb }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">用海方式：</td>
					<td colspan="3" id="yhfsTD">${hysyywNwbjkSbdcptFk.seausemode }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">新增用户姓名：</td>
					<td colspan="3">${hysyywNwbjkSbdcptFk.addusername }</td>
				</tr>
				<tr>
					<td width="20%" style="background-color:#f5f8fa;">新增时间：</td>
					<td width="30%">${hysyywNwbjkSbdcptFk.addtime }</td>
					<td width="20%" style="background-color:#f5f8fa;">最后修改时间：</td>
					<td width="30%">${hysyywNwbjkSbdcptFk.lastupdatetime }</td>
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