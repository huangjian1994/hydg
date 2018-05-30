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

			function godatil() {
				window.open("detail.html", "displayWindow", "menubar=yes,width=600,height=450");
			}
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
					<a href="#">海域动态可视化</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div id="usual1" class="usual">
				<div class="itab">
					<ul>
						<li>
							<a href="#tab1" class="selected">海域展现</a>
						</li>
						<li>
							<a href="#tab2">查询统计</a>
						</li>
					</ul>
				</div>

				<div id="tab1" class="tabson">
					<div class="leftinfo1">
						<!--开始-->

						<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
						<table width="90%" align="center" style="text-align:center;">
							<tr>
								<td>巡查时间：</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
								<td>地区：</td>
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
								<td>用海类型：</td>
								<td>
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="农业围垦用海">农业围垦用海</option>
										<option value="港口航运用海">港口航运用海</option>
										<option value="建设围垦用海">建设围垦用海</option>
										<option value="旅游娱乐用海">旅游娱乐用海</option>
										<option value="保护区用海">保护区用海</option>
										<option value="新能源用海">新能源用海</option>
										<option value="特殊用海">特殊用海</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>使用人：</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>

								<td>使用期限：</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
							</tr>
							<br />
							<tr>
								<td colspan="6">
									<input name="" type="button" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input name="" type="reset" class="scbtn1" value="重置" /> &nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>

						</table>
					</div>
					<!--结束-->
					<!--下边开始-->
					<div id="usual1" class="usual" style="width:300px; height:500px;float:left">
						<!--左上边开始--->
						<div class="leftinfo1">
							<!--开始-->

							<div class="listtitle3">海域信息</div>
							<table width="90%" align="center" style="text-align:center;">
								<tr>
									<td width="150px">宗海位置：</td>
									<td align="left">经纬130</td>
								</tr>
								<tr>
									<td width="150px">界&nbsp; &nbsp; &nbsp; 址：</td>
									<td align="left">偏离海岸</td>
								</tr>
								<tr>
									<td width="150px">权&nbsp; &nbsp; &nbsp; 属：</td>
									<td align="left">金山区</td>
								</tr>
								<tr>
									<td width="150px">面&nbsp; &nbsp; &nbsp; 积：</td>
									<td align="left">300平方米</td>
								</tr>
								<tr>
									<td width="150px">用海年限：</td>
									<td align="left"> 5年</td>
								</tr>
								<br />
								<tr>
									<td>
										<input name="" type="button" class="scbtn1" value="海域使用情况" style="width:120px; height:30px" /> &nbsp;&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										<input name="" type="button" class="scbtn1" value="项目情况" onclick="godatil()" style="width:80px;height:30px" /> &nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>

							</table>
						</div>
						<!---左上边结束--->
						<!---左下边开始-->
						<div style="margin-left:10px"><img src="${contextPath}/images/seasProfession/zhcx/xiao.png" width="280px" style="margin-top:4px;"></div>
						<!--左下边结束-->

					</div>

					<div style="float:left;">
						<div style="margin-left:10px"><img src="${contextPath}/images/seasProfession/zhcx/damap.png" width="700px" height="500" style="margin-top:4px;"></div>
					</div>
					<!--下边结束-->

				</div>

				<div id="tab2" class="tabson">
					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>

						<table width="90%" align="center" style="text-align:center;">
							<tr>
								<td>分类：</td>
								<td align="left">
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="海塘巡查" selected="selected">海塘巡查</option>
										<option value="海域海岛巡查">海域海岛巡查</option>
									</select>

								</td>
								<td>年份：</td>
								<td align="left">
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option selected="selected">2016年</option>
										<option>2015年</option>
										<option>2014年</option>
										<option>2013年</option>
										<option>2012年</option>
										<option>2011年</option>
										<option>2010年</option>
										<option>2009年</option>
										<option>2008年</option>
										<option>2007年</option>
										<option>2006年</option>
										<option>2005年</option>
									</select> &nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option selected="selected">2016年</option>
										<option>2015年</option>
										<option>2014年</option>
										<option>2013年</option>
										<option>2012年</option>
										<option>2011年</option>
										<option>2010年</option>
										<option>2009年</option>
										<option>2008年</option>
										<option>2007年</option>
										<option>2006年</option>
										<option>2005年</option>
									</select>
								</td>

							</tr>
							<tr>
								<td colspan="6">
									<input name="" type="button" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input name="" type="reset" class="scbtn1" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>

						</table>
					</div>
					<!--大tab开始-->
					<div id="usual1" class="usual">
						<div class="itab">
							<ul>
								<li>
									<a href="#tab4" class="selected">区域统计图</a>
								</li>
								<li>
									<a href="#tab3">年份统计图</a>
								</li>
							</ul>
						</div>

						<div id="tab4" class="tabson">
							<div id="main" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
							</div>
							<script type="text/javascript">
								var myChart = echarts.init(document.getElementById("main"));
								option = {
									title: {
										text: '区域统计图'
									},
									tooltip: {
										trigger: 'axis'
									},
									legend: {
										data: ['用海面积量', '用海项目量']
									},
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
										data: ['区域1', '区域2', '区域3', '区域4', '区域5', '区域6']
									}],
									yAxis: [{
										type: 'value'
									}],
									series: [{
											name: '用海面积量',
											type: 'bar',
											data: [37.0, 76.7, 135.6, 120.0, 136.4, 43.3],
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
											name: '用海项目量',
											type: 'bar',
											data: [42.6, 59.0, 26.4, 28.7, 70.7, 72.3],
											markPoint: {
												data: [{
														name: '年最高',
														value: 72.3,
														xAxis: 7,
														yAxis: 183,
														symbolSize: 18
													},
													{
														name: '年最低',
														value: 26.4,
														xAxis: 11,
														yAxis: 3
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

								myChart.setOption(option);
							</script>
						</div>

						<div id="tab3" class="tabson">

							<!---  代码开始-->
							<div id="main1" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
							</div>
							<script type="text/javascript">
								var myChart1 = echarts.init(document.getElementById("main1"));
								option = {
									title: {
										text: '年份统计图'
									},
									tooltip: {
										trigger: 'axis'
									},
									legend: {
										data: ['用海面积量', '用海项目量']
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
										data: ['2010', '2011', '2012', '2013', '2014', '2015']
									}],
									yAxis: [{
										type: 'value'
									}],
									series: [{
											name: '用海面积量',
											type: 'bar',
											data: [95.0, 152.7, 135.6, 58.0, 176.4, 95.3],
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
											name: '用海项目量',
											type: 'bar',
											data: [142.6, 184.0, 126.4, 172.7, 70.7, 72.3],
											markPoint: {
												data: [{
														name: '年最高',
														value: 172.7,
														xAxis: 7,
														yAxis: 183,
														symbolSize: 18
													},
													{
														name: '年最低',
														value: 70.7,
														xAxis: 11,
														yAxis: 3
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