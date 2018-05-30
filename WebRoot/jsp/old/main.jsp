<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>门户网站</title>

		<!-- Bootstrap -->
		<link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
		<link href="${contextPath}/css/font-awesome.css" rel="stylesheet">
		<link href="${contextPath}/css/style.css" rel="stylesheet">
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jsapi.js"></script>
		<script type="text/javascript" src="${contextPath}/js/format+zh_CN,default,corechart.I.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.gvChart-1.0.1.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.ba-resize.min.js"></script>
	</head>
	<body style="text-align:center">
	<div style="background:url(${contextPath}/images/topbg.gif) repeat-x;height:88px;">

    <div class="topleft">
    <a href="default.html" target="bottomFrame"><img src="${contextPath}/images/logo.png" title="系统首页" /></a>
    </div>
        
            
   <div class="topright"> 
   <div class="user">
    <span>admin</span>
    <i>消息</i>
    <b>5</b>
	<a href="#"><i><font color="#FFFFFF" style="font-size:16px;">退出</font></i></a>
    </div> 

    </div>

</div>

	<div style="width:90%;height:850px;border:solid 1px #31708f;margin:20px auto;">
	
					<div style="margin-top:20px;">
						<div style="width:45%;float:left;margin-right:2%;margin-left:3%;">
						<div class="panel panel-primary">
												<div class="panel-heading">
													<div class="row">
														<div class="col-xs-12 text-left">
															<h4 class="smart-margin-off">上海市海域使用业务管理应用</h4>
														</div>
													</div>
												</div>
												<div class="panel-body">
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="上海市海域使用业务管理系统/首页.html" ><img src=					  "${contextPath}/images/icon02-2.png" alt=""></a>
													<h5>海域可视化综合查询</h5>
												</div>
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="上海市海域使用业务管理系统/首页2.html" ><img src=					  "${contextPath}/images/icon02.png" alt=""></a>
													<h5>海洋功能区划管理</h5>
												</div>
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="上海市海域使用业务管理系统/首页3.html"  ><img src=					  "${contextPath}/images/bz_xtzcgl.png" height="45" width="45" alt=""></a>
													<h5>海域使用动态管理</h5>
												</div>
												</div>
											</div>
						</div>
						<div style="width:45%;float:left;margin-right:3%;margin-left:2%;">
						<div class="panel panel-primary">
												<div class="panel-heading">
													<div class="row">
														<div class="col-xs-12 text-left">
															<h4 class="smart-margin-off">上海市海域巡查管理应用</h4>
														</div>
													</div>
												</div>
												<div class="panel-body">
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="${contextPath}/上海市海域巡查管理系统/首页.html" ><img src= "${contextPath}/images/pdahchl.png"  height="45" width="45" alt=""></a>
													<h5>海塘巡查管理</h5>
												</div>
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="${contextPath}/上海市海域巡查管理系统/首页2.html" ><img src="${contextPath}/images/bz_db.png"  height="45" width="45" alt=""></a>
													<h5>海域海岛巡查管理</h5>
												</div>
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="${contextPath}/上海市海域巡查管理系统/首页3.html"><img src="${contextPath}/images/bz_sjzl.png"  height="45" width="45" alt=""></a>
													<h5>查询统计</h5>
												</div>
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="${contextPath}/上海市海域巡查管理系统/首页4.html"  ><img src="${contextPath}/images/gkxx.png" height="45" width="45" alt=""></a>
													<h5>状态跟踪</h5>
												</div>
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="${contextPath}/上海市海域巡查管理系统/首页5.html" ><img src="${contextPath}/images/wsdp.png" alt="" height="45" width="45"></a>
													<h5>巡查考评管理</h5>
												</div>
												</div>
											</div>
						</div>
						<div style="width:45%;float:left;margin-right:2%;margin-left:3%;">
						<div class="panel panel-primary">
												<div class="panel-heading">
													<div class="row">
														<div class="col-xs-12 text-left">
															<h4 class="smart-margin-off">上海市海底管线登陆区安全监管应用</h4>
														</div>
													</div>
												</div>
												<div class="panel-body">
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="${contextPath}/上海市海底管线登陆区安全监管系统/首页.html"  ><img src=					  "${contextPath}/images/tdyy.png" height="45" width="45"  alt=""></a>
													<h5>地波雷达信息</h5>
												</div>
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="${contextPath}/上海市海底管线登陆区安全监管系统/首页2.html"  ><img src=					  "${contextPath}/images/qwxx.png" alt="" height="45" width="45"></a>
													<h5>船舶定位信息</h5>
												</div>
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="${contextPath}/上海市海底管线登陆区安全监管系统/首页3.html"  ><img src=					  "${contextPath}/images/i03.png" height="45" width="45" alt=""></a>
													<h5>海底管线安全</h5>
												</div>
												</div>
											</div>
						</div>
						<div style="width:45%;float:left;margin-right:3%;margin-left:2%;">
						<div class="panel panel-primary">
												<div class="panel-heading">
													<div class="row">
														<div class="col-xs-12 text-left">
															<h4 class="smart-margin-off">重点海域海岛视频监视应用</h4>
														</div>
													</div>
												</div>
												<div class="panel-body">
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="#"  ><img src=					  "${contextPath}/images/jtxx.png"  height="45" width="45" alt=""></a>
													<h5>视频监视点分布</h5>
												</div>
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="#"  ><img src=					  "${contextPath}/images/cllrjk.png" alt=""></a>
													<h5>岸基监视系统</h5>
												</div>
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="#"  ><img src=					  "${contextPath}/images/ico01.png" height="45" width="45" alt=""></a>
													<h5>视频监视后台系统</h5>
												</div>
												</div>
											</div>
						</div>
						<div style="width:45%;float:left;margin-right:2%;margin-left:3%;">
						<div class="panel panel-primary">
												<div class="panel-heading">
													<div class="row">
														<div class="col-xs-12 text-left">
															<h4 class="smart-margin-off">视频资源整合</h4>
														</div>
													</div>
												</div>
												<div class="panel-body">
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="#"  ><img src=					  "${contextPath}/images/clda_zp.png"  height="45" width="45" alt=""></a>
													<h5>视频管理</h5>
												</div>
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="#" ><img src=					  "${contextPath}/images/seven_sfcl.jpg" alt="" height="45" width="45"></a>
													<h5>实时播放</h5>
												</div>
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="#"  ><img src=					  "${contextPath}/images/cljd.png" alt="" height="45" width="45"></a>
													<h5>视频预览</h5>
												</div>
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="#" ><img src=					  "${contextPath}/images/bz_bzhshgl.png"  height="45" width="45" alt=""></a>
													<h5>信息展示</h5>
												</div>
												</div>
											</div>
						</div>
						<div style="width:45%;float:left;margin-right:3%;margin-left:2%;">
						<div class="panel panel-primary">
												<div class="panel-heading">
													<div class="row">
														<div class="col-xs-12 text-left">
															<h4 class="smart-margin-off">系统管理</h4>
														</div>
													</div>
												</div>
												<div class="panel-body">
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="${contextPath}/系统管理.html" ><img src=					  "${contextPath}/images/czda.png" alt=""></a>
													<h5>用户管理</h5>
												</div>
