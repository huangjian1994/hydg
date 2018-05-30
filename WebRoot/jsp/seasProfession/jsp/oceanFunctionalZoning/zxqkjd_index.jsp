<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>海洋功能区执行情况监督</title>
	<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/mycharts/echarts-all.js"></script>
</head>

<body>
<div class="place">
	<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
	<ul class="placeul">
		<li>
			<a href="#">海洋功能区划管理</a>
		</li>
		<li>
			<a href="#">执行情况监督</a>
		</li>
	</ul>
</div>
<div class="formbody">
	<%--<form name="" id="">--%>
	<div class="leftinfo1">
		<div id="usual1" class="usual">
			<div class="itab" >
				<ul>
					<li><a href="#tab1" class="selected">执行情况监督</a></li>
					<li><a href="#tab2" >统计信息</a></li>
				</ul>
			</div>
			<div class="tabscont">
				<div id="tab1" class="tabson">
					<div class="main">
						<s:form name="zon" namespace="/zon"  method="post" >
							<div class="listtitle3">
								<img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询
							</div>
							<table width="100%" align="center" style="text-align:center;">
								<tr>
									<td>功能区名称：</td>
									<td>
										<s:textfield name="zxqkjdEntity.gnqhmc" id="gnqhmc" ></s:textfield>
									</td>
									<td>用海项目名称：</td>
									<td>
										<s:textfield name="zxqkjdEntity.yhxmmc" id="yhxmmc" ></s:textfield>
									</td>
								</tr>

								<tr>
									<td colspan="6">
										<input name="cx" type="submit" class="scbtn1" value="查询" />
										<input name="cz" onclick="czxx()" type="button" class="scbtn1" value="重置" />
									</td>
								</tr>
							</table>
						</s:form>
						<div class="tools">
							<ul class="toolbar">
								<li>
									<a onclick="toadd()">
										<span><img src="${contextPath}/images/seasProfession/t01.png" /></span>新增</a>

								</li>
							</ul>
						</div>
						<table class="tablelist">
							<thead>
							<tr>
								<th>序号</th>
								<th>功能区名称</th>
								<th>用海项目名称</th>
								<th>不符合海洋功能区划的用海面积(公顷)</th>
								<th>巡查单位</th>
								<th>巡查人</th>
								<th>操作</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${zxjdList}" var="zxjd" varStatus="j">
								<tr>
									<td>${j.count}</td>
									<td><a href="javascript:void(0)" onclick="detaileZxjd('${zxjd[0]}')" class="tablelink">${zxjd[1]}</a></td>
									<td>${zxjd[3]}</td>
									<td>${zxjd[4]}</td>
									<td>${zxjd[6]}</td>
									<td>${zxjd[6]}</td>
									<td>
										<a href="javascript:void(0)" onclick="editZxjd('${zxjd[0]}')" class="tablelink">修改</a>
										<a href="javascript:void(0)" onclick="delZxjd('${zxjd[0]}')" class="tablelink">删除</a>&nbsp;
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<div align="center">
						${pageBean}
					</div>
				</div>
				<div id="tab2" class="tabson">
					<div class="main">
						<div class="listtitle3">
							<img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询
						</div>
						<table width="100%" align="center" style="text-align:center;">
                            <tr>
                                <td>展示方式：</td>
                                <td style="text-align:left;">&nbsp;&nbsp;&nbsp;
                                    <input name="tjt" id="zzt" type="radio" value="柱状图" checked="checked" style="border:0;"/>柱状图&nbsp;&nbsp;&nbsp;
                                    <input name="tjt" id="zxt" type="radio" value="折线图" style="border:0;"/>折线图&nbsp;&nbsp;&nbsp;
                                    <input name="tjt" id="bt" type="radio" value="饼状图" style="border:0;"/>饼状图&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>统计方式：</td>
                                <td style="text-align:left;">&nbsp;&nbsp;&nbsp;
                                    <input name="tjfs" id="sbgs" type="radio" value="" checked="checked" style="border:0;"/>按上报个数统计&nbsp;&nbsp;&nbsp;
                                    <input name="tjfs" id="wgmj" type="radio" value="" style="border:0;"/>按违规面积统计&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
							<%--<tr>
								<td colspan="6">
									<input name="cx" type="button" class="scbtn1" value="查询" />
									<input name="cz" onclick="cz()"  class="scbtn1" value="重置" />
								</td>
							</tr>--%>
						</table>
						<br/>
                        <div id="main2" class="hide" style="height:335px;width:955px;border:0px solid #ccc;margin:auto;">
                        </div>
                        <script type="text/javascript">
                            var tjarr = JSON.parse('${tjarr}');
                            var arr = [tjarr.subtext,tjarr.name,tjarr.gs];
                            var myChart2 = echarts.init(document.getElementById("main2"));
                            optionzzt();
                            function optionzzt() {
                                option = {
                                    title : {
                                        text: '各单位执行监督情况',
                                        subtext: arr[0]
                                    },
                                    tooltip : {
                                        trigger: 'axis'
                                    },
                                    legend: {
                                        data:[arr[0]]
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
                                    xAxis : [
                                        {
                                            type : 'category',
                                            data : arr[1]
                                        }
                                    ],
                                    yAxis : [
                                        {
                                            type : 'value'
                                        }
                                    ],
                                    series : [
                                        {
                                            name:arr[0],
                                            type:'bar',
                                            data:arr[2],
                                            markPoint : {
                                                data : [
                                                    {type : 'max', name: '最大值'},
                                                    {type : 'min', name: '最小值'}
                                                ]
                                            },
                                            markLine : {
                                                data : [
                                                    {type : 'average', name : '平均值'}
                                                ]
                                            }
                                        }
                                    ]
                                };
                                myChart2.clear();
                                myChart2.setOption(option);
                            }

                        </script>
                        <!---  代码结束-->

                        <!-- 折线图-->
                        <div class="hide" id="main3" style="height:335px;width:955px;border:0px solid #ccc;margin:auto;display: none">
                        </div>

                        <script type="text/javascript">
                            var tjarr = JSON.parse('${tjarr}');
                            var arr = [tjarr.subtext,tjarr.name,tjarr.gs];
                            var myChart3 = echarts.init(document.getElementById("main3"));
                            optionzxt();
                            function optionzxt() {
                                option = {
                                    title : {
                                        text: '各单位执行监督情况',
                                        subtext: arr[0]
                                    },
                                    tooltip : {
                                        trigger: 'axis'
                                    },
                                    legend: {
                                        data:[arr[0]]
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
                                    xAxis : [
                                        {
                                            type : 'category',
                                            data : arr[1]
                                        }
                                    ],
                                    yAxis : [
                                        {
                                            type : 'value'
                                        }
                                    ],
                                    series : [
                                        {
                                            name:arr[0],
                                            type:'line',
                                            data:arr[2],
                                            markPoint : {
                                                data : [
                                                    {type : 'max', name: '最大值'},
                                                    {type : 'min', name: '最小值'}
                                                ]
                                            },
                                            markLine : {
                                                data : [
                                                    {type : 'average', name : '平均值'}
                                                ]
                                            }
                                        }
                                    ]
                                };
                                myChart3.clear();
                                myChart3.setOption(option);
                            }

                        </script>

                        <!-- 饼图-->
                        <div class="hide" id="main4" style="height:335px;width:955px;border:0px solid #ccc;margin:auto;display: none;">
                        </div>

                        <script type="text/javascript">
                            var tjarr = JSON.parse('${tjarr}');
                            var btArray = new Array();
                            for(var x=0;x<tjarr.name.length;x++){
                                var chartData = {};
                                chartData['name']=tjarr.name[x];
                                chartData['value']=tjarr.gs[x];
                                btArray.push(chartData);
                            }
                            var arr = [tjarr.subtext,tjarr.name,tjarr.gs,btArray];
                            var myChart4 = echarts.init(document.getElementById("main4"));
                            optionbt();
                            function optionbt(){
                                option = {
                                    title : {
                                        text: arr[0],
                                        subtext:arr[0],
                                        x:'center'
                                    },
                                    tooltip : {
                                        trigger: 'item',
                                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                                    },
                                    legend: {
                                        orient : 'vertical',
                                        x : 'left',
                                        data:arr[1]
                                    },

                                    toolbox: {
                                        show : true,
                                        feature : {
                                            mark : {show: true},
                                            dataView : {show: true, readOnly: false},
                                            magicType : {show: true, type: ['pie', 'funnel'],
                                                option: {
                                                    funnel: {
                                                        x: '25%',
                                                        width: '50%',
                                                        funnelAlign: 'left',
                                                        max: 1548
                                                    }
                                                }
                                            },
                                            restore : {show: true},
                                            saveAsImage : {show: true}
                                        }
                                    },
                                    calculable : true,
                                    series : [
                                        {
                                            name: '访问来源',
                                            type: 'pie',
                                            radius: '75%',
                                            center: ['50%', '60%'],
                                            data: arr[3]
                                        }
                                    ]
                                };
                                myChart4.clear();
                                myChart4.setOption(option);
                            }

                        </script>

                    </div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%--</form>--%>
</div>

</body>
<script type="text/javascript">
    $("#usual1 ul").idTabs();
    $('.tablelist tbody tr:odd').addClass('odd');


    for(var i = 0;i < $("input[name='tjt']").length;i++){
        (function(i){
            $("input[name='tjt']").eq(i).on("click",function(){
                $(".hide").hide();
                $(".hide").eq(i).show();
            })
        })(i)

    }

    $("#wgmj").on("click",function () {
         tjarr = JSON.parse('${tjarr}');
         btArray = new Array();
        for(var x=0;x<tjarr.name.length;x++){
            var chartData = {};
            chartData['name']=tjarr.name[x];
            chartData['value']=tjarr.mj[x];
            btArray.push(chartData);
        }
         arr = [tjarr.subtext1,tjarr.name,tjarr.mj,btArray];
        optionbt();
        optionzzt();
        optionzxt();

    })
    $("#sbgs").on("click",function () {
        tjarr = JSON.parse('${tjarr}');
        btArray = new Array();
        for(var x=0;x<tjarr.name.length;x++){
            var chartData = {};
            chartData['name']=tjarr.name[x];
            chartData['value']=tjarr.gs[x];
            btArray.push(chartData);
        }
        arr = [tjarr.subtext,tjarr.name,tjarr.gs,btArray];
        optionbt();
        optionzzt();
        optionzxt();

    })
   /* $("#bt").click(
        function () {
            $("#main2,#main1,#main3").hide();
            $("#main3").show();
        }

    );*/

    function cx(){
        location = "${contextPath}/zon/zon_fetchZxjd.do";
    }
    function czxx() {
        document.getElementById("gnqhmc").value ="";
        document.getElementById("yhxmmc").value ="";
    }
    function toadd() {
        location = "${contextPath}/zon/zon_toAddzxjd.do";
    }
    //修改
    function editZxjd(id){
		location = "${contextPath}/zon/zon_toEditZxjd.do?zxqkjdEntity.id=" + id;
    }
    //详情
    function detaileZxjd(id){
        location = "${contextPath}/zon/zon_toEditZxjd.do?operate=0&&zxqkjdEntity.id=" + id;
    }
    //删除
    function delZxjd(id){
        var r = confirm("请确认是否删除？");
        if ( r ) {
            $.ajax({
                type: "post",
                dataType:"text",
                url: "${contextPath}/zon/zon_removeZxjd.do",
                data: {"zxqkjdEntity.id":id},
                success: function(result){
                    if ( result == "1" ) {
                        alert("删除成功！");
                        location.reload();
                    } else {
                        alert("删除失败！")
                    }
                }
            })
        }
    }
</script>
</html>