<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${contextPath}/js/My97DatePicker/WdatePicker.js" ></script>
		
<script type="text/javascript">
//代码
$(document).ready(function(){
	var hydbY=document.getElementById("hydbY").value;
	var fzjgjbY=document.getElementById("fzjgjbY").value;

	getDictionary("海域等别","hydb",hydbY);
	getDictionary("发证机关级别","fzjgjb",fzjgjbY);
	getDictionary("用海类型A","yhlxa","");
	getDictionary("用海类型B","yhlxb","");
	getDictionary("用海性质","yhxz","");
	getDictionary("确权方式","qqfs","");
	getDictionary("使用金缴纳方式","syjjnfs","");

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

	function saveZsxx(){
		//校验
	//	if(document.getElementById("hysyywHysydtYhxmZsxx.zsh").value ==""){
	//		alert("证书号不允许为空！");
	//		return false;
	//	}
		var ks = document.getElementById("hysyywHysydtYhxmZsxx.yhqsnx").value;
		var js = document.getElementById("hysyywHysydtYhxmZsxx.yhzznx").value;
		if(document.getElementById("hysyywHysydtYhxmZsxx.yhqsnx").value == "" ){
			alert("用海起始日期不允许为空。");
			return false;
		}
		if(document.getElementById("hysyywHysydtYhxmZsxx.yhzznx").value == "" ){
			alert("用海终止日期不允许为空。");
			return false;
		}
		if(js < ks){
			alert("用海终止日期必须大于用海起始日期");
			return false;
		}
		if(document.getElementById("hysyywHysydtYhxmZsxx.yhnx").value ==""){
			alert("用海年限不允许为空！");
			return false;
		}
		if(document.getElementById("hysyywHysydtYhxmZsxx.zhmj").value ==""){
			alert("宗海面积不允许为空！");
			return false;
		}
		if(document.getElementById("yhlxa").value ==""){
			alert("用海类型A不允许为空！");
			return false;
		}
		
		if(document.getElementById("yhxz").value ==""){
			alert("用海性质不允许为空！");
			return false;
		}
		if(document.getElementById("qqfs").value ==""){
			alert("确权方式不允许为空！");
			return false;
		}
		if(document.getElementById("syjze").value ==""){
			alert("海域使用金总额不允许为空！");
			return false;
		}
		if(document.getElementById("syjjnfs").value ==""){
			alert("海域使用金缴纳方式不允许为空！");
			return false;
		}
		if(document.getElementById("syjzsbzyj").value ==""){
			alert("海域使用金征收标准依据不允许为空！");
			return false;
		}
		if(document.getElementById("syjzsbz").value ==""){
			alert("海域使用金征收标准不允许为空！");
			return false;
		}
		if(document.getElementById("yhwzwzsm").value ==""){
			alert("用海位置文字说明不允许为空！");
			return false;
		}
		if(document.getElementById("spbh").value ==""){
			alert("审批表号或批准合同号不允许为空！");
			return false;
		}

		document.myForm.action="<%=basePath%>/business/business_saveZhxx.do";
		document.myForm.target="rightFrame";
		document.myForm.submit();
	}

	//获取用海类型B
	function getYhlxb(){
		$("option","#yhlxb").remove();
		var yhlxa = document.getElementById("yhlxa").value;
		$.ajax({	  		
				type: "post",
				dataType:"json",
				url: "${contextPath}/business/business_fetchYhlxa.do",
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
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="leftinfo1">
				<div class="itab">
					<ul>
						<li>
							<a href="###" class="selected">证书信息
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</a>
						</li>
						<li><a href="###">用海方式
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</a>
						</li>
						<li><a href="###">海域使用金
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</a>
						</li>
						<li><a href="###">宗海图
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</a>
						</li>
						<li><a href="###">申请材料
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</a>
						</li>
						<li><a href="###">地图定位
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</a>
						</li>
					</ul>
				</div>
			<div id="tab9" class="tabson" >
			<input name="xmID" id="xmID" value="${xmID }" type="hidden" />
			<input name="hysyywHysydtYhxmZsxx.xmid" id="hysyywHysydtYhxmZsxx.xmid" value="${xmID }" type="hidden" />
				<table class="tablelist2" width="100%">
					<tr>
						<th colspan="4">项目基本信息</th>
					</tr>
					
					<c:forEach items="${ yhxmList }" var="r" varStatus="j">
					<tr>
						<td style="background-color:#f5f8fa;">用海项目名称：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.yhxmmc" id="hysyywHysydtYhxmZsxx.yhxmmc" type="text" value="${r[0] }"  style="width:180px;"/>
						</td>
						<td style="background-color:#f5f8fa;">海域使用权人：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.hysyqr" id="hysyywHysydtYhxmZsxx.hysyqr" type="text" value="${r[1] }"  style="width:180px;"/>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">用海面积：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.yhmj" id="hysyywHysydtYhxmZsxx.yhmj" type="text" value="${r[2] }" class="NumDecText"  style="width:180px;"/>
							公顷
						</td>
						<td style="background-color:#f5f8fa;">海域等别：</td>
						<td>
							<select name="hysyywHysydtYhxmZsxx.hydb" id="hydb" style="width:200px;">
								<option value="">-请选择-</option>
							</select>
							<input name="hydbY" id="hydbY" type="hidden" value="${r[3] }"  style="width:180px;"/>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">法定代表人：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.fddbr" id="hysyywHysydtYhxmZsxx.fddbr" type="text" value="${r[4] }"  style="width:180px;"/>
						</td>
						<td style="background-color:#f5f8fa;">通讯地址：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.txdz" id="hysyywHysydtYhxmZsxx.txdz" type="text" value="${r[5] }"  style="width:180px;"/>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">发证机关：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.fzjg" id="hysyywHysydtYhxmZsxx.fzjg" type="text" value="${r[6] }"  style="width:180px;"/>
						</td>
						<td style="background-color:#f5f8fa;">发证机关级别：</td>
						<td>
							<select name="hysyywHysydtYhxmZsxx.fzjgjb" id="fzjgjb" style="width:200px;">
								<option value="">-请选择-</option>
							</select>
							<input name="fzjgjbY" id="fzjgjbY" type="hidden" value="${r[7] }"  style="width:180px;"/>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">项目其他相关批准文件和材料：</td>
						<td colspan="3">
							<textarea name="hysyywHysydtYhxmZsxx.wjcl" id="hysyywHysydtYhxmZsxx.wjcl" cols="60" rows="4">${r[8] }</textarea>
						</td>
					</tr>
					</c:forEach>
					<tr>
						<th colspan="4">登记信息</th>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">登记编号：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.djbh" id="hysyywHysydtYhxmZsxx.djbh" type="text" value="${hysyywHysydtYhxmZsxx.djbh }"  style="width:180px;"/>
						</td>
						<td style="background-color:#f5f8fa;">初始登记日期：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.csdjrq" id="hysyywHysydtYhxmZsxx.csdjrq" type="text" value="${hysyywHysydtYhxmZsxx.csdjrq }" readonly="readonly" onclick="WdatePicker()" style="width:180px;"/>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">登记人：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.djr" id="hysyywHysydtYhxmZsxx.djr" type="text" value="${hysyywHysydtYhxmZsxx.djr }"  style="width:180px;"/>
						</td>
						<td style="background-color:#f5f8fa;">审核人：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.shrxm" id="hysyywHysydtYhxmZsxx.shrxm" type="text" value="${hysyywHysydtYhxmZsxx.shrxm }"  style="width:180px;"/>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">不动产权证书编号：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.bdcqzsbh" id="hysyywHysydtYhxmZsxx.bdcqzsbh" type="text" value="${hysyywHysydtYhxmZsxx.bdcqzsbh }"  style="width:180px;"/>
						</td>
						<td style="background-color:#f5f8fa;">不动产单元号：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.bdcdyh" id="hysyywHysydtYhxmZsxx.bdcdyh" type="text" value="${hysyywHysydtYhxmZsxx.bdcdyh }"  style="width:180px;"/>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">不动产权证书发证日期：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.bdcqzsfzrq" id="hysyywHysydtYhxmZsxx.bdcqzsfzrq" type="text" value="${hysyywHysydtYhxmZsxx.bdcqzsfzrq }" readonly="readonly" onclick="WdatePicker()" style="width:180px;"/>
						</td>
						<td style="background-color:#f5f8fa;">登记类型：</td>
						<td >
							<input name="hysyywHysydtYhxmZsxx.djlx" id="djlx1" type="radio" value="不动产登记" />不动产登记&nbsp;
							<input name="hysyywHysydtYhxmZsxx.djlx" id="djlx2" type="radio" value="海域登记" checked="checked" />海域登记
							<font color="red">*</font>
						</td>
					</tr>
					
					
					<tr>
						<th colspan="4">宗海信息</th>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">用海起始日期：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.yhqsnx" id="hysyywHysydtYhxmZsxx.yhqsnx" readonly="readonly" onclick="WdatePicker()" type="text" value="${hysyywHysydtYhxmZsxx.yhqsnx }"  style="width:180px;"/>
							<font color="red">*</font>
						</td>
						<td style="background-color:#f5f8fa;">用海终止日期：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.yhzznx" id="hysyywHysydtYhxmZsxx.yhzznx" readonly="readonly" onclick="WdatePicker()" type="text" value="${hysyywHysydtYhxmZsxx.yhzznx }"  style="width:180px;"/>
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">用海年限：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.yhnx" id="hysyywHysydtYhxmZsxx.yhnx" class="NumDecText" type="text" value="${hysyywHysydtYhxmZsxx.yhnx }"  style="width:180px;"/>
							<font color="red">*</font>
						</td>
						<td style="background-color:#f5f8fa;">宗海面积：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.zhmj" id="hysyywHysydtYhxmZsxx.zhmj" class="NumDecText" type="text" value="${hysyywHysydtYhxmZsxx.zhmj }"  style="width:180px;"/>
							公顷<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td width="18%" style="background-color:#f5f8fa;">用海类型A：</td>
						<td width="25%">
							<select name="hysyywHysydtYhxmZsxx.yhlxa" id="yhlxa" style="width:180px;" onchange="getYhlxb()">
								<option value="">--请选择--</option>
							</select><font color="red">*</font>
							<input name="yhlxaY" id="yhlxaY" type="hidden" value="${hysyywHysydtYhxmZsxx.yhlxa }"  />
						</td>
						<td width="18%" style="background-color:#f5f8fa;">用海类型B：</td>
						<td width="25%">
							<select name="hysyywHysydtYhxmZsxx.yhlxb" id="yhlxb" style="width:180px;">
								<option value="">--请选择--</option>
							</select>
							<input name="yhlxbY" id="yhlxbY" type="hidden" value="${hysyywHysydtYhxmZsxx.yhlxb }"  />
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">用海性质：</td>
						<td>
							<select name="hysyywHysydtYhxmZsxx.yhxz" id="yhxz" style="width:180px;">
								<option value="">--请选择--</option>
							</select><font color="red">*</font>
							<input name="yhxzY" id="yhxzY" type="hidden" value="${hysyywHysydtYhxmZsxx.yhxz }"  />
						</td>
						<td style="background-color:#f5f8fa;">确权方式：</td>
						<td>
							<select name="hysyywHysydtYhxmZsxx.qqfs" id="qqfs" style="width:180px;">
								<option value="">--请选择--</option>
							</select><font color="red">*</font>
							<input name="qqfsY" id="qqfsY" type="hidden" value="${hysyywHysydtYhxmZsxx.qqfs }"  />
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海域使用金征收标准依据：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.syjzsbzyj" id="syjzsbzyj" type="text" value="上海市海域使用金征收管理办法"  style="width:180px;"/>
							<font color="red">*</font>
						</td>
						<td style="background-color:#f5f8fa;">用海设施和构筑物：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.yhssgzw" id="hysyywHysydtYhxmZsxx.yhssgzw" type="text" value="${hysyywHysydtYhxmZsxx.yhssgzw }"  style="width:180px;"/>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海域使用金总额：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.syjze" id="syjze" class="NumDecText" type="text" value="${hysyywHysydtYhxmZsxx.syjze }"  style="width:180px;"/>
							元<font color="red">*</font>
						</td>
						<td style="background-color:#f5f8fa;">海域使用金缴纳方式：</td>
						<td>
							<select name="hysyywHysydtYhxmZsxx.syjjnfs" id="syjjnfs" style="width:180px;">
								<option value="">--请选择--</option>
							</select>
							<input name="syjjnfsY" id="syjjnfsY" type="hidden" value="${hysyywHysydtYhxmZsxx.syjjnfs }"  style="width:180px;"/>
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">所属海域：</td>
						<td colspan="3">
							<input name="hysyywHysydtYhxmZsxx.sshy" id="hysyywHysydtYhxmZsxx.sshy" type="text" value="${hysyywHysydtYhxmZsxx.sshy }"  style="width:180px;"/>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海域使用金征收标准：</td>
						<td colspan="3">
							<textarea name="hysyywHysydtYhxmZsxx.syjzsbz" id="syjzsbz" cols="60" rows="4">${hysyywHysydtYhxmZsxx.syjzsbz }</textarea>
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">用海位置文字说明：</td>
						<td colspan="3">
							<textarea name="hysyywHysydtYhxmZsxx.yhwzwzsm" id="yhwzwzsm" cols="60" rows="4">${hysyywHysydtYhxmZsxx.yhwzwzsm }</textarea>
							<font color="red">*</font>
						</td>
					</tr>
					
					<tr>
						<th colspan="4">海籍管理文书图件</th>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海籍调查表号：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.hjdcbh" id="hysyywHysydtYhxmZsxx.hjdcbh" type="text" value="${hysyywHysydtYhxmZsxx.hjdcbh }" style="width:180px;" />
						</td>
						<td style="background-color:#f5f8fa;">审批表号或批准合同号：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.spbh" id="spbh" type="text" value="${hysyywHysydtYhxmZsxx.spbh }" style="width:180px;" />
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海籍编号：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.hjbh" id="hysyywHysydtYhxmZsxx.hjbh" type="text" value="${hysyywHysydtYhxmZsxx.hjbh }" style="width:180px;" />
						</td>
						<td style="background-color:#f5f8fa;">海籍图号：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.hjth" id="hysyywHysydtYhxmZsxx.hjth" type="text" value="${hysyywHysydtYhxmZsxx.hjth }" style="width:180px;" />
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海域管理号：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.hyglh" id="hysyywHysydtYhxmZsxx.hyglh" type="text" value="${hysyywHysydtYhxmZsxx.hyglh }" style="width:180px;" />
						</td>
						<td style="background-color:#f5f8fa;">发证日期：</td>
						<td>
							<input name="hysyywHysydtYhxmZsxx.fzrq" id="hysyywHysydtYhxmZsxx.fzrq" type="text" value="${hysyywHysydtYhxmZsxx.fzrq }" readonly="readonly" onclick="WdatePicker()" style="width:180px;" />
						</td>
					</tr>
					<tr>
						<th colspan="4">备注</th>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">备注：</td>
						<td colspan="3">
							<textarea name="hysyywHysydtYhxmZsxx.bz" id="hysyywHysydtYhxmZsxx.bz" cols="60" rows="4">${hysyywHysydtYhxmZsxx.bz }</textarea></td>
					</tr>
					<tr>
						<th colspan="4">重叠信息</th>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">重叠信息：</td>
						<td colspan="3">
							<textarea name="hysyywHysydtYhxmZsxx.cdxx" id="hysyywHysydtYhxmZsxx.cdxx" cols="60" rows="4">${hysyywHysydtYhxmZsxx.cdxx }</textarea></td>
					</tr>
					<tr>
						<td colspan="4" style="text-align:center;">
							<input name="bc" type="button" class="scbtn" onclick="saveZsxx()" value="保存" />
							<input name="cz" type="reset" class="scbtn"  value="重置" />							
						</td>
					</tr>
				</table>
			</div>

			

		</div>
		</div>
	</div>


		

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

</form>
</body>
</html>