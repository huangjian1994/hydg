<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <%@include file="../common.jsp" %>
    <%@include file="../../message.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="${contextPath}/jsp/seasProfession/css/left.css" rel="stylesheet" type="text/css"/>

    <script language="JavaScript" src="${contextPath}/jsp/seasProfession/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/jsp/seasProfession/css/easyui.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/jsp/seasProfession/css/icon.css">
    <!--<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>-->
    <script type="text/javascript" src="${contextPath}/jsp/seasProfession/js/jquery.easyui.min.js"></script>
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
        $(function () {
            //导航切换
            $(".menuson li").click(function () {
                $(".menuson li.active").removeClass("active")
                $(this).addClass("active");
            });

            $('.title').click(function () {
                var $ul = $(this).next('ul');
                $('dd').find('ul').slideUp();
                if ($ul.is(':visible')) {
                    $(this).next('ul').slideUp();
                } else {
                    $(this).next('ul').slideDown();
                }
            });
            addTab("国家资源可视化","${contextPath}/jsp/seasProfession/jsp/integratedQuery/zhcx_index.jsp");
        })
    </script>


</head>

<body style="background:#f0f9fd;">
<div style="height: 100%;width: 187px">

    <div class="lefttop"><span></span><s:property value="#session.user.role.roleName"/>：<s:property value="#session.user.name"/></div>

    <dl class="leftmenu">

        <dd>
            <div class="title">
                <span class="tle"><img src="${contextPath}/jsp/seasProfession/images/leftico01.png"/></span>海域综合查询
            </div>
            <ul class="menuson">
                <li><cite></cite>
                    <a href="#" class="easyui-linkbutton" href="#"
                       onclick="addTab('国家资源可视化','${contextPath}/jsp/seasProfession/jsp/integratedQuery/zhcx_index.jsp')">国家资源可视化</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('海域动态可视化','${contextPath}/jsp/seasProfession/jsp/integratedQuery/zhcx_hydtksh.jsp')">海域动态可视化</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('海岛动态可视化','${contextPath}/jsp/seasProfession/jsp/integratedQuery/zhcx_hddtksh.jsp')">海岛动态可视化</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('洋功能区划可视化','${contextPath}/jsp/seasProfession/jsp/integratedQuery/zhcx_hygnqhksh.jsp')">洋功能区划可视化</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('海域勘界可视化','${contextPath}/jsp/seasProfession/jsp/integratedQuery/zhcx_hykjksh.jsp')">海域勘界可视化</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('海籍可视化','${contextPath}/jsp/seasProfession/jsp/integratedQuery/zhcx_hjksh.jsp')">海籍可视化</a>
                </li>
            </ul>
        </dd>

        <dd>
            <div class="title">
                <span class="tle"><img src="${contextPath}/jsp/seasProfession/images/leftico01.png"/></span>海洋区划管理
            </div>
            <ul class="menuson">
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('信息管理','${contextPath}/jsp/seasProfession/jsp/oceanFunctionalZoning/qhgl_xxgl.jsp')">信息管理</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('辅助划分','${contextPath}/jsp/seasProfession/jsp/oceanFunctionalZoning/qhgl_fzhf.jsp')">辅助划分</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('用保护与现状跟踪','${contextPath}/jsp/seasProfession/jsp/oceanFunctionalZoning/qhgl_lygz.jsp')">用保护与现状跟踪</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('执行情况监督','${contextPath}/jsp/seasProfession/jsp/oceanFunctionalZoning/qhgl_qkjd.jsp')">执行情况监督</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('海洋功能区划发布','${contextPath}/jsp/seasProfession/jsp/oceanFunctionalZoning/qhgl_fb.jsp')">海洋功能区划发布</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('审批管理','${contextPath}/jsp/seasProfession/jsp/oceanFunctionalZoning/qhgl_sjgl.jsp')">审批管理</a>
                </li>
            </ul>
        </dd>

        <dd>
            <div class="title">
                <span class="tle"><img src="${contextPath}/jsp/seasProfession/images/leftico01.png"/></span>用海项目申请
            </div>
            <ul class="menuson">
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('项目申请','${contextPath}/jsp/seasProfession/jsp/seaProjectsApply/xmsq.jsp')">项目申请</a>
                </li>
            </ul>
        </dd>

        <dd>
            <div class="title">
                <span class="tle"><img src="${contextPath}/jsp/seasProfession/images/leftico01.png"/></span>用海项目审批
            </div>
            <ul class="menuson">
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('项目审批','${contextPath}/jsp/seasProfession/jsp/seaProjectsApply/xmsq.jsp')">项目审批</a>
                </li>
            </ul>
        </dd>

        <dd>
            <div class="title">
                <span class="tle"><img src="${contextPath}/jsp/seasProfession/images/leftico01.png"/></span>用海项目批后监管
            </div>
            <ul class="menuson">
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('用海项目动态管理','${contextPath}/jsp/seasProfession/jsp/seaProjectsSupervision/dtgl.jsp')">用海项目动态管理</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('用海项目变化预警','${contextPath}/jsp/seasProfession/jsp/seaProjectsSupervision/bhyj.jsp')">用海项目变化预警</a>
                </li>
            </ul>
        </dd>

        <dd>
            <div class="title">
                <span class="tle"><img src="${contextPath}/jsp/seasProfession/images/leftico01.png"/></span>海域勘界管理
            </div>
            <ul class="menuson">
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('矢量数据管理','${contextPath}/jsp/seasProfession/jsp/seasDemarcation/slsj.jsp')">矢量数据管理</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('划界方案综合分析','${contextPath}/jsp/seasProfession/jsp/seasDemarcation/hjfa.jsp')">划界方案综合分析</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('多媒体信息管理','${contextPath}/jsp/seasProfession/jsp/seasDemarcation/media.jsp')">多媒体信息管理</a>
                </li>
            </ul>
        </dd>

        <dd>
            <div class="title">
                <span class="tle"><img src="${contextPath}/jsp/seasProfession/images/leftico01.png"/></span>海岸线管理
            </div>
            <ul class="menuson">
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('海岸线基础信息管理','${contextPath}/jsp/seasProfession/jsp/coastlineManagement/jcxxgl.jsp')">海岸线基础信息管理</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('海岸动态监视监测管理','${contextPath}/jsp/seasProfession/jsp/coastlineManagement/dtjsjc.jsp')">海岸动态监视监测管理</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('海岸线时空分析','${contextPath}/jsp/jsp/seasProfession/coastlineManagement/skfx.jsp')">海岸线时空分析</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('海岸线规划信息管理','${contextPath}/jsp/seasProfession/jsp/coastlineManagement/ghxxgl.jsp')">海岸线规划信息管理</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('海岸线动态修订管理','${contextPath}/jsp/seasProfession/jsp/oastlineManagement/dtxdgl.jsp')">海岸线动态修订管理</a>
                </li>
            </ul>
        </dd>

        <dd>
            <div class="title">
                <span class="tle"><img src="${contextPath}/jsp/seasProfession/images/leftico01.png"/></span>海籍管理
            </div>
            <ul class="menuson">
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('海籍历史资料管理','${contextPath}/jsp/seasProfession/jsp/seaManagement/history.jsp')">海籍历史资料管理</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('海籍综合分析','${contextPath}/jsp/seasProfession/jsp/seaManagement/zhfx.jsp')">海籍综合分析</a>
                </li>
            </ul>
        </dd>

        <dd>
            <div class="title">
                <span class="tle"><img src="${contextPath}/jsp/seasProfession/images/leftico01.png"/></span>海域使用金征收管理
            </div>
            <ul class="menuson">
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('使用金征收管理','${contextPath}/jsp/seasProfession/jsp/seasUsingGold/usemoney.jsp')">使用金征收管理</a>
                </li>
            </ul>
        </dd>
        <dd>
            <div class="title">
                <span class="tle"><img src="${contextPath}/jsp/seasProfession/images/leftico01.png"/></span>海洋自然保护区管理
            </div>
            <ul class="menuson">
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('保护区基础信息管理','${contextPath}/jsp/seasProfession/jsp/oceanNatureReserve/protect_jcxx.jsp')">保护区基础信息管理</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('合法活动登记','${contextPath}/jsp/seasProfession/jsp/oceanNatureReserve/active.jsp')">合法活动登记</a>
                </li>
            </ul>
        </dd>


        <dd>
            <div class="title">
                <span class="tle"><img src="${contextPath}/jsp/seasProfession/images/leftico01.png"/></span>系统管理
            </div>
            <ul class="menuson">
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('用户管理','${contextPath}/jsp/seasProfession/jsp/systemManagement/YhglIndex.jsp')">用户管理</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('权限管理','${contextPath}/jsp/seasProfession/jsp/systemManagement/QxglIndex.jsp')">权限管理</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('菜单管理','${contextPath}/jsp/seasProfession/jsp/systemManagement/cdglIndex.jsp')">菜单管理</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('参数配置','${contextPath}/jsp/seasProfession/jsp/systemManagement/CspzIndex.jsp')">参数配置</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#"
                       onclick="addTab('数据备份与恢复','${contextPath}/jsp/seasProfession/jsp/systemManagement/SjbfIndex.jsp')">数据备份与恢复</a>
                </li>
                <li><cite></cite>
                    <a class="easyui-linkbutton" href="#" onclick="addTab('日志管理','${contextPath}/jsp/seasProfession/jsp/systemManagement/RzglIndex.jsp')">日志管理</a>
                </li>
            </ul>
        </dd>

    </dl>
</div>
<div id="tt" class="easyui-tabs tabs-posi" style="height: 100%;">

</body>
</html>
