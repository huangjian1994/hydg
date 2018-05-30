<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>º£µ×¹ÜÏß°²È«</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>
	<script>
		function zdGL() {
			alert("×Ô¶¯¹ØÁª³É¹¦¡£");
		}

		function mbXZ() {
			alert("Ä£°åÏÂÔØ³É¹¦¡£");
		}

		function plSC() {
			alert("ÅúÁ¿ÉÏ´«³É¹¦¡£");
			window.location = 'cljd_clgl.html';
		}
	</script>

	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seabedPipeline/ico01.png" width="22" height="22" />Î»ÖÃ£º</span>
			<ul class="placeul">
				<li>
					<a href="#">º£µ×¹ÜÏß°²È«</a>
				</li>
				<li>
					<a href="#">Î¥¹æ¾Ù±¨¹ÜÀí</a>
				</li>
			</ul>
		</div>
		<div align="center">

			<div class="mainbox">
				<div class="leftinfo1">
					<div class="listtitle3">
						<img src="${contextPath}/images/seabedPipeline/i02.png" width="25" height="25" />²é¿´¾Ù±¨ÐÅÏ¢
					</div>

					<div id="usual1" class="usual">
						<div id="tab1" class="tabson">
							<table width="80%" align="center" style="text-align:left;" class="tableXQ" cellSpacing='12' cellPadding='12'>
								<tr>
									<td style="background-color:#e8edef;">Î¥¹æ´¬Ãû£º</td>
									<td>bk321
									</td>
									<td style="background-color:#e8edef;">´¬ÀàÐÍ£º</td>
									<td>
										·Ç·¨È¡É°´¬²°

									</td>

								</tr>
								<tr>
									<td style="background-color:#e8edef;">Î¥¹æÄÚÈÝ£º</td>
									<td>Î¥¹æÍ£¿¿
									</td>
									<td style="background-color:#e8edef;">Î¥¹æµØµã£º</td>
									<td>µØµã1
									</td>

								</tr>

								<tr>
									<td style="background-color:#e8edef;">¾Ù±¨ÈÕÆÚ£º</td>
									<td>2015-5-9
									</td>
									<td style="background-color:#e8edef;">¾Ù±¨ÈË£º</td>
									<td>ÀîÃ÷
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">ºóÐø´¦ÀíÇé¿ö£º</td>

									<td colspan="3">´ý´¦Àí

									</td>
								</tr>

								<tr>
									<td colspan="4" style="text-align:center;">
										<input type="button" class="scbtn1" name="btn" onclick="history.go(-1)" value="ÐÞ¸Ä">
										<input name="fh" type="button" value="·µ»Ø" class="scbtn1" onclick="history.go(-1)" />
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