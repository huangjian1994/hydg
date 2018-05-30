<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>
<%@include file="../message.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>上海市海域巡查管理应用</title>
        <script src="${contextPath}/js/tc.js"></script>
        
	</head>

	<frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
		<frame src="${contextPath}/jsp/seasInspection/maintop.jsp?tle=0" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
		<frame src="${contextPath}/jsp/seasInspection/bottom/bottom.jsp" cols="187,*" frameborder="no" border="0" framespacing="0" name="bottomFrame" id="bottomFrame" title="bottomFrame" />
		<!--<noframe></noframe>-->
	</frameset>
	<noframes>

		<body>
            
		</body>
	</noframes>

</html>