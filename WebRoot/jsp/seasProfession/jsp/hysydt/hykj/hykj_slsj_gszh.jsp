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
	//修改
	function xgSlsj(){

		if(document.getElementById("sjlx").value ==""){
			alert("矢量数据类型不允许为空！");
			return false;
		}
		
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_updateSlsj.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	function goDownload1(){
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_downLoadSlsjFile1.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	function goDownload2(){
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_downLoadSlsjFile2.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	function goDownload3(){
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_downLoadSlsjFile3.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	function goDownload4(){
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_downLoadSlsjFile4.do";
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
			<div class="listtitle"><img src="${contextPath}/images/icon05.png" width="20" height="20" />格式转换</div>
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td width="30%" style="background-color:#f5f8fa;">arcgis10.2.2安装文件：</td>
					<td width="70%">
					<input name="xz1" type="button" value="下载" class="scbtn1" onclick="goDownload1()" />
					</td>
				</tr>
				<tr>
					<td width="30%" style="background-color:#f5f8fa;">ArcGIS10.2安装文档：</td>
					<td width="70%">
					<input name="xz2" type="button" value="下载" class="scbtn1" onclick="goDownload2()" />
					</td>
				</tr>
				<tr>
					<td width="30%" style="background-color:#f5f8fa;">DWG转SHP格式说明文档：</td>
					<td width="70%">
					<input name="xz3" type="button" value="下载" class="scbtn1" onclick="goDownload3()" />
					</td>
				</tr>
				<tr>
					<td width="30%" style="background-color:#f5f8fa;">SHP转DWG格式说明文档：</td>
					<td width="70%">
					<input name="xz4" type="button" value="下载" class="scbtn1" onclick="goDownload4()" />
					</td>
				</tr>
				
				<!-- 
				<tr>
					<td style="background-color:#f5f8fa;">矢量数据名称：</td>
					<td colspan="3">${hysyywHygnqhHykjSlsj.slsjmc }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">矢量数据类型：</td>
					<td colspan="3">${hysyywHygnqhHykjSlsj.sjlx }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">数据文件名：</td>
					<td colspan="3">
					<input name="hysyywHygnqhHykjSlsj.sjwjm" id="hysyywHygnqhHykjSlsj.sjwjm" type="hidden" value="${hysyywHygnqhHykjSlsj.sjwjm }" />
						${hysyywHygnqhHykjSlsj.sjwjm }
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">转换格式为：</td>
					<td colspan="3">
						<select name="hysyywHygnqhHykjSlsj.sjlx" id="sjlx" style="width:180px;">
							<option value="">-请选择-</option>
							<option value="CAD">CAD</option>
							<option value="SHP">SHP</option>
							<option value="GeoDatabase">GeoDatabase</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">文件存储为：</td>
					<td colspan="3">
						<input name="uploadSjwj" type="file" value="" style="width:400px;" />
					</td>
				</tr>
				 -->
				<tr>
					<td colspan="2" style="text-align:center;">
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