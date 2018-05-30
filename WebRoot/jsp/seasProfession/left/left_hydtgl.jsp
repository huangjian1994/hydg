<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<%@include file="../../message.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/seasProfession/left.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/icon.css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.easyui.min.js"></script>
		<script>
			function addTab(title, url) {
				if($('#tt').tabs('exists', title)) {
					$('#tt').tabs('select', title);
				} else {
					var content = '<iframe name="rightFrame" id="rightFrame" scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
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
				//addTab("用海项目信息管理", "${contextPath}/business/business_fetchYhxm.do");
			})
		</script>

	</head>

	<body style="background:#f0f9fd;">
		<div style="height: 100%;width: 187px">

			<div class="lefttop"><span></span><s:property value="#session.user.role.roleName" />：<s:property value="#session.user.name" /></div>
			
				<dl class="leftmenu">
				
				<s:iterator  value="#session.menusMap.get('hysydtgl')" status="stu">
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
						<span class="tle"><img src="${contextPath}/images/seasProfession/leftico01.png"/></span>
						<a class="easyui-linkbutton" href="#" onclick="addTab('用海项目信息管理','${contextPath}/business/business_fetchYhxm.do')">用海项目信息管理</a>
					</div>
				</dd>
				
				<dd>
					<div class="title">
						<span class="tle pr"><img src="${contextPath}/images/seasProfession/leftico01.png"/></span>用海项目批后监管
					</div>
					<ul class="menuson">
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('用海项目动态管理','${contextPath}/business/business_fetchYhxmdtgl.do')">用海项目动态管理</a>
						</li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('用海项目变化预警','${contextPath}/business/business_fetchYjxm.do')">用海项目变化预警</a>
						</li>
					</ul>
				</dd>

				<dd>
					<div class="title">
						<span class="tle pr"><img src="${contextPath}/images/seasProfession/leftico01.png"/></span>海域勘界管理
					</div>
					<ul class="menuson">
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('矢量数据管理','${contextPath}/seaDemarcation/seaDemarcation_fetchSlsj.do')">矢量数据管理</a>
						</li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('划界方案综合分析','${contextPath}/jsp/seasProfession/jsp/hysydt/hykj/hykj_hjfa.jsp')">划界方案综合分析</a>
						</li>
						
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('多媒体信息管理','${contextPath}/seaDemarcation/seaDemarcation_fetchDmtxx.do')">多媒体信息管理</a>
						</li>
					</ul>
				</dd>

				<dd>
					<div class="title">
						<span class="tle pr"><img src="${contextPath}/images/seasProfession/leftico01.png"/></span>海岸线管理
					</div>
					<ul class="menuson">
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海岸线基础信息管理','${contextPath}/dgiff/dgiff_haxjcxxInfo.do')">海岸线基础信息管理</a>
						</li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海岸动态监视监测管理','${contextPath}/dgiff/dgiff_JsjcListView.do')">海岸动态监视监测管理</a>
						</li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海岸线时空分析','${contextPath}/jsp/seasProfession/jsp/coastlineManagement/skfx.jsp')">海岸线时空分析</a>
						</li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海岸线规划信息管理','${contextPath}/dgiff/dgiff_fetchHaxGhxxList.do')">海岸线规划信息管理</a>
						</li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海岸线动态修订管理','${contextPath}/jsp/seasProfession/jsp/coastlineManagement/dtxdgl.jsp')">海岸线动态修订管理</a>
						</li>
						
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海岸线调查统计','${contextPath}/dgiff/dgiff_dctjListView.do')">海岸线调查统计</a>
						</li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海岸线整治修复','${contextPath}/dgiff/dgiff_fetchHaxZzxfList.do')">海岸线整治修复</a>
						</li>
					</ul>
				</dd>

				<dd>
					<div class="title">
						<span class="tle pr"><img src="${contextPath}/images/seasProfession/leftico01.png"/></span>海籍管理
					</div>
					<ul class="menuson">
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海籍历史资料管理','${contextPath}/seaRecord/seaRecord_fetchYhxm.do')">海籍历史资料管理</a>
						</li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海籍综合分析','${contextPath}/seaRecord/seaRecord_fetchHjzhfx.do')">海籍综合分析</a>
						</li>
					</ul>
				</dd>

				<dd>
					<div class="title">
						<span class="tle pr"><img src="${contextPath}/images/seasProfession/leftico01.png"/></span>海域使用金征收管理
					</div>
					<ul class="menuson">
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海域使用金缴纳','${contextPath}/seaUseGold/seaUseGold_fetchHysyjList.do')">海域使用金缴纳</a>
						</li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海域使用金缴纳通知','${contextPath}/seaUseGold/seaUseGold_fetchZhxxList.do')">海域使用金缴纳通知</a>
						</li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海域使用金征收标准','${contextPath}/seaUseGold/seaUseGold_fetchZsbzIndex.do')">海域使用金征收标准</a>
						</li>
					</ul>
				</dd>

				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seasProfession/leftico01.png"/></span>
						<a class="easyui-linkbutton" href="#" onclick="addTab('保护区基础信息管理','${contextPath}/ocean/ocean_oceanNature.do')">海洋自然保护区信息</a>
					</div>

				</dd>
				<dd>
					<div class="title">
						<span class="tle pr"><img src="${contextPath}/images/seasProfession/leftico01.png"/></span>统计分析
					</div>
					<ul class="menuson">
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('地面监视监测报告','${contextPath}/statisticalAnalysis/statisticalAnalysis_fetchDmjsjcJhzfqk.do')">地面监视监测报告</a>
						</li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海域使用统计数据','${contextPath}/statisticalAnalysis/statisticalAnalysis_fetchHysytj.do')">海域使用统计数据</a>
						</li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海域使用现状图','${contextPath}/statisticalAnalysis/statisticalAnalysis_fetchHysyxzt.do')">海域使用现状图</a>
						</li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海域资源价值指标统计','${contextPath}/statisticalAnalysis/statisticalAnalysis_fetchHyzyjzzb.do')">海域资源价值指标统计</a>
						</li>
					</ul>
				</dd>
				 -->
				
			</dl>
			
		</div>
		

		<div id="tt" class="easyui-tabs tabs-posi" style="height: 100%;">
		<input name="firsturlname" id="firsturlname" value="" type="hidden" />
		<input name="firsturl" id="firsturl" value="" type="hidden" />
		<c:forEach items="${ firsturlList }" var="r" varStatus="j">
			<c:if test="${r.code=='hysydtgl' }">
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