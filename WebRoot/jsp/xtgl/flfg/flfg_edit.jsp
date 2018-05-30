<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<%String requierd = "<font color='red'>*</font>"; %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海洋法律法规</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="javascript:void(0)">系统管理</a>
				</li>
				<li>
					<a href="javascript:void(0)">海洋法律法规</a>
				</li>
				<c:if test="${seaLaw.id == null}">
					<li>
						<a href="javascript:void(0)">海洋法律法规添加</a>
					</li>
				</c:if>
				<c:if test="${seaLaw.id != null}">
					<li>
						<a href="javascript:void(0)">海洋法律法规修改</a>
					</li>
				</c:if>
			</ul>
		</div>

		<div class="formbody">
			<s:form id="lawForm" name="seaLaw" namespace="/seaLaw" method="post" enctype='multipart/form-data'>
				<s:hidden name="seaLaw.id"></s:hidden>
				<s:hidden name="seaLaw.addtime"></s:hidden>
				<s:hidden name="seaLaw.addusername"></s:hidden>
				<s:hidden name="seaLaw.adduserid"></s:hidden>
				<s:hidden name="seaLaw.filePath"></s:hidden>
				
				
				<table width="100%" align="center" style="text-align:left;" class="tableXQ">
					<col style="width:20%" />
					<col style="width:30%" />
					<col style="width:20%" />
					<col style="width:30%" />
					<th>海洋法律法规</th>
					<tr>
						<td style="background-color:#e8edef;">法律法规名称：</td>
						<td colspan="3">
							<s:textfield id="lawName" name="seaLaw.lawName" cssClass="scinput" cssStyle="width:89%;height:20px;"></s:textfield><%=requierd %>
						</td>
					</tr>
					<tr>
						<td style="background-color:#e8edef;">分类：</td>
						<td>
							<s:select id="type" name="seaLaw.type" list="lawTypeMap" headerKey="" headerValue="-请选择-" cssClass="scinput" cssStyle="width:70%;height:20px;"></s:select><%=requierd %>
						</td>
							<td style="background-color:#e8edef;">文号：</td>
							<td><s:textfield id="articleNum" name="seaLaw.articleNum" cssClass="scinput" cssStyle="width:70%;height:20px;"></s:textfield></td>
					</tr>
					<tr>
						<td style="background-color:#e8edef;">摘要：</td>
						<td colspan="3">
							<s:textarea id="lawAbstract" name="seaLaw.lawAbstract" cssClass="scinput" cssStyle="width:89%;height:80px;"></s:textarea><%=requierd %>
						</td>
					</tr>
					<tr>
						<td style="background-color:#e8edef;">法律法规文档：</td>
						<td>
							<c:if test="${'0'== operate}">
								<input type="button" value="文件下载" class="scbtn1" style="width:25%;" onclick="window.location='${contextPath}/seaLaw/law_downloadFile.do?seaLaw.id=${seaLaw.id}'" />
							</c:if>
							<c:if test="${'0'!= operate}">
								<s:file id="law" name="law" cssClass="scinput" cssStyle="width:70%;height:20px;"></s:file><%=requierd %>
							</c:if>
						</td>
						<c:if test="${'0'== operate}">
							<td style="background-color:#e8edef;">新增用户：</td>
							<td><s:textfield disabled="disabled" name="seaLaw.addusername" cssClass="scinput" cssStyle="width:70%;height:20px;"></s:textfield></td>
						</c:if>
						<c:if test="${'0'!= operate}">
							<td style="background-color:#e8edef;">序号：</td>
							<td><s:textfield id="seq" name="seaLaw.seq" cssClass="scinput" cssStyle="width:70%;height:20px;"></s:textfield></td>
						</c:if>
					</tr>
					
					<c:if test="${'0'== operate}">
						<tr>
							<td style="background-color:#e8edef;">新增时间：</td>
							<td><s:textfield disabled="disabled" name="seaLaw.addtime" cssClass="scinput" cssStyle="width:70%;height:20px;"></s:textfield></td>
							<td style="background-color:#e8edef;">修改时间：</td>
							<td><s:textfield disabled="disabled" name="seaLaw.lastupdatetime" cssClass="scinput" cssStyle="width:70%;height:20px;"></s:textfield></td>
						</tr>
					</c:if>
					
					<tr>
						<td colspan="4" style="text-align:center;">
							<c:if test="${'0'!= operate}">
								<s:submit cssClass="scbtn1" value="保存"></s:submit>
							</c:if>
							<input type="button" value="返回" class="scbtn1" onclick="window.location='${contextPath}/seaLaw/law_loadLawPage.do'" />
						</td>
					</tr>
				</table>
			</s:form>
		</div>
		<script type="text/javascript">
			var id = '${seaLaw.id}';
			var operate = "${operate}";
			$(function(){
				//operate 0:查看详情
				if ( "0" == operate ) {
					$(":input").attr("readonly","readonly");
					$("#type").attr("disabled","disabled");
					
				} else {
					if ( id == '' ) {
						$("#lawForm").attr("action","law_addSeaLaw.do");
					} else {
						$("#lawForm").attr("action","law_editSeaLaw.do");
					}
	
					$("#lawForm").submit(function(){
						return dataCheck();
					})
				}
			})
			
			
			
			function dataCheck(){
				
				var lawName = $("#lawName").val();
				var type = $("#type").val();
				var lawAbstract = $("#lawAbstract").val();
				var law = $("#law").val();
				var seq = $("#seq").val();

				if ( lawName == "" ) {
					alert("法律法规名称不可为空！");
					return false;
				}
				if ( type == "" ) {
					alert("法律法规分类不可为空！");
					return false;
				}
				if ( lawAbstract == "" ) {
					alert("法律法规摘要不可为空！");
					return false;
				}
				if ( id == '' && law == "" ) {
					alert("法律法规文档不可为空！");
					return false;
				}
				if ( seq != "" ) {
					var reg = /^[0-9]*$/;
					if ( !reg.test(seq) ) {
						alert("序号必须为整数！");
						return false;
					}
				}
				
			}
		</script>
	</body>
	
</html>