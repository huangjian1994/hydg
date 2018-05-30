<!DOCTYPE html PUBLIC"-/W3C/DTD XHTML 1.0 Transitional/EN"
     "http:/www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>
<%@include file="../../message.jsp" %>
<html xmlns="http:/www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/load.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/jquery-ui-1.9.2.custom.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/pagination.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/seasProfession/left-nav.css" />
		<link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/dijit/themes/tundra/tundra.css" />
		<link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/esri/css/esri.css" />
		<script type="text/Javascript" src="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/init.js"></script>
		<script language="JavaScript" src="${contextPath}/js/jquery.js"></script>		
		<script language="JavaScript" src="${contextPath}/js/page.js"></script>	 
		<script language="JavaScript" src="${contextPath}/js/jquery-ui-1.9.2.custom.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>			
		<script type="text/Javascript" src="${contextPath}/js/seasProfession/left-zhcx.js"></script>		
		<script type="text/javascript" src="${contextPath}/js/seasProfession/map.js"></script>	
		<script type="text/javascript" src="${contextPath}/js/scroll.js"></script>				
		<script>
			var dojoConfig = {
				parseOnLoad: true
			};
		</script>
		<script type="text/javascript">
			$(function() {
				//导航切换
				$(".menuson li").click(function() {
					$(".menuson li.active").removeClass("active")
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
				$("#scroll").panel({iWheelStep:32});
				$("#scroll1").panel({iWheelStep:32});
				$("#scroll2").panel({iWheelStep:32});
			})
		</script>
	</head>

	<body>
		<div id="loader-wrapper">
		    <div id="loader"></div>
		    <div class="loader-section section-left"></div>
		    <div class="loader-section section-right"></div>
		    <div class="load_title">正在加载地图</div>
		</div>
		<!--页面加载end-->
		<div class="control-visible">
			<a href="#"> 
				<img src="${contextPath}/images/seasProfession/right-jiantou.png" />
			</a>
		</div>
		<div class="contain">
			<div class="lefttop">
				<div class="layer-control">
					<span>图层控制</span>
					<a href="#">
						<img class="fr close" src="${contextPath}/images/seasProfession/arcgis/layer-close.png" title="关闭" />
					</a>					
				</div>									
				<div class="layer-search">
					<span>识别结果</span>
					<a href="#">
						<img class="fr close" src="${contextPath}/images/seasProfession/arcgis/layer-close.png" title="关闭" />
					</a>						
				</div>
				<div class="search-location">
					<span>详细信息</span>
					<a href="#">
						<img class="fr close" src="${contextPath}/images/seasProfession/arcgis/layer-close.png" title="关闭" />
					</a>						
				</div>
				<div class="inquiry">
					<span>查询</span>
					<a href="#">
						<img class="fr close" src="${contextPath}/images/seasProfession/arcgis/layer-close.png" title="关闭" />
					</a>						
				</div>
				<div class="inquiry-info">
					<span>查询结果</span>
					<a href="#">
						<img class="fr close" src="${contextPath}/images/seasProfession/arcgis/layer-close.png" title="关闭" />
					</a>						
				</div>
				<div class="inquiry-location">
					<span>详细信息</span>
					<a href="#">
						<img class="fr close" src="${contextPath}/images/seasProfession/arcgis/layer-close.png" title="关闭" />
					</a>						
				</div>
			</div>
					
			<div class="leftmenu">
				<div id="scroll">
					<div style="width: 100%;">
						<div class="title">
							<ul>
								<li class="layer">
									<div class="first-menu">
										<div class="first">
											<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
											<input type="checkbox" name="切换图层1" id="71" value="业务图层" />
											<span>业务图层</span>
										</div>
										<div class="slider">									
											
										</div>
									</div>							
									<div class="second-menu">
										<ul>
											<li class="list-two">
												<div class="two">
													<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
													<input type="checkbox" name="切换图层2" id="3" value="海域使用项目" />
													<span>海域使用项目</span>
												</div>
												<div class="third-menu">
													<ul>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="4" value="海域使用项目新增" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hyxz.png" />
																<span>海域使用项目新增</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="5" value="海域使用项目原有" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hyxz.png" />
																<span>海域使用项目原有</span>
															</div>
														</li>
													</ul>
												</div>
											</li>
											<li class="list-two">
												<div class="two">
													<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
													<input type="checkbox" name="切换图层2" id="6" value="海岛普查" />
													<span>海岛普查</span>
												</div>
												<div class="third-menu">
													<ul>
														<li class="list-three">
															<div>
																<div class="three">
																	<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
																	<input type="checkbox" name="切换图层3" id="7" value="无居民海岛" />
																	<span>无居民海岛</span>
																</div>
																<div class="fourth-menu">
																	<ul>
																		<li class="list-four">
																			<div class="four">
																				<input type="checkbox" name="切换图层4" id="8" value="冲积沙岛" />
																				<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-cjs.png" />
																				<span>冲积沙岛</span>
																			</div>
																		</li>
																		<li class="list-four">
																			<div class="four">
																				<input type="checkbox" name="切换图层4" id="9" value="低潮高地" />
																				<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-dcgd.png" />
																				<span>低潮高地</span>
																			</div>
																		</li>
																		<li class="list-four">
																			<div class="four">
																				<input type="checkbox" name="切换图层4" id="10" value="基岩岛" />
																				<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-jyd.png" />
																				<span>基岩岛</span>
																			</div>
																		</li>
																		<li class="list-four">
																			<div class="four">
																				<input type="checkbox" name="切换图层4" id="11" value="暗礁" />
																				<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-aj.png" />
																				<span>暗礁</span>
																			</div>
																		</li>
																	</ul>
																</div>
															</div>
														</li>
													</ul>
												</div>
											</li>
											<li class="list-two">
												<div class="two">
													<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
													<input type="checkbox" name="切换图层2" id="17" value="功能区划标注" />
													<span>功能区划标注</span>
												</div>
												<div class="third-menu">
													<ul>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="18" value="农渔业区" />
																<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon1.png" />
																<span>农渔业区</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="19" value="近海农渔业区" />
																<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon2.png" />
																<span>近海农渔业区</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="20" value="港口航运区" />
																<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon3.png" />
																<span>港口航运区</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="21" value="工业与城镇用海区" />
																<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon4.png" />
																<span>工业与城镇用海区</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="22" value="近海工业与城镇建设区" />
																<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon5.png" />
																<span>近海工业与城镇建设区</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="23" value="矿产与能源区" />
																<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon6.png" />
																<span>矿产与能源区</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="24" value="近海矿产与能源区" />
																<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon7.png" />
																<span>近海矿产与能源区</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="25" value="休闲旅游娱乐区" />
																<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon8.png" />
																<span>休闲旅游娱乐区</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="26" value="近海旅游娱乐区" />
																<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon9.png" />
																<span>近海旅游娱乐区</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="27" value="河口海洋保护区" />
																<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon10.png" />
																<span>河口海洋保护区</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="28" value="近海海洋保护区" />
																<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon11.png" />
																<span>近海海洋保护区</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="29" value="特殊利用区" />
																<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon12.png" />
																<span>特殊利用区</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="30" value="近海特殊利用区" />
																<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon13.png" />
																<span>近海特殊利用区</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="31" value="保留区" />
																<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon14.png" />
																<span>保留区</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="32" value="近海保留区" />
																<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon15.png" />
																<span>近海保留区</span>
															</div>
														</li>
													</ul>
												</div>
											</li>
											<li class="list-two">
												<div class="two">
													<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
													<input type="checkbox" name="切换图层2" id="33" value="海域公共用海" />
													<span>海域公共用海</span>
												</div>
												<div class="third-menu">
													<ul>
														<li class="list-three">
															<div>
																<div class="three">
																	<img class="icon" src="${contextPath}/images/seasProfession/jia.png" />
																	<input type="checkbox" name="切换图层3" id="35" value="倾倒区" />
																	<span>倾倒区</span>
																</div>
																<div class="fourth-menu">
																	<ul>
																		<li class="list-four">
																			<div class="four">
																				<input type="checkbox" name="切换图层4" id="62" value="停用" />
																				<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-ty.png" />
																				<span>停用</span>
																			</div>
																		</li>
																		<li class="list-four">
																			<div class="four">
																				<input type="checkbox" name="切换图层4" id="63" value="在用" />
																				<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-zy.png" />
																				<span>在用</span>
																			</div>
																		</li>
																	</ul>
																</div>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="34" value="公共排污口" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-ggpw.png" />
																<span>公共排污口</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="36" value="公共航道" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-gghd.png" />
																<span>公共航道</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="37" value="公共锚地" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-ggmd.png" />
																<span>公共锚地</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="38" value="公共路桥" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-gglq.png" />
																<span>公共路桥</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="39" value="保护区" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-bhq.png" />
																<span>保护区</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="40" value="公共港口" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-gggk.png" />
																<span>公共港口</span>
															</div>
														</li>
													</ul>
												</div>
											</li>
											<li class="list-two">
												<div class="two">
													<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
													<input type="checkbox" name="切换图层2" id="41" value="功能区划" />
													<span>功能区划</span>
												</div>
												<div class="third-menu">
													<ul>
														<li class="list-three">
															<div>
																<div class="three">
																	<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
																	<input type="checkbox" name="切换图层3" id="42" value="农渔业区" />
																	<span>农渔业区</span>
																</div>
																<div class="fourth-menu">
																	<ul>
																		<li class="list-four">
																			<div class="four">
																				<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
																				<input type="checkbox" name="切换图层4" id="43" value="海岸农渔业区" />
																				<span>海岸农渔业区</span>
																			</div>
																			<div class="fifth-menu">
																				<ul>
																					<li class="list-five">
																						<div class="five">
																							<input type="checkbox" name="切换图层5" id="44" value="海岸渔港" />
																							<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hayg.png" />
																							<span>海岸渔港</span>
																						</div>
																					</li>
																					<li class="list-five">
																						<div class="five">
																							<input type="checkbox" name="切换图层5" id="45" value="海岸围垦区" />
																							<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hawk.png" />
																							<span>海岸围垦区</span>
																						</div>
																					</li>
																				</ul>
																			</div>
																		</li>
																	</ul>
																</div>
																<div class="fourth-menu">
																	<ul>
																		<li class="list-four">
																			<div class="four">
																				<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
																				<input type="checkbox" name="切换图层4" id="46" value="近海农渔业区" />
																				<span>近海农渔业区</span>
																			</div>
																			<div class="fifth-menu">
																				<ul>
																					<li class="list-five">
																						<div class="five">
																							<input type="checkbox" name="切换图层5" id="47" value="近海养殖区" />
																							<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-jhyz.png" />
																							<span>近海养殖区</span>
																						</div>
																					</li>
																					<li class="list-five">
																						<div class="five">
																							<input type="checkbox" name="切换图层5" id="48" value="近海捕捞区" />
																							<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-jhbn.png" />
																							<span>近海捕捞区</span>
																						</div>
																					</li>
																				</ul>
																			</div>
																		</li>
																	</ul>
																</div>
															</div>
														</li>
														<li class="list-three">
															<div>
																<div class="three">
																	<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
																	<input type="checkbox" name="切换图层3" id="49" value="工业与城镇用海" />
																	<span>工业与城镇用海</span>
																</div>
																<div class="fourth-menu">
																	<ul>
																		<li class="list-four">
																			<div class="four">
																				<input type="checkbox" name="切换图层4" id="50" value="海岸工业与城镇用海区" />
																				<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hacz.png" />
																				<span>海岸工业与城镇用海区</span>
																			</div>
																		</li>
																	</ul>
																</div>
															</div>
														</li>
														<li class="list-three">
															<div>
																<div class="three">
																	<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
																	<input type="checkbox" name="切换图层3" id="51" value="矿产与能源区" />
																	<span>矿产与能源区</span>
																</div>
																<div class="fourth-menu">
																	<ul>
																		<li class="list-four">
																			<div class="four">
																				<input type="checkbox" name="切换图层4" id="52" value="可再生能源区" />
																				<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-kzs.png" />
																				<span>可再生能源区</span>
																			</div>
																		</li>
																	</ul>
																</div>
															</div>
														</li>
														<li class="list-three">
															<div>
																<div class="three">
																	<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
																	<input type="checkbox" name="切换图层3" id="53" value="旅游休闲娱乐区" />
																	<span>旅游休闲娱乐区</span>
																</div>
																<div class="fourth-menu">
																	<ul>
																		<li class="list-four">
																			<div class="four">
																				<input type="checkbox" name="切换图层4" id="54" value="文体休闲娱乐区" />
																				<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-wtxx.png" />
																				<span>文体休闲娱乐区</span>
																			</div>
																		</li>
																	</ul>
																</div>
															</div>
														</li>
														<li class="list-three">
															<div>
																<div class="three">
																	<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
																	<input type="checkbox" name="切换图层3" id="55" value="保留区" />
																	<span>保留区</span>
																</div>
																<div class="fourth-menu">
																	<ul>
																		<li class="list-four">
																			<div class="four">
																				<input type="checkbox" name="切换图层4" id="56" value="近海保留区" />
																				<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-jhbl.png" />
																				<span>近海保留区</span>
																			</div>
																		</li>
																		<li class="list-four">
																			<div class="four">
																				<input type="checkbox" name="切换图层4" id="57" value="海岸保留区" />
																				<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-habl.png" />
																				<span>海岸保留区</span>
																			</div>
																		</li>
																	</ul>
																</div>
															</div>
														</li>
														<li class="list-three">
															<div>
																<div class="three">
																	<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
																	<input type="checkbox" name="切换图层3" id="58" value="特殊利用区" />
																	<span>特殊利用区</span>
																</div>
																<div class="fourth-menu">
																	<ul>
																		<li class="list-four">
																			<div class="four">
																				<input type="checkbox" name="切换图层4" id="59" value="海岸特殊利用区" />
																				<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hats.png" />
																				<span>海岸特殊利用区</span>
																			</div>
																		</li>
																	</ul>
																</div>
															</div>
														</li>
													</ul>
												</div>
											</li>
											<li class="list-two">
												<div class="two">
													<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
													<input type="checkbox" name="切换图层2" id="60" value="区域用海规划" />
													<span>区域用海规划</span>
												</div>
												<div class="third-menu">
													<ul>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="61" value="区域用海规划分区" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-qyyh.png" />
																<span>区域用海规划分区</span>
															</div>
														</li>										
													</ul>
												</div>
											</li>
											<li class="list-two">
												<div class="two">
													<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
													<input type="checkbox" name="切换图层2" id="70" value="基础要素" />
													<span>基础要素</span>
												</div>
												<div class="third-menu">
													<ul>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="0" value="水闸" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-sz.png" />
																<span>水闸</span>
															</div>
														</li>
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="1" value="水文观测站" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-sw.png" />
																<span>水文观测站</span>
															</div>
														</li>	
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="2" value="海域行政界线" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hyjx.png" />
																<span>海域行政界线</span>
															</div>
														</li>	
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="12" value="领海基线" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-lhjx.png" />
																<span>领海基线</span>
															</div>
														</li>	
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="13" value="领海基线外12海里" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-lh12.png" />
																<span>领海基线外12海里</span>
															</div>
														</li>	
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="14" value="海岸线" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hax.png" />
																<span>海岸线</span>
															</div>
														</li>	
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="15" value="海域管理范围" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hygl.png" />
																<span>海域管理范围</span>
															</div>
														</li>	
														<li class="list-three">
															<div class="three">
																<input type="checkbox" name="切换图层3" id="16" value="海底光缆" />
																<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hdgl.png" />
																<span>海底光缆</span>
															</div>
														</li>	
													</ul>
												</div>
											</li>
										</ul>
									</div>				
								</li>	
								<li class="layer">
									<div class="first-menu">
										<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
										<input type="checkbox" name="切换图层1" id="72" value="基础地图" />
										<span>基础地图</span>
									</div>
									<div class="second-menu">
										<ul>
											<li class="list-two">
												<div class="two">
													<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
													<input type="checkbox" name="切换图层2" id="74" value="海域底图" />
													<span>海域底图</span>
												</div>
												<div class="slider">									
											
												</div>
											</li>
										</ul>	
									</div>	
								</li>	
								<li class="layer">
									<div class="first-menu">
										<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />
										<input type="checkbox" name="切换图层1" id="73" value="影像地图" />
										<span>影像地图</span>
									</div>							
								</li>	
							</ul>
						</div>
					</div>
				</div>					
				<div class="layer-icon">
					<ul>
						<li class="layer">
							<div class="first-menu">
								<img class="unfold" src="${contextPath}/images/seasProfession/jia.png" />								
								<span>海域要素服务</span>
							</div>
							<div class="second-menu">
								<ul>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-sz.png" />
											<span>水闸</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-sw.png" />
											<span>水文观测站</span>		
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hyjx.png" />
											<span>海域行政界线</span>		
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-lhjx.png" />
											<span>领海基线</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-lh12.png" />
											<span>领海基线外12海里</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hax.png" />
											<span>海岸线</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hygl.png" />
											<span>海域管理范围</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hdgl.png" />
											<span>海底光缆</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hyxz.png" />
											<span>海域使用项目新增</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hyxz.png" />
											<span>海域使用项目原有</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-cjs.png" />
											<span>冲积沙岛</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-dcgd.png" />
											<span>低潮高地</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-jyd.png" />
											<span>基岩岛</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-aj.png" />
											<span>暗礁</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon1.png" />
											<span>农渔业区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon2.png" />
											<span>近海农渔业区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon3.png" />
											<span>港口航运区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon4.png" />
											<span>工业与城镇用海区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon5.png" />
											<span>近海工业与城镇建设区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon6.png" />
											<span>矿产与能源区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon7.png" />
											<span>近海矿产与能源区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon8.png" />
											<span>休闲旅游娱乐区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon9.png" />
											<span>近海旅游娱乐区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon10.png" />
											<span>河口海洋保护区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon11.png" />
											<span>近海海洋保护区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon12.png" />
											<span>特殊利用区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon13.png" />
											<span>近海特殊利用区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon14.png" />
											<span>保留区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon legend" src="${contextPath}/images/seasProfession/arcgis/icon15.png" />
											<span>近海保留区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-ty.png" />
											<span>停用</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-zy.png" />
											<span>在用</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-ggpw.png" />
											<span>公共排污口</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-gghd.png" />
											<span>公共航道</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-ggmd.png" />
											<span>公共锚地</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-gglq.png" />
											<span>公共路桥</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-bhq.png" />
											<span>保护区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-gggk.png" />
											<span>公共港口</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hayg.png" />
											<span>海岸渔港</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hawk.png" />
											<span>海岸围垦区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-jhyz.png" />
											<span>近海养殖区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-jhbn.png" />
											<span>近海捕捞区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hacz.png" />
											<span>海岸工业与城镇用海区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-kzs.png" />
											<span>可再生能源区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-wtxx.png" />
											<span>文体休闲娱乐区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-jhbl.png" />
											<span>近海保留区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-habl.png" />
											<span>海岸保留区</span>
										</div>										
									</li>
									<li>
										<div class="two">											
											<img class="icon" src="${contextPath}/images/seasProfession/arcgis/icon-hats.png" />
											<span>海岸特殊利用区</span>
										</div>										
									</li>									
								</ul>
							</div>
						</li>
					</ul>
				</div>				
				
				<div class="search-results">
					<div class="results-list" style="height:100%">	
						<div id="scroll1">
							<div style="width: 100%;">					
								<ul id="demoContent"></ul>				 										
							</div>							
						</div>
						<ul class="page" id="page"></ul>
					</div>
				</div>					
				<div class="search-info">
					<div id="scroll2">
						<div style="width: 100%;">
							<ul>
								
							</ul>
						</div>
					</div>
					
				</div>
					
				
				<div class="inquiry-menu">
					<div class="select-box">
						<p>图层：</p>
						<select id="select_layer"><option>请选择</option></select>
						<hr/>
						<div class="condition">
							<div id="term">
															
							</div>
							<ul style="overflow:hidden;" class="ulist">
								<li class="fl"><select id="filter"><option>请选择</option></select></li>
								<li class="fl"><select id="operator"><option>请选择</option></select></li>
								<li class="fl">
									<input id="result" type="text">									
								</li>
								<li class="fr">
									<a href="#" class=""><img src="${contextPath}/images/seasProfession/arcgis/close.png" /></a>
								</li>
							</ul>	
							<div id="result_contain">								
							</div>					
						</div>											
					</div>
					<div class="add_query">
						<div>
							<input type="button" class="button" value="确定"></button>
							<input type="button" class="button" value="搜索"></button> 
						</div>
						<div>
							<input type="button" class="button" value="添加另一个条件"></button>
						</div>						 
					</div>	
				</div>
				<div class="inquiry-results" style="height:100%">
					<div class="results-list" style="height:100%">						
						<ul id="demoContent1"></ul>
 						<ul class="page" id="page1"></ul>						
					</div>
				</div>
				<div class="inquiryResult-info">
					<ul>
						
					</ul>
				</div>
			</div>			
		</div>
		<!--地图工具-->
		<div class="maptools" title="打开工具栏"></div>
		<div class="toolsmenu">
			<div id="tabsbox" class="tabsbox">				
				<ul class="top">
					<li>
						<a href="#tab1" class="selected">工具</a>
					</li>
					<li>
						<a href="#tab2">查询</a>
					</li>
					<li>
						<a href="#tab3">测量</a>
					</li>
					<li>
						<a href="#tab4">标注</a>
					</li>					
				</ul>				
				<div class="tabscont">
					<div id="tab1">
						<div class="tools">
							<ul>
								<li>
									<button title="回到地图初始位置">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool1.png" />
										<p>初始视图</p>
									</button>
								</li>
								<li>
									<button title="取消任何活动的工具，把地图放入指示模式">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool2.png" />
										<p>指示</p>
									</button>
								</li>
								<li>
									<button title="在地图上画一块区域以放大">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool3.png" />
										<p>放大</p>
									</button>
								</li>
								<li>
									<button title="画在地图上的面积缩小，保持区域中心">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool4.png" />
										<p>缩小</p>
									</button>
								</li>
								<li>
									<button title="放大到上一个视角">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool5.png" />
										<p>上一个视角</p>
									</button>
								</li>
								<li>
									<button title="打开书签视图">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool6.png"/>
										<p>书签</p>
									</button>
								</li>
								<li>
									<button title="在地图上选择一个位置">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool7.png" />
										<p>识别</p>
									</button>
								</li>
								<li style="background-color:#efefef;">
									<button title="启用缓冲活动工具">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool40.png" />
										<p>启用缓冲</p>
									</button>
									<button title="启用/禁用层选择确定操作">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool43.png" />
										<p>可识别层</p>
									</button>
								</li>
								<li>
									<button title="保存一个地图图像">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool8.png" />
										<p>导出</p>
									</button>
								</li>								
								<li style="border-right: 1px solid #efefef;">
									<button title="创建一个可打印版本的地图" class="disabled">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool9.png" />
										<p>打印</p>
									</button>
								</li>
							</ul>
						</div>
					</div>
					<div id="tab2">
						<div class="tools">
							<ul>
								<li data="POINT">
									<button title="在地图上选择一个位置">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool10.png" />
										<p>点</p>
									</button>
								</li>
								<li data="FREEHAND_POLYGON">
									<button title="在地图上手绘一个任意的范围">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool11.png" />
										<p>手绘</p>
									</button>
								</li>
								<li data="POLYLINE">
									<button title="在地图上绘制线来查询区域内元素">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool12.png" />
										<p>线</p>
									</button>
								</li>
								<li data="FREEHAND_POLYLINE">
									<button title="在地图上绘制自定义区域来查询元素">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool13.png" />
										<p>多边形</p>
									</button>
								</li>
								<li data="EXTENT" style="border-right: 1px solid #efefef;">
									<button title="在地图上绘制矩形区域来查询元素">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool14.png" />
										<p>矩形</p>
									</button>
								</li>								
							</ul>
							<ul>
								<li id="search">
									<button title="显示简单的查询生成器">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool15.png" />
										<p>查询</p>
									</button>
								</li>
								<li>
									<button title="显示简单的筛选生成器">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool16.png" />
										<p>筛选器</p>
									</button>
								</li>
								<li style="border-right: 1px solid #efefef;">
									<button title="根据经/纬度查询" class="disabled">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool17.png" />
										<p>经纬度查询</p>
									</button>
								</li>													
							</ul>
						</div>
					</div>
					<div id="tab3">
						<div class="tools">
							<ul>
								<li data="POLYLINE">
									<button title="绘制一根线并测量距离">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool18.png" />
										<p>线</p>
									</button>
								</li>
								<li data="FREEHAND_POLYLINE">
									<button title="绘制徒手线测量距离">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool19.png" />
										<p>手绘线</p>
									</button>
								</li>
								<li data="FREEHAND_POLYGEN">
									<button title="计算手绘区域的面积">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool20.png" />
										<p>手绘图形</p>
									</button>
								</li>
								<li data="ELLIPSE">
									<button title="计算椭圆的面积">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool21.png" />
										<p>椭圆</p>
									</button>
								</li>
								<li data="CIRCLE">
									<button title="计算面积一圈">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool22.png" />
										<p>圆</p>
									</button>
								</li>	
								<li data="POLYGEN">
									<button title="计算多边形的面积">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool23.png" />
										<p>多边形</p>
									</button>
								</li>								
								<li data="EXTENT" style="border-right: 1px solid #efefef;">
									<button title="计算矩形的面积">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool24.png" />
										<p>矩形</p>
									</button>
								</li>											
							</ul>
							<ul>
								<li>
									<button title="编辑一个现有的图" class="disabled">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool25.png" />
										<p>编辑</p>
									</button>
								</li>
								<li>
									<button title="删除现有的图" class="disabled">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool26.png" />
										<p>擦除</p>
									</button>
								</li>
								<li style="border-right: 1px solid #efefef;">
									<button title="清除地图上的所有图" class="disabled">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool27.png" />
										<p>清除</p>
									</button>
								</li>													
							</ul>
						</div>
					</div>
					<div id="tab4">
						<div class="tools">
							<ul>
								<li data="POINT">
									<button title="给地图增加一个点">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool28.png" />
										<p>点</p>
									</button>
								</li>
								<li data="TEXT">
									<button title="添加您自己的文本的地图">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool29.png" />
										<p>文本</p>
									</button>
								</li>
								<li data="POLYLINE">
									<button title="在地图上画一条线">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool30.png" />
										<p>线</p>
									</button>
								</li>
								<li data="FREEHAND_POLYLINE">
									<button title="在地图上徒手绘制线">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool31.png" />
										<p>手绘线</p>
									</button>
								</li>
								<li data="FREEHAND_POLYGON">
									<button title="在地图上画任意的形状">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool32.png" />
										<p>手绘形状</p>
									</button>
								</li>	
								<li data="ELLIPSE">
									<button title="在地图上画一个椭圆">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool33.png" />
										<p>椭圆</p>
									</button>
								</li>	
								<li data="CIRCLE">
									<button title="在地图上画了一个圈">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool34.png" />
										<p>圆</p>
									</button>
								</li>
								<li data="POLYGEN">
									<button title="在地图上绘制自定义形状">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool35.png" />
										<p>多边形</p>
									</button>
								</li>							
								<li data="EXTENT" style="border-right: 1px solid #efefef;">
									<button title="在地图上画一个矩形">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool36.png" />
										<p>矩形</p>
									</button>
								</li>											
							</ul>
							<ul>
								<li>
									<button title="编辑一个现有的图" class="disabled">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool37.png" />
										<p>编辑</p>
									</button>
								</li>
								<li>
									<button title="删除现有的图" class="disabled">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool38.png" />
										<p>擦除</p>
									</button>
								</li>
								<li style="border-right: 1px solid #efefef;">
									<button title="清除地图上的所有图" class="disabled">
										<img src="${contextPath}/images/seasProfession/arcgis/icon-tool39.png" />
										<p>清除</p>
									</button>
								</li>													
							</ul>
						</div>
					</div>
				</div>
			</div>			
		</div>
		<div id="map">
			<div id="HomeButton"></div>
		</div>
	</body>
</html>