<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap.min.css" />
		
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/style.css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>

	<body>
		<div class="place">
			<span><img src="${contextPath}/jsp/seasProfession/images/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">内外部接口</a>
				</li>
				<li>
					<a href="#">海域使用权</a>
				</li>
				<li>
					<a href="#">海域使用权修改</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">要素代码</td>
					<td><input name="" type="text" class="scinput" value="H123213123" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">业务号</td>
					<td><input name="" type="text" class="scinput" value="2321312" style="width:180px;height:20px;" /></td>

				</tr>
				<tr>
					<td style="background-color:#e8edef;">不动产单元号</td>
					<td><input name="" type="text" class="scinput" value="HJK123123" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">不动产权证号</td>
					<td><input name="" type="text" class="scinput" value="HJ23232" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海域面积</td>
					<td><input name="" type="text" class="scinput" value="33232" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">海域面积单位</td>
					<td><input name="" type="text" class="scinput" value="公顷" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">来源不动产单元号</td>
					<td><input name="" type="text" class="scinput" value="KJ234234" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">权利类型</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">权利起始时间</td>
					<td><input name="" type="text" class="scinput" value="2014-09-23" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">权利结束时间</td>
					<td><input name="" type="text" class="scinput" value="2017-09-09" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">权属状态</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">使用金标准依据</td>
					<td><input name="" type="text" class="scinput" value="标准1" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">使用金缴纳情况</td>
					<td><input name="" type="text" class="scinput" value="已缴纳" style="width:180px;height:20px;" />
					</td>
					<td style="background-color:#e8edef;">使用金总额</td>
					<td><input name="" type="text" class="scinput" value="23777" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">附记</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='hysyq.jsp'" value="提交申请">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='hysyq.jsp'" />
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