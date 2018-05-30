<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>日志列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link href="${contextPath}/css/style_o.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${contextPath}/js/My97DatePicker/WdatePicker.js" ></script>
	<script type="text/javascript">

		$(document).ready(function(){
			var  sqlStr=$("td:last",".content_tr:eq(0)").html();
			$("#td_sql").html(sqlStr);

		});
		function searchLog(){

				$("#logListForm").submit();
		}

		function showSQL(tr_id){
				var  sqlStr=$("td:last","#tr_"+tr_id).html();
				$("#td_sql").html(sqlStr);
		}
	</script>
  </head>
  
  <body>
  		<div class="place">
    <span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
    <ul class="placeul">
    <li><a href="#">系统管理</a></li>
    <li><a href="#">日志管理</a></li>
    </ul>
    </div>
  		
  		<br/>
  		
  	
  			<s:form id="logListForm" action="log/log_list.do" >
	   		<table class="filetable3">
	   		<tbody>
		   		<tr>
		   		    <td width="10%"></td>
		   			<td style="text-align:right" width="10%">操作用户：</td>
		   			<td style="text-align:left" width="20%">
		   			<s:textfield name="user.Name" cssStyle="width:200px"> </s:textfield>
		   			</td>
		   			<td style="text-align:right" width="10%">操作类型：  </td>
		   			<td style="text-align:left" width="20%">
		   			<s:select name="opLog.operateType" list="#{'-1':'-请选择-','0':'登录','1':'查询','2':'增加','3':'修改','4':'删除'}" cssStyle="width:200px"></s:select>
		   			</td>
		   			<td width="10%"></td>
		   		</tr>
		   		<tr>
		   		    <td ></td>
		   			<td style="text-align:right">操作模块：</td>
		   			<td style="text-align:left"><s:textfield name="opLog.operateName"   cssStyle="width:200px"> </s:textfield></td>
		   			<td style="text-align:right">操作时间：</td>
		   			<td style="text-align:left">  
		   				<s:textfield onclick="WdatePicker()" name="opLog.opTime"  cssStyle="width:200px"></s:textfield>
		   			</td>
		   			<td></td>
		   		</tr>
		   		<tr>
		   			<td colspan="6" style="text-align:center; height:30px;">
		   				<input type="button" value="查询" onclick="searchLog()" class="scbtn" />
					 </td>
		   		</tr>
		   		</tbody>
	  	 	</table>
  			</s:form>
  			
  			<br/><br/>
  			
		   	<table class="tablelist23">
		       <thead>
			   		<tr>
			   		<th width="5%">序号<i class="sort"><img src="${contextPath}/images/px.gif" /></i></th>
			   		<th width="25%">操作模块</th>
			   		<th width="10%">操作用户</th>
			   		<th width="15%">操作时间</th>
			   		<th width="10%">操作IP</th>
			   		<th width="10%">操作类型</th>
			   		<th width="10%">操作状态</th>
			   		<th style="display: none">操作SQL</th>
			   		</tr>
		   		</thead>
		   		<tbody>	
		   			<s:iterator value="opLogList" var="log" status="stu">
		   			
		   				<tr class ="content_tr" id="tr_<s:property value="#stu.index"/>"  <s:if test="#stu.index%2==1">bgcolor="white"</s:if><s:else>bgcolor="#F1F4F9"</s:else>  >
		   			
		   				<td><s:property value="#stu.index+1"/></td>
		   				<td><a href='javascript:showSQL(<s:property value="#stu.index"/>)' title="<s:property value='operateCondition' />"><s:property value="operateName"/></a> </td>
		   				<td><s:property value="userName"/></td>
		   				<td><s:property value="opTime"/></td>
		   				<td><s:property value="terminalId"/></td>
		   				<td>
		   				<s:if test="operateType==0">
		   						登录
		   					</s:if>
		   					<s:if test="operateType==1">
		   						查询
		   					</s:if>
		   					<s:if test="operateType==2">
		   						新增
		   					</s:if>
		   					<s:if test="operateType==3">
		   						修改
		   					</s:if>
		   					<s:if test="operateType==4">
		   						删除
		   					</s:if>
		   				</td>
		   				<td>
		   					<s:if test="operateResult==1">
		   						成功
		   					</s:if>
		   					<s:if test="operateResult==0">
		   						失败
		   					</s:if>
		   					
		   				</td>
		   				<td style="display: none">
		   					<s:property value="operateCondition"/>
		   				</td>
		   			</tr>
		   		</s:iterator>
		   		
		   		<tr bgcolor="#f0f5f7">
	   	 			<td colspan="7" align="center">
	   	 				<strong>执行的SQL</strong>
	   	 			</td>
	   	 		</tr>	

   	 		 	<tr>
		   	 			<td  colspan="7"  id="td_sql" STYLE="word-wrap: break-word;word-break:break-all;">
		   	 				
		   	 			</td>
	   	 		</tr>
		   		</tbody>
		   	</table>
		   	
		   
		   	<br/>
	   		<div  align="center">${pageBean}</div>
   		
  </body>
</html>
