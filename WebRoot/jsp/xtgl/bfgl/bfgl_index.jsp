<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
String rootpath = "";

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>备份管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<style type="text/css">
	
		*{font-size:10pt;font-family:'微软雅黑';margin:0;padding:0;}
		*{margin:0px;padding:0px}
		
		table{border-collapse:collapse;border:1px solid #b5bfc4;}
		tr{height:50px}
		td{text-align:center;border:1px solid #b5bfc4}
		.position_div{color:#18549A;width:700px;height:28px;background-image: url('${contextPath}/images/postion_back.png')}
		.main_div{width:680px;margin-left:10px;}
		.edit_tab{width:100%;}
		.edit_tab .label{text-align:right;width:100px;padding-right:50px;background-color:#e8edef}
		.text{width:200px;background-color: white;height:24px;border: 1px solid #9BBAD6 }
		.edit_tab .tip{text-align:left;border-left:1px solid white;width:200px;}
		.btn{width:137px;height:35px; background:url(<%=basePath%>/images/btnbg.png) no-repeat; font-size:14px;font-weight:bold;color:#fff; cursor:pointer;}
		
	    .place{height:40px; background:url(${contextPath}/images/righttop.gif) repeat-x;}
        .place span{line-height:40px; font-weight:bold;float:left; margin-left:12px;}
	    .placeul li{float:left; line-height:40px; padding-left:7px; padding-right:12px; background:url(${contextPath}/images/rlist.gif) no-repeat right;}
        .placeul li:last-child{background:none;}
        a,a:focus{text-decoration:none;color:#000;outline:none;blr:expression(this.onFocus=this.blur());}
        a:hover{color:#00a4ac;text-decoration:none;}
	</style>
	<link type="text/css" rel="stylesheet" href="<%=basePath%>/js/formValidator/style/validator.css"></link>
	<script type="text/javascript" src="<%=basePath%>/js/My97DatePicker/WdatePicker.js" ></script>
	<script type="text/javascript">
	function showDateList(){
		document.myForm.action="<%=basePath%>/sjbf/sjbf_showDateList.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	function deleteFile(deleteFileName){
		if(confirm("确定删除吗？")){	
			document.getElementById("deleteFileName").value=deleteFileName;
			document.myForm.action="<%=basePath%>/sjbf/sjbf_deleteFile.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}else {
			
		}

	}
	function manyClearList(){
		if(confirm("确定要批量清理吗？")){	
			//document.getElementById("deleteFileName").value=deleteFileName;
			document.myForm.action="<%=basePath%>/sjbf/sjbf_manyClearList.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}else {
			
		}
	}
	</script>

  </head>
  
   <body>
  	<div class="place">
    <span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
    <ul class="placeul">
    <li><a href="#">系统管理</a></li>
    <li><a href="#">备份管理</a></li>
    </ul>
    </div>
    <br>
     
<form name="myForm" method="post" enctype="multipart/form-data">
<input type="hidden" name="cfGmsfhm" value="${cfGmsfhm}"> 
<input type="hidden" name="deleteFileName" id="deleteFileName" value=""> 
${yyMessage}
<table style="width:100%;"  align="center">
	<tr align="center" >
		<td colspan="4" height="40px;">
			清理备份的数据库
		</td>
	</tr>
	<tr align="center" >
		<td height="40px;">
			<input type="button" name="show" onclick="showDateList()" value="显示备份数据库列表" class="btn" style="width:137px;height:35px;"/>
	    
	    </td>
		<td height="40px;">
			一共有    <font color="red" size="5px;"><s:property value="fileList.size"/></font>    个文件
		</td>
	</tr>
	<tr>
		<td colspan="4" >
			<table style="width:100%;" align="center">
				<tr align="center" >
					<th width="20%" height="40px;">&hearts;&nbsp;序号</th>
					<th width="20%" height="40px;">&clubs;&nbsp;文件类型</th>
					<th width="40%" height="40px;">&diams;&nbsp;文件名（年月日时分秒）</th>
					<th width="20%" height="40px;">&spades;&nbsp;操作</th>
				</tr>
				<c:if test="${not empty  fileList }">
				<c:forEach items="${ fileList }" var="r" varStatus="i">
				<c:if test="${ i.count<=15 }">
				<tr align="center">
					<td height="40px;">${ i.count }</td>
					<td height="40px;">${ r.type}</td>
					<td height="40px;">${ r.name}</td>
					<td height="40px;"><input type="button" name="delete" onclick="deleteFile('${ r.name}')" value="    删除    "></td>
				</tr>		
				</c:if>	
				</c:forEach>
				</c:if>
				<c:if test="${empty  fileList}">
				<tr align="center">
					<td colspan="4" height="40px;">
						<font color="red">
							无备份文件信息（调整服务器IP和备份目录！）
						</font>
					</td>				
				</tr>

				</c:if>
			</table>		
		</td>
	</tr>
</table>

   
</form>
   
  </body>
</html>

