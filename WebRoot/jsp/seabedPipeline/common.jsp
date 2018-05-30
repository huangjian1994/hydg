<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<script type="text/javascript" src="${contextPath}/js/My97DatePicker/WdatePicker.js" ></script>
<script type="text/javascript" language="JavaScript" src="${contextPath}/js/jquery.js"></script>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	String rootpath = "";
%>

<%
	response.setHeader("pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
%>
