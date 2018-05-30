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
        	function saveUpdateDctjInfo(){
        		if(document.getElementById("thysyywHysydtHaxDctj.haxid").value ==""){
        			alert("海岸线名称不允许为空！");
        			return false;
        		}
        		document.myForm.action="<%=basePath%>/dgiff/dgiff_saveUpdateDctjInfo.do";
        		document.myForm.target="_self";
        		document.myForm.submit();
        	}
        	function goBack(){
        		document.myForm.action="<%=basePath%>/dgiff/dgiff_dctjListView.do";
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
        			<li><a href="#">海岸线调查统计</a></li>
        		</ul>
        	</div>
        	<div class="formbody">
   			<div class="leftinfo1">
   				<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
   					<table style="width:100%;" class="tablelist2" align="center">
						<tr>
							<td  style="background-color:#f5f8fa;">海岸线名称：</td>
							<td colspan="3">
								${thysyywHysydtHaxDctj.haxname}
							</td>
						</tr>
						<tr>
							<td  style="background-color:#f5f8fa;">海岸线类型：</td>
							<td colspan="3">
								<c:if test ="${thysyywHysydtHaxDctj.haxlx_a!=null}">
									<font>一级：</font>
									${thysyywHysydtHaxDctj.haxlx_a}
								</c:if>
								<c:if test ="${thysyywHysydtHaxDctj.haxlx_b!=null}">
									<font style="padding-right:25px;"></font>
									<font>二级：</font>
									${thysyywHysydtHaxDctj.haxlx_b}
								</c:if>
								<c:if test ="${thysyywHysydtHaxDctj.haxlx_c!=null}">
									<font style="padding-right:25px;"></font>
									<font>三级：</font>
									${thysyywHysydtHaxDctj.haxlx_c}
								</c:if>
							</td>
						</tr>
						<tr>
							<td width="20%" style="background-color:#f5f8fa;">岸段序号：</td>
							<td width="30%">
								${thysyywHysydtHaxDctj.adxh}
							</td>
							<td width="20%" style="background-color:#f5f8fa;">海岸线长度：</td>
							<td width="30%">
								${thysyywHysydtHaxDctj.cd}千米
							</td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">海岸线所在行政区划：</td>
							<td id="xzqhTD">${thysyywHysydtHaxDctj.xzqh}</td>
							<td style="background-color:#f5f8fa;">海岸线位置：</td>
							<td>
								${thysyywHysydtHaxDctj.wz}
							</td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">经度：</td>
							<td>
								${thysyywHysydtHaxDctj.jd}
							</td>
							<td style="background-color:#f5f8fa;">纬度：</td>
							<td>
								${thysyywHysydtHaxDctj.wd}
							</td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">海岸线保有率：</td>
							<td>
								${thysyywHysydtHaxDctj.byl}%
							</td>
							<td style="background-color:#f5f8fa;">海岸线保护类别：</td>
							<td>
								${thysyywHysydtHaxDctj.bhlb}
							</td>
						</tr>
						<tr>	
							<td style="background-color:#f5f8fa;">开发利用现状：</td>
							<td>
								${thysyywHysydtHaxDctj.kflyxz}
							</td>
							<td style="background-color:#f5f8fa;">整治修复情况：</td>
							<td>
								${thysyywHysydtHaxDctj.zzxfqk}
							</td>
						</tr>
						<tr>	
							<td style="background-color:#f5f8fa;">动态变化情况：</td>
							<td colspan="3">
								${thysyywHysydtHaxDctj.dtbhqk}
							</td>							
						</tr>
						<tr>	
							<td style="background-color:#f5f8fa;">调查日期：</td>
							<td>${thysyywHysydtHaxDctj.dcrq }</td>
							<td style="background-color:#f5f8fa;">调查人：</td>
							<td>${thysyywHysydtHaxDctj.dcr }</td>
						</tr>
						<tr>	
							<td style="background-color:#f5f8fa;">备注：</td>
							<td colspan="3">${thysyywHysydtHaxDctj.bz }</td>
						</tr>
						<tr>	
							<td style="background-color:#f5f8fa;">新增用户姓名：</td>
							<td>
								${thysyywHysydtHaxDctj.addusername}
							</td>
							<td style="background-color:#f5f8fa;">新增时间：</td>
							<td>
								${thysyywHysydtHaxDctj.addtime}
							</td>
						</tr>
						<tr>	
							<td style="background-color:#f5f8fa;">最后修改时间：</td>
							<td colspan="3">
								${thysyywHysydtHaxDctj.lastupdatetime}
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