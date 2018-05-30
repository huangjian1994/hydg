<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<%-- <link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" /> --%>
		<link href="${contextPath}/css/seasProfession/left.css" rel="stylesheet" type="text/css"/>
    	<link rel="stylesheet" type="text/css" href="${contextPath}/css/easyui.css" />
    	<link rel="stylesheet" type="text/css" href="${contextPath}/css/icon.css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.easyui.min.js"></script>
		<script>
	        function addTab(title, url) {
	            if ($('#tt').tabs('exists', title)) {
	                $('#tt').tabs('select', title);
	            } else {
	                var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
	                $('#tt').tabs('add', {
	                    title: title,
	                    content: content,
	                    closable: true
	                });
	            }
	        }
	    </script>
		<script type="text/javascript">
			$(function() {
				//导航切换
				$(".menuson li").click(function() {
					$(".menuson li.active").removeClass("active")
					$(this).addClass("active");
				});

				$('.title').click(function() {
					var $ul = $(this).next('ul');
					$('dd').find('ul').slideUp();
					if($ul.is(':visible')) {
						$(this).next('ul').slideUp();
					} else {
						$(this).next('ul').slideDown();
					}
				});

				var firsturlname = "";
				var firsturl = "";
				var file = "${param.file}";
				if(file=="yhgl"){
					firsturl="/user/user_list.do";
					firsturlname="用户管理";
				}else if(file=="jsgl"){
					firsturl="/role/role_list.do";
					firsturlname="角色管理";
				}else if(file=="cdgl"){
					firsturl="/menu/menu_list.do";
					firsturlname="菜单管理";
				}else if(file=="zdgl"){
					firsturl="/config/config_list.do";
					firsturlname="字典管理";
				}else if(file=="rzgl"){
					firsturl="/log/log_list.do";
					firsturlname="日志管理";
				}else if(file=="flfg"){
					firsturl="/seaLaw/law_loadLawPage.do";
					firsturlname="海洋法律法规";
				}else{
					firsturlname = document.getElementById("firsturlname").value;
					firsturl = document.getElementById("firsturl").value;
				}
				
				if(firsturl == ""){
					addTab("无权限", "${contextPath}/jsp/noAuth.jsp");
				}else{
					addTab(firsturlname, "${contextPath}"+firsturl);
				}
				
			})
		</script>

	</head>

	<body style="background:#f0f9fd;">
		<div class="lefttop"><span></span><s:property value="#session.user.role.roleName" />：<s:property value="#session.user.name" /></div>

		<dl class="leftmenu">
			<s:iterator  value="#session.menusMap.get('xtgl')" status="stu">
				<dd>
					<div class="title">
						<span class="tle pr"><img src="${contextPath}/images/seasProfession/leftico01.png"/></span>
						<s:if test="resourceURL == null">
						<s:property value="menuName"/>
						</s:if>
						<s:if test="resourceURL != null">
						<a id="<s:property value='code'/>" class="easyui-linkbutton" href="#" onclick="addTab('<s:property value="menuName"/>','${contextPath}<s:property value='resourceURL'/>')">
						<s:property value="menuName"/></a>
						</s:if>
					</div>
					
					<ul class="menuson">
						<s:iterator  value="subList">
						<li><cite></cite>
							<a id="<s:property value='code'/>" class="easyui-linkbutton" href="#" onclick="addTab('<s:property value="menuName"/>','${contextPath}<s:property value='resourceURL'/>')">
							<s:property value="menuName"/></a>
						</li>
						</s:iterator>
					</ul>
				</dd>
			</s:iterator>
		</dl>
		<div id="tt" class="easyui-tabs tabs-posi" style="height: 100%;">
		
		<input name="firsturlname" id="firsturlname" value="" type="hidden" />
		<input name="firsturl" id="firsturl" value="" type="hidden" />
		<c:forEach items="${ firsturlList }" var="r" varStatus="j">
			<c:if test="${r.code=='xtgl' }">
			<input name="firsturlname1" id="firsturlname1" value="${r.firsturlname }" type="hidden" />
			<input name="firsturl1" id="firsturl1" value="${r.firsturl }" type="hidden" />
			<script>
			document.getElementById("firsturlname").value = document.getElementById("firsturlname1").value;
			document.getElementById("firsturl").value = document.getElementById("firsturl1").value;
			</script>
			</c:if>
		</c:forEach>
		</div>
		
		
	</body>

</html>