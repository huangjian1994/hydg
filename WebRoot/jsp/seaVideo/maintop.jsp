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
            //退出智能视视频分析
            function exitZnspfx(){
                $.ajax({
                    url: pageurl + '/hydg/seaRecord/seaRecord_exitznspfx.do',
                    type: "post",
                    async: false,
                    success: function() {
               
                    }        
                })
            }
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
				if(res.tle == "spjk"){					
					$(".nav li a").eq(0).addClass("selected");														
				}else if(res.tle == "ajjs"){					
					$(".nav li a").eq(1).addClass("selected");				
				}else if(res.tle == "spjkht"){										
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
				<a href="${contextPath}/jsp/seaVideo/main.jsp" target="_parent">
					<img src="${contextPath}/images/toplogo/zdhy.png" title="重点海域海岛视频监视应用" />
				</a>
			</div>

			<ul class="nav" style="margin-left:220px;">
				<li>
					<a href="${contextPath}/jsp/seaVideo/bottom/bottom_spjsdfb.jsp" target="bottomFrame">
						<img src="${contextPath}/images/main/5.png" title="视频监视点" />
						<h2>视频监控</h2>
					</a>
				</li>
				<li>
					<a href="${contextPath}/jsp/seaVideo/bottom/bottom_ajjsxt.jsp" target="bottomFrame">
						<img src="${contextPath}/images/main/4.png" title="岸基监视系统" />
						<h2>岸基监视系统</h2>
					</a>
				</li>
				<li>
					<a href="${contextPath}/seaRecord/seaRecord_znspfx.do" target="bottomFrame">
						<img src="${contextPath}/images/main/5.png" title="智能视频分析" />
						<h2>智能视频分析</h2>
					</a>
				</li>
				<li>
					<a href="${contextPath}/jsp/seaVideo/bottom/bottom_spjshtxt.jsp" target="bottomFrame">
						<img src="${contextPath}/images/main/29.png" title="后台系统" />
						<h2>视频监控后台</h2>
					</a>
				</li>

			</ul>

			<div class="topright">
				<ul>
					<li><span><img src="${contextPath}/images/help.png" title="帮助"  class="helpimg"/></span>
						<a href="#">帮助</a>
					</li>
					<li>
						<a href="${contextPath}/jsp/homepage.jsp" target="_top" onclick="exitZnspfx()">返回</a>
					</li>
					<li>
						<a href="${contextPath}/user/user_logOut.do" target="_parent" onclick="exitZnspfx()">退出</a>
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