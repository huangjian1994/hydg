<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<html lang="en" class="no-js">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>上海市海域动态监视检测管理系统</title>
		<meta name="description" content="Card Expansion Effect with SVG clipPath" />
		<meta name="keywords" content="clipPath, svg, effect, layout, expansion, images, grid, polygon" />
		<meta name="author" content="Claudio Calautti for Codrops" />		
		<link rel="shortcut icon" href="favicon.ico">
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/style.css" />
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/normalize.css" />
	    <link rel="stylesheet" type="text/css" href="${contextPath}/fonts/font-awesome-4.3.0/css/font-awesome.min.css" />
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/homepage.css" />
	    <!--必要样式-->
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/card-4.css" />
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/pattern-4.css" />	    
	</head>
	<body class="demo-4">		
		<div class="container" id="scorll">	
	        <header class="codrops-header">
	            <div style="width: 100%; height: 88px; overflow: hidden; position: relative;">
					<img alt="" src="${contextPath}/images/bg.png" style="z-index: -100; width: 100%; height: 88px; position: absolute; left: 0; top: 0">
					
					<div class="topleft">
						<a href="${contextPath}/jsp/homepage.jsp"> <img src="${contextPath}/images/logo.png" title="上海市海域动态监视检测管理系统" />
						</a>
					</div>
					<div class="topright">
						<div class="user">
							<a href="${contextPath}/user/user_edit_maintop.do?method=init" title="用户修改" target="_blank"> <span><s:property value="#session.user.role.roleName" />：<s:property value="#session.user.name" />
							</span> </a>
							<a href="${contextPath}/user/user_logOut.do"> <i>退出</i> </a>
						</div>
					</div>
				</div>
	        </header>
			
	        <div class="content">
	            <!-- trianglify pattern container -->
	            <div class="pattern pattern--hidden"></div>
	            <!-- cards -->
	            <div class="wrapper">
	                <div class="card">
	                    <div class="card__container card__container--closed">
	                        <svg class="card__image" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1920 1200" preserveAspectRatio="xMidYMid slice">
	                            <defs>
	                                <clipPath id="clipPath1">
	                                    <polygon class="clip" points="0,1200 0,0 1920,0 1920,1200"></polygon>
	                                </clipPath>
	                            </defs>
	                            <image clip-path="url(#clipPath1)" width="1920" height="1200" xlink:href="${contextPath}/images/g.jpg"></image>
	                        </svg>
	                        <div class="card__content">
								<i class="card__btn-close fa fa-times"></i>
								<div class="card__caption">
									<h2 class="card__title">上海市海域使用业务管理应用</h2>									
								</div>
								<div class="card__copy">
									<div class="panel-body">
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/seasProfession/main.jsp"> <img src="${contextPath}/images/main/dtyy.png" title="地图应用" /></a>
											<h5>地图应用</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/seasProfession/main5.jsp"> <img src="${contextPath}/images/main/27.png" title="海域可视化综合查询" /></a>
											<h5>海域可视化综合查询</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/seasProfession/main2.jsp"> <img src="${contextPath}/images/main/22.png" title="海洋功能区划管理" /></a>
											<h5>海洋功能区划管理</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/seasProfession/main3.jsp"> <img src="${contextPath}/images/main/24.png" title="海域使用动态管理" /></a>
											<h5>海域使用动态管理</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/seasProfession/main4.jsp"> <img src="${contextPath}/images/main/28.png" title="内外部接口" /></a>
											<h5>内外部接口</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
	                </div>
	                <div class="card">
	                    <div class="card__container card__container--closed">
	                        <svg class="card__image" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1920 1200" preserveAspectRatio="xMidYMid slice">
	                            <defs>
	                                <clipPath id="clipPath2">
	                                    <polygon class="clip" points="0,1200 0,0 1920,0 1920,1200"></polygon>
	                                </clipPath>
	                            </defs>
	                            <image clip-path="url(#clipPath2)" width="1920" height="1200" xlink:href="${contextPath}/images/h.jpg"></image>
	                        </svg>
	                        <div class="card__content">
								<i class="card__btn-close fa fa-times"></i>
								<div class="card__caption">
									<h2 class="card__title">上海市海域巡查管理应用</h2>
								</div>
								<div class="card__copy">
									<div class="panel-body">
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/seasInspection/main.jsp"> <img src="${contextPath}/images/main/25.png" title="海塘巡查管理"></a>
											<h5>海塘巡查管理</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/seasInspection/main2.jsp"> <img src="${contextPath}/images/main/23.png" title="海域海岛巡查管理"></a>
											<h5>海域海岛巡查管理</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/seasInspection/main3.jsp"> <img src="${contextPath}/images/main/8.png" title="查询统计"></a>
											<h5>查询统计</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/seasInspection/main4.jsp"> <img src="${contextPath}/images/main/26.png" title="状态跟踪"></a>
											<h5>状态跟踪</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/seasInspection/main5.jsp"> <img src="${contextPath}/images/main/21.png" title="巡查考评管理"></a>
											<h5>巡查考评管理</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
	                </div>
	                <div class="card">
	                    <div class="card__container card__container--closed">
	                        <svg class="card__image" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1920 1200" preserveAspectRatio="xMidYMid slice">
	                            <defs>
	                                <clipPath id="clipPath3">
	                                    <polygon class="clip" points="0,1200 0,0 1920,0 1920,1200"></polygon>
	                                </clipPath>
	                            </defs>
	                            <image clip-path="url(#clipPath3)" width="1920" height="1200" xlink:href="${contextPath}/images/i.jpg"></image>
	                        </svg>
	                        <div class="card__content">
								<i class="card__btn-close fa fa-times"></i>
								<div class="card__caption">
									<h2 class="card__title">上海市海底管线登陆区安全监管应用</h2>
								</div>
								<div class="card__copy">
									<div class="panel-body">
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/seabedPipeline/main.jsp"> <img src="${contextPath}/images/main/10.png" title="地波雷达信息"></a>
											<h5>地波雷达信息</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/seabedPipeline/main2.jsp"> <img src="${contextPath}/images/main/7.png" title="船舶定位信息"></a>
											<h5>船舶定位信息</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/seabedPipeline/main3.jsp"> <img src="${contextPath}/images/main/1.png" title="海底管线安全"></a>
											<h5>海底管线安全</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
	                </div>
	                <div class="card">
	                    <div class="card__container card__container--closed">
	                        <svg class="card__image" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1920 1200" preserveAspectRatio="xMidYMid slice">
	                            <defs>
	                                <clipPath id="clipPath4">
	                                    <polygon class="clip" points="0,1200 0,0 1920,0 1920,1200"></polygon>
	                                </clipPath>
	                            </defs>
	                            <image clip-path="url(#clipPath4)" width="1920" height="1200" xlink:href="${contextPath}/images/l.jpg"></image>
	                        </svg>
	                        <div class="card__content">
								<i class="card__btn-close fa fa-times"></i>
								<div class="card__caption">
									<h2 class="card__title">重点海域海岛视频监视应用</h2>
								</div>
								<div class="card__copy">
									<div class="panel-body">
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="#"><img src="${contextPath}/images/main/5.png" title="视频监视点分布"></a>
											<h5>视频监视点分布</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="#"><img src="${contextPath}/images/main/4.png" title="岸基监视系统"></a>
											<h5>岸基监视系统</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="#"><img src="${contextPath}/images/main/29.png" title="视频监视后台系统"></a>
											<h5>视频监视后台系统</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
	                </div>
	                <div class="card">
	                    <div class="card__container card__container--closed">
	                        <svg class="card__image" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1920 1200" preserveAspectRatio="xMidYMid slice">
	                            <defs>
	                                <clipPath id="clipPath5">
	                                    <polygon class="clip" points="0,1200 0,0 1920,0 1920,1200"></polygon>
	                                </clipPath>
	                            </defs>
	                            <image clip-path="url(#clipPath5)" width="1920" height="1200" xlink:href="${contextPath}/images/m.jpg"></image>
	                        </svg>
	                        <div class="card__content">
								<i class="card__btn-close fa fa-times"></i>
								<div class="card__caption">
									<h2 class="card__title">系统管理</h2>
								</div>
								<div class="card__copy">
									<div class="panel-body">
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/xtgl/xtgl.jsp"> <img src="${contextPath}/images/main/17.png" title="用户管理"></a>
											<h5>用户管理</h5>
										</div>

										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/xtgl/xtgl.jsp"> <img src="${contextPath}/images/main/15.png" title="角色管理"></a>
											<h5>角色管理</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/xtgl/xtgl.jsp"> <img src="${contextPath}/images/main/32.png" title="菜单管理"></a>
											<h5>菜单管理</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/xtgl/xtgl.jsp"> <img src="${contextPath}/images/main/20.png" title="字典管理"></a>
											<h5>字典管理</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/xtgl/xtgl.jsp"> <img src="${contextPath}/images/main/19.png" title="日志管理"></a>
											<h5>日志管理</h5>
										</div>
										<div style="width: 80px; text-align: center; height: 80px; float: left">
											<a href="${contextPath}/jsp/xtgl/xtgl.jsp"> <img src="${contextPath}/images/main/16.png" title="海洋法律法规"></a>
											<h5>海洋法律法规</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
	                </div>
	            </div>	                
	            <!-- /cards -->
	        </div>
	    </div>
	    <script type="text/javascript" src="${contextPath}/js/jquery.js"></script>	    
	    <script type="text/javascript" src="${contextPath}/js/homepage.js"></script>
    	<script type="text/javascript" src="${contextPath}/js/vendors/trianglify.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/vendors/TweenMax.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/vendors/ScrollToPlugin.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/vendors/cash.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/Card-polygon-4.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/homepage.js"></script>
	    
	    
	</body>
</html>