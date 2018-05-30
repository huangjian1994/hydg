<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>权限管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="${contextPath}/css/style_o.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	
		function addRole(){
			document.location.href="${contextPath}/jsp/xtgl/role/role_add.jsp";
		}

		function delRole(obj){
			if(confirm("你确实要删除吗")){
				document.location.href="${contextPath}/role/role_delete.do?role.id="+obj;
			}
		}
	

		
	
	</script>
  </head>
  
  <body >
  
  <div class="place">
    <span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
    <ul class="placeul">
    <li><a href="#">系统管理</a></li>
    <li><a href="#">权限管理</a></li>
    </ul>
    </div>
  		
  		<br/>	
  
  	<s:form id="roleListForm" action="role/role_list.do" >
	   	<table class="filetable3" >
	   		<tbody>
	   		<tr>
	   		    <td width="30%"></td>
	   			<td style="text-align:center" width="10%">角色名称:</td>
	   			<td style="text-align:left" width="15%">  
	   			<s:textfield name="role.roleName" cssStyle="width:200px;"> </s:textfield>
	   			</td>
	   			<td width="30%"></td>
	   		</tr>
	   		<tr>
	   		    <td height="60px"></td>
	   			<td><s:submit value="查询" cssClass="scbtn"></s:submit></td>
	   			<td>&nbsp;<input type="button" name="add" value="新增" onclick="addRole()" class="scbtn" />
	   			</td>
	   			<td></td>
	   		</tr>
	   		</tbody>
	   		</table>
	   		</s:form>
	   		<br/>
	   		
	   		<table class="tablelist23">
	   	
	   			<thead>
			   		<tr>
	   					<th width="5%">序号<i class="sort"><img src="${contextPath}/images/px.gif" /></i></th>
                        <th width="20%">角色名称</th>
		                <th width="20%">操作</th>
	   				</tr>
	   			</thead>
	   			
	   			<tbody>
	   				<s:iterator value="roleList" var="role" status="stu">
	   					<tr <s:if test="#stu.index%2==1">bgcolor="white"</s:if><s:else>bgcolor="#F1F4F9"</s:else>  >
		   				<td><s:property value="#stu.index+1"/></td>
		   				<td><s:property value="roleName"/></td>
		   				<td>
		   				<a href="javascript:delRole(<s:property value="id" />)" class="tablelink">删除</a>
			   			<a href="${contextPath}/role/role_edit.do?method=init&role.id=<s:property value='id'/>" class="tablelink">修改 </a> 
		   					<!-- 	
		   					<s:if test="#session.user.role.roleName=='系统内置角色'">
	   							<a href="javascript:delRole(<s:property value="id" />)" class="tablelink">删除</a>
			   					<a href="${contextPath}/role/role_edit.do?method=init&role.id=<s:property value='id'/>" class="tablelink">修改 </a> 
		   					</s:if>
		   					<s:else>
		   						<s:if test="roleName !='管理员'">
		   							
		   						</s:if>
		   					</s:else>
		   					 -->
		   				</td>
	   				</tr>
	   			    </s:iterator>
	   			
	   			</tbody>
	   	</table>
       <br/>
   		<div align="center">${pageBean}</div>
   
  </body>
</html>

