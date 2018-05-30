<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
	<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

<script language="javascript">
	function bbimg(o){
		var zoom=parseInt(o.style.zoom, 10)||100;zoom+=event.wheelDelta/12;if (zoom>0) o.style.zoom=zoom+'%';
		return false;
	}
</script>
  </head>
  <body>
    <form name="myForm" method="post" >

	<div align="center" >
	<div class="mainbox">
	
	<div class="leftinfo1">
	<div class="listtitle3"><img src="${contextPath}/images/i02.png" width="25" height="25" />海岛巡查问题上报：照片</div>
	<p>
       <img src="<%=basePath%>/patorlReport/patorlReport_fetchReportZp.do?prID=${hyxcHdxcFxwt.id}" alt="鼠标放上滑动鼠标滑动放大缩小此图片" title="鼠标放上滑动鼠标滑动放大缩小此图片" onmousewheel="return bbimg(this)" width="465px" height="360px" style="cursor: pointer;" border="0" />
	</p>
	</div><br />
	
	
	
	</div>
	</div>
	</form>
	
    
    <script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>
  </body>
</html>
