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
    <!--
    <div class="place">
    <span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
    <ul class="placeul">
		<li><a href="#">海域使用动态管理</a></li>
		<li><a href="#">用海项目信息管理</a></li>
		<li><a href="#">详情</a></li>
    </ul>
    </div>
      -->
	<div align="center" >
	<div class="mainbox">
	<c:if test="${zhttype=='yhwzt'}">
	<div class="leftinfo1">
	<div class="listtitle3"><img src="${contextPath}/images/i02.png" width="25" height="25" />宗海图-用海位置图</div>
	<p>
       <img src="<%=basePath%>/business/business_fetchZht.do?zhtID=${hysyywHysydtYhxmZht.id}&zhttype=yhwzt" alt="鼠标放上滑动鼠标滑动放大缩小此图片" title="鼠标放上滑动鼠标滑动放大缩小此图片" onmousewheel="return bbimg(this)" width="465px" height="360px" style="cursor: pointer;" border="0" />
	</p>
	</div><br />
	</c:if>
	
	<c:if test="${zhttype=='jzt'}">
	<div class="leftinfo1">
	<div class="listtitle3"><img src="${contextPath}/images/i02.png" width="25" height="25" />宗海图-界址图</div>
	<p>
       <img src="<%=basePath%>/business/business_fetchZht.do?zhtID=${hysyywHysydtYhxmZht.id}&zhttype=jzt" alt="鼠标放上滑动鼠标滑动放大缩小此图片" title="鼠标放上滑动鼠标滑动放大缩小此图片" onmousewheel="return bbimg(this)" width="465px" height="360px" style="cursor: pointer;" border="0" />
	</p>
	</div>
	</c:if>
	</div>
	</div>
	</form>
	
    
    <script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>
  </body>
</html>
