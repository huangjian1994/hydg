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
			KE.show({
				id: 'content7',
				cssPath: './index.css'
			});
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

	</head>

	<body>

		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li><a href="#">查询统计</a></li>
				<li><a href="#">海域区域统计</a></li>
			</ul>
		</div>

		<div class="formbody">

			<div id="usual1" class="usual">
				<div class="itab">
					<ul>
						<li><a href="#tab4" onclick="Search(1)">分布图</a></li>
						<li><a href="#tab1" onclick="Search(2)">月对比图</a></li>
						<li><a href="#tab2" onclick="Search(4)">年对比图</a></li>
					</ul>
				</div>
				<div id="tab4" class="tabson">
					<s:form  namespace="/status" action="status_hyqytj.do" method="post" >
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
								<td align="left">
									<s:textfield onclick="WdatePicker()"  name="strBT" id="strBT1" cssStyle="width:125px;"></s:textfield>
									&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;
									<s:textfield onclick="WdatePicker()"  name="strET" id="strET1"  cssStyle="width:125px;"></s:textfield>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<input name="" type="button" onclick="Search(1)"  class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input name="" type="reset" class="scbtn1" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>

						</table>
					</div>
					</s:form>

					<!---  代码开始-->
					<div id="main1" style="height:400px;width:950px;border:0px solid #ccc;margin:auto;">
					</div>


				</div>
				<div id="tab1" class="tabson">
					<s:form  namespace="/status" action="status_hyqytj.do" method="post" >
					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>

						<table width="100%" align="center" style="text-align:center;">
							<tr>
								<td>分类：</td>
								<td align="left">
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
									<input name="" type="button" onclick="Search(2)" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input name="" type="reset" class="scbtn1" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;

								</td>
							</tr>

						</table>
					</div>
					</s:form>

					<!---  代码开始-->
					<div id="main2" style="height:400px;width:950px;border:0px solid #ccc;margin:auto;">
					</div>

					<!---  代码结束-->

				</div>

				<div id="tab2" class="tabson">
					<!---查询部分开始-->
					<s:form  namespace="/status" action="status_hyqytj.do" method="post" >
					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>

						<table width="100%" align="center" style="text-align:center;">
							<tr>
								<td>分类：</td>
								<td align="left">
									<s:select name="type" id="type4" cssStyle="width:180px;height:25px;"
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
									<input  type="button" onclick="Search(4)" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input  type="reset" class="scbtn1" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
						</table>
					</div>
					</s:form>
					<!---查询部分结束-->
					<!---  代码开始-->
					<div id="main3" style="height:400px;width:950px;border:0px solid #ccc;margin:auto;">
					</div>

					<!---  代码结束-->
				</div>

			</div>

			<script type="text/javascript">

                var myChart1 = echarts.init(document.getElementById("main1"));
                var myChart2 = echarts.init(document.getElementById("main2"));
                var myChart3 = echarts.init(document.getElementById("main3"));


				function opt(hytj) {
                    var btArray = new Array();
                    for(var x=0;x<hytj.name.length;x++){
                        var chartData = {};
                        chartData['name']=hytj.name[x];
                        chartData['value']=hytj.gs[x];
                        btArray.push(chartData);
                    }

                    option = {
                        title: {
                            text: hytj.text,
                            subtext:hytj.subtext,
                            x: 'center'
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            orient: 'vertical',
                            x: 'left',
                            data: hytj.name
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
                            name: '数据来源',
                            type: 'pie',
                            radius: '75%',
                            center: ['50%', '60%'],
                            data: btArray
                        }]
                    };
                    return option;
                }

                $(function(){
                    $("#usual1 ul").idTabs();
                    $('.tablelist tbody tr:odd').addClass('odd');
                    ssss = JSON.parse('${hyqytjArr}');
                    var option = opt(ssss);
                    myChart1.setOption(option);

                })
			</script>
			<!---  代码结束-->

			<script type="text/javascript">



                function Search(n){

                    $.ajax({
                        url:"${contextPath}/status/status_hyqytj.do",
                        type:"post",
                        data:{'type':$("#type" + n).val(), 'classify':n,'strBT':$("#strBT" + n).val(),'strET':$("#strET" + n).val()},
                        success:function(hyqytjArr){
                            hytj = JSON.parse(hyqytjArr);
                            var option = opt(hytj);
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
                                case 4:
                                    myChart3.setOption(option,true,false);
                                    break;

                                default:
                                    break;
                            }
                        }
                    })
                }
			</script>

		</div>

		</div>

	</body>

</html>