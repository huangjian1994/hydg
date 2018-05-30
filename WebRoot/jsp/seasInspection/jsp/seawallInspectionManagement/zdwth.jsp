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
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<th>监测内容</th>
				<tr>
					<td style="background-color:#e8edef;">项目名称：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">项目类型：</td>
					<td>
						<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
							<option value="">-请选择-</option>
							<option value="重点围填海在建项目地面监视监测" selected="selected">重点围填海在建项目地面监视监测</option>
							<option value="疑点疑区监视监测">疑点疑区监视监测</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">监测类型：</td>
					<td>
						<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
							<option value="">-请选择-</option>
							<option value="首次监测" selected="selected">首次监测</option>
							<option value="地面核查监测">地面核查监测</option>
							<option value="竣工验收结果录入">竣工验收结果录入</option>
						</select>
					</td>
					<td style="background-color:#e8edef;">海域名称：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">现场监测时间：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">用海区域现状：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用海周边情况：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">施工方式：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">施工进展情况：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">现场照片：</td>
					<td>
						<form method="post" enctype='multipart/form-data'><input name="picture" type="file" class="scinput" value="" style="width:180px;height:20px;" /></form>
					</td>
				</tr>

				<th>调查结论</th>
				<tr>
					<td style="background-color:#e8edef;">是否已经动工：</td>
					<td><input name="group1" type="radio" value="是" checked="checked" />是
						<input name="group1" type="radio" value="否" />否
					</td>
					<td style="background-color:#e8edef;">是否存在权属争议：</td>
					<td><input name="group2" type="radio" value="是" checked="checked" />是
						<input name="group2" type="radio" value="否" />否
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">与海洋功能区划符合性：</td>
					<td><input name="group3" type="radio" value="符合" checked="checked" />符合
						<input name="group3" type="radio" value="不符合" />不符合
					</td>
					<td style="background-color:#e8edef;">是否按规定有序施工：</td>
					<td><input name="group4" type="radio" value="是" checked="checked" />是
						<input name="group4" type="radio" value="否" />否
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">是否超范围填海：</td>
					<td><input name="group5" type="radio" value="是" checked="checked" />是
						<input name="group5" type="radio" value="否" />否
					</td>
					<td style="background-color:#e8edef;">围填海界址坐标：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">备注：</td>
					<td colspan="3"><input name="" type="text" class="scinput" value="" style="width:180px;height:40px;border:none;" /></td>
				</tr>
				<th>地面监测人员信息</th>
				<tr>
					<td style="background-color:#e8edef;">调查单位名称：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">调查人员名单：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='cljd_clgl.html'" value="保存">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='cljd_clgl.html'" />
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

		</div>

	</body>

</html>