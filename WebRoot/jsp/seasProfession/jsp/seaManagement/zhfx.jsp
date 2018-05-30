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
					<a href="#">海籍管理</a>
				</li>
				<li>
					<a href="#">海籍综合分析</a>
				</li>
			</ul>
		</div>
		<div style="border:1px solid #CCC; margin-bottom:8px;">
			<div class="formbody">
				<div class="leftinfo1">
					<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
					<table width="100%" align="center" style="text-align:center;">
						<tr>
							<td width="20%">统计方式：</td>
							<td width="80%" style="text-align:left;">&nbsp;&nbsp;&nbsp;
								<input name="" type="radio" value="" checked="checked" />按年份统计&nbsp;&nbsp;&nbsp;
								<input name="" type="radio" value="" />按区域统计&nbsp;&nbsp;&nbsp;
								<input name="" type="radio" value="" />按用海类型统计&nbsp;&nbsp;&nbsp;
								<input name="" type="radio" value="" />按批准级别
							</td>
						</tr>
						<tr>
							<td>统计要素：</td>
							<td style="text-align:left;">&nbsp;&nbsp;&nbsp;
								<input name="" type="radio" value="" />证书数量&nbsp;&nbsp;&nbsp;
								<input name="" type="radio" value="" checked="checked" />海域使用面积&nbsp;&nbsp;&nbsp;
								<input name="" type="radio" value="" />海域使用总金额
							</td>
						</tr>
						<tr>
							<td>统计内容：</td>
							<td style="text-align:left;">&nbsp;&nbsp;&nbsp;
								<input name="" type="radio" value="" />本单位及下属单位数据&nbsp;&nbsp;&nbsp;
								<input name="" type="radio" value="" checked="checked" />本单位数据
							</td>
						</tr>
						<tr>
							<td>展示方式：</td>
							<td style="text-align:left;">&nbsp;&nbsp;&nbsp;
								<input name="" type="radio" value="" checked="checked" />柱状图&nbsp;&nbsp;&nbsp;
								<input name="" type="radio" value="" />饼状图&nbsp;&nbsp;&nbsp;
								<input name="" type="radio" value="" />折线图
							</td>
						</tr>

						<tr>
							<td colspan="2">
								<input name="" type="button" class="scbtn1" value="查询" />
								<input name="" type="reset" class="scbtn1" value="重置" />
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div id="usual1" class="usual">
				<div class="leftinfo1">
					<div class="itab">
						<ul>
							<li>
								<a href="#tab1" class="selected">面积统计</a>
							</li>
							<li>
								<a href="#tab2">海籍分布</a>
							</li>
							<li>
								<a href="#tab3">使用状况</a>
							</li>
						</ul>
					</div>

					<div id="tab1" class="tabson">
						<div id="main" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
						</div>
						<script type="text/javascript">
							var myChart = echarts.init(document.getElementById("main"));
							option = {
								title: {
									text: '面积统计'
								},
								tooltip: {
									trigger: 'axis'
								},
								color: [
									'#3cb371', '#ffa500', '#da70d6', '#da70d6', '#6495ed',
									'#ff69b4', '#ba55d3', '#cd5c5c', '#40e0d0',
									'#1e90ff', '#ff6347', '#7b68ee', '#00fa9a', '#ffd700',
									'#6b8e23', '#3cb371', '#b8860b', '#30e0e0'
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
									data: ['2017年', '2016年', '2015年', '2014年', '2013年']
								}],
								yAxis: [{
									type: 'value'
								}],
								series: [{
									name: '面积统计',
									type: 'bar',
									data: [487598454, 807456321.6, 487598120.0, 748965136.4, 48569843.3],
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
								}]
							};

							myChart.setOption(option);
						</script>

					</div>

					<div id="tab2" class="tabson">

						<div id="main1" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
						</div>
						<script type="text/javascript">
							var myChart1 = echarts.init(document.getElementById("main1"));
							option = {
								title: {
									text: '海籍分布'
								},
								tooltip: {
									trigger: 'axis'
								},
								color: [
									'#1e90ff', '#3cb371', '#ffa500', '#da70d6', '#da70d6', '#6495ed',
									'#ff69b4', '#ba55d3', '#cd5c5c', '#40e0d0',
									'#1e90ff', '#ff6347', '#7b68ee', '#00fa9a', '#ffd700',
									'#6b8e23', '#3cb371', '#b8860b', '#30e0e0'
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
									data: ['区域1', '区域2', '区域3', '区域4', '区域5']
								}],
								yAxis: [{
									type: 'value'
								}],
								series: [{
									name: '海籍数',
									type: 'bar',
									data: [488454, 807321.6, 487120.0, 748136.4, 48843.3],
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
								}]
							};

							myChart1.setOption(option);
						</script>

					</div>

					<div id="tab3" class="tabson">
						<div id="main2" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
						</div>
						<script type="text/javascript">
							var myChart2 = echarts.init(document.getElementById("main2"));
							option = {
								title: {
									text: '使用状态'
								},
								tooltip: {
									trigger: 'axis'
								},
								color: [
									'#40e0d0', '#3cb371', '#ffa500', '#da70d6', '#da70d6', '#6495ed',
									'#ff69b4', '#ba55d3', '#cd5c5c', '#40e0d0',
									'#1e90ff', '#ff6347', '#7b68ee', '#00fa9a', '#ffd700',
									'#6b8e23', '#3cb371', '#b8860b', '#30e0e0'
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
									data: ['未使用', '正在使用', '已到期']
								}],
								yAxis: [{
									type: 'value'
								}],
								series: [{
									name: '数量',
									type: 'bar',
									data: [48759, 80745, 48758, 74896, 48569],
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
								}]
							};

							myChart2.setOption(option);
						</script>

					</div>
					<br />

				</div>
			</div>
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

	</body>

</html>