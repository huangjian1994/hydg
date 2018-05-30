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
        	//代码
        	$(document).ready(function(){
        		var xzqhY=document.getElementById("xzqhY").value;        
        		getDictionary("行政区划","xzqh",xzqhY);        
        		/*JQuery 限制文本框只能输入数字*/
        		$(".NumText").keyup(function(){    
	                $(this).val($(this).val().replace(/\D|^0/g,''));
	            }).bind("paste",function(){  //CTR+V事件处理    
	                $(this).val($(this).val().replace(/\D|^0/g,''));     
	            }).css("ime-mode", "disabled"); //CSS设置输入法不可用
        		/*JQuery 限制文本框只能输入数字和小数点*/
        		$(".NumDecText").keyup(function(){    
	                $(this).val($(this).val().replace(/[^0-9.]/g,''));    
                }).bind("paste",function(){  //CTR+V事件处理    
                    $(this).val($(this).val().replace(/[^0-9.]/g,''));     
                }).css("ime-mode", "disabled"); //CSS设置输入法不可用 
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
        	function saveUpdateHaxInfo(){
        		if(document.getElementById("thysyywHysydtHaxJcxx.name").value ==""){
        			alert("海岸线名称不允许为空！");
        			return false;
        		}
        		document.myForm.action="<%=basePath%>/dgiff/dgiff_saveUpdateHaxInfo.do";
        		document.myForm.target="_self";
        		document.myForm.submit();
        	}
        	function goBack(){
        		document.myForm.action="<%=basePath%>/dgiff/dgiff_haxjcxxInfo.do";
        		document.myForm.target="_self";
        		document.myForm.submit();
        	}
        	//二级联动
        	function yjChange(){
        		var a=document.getElementById("haxlx_a").value;
        		if(a=='自然岸线'){
        			document.getElementById("haxlx_b").style.display="";
        			document.getElementById("yj").style.display="";
        			document.getElementById("ej").style.display="";
        		}else{
        			document.getElementById("haxlx_b").style.display="none";
        			document.getElementById("yj").style.display="none";
        			document.getElementById("ej").style.display="none";
        			document.getElementById("haxlx_c").style.display="none";
        			document.getElementById("sj").style.display="none";
        			document.getElementById("haxlx_b").value="";
        			document.getElementById("haxlx_c").value="";
        		}
        	}
        	//三级联动
        	function ejChange(){
        		var b=document.getElementById("haxlx_b").value;
        		if(b=='具有自然岸滩形态特征和生物功能的海岸线'){
        			document.getElementById("haxlx_c").style.display="";
        			document.getElementById("sj").style.display="";
        		}else{
        			document.getElementById("haxlx_c").style.display="none";
        			document.getElementById("sj").style.display="none";
        			document.getElementById("haxlx_c").value="";
        		}
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
        	<input name="thysyywHysydtHaxJcxx.id" id="thysyywHysydtHaxJcxx.id" value="${thysyywHysydtHaxJcxx.id}" type="hidden"/>
        	<input name="thysyywHysydtHaxJcxx.addtime" id="thysyywHysydtHaxJcxx.addtime" value="${thysyywHysydtHaxJcxx.addtime}" type="hidden"/>
        	<div class="formbody">
     			<div class="leftinfo1">
       				<div class="listtitle"><img src="${contextPath}/images/ticon.png" width="20" height="20" />修改</div>
   					<table style="width:100%;" class="tablelist2" align="center">
   							<tr>
   								<td  style="background-color:#f5f8fa;">海岸线名称：</td>
   								<td colspan="3">
   									<input name="thysyywHysydtHaxJcxx.name" id="thysyywHysydtHaxJcxx.name" type="text" value="${thysyywHysydtHaxJcxx.name}" style="width:200px;" />
   									<font color="red">*</font>
   								</td>
   							</tr>
   							<tr>
   								<td  style="background-color:#f5f8fa;">岸段序号：</td>
   								<td>
   									<input name="thysyywHysydtHaxJcxx.adxh" id="thysyywHysydtHaxJcxx.adxh" type="text" value="${thysyywHysydtHaxJcxx.adxh}" style="width:200px;" />
   								</td>
   								<td  style="background-color:#f5f8fa;">海岸线长度：</td>
   								<td>
   									<input name="thysyywHysydtHaxJcxx.cd" id="thysyywHysydtHaxJcxx.cd" type="text" value="${thysyywHysydtHaxJcxx.cd}"  class="NumDecText" style="width:200px;" />
   									千米
   								</td>
   							</tr>
   							<tr>
   								<td style="background-color:#f5f8fa;">海岸线类型：</td>
   								<td colspan="3">
   									<font id="yj">一级：</font>
   									<select name="thysyywHysydtHaxJcxx.haxlx_a" id="haxlx_a" onchange="yjChange()" >
   										<option value="">请选择</option>
   										<c:forEach items="${dicList}" var="r" varStatus="j">
   											<option <c:if test="${thysyywHysydtHaxJcxx.haxlx_a==r[1] }">selected="selected"</c:if> value="${r[1]}">${r[1]}</option>
   										</c:forEach>
   									</select>
   									<font style="padding-right:5px;"></font>
   									<font id="ej">二级：</font>
   									<select name="thysyywHysydtHaxJcxx.haxlx_b" id="haxlx_b" onchange="ejChange()">
   										<option value="">请选择</option>
   										<c:forEach items="${dicList2}" var="r" varStatus="j">
   											<option <c:if test="${thysyywHysydtHaxJcxx.haxlx_b==r[1] }">selected="selected"</c:if> value="${r[1]}">${r[1]}</option>
   										</c:forEach>
   									</select>
   									<font style="padding-right:5px;"></font>
   									<font id="sj">三级：</font>
   									<select name="thysyywHysydtHaxJcxx.haxlx_c" id="haxlx_c" style="">
   										<option value="">请选择</option>
   										<c:forEach items="${dicList3}" var="r" varStatus="j">
   											<option <c:if test="${thysyywHysydtHaxJcxx.haxlx_c==r[1] }">selected="selected"</c:if> value="${r[1]}">${r[1]}</option>
   										</c:forEach>
   									</select>
   								</td>
   							</tr>
   							<tr>
   								<td width="22%"  style="background-color:#f5f8fa;">海岸线所在行政区划：</td>
   								<td width="28%">
   									<select name="thysyywHysydtHaxJcxx.xzqh" id="xzqh" style="width:200px;">
   										<option value="">请选择</option>
   									</select>
   									<input name="xzqhY" id="xzqhY" type="hidden" value="${thysyywHysydtHaxJcxx.xzqh}" style="width:200px;" />
   								</td>
   								<td width="20%"  style="background-color:#f5f8fa;">海岸线位置：</td>
   								<td width="30%">
   									<input name="thysyywHysydtHaxJcxx.wz" id="thysyywHysydtHaxJcxx.wz" type="text" value="${thysyywHysydtHaxJcxx.wz}" style="width:200px;" />
   								</td>
   							</tr>
   							<tr>
   								<td style="background-color:#f5f8fa;">端点坐标经度：</td>
   								<td>
   									<input name="thysyywHysydtHaxJcxx.jd" id="thysyywHysydtHaxJcxx.jd" type="text" value="${thysyywHysydtHaxJcxx.jd}" style="width:200px;" />
   								</td>
   								<td style="background-color:#f5f8fa;">端点坐标纬度：</td>
   								<td>
   									<input name="thysyywHysydtHaxJcxx.wd" id="thysyywHysydtHaxJcxx.wd" type="text" value="${thysyywHysydtHaxJcxx.wd}" style="width:200px;" />
   								</td>
   							</tr>
   							<tr>
   								<td style="background-color:#f5f8fa;">备注：</td>
   								<td colspan="3">
   									<textarea name="thysyywHysydtHaxJcxx.bz" id="thysyywHysydtHaxJcxx.bz" rows="3" cols="80" >${thysyywHysydtHaxJcxx.bz}</textarea>
   								</td>
   							</tr>
   							<tr>
   								<td colspan="4" style="text-align:center;">
   									<input name="save" type="button" class="scbtn" onclick="saveUpdateHaxInfo()" value="保存"/>
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