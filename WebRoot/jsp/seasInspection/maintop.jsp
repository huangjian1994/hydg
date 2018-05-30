<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>上海市海域巡查管理应用</title>
		<link href="${contextPath}/css/style_xc.css" rel="stylesheet" type="text/css" />
		
		<style type="text/css">
			.contain {
				height: 88px;
			}
		</style>
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script> 
		<script type="text/javascript" src="${contextPath}/js/jquery.easyui.min.js"></script>
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
				else if(res.tle == "3"){					
					$(".nav li a").eq(3).addClass("selected");				
				}
				else if(res.tle == "4"){					
					$(".nav li a").eq(4).addClass("selected");					
				}		
			})
		</script>
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

	</head>

	<body>
<img alt="" src="${contextPath}/images/bg.png" style="z-index:-100;width:100%;height:88px;position:absolute;left:0;top:0" />

		<div class="contain">
			<div class="topleft">
				<a href="${contextPath}/jsp/seasInspection/main.jsp" target="_parent">
					<img src="${contextPath}/images/toplogo/hyxc.png" title="上海市海域巡查管理应用" />
				</a>
			</div>

			<ul class="nav">
				<li>
					<a href="${contextPath}/jsp/seasInspection/bottom/bottom.jsp" target="bottomFrame"><img src="${contextPath}/images/main/25.png" title="海塘巡查管理" />
						<h2>海塘巡查管理</h2></a>
				</li>
				<li>
					<a href="${contextPath}/jsp/seasInspection/bottom/bottom2.jsp" target="bottomFrame"><img src="${contextPath}/images/main/23.png" title="海域海岛巡查管理" />
						<h2>海域海岛巡查</h2></a>
				</li>
				<li>
					<a href="${contextPath}/jsp/seasInspection/bottom/bottom3.jsp" target="bottomFrame"><img src="${contextPath}/images/main/8.png" title="查询统计" />
						<h2>查询统计</h2></a>
				</li>
				<li>
					<a href="${contextPath}/jsp/seasInspection/bottom/bottom4.jsp" target="bottomFrame"><img src="${contextPath}/images/main/26.png" title="状况跟踪" />
						<h2>状态跟踪</h2></a>
				</li>
				<li>
					<a href="${contextPath}/jsp/seasInspection/bottom/bottom5.jsp" target="bottomFrame"><img src="${contextPath}/images/main/21.png" title="巡查评价考核管理" />
						<h2>巡查考评管理</h2></a>
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