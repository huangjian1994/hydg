<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>查询统计</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/mycharts/echarts-all.js"></script>
		<style>
			.search {
				width: 100px;
				height: 28px;
				background-image: url(${contextPath}/images/seasInspection/search01.png);
			}
		</style>
	</head>

	<body>

		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li><a href="#">查询统计</a></li>
				<li><a href="#">状态统计</a></li>
			</ul>
		</div>

		<div class="formbody">

			<div id="usual1" class="usual">

				<div class="itab">
					<ul>
						<li><a href="#tab4" onclick="doSearch(4)" >查询</a></li>
						<li><a href="#tab1" onclick="doSearch(1)">月报</a></li>
						<li><a href="#tab2" onclick="doSearch(2)">季报</a></li>
						<li><a href="#tab3" onclick="doSearch(3)">年报</a></li>
					</ul>
				</div>
				<div id="tab4" class="tabson">

					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
						<s:form namespace="/seaPatorl" action="swPatorl_statistic.do" method="post">
						<table width="90%" align="center" style="text-align:center;">
							<tr>
								<td>分类：</td>
								<td align="left">
								<s:select name="type" id="type4" cssStyle="width:180px;height:25px;" list="#{'1':'堤防','2':'海塘'}"></s:select>
								</td>

								<td>统计要素：</td>
								<td align="left">
									<s:select name="element" id="element4" cssStyle="width:180px;height:25px;" list="#{'1':'市区','2':'状态'}"></s:select>
								</td>
							</tr>
							<tr>
								<td>状态：</td>
								<td align="left">
									<s:select name="part" id="part4" cssStyle="width:180px;height:25px;" list="#{'fx':'发现','la':'立案阶段','pq':'派遣阶段','ja':'结案阶段'}"></s:select>
								</td>
								<td>时间段：</td>
								<td align="left">
									<s:textfield onclick="WdatePicker()" name="strBT" id="strBT4"></s:textfield>
									&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;
									<s:textfield onclick="WdatePicker()" name="strET" id="strET4"></s:textfield>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<input type="button" onclick="doSearch(4)" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" onclick="resetForm(4)" class="scbtn1" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>

					</table>
					</s:form>
					</div>

					<!---  代码开始-->
					<div id="main4" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
					</div>
					<!---  代码结束-->

				</div>
				<div id="tab1" class="tabson">

					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
						<s:form namespace="/seaPatorl" action="swPatorl_statistic.do" method="post">
						<table width="90%" align="center" style="text-align:center;">
							<tr>
								<td>分类：</td>
								<td align="left">
								<s:select name="type" id="type1" cssStyle="width:180px;height:25px;" list="#{'1':'堤防','2':'海塘'}"></s:select>
								</td>
								
								<td>统计要素：</td>
								<td align="left">
									<s:select name="element" id="element1" cssStyle="width:180px;height:25px;" list="#{'1':'市区','2':'状态'}"></s:select>
								</td>
							</tr>
							<tr>
								<td>项目：</td>
								<td align="left">
									<s:select name="part" id="part1" cssStyle="width:180px;height:25px;" list="#{'fx':'发现','la':'立案阶段','pq':'派遣阶段','ja':'结案阶段'}"></s:select>
								</td>

								<td>月份：</td>
								<td align="left">
									<s:select name="strBT" id="strBT1" cssStyle="width:180px;height:25px;" list="#{'01-01':'1月',
										'02-01':'2月',
										'03-01':'3月',
										'04-01':'4月',
										'05-01':'5月',
										'06-01':'6月',
										'07-01':'7月',
										'08-01':'8月',
										'09-01':'9月',
										'10-01':'10月',
										'11-01':'11月',
										'12-01':'12月'}"></s:select>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<input type="button" onclick="doSearch(1)" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" onclick="resetForm(1)" class="scbtn1" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>

					</table>
					</s:form>
					</div>

					<!---  代码开始-->
					<div id="main1" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
					</div>
					<!---  代码结束-->

				</div>

				<div id="tab2" class="tabson">
					<!---查询部分开始-->
					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
						<s:form namespace="/seaPatorl" action="swPatorl_statistic.do" method="post">
						<table width="90%" align="center" style="text-align:center;">
							<tr>
								<td>分类：</td>
								<td align="left">
								<s:select name="type" id="type2" cssStyle="width:180px;height:25px;" list="#{'1':'堤防','2':'海塘'}"></s:select>
								</td>
								
								<td>统计要素：</td>
								<td align="left">
									<s:select name="element" id="element2" cssStyle="width:180px;height:25px;" list="#{'1':'市区','2':'状态'}"></s:select>
								</td>
							</tr>
							<tr>
								<td>项目：</td>
								<td align="left">
									<s:select name="part" id="part2" cssStyle="width:180px;height:25px;" list="#{'fx':'发现','la':'立案阶段','pq':'派遣阶段','ja':'结案阶段'}"></s:select>
								</td>

								<td>季度：</td>
								<td align="left" colspan="3">
									<s:select name="strBT" id="strBT2" cssStyle="width:180px;height:25px;" list="#{'01-01':'一季度',
										'04-01':'二季度',
										'07-01':'三季度',
										'10-01':'四季度'
										}"></s:select>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<input type="button" onclick="doSearch(2)" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" onclick="resetForm(2)" class="scbtn1" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
						</table>
						</s:form>
					</div>
					<!---查询部分结束-->
					<!---  代码开始-->
					<div id="main2" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
					</div>
					<!---  代码结束-->
				</div>

				<div id="tab3" class="tabson">
					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
						<s:form namespace="/seaPatorl" action="swPatorl_statistic.do" method="post">
						<table width="90%" align="center" style="text-align:center;">
							<tr>
								<td>分类：</td>
								<td align="left">
								<s:select name="type" id="type3" cssStyle="width:180px;height:25px;" list="#{'1':'堤防','2':'海塘'}"></s:select>
								</td>
								
								<td>统计要素：</td>
								<td align="left">
									<s:select name="element" id="element3" cssStyle="width:180px;height:25px;" list="#{'1':'市区','2':'状态'}"></s:select>
								</td>
							</tr>
							<tr>
								<td>项目：</td>
								<td align="left">
									<s:select name="part" id="part3" cssStyle="width:180px;height:25px;" list="#{'fx':'发现','la':'立案阶段','pq':'派遣阶段','ja':'结案阶段'}"></s:select>
								</td>

								<td>年份：</td>
								<td align="left" colspan="3">
									<s:select name="strBT" id="strBT3" cssStyle="width:180px;height:25px;" list="#{'2018-01-01':'2018年',
										'2017-01-01':'2017年',
										'2016-01-01':'2016年',
										'2015-01-01':'2015年',
										'2014-01-01':'2014年',
										'2013-01-01':'2013年',
										'2012-01-01':'2012年',
										'2011-01-01':'2011年',
										'2010-01-01':'2010年',
										'2009-01-01':'2009年',
										'2008-01-01':'2008年'}"></s:select>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<input type="button" onclick="doSearch(3)" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" onclick="resetForm(3)" class="scbtn1" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>

						</table>
					</s:form>
					</div>
					<!---  代码开始-->
					<div id="main3" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
					</div>
					<!---  代码结束-->

				</div>
			</div>

			<script type="text/javascript">
				var myChart1 = echarts.init(document.getElementById("main1"));
				var myChart2 = echarts.init(document.getElementById("main2"));
				var myChart3 = echarts.init(document.getElementById("main3"));
				var myChart4 = echarts.init(document.getElementById("main4"));
				
				$(function(){
					$("#usual1 ul").idTabs();
					$('.tablelist tbody tr:odd').addClass('odd');
					var result = JSON.parse('${result}');
					option = getOption(result)
					myChart4.setOption(option);
					
					changeElement();
				})
				//统计要素发生改变时，修改“状态”的可读属性
				function changeElement(){
					$("[name=element]").change(function(){
						var val = $(this).val();
						var id = $(this).attr("id");
						id = id.replace("element","part");
						if ( val == "1") {
							$("#" + id).removeAttr("disabled");
						} else {
							$("#" + id).attr("disabled","disabled");
						}
					})
				}
				//表单重置时清除disabled属性
				function resetForm(i){
					$("#part" + i).removeAttr("disabled");
				}
				
				function getOption(res){
					var series = new Array();
					for ( var j = 0; j < res.data.length; j++) {
						var sery = {
					            name:res.data[j].name,
					            type:'bar',
					            data:res.data[j].val,
					            markPoint : {
					                data : [
					                    {type : 'max', name: '最大值'},
					                    {type : 'min', name: '最小值'}
					                ]
					            }
					        }
						series.push(sery);
					}
					
					var option = {
						title : {
					        text: res.text,
					        subtext: res.subtext
					    },
					    tooltip : {
					        trigger: 'axis'
					    },
					    legend: {
					        data:res.dataType
					    },
					    toolbox: {
					        show : true,
					        feature : {
					            dataView : {show: true, readOnly: false},
					            magicType : {show: true, type: ['line', 'bar']},
					            restore : {show: true},
					            saveAsImage : {show: true}
					        }
					    },
					    calculable : true,
					    //区县
					    xAxis : [
					        {
					            type : 'category',
					            data : res.dis
					        }
					    ],
					    yAxis : [
					        {
					            type : 'value'
					        }
					    ],
					    series : series
					};
					return option;
				}

				function doSearch(n){
					$.ajax({
						url:"${contextPath}/seaPatorl/swPatorl_statistic.do",
						type:"post",
						data:{'classify':n,'type':$("#type" + n).val(),'part':$("#part" + n).val(),'strBT':$("#strBT" + n).val(),'strET':$("#strET" + n).val(),'element':$("#element" + n).val()},
						success:function(data){

							result = JSON.parse(data);
							option = getOption(result);
							//chart.setOption(option, notMerge, lazyUpdate);
							//notMerge:可选，是否不跟之前设置的option进行合并，默认为false，即合并。
							//lazyUpdate:可选，在设置完option后是否不立即更新图表，默认为false，即立即更新。
							switch (n) {
								case 1:
									myChart1.setOption(option,true,false);
									break;
								case 2:
									myChart2.setOption(option,true,false);							
									break;
								case 3:
									myChart3.setOption(option,true,false);
									break;
								case 4:
									myChart4.setOption(option,true,false);
									break;
	
								default:
									break;
								}
						}
					})
				}
			</script>
		</div>

	</body>

</html>