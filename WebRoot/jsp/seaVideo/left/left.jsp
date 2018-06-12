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
		<script type="text/javascript" src="${contextPath}/js/layer/layer.js"></script>	
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
				var url = window.location.href;//获取当前页面url
				//console.log(url);
				function parseURL(url){//获取url中传递的参数
				    var url = url.split("?")[1];
				    var para = url.split("&");
				    var len = para.length;
				    var res = {};
				    var arr = [];
				    for(var i=0;i<len;i++){
				        arr = para[i].split("=");
				        res[arr[0]] = arr[1];
				    }
				    return res;
				}
				var res = parseURL(url);			
				//console.log(res);
				function closeMenu(){
					for(var i = 0;i < $(".menuson").length;i++){
						$(".menuson").eq(i).css("display","none");
					}
					$(".menuson").eq(res.index).css("display","block");
					$(".menuson li.active").removeClass("active");
					$($(".menuson").eq(res.index).children()[0]).addClass("active");
				}				
				//console.log($(".menuson").eq(res.index).children()[0]);
				if(res.s == "spjk"){
					addTab("视频监控点分布","${contextPath}/jsp/seaVideo/jsp/spjk/spjsdwfb.jsp");
					closeMenu();										
				}else if(res.s == "ajjs"){
					addTab("岸基监视系统","${contextPath}/jsp/seaVideo/jsp/spjk/ajjs.jsp");
					closeMenu();					
				}
				else if(res.s == "spfx"){
					addTab("智能视频分析","${contextPath}/jsp/seaVideo/jsp/znspfx/znspfx.jsp");
					closeMenu();					
				}				
			})
		</script>		
		<script>					
			//获取当前屏幕分辨率
			function getScreen (){
				var screenArr = [];
				var h = window.screen.height;
				var w = window.screen.width;
				screenArr.push(h,w);
				return screenArr;
			}
			var screenArr = getScreen();
			var screenW = screenArr[1];
			var screenH = (screenW/4)*3;
			console.log(screenW,screenH);
			//打开视频方法
			function video(stat) {
				var newVideoId = stat;
				var w = screenW*(2/5) + "px";
				var h = screenH*(2/5) + "px";
				layer.open( {
					type : 2,
					title : '视频查看',
					shadeClose : true,
					id : 'insert-form',
					shade : 0,
					offset : 'r',
					area : [ w, h ],
					content : '${contextPath}/jsp/seaVideo/video.jsp', //iframe的url
					success:function ButtonStartRealplayByWndNo(){
								countLinstener = 0;
							    var frameId = document.getElementById('insert-form').getElementsByTagName("iframe")[0].id;
								setTimeout(function() {
									$('#' + frameId)[0].contentWindow.ButtonStartRealplayByWndNo_onclick(newVideoId);
								}, 1000);
							}
				});
				var frameId = document.getElementById('insert-form').getElementsByTagName("iframe")[0].id;
				if(frameId != null)
				$('#' + frameId)[0].contentWindow.ButtonStartRealplayByWndNo_onclick(newVideoId);
				//window.open('jsp/videomoni/video-1.jsp', x, 'height=430,width=480,top=500,left=400,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
			}
		
			function change1(){
				$("#menu1").toggle();
			}
			
			function change2(){
				$("#menu3").toggle();
			}
			
		</script>
	</head>

	<body style="background: #f0f9fd;">
		<div style="height: 100%; width: 187px">
			<div class="lefttop">
				<span></span>
				<s:property value="#session.user.role.roleName" />
				：
				<s:property value="#session.user.name" />
			</div>
			<dl class="leftmenu">
				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seabedPipeline/leftico01.png" /></span>
						<a class="easyui-linkbutton" href="#" onclick="addTab('视频监控点分布','${contextPath}/jsp/seaVideo/jsp/spjk/spjsdwfb.jsp')">视频监视点位分布</a>
					</div>
					<ul class="menuson">
						<li>
							<cite></cite>
							<a href="#" onclick="video('1000020$1$0$0')">浦东新区</a><i></i>
						</li>
						<li>
							<cite></cite>
							<a href="#" onclick="video('1000021$1$0$0')">崇明区</a><i></i>
						</li>
						<li>
							<cite></cite>
							<a href="#" onclick="video('1000023$1$0$0')">奉贤区</a><i></i>
						</li>
						<li>
							<cite></cite>
							<a href="#" onclick="video('1000024$1$0$0')";>金山区</a><i></i>
						</li>
					</ul>
				</dd>
				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seabedPipeline/leftico01.png" /></span>
						<a class="easyui-linkbutton" href="#" onclick="addTab('岸基监视系统','${contextPath}/jsp/seaVideo/jsp/spjk/ajjs.jsp')">岸基监视系统</a>
					</div>
					<ul class="menuson">
						<li>
							<cite></cite>
							<a href="#" onclick="video('1000056$1$0$0')">大金山岛1</a><i></i>
						</li>
						<li>
							<cite></cite>
							<a href="#" onclick="video('1000055$1$0$0')">大金山岛2</a><i></i>
						</li>
					</ul>
				</dd>
				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seabedPipeline/leftico01.png" /></span>
						<a class="easyui-linkbutton" href="#" onclick="addTab('智能视频分析',‘${contextPath}/jsp/seaVideo/jsp/spjk/znpfx.jsp')">智能视频分析</a>
					</div>					
				</dd>
			</dl>
		</div>		
		<div id="tt" class="easyui-tabs tabs-posi" style="height:100%"></div>
	</body>

</html>
