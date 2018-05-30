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
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_fetchHjfa2.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	//保存
	function addHjfa(){
		if(document.getElementById("hysyywHygnqhHykjHjfa.wjm").value ==""){
			alert("文件名称不允许为空！");
			return false;
		}
		if(document.getElementById("wjlx").value ==""){
			alert("文件类型不允许为空！");
			return false;
		}
		//校验
		var filename=document.myForm.upload.value;
		if(filename==""){
			alert("请先上传文件！");
			return false;
		}
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_saveHjfa.do";
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
				<li><a href="#">海域勘界管理</a></li>
				<li><a href="#">划界方案综合分析</a></li>
			</ul>
		</div>
		
		<div class="formbody">
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/ico02.png" width="20" height="20" />新增</div>
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#f5f8fa;">海域界线材料文件名：</td>
					<td colspan="3">
					<input name="hysyywHygnqhHykjHjfa.wjm" id="hysyywHygnqhHykjHjfa.wjm" type="text" value="${hysyywHygnqhHykjDmtxx.wjm }" style="width:180px;" />
					<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域界线材料文件类型：</td>
					<td colspan="3">
						<select name="hysyywHygnqhHykjHjfa.wjlx" id="wjlx" style="width:180px;">
								<option value="">-请选择-</option>
								<option value="报告">报告</option>
								<option value="方案">方案</option>
								<option value="实施方案">实施方案</option>
								<option value="图件jpg">图件jpg</option>
								<option value="协议">协议</option>
								<option value="照片Word">照片Word</option>
								<option value="其他">其他</option>
							</select>
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">附件：</td>
					<td colspan="3">
						<input name="upload" type="file" value="" style="width:400px;" />
						<font color="red">*</font>
					</td>
				</tr>
				
				<tr>
					<td style="background-color:#f5f8fa;">备注：</td>
					<td colspan="3">
						<textarea name="hysyywHygnqhHykjHjfa.bz" id="hysyywHygnqhHykjHjfa.bz" rows="4" cols="60">${hysyywHygnqhHykjDmtxx.bz }</textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn" name="xg" onclick="addHjfa()" value="保存" />
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