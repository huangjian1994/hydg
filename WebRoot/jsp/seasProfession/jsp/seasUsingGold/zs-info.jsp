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
					<td style="background-color:#e8edef;">证书编号</td>
					<td><input name="" type="text" class="scinput" value="F3000002" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">发证日期</td>
					<td><input name="" type="text" class="scinput" value="2014-12-10" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用海起始时间</td>
					<td><input name="" type="text" class="scinput" value="2014-12-11" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">用海终止时间</td>
					<td><input name="" type="text" class="scinput" value="2016-10-11" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用海年限</td>
					<td><input name="" type="text" class="scinput" value="1" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">宗海面积</td>
					<td><input name="" type="text" class="scinput" value="100" style="width:180px;height:20px;" />公顷</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用海类型A</td>
					<td>
						<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
							<option value="交通运输用海">交通运输用海</option>
							<option value="交通运输用海">交通运输用海</option>
						</select>
					</td>
					<td style="background-color:#e8edef;">用海类型B</td>
					<td>
						<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
							<option value="港口用海">港口用海</option>
							<option value="港口用海">港口用海</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用海性质</td>
					<td>
						<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
							<option value="经营性">经营性</option>
							<option value="非经营性">非经营性</option>
						</select>
					</td>
					<td style="background-color:#e8edef;">用海设施和构建物</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海籍调查表号</td>
					<td><input name="" type="text" class="scinput" value="20110203" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">审批表号或批准合同号</td>
					<td><input name="" type="text" class="scinput" value="20121211" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海籍编号</td>
					<td><input name="" type="text" class="scinput" value="020231232" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">海籍图号</td>
					<td><input name="" type="text" class="scinput" value="020222222" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海域使用总金额</td>
					<td><input name="" type="text" class="scinput" value="123123123" style="width:180px;height:20px;" />元</td>
					<td style="background-color:#e8edef;">使用金缴纳方式</td>
					<td>
						<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
							<option value="逐年缴纳">逐年缴纳</option>
							<option value="一次性缴纳">一次性缴纳</option>
						</select>
					</td>

				</tr>
				<tr>
					<td style="background-color:#e8edef;">海域使用金征收标准</td>
					<td><input name="" type="text" class="scinput" value="1212" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">海域使用金征收标准依据</td>
					<td><input name="" type="text" class="scinput" value="1212" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用海位置文字说明</td>
					<td colspan="3"><textarea style="width:100%;height: 100px;"></textarea></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">备注</td>
					<td colspan="3"><textarea style="width:100%;height: 100px;"></textarea></td>
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