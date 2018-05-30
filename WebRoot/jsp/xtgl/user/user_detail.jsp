<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<title>用户管理</title>
<link href="${contextPath}/css/style_tt.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<div class="place">
    <span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
    <ul class="placeul">
    <li><a href="#">系统管理</a></li>
    <li><a href="#">用户管理</a></li>
	<li><a href="#">用户详情</a></li>
    </ul>
    </div>
    
	
    
    
    <table class="filetable2">
    
    <tbody>
        
        <tr style=" border:1px solid #b5bfc4;">
        <td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%" >用户编号：</td>
        <td style=" border:1px solid #b5bfc4;text-align:left" width="20%" ><s:property value="user.id"/></td>
        <td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%" >用户姓名：</td>
        <td style="border:1px solid #b5bfc4;text-align:left" width="20%" ><s:property value="user.Name"/></td>
        </tr>
        
        <tr style=" border:1px solid #b5bfc4;">
        <td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%" >用户账户：</td>
        <td style=" border:1px solid #b5bfc4;text-align:left" width="20%" ><s:property value="user.userName"/></td>
        <td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%" >密码：</td>
        <td style="border:1px solid #b5bfc4;text-align:left" width="20%" ><s:property value="user.password"/></td>
        </tr>
        
        <tr style=" border:1px solid #b5bfc4;">
        <td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%" >所属角色：</td>
        <td style=" border:1px solid #b5bfc4;text-align:left" width="20%" ><s:property value="user.role.roleName"/></td>
        <td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%" >性别：</td>
        <td style="border:1px solid #b5bfc4;text-align:left" width="20%" ><s:property value="user.gender"/></td>
        </tr>
		
		<tr style=" border:1px solid #b5bfc4;">
        <td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%" >身份证号：</td>
        <td style=" border:1px solid #b5bfc4;text-align:left" width="20%" ><s:property value="user.userId"/></td>
        <td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%" >部门名称：</td>
        <td style="border:1px solid #b5bfc4;text-align:left" width="20%" ><s:property value="user.department"/></td>
        </tr>
		<s:if test="user.role.roleName=='专家'">
		<tr style=" border:1px solid #b5bfc4;">
        <td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%" >学历：</td>
        <td style=" border:1px solid #b5bfc4;text-align:left" width="20%" ><s:property value="user.edubackground"/></td>
        <td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%" >专业：</td>
        <td style="border:1px solid #b5bfc4;text-align:left" width="20%" ><s:property value="user.specialty"/></td>
        </tr>
    
	     <tr style=" border:1px solid #b5bfc4;">
        <td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%" >专业领域：</td>
        <td style=" border:1px solid #b5bfc4;text-align:left" width="20%" ><s:property value="user.professionalArea"/></td>
        <td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%" >职称：</td>
        <td style="border:1px solid #b5bfc4;text-align:left" width="20%"><s:property value="user.position"/></td>
        </tr>
		 
		 <tr style=" border:1px solid #b5bfc4;">
        <td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">联系电话：</td>
        <td style=" border:1px solid #b5bfc4;text-align:left" width="20%"><s:property value="user.mphone"/></td>
        <td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" width="10%">邮箱地址：</td>
        <td style="border:1px solid #b5bfc4;text-align:left" width="20%"><s:property value="user.email"/></td>
        </tr>
		
		<tr style=" border:1px solid #b5bfc4;">
  				<td style=" border:1px solid #b5bfc4;text-align:right; background-color:#e8edef;" >联系地址:</td>
  				<td style=" border:1px solid #b5bfc4;text-align:left" colspan="3"><s:property value="user.address"/></td>	
  		</tr>
		</s:if>
		<tr style=" border:1px solid #b5bfc4; height:40px;">
        <td style=" text-align:center" colspan="4" >
        <input type="button" value="返回" class="scbtn" onclick="javascript:history.back(-1);"/></td>
        </tr>
		
    </tbody>
    
    
	
	</table>
    
    
   

</body>

</html>
