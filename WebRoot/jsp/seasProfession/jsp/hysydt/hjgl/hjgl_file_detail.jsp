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
	var fjlxTD = document.getElementById("fjlxTD").innerHTML;
	getDictionaryFy("附件类型","fjlxTD",fjlxTD);
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
	document.myForm.action="<%=basePath%>/business/business_fetchYjxm.do";
	document.myForm.target="_self";
	document.myForm.submit();
}



</script>
	</head>

	<body>
<form name="myForm" method="post" >


		<div class="formbody">
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
			<table class="tableXQ" width="100%">
						<tr>
						<!-- fjmc,fjlx,fj,wjlx,wjdx,scr,scsj,bz,lastupdatetime -->
							<td width="20%" style="background-color:#f5f8fa;">文件名称：</td>
							<td width="30%" >${hysyywHysydtYhxmXmfj.fjmc }</td>
							<td width="20%" style="background-color:#f5f8fa;">文件类型：</td>
							<td width="30%" id="fjlxTD">${hysyywHysydtYhxmXmfj.fjlx }</td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">附件：</td>
							<td colspan="3">${hysyywHysydtYhxmXmfj.fj }</td>
							<!-- 
							<td style="background-color:#f5f8fa;">文件类型：</td>
							<td>${hysyywHysydtYhxmXmfj.wjlx }</td>
							 -->
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">文件大小（KB）：</td>
							<td>${hysyywHysydtYhxmXmfj.wjdx }</td>
							<td style="background-color:#f5f8fa;">上传人：</td>
							<td>${hysyywHysydtYhxmXmfj.scr }</td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">上传时间：</td>
							<td>${hysyywHysydtYhxmXmfj.scsj }</td>
							<td style="background-color:#f5f8fa;">最后修改时间：</td>
							<td>${hysyywHysydtYhxmXmfj.lastupdatetime }</td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">备注：</td>
							<td colspan="3">${hysyywHysydtYhxmXmfj.bz }</td>
						</tr>
						<tr>
							<td colspan="4" style="text-align:center;">
								<input name="fh" type="button" value="关闭" class="scbtn1" onclick="window.close();" />
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