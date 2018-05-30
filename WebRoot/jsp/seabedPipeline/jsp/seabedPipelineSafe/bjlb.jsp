<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>报警类别</title>
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
						<div class="listtitle3"><img src="${contextPath}/images/seabedPipeline/t02.png" width="25" height="25" />设置报警</div>
						<!--开始-->
						<table width="90%" align="center" style="text-align:center;" class="tablelist">

							<tr>
								<td style="text-align:right" width="130px">航速大小：</td>
								<td align="left"> <input name="" type="text" class="dfinput1" value="" style="width:180px;" align="left" /></td>
							</tr>
							<tr>
								<td width="130px" style="text-align:right"> 报警类别：</td>
								<td align="left">
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="">一类报警</option>
										<option value="">二类报警</option>
										<option value="">三类报警</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="center" style="text-align:center;" colspan="2">
									<input name="" type="button" class="scbtn1" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="" type="reset" class="scbtn1" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
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