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
		<div class="formbody">
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">海岸线名称</td>
					<td><input name="" type="text" class="scinput" value="一号海岸线" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">发生时间</td>
					<td><input name="" type="text" class="scinput" value="2016-10-09" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">发生地点</td>
					<td><input name="" type="text" class="scinput" value="外高桥港区" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">纠纷描述</td>
					<td><input name="" type="text" class="scinput" value="使用人纠纷" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">相关人员</td>
					<td><input name="" type="text" class="scinput" value="张三 李四 王五" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">处理结果</td>
					<td><input name="" type="text" class="scinput" value="处理中" style="width:180px;height:20px;" /></td>
				</tr>
			</table>
		</div>
		<div>
			<script type="text/javascript">
				$("#usual1 ul").idTabs();
			</script>

			<script type="text/javascript">
				$('.tablelist tbody tr:odd').addClass('odd');
			</script>

		</div>

	</body>

</html>