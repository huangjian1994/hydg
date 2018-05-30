<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<%@include file="../../message.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>上海市海域巡查管理系统</title>
		<!--<link href="${contextPath}/jsp/seasInspection/css/style.css" rel="stylesheet" type="text/css" />-->
		<link href="${contextPath}/css/left.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/icon.css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.easyui.min.js"></script>		
		<script>
			function addTab(title, url) {
				if($('#tt').tabs('exists', title)) {
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
			var firsturlname = document.getElementById("firsturlname").value;
			var firsturl=document.getElementById("firsturl").value;
			if(firsturl == ""){
				addTab("无权限", "${contextPath}/jsp/noAuth.jsp");
			}else{
				addTab(firsturlname, "${contextPath}"+firsturl);
			}
			//addTab('地面巡查采集上报管理', '${contextPath}/seaPatorl/swPatorl_loadSprs.do');
		})
		
		
		</script>

	</head>

	<body style="background:#f0f9fd;">
		<div style="height: 100%;width: 187px">
			<div class="lefttop"><span></span><s:property value="#session.user.role.roleName"/>：<s:property value="#session.user.name"/></div>
			<dl class="leftmenu">
				<s:iterator  value="#session.menusMap.get('htxcgl')" status="stu">
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
			<!-- 
				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seasInspection/leftico01.png" /></span>海塘巡查管理
					</div>
					<ul class="menuson">
						<li class="active"><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('地面巡查采集上报管理','${contextPath}/seaPatorl/swPatorl_loadSprs.do')">地面巡查采集上报管理</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('系统比对','${contextPath}/jsp/seasInspection/jsp/seawallInspectionManagement/xtbd.jsp')">系统比对</a></li>
						<li><cite></cite>
							<a href="#">违法信息上报与反馈</a></li>
					</ul>
				</dd>
			 -->
			</dl>
		</div>

		<div id="tt" class="easyui-tabs tabs-posi" style="height: 100%;">
		<input name="firsturlname" id="firsturlname" value="" type="hidden" />
		<input name="firsturl" id="firsturl" value="" type="hidden" />
		<c:forEach items="${ firsturlList }" var="r" varStatus="j">
			<c:if test="${r.code=='htxcgl' }">
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