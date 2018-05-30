<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海域勘界管理</a>
				</li>
				<li>
					<a href="#">多媒体信息管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">

			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">多媒体名称：</td>
					<td><input name="" type="text" class="scinput" value="lenove电脑" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">所属部门：</td>
					<td>
						<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
							<option value="">-请选择-</option>
							<option value="指挥部" selected="selected">指挥部</option>
							<option value="政治部">政治部</option>
							<option value="刑侦部">刑侦部</option>
							<option value="技侦部">技侦部</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">购买时间：</td>
					<td><input name="" type="text" class="scinput" value="2016-9-25" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">购买数量：</td>
					<td><input name="" type="text" class="scinput" value="100台" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">上架时间：</td>
					<td><input name="" type="text" class="scinput" value="2016-3-2" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">功能描述：</td>
					<td><input name="" type="text" class="scinput" value="办公" style="width:180px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">文件名</td>
					<td><input name="" type="text" class="scinput" value="大风厂" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">文件说明</td>
					<td><input name="" type="text" class="scinput" value="详细说明" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">文件类型</td>
					<td>
						<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
							<option value="音频">音频</option>
							<option value="视频">视频</option>
							<option value="文件">文件</option>
						</select>
					</td>
					<td style="background-color:#e8edef;">上传人</td>
					<td><input name="" type="text" class="scinput" value="张三" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">上传时间</td>
					<td><input name="" type="text" class="scinput" value="2017-06-18" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">附件</td>
					<td><input name="附件" type="file" class="scinput" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">备注</td>
					<td><input name="" type="text" class="scinput" value="视频" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">新增人</td>
					<td><input name="" type="text" class="scinput" value="张三" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">新增时间</td>
					<td><input name="" type="text" class="scinput" value="2017-06-18" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">最近修改时间</td>
					<td><input name="" type="text" class="scinput" value="2017-06-20" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='media.jsp'" value="保存" />
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='media.jsp'" />
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