<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/mycharts/echarts-all.js"></script>

	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">统计分析</a>
				</li>
				<li>
					<a href="#">海域使用统计数据</a>
				</li>
			</ul>
		</div>

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

		<!--

 <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>海域名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
        <th>海域类型</th>
        <th>使用面积(平方千米)</th>
        <th>占用岸线</th>
        <th>新增或变更用海类型</th>
        <th>新增或变更面积(平方千米)</th>
        <th>用滩涂浅海面积(平方千米)</th>
        <th>功能区利用状况</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>外高桥港区</td>
        <td>海域</td>
        <td>10</td>
        <td>海岸线</td>
        <td>科技国际</td>
        <td>11</td>
        <td>5</td>
        <td>良</td>
        </tr> 
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>长江口区域</td>
        <td>海塘</td>
        <td>8</td>
        <td>海岸线</td>
        <td>尽快发来</td>
        <td>9</td>
        <td>3</td>
        <td>中</td>
        </tr> 
         <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>杭州湾区域</td>
        <td>海塘</td>
        <td>7</td>
        <td>海岸线</td>
        <td>然后东海</td>
        <td>7</td>
        <td>1</td>
        <td>优</td>
        </tr>  
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>崇头边滩保留区</td>
        <td>海岛</td>
        <td>21</td>
        <td>海岸线</td>
        <td>几点思考</td>
        <td>18</td>
        <td>16</td>
        <td>良</td>
        </tbody>
    </table>
 <div class="pagin">
    	<div class="message">共<i class="blue">10</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem"><a href="javascript:;">1</a></li>
        <li class="paginItem current"><a href="javascript:;">2</a></li>
        <li class="paginItem"><a href="javascript:;">3</a></li>
        <li class="paginItem"><a href="javascript:;">4</a></li>
        <li class="paginItem"><a href="javascript:;">5</a></li>
        <li class="paginItem more"><a href="javascript:;">...</a></li>
        <li class="paginItem"><a href="javascript:;">10</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>
	
	-->

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

		</div>

	</body>

</html>