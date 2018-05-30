<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>

		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/easyui.css" rel="stylesheet" type="text/css" />
		<!--<link href="${contextPath}/css/select.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/icon.css" rel="stylesheet" type="text/css" />-->

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/mycharts/echarts-all.js"></script>

		<script type="text/javascript">
			$(function() {
				$('#cc').combo({
					required: true,
					editable: false
				});
				$('#sp').appendTo($('#cc').combo('panel'));
				$('#sp input').click(function() {
					var v = $(this).val();
					var s = $(this).next('span').text();
					$('#cc').combo('setValue', v).combo('setText', s).combo('hidePanel');
				});
			});
		</script>

	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海域综合查询</a>
				</li>
				<li>
					<a href="#">海洋功能区划可视化</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div id="usual1" class="usual">
				<div class="itab">
					<ul>
						<li>
							<a href="#tab1" class="selected">功能区划信息展示</a>
						</li>
						<li>
							<a href="#tab2">统计分析</a>
						</li>
					</ul>
				</div>

				<div id="tab1" class="tabson">
					<div class="leftinfo1">
						<!--开始-->

						<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
						<table width="90%" align="center" style="text-align:center;">
							<tr>
								<td>功能区名称：</td>
								<td>
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="">上海海域重点区域</option>
										<option value="">农渔业区</option>
										<option value="">港口航运区</option>
										<option value="">工业与城镇建设区</option>
										<option value="">矿产与能源区</option>
										<option value="">旅游区</option>
										<option value="">河口海洋保护区</option>
										<option value="">特殊利用区</option>
									</select>
								</td>
								<td>区县：</td>
								<td>
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="崇明县">崇明县</option>
										<option value="宝山区">宝山区</option>
										<option value="浦东新区">浦东新区</option>
										<option value="奉贤区">奉贤区</option>
										<option value="金山区">金山区</option>
									</select>
								</td>

								<td>
									<input name="" type="button" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input name="" type="reset" class="scbtn1" value="重置" /> &nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>

						</table>
					</div>
					<!--结束-->
					<!--下边开始-->
					<div id="usual1" class="usual">
						<!--左上边开始--->
						<div class="leftinfo1">
							<!--开始-->
							<table class="tablelist">
								<thead>
									<tr>
										<th><input name="" type="checkbox" value="" checked="checked" /></th>
										<th>功能区名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
										<th>区县</th>
										<th>矢量信息</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input name="" type="checkbox" value="" /></td>
										<td>上海海域重点区域</td>
										<td>崇明县</td>
										<td>北纬39度</td>
										<td>
											<a href="map.jsp" class="tablelink">地图展示</a>
										</td>
									</tr>
									<tr>
										<td><input name="" type="checkbox" value="" /></td>
										<td>农渔业区</td>
										<td>浦东新区</td>
										<td>北纬39.56度</td>
										<td>
											<a href="map.jsp" class="tablelink">地图展示</a>
										</td>
									</tr>
									<tr>
										<td><input name="" type="checkbox" value="" /></td>
										<td>港口航运区</td>
										<td>奉贤区</td>
										<td>北纬39度</td>
										<td>
											<a href="map.jsp" class="tablelink">地图展示</a>
										</td>
									</tr>
									<tr>
										<td><input name="" type="checkbox" value="" /></td>
										<td>工业与城镇建设区</td>
										<td>宝山区</td>
										<td>北纬39度</td>
										<td>
											<a href="map.jsp" class="tablelink">地图展示</a>
										</td>
									</tr>
									<tr>
										<td><input name="" type="checkbox" value="" /></td>
										<td>矿产与能源区</td>
										<td>奉贤区</td>
										<td>北纬39.56度</td>
										<td>
											<a href="map.jsp" class="tablelink">地图展示</a>
										</td>
									</tr>
									<tr>
										<td><input name="" type="checkbox" value="" /></td>
										<td>旅游区</td>
										<td>金山区</td>
										<td>北纬39度</td>
										<td>
											<a href="map.jsp" class="tablelink">地图展示</a>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="pagin">
							<div class="message">共<i class="blue">100</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
							<ul class="paginList">
								<li class="paginItem">
									<a href="javascript:;"><span class="pagepre"></span></a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">1</a>
								</li>
								<li class="paginItem current">
									<a href="javascript:;">2</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">3</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">4</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">5</a>
								</li>
								<li class="paginItem more">
									<a href="javascript:;">...</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">10</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;"><span class="pagenxt"></span></a>
								</li>
							</ul>
						</div>

						<!---左上边结束--->

					</div>

					<!--下边结束-->

				</div>

				<div id="tab2" class="tabson">
					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>

						<table width="90%" align="center" style="text-align:center;">
							<tr>
								<td>功能区名称：</td>
								<td>
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="">上海海域重点区域</option>
										<option value="">农渔业区</option>
										<option value="">港口航运区</option>
										<option value="">工业与城镇建设区</option>
										<option value="">矿产与能源区</option>
										<option value="">旅游区</option>
										<option value="">河口海洋保护区</option>
										<option value="">特殊利用区</option>
									</select>
								</td>
								<td>区县：</td>
								<td>
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="崇明县">崇明县</option>
										<option value="宝山区">宝山区</option>
										<option value="浦东新区">浦东新区</option>
										<option value="奉贤区">奉贤区</option>
										<option value="金山区">金山区</option>
									</select>
								</td>

								<td>
									<input name="" type="button" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input name="" type="reset" class="scbtn1" value="重置" /> &nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
						</table>
					</div>
					<!--大tab开始-->
					<div id="usual1" class="usual">

						<!---  代码开始-->
						<div id="main1" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
						</div>
						<script type="text/javascript">
							var myChart1 = echarts.init(document.getElementById("main1"));
							option = {
								title: {
									text: '功能区经济资源统计图'
								},
								tooltip: {
									trigger: 'axis'
								},
								legend: {
									data: ['经济', '资源']
								},
								color: [
									'#da70d6', '#6495ed',
									'#ff69b4', '#ba55d3', '#cd5c5c', '#ffa500', '#40e0d0',
									'#1e90ff', '#ff6347', '#7b68ee', '#00fa9a', '#ffd700',
									'#6b8e23', '#ff00ff', '#3cb371', '#b8860b', '#30e0e0'
								],
								toolbox: {
									show: true,
									feature: {
										mark: {
											show: true
										},
										dataView: {
											show: true,
											readOnly: false
										},
										magicType: {
											show: true,
											type: ['line', 'bar']
										},
										restore: {
											show: true
										},
										saveAsImage: {
											show: true
										}
									}
								},
								calculable: true,
								xAxis: [{
									type: 'category',
									data: ['上海海域重点区域', '农渔业区', '港口航运区', '工业与城镇建设区', '矿产与能源区', '旅游区', '河口海洋保护区', '特殊利用区']
								}],
								yAxis: [{
									type: 'value'
								}],
								series: [{
										name: '经济',
										type: 'bar',
										data: [25698745, 15362465, 45123625, 35216546, 17654123, 14563255, 54123654, 41236541],
										markPoint: {
											data: [{
													type: 'max',
													name: '最大值'
												},
												{
													type: 'min',
													name: '最小值'
												}
											]
										},
										markLine: {
											data: [{
												type: 'average',
												name: '平均值'
											}]
										}
									},
									{
										name: '资源',
										type: 'bar',
										data: [1485692, 2456321, 4512365, 4123658, 4125638, 4562318, 7458964, 8451268],
										markPoint: {
											data: [{
													type: 'max',
													name: '最大值'
												},
												{
													type: 'min',
													name: '最小值'
												}
											]
										},
										markLine: {
											data: [{
												type: 'average',
												name: '平均值'
											}]
										}
									}
								]
							};

							myChart1.setOption(option);
						</script>
						<!---  代码结束-->

					</div>
					<!--大tab结束-->
				</div>

			</div>
			<br />
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

	</body>

</html>