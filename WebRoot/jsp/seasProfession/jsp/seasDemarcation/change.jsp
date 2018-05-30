<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>数据格式选择</title>
	</head>

	<body>
	<form method="post" enctype='multipart/form-data'>
		<div>
			<p>请选择数据格式：</p>
			<input name="group1" type="radio" value="CAD" checked="checked" />CAD
			<input name="group1" type="radio" value="SHP" />SHP
			<input name="group1" type="radio" value="GeoDatabase" />GeoDatabase
			<p>另存为：
				<input name="picture" type="file" class="scinput" value="" style="width:180px;height:20px;" />
			</p>
		</div>
		</form>
	</body>

</html>