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
	</script>

	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />λ�ã�</span>
			<ul class="placeul">
				<li>
					<a href="#">����Ѳ�����</a>
				</li>
				<li>
					<a href="#">������ǲ</a>
				</li>
				<li>
					<a href="#">�����޸�</a>
				</li>
			</ul>
		</div>
		<div align="center">

			<div class="mainbox">
				<div class="leftinfo1">
					<div class="listtitle3">
						<img src="${contextPath}/images/seasInspection/i02.png" width="25" height="25" />�����޸�
					</div>

					<table width="80%" align="center" style="text-align:left;" class="tableXQ">
						<tr>
							<td style="background-color:#e8edef;">��Ŀ��ţ�</td>
							<td><input name="" type="text" class="scinput" value="20160926" style="width:180px;height:20px;" /></td>
							<td style="background-color:#e8edef;">��Ŀ��ƣ�</td>
							<td><input name="" type="text" class="scinput" value="Χ������" style="width:180px;height:20px;" /></td>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">��Ŀ���ͣ�</td>
							<td><input name="" type="text" class="scinput" value="�ɵ�������Ӽ��" style="width:180px;height:20px;" /></td>
							<td style="background-color:#e8edef;">������ƣ�</td>
							<td><input name="" type="text" class="scinput" value="��" style="width:180px;height:20px;" /></td>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">����ʱ�䣺</td>
							<td><input name="" type="text" class="scinput" value="2016-09-26" style="width:180px;height:20px;" /></td>
							<td style="background-color:#e8edef;">�����ˣ�</td>
							<td><input name="" type="text" class="scinput" value="����" style="width:180px;height:20px;" /></tr>
						<tr>
							<td style="background-color:#e8edef;">�Ƿ���ǲ��</td>
							<td><input name="" type="text" class="scinput" value="��" style="width:180px;height:20px;" /></td>
							<td style="background-color:#e8edef;">�Ƿ�˲飺</td>
							<td><input name="" type="text" class="scinput" value="��" style="width:180px;height:20px;" /></td>
						</tr>
						<tr>
							<td width="20%" style="background-color:#e8edef;">ͼƬ�����</td>
							<td width="30%"><img src="${contextPath}/images/seasInspection/img10.png"></td>
							<td width="20%" style="background-color:#e8edef;">��ע��</td>
							<td width="30%"><input name="" type="text" class="scinput" value="��" style="width:180px;height:20px;" /></td>
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