<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap.min.css" />
		<!--<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />-->
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/seasProfession/usemoney-add.css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>

	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">使用金征收管理</a>
				</li>
				<li>
					<a href="#">使用金新增</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">海域使用权人</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">用海面积</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />公顷</td>

				</tr>
				<tr>
					<td style="background-color:#e8edef;">受理时间</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">批准单位</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用海起始时间</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">用海终止时间</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海域使用总金额</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />元</td>
					<td style="background-color:#e8edef;">海域使用金缴纳方式</td>
					<td>
						<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
							<option value="">-请选择-</option>
							<option value="逐年缴纳">逐年缴纳</option>
							<option value="一次性缴纳">一次性缴纳</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海域使用金征收标准</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">海域使用金征收标准依据</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">通知日期</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">缴纳地点</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">缴纳开始日期</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">缴纳结束日期</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">开户行</td>
					<td>
						<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
							<option value="">-请选择-</option>
							<option value="工商银行">工商银行</option>
							<option value="建设银行">建设银行</option>
						</select>
					</td>
					<td style="background-color:#e8edef;">户名</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />元</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">账号</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">通知机关</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">登记开始日期</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">登记结束日期</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">登记开始日期</td>
					<td colspan="3"><input name="" type="text" class="scinput" value="" style="width:360px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='usemoney_add.jsp'" value="提交申请">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='usemoney_add.jsp'" />
					</td>
				</tr>
			</table>
		</div>
	</body>
	<script type="text/javascript">
		$("#usual1 ul").idTabs();
	</script>

	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</html>