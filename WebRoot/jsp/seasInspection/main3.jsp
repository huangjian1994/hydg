<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>上海市海域巡查管理应用</title>
        <script src="${contextPath}/js/tc.js"></script>
        <script>
            function showMessage(message){
                var msg_json = JSON.parse(message);
                //登陆弹窗
                var pop_mess = "<li><img src="+imgDl+" alt='' style='width:30px;height:30px;'>"+
                     "<span style='display:inline-block;font-size:20px;line-height:1.1;'>" + msg_json.msg + "</span>"+
                    "</li>"        
                pop_init("系统信息",pop_mess,msg_json.i);                
                
            }
        </script>
  
  
	</head>
	<frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
		<frame src="${contextPath}/jsp/seasInspection/maintop.jsp?tle=2" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
		<frame src="${contextPath}/jsp/seasInspection/bottom/bottom3.jsp" cols="187,*" frameborder="no" border="0" framespacing="0" name="bottomFrame" id="bottomFrame" title="bottomFrame" />
	</frameset>
	<noframes>
		<body>
		</body>
	</noframes>

</html>