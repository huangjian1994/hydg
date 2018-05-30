<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>汇总统计-日</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/mycharts/echarts-all.js"></script>
		<script type="text/javascript">
            function search(){

                document.myForm.action="<%=basePath%>/pip/pip_yjtjDay.do";
                document.myForm.target="_self";
                document.myForm.submit();
            }

            function goTjY(){
                document.myForm.action="<%=basePath%>/pip/pip_yjtjYear.do";
                document.myForm.target="_self";
                document.myForm.submit();
            }
            function goTjM(){
                document.myForm.action="<%=basePath%>/pip/pip_yjtjMonth.do";
                document.myForm.target="_self";
                document.myForm.submit();
            }
            function goTjD(){
                document.myForm.action="<%=basePath%>/pip/pip_yjtjDay.do";
                document.myForm.target="_self";
                document.myForm.submit();
            }

            //导出
            function goDownloadDayData(){
                document.myForm.action="<%=basePath%>/pip/pip_downLoadDayData.do";
                document.myForm.target="_self";
                document.myForm.submit();
            }
		</script>

	</head>

<body>
<form name="myForm" method="post" >

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">海底管线安全</a></li>
			<li><a href="#">汇总统计日</a></li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="###"  onclick="goTjY()">年报</a></li>
					<li><a href="###"  onclick="goTjM()">月报</a></li>
					<li><a href="###"  class="selected">日报</a></li>
				</ul>
			</div>

			<div id="tab2" class="tabson">
				<!---查询部分开始-->
				<div class="leftinfo1">
					<div class="listtitle3"><img src="${contextPath}/images/seabedPipeline/ico06.png" width="25" height="25" />条件查询</div>

					<table width="100%" align="center" style="text-align:center;">
						<tr>
							<td align="right" width="20%">分类统计:</td>
							<td align="left" width="25%">
								<input name="fltj" id="yjfl" type="radio" value="预警来源" checked="checked" style="border:0;"/>预警来源&nbsp;&nbsp;&nbsp;
								<input name="fltj" id="gxfl" type="radio" value="管线名称" style="border:0;"/>管线名称&nbsp;&nbsp;&nbsp;
							</td>
							<td width="20%">选择查询日期：</td>
							<td align="left">
								<input name="beginTimeD" id="beginTimeD" value="${beginTimeD}"
									   onclick="WdatePicker()" readonly="readonly" style="width:150px; overflow:auto;" />

								至
								<input name="endTimeYD" id="endTimeYD" value="${endTimeYD}"
									   onclick="WdatePicker()" readonly="readonly" style="width:150px; overflow:auto;" />
							</td>
						<tr>
							<td colspan="6">
								<input name="" type="button" onclick="search()" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
								<input name="" type="reset" class="scbtn1" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <input name="" type="reset" onclick="goDownloadDayData()" class="scbtn1" value="导出" />&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>

					</table>
				</div>
				<!---查询部分结束-->
				<!---  代码开始-->
				<div id="main2" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
				</div>
				<script type="text/javascript">
                    var bjlyarr = JSON.parse('${bjlyarr}');
                    var arr = [bjlyarr.subtext,bjlyarr.name,bjlyarr.gs];
                    var myChart2 = echarts.init(document.getElementById("main2"));
                    optionYear();
                    function optionYear() {
                        option = {
                            title: {
                                text: '汇总统计',
                                subtext: arr[0]
                            },
                            tooltip: {
                                trigger: 'axis'
                            },
                            legend: {
                                data:[arr[0]]
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
                                data : arr[1]
                            }],
                            yAxis: [{
                                type: 'value'
                            }],
                            color: [
                                '#00fa9a', '#ffa500', '#40e0d0',
                                '#1e90ff', '#ff6347', '#7b68ee', '#00fa9a', '#ffd700',
                                '#6b8e23', '#ff00ff', '#3cb371', '#b8860b', '#30e0e0'
                            ],
                            series: [{
                                name:arr[0],
                                type: 'bar',
                                data:arr[2],
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
                        myChart2.clear();
                        myChart2.setOption(option);
                    }

				</script>
				<!---  代码结束-->
			</div>

		</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');
            $(document).ready(function(){
                $("#gxfl").on("click",function () {

                    gxmcarr = JSON.parse('${gxmcarr}');
                    arr = [gxmcarr.subtext,gxmcarr.name,gxmcarr.gs];
                    optionYear();
                })

                $("#yjfl").on("click",function () {

                    bjlyarr = JSON.parse('${bjlyarr}');
                    arr = [bjlyarr.subtext,bjlyarr.name,bjlyarr.gs];
                    optionYear();
                })

            });
		</script>

	</div>

	</div>


</form>
</body>

</html>