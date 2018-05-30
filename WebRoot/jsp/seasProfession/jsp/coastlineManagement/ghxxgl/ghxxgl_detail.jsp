<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
    	<script type="text/javascript">
    	//返回
    	function goBack(){
    		document.myForm.action="<%=basePath%>/dgiff/dgiff_fetchHaxGhxxList.do";
    		document.myForm.target="_self";
    		document.myForm.submit();
    	}
    	//下载附件
    	function downloadfjwj(fileName){
    		if(confirm("确定下载该附件吗？")){
    			document.getElementById("fileName").value = fileName;
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
        <form name="myForm" method="post" enctype="multipart/form-data">
    		<div class="place">
    			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
    			<ul class="placeul">
    				<li><a href="#">海域使用动态管理</a></li>
    				<li><a href="#">海岸线管理</a></li>
    				<li><a href="#">海岸线规划信息管理</a></li>
    			</ul>
    		</div>
    		<input name="fileName" id="fileName" value="" type="hidden" />
    		<div class="formbody">
    			<div class="leftinfo" >
        			<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
        			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
        				<tr>
        					<td style="background-color:#f5f8fa;">文件名称：</td>
        					<td colspan="3">${hysyywHysydtHaxGhxx.wjm }</td>
        				</tr>
        				<tr>
        					<td style="background-color:#f5f8fa;">文件类型：</td>
        					<td colspan="3">${hysyywHysydtHaxGhxx.wjlx}</td>
        				</tr>
        				<tr>
        					<td style="background-color:#f5f8fa;">附件：</td>
        					<td colspan="3">${hysyywHysydtHaxGhxx.fj}&nbsp;&nbsp;
        					    <a href="###" onclick="downloadfjwj('${hysyywHysydtHaxGhxx.fj }')">
        					        <font color="blue">下载</font>
                                </a>					
            					<c:if test="${hysyywHysydtHaxGhxx.wjlx == 'PDF' }">&nbsp;&nbsp;
                					<a href="###" onclick="openPdfwj('${hysyywHysydtHaxGhxx.fj}')">
                					    <font color="blue">打开</font>
                                    </a>
            					</c:if>					
        					</td>
        				</tr>
        				<tr>
        					<td style="background-color:#f5f8fa;">备注：</td>
        					<td colspan="3">${hysyywHysydtHaxGhxx.bz }</td>
        				</tr>
        				<tr>
        					<td style="background-color:#f5f8fa;">新增用户姓名：</td>
        					<td colspan="3">${hysyywHysydtHaxGhxx.addusername }</td>
        				</tr>
        				<tr>
        					<td width="20%" style="background-color:#f5f8fa;">新增时间：</td>
        					<td width="30%">${hysyywHysydtHaxGhxx.addtime }</td>
        					<td width="20%" style="background-color:#f5f8fa;">最后修改时间：</td>
        					<td width="30%">${hysyywHysydtHaxGhxx.lastupdatetime }</td>
        				</tr>
        				<tr>
        					<td colspan="4" style="text-align:center;">
        						<input name="fh" type="button" value="返回" class="scbtn" onclick="goBack()" />
        					</td>
        				</tr>
        			</table>
    			</div>
    		</div>
    		<script type="text/javascript">
    
    			$('.tablelist tbody tr:odd').addClass('odd');
    		</script>
        </form>
	</body>
</html>