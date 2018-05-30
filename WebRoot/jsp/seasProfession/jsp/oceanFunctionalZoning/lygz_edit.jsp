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
				<c:if test="${xzgz.id == null}">
					<li>
						<a href="javascript:void(0)">新增</a>
					</li>
				</c:if>
				<c:if test="${xzgz.id != null}">
					<li>
						<a href="javascript:void(0)">修改</a>
					</li>
				</c:if>

			</ul>
		</div>
		<div class="formbody">
            <s:form id="zonForm" name="zon" namespace="/zon" method="post" enctype='multipart/form-data'>
                <s:hidden name="xzgz.id"></s:hidden>
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
                                   <c:if test="${xzgz.id == null}">
                                    <div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />新增</div>
                                   </c:if>
                                    <c:if test="${xzgz.id != null}">
                                        <div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情与修改</div>
                                    </c:if>
								</div>
                                <table width="100%" align="center" style="text-align:left;" class="tablelist2">
                                    <tr>
                                        <td style="background-color:#f5f8fa;">功能区名称：</td>
                                        <td >
                                            <select name="xzgz.gnqhmc" id="gnqhmc" style="width:250px;height:25px;">
                                                <option value="">-请选择-</option>
                                            </select>
                                            <input name="gnqhmcY" id="gnqhmcY" type="hidden" value="${xzgz.gnqhmc}" />
                                            <font color="red">*</font>
                                        </td>
                                        <td  style="background-color:#f5f8fa;">开发规模：</td>
                                        <td >
                                            <select name="xzgz.kfgm" id="kfgm" style="width:250px;height:25px;">
                                                <option value="">-请选择-</option>
                                            </select>
                                            <font color="red">*</font>
                                            <input name="kfgmY" id="kfgmY" type="hidden" value="${xzgz.kfgm}" />
                                        </td>
                                    </tr>
                                    <tr style="height: 50px">
                                        <td style="background-color:#f5f8fa;">规模百分比（填数字）：</td>
                                        <td><input name="xzgz.kfgmbfb" id="kfgmbfb" value="${xzgz.kfgmbfb}" style="width:250px;height:20px; overflow:auto;" />%
                                            <font color="red">*</font>
                                        </td>
                                        <td style="background-color:#f5f8fa;">规模说明：</td>
                                        <td>
                                            <input name="xzgz.kfgmsm" id="kfgmsm" value="${xzgz.kfgmsm}" style="width:250px;height:40px; overflow:auto;" ></input>
                                        </td>
                                    </tr>

                                    <tr style="height: 50px">
                                        <td style="background-color:#f5f8fa;">功能区质量变化</td>
                                        <td>
                                            <select name="xzgz.gnqzlbh" id="gnqzlbh" style="width:250px;height:25px;">
                                                <option value="">-请选择-</option>
                                            </select>
                                            <font color="red">*</font>
                                            <input name="gnqzlbhY" id="gnqzlbhY" type="hidden" value="${xzgz.gnqzlbh}" />
                                        </td>
                                        <td style="background-color:#f5f8fa;">质量变化情况说明</td>
                                        <td>
                                            <input name="xzgz.zlbhqksm" id="zlbhqksm" value="${xzgz.zlbhqksm}" style="width:250px;height:40px; overflow:auto;" />
                                        </td>
                                    </tr>
                                    <tr style="height: 50px">
                                        <td style="background-color:#f5f8fa;">对邻近功能区影响程度</td>
                                        <td>
                                            <select name="xzgz.yxcd" id="yxcd" style="width:250px;height:25px;">
                                                <option value="">-请选择-</option>
                                            </select>
                                            <font color="red">*</font>
                                            <input name="yxcdY" id="yxcdY" type="hidden" value="${xzgz.yxcd}" />
                                        </td>
                                        <td style="background-color:#f5f8fa;">影响情况说明</td>
                                        <td>
                                            <input name="xzgz.yxcdsm" id="yxcdsm" value="${xzgz.yxcdsm}" style="width:250px;height:40px; overflow:auto;" />
                                        </td>
                                    </tr>
                                    <tr style="height: 50px">
                                        <td style="background-color:#f5f8fa;">巡查单位</td>
                                        <td>
                                            <input name="xzgz.dw" id="dw" value="${xzgz.dw}" style="width:250px;height:40px; overflow:auto;" />
                                            <font color="red">*</font>
                                        </td>

                                        <td style="background-color:#f5f8fa;">巡查人</td>
                                        <td>
                                            <input name="xzgz.examineperson" id="person" value="${xzgz.examineperson}" style="width:250px;height:40px; overflow:auto;" />
                                            <font color="red">*</font>
                                        </td>

                                    </tr>
                                    <tr style="height: 50px">
                                        <td style="background-color:#f5f8fa;">巡查日期</td>
                                        <td>
                                            <input name="xzgz.examinetime" id="examinetime" value="${xzgz.examinetime}"
                                                   onclick="WdatePicker()" readonly="readonly" style="width:250px; overflow:auto;" />
                                        </td>
                                        <td style="background-color:#f5f8fa;">备注：</td>
                                        <td colspan="3"><input name="xzgz.bz" id="xzgz.bz" value="${xzgz.bz}" style=" width:250px;height:40px; overflow:auto;" />
                                        </td>
                                    </tr>

                                    <tr id="add">
                                        <td style="background-color:#f5f8fa;">新增人：</td>
                                        <td>
                                            <input name="xzgz.addusername"  value="${xzgz.addusername}" type="text" style="width:250px;height:30px; overflow:auto;" />
                                        </td>
                                        <td style="background-color:#f5f8fa;">新增时间：</td>
                                        <td>
                                            <input name="xzgz.addtime" id="addtime"  value="${xzgz.addtime}" type="text" style="width:250px;height:30px; overflow:auto;" />
                                        </td>
                                    </tr>
                                    <tr id="update">
                                        <td style="background-color:#f5f8fa;">修改人：</td>
                                        <td>
                                            <input name="xzgz.updateusername" id="updateusername" value="${xzgz.updateusername}" type="text" style="width:250px;height:30px; overflow:auto;" />
                                        </td>
                                        <td style="background-color:#f5f8fa;">修改时间：</td>
                                        <td>
                                            <input name="xzgz.lastupdatetime" id="lastupdatetime"  value="${xzgz.lastupdatetime}" type="text" style="width:250px;height:30px; overflow:auto;" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="4" style="text-align:center;">
                                            <c:if test="${'0'!= operate}">
                                                <s:submit cssClass="scbtn1" value="保存"></s:submit>
                                            </c:if>
                                            <input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='${contextPath}/zon/zon_fetchLybh.do'" />
                                        </td>
                                    </tr>
                                </table>
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
												<input name="cz" type="reset" class="scbtn1" value="重置" />
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
            </s:form>
		</div>
		
	</body>	
	<script type="text/javascript"> 
		$("#usual1 ul").idTabs();
		$('.tablelist tbody tr:odd').addClass('odd');
        var id = '${xzgz.id}';
        var operate = "${operate}";
        $(function(){
            //operate 0:查看详情
            if ( "0" == operate ) {
                $(":input").attr("readonly","readonly");
                $("#gnqhmc,#kfgm,#gnqzlbh,#yxcd").attr("disabled","");
            } else {
                $("#add,#update").hide();
                if ( id == '' ) {
                    $("#zonForm").attr("action","${contextPath}/zon/zon_addXzgz.do");
                } else {
                    $("#zonForm").attr("action","${contextPath}/zon/zon_updateXzgz.do");
                }
                $("#zonForm").submit(function(){
                    return dataCheck();
                })
            }
        })

        function dataCheck(){
            var gnqhmc = $("#gnqhmc").val();
            var kfgm = $("#kfgm").val();
            var kfgmbfb = $("#kfgmbfb").val();
            var gnqzlbh = $("#gnqzlbh").val();
            var yxcd = $("#yxcd").val();
            var xcdw = $("#dw").val();
            var xcr = $("#person").val();

            if ( gnqhmc == "" ) {
                alert("功能区名称不可为空！");
                return false;
            }
            if ( kfgm == "" ) {
                alert("开发规模不可为空！");
                return false;
            }
            if ( kfgmbfb == "" ) {
                alert("规模百分比不可为空！");
                return false;
            }
            if(gnqzlbh == ''){
                alert("功能区质量变化不可为空！");
                return false;
            }
            if(yxcd == ''){
                alert("对邻近功能区影响程度不可为空！");
                return false;
            }
            if(yxcd == ''){
                alert("对邻近功能区影响程度不可为空！");
                return false;
            }
            if(xcdw == ''){
                alert("巡查单位不可为空！");
                return false;
            }
            if(xcr == ''){
                alert("巡查人不可为空！");
                return false;
            }

            if ( kfgmbfb != "" ) {
                var reg = /^[0-9]+(.[0-9]{1,3})?$/;
                if ( !reg.test(kfgmbfb) ) {
                    alert("序号必须为数字！");
                    return false;
                }
            }
        }

        $(document).ready(function(){
            var kfgmY=$("#kfgmY").val();
            var gnqzlbhY=$("#gnqzlbhY").val();
            var gnqhmcY= $("#gnqhmcY").val();
            var yxcdY= $("#yxcdY").val();
            getDictionary("开发规模","kfgm",kfgmY);
            getDictionary("功能区质量变化","gnqzlbh",gnqzlbhY);
            getDictionary("对邻近功能区影响程度","yxcd",yxcdY);
            getMc(gnqhmcY);

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
        //字典表查询
        function getDictionary(keyZ,selectID,historyZ){
            $.ajax({
                type: "post",
                dataType:"json",
                url: "${contextPath}/business/business_fetchDictionary.do",
                data: "dictionary.key="+keyZ,
                success: function(d){
                    for(var i=0;i<d.length;i++){
                        if(d[i].dm==historyZ){
                            $("<option value= '"+d[i].dm+"' selected>"+d[i].value+"</option>").appendTo("#"+selectID);
                        }else{
                            $("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
                        }
                    }
                }
            });
        }
        </script>
</html>