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
					$(".menuson li.active").removeClass("active");
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
				//显示菜单页面
				
				function closeMenu(){
					for(var i = 0;i < $(".menuson").length;i++){
						$(".menuson").eq(i).css("display","none");
					}
					$(".menuson").eq(res.index).css("display","block");
					$(".menuson li.active").removeClass("active");
					$($(".menuson").eq(res.index).children()[0]).addClass("active");
				}
                addTab('地面巡查采集上报管理', '${contextPath}/seaPatorl/swPatorl_loadSprs.do');
                closeMenu();				
			})
		</script>

	</head>

	<body style="background:#f0f9fd;">
		<div style="height: 100%;width: 187px">
			<div class="lefttop"><span></span><s:property value="#session.user.role.roleName"/>：<s:property value="#session.user.name"/></div>
			<dl class="leftmenu">
				
				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seasInspection/leftico01.png" /></span>海塘巡查管理
					</div>
					<ul class="menuson">
						<li class="active"><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('地面巡查采集上报管理','${contextPath}/seaPatorl/swPatorl_loadSprs.do')">地面巡查采集上报管理</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('系统比对','${contextPath}/seaPatorl/swPatorl_loadCompares.do')">系统比对</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="javascript:void(0);" onclick="addTab('违法信息上报与反馈','${contextPath}/seaPatorl/swPatorl_loadSprs.do?op=1')">违法信息上报与反馈</a></li>
					</ul>
				</dd>

				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seasInspection/leftico01.png" /></span>海域海岛巡查
					</div>
					<ul class="menuson">
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('巡查问题上报','${contextPath}/jsp/seasInspection/jsp/islandInspection/hyhdxc_index.jsp')">巡查问题上报</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('巡查任务计划','${contextPath}/jsp/seasInspection/jsp/islandInspection/hyhdxc_rwxp.jsp')">巡查任务计划</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('巡查任务审核','${contextPath}/jsp/seasInspection/jsp/islandInspection/hyhdxc_xcrwts.jsp')">巡查任务审核</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('巡查信息反馈','${contextPath}/jsp/seasInspection/jsp/islandInspection/hyhdxc_xxfk.jsp')">巡查信息反馈</a></li>

					</ul>
				</dd>

				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seasInspection/leftico01.png" /></span>查询统计
					</div>
					<ul class="menuson">
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('分类管理','${contextPath}/jsp/seasInspection/jsp/inquireStatistics/cxtj_index.jsp')">分类管理</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('综合查询','${contextPath}/seaPatorl/swPatorl_loadSeawallPatorlThroughWs.do?reload=1')">综合查询</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('项目统计','${contextPath}/jsp/seasInspection/jsp/inquireStatistics/cxtj_xmtj.jsp')">项目统计</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('状态统计','${contextPath}/seaPatorl/swPatorl_statistic.do')">状态统计</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('海域区域统计','${contextPath}/jsp/seasInspection/jsp/inquireStatistics/cxtj_hyqytj.jsp')">海域区域统计</a></li>
					</ul>
				</dd>

				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seasInspection/leftico01.png" /></span>状态跟踪
					</div>
					<ul class="menuson">
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('实时监控','${contextPath}/jsp/seasInspection/jsp/stausTrack/ztgz_ssjk.jsp')">实时监控</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('轨迹回放','${contextPath}/jsp/seasInspection/jsp/stausTrack/ztgz_gjhf.jsp')">轨迹回放</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('巡查区域查询','${contextPath}/jsp/seasInspection/jsp/stausTrack/ztgz_xcqy.jsp')">巡查区域查询</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('信息状态查询','${contextPath}/jsp/seasInspection/jsp/stausTrack/ztgz_xxzt.jsp')">信息状态查询</a></li>
					</ul>
				</dd>

				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seasInspection/leftico01.png" /></span>巡查考评管理
					</div>
					<ul class="menuson">
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('巡查人员考核评价统计','${contextPath}/patorl/patorl_fetchXckpRykpTj.do')">巡查人员考核评价统计</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('巡查人员考核评价管理','${contextPath}/patorl/patorl_fetchXckhRykh.do')">巡查人员考核评价管理</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('巡查单位考核统计','${contextPath}/patorl/patorl_fetchXckpDwkpTj.do')">巡查单位考核统计</a></li>
						<li><cite></cite>
							<a class="easyui-linkbutton" href="#" onclick="addTab('巡查单位考核管理','${contextPath}/patorl/patorl_fetchXckpDwkh.do')">巡查单位考核管理</a></li>

					</ul>
				</dd>
			</dl>
		</div>
		<div id="tt" class="easyui-tabs tabs-posi" style="height: 100%;"></div>
	</body>

</html>