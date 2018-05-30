<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>字典管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link href="${contextPath}/css/style_o.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	
		function addconfig(){
			document.location.href="${contextPath}/jsp/xtgl/config/config_add.jsp";
		}

		function delkey(obj){

			if(confirm("你确实要删除吗")){
				document.location.href="${contextPath}/config/config_delkey.do?dictionary.id="+obj;
			}
		} 
		
	    function editkey(obj){
	          document.location.href="${contextPath}/config/config_editkey.do?dictionary.id="+obj;
	    }
	    
       function findkey(){
         document.configListForm.action = "${contextPath}/config/config_list.do";   	 
	   	 document.configListForm.target = "_self";
		 document.configListForm.submit(); 
       }
		
	
	</script>
  </head>
  
  <body >
  
  <div class="place">
    <span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
    <ul class="placeul">
    <li><a href="#">系统管理</a></li>
    <li><a href="#">字典管理</a></li>
    </ul>
    </div>
  		
  		<br/>	
  		
  	<s:form id="configListForm" method="post" >
	   	<table class="filetable3">
	   	  <tbody>
	   		<tr>
	   		    <td width="10%"></td>
	   			<td style="text-align:right" width="10%">字典键名称：</td>
	   			<td style="text-align:left" width="30%"> 
	   			   <s:textfield name="dictionary.key"  cssStyle="width:200px"> </s:textfield>	   					
	   			</td>
	   			<td style="text-align:right" width="10%">字典键值：</td>
	   			<td style="text-align:left" width="30%"> 
	   			   <s:textfield name="dictionary.value"  cssStyle="width:200px"> </s:textfield>	   					
	   			</td>
	   			 <td width="10%"></td>
	   		</tr>
	   		
	   		<tr>
	   			<td style="text-align:center; height:60px;" colspan="6">
	   			  <s:submit  value="查询" onclick="findkey()" cssClass="scbtn" ></s:submit>
	   			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   			  <input type="button" name="add" value="新增" onclick="addconfig()" class="scbtn" />
	   			</td>
	   		</tr>
	   	  </tbody>	
	   	</table>
	   </s:form>
	   		<br/>
	   		
	   		<table class="tablelist23">
	   	
	   			<thead>
			   		<tr>
	   					<th width="5%" height="41">序号<i class="sort"><img src="${contextPath}/images/px.gif" /></i></th>
	   					<th width="15%">字典键名称</th>
	   					<th width="15%">字典键值</th>
	   					<th width="10%">代码</th>
	   					<th width="10%">别名</th>
	   					<th width="10%">系数</th>
	   					<th width="15%">操作</th>
	   				</tr>
	   			</thead>
	   			
	   			<tbody align="center">
	   				<s:iterator value="configList" var="m" status="stu">
	   					<tr  <s:if test="#stu.index%2==1">bgcolor="white"</s:if><s:else>bgcolor="#F1F4F9"</s:else>  >
		   				<td ><s:property value="#stu.index+1"/></td>
		   				<td><s:property value="#m.key"/></td>
		   				<td><s:property value="#m.value"/></td>
		   				<td><s:property value="#m.dm"/></td>
		   				<td><s:property value="#m.bm"/></td>
		   				<td><s:property value="#m.xs"/></td>
		   				<td>
		   				<a href="javascript:delkey(<s:property value="#m.id" />)" class="tablelink">删除</a>
			   			<a href="javascript:editkey(<s:property value="#m.id" />)" class="tablelink">修改 </a> 
		   					
		   				</td>
	   				</tr>
	   			    </s:iterator>
	   			
	   			</tbody>
	   	</table>
       <br/>
   		<div align="center" >${pageBean}</div>
  
  </body>
</html>

