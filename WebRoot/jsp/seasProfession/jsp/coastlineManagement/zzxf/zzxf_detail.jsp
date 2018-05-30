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
        		document.myForm.action="<%=basePath%>/dgiff/dgiff_fetchHaxZzxfList.do";
        		document.myForm.target="_self";
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
       				<li><a href="#">海岸线整治修复</a></li>
       			</ul>
       		</div>        		
     		<div class="formbody">
     			<div class="leftinfo" >
   			        <div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />新增</div>
     				<table style="width:100%;" class="tablelist2" align="center">
 						<tr>
 							<td style="background-color:#f5f8fa;" title="若找不到海岸线名称，请先在《海岸线基础信息管理》中新增海岸线。">海岸线名称：</td>
 							<td colspan="3">${hysyywHysydtHaxZzxf.haxid }</td>
 						</tr>
 						<tr>
 							<td style="background-color:#f5f8fa;" >岸段序号：</td>
 							<td colspan="3" >${hysyywHysydtHaxZzxf.adxh }</td>
 						</tr>
 						<tr>
 							<td style="background-color:#f5f8fa;">是否沙滩修复养护：</td>
 							<td >${hysyywHysydtHaxZzxf.sfstxfyh }</td>
 							<td style="background-color:#f5f8fa;">沙滩修复养护：</td>
 							<td >${hysyywHysydtHaxZzxf.stxfyhqk }</td>
 						</tr>
 						<tr>
 							<td style="background-color:#f5f8fa;">是否近岸构筑物清理：</td>
 							<td>${hysyywHysydtHaxZzxf.sfjagzwql }</td>
 							<td style="background-color:#f5f8fa;">近岸构筑物清理：</td>
 							<td>${hysyywHysydtHaxZzxf.jagzwqlqk }</td>
 						</tr>
 						<tr>
 							<td style="background-color:#f5f8fa;">是否清淤疏浚整治：</td>
 							<td>${hysyywHysydtHaxZzxf.sfqysjzz }</td>
 							<td style="background-color:#f5f8fa;">清淤疏浚整治：</td>
 							<td>${hysyywHysydtHaxZzxf.qysjzzqk }</td>
 						</tr>
 						<tr>
 							<td style="background-color:#f5f8fa;">是否滨海湿地植被种植与恢复：</td>
 							<td>${hysyywHysydtHaxZzxf.sfzzhf }</td>
 							<td style="background-color:#f5f8fa;">滨海湿地植被种植与恢复：</td>
 							<td>${hysyywHysydtHaxZzxf.zzhfqk }</td>
 						</tr>
 						<tr>
 							<td style="background-color:#f5f8fa;">是否海岸生态廊道建设：</td>
 							<td>${hysyywHysydtHaxZzxf.sfstldjs }</td>
 							<td style="background-color:#f5f8fa;">海岸生态廊道建设：</td>
 							<td>${hysyywHysydtHaxZzxf.stldjsqk }</td>
 						</tr>
 						
 						<tr>	
 							<td style="background-color:#f5f8fa;">修复时间：</td>
 							<td>${hysyywHysydtHaxZzxf.xfsj }</td>
 							<td style="background-color:#f5f8fa;">修复情况：</td>
 							<td>${hysyywHysydtHaxZzxf.xfqk }</td>
 						</tr>
 						<tr>	
 							<td style="background-color:#f5f8fa;">备注：</td>
 							<td colspan="3">${hysyywHysydtHaxZzxf.bz }</td>
 						</tr>
 						<tr>
 							<td style="background-color:#f5f8fa;">新增用户姓名：</td>
 							<td colspan="3">${hysyywHysydtHaxZzxf.addusername }</td>
 						</tr>
 						<tr>
 							<td width="22%" style="background-color:#f5f8fa;">新增时间：</td>
 							<td width="28%">${hysyywHysydtHaxZzxf.addtime }</td>
 							<td width="20%" style="background-color:#f5f8fa;">最后修改时间：</td>
 							<td width="30%">${hysyywHysydtHaxZzxf.lastupdatetime }</td>
 						</tr>
 						<tr>
 							<td colspan="4" style="text-align:center;">
 								<input name="back" type="button" class="scbtn" onclick="goBack()" value="返回"/>
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