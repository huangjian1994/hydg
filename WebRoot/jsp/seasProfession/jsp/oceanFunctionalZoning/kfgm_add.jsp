<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
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

			<!--使用onchange="jumpMenu()"触发jumpMenu()方法-->
			function jumpMenu(e) {
				window.location.href = e.value;
			}
		</script>
	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海洋功能区划管理</a>
				</li>
				<li>
					<a href="#">利用保护与现状跟踪</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="choice">请选择新增类型：
				<select name="ssbm" id="ssbm" onchange="jumpMenu(this)" style="width:180px;height:25px;">
					<option value="">-请选择-</option>
					<option value="kfgm_add.jsp" selected="selected">开发规模</option>
					<option value="zlbh_add.jsp">质量变化</option>
					<option value="plyx_add.jsp">对毗邻功能区影响</option>
				</select>
			</div>
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">功能区名称：</td>
					<td>
						<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
							<option value="">-请选择-</option>
							<option value="长江口区域">长江口区域</option>
							<option value="杭州湾区域">杭州湾区域</option>
							<option value="外高桥港区">外高桥港区</option>
							<option value="崇头边滩保留区">崇头边滩保留区</option>
							<option value="上海滨江森林公园">上海滨江森林公园</option>
							<option value="东海大桥海上风电场区">东海大桥海上风电场区</option>
						</select>
					</td>
					<td style="background-color:#e8edef;">功能区划类型：</td>
					<td>
						<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
							<option value="">-请选择-</option>
							<option value="农渔业">农渔业</option>
							<option value="港口航运">港口航运</option>
							<option value="工业与城镇用海">工业与城镇用海</option>
							<option value="矿产与能源">矿产与能源</option>
							<option value="旅游休闲娱乐">旅游休闲娱乐</option>
							<option value="海洋保护">海洋保护</option>
							<option value="特殊利用">特殊利用</option>
							<option value="保留区">保留区</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">管理单位：</td>
					<td>
						<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
							<option value="">-请选择-</option>
							<option value="上海市海洋局">上海市海洋局</option>
							<option value="崇明分局">崇明分局</option>
						</select>
					</td>
					<td style="background-color:#e8edef;">海域名称：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">所属区县：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">宗海位置：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">界址：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">用海年限：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用海面积：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">使用人：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">与海洋功能区划符合性：</td>
					<td><input name="group3" type="radio" value="符合" checked="checked" />符合
						<input name="group3" type="radio" value="不符合" />不符合
					</td>
					<td style="background-color:#e8edef;">是否存在权属争议：</td>
					<td><input name="group2" type="radio" value="是" checked="checked" />是
						<input name="group2" type="radio" value="否" />否
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">开发规模：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">围填海界址坐标：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">新增人：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">新增时间：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='lygz_xzgz.jsp'" value="保存">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='lygz_xzgz.jsp'" />
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