<!--
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a hrsystem.jsphtml" ><img src=					  "images/cbxx.png" alt="" height="45" width="45"></a>
													<h5>菜单管理</h5>
												</div>
-->
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="${contextPath}/系统管理.html"  ><img src=					  "${contextPath}/images/ykll.png" alt="" height="45" width="45"></a>
													<h5>角色管理</h5>
												</div>
												<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="${contextPath}/系统管理.html" ><img src=					  "${contextPath}/images/bz_bzhjy.png" height="45" width="45" alt=""></a>
													<h5>字典管理</h5>
												</div>
<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="${contextPath}/系统管理.html" ><img src=					  "${contextPath}/images/cbxx.png" alt="" height="45" width="45"></a>
													<h5>日志管理</h5>
												</div>
												
<div style="width:80px;text-align:center;height:80px;float:left">
													<a href="${contextPath}/系统管理.html"><img src=					  "${contextPath}/images/bz_yymx.png" alt="" height="45" width="45"></a>
													<h5>海洋法律法规</h5>
												</div>
												</div>
											</div>
						</div>
					</div>
					
		</div>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="${contextPath}/js/jquery-1.11.1.js"></script>
		<script src="${contextPath}/js/bootstrap.js"></script>
		<script src="${contextPath}/js/jquery.slimscroll.js"></script>
		<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
		<script src="${contextPath}/js/gmaps.js"></script>
		<script src="${contextPath}/js/main.js"></script>
	
	
	</body>
</html>