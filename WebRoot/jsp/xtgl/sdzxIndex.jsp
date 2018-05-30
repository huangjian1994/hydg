<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>手动执行</title>
     <%response.setHeader("Pragma","cache");response.setHeader("Cache-Control","cache");response.setDateHeader("Expires",10);%>
	<meta http-equiv="pragma" content="cache">
	<meta http-equiv="cache-control" content="cache">
	<meta http-equiv="expires" content="10">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="${contextPath}/css/style_o.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${contextPath}/js/My97DatePicker/WdatePicker.js" ></script>
    
	
	<script type="text/javascript">
	function tjHcryMz(){
		if(document.getElementById("rq").value==""){
			alert("日期不允许为空。");
			return false;
		}
		document.myForm.action="${contextPath}/zsry/sdzx_tjHcryMz.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

</script>
  </head>
  
  <body>
  <form name="myForm" method="post" enctype="multipart/form-data" >
	<div class="place">
    <span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
    <ul class="placeul">
    <li><a href="#">系统管理</a></li>
    <li><a href="#">手动执行</a></li>
    </ul>
    </div>
  	
  <div class="mainbox">
  	<div class="leftinfo1">
    <div class="listtitle3">
      <img src="${contextPath}/images/bmxxgxpt.png" width="26" height="26" />手动执行
    </div>
        <div align="center">
	   		<table class="filetable3" style="width:90%">
		   		<tr>
		   			<td style="text-align:right" width="25%">更新：</td>
		   			<td style="text-align:left" width="20%">
		   			<input type="button" value="更新" onclick="11()"/>
		   			</td>
		   		</tr>
		   		
		   		
		   		
  			</table>
  		</div>
  	  </div>
  	 </div>
   </form>		
  </body>
</html>
