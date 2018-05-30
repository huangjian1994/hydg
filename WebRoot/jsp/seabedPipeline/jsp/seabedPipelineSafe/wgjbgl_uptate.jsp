<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海底管线安全</title>
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
			<span><img src="${contextPath}/images/seabedPipeline/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海底管线安全</a>
				</li>
				<li>
					<a href="#">违规举报管理</a>
				</li>
			</ul>
		</div>
		<div align="center">

			<div class="mainbox">
				<div class="leftinfo1">
					<div class="listtitle3">
						<img src="${contextPath}/images/seabedPipeline/i02.png" width="25" height="25" />修改举报信息
					</div>

					<div id="usual1" class="usual">
						<div id="tab1" class="tabson">
							<table width="80%" align="center" style="text-align:left;" class="tableXQ" cellSpacing='12' cellPadding='12'>
								<tr>
									<td style="background-color:#e8edef;">违规船名：</td>
									<td><input name="" type="text" class="scinput" value="bk321" style="width:180px;height:20px;" />
									</td>
									<td style="background-color:#e8edef;">船类型：</td>
									<td>
										<select name="ssbm" id="ssbm" style="width:180px;height:20px;">
											<option value="">-请选择-</option>
											<option value="非法取砂船舶" selected="selected">非法取砂船舶</option>
											<option value="工程作业船">工程作业船</option>
										</select>

									</td>

								</tr>
								<tr>
									<td style="background-color:#e8edef;">违规内容：</td>
									<td><input name="" type="text" class="scinput" value="违规停靠" style="width:180px;height:20px;" />
									</td>
									<td style="background-color:#e8edef;">违规地点：</td>
									<td><input name="" type="text" class="scinput" value="地点1" style="width:180px;height:20px;" />
									</td>

								</tr>

								<tr>
									<td style="background-color:#e8edef;">举报日期：</td>
									<td><input name="" type="text" class="scinput" value="2015-5-9" style="width:180px;height:20px;" />
									</td>
									<td style="background-color:#e8edef;">举报人：</td>
									<td><input name="" type="text" class="scinput" value="李明" style="width:180px;height:20px;" />
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">后续处理情况：</td>

									<td colspan="3"><input name="" type="text" class="scinput" value="待处理" style="width:180px;height:20px;" />

									</td>
								</tr>

								<tr>
									<td colspan="4" style="text-align:center;">
										<input type="button" class="scbtn1" name="btn" onclick="history.go(-1)" value="修改">
										<input name="fh" type="button" value="返回" class="scbtn1" onclick="history.go(-1)" />
									</td>
								</tr>
							</table>

						</div>
					</div>

				</div>
			</div>
		</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</body>

</html>