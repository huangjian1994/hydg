<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<%@include file="../../message.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="${contextPath}/js/jquery.js"></script>

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

            $(function(){
                //导航切换
                $(".menuson li").click(function(){
                    $(".menuson li.active").removeClass("active")
                    $(this).addClass("active");
                });

                $('.title').click(function(){
                    var $ul = $(this).next('ul');
                    $('dd').find('ul').slideUp();
                    if($ul.is(':visible')){
                        $(this).next('ul').slideUp();
                    }else{
                        $(this).next('ul').slideDown();
                    }
                });
                addTab("地波雷达信息", "${contextPath}/jsp/seabedPipeline/jsp/groundWaveRadarInformation/dbldxx_index.jsp");

            })
		</script>
	</head>

	<body style="background:#f0f9fd;">
		<div class="lefttop"><span></span><s:property value="#session.user.role.roleName" />：<s:property value="#session.user.name" /></div>

		<dl class="leftmenu">

			<dd>
				<div class="title">
					<span><img src="${contextPath}/images/seabedPipeline/leftico01.png" /></span>
					<a class="easyui-linkbutton" href="#" onclick="addTab('地波雷达信息','${contextPath}/jsp/seabedPipeline/jsp/groundWaveRadarInformation/dbldxx_index.jsp')">地波雷达信息</a>

				</div>

			</dd>
			<dd>
				<div class="title">
					<span><img src="${contextPath}/images/seabedPipeline/leftico01.png" /></span>
					<a class="easyui-linkbutton" href="#" onclick="addTab('船舶定位信息','${contextPath}/jsp/seabedPipeline/jsp/shipPositioningInformation/cbdwxx_index.jsp')">船舶定位信息</a>

					</a>
				</div>

			</dd>

			<dd>
				<div class="title">
					<span><img src="${contextPath}/images/seabedPipeline/leftico01.png" /></span>海底管线安全
				</div>
				<ul class="menuson">
					<li><cite></cite>
						<a href="${contextPath}/jsp/seabedPipeline/jsp/seabedPipelineSafe/hdgxaq_index.jsp" target="rightFrame">海底管线可视化</a><i></i></li>
					<li><cite></cite>
						<a href="${contextPath}/jsp/seabedPipeline/jsp/seabedPipelineSafe/hdgxaq_cbjkxxksh.jsp" target="rightFrame">船舶监控信息可视化</a><i></i></li>
					<li><cite></cite>
						<a href="#" onclick="znyj()" target="rightFrame">智能预警</a><i></i></li>
					<li><cite></cite>
						<a href="${contextPath}/jsp/seabedPipeline/jsp/seabedPipelineSafe/hdgxaq_hztj.jsp" target="rightFrame">汇总统计</a><i></i></li>
					<li><cite></cite>
						<a href="${contextPath}/jsp/seabedPipeline/jsp/seabedPipelineSafe/hdgxaq_wgjbgl.jsp" target="rightFrame">违规举报管理</a><i></i></li>
				</ul>
			</dd>
			<!--
    <dd>
    <div class="title">
    <span><img src="${contextPath}/images/seabedPipeline/leftico01.png" /></span>systemManagement
    </div>
    	<ul class="menuson">
		 <li ><cite></cite><a href="${contextPath}/jsp/seabedPipeline/systemManagement/YhglIndex.jsp" target="rightFrame">用户管理</a><i></i></li>
		 <li ><cite></cite><a href="${contextPath}/jsp/seabedPipeline/systemManagement/QxglIndex.jsp" target="rightFrame">权限管理</a><i></i></li>
         <li ><cite></cite><a href="${contextPath}/jsp/seabedPipeline/systemManagement/cdglIndex.jsp" target="rightFrame">菜单管理</a><i></i></li>
		 <li ><cite></cite><a href="${contextPath}/jsp/seabedPipeline/systemManagement/CspzIndex.jsp" target="rightFrame">参数配置</a><i></i></li>
		 <li ><cite></cite><a href="${contextPath}/jsp/seabedPipeline/systemManagement/SjbfIndex.jsp" target="rightFrame">数据备份与恢复</a><i></i></li>
		 <li ><cite></cite><a href="${contextPath}/jsp/seabedPipeline/systemManagement/RzglIndex.jsp" target="rightFrame">日志管理</a><i></i></li>
        </ul>    
     </dd>
	-->
		</dl>

	</body>

</html>