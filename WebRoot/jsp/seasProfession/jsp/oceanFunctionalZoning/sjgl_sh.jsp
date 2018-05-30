<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>

	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海洋功能区划管理</a>
				</li>
				<li>
					<a href="#">审计管理</a>
				</li>
			</ul>
		</div>
		<div style="padding-top:20px;">
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<th>审核信息</th>
				<tr>
					<td style="background-color:#e8edef;">功能区名称：</td>
					<td>外高桥港区</td>
					<td style="background-color:#e8edef;">功能区划类型：</td>
					<td>港口航运</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">管理单位：</td>
					<td>上海市海洋局</td>
					<td style="background-color:#e8edef;">所属区县：</td>
					<td>浦东新区</td>
				</tr>

				<tr>
					<td style="background-color:#e8edef;">是否超范围填海：</td>
					<td>否</td>

					<td style="background-color:#e8edef;">是否存在权属争议：</td>
					<td>否</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">与海洋功能区划符合性：</td>
					<td>符合</td>
					<td style="background-color:#e8edef;">是否按规定使用：</td>
					<td>是</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">辅助划分：</td>
					<td>2个</td>
					<td style="background-color:#e8edef;">规定用海面积：</td>
					<td>500平方米</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">实际用海面积：</td>
					<td>480平方米</td>
					<td style="background-color:#e8edef;">是否增加：</td>
					<td>否</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">是否减少：</td>
					<td>否</td>
					<td style="background-color:#e8edef;">现场照片：</td>
					<td><img src="${contextPath}/images/seasProfession/qhgl/2.png" width="200px" height="80px"></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">新增人：</td>
					<td>张三</td>
					<td style="background-color:#e8edef;">新增人单位：</td>
					<td>上海市海洋局区划管理部门</td>
				</tr>
				<th>审核意见</th>
				<tr>
					<td style="background-color:#e8edef;">审批人：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">审批时间：</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">审核意见：</td>
					<td colspan="3"><textarea style="width:783px;height:40px;"></textarea></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='qhgl_sjgl.jsp'" value="提交">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='qhgl_sjgl.jsp'" />
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