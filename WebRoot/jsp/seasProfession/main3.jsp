<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>上海市海域使用业务管理应用</title>
	</head>
	<frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
		<frame src="${contextPath}/jsp/seasProfession/maintop.jsp?tle=hydtgl" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
		<frame src="${contextPath}/jsp/seasProfession/bottom/bottom_hydtgl.jsp" cols="187,*" frameborder="no" border="0" framespacing="0" name="bottomFrame" id="bottomFrame" title="bottomFrame" />
	</frameset>
	<noframes>
		<body>
		</body>
	</noframes>

</html>