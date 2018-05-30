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
	var yhlxaTD = document.getElementById("yhlxaTD").innerHTML;
	var yhlxbTD = document.getElementById("yhlxbTD").innerHTML;
	//var hydbTD = document.getElementById("hydbTD").innerHTML;
	var zsfsTD = document.getElementById("zsfsTD").innerHTML;
	getDictionaryFy("使用金征收标准用海类别A","yhlxaTD",yhlxaTD);
	getDictionaryFy("使用金征收标准用海类别B","yhlxbTD",yhlxbTD);
	//getDictionaryFy("海域等别","hydbTD",hydbTD);
	getDictionaryFy("征收方式","zsfsTD",zsfsTD);
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
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchHysyjZsbz.do";
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
				<a href="#">海域使用金征收标准</a>
			</li>
		</ul>
	</div>
	<div class="formbody" >
		<input name="zsbh" id="zsbh" type="hidden" value="" />

			<table width="100%" align="center" style="text-align:left;" class="tablelist2" >
				<tr>
					<th colspan="2" style="text-align:left;">
						<img src="${contextPath}/images/f03.png" width="20" height="20" />详情
					</th>
				</tr>
				<tr>
					<td width="30%" style="background-color:#f5f8fa;">用海类别A：</td>
					<td width="70%" id="yhlxaTD">${hysyywHysydtYhxmHysyjZsbz.yhlxa }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">用海类别B：</td>
					<td id="yhlxbTD">${hysyywHysydtYhxmHysyjZsbz.yhlxb }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域等别一等：</td>
					<td>
					<c:if test="${ not empty hysyywHysydtYhxmHysyjZsbz.hydb1 }">
						${hysyywHysydtYhxmHysyjZsbz.hydb1 }&nbsp;万元/公顷
					</c:if>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域等别二等：</td>
					<td>
					<c:if test="${ not empty hysyywHysydtYhxmHysyjZsbz.hydb2 }">
						${hysyywHysydtYhxmHysyjZsbz.hydb2 }&nbsp;万元/公顷
					</c:if>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域等别三等：</td>
					<td>
					<c:if test="${ not empty hysyywHysydtYhxmHysyjZsbz.hydb3 }">
						${hysyywHysydtYhxmHysyjZsbz.hydb3 }&nbsp;万元/公顷
					</c:if>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域等别四等：</td>
					<td>
					<c:if test="${ not empty hysyywHysydtYhxmHysyjZsbz.hydb4 }">
						${hysyywHysydtYhxmHysyjZsbz.hydb4 }&nbsp;万元/公顷
					</c:if>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域等别五等：</td>
					<td>
					<c:if test="${ not empty hysyywHysydtYhxmHysyjZsbz.hydb5 }">
						${hysyywHysydtYhxmHysyjZsbz.hydb5 }&nbsp;万元/公顷
					</c:if>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域等别六等：</td>
					<td>
					<c:if test="${ not empty hysyywHysydtYhxmHysyjZsbz.hydb6 }">
						${hysyywHysydtYhxmHysyjZsbz.hydb6 }&nbsp;万元/公顷
					</c:if>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">无具体标准：</td>
					<td>
						<c:if test="${ not empty hysyywHysydtYhxmHysyjZsbz.yz }">
						${hysyywHysydtYhxmHysyjZsbz.yz }
						</c:if>
					</td>
				</tr>
				<!-- 
				<tr>
					<td style="background-color:#f5f8fa;">海域等别：</td>
					<td id="hydbTD">${hysyywHysydtYhxmHysyjZsbz.hydb }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">征收标准：</td>
					<td>${hysyywHysydtYhxmHysyjZsbz.zsbz }</td>
				</tr>
				 -->
				<tr>
					<td style="background-color:#f5f8fa;">征收方式：</td>
					<td id="zsfsTD">${hysyywHysydtYhxmHysyjZsbz.zsfs }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">新增用户姓名：</td>
					<td>${hysyywHysydtYhxmHysyjZsbz.addusername }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">新增时间：</td>
					<td>${hysyywHysydtYhxmHysyjZsbz.addtime }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">最后修改时间：</td>
					<td>${hysyywHysydtYhxmHysyjZsbz.lastupdatetime }</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
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