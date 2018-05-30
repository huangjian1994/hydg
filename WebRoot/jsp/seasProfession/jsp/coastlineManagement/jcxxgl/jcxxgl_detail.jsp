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
        	$(document).ready(function(){
        		var xzqhTD = document.getElementById("xzqhTD").innerHTML;
        		//alert(xzqhTD);
        		getDictionaryFy("行政区划","xzqhTD",xzqhTD);
        	});
        	//翻译字典
        	function getDictionaryFy(keyZ,tableTdID,historyZ){
        		$.ajax({		  		
        			type: "post",
        			dataType:"json",
        			url: "${contextPath}/business/business_fetchDictionary.do",
        			data: "dictionary.key="+keyZ,
        			success: function(d){
        				for(var i=0;i<d.length;i++){
        					//alert(d[i].dm+"==="+historyZ)
        					if(d[i].dm == historyZ){
        						//alert(d[i].dm);
        						document.getElementById(tableTdID).innerHTML=d[i].value;
        					}else{
        						
        					}
        				}
        			}
        		});	  
        	}        	        	
        	function goBack(){
        		document.myForm.action="<%=basePath%>/dgiff/dgiff_haxjcxxInfo.do";
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
        			<li><a href="#">海岸线基础信息管理</a></li>
        		</ul>
        	</div>
        	<div class="formbody">
       			<div class="leftinfo1">
       				<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
   					<table style="width:100%;" class="tablelist2" align="center">
   							<tr>
   								<td style="background-color:#f5f8fa;">海岸线名称：</td>
   								<td colspan="3">${thysyywHysydtHaxJcxx.name }</td>
   							</tr>
   							<tr>
   								<td  style="background-color:#f5f8fa;">岸段序号：</td>
   								<td>
   									${thysyywHysydtHaxJcxx.adxh}
   								</td>
   								<td  style="background-color:#f5f8fa;">海岸线长度：</td>
   								<td>
   									${thysyywHysydtHaxJcxx.cd}千米
   								</td>
   							</tr>
   							<tr>
   								<td  style="background-color:#f5f8fa;">海岸线类型：</td>
   								<td colspan="3">
   									<c:if test ="${thysyywHysydtHaxJcxx.haxlx_a!=null}">
   										<font>一级：</font>
   										${thysyywHysydtHaxJcxx.haxlx_a}
   									</c:if>
   									<c:if test ="${thysyywHysydtHaxJcxx.haxlx_b!=null}">
   										<font style="padding-right:25px;"></font>
   										<font>二级：</font>
   										${thysyywHysydtHaxJcxx.haxlx_b}
   									</c:if>
   									<c:if test ="${thysyywHysydtHaxJcxx.haxlx_c!=null}">
   										<font style="padding-right:25px;"></font>
   										<font>三级：</font>
   										${thysyywHysydtHaxJcxx.haxlx_c}
   									</c:if>
   								</td>
   							</tr>
   							<tr>
   								<td width="22%"  style="background-color:#f5f8fa;">海岸线所在行政区划：</td>
   								<td width="28%" id="xzqhTD">${thysyywHysydtHaxJcxx.xzqh}</td>
   								<td width="20%"  style="background-color:#f5f8fa;">海岸线位置：</td>
   								<td width="30%">
   									${thysyywHysydtHaxJcxx.wz}
   								</td>
   							</tr>
   							<tr>
   								<td style="background-color:#f5f8fa;">端点坐标经度：</td>
   								<td>
   									${thysyywHysydtHaxJcxx.jd}
   								</td>
   								<td style="background-color:#f5f8fa;">端点坐标纬度：</td>
   								<td>
   									${thysyywHysydtHaxJcxx.wd}
   								</td>
   							</tr>
   							<tr>
   								<td style="background-color:#f5f8fa;">备注：</td>
   								<td colspan="3">
   									${thysyywHysydtHaxJcxx.bz}
   								</td>
   							</tr>
   							
   							<tr>
   								<td style="background-color:#f5f8fa;">新增时间：</td>
   								<td>
   									${thysyywHysydtHaxJcxx.addtime}
   								</td>
   								<td style="background-color:#f5f8fa;">最后修改时间：</td>
   								<td>
   									${thysyywHysydtHaxJcxx.lastupdatetime}
   								</td>
   							</tr>
   							<tr>
   								<td style="background-color:#f5f8fa;">新增用户姓名：</td>
   								<td colspan="3">
   									${thysyywHysydtHaxJcxx.addusername}
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