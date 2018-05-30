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
				<c:if test="${zxqkjdEntity.id == null}">
					<li>
						<a href="javascript:void(0)">新增</a>
					</li>
				</c:if>
				<c:if test="${zxqkjdEntity.id != null}">
					<li>
						<a href="javascript:void(0)">详情与修改</a>
					</li>
				</c:if>

			</ul>
		</div>
		<div class="formbody">
            <s:form id="zonForm" name="zon" namespace="/zon" method="post" enctype='multipart/form-data'>
                <s:hidden name="zxqkjdEntity.id"></s:hidden>
            <div class="leftinfo1">
					<div id="usual1" class="usual">
						<div class="itab" >
							<ul>
								<li><a href="#tab1" class="selected">执行情况监督</a></li>
								<li><a href="#tab2">统计信息</a></li>
							</ul>
						</div>
						<div class="tabscont">
							<div id="tab1" class="tabson">
								<div class="main">
                                   <c:if test="${zxqkjdEntity.id == null}">
                                    <div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />新增</div>
                                   </c:if>
                                    <c:if test="${zxqkjdEntity.id != null}">
                                        <div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情与修改</div>
                                    </c:if>
								</div>
                                <table width="100%" align="center" style="text-align:left;" class="tablelist2">
                                    <tr>
                                        <td style="background-color:#f5f8fa;">功能区名称：</td>
                                        <td >
                                            <select name="zxqkjdEntity.gnqhmc" id="gnqhmc" style="width:250px;height:25px;">
                                                <option value="">-请选择-</option>
                                            </select>
                                            <input name="gnqhmcY" id="gnqhmcY" type="hidden" value="${zxqkjdEntity.gnqhmc}" />
                                            <font color="red">*</font>
                                        </td>
                                        <td style="background-color:#f5f8fa;">用海项目名称：</td>
                                        <td >
                                            <s:textfield  name="zxqkjdEntity.yhxmmc" id="yhxmmc" cssStyle="width: 250px"></s:textfield>
                                            <%--<input name="xzgz.kfgmbfb" id="kfgmbfb" value="${xzgz.kfgmbfb}" style="width:250px;height:20px; overflow:auto;" />%--%>
                                            <font color="red">*</font>
                                        </td>
                                    </tr>
                                    <tr style="height: 50px">
                                        <td style="background-color:#f5f8fa;">不符合海洋功能区划的用海面积（公顷）：</td>
                                        <td><input name="zxqkjdEntity.wgyhmj" id="wgyhmj" value="${zxqkjdEntity.wgyhmj}" style="width:250px;height:20px; overflow:auto;" />公顷
                                            <font color="red">*</font>
                                        </td>
                                        <td style="background-color:#f5f8fa;">原因说明：</td>
                                        <td>
                                            <input name="zxqkjdEntity.wgyy" id="wgyy" value="${zxqkjdEntity.wgyy}" style="width:250px;height:40px; overflow:auto;" ></input>
                                        </td>
                                    </tr>
                                    <tr style="height: 50px">
                                        <td style="background-color:#f5f8fa;">巡查单位</td>
                                        <td>
                                            <input name="zxqkjdEntity.fxdw" id="fxdw" value="${zxqkjdEntity.fxdw}" style="width:250px;height:40px; overflow:auto;" />
                                            <font color="red">*</font>
                                        </td>

                                        <td style="background-color:#f5f8fa;">巡查人</td>
                                        <td>
                                            <input name="zxqkjdEntity.fxr" id="fxr" value="${zxqkjdEntity.fxr}" style="width:250px;height:40px; overflow:auto;" />
                                            <font color="red">*</font>
                                        </td>

                                    </tr>
                                    <tr style="height: 50px">
                                        <td style="background-color:#f5f8fa;">巡查日期</td>
                                        <td>
                                            <input name="zxqkjdEntity.fxsj" id="fxsj" value="${zxqkjdEntity.fxsj}"
                                                   onclick="WdatePicker()" readonly="readonly" style="width:250px; overflow:auto;" />
                                        </td>
                                        <td style="background-color:#f5f8fa;">备注：</td>
                                        <td colspan="3"><input name="zxqkjdEntity.bz" id="zxqkjdEntity.bz" value="${zxqkjdEntity.bz}" style=" width:250px;height:40px; overflow:auto;" />
                                        </td>
                                    </tr>

                                    <tr id="add">
                                        <td style="background-color:#f5f8fa;">新增人：</td>
                                        <td>
                                            <input name="zxqkjdEntity.addusername"  value="${zxqkjdEntity.addusername}" type="text" style="width:250px;height:30px; overflow:auto;" />
                                        </td>
                                        <td style="background-color:#f5f8fa;">新增时间：</td>
                                        <td>
                                            <input name="zxqkjdEntity.addtime" id="addtime"  value="${zxqkjdEntity.addtime}" type="text" style="width:250px;height:30px; overflow:auto;" />
                                        </td>
                                    </tr>
                                    <tr id="update">
                                        <td style="background-color:#f5f8fa;">修改人：</td>
                                        <td>
                                            <input name="zxqkjdEntity.updateusername" id="updateusername" value="${zxqkjdEntity.updateusername}" type="text" style="width:250px;height:30px; overflow:auto;" />
                                        </td>
                                        <td style="background-color:#f5f8fa;">修改时间：</td>
                                        <td>
                                            <input name="zxqkjdEntity.lastupdatetime" id="lastupdatetime"  value="${zxqkjdEntity.lastupdatetime}" type="text" style="width:250px;height:30px; overflow:auto;" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="4" style="text-align:center;">
                                            <c:if test="${'0'!= operate}">
                                                <s:submit cssClass="scbtn1" value="保存"></s:submit>
                                            </c:if>
                                            <input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='${contextPath}/zon/zon_fetchzxjd.do'" />
                                        </td>
                                    </tr>
                                </table>
							</div>
                            </s:form>
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
									</table>
									<br/>
								</div>

                                <div id="main2" class="hide" style="height:335px;width:955px;border:0px solid #ccc;margin:auto;"></div>
                                <div id="main3" class="hide" style="height:335px;width:955px;border:0px solid #ccc;margin:auto;display: none"></div>
                                <div id="main4" class="hide" style="height:335px;width:955px;border:0px solid #ccc;margin:auto;display: none;"></div>

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
                                <!-- 折线-->
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
		
	</body>	
	<script type="text/javascript"> 
		$("#usual1 ul").idTabs();
		$('.tablelist tbody tr:odd').addClass('odd');
        var id = '${zxqkjdEntity.id}';
        var operate = "${operate}";
        $(function(){
            //operate 0:查看详情
            if ( "0" == operate ) {
                $(":input").attr("readonly","readonly");
                $("#gnqhmc").attr("disabled","");
            } else {
                $("#add,#update").hide();
                if ( id == '' ) {
                    $("#zonForm").attr("action","${contextPath}/zon/zon_addZxjd.do");
                } else {

                    $("#zonForm").attr("action","${contextPath}/zon/zon_editZxqkjd.do");
                }
                $("#zonForm").submit(function(){
                    return dataCheck();
//                    return false;
                })
            }
        })

        function dataCheck(){
            var gnqhmc = $("#gnqhmc").val();
            var yhxmmc = $("#yhxmmc").val();
            var fxdw = $("#fxdw").val();
            var fxr = $("#fxr").val();
            var wgyhmj = $("#wgyhmj").val();

            if ( gnqhmc == "" ) {
                alert("功能区名称不可为空！");
                return false;
            }
            if ( yhxmmc == "" ) {
                alert("用海项目名称不可为空！");
                return false;
            }
            if ( fxdw == "" ) {
                alert("巡查单位不可为空！");
                return false;
            }
            if ( fxr == "" ) {
                alert("巡查人不可为空！");
                return false;
            }
            if ( wgyhmj != "" ) {
                var reg = /^[0-9]+(.[0-9]{1,3})?$/;
                if ( !reg.test(wgyhmj) ) {
                    alert("面积必须为数字！");
                    return false;
                }
            }
        }

        $(document).ready(function(){
            var gnqhmcY= $("#gnqhmcY").val();
            getMc(gnqhmcY);
        });
        //获取功能区划名称和ID
        function getMc(historyZ) {
            $.ajax({
                type:"post",
                dataType:"json",
                url:"${contextPath}/zon/zon_fetchGnqhMc.do",
                success: function(d){
                    for(var i=0;i<d.length;i++) {
                        if (d[i][1] == historyZ) {
                            $("<option value= '" + d[i][0] + "," + d[i][1] + "' selected>" + d[i][1] + "</option>").appendTo("#gnqhmc");
                        }else {
                            $("<option value= '" + d[i][0] + "," + d[i][1] + "'>" + d[i][1] + "</option>").appendTo("#gnqhmc");
                        }
                    }
                }
            });
        }

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

        </script>
</html>