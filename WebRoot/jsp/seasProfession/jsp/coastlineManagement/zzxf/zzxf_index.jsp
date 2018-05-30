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
        <script type="text/javascript">
            $(document).ready(function(){
            	var xfqkY=document.getElementById("xfqkY").value;
            	getDictionary("海岸线修复情况","xfqk",xfqkY);
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
            function search(){
            	document.myForm.action="<%=basePath%>/dgiff/dgiff_fetchHaxZzxfList.do";
            	document.myForm.target="_self";
            	document.myForm.submit();
            }
            //重置
            function resert(){
            	document.getElementById("haxmc").value ="";
            	document.getElementById("xfqk").value ="";
            }            
            //删除
            function deleteZzxf(zzID){
            	if(confirm("确定删除该记录吗？")){
            		document.getElementById("zzID").value = zzID;
            		document.myForm.action="<%=basePath%>/dgiff/dgiff_deleteZzxf.do";
            		document.myForm.target="_self";
            		document.myForm.submit();
            	}
            }
            //详情
            function detailZzxf(zzID){
            	document.getElementById("zzID").value = zzID;
            	document.myForm.action="<%=basePath%>/dgiff/dgiff_fetchZzxfDetail.do";
            	document.myForm.target="_self";
            	document.myForm.submit();
            }            
            //修改
            function getUpdateZzxf(zzID){
            	document.getElementById("zzID").value = zzID;
            	document.myForm.action="<%=basePath%>/dgiff/dgiff_fetchForUpdateZzxf.do";
            	document.myForm.target="_self";
            	document.myForm.submit();
            }        
        </script>
	</head>
	<body>
        <form name="myForm" method="post" >
       		<div class="place">
       			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
       			<ul class="placeul">
       				<li><a href="#">海域使用动态管理</a></li>
       				<li><a href="#">海岸线管理</a></li>
       				<li><a href="#">海岸线整治修复</a></li>
       			</ul>
       		</div>
       		<input name="zzID" id="zzID" value="" type="hidden" />        		
       		<div class="formbody">
       			<div class="leftinfo1">
       				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
       				<table width="100%" align="center" style="text-align:center;">
       					<tr>
       						<td width="20%">海岸线名称：</td>
       						<td width="30%">
       							<select name="searchForm.haxmc" id="haxmc" style="width:200px;">
       								<option value="">请选择</option>
       								<c:forEach items="${thysyywHysydtHaxJcxxList}" var="r" varStatus="j">
       									<option <c:if test="${searchForm.haxmc==r.name }">selected="selected"</c:if> value="${r.name}">${r.name}</option>
       								</c:forEach>
       							</select>       						
       						</td>
       						<td width="20%">修复情况：</td>
       						<td width="30%">
       							<select name="searchForm.xfqk" id="xfqk" style="width:180px;">
       								<option value="">-请选择-</option>
       							</select>
       							<input name="xfqkY" id="xfqkY" type="hidden" value="${searchForm.xfqk }" />
       						</td>
       					</tr>
       					<tr>
       						<td colspan="4">
       							<input name="查询" type="button" class="scbtn" value="查询" onclick="search()" />
       							<input name="重置" type="button" class="scbtn" value="重置" onclick="resert()" />
       						</td>
       					</tr>
       				</table>
       			</div><br />       		
        		<div class="tools">
        			<ul class="toolbar">
        				<li>
        					<a href="${contextPath}/dgiff/dgiff_goAddZzxf.do"><span>
        					<img src="${contextPath}/images/seasProfession/t01.png"/></span>新增</a>
        				</li>
        			</ul>
        		</div>
         		<table class="tablelist">
         			<thead>
         				<tr>
         					<th width="5%">序号</th>
         					<th width="15%">海岸线名称</th>
         					<th width="7%">岸段序号</th>
         					<th width="10%">是否沙滩修复养护</th>
         					<th width="11%">是否近岸构筑物清理</th>         					
         					<th width="10%">是否清淤疏浚整治</th>
         					<th width="8%">修复时间</th>
         					<th width="8%">修复情况</th>
         					<th width="10%">操作</th>
         				</tr>
         			</thead>
         			<tbody>
             			<c:forEach items="${ zzxfList }" var="r" varStatus="j">
             				<tr>
             				    <!-- ID,HAXID,HAXMC,ADXH,SFSTXFYH,SFJAGZWQL,SFQYSJZZ,XFSJ,XFQK -->
             					<td>${j.count }</td>
             					<td>${r[2] }</td>
             					<td>${r[3] }</td>
             					<td>${r[4] }</td>
             					<td>${r[5] }</td>
             					<td>${r[6] }</td>
             					<td>${r[7] }</td>
             					<td>${r[9] }</td>
             					<td>
             						<a href="###" onclick="detailZzxf('${r[0] }')"  class="tablelink">详情</a>
             						<a href="###" onclick="getUpdateZzxf('${r[0] }')"  class="tablelink">修改</a>
             						<a href="###" onclick="deleteZzxf('${r[0] }')" class="tablelink">删除</a>
             					</td>
             				</tr>
             			</c:forEach>
         			</tbody>
         		</table>
       		</div>
        </form>
	    <div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>	
		<script type="text/javascript">		
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</body>
</html>