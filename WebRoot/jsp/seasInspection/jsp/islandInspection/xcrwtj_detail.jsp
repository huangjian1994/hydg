<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>巡查计划管理</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>		
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
					<a href="#">巡查任务审核</a>
				</li>
			</ul>
		</div>
		<div align="center">
			<div class="mainbox">
				<div class="leftinfo1">
					<div class="listtitle3">
						<img src="${contextPath}/images/seasInspection/i02.png" width="25" height="25" />审核
					</div>
					<div align="center">
						<div class="leftinfo1">
							<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ticon.png" width="25" height="25" />海域海岛巡查基本信息</div>
							<table width="100%" align="center" style="text-align:left;" class="tableXQ" cellSpacing='12' cellPadding='12'>
								<tr>
									<td style="background-color:#e8edef;width:275px">填表单位：</td>
									<td>中国海监上海市总队四支队</td>
									<td style="background-color:#e8edef;">填表日期：</td>
									<td>2016-10-6</td>
								</tr>
								<tr>									
									<td style="background-color:#e8edef;">检查方式：</td>
									<td>定期</td>
									<td style="background-color:#e8edef;">检查海岛：</td>
									<td>鸡骨礁</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">问题分类：</td>
									<td>检查</td>
									<td style="background-color:#e8edef;">巡查范围：</td>
									<td>宝山区</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">巡查内容：</td>
									<td>巡查海岛</td>
									<td style="background-color:#e8edef;">桩号定位：</td>
									<td>桩号203</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">照片查看：</td>
									<td colspan="3"><img src="${contextPath}/images/seasInspection/i07.png" width="200" height="100" /></td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">问题描述：</td>
									<td colspan="3">略过</td>
								</tr>
							</table>
							<br/>
						</div><br/>
						<div class="leftinfo1">
							<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ticon.png" width="25" height="25" />下派信息</div>
							<table width="100%" align="center" style="text-align:left;" class="tableXQ" cellSpacing='12' cellPadding='12'>
								<tr>
									<td style="background-color:#e8edef; width:275px">下派人：</td>
									<td>周鹏</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">下派领队</td>
									<td>黄翔</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">派出人员：</td>
									<td>黄翔、张三、李四</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">下派意见：</td>
									<td>暂无</td>
								</tr>
							</table>
							<br/>
						</div><br/>
						<div class="leftinfo1">
							<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ticon.png" width="25" height="25" />审核信息</div>
							<table width="100%" align="center" style="text-align:left;" class="tableXQ" cellSpacing='12' cellPadding='12'>
								<tr>
									<td style="background-color:#e8edef; width:275px">审核人：</td>
									<td>周鹏</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">审核结果：</td>
									<td>审核通过</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">审核意见：</td>
									<td>暂无</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center;">
										<input type="button" class="scbtn1" name="btn" onclick="window.location.href='hyhdxc_xcrwts.jsp'" value="保存">
										<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location.href='hyhdxc_xcrwts.jsp'" />
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