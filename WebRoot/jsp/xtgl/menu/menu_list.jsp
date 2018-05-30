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

		function addMenu(){
				
				document.location.href="${contextPath}/menu/menu_add.do?method=init";
			}

			function deleteMenu(id){
				
				if(confirm("你确实要删除吗")){

	

					document.location.href='${contextPath}/menu/menu_delete.do?menu.id='+id;
				}

				
			}

			function showHello(){
					alert("nihao");
				}
	</script>
	<link href="${contextPath}/css/style_o.css" rel="stylesheet" type="text/css" />
	
  </head>
  
  <body>
  		
	<div class="place">
    <span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
    <ul class="placeul">
    <li>系统管理</li>
    <li>菜单管理</li>
    </ul>
    </div>
  			<s:form id="menuListForm" action="menu/menu_list.do" >
	   		<table class="filetable3">
	   		 <tbody>
		   		
		   		<tr>
		   		    <td width="20%"></td>
		   			<td style="text-align:right" width="10%">菜单名称：</td>
		   			<td style="text-align:left" width="20%"> <s:textfield name="menu.menuName" cssStyle="width:200px"> </s:textfield></td>
		   			<td style="text-align:right" width="10%">菜单级别：</td>
		   			<td style="text-align:left" width="20%"><s:select  name="menu.menuLevel" list="#{'':'-请选择-','1':'一级', '2':'二级','3':'三级'}" cssClass="text" cssStyle="width:200px"></s:select>
		   			</td>
		   			<td width="25%"></td>
		   		</tr>
		   		<tr style="height:60px;">
		   		    <td></td>
		   			 <td colspan="2" style="text-align:right; height:30px;">
		   				<input type="submit" value="查询"  class="scbtn" />&nbsp;&nbsp;&nbsp;&nbsp;  
		   			 </td>
		   			 <td colspan="2"  style="text-align:left;height:30px;">
		   				&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="新增" onclick="script:addMenu()" class="scbtn"   />
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
			   		<th width="5%">序号</th>
			   		<th width="15%">菜单名称</th>
			   		<th width="15%">父节点名称</th>
			   		<th width="30%">菜单资源地址</th>
			   		<th width="10%">菜单级别</th>
			   		<th width="15%">操作</th>
			   		</tr>
		   		</thead>
		   		
		   		<tbody>
		   		<s:iterator value="menuList" var="menu" status="stu">
	   			<tr <s:if test="#stu.index%2==1">bgcolor="white"</s:if><s:else>bgcolor="#F1F4F9"</s:else>  >
	   				<td align="center"><s:property value="#stu.index+1"/></td>
	   				<td align="center"><s:property value="menuName"/></td>
	   				<td align="center"><s:property value="parent.menuName"/>&nbsp;</td>
	   				<td align="center"><s:property value="resourceURL"/>&nbsp;</td>
	   				<td align="center"><s:property value="menuLevel"/>&nbsp;</td>
	   				<td align="center">	   					 
  					 	<a href="javascript:deleteMenu(<s:property value="id" />)" class="tablelink">删除</a>
  						<a href='${contextPath}/menu/menu_edit.do?method=init&menu.id=<s:property value="id" />' class="tablelink">修改</a>			 			
	   				</td>
	   			</tr>
	   		</s:iterator>
		   		</tbody>
		   		
		   	</table>
		   	<br/>
	<div align="center">
    	${pageBean}
    </div>
    
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
   		
  </body>
</html>
