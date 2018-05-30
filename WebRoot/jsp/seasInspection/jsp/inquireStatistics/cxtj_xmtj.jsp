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
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
		<script type="text/javascript" src="${contextPath}/js/mycharts/echarts-all.js"></script>


		<script type="text/javascript">
			$(document).ready(function(e) {
				$(".select1").uedSelect({
					width: 345
				});
				$(".select2").uedSelect({
					width: 167
				});
				$(".select3").uedSelect({
					width: 100
				});
			});

		</script>
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
				<li><a href="#">项目统计</a></li>
			</ul>
		</div>

		<div class="formbody">
			<div id="usual1" class="usual">
				<div class="itab">
					<ul>
						<li><a href="#tab4" onclick="doSearch(1)">查询</a></li>
						<li><a href="#tab1" onclick="doSearch(2)">月报</a></li>
						<li><a href="#tab2" onclick="doSearch(3)">季报</a></li>
						<li><a href="#tab3" onclick="doSearch(4)">年报</a></li>
					</ul>
				</div>
				<div id="tab4" class="tabson">
					<s:form  namespace="/status" action="status_xcXmtj.do" method="post" >
					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>

						<table width="100%" align="center" style="text-align:center;">
							<tr>
								<td>分类：</td>
								<td>
									<s:select name="type" id="type1" cssStyle="width:180px;height:25px;"
											  list="#{'0':'全部'}"></s:select>
								</td>

								<td>时间段：</td>
								<td>
									<s:textfield onclick="WdatePicker()"  name="strBT" id="strBT1" cssStyle="width:125px;"></s:textfield>
									&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;
									<s:textfield onclick="WdatePicker()"  name="strET" id="strET1"  cssStyle="width:125px;"></s:textfield>

								</td>
							</tr>
							<tr>
								<td colspan="6">
									<input name="cx1" type="button" onclick="doSearch(1)"  class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input name="cz1" type="reset"  class="scbtn1" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="dc1" onclick="xz(1)" type="button" class="scbtn1" value="导出" />
								</td>
							</tr>

						</table>
					</div>
					</s:form>
					<!---  代码开始-->
					<div id="main1" style="height:400px;width:100%;border:0px solid #ccc;margin:auto;">
					</div>

					<!---  代码结束-->

				</div>
				<div id="tab1" class="tabson">
					<s:form  namespace="/status" action="status_xcXmtj.do" method="post" >
					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>

						<table width="100%" align="center" style="text-align:center;">
							<tr>
								<td>分类：</td>
								<td>
									<s:select name="type" id="type2" cssStyle="width:180px;height:25px;"
											  list="#{'0':'全部'}"></s:select>
								</td>

								<td>月份：</td>
								<td align="left">
									<s:select name="strBT" id="strBT2" cssStyle="width:180px;height:25px;" list="#{'01-01':'1月',
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
									<input type="button" onclick="doSearch(2)" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input  type="reset" class="scbtn1" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" onclick="xz(2)" class="scbtn1" value="导出" />
								</td>
							</tr>

						</table>
					</div>
					</s:form>

					<!---  代码开始-->
					<div id="main2" style="height:400px;width:100%;border:0px solid #ccc;margin:auto;">
					</div>


				</div>

				<div id="tab2" class="tabson">
					<!---查询部分开始-->
					<s:form  namespace="/status" action="status_xcXmtj.do" method="post" >
					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>

						<table width="90%" align="center" style="text-align:center;">
							<tr>
								<td>分类：</td>
								<td>
									<s:select name="type" id="type2" cssStyle="width:180px;height:25px;"
											  list="#{'0':'全部'}"></s:select>
								</td>

								<td>季度：</td>
								<td>
									<s:select name="strBT" id="strBT3" cssStyle="width:180px;height:25px;" list="#{'01-01':'一季度',
										'04-01':'二季度',
										'07-01':'三季度',
										'10-01':'四季度'
										}"></s:select>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<input type="button" onclick="doSearch(3)" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input  type="reset" class="scbtn1" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;
									<input  type="button" onclick="xz(3)" class="scbtn1" value="导出" />
								</td>
							</tr>

						</table>
					</div>
					</s:form>
					<!---查询部分结束-->
					<!---  代码开始-->
					<div id="main3" style="height:400px;width:100%;border:0px solid #ccc;margin:auto;"></div>

					<!---  代码结束-->
				</div>

				<div id="tab3" class="tabson">
					<s:form  namespace="/status" action="status_xcXmtj.do" method="post" >
					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>

						<table width="90%" align="center" style="text-align:center;">
							<tr>
								<td>分类：</td>
								<td>
									<s:select name="type" id="type2" cssStyle="width:180px;height:25px;"
											  list="#{'0':'全部'}"></s:select>

								</td>

								<td>年份：</td>
								<td>
								<td align="left" colspan="3">
									<s:select name="strBT" id="strBT4" cssStyle="width:180px;height:25px;" list="#{'2018-01-01':'2018年',
										'2017-01-01':'2017年',
										'2016-01-01':'2016年',
										'2015-01-01':'2015年',
										'2014-01-01':'2014年',
										'2013-01-01':'2013年',
										'2012-01-01':'2012年',
										'2011-01-01':'2011年'
										}"></s:select>
								</td>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<input  type="button" onclick="doSearch(4)" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" class="scbtn1" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;
									<input  type="button" onclick="xz(4)" class="scbtn1" value="导出" />
								</td>
							</tr>

						</table>
					</div>
					</s:form>
					<!---  代码开始-->
					<div id="main4" style="height:400px;width:100%;border:0px solid #ccc;margin:auto;">
					</div>
					<!---  代码结束-->

				</div>
			</div>

			<script type="text/javascript"><!--

                var myChart1 = echarts.init(document.getElementById("main1"));
                var myChart2 = echarts.init(document.getElementById("main2"));
                var myChart3 = echarts.init(document.getElementById("main3"));
                var myChart4 = echarts.init(document.getElementById("main4"));

                function opt(xmtj) {
                    option = {
                        title: {
                            text: xmtj.text,
                            	//subtext:xmtj.subtext
                        },
                        tooltip: {
                            trigger: 'axis'
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
                            show:true,
                            data: xmtj.name,
                            axisLabel: {
                                interval:0,
                                rotate:40
                            }
                        }],

                        yAxis: [{
                            type: 'value'
                        }],
                        color: [
                            '#30e0e0', '#3cb371', '#87cefa', '#da70d6', '#32cd32', '#6495ed', '#ff7f50',
                            '#ff69b4', '#ba55d3', '#cd5c5c', '#ffa500', '#40e0d0',
                            '#1e90ff', '#ff6347', '#7b68ee', '#00fa9a', '#ffd700',
                            '#6b8e23', '#ff00ff', '#b8860b'
                        ],
                        series: [{
                            type: 'bar',
                            data: xmtj.gs,
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
                   return option;
                }
                $(function(){
                    $("#usual1 ul").idTabs();
                    $('.tablelist tbody tr:odd').addClass('odd');
					ssss = JSON.parse('${xmtjArr}');
					var option = opt(ssss);
                    myChart1.setOption(option);

                })


                function doSearch(n){

                    $.ajax({
                        url:"${contextPath}/status/status_xcXmtj.do",
                        type:"post",
                        data:{'type':$("#type" + n).val(), 'classify':n,'strBT':$("#strBT" + n).val(),'strET':$("#strET" + n).val()},
                        success:function(xmtjArr){
                            xmtj = JSON.parse(xmtjArr);
                            var option = opt(xmtj);
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

                function xz(n) {

                    $.ajax({
                        url:"${contextPath}/status/status_xcXmtj.do",
                        type:"post",
                        data:{'type':$("#type" + n).val(), 'classify':n,'strBT':$("#strBT" + n).val(),'strET':$("#strET" + n).val()},
                        success:function(xmtjXz){

                            location="${contextPath}/status/status_downXmtj.do?xmtjXz="+xmtjXz
								+"&& classify="+n+"&& strBT="+$("#strBT" + n).val()+"&&strET="+$("#strET" + n).val();
//                            data:{ 'classify':n,'strBT':$("#strBT" + n).val(),'strET':$("#strET" + n).val()}

                        }
                    })
                }


			--></script>

		</div>

		</div>

	</body>

</html>