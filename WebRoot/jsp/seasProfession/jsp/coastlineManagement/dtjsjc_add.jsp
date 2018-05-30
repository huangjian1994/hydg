<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
		"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/seasProfession/left.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/easyui.css">
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/icon.css">
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js//editor/kindeditor.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.easyui.min.js"></script>
		<script>
			function addTab(title, url) {
				if($('#tt').tabs('exists', title)) {
					$('#tt').tabs('select', title);
				} else {
					var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
					$('#tt').tabs('add', {
						title: title,
						content: content,
						closable: true
					});
				}
			}
			$(function() {
				addTab('纠纷管理', '${contextPath}/jsp/seasProfession/jsp/coastlineManagement/jfgl_add.jsp');
			})
		</script>
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
					<a href="#">海岸线管理</a>
				</li>
				<li>
					<a href="#">动态监视监测管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">

			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">岸段序号</td>
					<td><input name="" type="text" class="scinput" value="一号海岸线" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">海岸线名称(千米)</td>
					<td><input name="" type="text" class="scinput" value="1.6" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海岸是否侵蚀</td>
					<td>
						<input name="choose1" type="radio" class="scinput" style="vertical-align: middle;" />是
						<input name="choose1" type="radio" class="scinput" style="vertical-align: middle;" />否
					</td>
					<td style="background-color:#e8edef;">海岸是否冲淤</td>
					<td>
						<input name="choose2" type="radio" class="scinput" style="vertical-align: middle;" />是
						<input name="choose2" type="radio" class="scinput" style="vertical-align: middle;" />否
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海岸是否海水入侵</td>
					<td>
						<input name="choose3" type="radio" class="scinput" style="vertical-align: middle;" />是
						<input name="choose3" type="radio" class="scinput" style="vertical-align: middle;" />否
					</td>
					<td style="background-color:#e8edef;">海岸是否有蓝藻</td>
					<td>
						<input name="choose4" type="radio" class="scinput" style="vertical-align: middle;" />是
						<input name="choose4" type="radio" class="scinput" style="vertical-align: middle;" />否
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海岸是否富营养化</td>
					<td>
						<input name="choose5" type="radio" class="scinput" style="vertical-align: middle;" />是
						<input name="choose5" type="radio" class="scinput" style="vertical-align: middle;" />否
					</td>
					<td style="background-color:#e8edef;">海岸线是否有纠纷</td>
					<td>
						<input name="choose6" type="radio" class="scinput" style="vertical-align: middle;" />是
						<input name="choose6" type="radio" class="scinput" style="vertical-align: middle;" />否
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">是否违法占有海岸线情况</td>
					<td>
						<input name="choose7" type="radio" class="scinput" style="vertical-align: middle;" />是
						<input name="choose7" type="radio" class="scinput" style="vertical-align: middle;" />否
					</td>
					<td style="background-color:#e8edef;">新增人</td>
					<td><input name="" type="text" class="scinput" value="张三" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">新增时间</td>
					<td><input name="" type="text" class="scinput" value="2016-9-25" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">最近修改时间</td>
					<td><input name="" type="text" class="scinput" value="2016-9-25" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="easyui-linkbutton scbtn1" onclick="addTab('纠纷管理','${contextPath}/jsp/seasProfession/jsp/coastlineManagement/jfgl_add.jsp')" value="纠纷管理">
						<input type="button" class="easyui-linkbutton scbtn1" onclick="addTab('违法情况','${contextPath}/jsp/seasProfession/jsp/coastlineManagement/wfqk_add.jsp')" value="违法情况">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='dtjsjc.jsp'" value="保存">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='dtjsjc.jsp'" />
					</td>
				</tr>
			</table>
		</div>
		<div id="tt" class="easyui-tabs" style="height: 300px"></div>

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