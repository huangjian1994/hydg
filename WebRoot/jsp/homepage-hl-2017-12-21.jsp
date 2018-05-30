<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>上海市海域动态监视检测管理系统</title>
		<link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
		<link href="${contextPath}/css/font-awesome.css" rel="stylesheet">
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<!-- <script type="text/javascript" src="${contextPath}/js/jsapi.js"></script>	
		<script type="text/javascript" src="${contextPath}/js/jquery.gvChart-1.0.1.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.ba-resize.min.js"></script> -->
	</head>
	<body style="text-align: center; overflow-x: hidden;">
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

		<div style="width: 90%; height: 850px; border: solid 1px #31708f; margin: 20px auto;">
			<div style="margin-top: 20px;">
				<div style="width: 45%; float: left; margin-right: 2%; margin-left: 3%;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-12 text-left">
									<h4 class="smart-margin-off">
										上海市海域使用业务管理应用
									</h4>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seasProfession/main.jsp"> <img src="${contextPath}/images/main/dtyy.png" title="地图应用" />
								</a>
								<h5>
									地图应用
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seasProfession/main5.jsp"> <img src="${contextPath}/images/main/27.png" title="海域可视化综合查询" />
								</a>
								<h5>
									海域可视化综合查询
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seasProfession/main2.jsp"> <img src="${contextPath}/images/main/22.png" title="海洋功能区划管理" />
								</a>
								<h5>
									海洋功能区划管理
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seasProfession/main3.jsp"> <img src="${contextPath}/images/main/24.png" title="海域使用动态管理" />
								</a>
								<h5>
									海域使用动态管理
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seasProfession/main4.jsp"> <img src="${contextPath}/images/main/28.png" title="内外部接口" />
								</a>
								<h5>
									内外部接口
								</h5>
							</div>
						</div>
					</div>
				</div>
				<div style="width: 45%; float: left; margin-right: 3%; margin-left: 2%;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-12 text-left">
									<h4 class="smart-margin-off">
										上海市海域巡查管理应用
									</h4>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seasInspection/main.jsp"> <img src="${contextPath}/images/main/25.png" title="海塘巡查管理">
								</a>
								<h5>
									海塘巡查管理
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seasInspection/main2.jsp"> <img src="${contextPath}/images/main/23.png" title="海域海岛巡查管理">
								</a>
								<h5>
									海域海岛巡查管理
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seasInspection/main3.jsp"> <img src="${contextPath}/images/main/8.png" title="查询统计">
								</a>
								<h5>
									查询统计
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seasInspection/main4.jsp"> <img src="${contextPath}/images/main/26.png" title="状态跟踪">
								</a>
								<h5>
									状态跟踪
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seasInspection/main5.jsp"> <img src="${contextPath}/images/main/21.png" title="巡查考评管理">
								</a>
								<h5>
									巡查考评管理
								</h5>
							</div>
						</div>
					</div>
				</div>
				<div style="width: 45%; float: left; margin-right: 2%; margin-left: 3%;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-12 text-left">
									<h4 class="smart-margin-off">
										上海市海底管线登陆区安全监管应用
									</h4>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seabedPipeline/main.jsp"> <img src="${contextPath}/images/main/10.png" title="地波雷达信息">
								</a>
								<h5>
									地波雷达信息
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seabedPipeline/main2.jsp"> <img src="${contextPath}/images/main/7.png" title="船舶定位信息" />
								</a>
								<h5>
									船舶定位信息
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seabedPipeline/main3.jsp"> <img src="${contextPath}/images/main/1.png" title="海底管线安全" />
								</a>
								<h5>
									海底管线安全
								</h5>
							</div>
						</div>
					</div>
				</div>
				<div style="width: 45%; float: left; margin-right: 3%; margin-left: 2%;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-12 text-left">
									<h4 class="smart-margin-off">
										重点海域海岛视频监视应用
									</h4>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seaVideo/main.jsp"><img src="${contextPath}/images/main/5.png" title="视频监视点分布">
								</a>
								<h5>
									视频监视点分布
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seaVideo/main2.jsp"><img src="${contextPath}/images/main/4.png" title="岸基监视系统">
								</a>
								<h5>
									岸基监视系统
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/seaVideo/main3.jsp"><img src="${contextPath}/images/main/29.png" title="视频监视后台系统">
								</a>
								<h5>
									视频监视后台系统
								</h5>
							</div>
						</div>
					</div>
				</div>
				<div style="width: 45%; float: left; margin-right: 2%; margin-left: 3%;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-12 text-left">
									<h4 class="smart-margin-off">
										系统管理
									</h4>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/xtgl/xtgl.jsp"> <img src="${contextPath}/images/main/17.png" title="用户管理">
								</a>
								<h5>
									用户管理
								</h5>
							</div>

							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/xtgl/xtgl.jsp"> <img src="${contextPath}/images/main/15.png" title="角色管理">
								</a>
								<h5>
									角色管理
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/xtgl/xtgl.jsp"> <img src="${contextPath}/images/main/32.png" title="菜单管理">
								</a>
								<h5>
									菜单管理
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/xtgl/xtgl.jsp"> <img src="${contextPath}/images/main/20.png" title="字典管理">
								</a>
								<h5>
									字典管理
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/xtgl/xtgl.jsp"> <img src="${contextPath}/images/main/19.png" title="日志管理">
								</a>
								<h5>
									日志管理
								</h5>
							</div>
							<div style="width: 80px; text-align: center; height: 80px; float: left">
								<a href="${contextPath}/jsp/xtgl/xtgl.jsp"> <img src="${contextPath}/images/main/16.png" title="海洋法律法规">
								</a>
								<h5>
									海洋法律法规
								</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</body>
</html>