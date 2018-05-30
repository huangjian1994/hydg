<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>�ز��״���Ϣ</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>
	<script>
		function zdGL() {
			alert("�Զ������ɹ���");
		}

		function mbXZ() {
			alert("ģ�����سɹ���");
		}

		function plSC() {
			alert("�����ϴ��ɹ���");
			window.location = 'cljd_clgl.html';
		}
	</script>

	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seabedPipeline/ico01.png" width="22" height="22" />λ�ã�</span>
			<ul class="placeul">
				<li>
					<a href="#">�ز��״���Ϣ</a>
				</li>
			</ul>
		</div>
		<div align="center">

			<div class="mainbox">
				<div class="leftinfo1">
					<div class="listtitle3">
						<img src="${contextPath}/images/seabedPipeline/i02.png" width="25" height="25" />�޸���Ϣ
					</div>

					<div id="usual1" class="usual">

						<div id="tab1" class="tabson">
							<table width="80%" align="center" style="text-align:center;" class="tableXQ" cellSpacing='12' cellPadding='12'>
								<tr>
									<td style="background-color:#e8edef;">Ŀ���״</td>
									<td><input name="" type="text" class="scinput" value="�״�1" style="width:280px;height:20px;" />
									</td>

								</tr>
								<tr>

									<td style="background-color:#e8edef;">�״���ţ�</td>
									<td><input name="" type="text" class="scinput" value="���1" style="width:280px;height:20px;" />
									</td>

								</tr>
								<tr>
									<td style="background-color:#e8edef;">ʱ�䣺</td>
									<td><input name="" type="text" class="scinput" value="2012-5-6" style="width:280px;height:20px;" />
									</td>

								</tr>
								<tr>
									<td style="background-color:#e8edef;">Ŀ���ţ�</td>
									<td><input name="" type="text" class="scinput" value="bk213" style="width:280px;height:20px;" />
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">���룺</td>
									<td><input name="" type="text" class="scinput" value="������ǧ��" style="width:280px;height:20px;" />
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">��γ�ȣ�</td>
									<td><input name="" type="text" class="scinput" value="��γ39��" style="width:280px;height:20px;" />
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">���٣�</td>
									<td><input name="" type="text" class="scinput" value="����2km/h" style="width:280px;height:20px;" />
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">����</td>
									<td><input name="" type="text" class="scinput" value="����15��" style="width:280px;height:20px;" />
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:center;">
										<input type="button" class="scbtn1" name="btn" onclick="history.go(-1)" value="����">
										<input name="fh" type="button" value="����" class="scbtn1" onclick="history.go(-1)" />
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