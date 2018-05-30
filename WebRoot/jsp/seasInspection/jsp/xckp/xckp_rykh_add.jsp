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
		document.myForm.action="<%=basePath%>/patorl/patorl_fetchXckhRykh.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	//新增
	function saveRykh(){
		if(document.getElementById("xm").value ==""){
			alert("巡查人姓名不允许为空！");
			return false;
		}
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

		if(document.getElementById("xcbls").value ==""){
			alert("巡查办理数不允许为空！");
			return false;
		}
		if(document.getElementById("zyx_zy").value ==""){
			alert("重要性-重要不允许为空！");
			return false;
		}
		if(document.getElementById("zyx_yb").value ==""){
			alert("重要性-一般不允许为空！");
			return false;
		}
		if(document.getElementById("zyx_b").value ==""){
			alert("重要性-不重要不允许为空！");
			return false;
		}
		if(document.getElementById("xysj_ks").value ==""){
			alert("响应时间-快速不允许为空！");
			return false;
		}
		if(document.getElementById("xysj_yb").value ==""){
			alert("响应时间-一般不允许为空！");
			return false;
		}
		if(document.getElementById("xysj_b").value ==""){
			alert("响应时间-不及时不允许为空！");
			return false;
		}
		if(document.getElementById("zf").value ==""){
			alert("总分不允许为空！");
			return false;
		}
		
		document.myForm.action="<%=basePath%>/patorl/patorl_addXckhRykh.do";
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
				<li><a href="#">巡查人员考核评价管理</a></li>
			</ul>
		</div>
		
		<div class="formbody">
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/ico02.png" width="20" height="20" />新增</div>
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td style="background-color:#f5f8fa;">巡查类型：</td>
					<td colspan="3">
					<select name="hyxcXckpRykh.xclx" id="xclx" style="width:180px;">
						<option value="堤防">堤防</option>
						<option value="海监">海监</option>
					</select>
					<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">巡查人姓名：</td>
					<td colspan="3">
						<input name="hyxcXckpRykh.xm" id="xm" type="text" value="" style="width:180px;" />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">行政区划：</td>
					<td>
					<select name="xzqhY" id="xzqhY" style="width:180px;">
							<option value="">-请选择-</option>
					</select>
					<input name="hyxcXckpRykh.xzqh" id="xzqh" type="hidden" value=""  />
					<input name="hyxcXckpRykh.xzqhmc" id="xzqhmc" type="hidden" value=""  />
					
					<font color="red">*</font>
					</td>
					<td style="background-color:#f5f8fa;">单位名称：</td>
					<td>
						<input name="hyxcXckpRykh.dwmc" id="dwmc" type="text" value="" style="width:180px;" />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">年份：</td>
					<td>
						<select name="hyxcXckpRykh.year" id="year" style="width:180px;">
							<option value="">-请选择-</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
						</select><font color="red">*</font>
					</td>
					<td style="background-color:#f5f8fa;">月份：</td>
					<td>
						<select name="hyxcXckpRykh.month" id="month" style="width:180px;">
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
					<input name="hyxcXckpRykh.dfbm" id="dfbm" type="text" value="" style="width:180px;" />
					<font color="red">*</font>
					</td>
					<td width="20%" style="background-color:#f5f8fa;">评分 人：</td>
					<td width="30%">
						<input name="hyxcXckpRykh.dfr" id="dfr" type="text" value="" style="width:180px;" />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">评分日期：</td>
					<td colspan="3">
					<input name="hyxcXckpRykh.dfrq" id="dfrq" type="text" value="" onclick="WdatePicker()" readonly="readonly"  style="width:180px;" />
					<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">备注：</td>
					<td colspan="3">
						<textarea name="hyxcXckpRykh.bz" id="hyxcXckpRykh.bz" rows="4" cols="60"></textarea>
					</td>
				</tr>
				<tr>
					<th colspan="4">考核评分</th>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">1.巡查办理数：</td>
					<td colspan="3">
						<input name="hyxcXckpRykh.xcbls" id="xcbls" type="text" value="9" class="NumText" style="width:180px;" />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">2.重要性：</td>
					<td colspan="3">
						重要：
						<input name="hyxcXckpRykh.zyx_zy" id="zyx_zy" type="text" value="9" class="NumText" style="width:180px;" /><font color="red">*</font>
						一般：
						<input name="hyxcXckpRykh.zyx_yb" id="zyx_yb" type="text" value="9" class="NumText" style="width:180px;" /><font color="red">*</font>
						不重要：
						<input name="hyxcXckpRykh.zyx_b" id="zyx_b" type="text" value="9" class="NumText" style="width:180px;" /><font color="red">*</font>
					</td>
				</tr>

				<tr>
					<td style="background-color:#f5f8fa;">3.响应时间：</td>
					<td colspan="3">
						快速：
						<input name="hyxcXckpRykh.xysj_ks" id="xysj_ks" type="text" value="9" class="NumText" style="width:180px;" /><font color="red">*</font>
						一般：
						<input name="hyxcXckpRykh.xysj_yb" id="xysj_yb" type="text" value="9" class="NumText" style="width:180px;" /><font color="red">*</font>
						不及时：
						<input name="hyxcXckpRykh.xysj_b" id="xysj_b" type="text" value="9" class="NumText" style="width:180px;" /><font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">总分：</td>
					<td colspan="3">
						<input name="hyxcXckpRykh.zf" id="zf" type="text" value="90" class="NumText" style="width:180px;" />
						<font color="red">*（满分100）</font>
						
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn" name="xg" onclick="saveRykh()" value="保存" />
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