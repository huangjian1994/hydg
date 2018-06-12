<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<%
	String sendMessage = (String)request.getSession().getAttribute("sendMessage");
	request.getSession().setAttribute("sendMessage","0");
%>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>上海市海域动态监视检测管理系统</title>
		<link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
		<link href="${contextPath}/css/font-awesome.css" rel="stylesheet">
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/homepage.css" rel="stylesheet" type="text/css" />
		<script src="${contextPath}/js/jquery-1.7.2.min.js"></script>
		<script type="${contextPath}/js/text/javascript" src="tabswitch.js"></script>
		<!--[if lte IE 6]> 
		<script src="DD_belatedPNG.js"  type="text/javascript"></script>
		<script type="text/javascript">
		DD_belatedPNG.fix('.foot_r span img,.foot_r li img,.kf a img,.title');
		/* 将 .png_bg 改成你应用了透明PNG的CSS选择器*/
		</script>
		<![endif]-->
		<script src="${contextPath}/js/tc.js"></script>
		<script type="text/javascript" src="${contextPath}/dwr/engine.js"></script>
		<script type="text/javascript" src="${contextPath}/dwr/util.js"></script>
		<script type="text/javascript" src="${contextPath}/dwr/interface/MessagePush.js"></script>
		<script type="text/javascript">
			$(function(){
				dwr.engine.setActiveReverseAjax(true);
				dwr.engine.setNotifyServerOnPageUnload(true);
				onPageLoad();
				dwr.engine.setErrorHandler(function(){
				});				
			    var tabNum=$(".important").find("li");
			    var contentNum=$(".contents").children();
			    var timer;
			    $(tabNum).each(function(index){
			        $(this).hover(function(){
			            var that=$(this)
			             timer=window.setTimeout(function(){
			                $(contentNum).eq(index).css({"display":"block"});
			                $(contentNum).eq(index).siblings().css({"display":"none"});
			                 that.find("a").css({"background":"#FFF","color":"#fff"});
			                 that.find("strong").show();
			                 that.siblings().find("strong").hide();
			                 that.siblings().find("a").css({"background":"#fff","color":"black"});
			            },100)
			        },function(){
			            window.clearTimeout(timer);
			        })
			    });
			    
			    window.setTimeout(loadMessage,600)
			})
			function loadMessage(){
				var sendMessage = "<%=sendMessage%>";
				if ( sendMessage == "1" ) {
					$.ajax({		  		
						type: "post",
						dataType:"json",
						url: "${contextPath}/notice/message_loginSuccess.do",
						success: function(d){
	
						}
					});
				}
			}
			
			function showMessage(message){
				var msg_json = JSON.parse(message);
                console.log(msg_json)
				//登陆弹窗
				var pop_mess = "<li>"+
									"<span style='display:inline-block;font-size:20px;line-height:1.1;'>" + msg_json.msg + "</span>"+
								"</li>"								
				pop_init("系统信息",pop_mess,msg_json.i);                
				
			}
            var sss = 0;
			function test1(){
                var timer = setInterval(function(){
                    showMessage(sss);
                    sss +=1; 
                    console.log(sss);                   
                },5000); 
            }
            //test1();
			function onPageLoad(){
				MessagePush.onPageLoad("${sessionScope.user.id}");
			}
			</script>
	</head>
	<body style="overflow: hidden;">
		<div
			style="width: 100%; height: 88px; overflow: hidden; position: relative;">
			<img alt="" src="${contextPath}/images/bg.png" style="z-index: -100; width: 100%; height: 88px; position: absolute; left: 0; top: 0">
			<div class="topleft">
				<a href="${contextPath}/jsp/homepage.jsp"> <img src="${contextPath}/images/logo.png" title="上海市海域动态监视检测管理系统" /></a>
			</div>
			<div class="topright">
				<div class="user">
					<a href="${contextPath}/user/user_edit_maintop.do?method=init" title="用户修改" target="_blank"> 
						<span><s:property value="#session.user.role.roleName" />：<s:property value="#session.user.name" /></span> 
					</a>
					<a href="${contextPath}/user/user_logOut.do"> <i>退出</i> </a>
				</div>
			</div>
		</div>
		<div class="w1200">
			<div class="wbg">
				<ul class="important cl">
					<li class="rcsp_1">
						<a><span></span></a>
						<p>海域使用业务</p>
						<strong><i></i></strong>
					</li>
					<li class="rcsp_2">
						<a><span></span></a>
						<p>海域巡查</p>
						<strong style="display: none"><i></i></strong>
					</li>
					<li class="rcsp_3">
						<a><span></span></a>
						<p>海底管线</p>
						<strong style="display: none"><i></i></strong>
					</li>
					<li class="rcsp_4">
						<a><span></span></a>
						<p>视频监视</p>
						<strong style="display: none"><i></i></strong>
					</li>
					<li class="rcsp_5">
						<a><span></span></a>
						<p>系统管理</p>
						<strong style="display: none"><i></i></strong>
					</li>
				</ul>
			</div>
			<div class="contents">
				<div class="cl">
					<div class="icon_title">
						<div class="title_content">
							<p>上海市海域使用业务管理系统</p>
						</div>
					</div>
					<div class="down_all">
						<div class="down_bg">
							<ul class="icon_down">
								<c:forEach items="${ menuList }" var="r" varStatus="j">
									<c:if test="${r.code=='dtyy' }">
										<li>
											<a href="${contextPath}/jsp/seasProfession/main.jsp">
												<img src="${contextPath}/images/homepage/5.png">
												<p>地图应用</p>
											</a>
										</li>
									</c:if>
									<c:if test="${r.code=='hykshcx' }">
										<li>
											<a href="${contextPath}/jsp/seasProfession/main5.jsp">
												<img src="${contextPath}/images/homepage/2.png">
												<p>海域可视化综合查询</p>
											</a>
										</li>
									</c:if>
									<c:if test="${r.code=='hygnqhgl' }">
										<li>
											<a href="${contextPath}/jsp/seasProfession/main2.jsp">
												<img src="${contextPath}/images/homepage/4.png">
												<p>海洋功能区划管理</p>
											</a>
										</li>
									</c:if>
									<c:if test="${r.code=='hysydtgl' }">
										<li>
											<a href="${contextPath}/jsp/seasProfession/main3.jsp">
												<img src="${contextPath}/images/homepage/3.png">
												<p>海域使用动态管理</p>
											</a>
										</li>
									</c:if>
									<c:if test="${r.code=='nwbjk' }">
										<li>
											<a href="${contextPath}/jsp/seasProfession/main4.jsp">
												<img src="${contextPath}/images/homepage/1.png">
												<p>内外部接口</p>
											</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="cl" style="display: none">
					<div class="icon_title">
						<div class="title_content">
							<p>上海市海域巡查管理应用</p>
						</div>
					</div>
					<div class="down_all">
						<div class="down_bg">
							<ul class="icon_down">
								<c:forEach items="${ menuList }" var="r" varStatus="j">
									<c:if test="${r.code=='htxcgl' }">
										<li>
											<a href="${contextPath}/jsp/seasInspection/main.jsp">
												<img src="${contextPath}/images/homepage/7.png">
												<p>海塘巡查管理</p>
											</a>
										</li>
									</c:if>
									<c:if test="${r.code=='hyhdxcgl' }">
										<li>
											<a href="${contextPath}/jsp/seasInspection/main2.jsp">
												<img src="${contextPath}/images/homepage/6.png">
												<p>海域海岛巡查管理</p>
											</a>
										</li>
									</c:if>
									<c:if test="${r.code=='cxtj' }">
										<li>
											<a href="${contextPath}/jsp/seasInspection/main3.jsp">
												<img src="${contextPath}/images/homepage/8.png">
												<p>查询统计</p>
											</a>
										</li>
									</c:if>
									<c:if test="${r.code=='ztzz' }">
										<li>
											<a href="${contextPath}/jsp/seasInspection/main4.jsp">
												<img src="${contextPath}/images/homepage/9.png">
												<p>状态追踪</p>
											</a>
										</li>
									</c:if>
									<c:if test="${r.code=='xckpgl' }">
										<li>
											<a href="${contextPath}/jsp/seasInspection/main5.jsp">
												<img src="${contextPath}/images/homepage/10.png">
												<p>巡查考评管理</p>
											</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="cl" style="display: none">
					<div class="icon_title">
						<div class="title_content">
							<p>上海市海底管线登陆区安全监管应用</p>
						</div>
					</div>
					<div class="down_all">
						<div class="down_bg">
							<ul class="icon_down">
								<c:forEach items="${ menuList }" var="r" varStatus="j">
									<c:if test="${r.code=='dbldxx' }">
										<li>
											<a href="${contextPath}/jsp/seabedPipeline/main.jsp">
												<img src="${contextPath}/images/homepage/11.png">
												<p>地波雷达信息</p>
											</a>
										</li>
									</c:if>
									<c:if test="${r.code=='cbdwxx' }">
										<li>
											<a href="${contextPath}/jsp/seabedPipeline/main2.jsp">
												<img src="${contextPath}/images/homepage/12.png">
												<p>船舶定位信息</p>
											</a>
										</li>
									</c:if>
									<c:if test="${r.code=='hdgxaqgl' }">
										<li>
											<a href="${contextPath}/jsp/seabedPipeline/main3.jsp">
												<img src="${contextPath}/images/homepage/13.png">
												<p>海底管线安全</p>
											</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="cl" style="display: none">
					<div class="icon_title">
						<div class="title_content">
							<p>重点海域海岛视频监视应用</p>
						</div>
					</div>
					<div class="down_all">
						<div class="down_bg">
							<ul class="icon_down">
								<c:forEach items="${ menuList }" var="r" varStatus="j">
									<c:if test="${r.code=='spjsdfb' }">
										<li>
											<a href="${contextPath}/jsp/seaVideo/main.jsp">
												<img src="${contextPath}/images/homepage/14.png">
												<p>视频监视点分布</p>
											</a>
										</li>
									</c:if>
									<c:if test="${r.code=='ajjsxt' }">
										<li>
											<a href="${contextPath}/jsp/seaVideo/main2.jsp">
												<img src="${contextPath}/images/homepage/15.png">
												<p>岸基监视系统</p>
											</a>
										</li>
									</c:if>
									<!--<c:if test="${r.code=='spjshtxt' }">
										<li>
											<a href="${contextPath}/jsp/seaVideo/main3.jsp">
												<img src="${contextPath}/images/homepage/16.png">
												<p>视频监视后台系统</p>
											</a>
										</li>
									</c:if> -->                                   
								</c:forEach>
								<li>
									<a href="${contextPath}/seaRecord/seaRecord_znspfx_maintop.do">
										<img src="${contextPath}/images/homepage/14.png">
										<p>智能视频分析</p>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="cl" style="display: none">
					<div class="icon_title">
						<div class="title_content">
							<p>系统管理</p>
						</div>
					</div>
					<div class="down_all">
						<div class="down_bg">
							<ul class="icon_down">
								<c:forEach items="${ menuList }" var="r" varStatus="j">
									<c:if test="${r.code=='xtgl' }">
										<s:iterator value="#session.menusMap.get('xtgl')" status="stu">
											<s:if test="code == 'yhgl'">
												<li>
													<a href="${contextPath}/jsp/xtgl/xtgl.jsp?file=yhgl">
														<img src="${contextPath}/images/homepage/17.png">
														<p>用户管理</p>
													</a>
												</li>
											</s:if>
											<s:if test="code == 'jsgl'">
												<li>
													<a href="${contextPath}/jsp/xtgl/xtgl.jsp?file=jsgl">
														<img src="${contextPath}/images/homepage/18.png">
														<p>角色管理</p>
													</a>
												</li>
											</s:if>
											<s:if test="code == 'cdgl'">
												<li>
													<a href="${contextPath}/jsp/xtgl/xtgl.jsp?file=cdgl">
														<img src="${contextPath}/images/homepage/19.png">
														<p>菜单管理</p>
													</a>
												</li>
											</s:if>
											<s:if test="code == 'zdgl'">
												<li>
													<a href="${contextPath}/jsp/xtgl/xtgl.jsp?file=zdgl">
														<img src="${contextPath}/images/homepage/20.png">
														<p>字典管理</p>
													</a>
												</li>
											</s:if>
											<s:if test="code == 'rzgl'">
												<li>
													<a href="${contextPath}/jsp/xtgl/xtgl.jsp?file=rzgl">
														<img src="${contextPath}/images/homepage/21.png">
														<p>日志管理</p>
													</a>
												</li>
											</s:if>
											<s:if test="code == 'hyflfg'">
												<li>
													<a href="${contextPath}/jsp/xtgl/xtgl.jsp?file=flfg">
														<img src="${contextPath}/images/homepage/22.png">
														<p>海洋法律法规</p>
													</a>
												</li>
											</s:if>
										</s:iterator>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>