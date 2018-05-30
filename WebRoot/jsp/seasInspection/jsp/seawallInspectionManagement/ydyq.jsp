<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海域海岛巡查</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />

		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>

		<script type="text/javascript">
			function checkAll() {
				var cb = document.getElementById("cb");
				var chks = document.getElementsByName("chk");
				if(cb.checked == true) {
					for(var i = 0; i < chks.length; i++) {
						chks[i].checked = true;
					}
				} else {
					for(var i = 0; i < chks.length; i++) {
						chks[i].checked = false;
					}
				}
			}

			//<!--使用onchange="jumpMenu()"触发jumpMenu()方法-->
			function jumpMenu(e) {
				window.location.href = e.value;
			}
		</script>
	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海塘巡查管理</a>
				</li>
				<li>
					<a href="#">采集上报管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="choice">请选择要采集的项目类型：
				<select name="ssbm" id="ssbm" onchange="jumpMenu(this)" style="width:180px;height:25px;">
					<option value="">-请选择-</option>
					<option value="zdwth.html">重点围填海在建项目地面监视监测</option>
					<option value="ydyq.html" selected="selected">疑点疑区监视监测</option>
				</select>
			</div>
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<th>核查内容</th>
				<tr>
					<td style="background-color:#e8edef;">项目名称：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">项目类型：</td>
					<td>
						<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
							<option value="">-请选择-</option>
							<option value="重点围填海在建项目地面监视监测">重点围填海在建项目地面监视监测</option>
							<option value="疑点疑区监视监测" selected="selected">疑点疑区监视监测</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用途：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">位置：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">核查界址图及坐标：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">海域使用权证书登记编号：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海域使用权证书发放时间：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">发证机关：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">是否违规用海：</td>
					<td><input name="group1" type="radio" value="是" checked="checked" />是
						<input name="group1" type="radio" value="否" />否
					</td>
					<td style="background-color:#e8edef;"> 是否已核查：</td>
					<td><input name="group2" type="radio" value="是" checked="checked" />是
						<input name="group2" type="radio" value="否" />否
					</td>
				</tr>

				<th>地面监测人员信息</th>
				<tr>
					<td style="background-color:#e8edef;">核查单位名称：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>

					<td style="background-color:#e8edef;">核查人员名单：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">核查时间：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">用海项目名称：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用途：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">位置：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用海类型：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">用海方式：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用海年限：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">项目性质：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海域等级：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">宗海面积：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">项目投资额：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">宗海位置图：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">宗海界址图及坐标：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">海域使用权证书登记编号：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海域使用权证书发放时间：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">发证机关：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海域使用金总额：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">海域使用金标准：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">缴纳方式：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">缴纳时间：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">计征机关：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">经办人：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用海基本信息：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">海域使用权人信息：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海域使用金信息：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">首次监测报告：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">开工前监测报告：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">例行核查报告：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">竣工监测报告：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">地面监测人员信息：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">照片上传：</td>
					<td colspan="3">
						<form method="post" enctype='multipart/form-data'><input name="picture" type="file" class="scinput" value="" style="width:180px;height:20px;" /></form>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='dmcjsb.jsp'" value="保存">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='dmcjsb.jsp'" />
					</td>
				</tr>
			</table>
		</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

	</body>

</html>