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
        	$(document).ready(function(){
        		getDictionary("海岸线修复情况","xfqk","");
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
        	//返回
        	function goBack(){
        		document.myForm.action="<%=basePath%>/dgiff/dgiff_fetchHaxZzxfList.do";
        		document.myForm.target="_self";
        		document.myForm.submit();
        	}
        	//保存
        	function saveZzxf(){
        		if(document.getElementById("haxid").value ==""){
        			alert("海岸线名称不允许为空！");
        			return false;
        		}
        		if(document.getElementById("adxh").value ==""){
        			alert("岸段序号不允许为空！");
        			return false;
        		}
        		if(document.getElementById("xfsj").value ==""){
        			alert("修复时间不允许为空！");
        			return false;
        		}
        		if(document.getElementById("xfqk").value ==""){
        			alert("修复情况不允许为空！");
        			return false;
        		}
        		document.myForm.action="<%=basePath%>/dgiff/dgiff_addHaxZzxf.do";
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
          			<div class="listtitle"><img src="${contextPath}/images/ico02.png" width="20" height="20" />新增</div>
       				<table style="width:100%;" class="tablelist2" align="center">
        				<tr>
        					<td style="background-color:#f5f8fa;" title="若找不到海岸线名称，请先在《海岸线基础信息管理》中新增海岸线。">海岸线名称：</td>
        					<td colspan="3" title="若找不到海岸线名称，请先在《海岸线基础信息管理》中新增海岸线。">
        						<select name="hysyywHysydtHaxZzxf.haxid" id="haxid" style="width:200px;">
        							<option value="">请选择</option>
        							<c:forEach items="${thysyywHysydtHaxJcxxList}" var="r" varStatus="j">
        								<option value="${r.id}">${r.name}</option>
        							</c:forEach>
        						</select><font color="red">*</font>
        					</td>
        				</tr>
        				<tr>
        					<td style="background-color:#f5f8fa;" >岸段序号：</td>
        					<td colspan="3" >
        						<input name="hysyywHysydtHaxZzxf.adxh" id="adxh" type="text" value="" style="width:200px;" />
        						<font color="red">*</font>
        					</td>
        				</tr>
        				<tr>
        					<td width="23%" style="background-color:#f5f8fa;">是否沙滩修复养护：</td>
        					<td width="22%">
        						<input style="border:0;" name="hysyywHysydtHaxZzxf.sfstxfyh" type="radio" value="是" checked="checked"/>是
        						<input style="border:0;" name="hysyywHysydtHaxZzxf.sfstxfyh" type="radio" value="否"/>否
        					</td>
        					<td width="20%" style="background-color:#f5f8fa;">沙滩修复养护：</td>
        					<td width="30%" >
        						<textarea name="hysyywHysydtHaxZzxf.stxfyhqk" id="stxfyhqk" rows="3" cols="35"></textarea>
        					</td>
        				</tr>
        				<tr>
        					<td style="background-color:#f5f8fa;">是否近岸构筑物清理：</td>
        					<td>
        						<input style="border:0;" name="hysyywHysydtHaxZzxf.sfjagzwql" type="radio" value="是" checked="checked"/>是
        						<input style="border:0;" name="hysyywHysydtHaxZzxf.sfjagzwql" type="radio" value="否"/>否
        					</td>
        					<td style="background-color:#f5f8fa;">近岸构筑物清理：</td>
        					<td>
        						<textarea name="hysyywHysydtHaxZzxf.jagzwqlqk" id="jagzwqlqk" rows="3" cols="35"></textarea>
        					</td>
        				</tr>
        				<tr>
        					<td style="background-color:#f5f8fa;">是否清淤疏浚整治：</td>
        					<td>
        						<input style="border:0;" name="hysyywHysydtHaxZzxf.sfqysjzz" type="radio" value="是" checked="checked"/>是
        						<input style="border:0;" name="hysyywHysydtHaxZzxf.sfqysjzz" type="radio" value="否"/>否
        					</td>
        					<td style="background-color:#f5f8fa;">清淤疏浚整治：</td>
        					<td>
        						<textarea name="hysyywHysydtHaxZzxf.qysjzzqk" id="qysjzzqk" rows="3" cols="35"></textarea>
        					</td>
        				</tr>
        				<tr>
        					<td style="background-color:#f5f8fa;">是否滨海湿地植被种植与恢复：</td>
        					<td>
        						<input style="border:0;" name="hysyywHysydtHaxZzxf.sfzzhf" type="radio" value="是" checked="checked"/>是
        						<input style="border:0;" name="hysyywHysydtHaxZzxf.sfzzhf" type="radio" value="否"/>否
        					</td>
        					<td style="background-color:#f5f8fa;">滨海湿地植被种植与恢复：</td>
        					<td>
        						<textarea name="hysyywHysydtHaxZzxf.zzhfqk" id="zzhfqk" rows="3" cols="35"></textarea>
        					</td>
        				</tr>
        				<tr>
        					<td style="background-color:#f5f8fa;">是否海岸生态廊道建设：</td>
        					<td>
        						<input style="border:0;" name="hysyywHysydtHaxZzxf.sfstldjs" type="radio" value="是" checked="checked"/>是
        						<input style="border:0;" name="hysyywHysydtHaxZzxf.sfstldjs" type="radio" value="否"/>否
        					</td>
        					<td style="background-color:#f5f8fa;">海岸生态廊道建设：</td>
        					<td>
        						<textarea name="hysyywHysydtHaxZzxf.stldjsqk" id="stldjsqk" rows="3" cols="35"></textarea>
        					</td>
        				</tr>        				
        				<tr>	
        					<td style="background-color:#f5f8fa;">修复时间：</td>
        					<td>
        						<input name="hysyywHysydtHaxZzxf.xfsj" id="xfsj" onclick="WdatePicker()" readonly="readonly" type="text" value="" style="width:160px;" />
        						<font color="red">*</font>
        					</td>
        					<td style="background-color:#f5f8fa;">修复情况：</td>
        					<td>
        						<select name="hysyywHysydtHaxZzxf.xfqk" id="xfqk" style="width:200px;">
        							<option value="">-请选择-</option>
        						</select>
        						<font color="red">*</font>
        					</td>
        				</tr>
        				<tr>	
        					<td style="background-color:#f5f8fa;">备注：</td>
        					<td colspan="3">
        						<textarea name="hysyywHysydtHaxZzxf.bz" id="hysyywHysydtHaxZzxf.bz" rows="3" cols="70" ></textarea>
        					</td>
        				</tr>
        				<tr>
        					<td colspan="4" style="text-align:center;">
        						<input name="save" type="button" class="scbtn" onclick="saveZzxf()" value="保存"/>
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