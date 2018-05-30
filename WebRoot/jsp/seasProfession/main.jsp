<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta charset="UTF-8">
		<title>上海市海域使用业务管理应用</title>
	</head>
	<frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
		<frame src="${contextPath}/jsp/seasProfession/maintop.jsp?tle=zhcx" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
		<frame src="${contextPath}/jsp/seasProfession/bottom/bottom_zhcx.jsp" cols="187,*" frameborder="no" border="0" framespacing="0" name="bottomFrame" id="bottomFrame" title="bottomFrame" />
	</frameset>
	<noframes>
		<body>
		</body>
	</noframes>

</html>