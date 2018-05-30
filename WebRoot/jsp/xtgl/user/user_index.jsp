<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户列表</title>
     <%response.setHeader("Pragma","cache");response.setHeader("Cache-Control","cache");response.setDateHeader("Expires",10);%>
	<meta http-equiv="pragma" content="cache">
	<meta http-equiv="cache-control" content="cache">
	<meta http-equiv="expires" content="10">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	
	<script type="text/javascript">

		function searchUser(){

				$("#userListForm").submit();
		}
		
		function addUser(){

			document.location.href="${contextPath}/user/user_add.do?method=init";

		}

		function deleteUser(id){
			if(confirm("你确实要删除吗")){
				document.location.href='${contextPath}/user/user_delete.do?user.id='+id;
			}
		}
	
	function gxSjy(){
		document.location.href="${contextPath}/sjy/sjy_gxSjyTyc.do?";
	}
	
	</script>
	<link href="${contextPath}/css/style_o.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  		
	<div class="place">
    <span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
    <ul class="placeul">
    <li><a href="#">系统管理</a></li>
    <li><a href="#">用户管理</a></li>
    </ul>
    </div>
  		
  		
  		
  			<s:form id="userListForm" action="user/user_list.do" >
	   		<table class="filetable3">
	   		 <tbody>
		   		
		   		<tr>
		   		    <td width="18%"></td>
		   			<td style="text-align:right" width="10%">姓名：</td>
		   			<td style="text-align:left" width="20%"> <s:textfield name="user.name"  cssStyle="width:200px"> </s:textfield></td>
		   			<td style="text-align:right" width="10%">角色：</td>
		   			<td style="text-align:left" width="20%">
		   			<s:select name="user.role.id" list="roleList"  headerKey="" headerValue="-请选择-" listKey="id" listValue="roleName"  cssClass="text" cssStyle="width:200px"></s:select>
		   			</td>
		   			<td width="25%"></td>
		   		</tr>
		   		<tr>
		            <td ></td>		
		   			<td style="text-align:right">警号：</td>
		   			<td style="text-align:left"><s:textfield name="user.policeNo"  cssStyle="width:200px" > </s:textfield></td>
		   		
		   			<td style="text-align:right">部门：</td>
		   			<td style="text-align:left"><s:textfield name="user.department" cssStyle="width:200px" ></s:textfield>
		   				
		   			
		   			</td>
		   			<td ></td>	
		   		</tr>	
		   		
		   		
		   		<tr style="height:60px;">
		   		    <td></td>
		   			 <td colspan="2" style="text-align:right; height:30px;">
		   				<input type="button" value="查询" onclick="searchUser()" class="scbtn" />&nbsp;&nbsp;&nbsp;&nbsp;  
		   			 </td>
		   			 <td colspan="2" style="text-align:left;height:30px;">
		   				&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="新增" onclick="addUser()" class="scbtn"   />
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
			   			<th width="10%">姓名</th>
			   			<th width="10%">警号</th>
			   			<th width="20%">角色</th>
			   			<th width="25%">部门</th>
			   			<th width="20%">操作</th>
			   		</tr>
		   		</thead>
		   		
		   		<tbody>
		   			
		   			<s:iterator value="userList" var="user" status="stu">
		   			
		   				<tr <s:if test="#stu.index%2==1">bgcolor="white"</s:if><s:else>bgcolor="#F1F4F9"</s:else>  >
		   				<td ><s:property value="#stu.index+1"/></td>
		   				<td>
		   				 <a href="${contextPath}/user/user_showDetail.do?&user.id=<s:property value='id'/>"><s:property value="Name"/></a>
		   				</td>
		   				<td><s:property value="policeNo"/></td>
		   				<td>
		   					
		   					<s:property value="role.roleName"/>
		   				</td>
		   				<td><s:property value="department"/></td>
		   				
		   				<td>
		   					<a href="${contextPath}/user/user_showDetail.do?&user.id=<s:property value='id'/>" class="tablelink">详情</a>
		   					<s:if test="#session.user.role.roleName=='系统内置角色'">
	   								<a href="${contextPath}/user/user_edit.do?method=init&user.id=<s:property value='id'/>" class="tablelink">修改 </a> 
	   								<a href="javascript:deleteUser(<s:property value="id" />)" class="tablelink">删除</a>

		   					</s:if>
		   					<s:else>
		   						<s:if test="role.roleName !='管理员'">
		   							<a href="${contextPath}/user/user_edit.do?method=init&user.id=<s:property value='id'/>" class="tablelink">修改 </a> 
	   								<a href="javascript:deleteUser(<s:property value="id" />)" class="tablelink">删除</a>
		   						
		   						</s:if>
		   					</s:else>
		   				 </td>
		   			</tr>
		   		</s:iterator>
		   		</tbody>
		   		
		   	</table>
		   	<br/>
	<div align="center">
    	${pageBean}
    </div>
    
    
   
   		
  </body>
</html>
