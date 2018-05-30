<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>巡查任务下派</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>
	<script>
		function zdGL() {
			alert("自动关联成功。");
		}

		function mbXZ() {
			alert("模板下载成功。");
		}

		function plSC() {
			alert("批量上传成功。");
			window.location = 'cljd_clgl.html';
		}
	</script>
	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海域海岛巡查</a>
				</li>
				<li>
					<a href="#">巡查任务下派</a>
				</li>
			</ul>
		</div>
		<div align="center">
			<div class="mainbox">
				<div class="leftinfo1">
					<div class="listtitle3">
						<img src="${contextPath}/images/seasInspection/i02.png" width="25" height="25" />下派任务
					</div>
					<br/>
					<div align="center">
						<div class="leftinfo1">
							<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ticon.png" width="25" height="25" />海域海岛巡查基本信息</div>
							<table width="100%" align="center" style="text-align:left;" class="tableXQ" cellSpacing='12' cellPadding='12'>
								<tr>
									<td style="background-color:#e8edef;width:275px">填表单位：</td>
									<td>中国海监上海市总队四支队</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">检测海岛：</td>
									<td>鸡骨礁</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">巡查范围：</td>
									<td>宝山区</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">巡查内容：</td>
									<td>无</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">桩号定位：</td>
									<td>桩号203</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">问题描述：</td>
									<td>这是。。。</td>
								</tr>
							</table>
							<br/>
						</div>
						<br/>
						<div class="leftinfo1">
							<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ticon.png" width="25" height="25" />下派信息</div>
							<table width="100%" align="center" style="text-align:left;" class="tableXQ" cellSpacing='12' cellPadding='12'>
								<tr>
									<td style="background-color:#e8edef;width:275px">下派人：</td>
									<td><input name="" type="text" class="scinput" value="周鹏" style="width:180px;height:20px;" />
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">下派领队：</td>
									<td><input name="" type="text" class="scinput" value="黄翔" style="width:180px;height:20px;" />
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">派出人员：</td>
									<td><input name="" type="text" class="scinput" value="黄翔、李四、张三" style="width:180px;height:20px;" />
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">下派意见：</td>
									<td><textarea cols="50" rows="5"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center;">
										<input type="button" class="scbtn1" name="btn" onclick="window.location.href='hyhdxc_rwxp.jsp'" value="保存">
										<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location.href='hyhdxc_rwxp.jsp'" />
									</td>
								</tr>
							</table>
							<br/>
						</div>
						<br/>
					</div>
				</div>
			</div>
		</div>		
	</body>
</html>