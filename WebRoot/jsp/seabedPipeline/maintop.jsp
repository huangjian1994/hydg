<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>上海市海底管线登陆区安全监管应用</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
			.contain {
				height: 88px;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				//顶部导航切换
				$(".nav li a").click(function() {
					$(".nav li a.selected").removeClass("selected")
					$(this).addClass("selected");
				})
				//显示菜单页面
				var url = window.location.href;//获取当前页面url
				console.log(url);
				function parseURL(url){//获取url中传递的参数
				    var url = url.split("?")[1];
				    var res = {};
				    var arr = [];				    
				    arr = url.split("=");
				    res[arr[0]] = arr[1];				    
				    return res;
				}				
				var res = parseURL(url);
				console.log(res);				
				if(res.tle == "0"){					
					$(".nav li a").eq(0).addClass("selected");														
				}else if(res.tle == "1"){					
					$(".nav li a").eq(1).addClass("selected");				
				}else if(res.tle == "2"){										
					$(".nav li a").eq(2).addClass("selected");					
				}				
			})
		</script>
		<script>
		</script>

	</head>

	<body>
<img alt="" src="${contextPath}/images/bg.png" style="z-index:-100;width:100%;height:90px;position:absolute;left:0;top:0" />

		<div class="contain">
			<div class="topleft">
				<a href="${contextPath}/jsp/seabedPipeline/main.jsp" target="_parent">
					<img src="${contextPath}/images/toplogo/hdgx.png" title="上海市海底管线登陆区安全监管应用" />
				</a>
			</div>

			<ul class="nav" style="margin-left:220px;">
				<li>
					<a href="${contextPath}/jsp/seabedPipeline/bottom/bottom_dbldxx.jsp" target="bottomFrame"><img src="${contextPath}/images/main/10.png" title="地波雷达信息" />
						<h2>地波雷达信息</h2></a>
				</li>
				<li>
					<a href="${contextPath}/jsp/seabedPipeline/bottom/bottom_cbdwxx.jsp" target="bottomFrame"><img src="${contextPath}/images/main/7.png" title="船舶定位信息" />
						<h2>船舶定位信息</h2></a>
				</li>
				<li>
					<a href="${contextPath}/jsp/seabedPipeline/bottom/bottom_hdgxaq.jsp" target="bottomFrame"><img src="${contextPath}/images/main/1.png" title="统计分析" />
						<h2>海底管线安全</h2></a>
				</li>

			</ul>

			<div class="topright">
				<ul>
					<li><span><img src="${contextPath}/images/help.png" title="帮助"  class="helpimg"/></span>
						<a href="#">帮助</a>
					</li>
					<li>
						<a href="${contextPath}/jsp/homepage.jsp" target="_top">返回</a>
					</li>
					<li>
						<a href="${contextPath}/user/user_logOut.do" target="_parent">退出</a>
					</li>
				</ul>
				<div class="user">
					<a href="${contextPath}/user/user_edit_maintop.do?method=init" title="用户修改" target="_blank">
						<span><s:property value="#session.user.role.roleName"/>：<s:property value="#session.user.name"/></span>
					</a>
				</div>
			</div>

		</div>

	</body>

</html>