<%@ page language="java" import="java.util.*,com.htcf.entity.User" pageEncoding="UTF-8"%>
<%
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() + request.getContextPath();
	User user = (User)request.getSession().getAttribute("user");
%>
<link href="${contextPath}/css/tc.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basepath %>/dwr/engine.js"></script>
<script type="text/javascript" src="<%=basepath %>/dwr/util.js"></script>
<script type="text/javascript" src="<%=basepath %>/dwr/interface/MessagePush.js"></script>
<script src="${contextPath}/js/tc.js"></script>
<script type="text/javascript">
	function showMessage(message){       
        var msg_json = JSON.parse(message);
        console.log(msg_json);
        //登陆弹窗
        var pop_mess = "<li>"+
             "<span style='display:inline-block;font-size:20px;line-height:1.1;'>" + msg_json.msg + "</span>"+
            "</li>"        
        pop_init("系统信息",pop_mess,msg_json.i);                
        
    }
		
	function onPageLoad(){
		MessagePush.onPageLoad(<%=user.getId() %>);
	}
	$(function(){
		dwr.engine.setActiveReverseAjax(true);
		dwr.engine.setNotifyServerOnPageUnload(true);
		onPageLoad();
		dwr.engine.setErrorHandler(function(){
		
		});
	})
</script>
