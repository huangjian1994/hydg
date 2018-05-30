<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript">	
			//全选
			function checkAll(){
				var cb = document.getElementById("cb");
				var chks = document.getElementsByName("chk");
				if(cb.checked==true){
					for(var i=0;i<chks.length;i++){
						chks[i].checked=true;
					}
				}else{
					for(var i=0;i<chks.length;i++){
						chks[i].checked=false;
					}
				}
			}
			function searchJsjc(){
				document.myForm.action="<%=basePath%>/dgiff/dgiff_searchJsjcByEntity.do";
				document.myForm.target="_self";
				document.myForm.submit();
			}
			//修改
			function ToUpdateJsjcJsp(id){
				if(confirm("确定修改该记录吗？")){
					document.myForm.action="<%=basePath%>/dgiff/dgiff_ToUpdateJsjcJsp.do?id="+id;
					document.myForm.target="_self";
					document.myForm.submit();
				}
			}
			//删除
			function deleteJsjcInfo(id){
				if(confirm("确定删除该记录吗？")){
					document.myForm.action="<%=basePath%>/dgiff/dgiff_deleteJsjcInfo.do?id="+id;
					document.myForm.target="_self";
					document.myForm.submit();
				}
			}
			//详情
			function ToDetaileJsjcJsp(id){
				document.myForm.action="<%=basePath%>/dgiff/dgiff_ToDetaileJsjcJsp.do?id="+id;
				document.myForm.target="_self";
				document.myForm.submit();
			}
			//重置
			function resert(){
				document.getElementById("thysyywHysydtHaxJsjc.haxname").value ="";
			}
		</script>
	</head>
	<body>
    	<form name="myForm" method="post">
    		<div class="place">
    			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
    			<ul class="placeul">
    				<li><a href="#">海域使用动态管理</a></li>
    				<li><a href="#">海岸线管理</a></li>
    				<li><a href="#">海岸线动态监视监测管理</a></li>
    			</ul>
    		</div>    
    		<div class="formbody">
    			<div class="leftinfo1">
    				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
    				<table width="100%" align="center" style="text-align:center;">
    					<tr>
    						<td>海岸线名称：</td>
    						<td colspan="3" style="text-align:left;">&nbsp;&nbsp;
    							<select name="thysyywHysydtHaxJsjc.haxname" id="thysyywHysydtHaxJsjc.haxname" style="width:200px;">
    								<option value="">请选择</option>
    								<c:forEach items="${thysyywHysydtHaxJcxxList}" var="r" varStatus="j">
    									<option <c:if test="${thysyywHysydtHaxJsjc.haxname==r.name }">selected="selected"</c:if> value="${r.name}">${r.name}</option>
    								</c:forEach>
    							</select>
    						</td>
    					</tr>
    					<tr>
    						<td colspan="4">
    							<input name="search" type="button" class="scbtn" onclick="searchJsjc()" value="查询" />
    							<input name="重置" type="button" class="scbtn" value="重置" onclick="resert()" />
    						</td>
    					</tr>
    				</table>
    			</div><br />      		
        		<div class="tools">
        			<ul class="toolbar">
        				<li>
        					<a href="${contextPath}/dgiff/dgiff_toAddJsjcInfo.do"><span><img src="${contextPath}/images/seasProfession/t01.png"/></span>新增</a>
        				</li>
        			</ul>
        		</div>
        		<table class="tablelist">
        			<thead>
        				<tr>
        					<th>序号</th>
        					<th>海岸线名称</th>
        					<th>是否侵蚀</th>
        					<th>是否冲淤</th>				
        					<th>是否海水入侵</th>
        					<th>是否有蓝藻</th>
        					<th>是否富营养化</th>
        					<th>监视监测日期</th>
        					<th>监视监测人</th>
        					<th>操作</th>
        				</tr>
        			</thead>
        			<tbody>
        				<c:forEach items="${thysyywHysydtHaxJsjcList}" var="r" varStatus="j">
        					<tr>        						
        						<td>${j.count}</td>
        						<td>${r.haxname}</td>
        						<td>${r.sfqs}</td>
        						<td>${r.sfcy}</td>
        						<td>${r.sfhsrq}</td>
        						<td>${r.sfylz}</td>
        						<td>${r.sffyyh}</td>
        						<td>${r.jsjcrq}</td>
        						<td>${r.jsjcrxm}</td>
        						<td>
        							<a href="###" onclick="ToDetaileJsjcJsp('${r.id}')" class="tablelink">详情</a>&nbsp;
        							<a href="###" onclick="ToUpdateJsjcJsp('${r.id}')" class="tablelink">修改</a>&nbsp;
        							<a href="###" onclick="deleteJsjcInfo('${r.id}')" class="tablelink">删除</a>
        						</td>
        					</tr>
        				</c:forEach>
        			</tbody>
        		</table>
    		</div>
   		</form>
        <div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>	
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>
		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>		
	</body>
</html>