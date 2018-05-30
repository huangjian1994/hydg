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
    		//代码
    		$(document).ready(function(){
    			var xzqhY=document.getElementById("xzqhY").value;   
    			getDictionary("行政区划","xzqh",xzqhY);    
    		});
    		//加载字典
    		function getDictionary(keyZ,selectID,historyZ){
    			$.ajax({		  		
    				type: "post",
    				dataType:"json",
    				url: "${contextPath}/business/business_fetchDictionary.do",
    				data: "dictionary.key="+keyZ,
    				success: function(d){
    					for(var i=0;i<d.length;i++){
    						//alert(d);
    						if(d[i].dm==historyZ){
    							$("<option value= '"+d[i].dm+"' selected>"+d[i].value+"</option>").appendTo("#"+selectID);
    						}else{
    							$("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
    						}
    					}
    				}
    			});	  
    		}			
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
			function searchHax(){
				document.myForm.action="<%=basePath%>/dgiff/dgiff_searchHaxByEntity.do";
				document.myForm.target="_self";
				document.myForm.submit();
			}
			//修改
			function ToUpdateHaxJsp(id){
				if(confirm("确定修改该记录吗？")){
					document.myForm.action="<%=basePath%>/dgiff/dgiff_ToUpdateHaxJsp.do?id="+id;
					document.myForm.target="_self";
					document.myForm.submit();
				}
			}
			//删除
			function deleteHaxInfo(id){
				if(confirm("确定删除该记录吗？")){
					document.myForm.action="<%=basePath%>/dgiff/dgiff_deleteHaxInfo.do?id="+id;
					document.myForm.target="_self";
					document.myForm.submit();
				}
			}
			//详情
			function ToDetaileHaxJsp(id){
				document.myForm.action="<%=basePath%>/dgiff/dgiff_ToDetaileHaxJsp.do?id="+id;
				document.myForm.target="_self";
				document.myForm.submit();
			}

			//重置
			function resert(){
				document.getElementById("name").value ="";
				document.getElementById("xzqh").value ="";
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
    				<li><a href="#">海岸线基础信息管理</a></li>
    			</ul>
    		</div>
    		<div class="formbody">
    			<div class="leftinfo1">
    				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
    				<table width="100%" align="center" style="text-align:center;">
    					<tr>
    						<td>海岸线名称：</td>
    						<td>
    							<input name="thysyywHysydtHaxJcxx.name" id="name" type="text" value="${thysyywHysydtHaxJcxx.name }" style="width:200px;" />
    						</td>
    
    						<td>行政区划：</td>
    						<td>
    							<select name="thysyywHysydtHaxJcxx.xzqh" id="xzqh" style="width:200px;">
    								<option value="">请选择</option>
    							</select>
    							<input name="xzqhY" id="xzqhY" type="hidden" value="${thysyywHysydtHaxJcxx.xzqh}" style="width:200px;" />
    						</td>
    					</tr>
    					<tr>
    						<td colspan="4">
    							<input name="search" type="button" class="scbtn" onclick="searchHax()" value="查询" />
    							<input name="重置" type="button" class="scbtn" value="重置" onclick="resert()" />
    						</td>
    					</tr>
    				</table>
   				</div><br />        			
           		<div class="tools">
           			<ul class="toolbar">
           				<li>
           					<a href="${contextPath}/dgiff/dgiff_toAddHaxInfo.do"><span><img src="${contextPath}/images/seasProfession/t01.png"/></span>新增</a>
           				</li>
           			</ul>
           		</div>
       		    <table class="tablelist">
           			<thead>
           				<tr>
           					<th width="5%">序号</th>
           					<th width="15%">海岸线名称</th>
           					<th width="10%">行政区划</th>
           					<th width="10%">海岸线位置</th>
           					<th width="15%">海岸线长度（千米）</th>				
           					<th width="10%">经度</th>
           					<th width="10%">纬度</th>
           					<th width="15%">操作</th>
           				</tr>
           			</thead>
           			<tbody>
           				<c:forEach items="${thysyywHysydtHaxJcxxList}" var="r" varStatus="j">
           					<tr>
           						<td>${j.count}</td>
           						<td>${r[1]}</td>
           						<td>${r[3]}</td>
           						<td>${r[4]}</td>
           						<td>${r[5]}</td>
           						<td>${r[6]}</td>
           						<td>${r[7]}</td>
           						<td>
           							<a href="###" onclick="ToDetaileHaxJsp('${r[0]}')" class="tablelink">详情</a>&nbsp;
           							<a href="###" onclick="ToUpdateHaxJsp('${r[0]}')" class="tablelink">修改</a>&nbsp;
           							<a href="###" onclick="deleteHaxInfo('${r[0]}')" class="tablelink">删除</a>
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