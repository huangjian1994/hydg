<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
    	<script type="text/javascript">
        	function saveUpdateJsjcInfo(){
        		if(document.getElementById("thysyywHysydtHaxJsjc.haxid").value ==""){
        			alert("海岸线名称不允许为空！");
        			return false;
        		}
        		document.myForm.action="<%=basePath%>/dgiff/dgiff_saveUpdateJsjcInfo.do";
        		document.myForm.target="_self";
        		document.myForm.submit();
        	}
        	function goBack(){
        		document.myForm.action="<%=basePath%>/dgiff/dgiff_JsjcListView.do";
        		document.myForm.target="_self";
        		document.myForm.submit();
        	}
        </script>
	</head>
    <body>
        <form name="myForm" method="post">
        	<div class="place">
        		<span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
        		<ul class="placeul">
        			<li><a href="#">海域使用动态管理</a></li>
        			<li><a href="#">海岸线管理</a></li>
        			<li><a href="#">海岸线动态监视监测管理</a></li>
        		</ul>
        	</div>
        	<input name="thysyywHysydtHaxJsjc.id" id="thysyywHysydtHaxJsjc.id" value="${thysyywHysydtHaxJsjc.id}" type="hidden" />
        	<div class="formbody">
       			<div class="leftinfo1">
       				<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
    				<table style="width:100%;" class="tablelist2" align="center">
    					<tr>
    						<td  style="background-color:#f5f8fa;" title="若找不到海岸线名称，请先在《海岸线基础信息管理》中新增海岸线。">海岸线名称：</td>
    						<td colspan="3" title="若找不到海岸线名称，请先在《海岸线基础信息管理》中新增海岸线。">
    							${thysyywHysydtHaxJsjc.haxname}
    						</td>
    					</tr>
    					<tr>
    						<td style="background-color:#f5f8fa;">海岸是否侵蚀：</td>
    						<td>
    							${thysyywHysydtHaxJsjc.sfqs}
    						</td>
    						<td style="background-color:#f5f8fa;">侵蚀情况：</td>
    						<td>
    							${thysyywHysydtHaxJsjc.qsqk}
    						</td>
    					</tr>
    					<tr>
    						<td style="background-color:#f5f8fa;">海岸是否冲淤：</td>
    						<td>
    							${thysyywHysydtHaxJsjc.sfcy}
    						</td>
    						<td style="background-color:#f5f8fa;">冲淤情况：</td>
    						<td>
    							${thysyywHysydtHaxJsjc.cyqk}
    						</td>
    					</tr>
    					<tr>
    						<td style="background-color:#f5f8fa;">海岸是否海水入侵：</td>
    						<td>
    							${thysyywHysydtHaxJsjc.sfhsrq}
    						</td>
    						<td style="background-color:#f5f8fa;">海水入侵情况：</td>
    						<td>
    							${thysyywHysydtHaxJsjc.hsrqqk}
    						</td>
    					</tr>
    					<tr>
    						<td style="background-color:#f5f8fa;">海岸是否有蓝藻：</td>
    						<td>
    							${thysyywHysydtHaxJsjc.sfylz}
    						</td>
    						<td style="background-color:#f5f8fa;">蓝藻情况：</td>
    						<td>
    							${thysyywHysydtHaxJsjc.lzqk}
    						</td>
    					</tr>
    					<tr>
    						<td style="background-color:#f5f8fa;">海岸是否富营养化：</td>
    						<td>
    							${thysyywHysydtHaxJsjc.sffyyh}
    						</td>
    						<td style="background-color:#f5f8fa;">富营养化情况：</td>
    						<td>
    							${thysyywHysydtHaxJsjc.fyyhqk}
    						</td>
    					</tr>
    					<tr>
    						<td style="background-color:#f5f8fa;">海岸线是否有纠纷：</td>
    						<td>
    							${thysyywHysydtHaxJsjc.sfyjf}
    						</td>
    						<td style="background-color:#f5f8fa;">纠纷情况：</td>
    						<td>
    							${thysyywHysydtHaxJsjc.jfqk}
    						</td>
    					</tr>
    					<tr>
    						<td style="background-color:#f5f8fa;">是否违法占用海岸线：</td>
    						<td>
    							${thysyywHysydtHaxJsjc.sfywfzyhaxqk}
    						</td>
    						<td style="background-color:#f5f8fa;">违法占用海岸线情况：</td>
    						<td>
    							${thysyywHysydtHaxJsjc.wfzyhaxqk}
    						</td>
    					</tr>
    					<tr>	
    						<td style="background-color:#f5f8fa;">监视监测日期：</td>
    						<td>${thysyywHysydtHaxJsjc.jsjcrq }</td>
    						<td style="background-color:#f5f8fa;">监视监测人姓名：</td>
    						<td>${thysyywHysydtHaxJsjc.jsjcrxm }</td>
    					</tr>
    					<tr>	
    						<td style="background-color:#f5f8fa;">备注：</td>
    						<td colspan="3">${thysyywHysydtHaxJsjc.bz }</td>
    					</tr>
    					<tr>
    						<td width="20%" style="background-color:#f5f8fa;">新增时间：</td>
    						<td width="30%">
    							${thysyywHysydtHaxJsjc.addtime}
    						</td>
    						<td width="20%" style="background-color:#f5f8fa;">最后修改时间：</td>
    						<td width="30%">
    							${thysyywHysydtHaxJsjc.lastupdatetime}
    						</td>
    					</tr>
    					<tr>
    						<td style="background-color:#f5f8fa;">新增用户姓名：</td>
    						<td colspan="3">
    							${thysyywHysydtHaxJsjc.addusername}
    						</td>
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