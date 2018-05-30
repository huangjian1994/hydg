<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>门户网站</title>

		<!-- Bootstrap -->
		<link href="${contextPath}/jsp/seasInspection/css/bootstrap.css" rel="stylesheet">
		<link href="${contextPath}/jsp/seasInspection/css/font-awesome.css" rel="stylesheet">
		<link href="${contextPath}/jsp/seasInspection/css/style1.css" rel="stylesheet">
		<link href="${contextPath}/jsp/seasInspection/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/jsp/seasInspection/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/seasInspection/js/jsapi.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/seasInspection/js/format+zh_CN,default,corechart.I.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/seasInspection/js/jquery.gvChart-1.0.1.min.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/seasInspection/js/jquery.ba-resize.min.js"></script>
	</head>

	<body style="text-align:center">
		<div style="width:90%;height:850px;border:solid 1px #31708f;margin:auto;margin-top:20px">

			<div style="margin-top:20px;">
				<div style="width:45%;float:left;margin-right:2%;margin-left:3%;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-12 text-left">
									<h4 class="smart-margin-off">海塘巡查管理</h4>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/icon02-2.png" alt=""></a>
								<h5>地面巡查采集上报管理</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/icon02.png" alt=""></a>
								<h5>系统比对</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/bz_xtzcgl.png" height="45" width="45" alt=""></a>
								<h5>违法信息上报与反馈</h5>
							</div>
						</div>
					</div>
				</div>
				<div style="width:45%;float:left;margin-right:3%;margin-left:2%;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-12 text-left">
									<h4 class="smart-margin-off">海域海岛巡查</h4>
								</div>
							</div>
						</div>
						<div class="panel-body">

							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/bz_db.png" height="45" width="45" alt=""></a>
								<h5>巡查问题上报</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/bz_sjzl.png" height="45" width="45" alt=""></a>
								<h5>巡查任务下派</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/gkxx.png" height="45" width="45" alt=""></a>
								<h5>巡查任务审核</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/wsdp.png" alt="" height="45" width="45"></a>
								<h5>巡查信息反馈</h5>
							</div>
						</div>
					</div>
				</div>
				<div style="width:45%;float:left;margin-right:2%;margin-left:3%;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-12 text-left">
									<h4 class="smart-margin-off">查询统计</h4>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/tdyy.png" height="45" width="45" alt=""></a>
								<h5>分类管理</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/qwxx.png" alt="" height="45" width="45"></a>
								<h5>综合查询</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/i03.png" height="45" width="45" alt=""></a>
								<h5>项目统计</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/i03.png" height="45" width="45" alt=""></a>
								<h5>状态统计</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/i03.png" height="45" width="45" alt=""></a>
								<h5>海域区域统计</h5>
							</div>
						</div>
					</div>
				</div>
				<div style="width:45%;float:left;margin-right:3%;margin-left:2%;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-12 text-left">
									<h4 class="smart-margin-off">状态跟踪</h4>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/jtxx.png" height="45" width="45" alt=""></a>
								<h5>实时监控</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/cllrjk.png" alt=""></a>
								<h5>轨迹回放</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/ico01.png" height="45" width="45" alt=""></a>
								<h5>巡查区域查询</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/ico01.png" height="45" width="45" alt=""></a>
								<h5>信息状态查询</h5>
							</div>
						</div>
					</div>
				</div>
				<div style="width:45%;float:left;margin-right:2%;margin-left:3%;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-12 text-left">
									<h4 class="smart-margin-off">巡查考评管理</h4>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/clda_zp.png" height="45" width="45" alt=""></a>
								<h5>视频管理</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/seven_sfcl.jpg" alt="" height="45" width="45"></a>
								<h5>巡查人员考核评价</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/cljd.png" alt="" height="45" width="45"></a>
								<h5>巡查单位考核</h5>
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
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/czda.png" alt=""></a>
								<h5>用户管理</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/cbxx.png" alt="" height="45" width="45"></a>
								<h5>菜单管理</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/ykll.png" alt="" height="45" width="45"></a>
								<h5>权限管理</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/bz_bzhjy.png" height="45" width="45" alt=""></a>
								<h5>参数配置</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/bz_yymx.png" alt="" height="45" width="45"></a>
								<h5>日志管理</h5>
							</div>
							<div style="width:80px;text-align:center;height:80px;float:left">
								<a href="${contextPath}/jsp/seasInspection/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="images/bz_yymx.png" alt="" height="45" width="45"></a>
								<h5>数据备份与恢复</h5>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="${contextPath}/jsp/seasInspection/js/jquery-1.11.1.js"></script>
		<script src="${contextPath}/jsp/seasInspection/js/bootstrap.js"></script>
		<script src="${contextPath}/jsp/seasInspection/js/jquery.slimscroll.js"></script>
		<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
		<script src="${contextPath}/jsp/seasInspection/js/gmaps.js"></script>
		<script src="${contextPath}/jsp/seasInspection/js/main.js"></script>

	</body>

</html>