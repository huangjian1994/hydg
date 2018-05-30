<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	//代码
	$(document).ready(function(){
		//var ztY=document.getElementById("ztY").value;
		
		getDictionary("行政区划","xzqhY","");

		$(".NumText").keyup(function(){    
            $(this).val($(this).val().replace(/\D|^0/g,''));
        }).bind("paste",function(){  //CTR+V事件处理    
            $(this).val($(this).val().replace(/\D|^0/g,''));     
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
						$("<option value= '"+d[i].dm+","+d[i].value+"' selected>"+d[i].value+"</option>").appendTo("#"+selectID);
					}else{
						$("<option value= '"+d[i].dm+","+d[i].value+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
					}
				}
			}
		});	  
	}
	//返回
	function goBack(){
		document.myForm.action="<%=basePath%>/patorl/patorl_fetchXckpDwkh.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	//新增
	function saveDwkh(){
		if(document.getElementById("xzqhY").value ==""){
			alert("行政区划不允许为空！");
			return false;
		}else{
			//分割行政区划
			var xzqh=document.getElementById("xzqhY").value;
			var strarray = new Array();
			strarray = xzqh.split(",");
			document.getElementById("xzqhmc").value=strarray[1];
			document.getElementById("xzqh").value=strarray[0];
		}
		
		if(document.getElementById("dwmc").value ==""){
			alert("单位名称不允许为空！");
			return false;
		}
		if(document.getElementById("year").value ==""){
			alert("年份不允许为空！");
			return false;
		}
		if(document.getElementById("month").value ==""){
			alert("月份不允许为空！");
			return false;
		}

		if(document.getElementById("dfbm").value ==""){
			alert("打分部门不允许为空！");
			return false;
		}
		if(document.getElementById("dfr").value ==""){
			alert("打分人不允许为空！");
			return false;
		}
		if(document.getElementById("dfrq").value ==""){
			alert("打分日期不允许为空！");
			return false;
		}

		if(document.getElementById("gljg").value ==""){
			alert("管理机构不允许为空！");
			return false;
		}
		if(document.getElementById("jhgl").value ==""){
			alert("计划管理不允许为空！");
			return false;
		}
		if(document.getElementById("jswm").value ==""){
			alert("精神文明不允许为空！");
			return false;
		}
		if(document.getElementById("zdgl").value ==""){
			alert("制度管理不允许为空！");
			return false;
		}
		if(document.getElementById("dagl").value ==""){
			alert("档案管理不允许为空！");
			return false;
		}
		if(document.getElementById("rcgl").value ==""){
			alert("日常管理不允许为空！");
			return false;
		}
		if(document.getElementById("aqgl").value ==""){
			alert("安全管理不允许为空！");
			return false;
		}
		if(document.getElementById("xxsbl").value ==""){
			alert("信息上报量不允许为空！");
			return false;
		}
		if(document.getElementById("xccs").value ==""){
			alert("巡查次数不允许为空！");
			return false;
		}
		if(document.getElementById("xclj").value ==""){
			alert("巡查路径不允许为空！");
			return false;
		}
		if(document.getElementById("shcp").value ==""){
			alert("社会测评不允许为空！");
			return false;
		}

		document.myForm.action="<%=basePath%>/patorl/patorl_addXckpDwkh.do";
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
				<li><a href="#">巡查考评管理</a></li>
				<li><a href="#">巡查单位考核管理</a></li>
			</ul>
		</div>
		
		<div class="formbody">
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/ico02.png" width="20" height="20" />新增</div>
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td style="background-color:#f5f8fa;">巡查类型：</td>
					<td colspan="3">
					<select name="hyxcXckpDwkh.xclx" id="xclx" style="width:180px;">
						<option value="堤防">堤防</option>
						<option value="海监">海监</option>
					</select>
					<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">行政区划：</td>
					<td>
					<select name="xzqhY" id="xzqhY" style="width:180px;">
							<option value="">-请选择-</option>
					</select>
					<input name="hyxcXckpDwkh.xzqh" id="xzqh" type="hidden" value=""  />
					<input name="hyxcXckpDwkh.xzqhmc" id="xzqhmc" type="hidden" value=""  />
					
					<font color="red">*</font>
					</td>
					<td style="background-color:#f5f8fa;">被考核单位名称：</td>
					<td>
						<input name="hyxcXckpDwkh.dwmc" id="dwmc" type="text" value="" style="width:180px;" />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">考核年份：</td>
					<td>
						<select name="hyxcXckpDwkh.year" id="year" style="width:180px;">
							<option value="">-请选择-</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
						</select><font color="red">*</font>
					</td>
					<td style="background-color:#f5f8fa;">考核月份：</td>
					<td>
						<select name="hyxcXckpDwkh.month" id="month" style="width:180px;">
							<option value="">-请选择-</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select><font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td width="20%" style="background-color:#f5f8fa;">评分部门：</td>
					<td width="30%">
					<input name="hyxcXckpDwkh.dfbm" id="dfbm" type="text" value="" style="width:180px;" />
					<font color="red">*</font>
					</td>
					<td width="20%" style="background-color:#f5f8fa;">评分 人：</td>
					<td width="30%">
						<input name="hyxcXckpDwkh.dfr" id="dfr" type="text" value="" style="width:180px;" />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">评分日期：</td>
					<td colspan="3">
					<input name="hyxcXckpDwkh.dfrq" id="dfrq" type="text" value="" onclick="WdatePicker()" readonly="readonly"  style="width:180px;" />
					<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">备注：</td>
					<td colspan="3">
						<textarea name="hyxcXckpDwkh.bz" id="hyxcXckpDwkh.bz" rows="4" cols="60"></textarea>
					</td>
				</tr>
				
				<tr>
					<th colspan="4">考核评分</th>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">1.管理机构：</td>
					<td>标准：9分</td>
					<td colspan="2">
						<input name="hyxcXckpDwkh.gljg" id="gljg" type="text" value="9" class="NumText" style="width:180px;" />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">2.计划管理：</td>
					<td>标准：9分</td>
					<td colspan="2">
						<input name="hyxcXckpDwkh.jhgl" id="jhgl" type="text" value="9" class="NumText" style="width:180px;" /><font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">3.精神文明：</td>
					<td>标准：9分</td>
					<td colspan="2">
						<input name="hyxcXckpDwkh.jswm" id="jswm" type="text" value="9" class="NumText" style="width:180px;" /><font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">4.制度管理：</td>
					<td>标准：9分</td>
					<td colspan="2">
						<input name="hyxcXckpDwkh.zdgl" id="zdgl" type="text" value="9" class="NumText" style="width:180px;" /><font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">5.档案管理：</td>
					<td>标准：9分</td>
					<td colspan="2">
						<input name="hyxcXckpDwkh.dagl" id="dagl" type="text" value="9" class="NumText" style="width:180px;" /><font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">6.日常管理：</td>
					<td>标准：9分</td>
					<td colspan="2">
						<input name="hyxcXckpDwkh.rcgl" id="rcgl" type="text" value="9" class="NumText" style="width:180px;" /><font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">7.安全管理：</td>
					<td>标准：9分</td>
					<td colspan="2">
						<input name="hyxcXckpDwkh.aqgl" id="aqgl" type="text" value="9" class="NumText" style="width:180px;" /><font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">8.信息上报量：</td>
					<td>标准：9分</td>
					<td colspan="2">
						<input name="hyxcXckpDwkh.xxsbl" id="xxsbl" type="text" value="9" class="NumText" style="width:180px;" /><font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">9.巡查次数：</td>
					<td>标准：9分</td>
					<td colspan="2">
						<input name="hyxcXckpDwkh.xccs" id="xccs" type="text" value="9" class="NumText" style="width:180px;" /><font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">10.巡查路径：</td>
					<td>标准：9分</td>
					<td colspan="2">
						<input name="hyxcXckpDwkh.xclj" id="xclj" type="text" value="9" class="NumText" style="width:180px;" /><font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">11.社会测评：</td>
					<td>标准：10分</td>
					<td colspan="2">
						<input name="hyxcXckpDwkh.shcp" id="shcp" type="text" value="10" class="NumText" style="width:180px;" /><font color="red">*</font>
					</td>
				</tr>
				
				
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn" name="xg" onclick="saveDwkh()" value="新增" />
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