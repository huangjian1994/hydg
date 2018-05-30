<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>�ޱ����ĵ�</title>
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
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />λ�ã�</span>
			<ul class="placeul">
				<li>
					<a href="#">����Ѳ�����</a>
				</li>
				<li>
					<a href="#">�������</a>
				</li>
				<li>
					<a href="#">��������</a>
				</li>
			</ul>
		</div>
		<div align="center">

			<div class="mainbox">
				<div class="leftinfo1">
					<div class="listtitle3">
						<img src="${contextPath}/images/seasInspection/i02.png" width="25" height="25" />��������
					</div>

					<table width="80%" align="center" style="text-align:left;" class="tableXQ">
						<tr>
							<td style="background-color:#e8edef;">�¼���ţ�</td>
							<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
							</td>
							<td style="background-color:#e8edef;">�¼����⣺</td>
							<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
							</td>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">�����ˣ�</td>
							<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
							</td>
							<td style="background-color:#e8edef;">����ʱ�䣺</td>
							<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
							</td>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">������ͣ�</td>
							<td>
								<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
									<option value="">-��ѡ��-</option>
									<option value="�״μ��" selected="selected">�״μ��</option>
									<option value="����˲���">����˲���</option>
									<option value="�������ս��¼��">�������ս��¼��</option>
								</select>
							</td>
							<td style="background-color:#e8edef;">��Ŀ���ͣ�</td>
							<td>
								<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
									<option value="">-��ѡ��-</option>
									<option value="�ص�Χ��ڽ���Ŀ������Ӽ��" selected="selected">�ص�Χ��ڽ���Ŀ������Ӽ��</option>
									<option value="�ɵ�������Ӽ��">�ɵ�������Ӽ��</option>
								</select>
							</td>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">��������</td>
							<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
							<td style="background-color:#e8edef;">�ϴ�ͼƬ��</td>
							<td>
								<form method="post" enctype='multipart/form-data'><input name="picture" type="file" class="scinput" value="" style="width:180px;height:20px;" /></form>
							</td>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">�ɸ�˭��</td>
							<td colspan="3"><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
						</tr>

						<tr>
							<td colspan="4" style="text-align:center;">
								<input type="button" class="scbtn1" name="btn" onclick="window.location='dmcjsb.jsp'" value="����">
								<input name="fh" type="button" value="����" class="scbtn1" onclick="window.location='dmcjsb.jsp'" />
							</td>
						</tr>
					</table>

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