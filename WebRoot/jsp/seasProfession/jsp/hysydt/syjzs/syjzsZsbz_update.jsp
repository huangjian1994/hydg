<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		
<script type="text/javascript">
//代码
$(document).ready(function(){
	var yhlxaY=document.getElementById("yhlxaY").value;
	var yhlxbY=document.getElementById("yhlxbY").value;
	//var hydbY=document.getElementById("hydbY").value;
	var zsfsY=document.getElementById("zsfsY").value;

	getDictionary("使用金征收标准用海类别A","yhlxa",yhlxaY);
	getDictionary("使用金征收标准用海类别B","yhlxb",yhlxbY);
	//getDictionary("海域等别","hydb",hydbY);
	getDictionary("征收方式","zsfs",zsfsY);

	
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

//保存
function saveZsbz(){
	
	if(document.getElementById("yhlxa").value ==""){
		alert("用海类别A不允许为空！");
		return false;
	}
	if(document.getElementById("yhlxb").value ==""){
		alert("用海类别B不允许为空！");
		return false;
	}
	var hydb1=document.getElementById("hydb1").value;
	var hydb2=document.getElementById("hydb2").value;
	var hydb3=document.getElementById("hydb3").value;
	var hydb4=document.getElementById("hydb4").value;
	var hydb5=document.getElementById("hydb5").value;
	var hydb6=document.getElementById("hydb6").value;
	var yz=document.getElementById("yz").value;
	if(hydb1=="" && hydb2=="" && hydb3=="" && hydb4=="" && hydb5=="" && hydb6==""){
		if(yz == ""){
			alert("无具体标准不允许为空！");
			return false;
		}
	}
	if(hydb1!="" || hydb2!="" || hydb3!="" || hydb4!="" || hydb5!="" || hydb6!=""){
		if(yz != ""){
			alert("无具体标准必须为空！");
			return false;
		}
	}
	
	if(document.getElementById("zsfs").value ==""){
		alert("征收方式不允许为空！");
		return false;
	}
	
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_updateZsbz.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

//返回
function goBack(){
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchHysyjZsbz.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//获取用海类型B
function getYhlxb(){
	$("option","#yhlxb").remove();
	var yhlxa = document.getElementById("yhlxa").value;
	$.ajax({	  		
			type: "post",
			dataType:"json",
			url: "${contextPath}/business/business_fetchZsbzYhlxa.do",
			data: "dictionary.key="+yhlxa+"&yhlxa="+yhlxa,
			success: function(d){
				$("<option value= ''>"+"-请选择-"+"</option>").appendTo("#yhlxb");
				//alert(d.length);
				if(d.length>1){
				for(var i=0;i<d.length;i++){
					$("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#yhlxb");
				}
				}
			}
		});
}
</script>
	</head>

	<body>
<form name="myForm" method="post" >

	<div class="place">
		<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">海域使用动态管理</a></li>
			<li>
				<a href="#">海域使用金征收管理</a>
			</li>
			<li>
				<a href="#">海域使用金征收标准</a>
			</li>
		</ul>
	</div>
	<div class="formbody" >
		<input name="zsbh" id="zsbh" type="hidden" value="" />

			<table width="100%" align="center" style="text-align:left;" class="tablelist2" >
				<tr>
					<th colspan="2" style="text-align:left;">
						<img src="${contextPath}/images/ticon.png" width="20" height="20" />修改
					</th>
				</tr>
				<tr>
					<td width="30%" style="background-color:#f5f8fa;">用海类别A：</td>
					<td width="70%">
					<select name="hysyywHysydtYhxmHysyjZsbz.yhlxa" id="yhlxa" onchange="getYhlxb()" style="width:180px;">
						<option value="">-请选择-</option>
					</select><font color="red">*</font>
					<input name="yhlxaY" id="yhlxaY" type="hidden" value="${hysyywHysydtYhxmHysyjZsbz.yhlxa }" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">用海类别B：</td>
					<td>
					<select name="hysyywHysydtYhxmHysyjZsbz.yhlxb" id="yhlxb" style="width:180px;">
						<option value="">-请选择-</option>
					</select><font color="red">*</font>
					<input name="yhlxbY" id="yhlxbY" type="hidden" value="${hysyywHysydtYhxmHysyjZsbz.yhlxb }" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域等别一等：</td>
					<td>
						<input name="hysyywHysydtYhxmHysyjZsbz.hydb1" id="hydb1" type="text" value="${hysyywHysydtYhxmHysyjZsbz.hydb1 }" class="NumDecText" style="width:180px;" />
						万元/公顷
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域等别二等：</td>
					<td>
						<input name="hysyywHysydtYhxmHysyjZsbz.hydb2" id="hydb2" type="text" value="${hysyywHysydtYhxmHysyjZsbz.hydb2 }" class="NumDecText" style="width:180px;" />
						万元/公顷
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域等别三等：</td>
					<td>
						<input name="hysyywHysydtYhxmHysyjZsbz.hydb3" id="hydb3" type="text" value="${hysyywHysydtYhxmHysyjZsbz.hydb3 }" class="NumDecText" style="width:180px;" />
						万元/公顷
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域等别四等：</td>
					<td>
						<input name="hysyywHysydtYhxmHysyjZsbz.hydb4" id="hydb4" type="text" value="${hysyywHysydtYhxmHysyjZsbz.hydb4 }" class="NumDecText" style="width:180px;" />
						万元/公顷
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域等别五等：</td>
					<td>
						<input name="hysyywHysydtYhxmHysyjZsbz.hydb5" id="hydb5" type="text" value="${hysyywHysydtYhxmHysyjZsbz.hydb5 }" class="NumDecText" style="width:180px;" />
						万元/公顷
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域等别六等：</td>
					<td>
						<input name="hysyywHysydtYhxmHysyjZsbz.hydb6" id="hydb6" type="text" value="${hysyywHysydtYhxmHysyjZsbz.hydb6 }" class="NumDecText" style="width:180px;" />
						万元/公顷
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">无具体标准：</td>
					<td>
						<input name="hysyywHysydtYhxmHysyjZsbz.yz" id="yz" type="text" value="${hysyywHysydtYhxmHysyjZsbz.yz }"  style="width:300px;" />
						如：具体征收标准暂由各省（自治区、直辖市）制定
					</td>
				</tr>
				<!-- 
				<tr>
					<td style="background-color:#f5f8fa;">海域等别：</td>
					<td>
					<select name="hysyywHysydtYhxmHysyjZsbz.hydb" id="hydb" style="width:180px;">
						<option value="">-请选择-</option>
					</select><font color="red">*</font>
					<input name="hydbY" id="hydbY" type="hidden" value="${hysyywHysydtYhxmHysyjZsbz.hydb }" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">征收标准：</td>
					<td>
						<input name="hysyywHysydtYhxmHysyjZsbz.zsbz" id="zsbz" type="text" value="${hysyywHysydtYhxmHysyjZsbz.zsbz }" class="NumDecText" style="width:180px;height:20px;" />
						万元/公顷<font color="red">*</font>
						<input name="hysyywHysydtYhxmHysyjZsbz.dw" id="dw" type="hidden" value="万元/公顷" />
					</td>
				</tr>
				 -->
				<tr>
					<td style="background-color:#f5f8fa;">征收方式：</td>
					<td>
						<select name="hysyywHysydtYhxmHysyjZsbz.zsfs" id="zsfs" style="width:180px;height:25px;">
							<option value="">-请选择-</option>
							
						</select><font color="red">*</font>
						<input name="zsfsY" id="zsfsY" type="hidden" value="${hysyywHysydtYhxmHysyjZsbz.zsfs }" />
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="saveZsbz()" value="保存" />
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack()" />
						<input name="hysyywHysydtYhxmHysyjZsbz.id" id="hysyywHysydtYhxmHysyjZsbz.id" value="${hysyywHysydtYhxmHysyjZsbz.id }" type="hidden" />
						<input name="hysyywHysydtYhxmHysyjZsbz.addtime" id="hysyywHysydtYhxmHysyjZsbz.addtime" value="${hysyywHysydtYhxmHysyjZsbz.addtime }" type="hidden" />
						<input name="hysyywHysydtYhxmHysyjZsbz.addusername" id="hysyywHysydtYhxmHysyjZsbz.addusername" value="${hysyywHysydtYhxmHysyjZsbz.addusername }" type="hidden" />
						<input name="hysyywHysydtYhxmHysyjZsbz.adduserid" id="hysyywHysydtYhxmHysyjZsbz.adduserid" value="${hysyywHysydtYhxmHysyjZsbz.adduserid }" type="hidden" />
						
					</td>	
				</tr>
			</table>
	
	</div>
</form>
<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
		

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		

	</body>

</html>