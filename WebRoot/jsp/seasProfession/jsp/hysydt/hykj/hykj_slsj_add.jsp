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
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_fetchSlsj2.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	//保存
	function saveSlsj(){
		if(document.getElementById("hysyywHygnqhHykjSlsj.slsjmc").value ==""){
			alert("矢量数据名称不允许为空！");
			return false;
		}
		if(document.getElementById("sjlx").value ==""){
			alert("矢量数据类型不允许为空！");
			return false;
		}
		if(document.getElementById("hysyywHygnqhHykjSlsj.sjlj").value ==""){
			alert("数据链接不允许为空！");
			return false;
		}
		if(document.getElementById("hysyywHygnqhHykjSlsj.sjly").value ==""){
			alert("数据来源不允许为空！");
			return false;
		}
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_addSlsj.do";
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
				<li><a href="#">矢量数据管理</a></li>
			</ul>
		</div>
		
		<div class="formbody">
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/ico02.png" width="20" height="20" />新增</div>
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				
				<tr>
					<td style="background-color:#f5f8fa;">矢量数据名称：</td>
					<td colspan="3">
						<input name="hysyywHygnqhHykjSlsj.slsjmc" id="hysyywHygnqhHykjSlsj.slsjmc" type="text" value="" style="width:180px;" />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">矢量数据类型：</td>
					<td colspan="3">
						<select name="hysyywHygnqhHykjSlsj.sjlx" id="sjlx" style="width:180px;">
							<option value="">-请选择-</option>
							<option value="CAD">CAD</option>
							<option value="SHP">SHP</option>
							<option value="GeoDatabase">GeoDatabase</option>
						</select><font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">上传数据文件：</td>
					<td>
						<input name="uploadSjwj" type="file" value="" style="width:400px;" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">数据使用链接：</td>
					<td colspan="3">
						<textarea name="hysyywHygnqhHykjSlsj.sjlj" id="hysyywHygnqhHykjSlsj.sjlj" rows="4" cols="60"></textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">数据来源：</td>
					<td colspan="3">
						<textarea name="hysyywHygnqhHykjSlsj.sjly" id="hysyywHygnqhHykjSlsj.sjly" rows="4" cols="60"></textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">上传附件：</td>
					<td>
						<input name="upload" type="file" value="" style="width:400px;" />
					</td>
				</tr>
				
				<tr>
					<td style="background-color:#f5f8fa;">备注：</td>
					<td colspan="3">
						<textarea name="hysyywHygnqhHykjSlsj.bz" id="hysyywHygnqhHykjSlsj.bz" rows="4" cols="60"></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn" name="add" onclick="saveSlsj()" value="保存" />
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