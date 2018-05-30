<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	String rootpath = "";
%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<script type="text/javascript" charset="utf-8" src="<%=basePath %>/js/jquery.js" /></script>
<!--  
<script type="text/javascript" charset="utf-8" src="${contextPath}/js/jquery-1.4.4.js" /></script>
-->
<!--<link rel="stylesheet" type="text/css" href="<%=basePath %>/js/easeui/themes/default/easyui.css">-->
<link rel="stylesheet" type="text/css" href="<%=basePath %>/js/easeui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/rylr.css">
<script type="text/javascript" src="<%=basePath %>/js/easyui-lang-zh_CN.js"></script>
<%
	response.setHeader("pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
%>
