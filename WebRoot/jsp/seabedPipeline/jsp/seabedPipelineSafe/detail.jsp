<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
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

	<body>

		<div class="formbody">

			<div>
				<div id="usual1" class="usual" style="width:600px; height:500px;float:left">
					<!--左上边开始--->

					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seabedPipeline/ico06.png" width="25" height="25" />船舶一号基本信息</div>
						<!--开始-->
						<table width="90%" align="center" style="text-align:center;" class="tablelist">

							<tr>
								<td style="text-align:right" width="150px">船舶：</td>
								<td style="text-align:left">船舶一号</td>
								<td style="text-align:right" width="150px">船名：</td>
								<td style="text-align:left">渔船1号</td>
							</tr>
							<tr>
								<td style="text-align:right" width="150px">船型：</td>
								<td style="text-align:left">货船</td>

								<td style="text-align:right" width="150px">IMO号码：</td>
								<td style="text-align:left">181</td>
							</tr>
							<tr>
								<td style="text-align:right" width="150px">呼号：</td>
								<td style="text-align:left">181</td>

								<td style="text-align:right" width="150px">吃水：</td>
								<td style="text-align:left">213</td>
							</tr>
							<tr>
								<td style="text-align:right" width="150px">长宽：</td>
								<td style="text-align:left">1253*456</td>

								<td style="text-align:right" width="150px">型深：</td>
								<td style="text-align:left">123</td>
							</tr>
							<tr>
								<td style="text-align:right" width="150px">船期：</td>
								<td style="text-align:left">30年</td>

								<td style="text-align:right" width="150px">船级社：</td>
								<td style="text-align:left">456</td>
							</tr>
							<tr>
								<td style="text-align:right" width="150px">船东：</td>
								<td style="text-align:left">张鹏</td>

								<td style="text-align:right" width="150px">管理公司：</td>
								<td style="text-align:left">渔船管理公司</td>
							</tr>
							<tr>
								<td style="text-align:right" width="150px">船舶位置的经纬度：</td>
								<td style="text-align:left">东经39度</td>

								<td style="text-align:right" width="150px">下一个港口：</td>
								<td style="text-align:left">港口1</td>
							</tr>
						</table>
					</div>

				</div>

			</div>
			<!------>
		</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

	</body>

</html>