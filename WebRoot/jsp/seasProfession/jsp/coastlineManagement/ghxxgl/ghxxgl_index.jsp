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
            function search(){
            	document.myForm.action="<%=basePath%>/dgiff/dgiff_fetchHaxGhxxList.do";
            	document.myForm.target="_self";
            	document.myForm.submit();
            }
            //重置
            function resert(){
            	document.getElementById("wjm").value ="";
            	document.getElementById("wjlx").value ="";
            }            
            //删除
            function deleteGhxx(ghID){
            	if(confirm("确定删除该记录吗？")){
            		document.getElementById("ghID").value = ghID;
            		document.myForm.action="<%=basePath%>/dgiff/dgiff_deleteGhxx.do";
            		document.myForm.target="_self";
            		document.myForm.submit();
            	}
            }
            //详情
            function detailGhxx(ghID){
            	document.getElementById("ghID").value = ghID;
            	document.myForm.action="<%=basePath%>/dgiff/dgiff_fetchGhxxDetail.do";
            	document.myForm.target="_self";
            	document.myForm.submit();
            }            
            //修改
            function getUpdateGhxx(ghID){
            	document.getElementById("ghID").value = ghID;
            	document.myForm.action="<%=basePath%>/dgiff/dgiff_fetchForUpdateGhxx.do";
            	document.myForm.target="_self";
            	document.myForm.submit();
            }            
            //下载附件
            function downloadGhxxfj(fj){
            	if(confirm("确定下载该附件吗？")){
            		document.getElementById("fileName").value = fj;
            		document.myForm.action="<%=basePath%>/dgiff/dgiff_downLoadHaxfj.do";
            		document.myForm.target="_self";
            		document.myForm.submit();
            	}
            }
            //打开PDF
            function openPdfwj(fileName){
            	document.getElementById("fileName").value = fileName;
            	document.myForm.action="<%=basePath%>/dgiff/dgiff_openPdf.do";
            	document.myForm.target="_blank";
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
    				<li><a href="#">海岸线规划信息管理</a></li>
    			</ul>
    		</div>
		    <input name="ghID" id="ghID" value="" type="hidden" />
		    <input name="fileName" id="fileName" value="" type="hidden" />		
    		<div class="formbody">
    			<div class="leftinfo1">
    				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
    				<table width="100%" align="center" style="text-align:center;">
    					<tr>
    						<td width="20%">文件名称：</td>
    						<td width="30%"><input name="searchForm.wjm" id="wjm" type="text" value="${searchForm.wjm }" style="width:180px;" /></td>
    						<td width="20%">文件类型：</td>
    						<td width="30%">
    							<select name="searchForm.wjlx" id="wjlx" style="width:180px;">
    								<option value="">-请选择-</option>
    								<option value="PDF">PDF</option>
    								<option value="WORD">WORD</option>
    							</select>
    							<input name="wjlxY" id="wjlxY" type="hidden" value="${searchForm.wjlx }" />
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
        					<a href="${contextPath}/jsp/seasProfession/jsp/coastlineManagement/ghxxgl/ghxxgl_add.jsp"><span>
        					<img src="${contextPath}/images/seasProfession/t01.png"/></span>新增</a>
        				</li>
        			</ul>
        		</div>
        		<table class="tablelist">
        			<thead>
        				<tr>
        					<th width="5%">序号</th>
        					<th width="25%">文件名称</th>
        					<th width="7%">文件类型</th>
        					<th width="25%">附件</th>
        					<th width="7%">上传人</th>    					
        					<th width="16%">操作</th>
        				</tr>
        			</thead>
        			<tbody>
            			<c:forEach items="${ ghxxList }" var="r" varStatus="j">
            				<tr>
            					<td>${j.count }</td>
            					<td>${r.wjm }</td>
            					<td>${r.wjlx }</td>
            					<td>${r.fj }</td>
            					<td>${r.addusername }</td>    					
            					<td>
            						<a href="###" onclick="detailGhxx('${r.id }')"  class="tablelink">详情</a>
            						<a href="###" onclick="getUpdateGhxx('${r.id }')"  class="tablelink">修改</a>
            						<a href="###" onclick="deleteGhxx('${r.id }')" class="tablelink">删除</a>
            						<a href="###" onclick="downloadGhxxfj('${r.fj }')" class="tablelink">下载</a>
            						<c:if test="${r.wjlx == 'PDF' }">
            						<a href="###" onclick="openPdfwj('${r.fj }')" class="tablelink">打开</a>
            						</c:if>
            					</td>
            				</tr>
            			</c:forEach>
        			</tbody>
        		</table>
    	    </div>
        </form>
	    <div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>	
		<script type="text/javascript">
    		if(document.getElementById("wjlxY").value==""){
    			document.getElementById("wjlx").value = "";
    		}else{
    			document.getElementById("wjlx").value = document.getElementById("wjlxY").value;
    		}		
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</body>
</html>