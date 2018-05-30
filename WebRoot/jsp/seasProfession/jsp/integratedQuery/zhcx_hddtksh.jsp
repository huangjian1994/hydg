<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海岛动态可视化</title>

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
					<a href="#">海岛动态可视化</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div id="usual1" class="usual">
				<div class="itab">
					<ul>
						<li>
							<a href="#tab1" class="selected">海岛信息展示</a>
						</li>
						<li>
							<a href="#tab2">统计分析</a>
						</li>
					</ul>
				</div>

				<div id="tab1" class="tabson">
					<div class="leftinfo1">
						<!--开始 -->

						<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
						<table width="90%" align="center" style="text-align:center;">
							<tr>
								<td width="130px">岛屿名称：</td>
								<td align="left"><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>

								<td width="130px"> 有无人居住：</td>
								<td align="left">
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="">有</option>
										<option value="">无</option>

									</select>
								</td>
							</tr>
							<tr>
								<td width="130px">区域：</td>
								<td align="left">
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="崇明县">崇明县</option>
										<option value="宝山区">宝山区</option>
										<option value="浦东新区">浦东新区</option>
										<option value="奉贤区">奉贤区</option>
										<option value="金山区">金山区</option>
									</select>
								</td>

								<td width="180px">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="button" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input name="" type="reset" class="scbtn1" value="重置" /> &nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>

						</table>
					</div>
					<!--结束-->

					<table class="tablelist">
						<thead>
							<tr>
								<th><input name="" type="checkbox" value="" checked="checked" /></th>
								<th>海岛名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
								<th>是否有人居住</th>
								<th>海岛面积</th>
								<th>海岛位置</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input name="" type="checkbox" value="" /></td>
								<td>崇明岛</td>
								<td>有</td>
								<td>130</td>
								<td>北纬39度</td>
								<td>
									<a href="haidaomap.jsp" class="tablelink">查看</a>
								</td>
							</tr>
							<tr>
								<td><input name="" type="checkbox" value="" /></td>
								<td>海洋岛</td>
								<td>无</td>
								<td>120</td>
								<td>北纬39.56度</td>
								<td>
									<a href="haidaomap.jsp" class="tablelink">查看</a>
								</td>
							</tr>
							<tr>
								<td><input name="" type="checkbox" value="" /></td>
								<td>荷包岛</td>
								<td>无</td>
								<td>140</td>
								<td>北纬39度</td>
								<td>
									<a href="haidaomap.jsp" class="tablelink">查看</a>
								</td>
							</tr>
							<tr>
								<td><input name="" type="checkbox" value="" /></td>
								<td>崇明岛</td>
								<td>有</td>
								<td>130</td>
								<td>北纬39度</td>
								<td>
									<a href="haidaomap.jsp" class="tablelink">查看</a>
								</td>
							</tr>
							<tr>
								<td><input name="" type="checkbox" value="" /></td>
								<td>海洋岛</td>
								<td>无</td>
								<td>120</td>
								<td>北纬39.56度</td>
								<td>
									<a href="haidaomap.jsp" class="tablelink">查看</a>
								</td>
							</tr>
							<tr>
								<td><input name="" type="checkbox" value="" /></td>
								<td>荷包岛</td>
								<td>无</td>
								<td>140</td>
								<td>北纬39度</td>
								<td>
									<a href="haidaomap.jsp" class="tablelink">查看</a>
								</td>
							</tr>
						</tbody>
					</table>
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
				</div>

				<div id="tab2" class="tabson">
					<div class="leftinfo1">

						<table width="90%" align="center" style="text-align:center;">
							<tr>
								<td width="130px">行政区域：</td>
								<td align="left">
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="崇明县">崇明县</option>
										<option value="宝山区">宝山区</option>
										<option value="浦东新区">浦东新区</option>
										<option value="奉贤区">奉贤区</option>
										<option value="金山区">金山区</option>
									</select>
								</td>

								<td width="130px">海岛名称:</td>
								<td align="left"><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>

							</tr>
							<tr>
								<td width="130px">统计图类型：</td>
								<td align="left">
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="" selected="selected">柱状图</option>
										<option value="">饼状图</option>
									</select>
								</td>
								<td width="180px">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="button" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input name="" type="reset" class="scbtn1" value="重置" /> &nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>

						</table>
					</div>
					<!--大tab开始-->
					<div id="usual1" class="usual">
						<div class="itab">
							<ul>
								<li>
									<a href="#tab3">综合展示</a>
								</li>
								<li>
									<a href="#tab4">海岛土地利用</a>
								</li>
								<li>
									<a href="#tab5">人口</a>
								</li>
								<li>
									<a href="#tab6">经济</a>
								</li>
								<li>
									<a href="#tab7">企业信息</a>
								</li>
								<li>
									<a href="#tab8">码头</a>
								</li>
							</ul>
						</div>

						<div id="tab3" class="tabson">
							<div id="main" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
							</div>
							<script type="text/javascript">
								var myChart = echarts.init(document.getElementById("main"));
								option = {
									title: {
										text: '海岛综合信息统计图'
									},
									tooltip: {
										trigger: 'axis'
									},
									color: [
										'#ffa500', '#da70d6', '#da70d6', '#6495ed',
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
										data: ['海岛土地利用', '人口', '经济', '企业信息', '码头']
									}],
									yAxis: [{
										type: 'value'
									}],
									series: [{
										name: '海岛综合信息统计图',
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

						<div id="tab4" class="tabson">
							<!---  代码开始-->
							<div id="main1" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
							</div>
							<script type="text/javascript">
								var myChart1 = echarts.init(document.getElementById("main1"));
								option = {
									title: {
										text: '海岛土地利用情况'
									},
									tooltip: {
										trigger: 'axis'
									},

									color: [
										'#ba55d3', '#da70d6', '#6495ed',
										'#ff69b4', '#cd5c5c', '#ffa500', '#40e0d0',
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
										data: ['海岛1', '海岛2', '海岛3', '海岛4', '海岛5', '海岛6']
									}],
									yAxis: [{
										type: 'value'
									}],
									series: [{
										name: '海岛土地利用情况',
										type: 'bar',
										data: [95157.0, 15278.7, 13516.6, 58987.0, 17698.4, 97485.3],
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
							<!---  代码结束-->
						</div>

						<div id="tab5" class="tabson">
							<!---  代码开始-->
							<div id="main2" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
							</div>
							<script type="text/javascript">
								var myChart2 = echarts.init(document.getElementById("main2"));
								option = {
									title: {
										text: '人口统计',
										x: 'center'
									},
									tooltip: {
										trigger: 'item',
										formatter: "{a} <br/>{b} : {c} ({d}%)"
									},
									legend: {
										orient: 'vertical',
										x: 'left',
										data: ['海岛1', '海岛2', '海岛3', '海岛4', '海岛5']
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
												type: ['pie', 'funnel'],
												option: {
													funnel: {
														x: '25%',
														width: '50%',
														funnelAlign: 'left',
														max: 1548
													}
												}
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
									series: [{
										name: '人口统计',
										type: 'pie',
										radius: '55%',
										center: ['50%', '60%'],
										data: [{
												value: 335,
												name: '海岛1'
											},
											{
												value: 310,
												name: '海岛2'
											},
											{
												value: 234,
												name: '海岛3'
											},
											{
												value: 135,
												name: '海岛4'
											},
											{
												value: 1548,
												name: '海岛5'
											}
										]
									}]
								};

								myChart2.setOption(option);
							</script>
							<!---  代码结束-->
						</div>
						<div id="tab6" class="tabson">
							<!---  代码开始-->
							<div id="main6" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
							</div>
							<script type="text/javascript">
								var myChart6 = echarts.init(document.getElementById("main6"));
								option = {
									title: {
										text: '经济情况统计'
									},
									tooltip: {
										trigger: 'axis'
									},

									color: [
										'#ffa500', '#ffd700', '#da70d6', '#6495ed',
										'#ff69b4', '#ba55d3', '#cd5c5c', '#40e0d0',
										'#1e90ff', '#ff6347', '#7b68ee', '#00fa9a',
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
										data: ['海岛1', '海岛2', '海岛3', '海岛4', '海岛5', '海岛6']
									}],
									yAxis: [{
										type: 'value'
									}],
									series: [{
										name: '经济情况统计',
										type: 'bar',
										data: [1365897, 4123976, 4896756, 4986573, 1957896, 1546792],
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

								myChart6.setOption(option);
							</script>
							<!---  代码结束-->
						</div>
						<div id="tab7" class="tabson">
							<!---  代码开始-->
							<div id="main7" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
							</div>
							<script type="text/javascript">
								var myChart7 = echarts.init(document.getElementById("main7"));
								option = {
									title: {
										text: '企业统计'
									},
									tooltip: {
										trigger: 'axis'
									},

									color: [
										'#6b8e23', '#ff6347', '#da70d6', '#6495ed',
										'#ff69b4', '#ba55d3', '#cd5c5c', '#ffa500', '#40e0d0',
										'#1e90ff', '#7b68ee', '#00fa9a', '#ffd700',
										'#ff00ff', '#3cb371', '#b8860b', '#30e0e0'
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
										data: ['海岛1', '海岛2', '海岛3', '海岛4', '海岛5', '海岛6']
									}],
									yAxis: [{
										type: 'value'
									}],
									series: [{
										name: '企业统计',
										type: 'bar',
										data: [7896542, 7486951, 1798965, 4875962, 1789654, 1846975],
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

								myChart7.setOption(option);
							</script>
							<!---  代码结束-->
						</div>
						<div id="tab8" class="tabson">
							<!---  代码开始-->
							<div id="main8" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
							</div>
							<script type="text/javascript">
								var myChart8 = echarts.init(document.getElementById("main8"));
								option = {
									title: {
										text: '海岛码头统计'
									},
									tooltip: {
										trigger: 'axis'
									},

									color: [
										'#cd5c5c', '#da70d6', '#6495ed',
										'#ff69b4', '#ba55d3', '#ffa500', '#40e0d0',
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
										data: ['海岛1', '海岛2', '海岛3', '海岛4', '海岛5', '海岛6']
									}],
									yAxis: [{
										type: 'value'
									}],
									series: [{
										name: '海岛土地利用情况',
										type: 'bar',
										data: [7489652.0, 1485698.7, 1479856.6, 4893652.0, 1478576.4, 4785692.3],
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

								myChart8.setOption(option);
							</script>
							<!---  代码结束-->
						</div>
						< </div>
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