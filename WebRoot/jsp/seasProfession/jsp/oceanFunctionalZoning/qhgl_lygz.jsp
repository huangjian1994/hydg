<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>海洋功能区利用与保护现状跟踪</title>
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
			<a href="#">利用保护与现状跟踪</a>
		</li>


	</ul>
</div>
<div class="formbody">
	<%--<form name="" id="">--%>
	<div class="leftinfo1">
		<div id="usual1" class="usual">
			<div class="itab" >
				<ul>
					<li><a href="#tab1" class="selected">利用保护与现状跟踪</a></li>
					<li><a href="#tab2">统计信息</a></li>
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
                                    <s:textfield name="xzgz.gnqhmc" id="gnqhmc" ></s:textfield>
                                </td>
                                <td>开发规模：</td>
                                <td>
                                    <select name="xzgz.kfgm" id="kfgm" style="width:180px;height:25px;">
                                        <option value="">-请选择-</option>
                                    </select>
                                    <input name="kfgmY" id="kfgmY" type="hidden" value="${xzgz.kfgm}" />
                                </td>
                            </tr>
                                <tr>
                                    <td>功能区质量变化：</td>
                                    <td>
                                        <select name="xzgz.gnqzlbh" id="gnqzlbh" style="width:180px;height:25px;">
                                            <option value="">-请选择-</option>
                                        </select>
                                        <input name="gnqzlbhY" id="gnqzlbhY" type="hidden" value="${xzgz.gnqzlbh}" />
                                    </td>
                                    <td>对毗邻功能区的影响程度：</td>
                                    <td>
                                        <select name="xzgz.yxcd" id="yxcd" style="width:180px;height:25px;">
                                            <option value="">-请选择-</option>
                                        </select>
                                        <input name="yxcdY" id="yxcdY" type="hidden" value="${xzgz.yxcd}" />
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
								<th>开发规模</th>
								<th>规模百分比</th>
								<th>功能区质量变化</th>
                                <th>对毗邻功能区的影响程度</th>
								<th>巡查单位</th>
								<th>巡查人</th>
								<th>巡查日期</th>
								<th>操作</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${xzgzList}" var="xzgz" varStatus="j">
								<tr>
									<td>${j.count}</td>
									<td><a href="javascript:void(0)" onclick="detaileXzgz('${xzgz[0]}')" class="tablelink">${xzgz[1]}</a></td>
									<td>${xzgz[3]}</td>
									<td>${xzgz[4]}</td>
									<td>${xzgz[6]}</td>
									<td>${xzgz[9]}</td>
									<td>${xzgz[11]}</td>
									<td>${xzgz[13]}</td>
									<td>${xzgz[12]}</td>
									<td>
										<a href="javascript:void(0)" onclick="editXzgz('${xzgz[0]}')" class="tablelink">修改</a>
										<a href="javascript:void(0)" onclick="delXzgz('${xzgz[0]}')" class="tablelink">删除</a>&nbsp;
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
									<input name="tjfs" id="kfgmtj" type="radio" value="" checked="checked" style="border:0;"/>按开发规模统计&nbsp;&nbsp;&nbsp;
									<input name="tjfs" id="zlbhtj" type="radio" value="" style="border:0;"/>按功能区质量变化统计&nbsp;&nbsp;&nbsp;
									<input name="tjfs" id="yxcdtj" type="radio" value="" style="border:0;"/>按对邻近功能区影响程度统计&nbsp;&nbsp;&nbsp;
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
						<div id="main3" class="hide" style="height:335px;width:955px;border:0px solid #ccc;margin:auto;display: none">
						</div>
						<div id="main4" class="hide" style="height:335px;width:955px;border:0px solid #ccc;margin:auto;display: none;">
						</div>
						<script type="text/javascript">
                            var kfgmarr = JSON.parse('${kfgmarr}');
                            var arr = [kfgmarr.subtext,kfgmarr.name,kfgmarr.gs];
                            var myChart2 = echarts.init(document.getElementById("main2"));
                            optionzzt();
                            function optionzzt() {
                                option = {
                                    title : {
                                        text: '利用保护与现状跟踪情况',
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

						<!-- 折线-->
						<script type="text/javascript">
                            var myChart3 = echarts.init(document.getElementById("main3"));
                            optionzxt();
                            function optionzxt() {
                                option = {
                                    title : {
                                        text: '利用保护与现状跟踪情况',
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
						<script type="text/javascript">
                            var btArray = new Array();
                            for(var x=0;x<kfgmarr.name.length;x++){
                                var chartData = {};
                                chartData['name']=kfgmarr.name[x];
                                chartData['value']=kfgmarr.gs[x];
                                btArray.push(chartData);
                            }
                            var arr = [kfgmarr.subtext,kfgmarr.name,kfgmarr.gs,btArray];
                            var myChart4 = echarts.init(document.getElementById("main4"));
                            optionbt();
                            function optionbt(){
                                option = {
                                    title : {
                                        text: '利用保护与现状跟踪情况',
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
                        <!---  代码结束-->

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

    $(document).ready(function(){
        var kfgmY=$("#kfgmY").val();
        var gnqzlbhY=$("#gnqzlbhY").val();
        var yxcdY=$("#yxcdY").val();
        getDictionary("开发规模","kfgm",kfgmY);
        getDictionary("功能区质量变化","gnqzlbh",gnqzlbhY);
        getDictionary("对邻近功能区影响程度","yxcd",yxcdY);

        for(var i = 0;i < $("input[name='tjt']").length;i++){
            (function(i){
                console.log($("input[name='tjt']").eq(i));
                $("input[name='tjt']").eq(i).on("click",function(){
                    $(".hide").hide();
                    $(".hide").eq(i).show();
                })
            })(i)
        }

        $("#kfgmtj").on("click",function () {
            kfgmarr = JSON.parse('${kfgmarr}');
            btArray = new Array();
            for(var x=0;x<kfgmarr.name.length;x++){
                var chartData = {};
                chartData['name']=kfgmarr.name[x];
                chartData['value']=kfgmarr.gs[x];
                btArray.push(chartData);
            }
            arr = [kfgmarr.subtext,kfgmarr.name,kfgmarr.gs,btArray];
            optionbt();
            optionzzt();
            optionzxt();

        })
        $("#zlbhtj").on("click",function () {
            zlbharr = JSON.parse('${zlbharr}');
            btArray = new Array();
            for(var x=0;x<zlbharr.name.length;x++){
                var chartData = {};
                chartData['name']=zlbharr.name[x];
                chartData['value']=zlbharr.gs[x];
                btArray.push(chartData);
            }
            arr = [zlbharr.subtext,zlbharr.name,zlbharr.gs,btArray];
            optionbt();
            optionzzt();
            optionzxt();

        })
        $("#yxcdtj").on("click",function () {
            yxcdarr = JSON.parse('${yxcdarr}');
            btArray = new Array();
            for(var x=0;x<yxcdarr.name.length;x++){
                var chartData = {};
                chartData['name']=yxcdarr.name[x];
                chartData['value']=yxcdarr.gs[x];
                btArray.push(chartData);
            }
            arr = [yxcdarr.subtext,yxcdarr.name,yxcdarr.gs,btArray];
            optionbt();
            optionzzt();
            optionzxt();

        })

    });

    //获取字典表代码
    function getDictionary(keyZ,selectID,historyZ){
        $.ajax({
            type: "post",
            dataType:"json",
            url: "${contextPath}/business/business_fetchDictionary.do",
            data: "dictionary.key="+keyZ,
            success: function(d){
                for(var i=0;i<d.length;i++){
                    //alert(d[i].dm);
                    if(d[i].dm==historyZ){
                        $("<option value= '"+d[i].dm+"' selected>"+d[i].value+"</option>").appendTo("#"+selectID);
                    }else{
                        $("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
                    }
                }
            }
        });
    }
    function cx(){
        location = "${contextPath}/zon/zon_fetchLybh.do";
    }
    function czxx() {
        document.getElementById("gnqhmc").value ="";
        document.getElementById("kfgm").value ="";
    }
    //新增
    function toadd() {
        location = "${contextPath}/zon/zon_toAddxzgz.do";
    }

    //修改
    function editXzgz(id){
		location = "${contextPath}/zon/zon_toEditXzgz.do?xzgz.id=" + id;
    }
    //详情
    function detaileXzgz(id){
        location = "${contextPath}/zon/zon_toEditXzgz.do?operate=0&&xzgz.id=" + id;
    }
    //删除
    function delXzgz(id){
        var r = confirm("请确认是否删除？");
        if ( r ) {
            $.ajax({
                type: "post",
                dataType:"text",
                url: "${contextPath}/zon/zon_removeXzgz.do",
                data: {"xzgz.id":id},
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