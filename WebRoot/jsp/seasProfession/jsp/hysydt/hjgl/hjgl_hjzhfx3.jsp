<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.easyui.min.js"></script>
		
		<script type="text/javascript" src="${contextPath}/js/mycharts/echarts-all.js"></script>
<script type="text/javascript">	
//查询
function search(){
	document.myForm.action="<%=basePath%>/seaRecord/seaRecord_fetchHjzhfx.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

</script>
	</head>

	<body>
<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li><a href="#">海域使用动态管理</a></li>
				<li><a href="#">海籍管理</a></li>
				<li><a href="#">海籍综合分析</a></li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td width="20%">统计方式：</td>
						<td width="80%" style="text-align:left;">&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs0" type="radio" value="按用海批准年份" checked="checked" style="border:0;"/>按用海批准年份&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs2" type="radio" value="按配号年份" style="border:0;"/>按配号年份&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs5" type="radio" value="按项目位置" style="border:0;"/>按项目位置&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs6" type="radio" value="按使用状况" style="border:0;"/>按使用状况
						
							<!-- 
							<input name="tjfxForm.tjfs" id="tjfs1" type="radio" value="按初始登记年份" style="border:0;"/>按初始登记年份&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs3" type="radio" value="按用海类型" style="border:0;"/>按用海类型&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs4" type="radio" value="按用海方式" style="border:0;"/>按用海方式&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjfs" id="tjfs6" type="radio" value="按批准级别" style="border:0;"/>按批准级别
							 -->
						</td>
					</tr>
					<tr>
						<td>统计要素：</td>
						<td style="text-align:left;">&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjys" id="tjys1" type="radio" value="宗海面积" style="border:0;"/>宗海面积&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjys" id="tjys2" type="radio" value="证书数量" checked="checked" style="border:0;"/>证书数量&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.tjys" id="tjys3" type="radio" value="用海项目数量" style="border:0;"/>用海项目数量&nbsp;&nbsp;&nbsp;
						
						</td>
					</tr>
					<tr>
						<td>展示方式：</td>
						<td style="text-align:left;">&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.zsfs" id="zsfs1" type="radio" value="柱状图" checked="checked" style="border:0;"/>柱状图&nbsp;&nbsp;&nbsp;
							<input name="tjfxForm.zsfs" id="zsfs2" type="radio" value="折线图" style="border:0;"/>折线图
							<input name="tjfxForm.zsfs" id="zsfs3" type="radio" value="饼状图" style="border:0;"/>饼状图&nbsp;&nbsp;&nbsp;
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<input name="查询" type="button" class="scbtn" value="查询" onclick="search()" />
						</td>
					</tr>
				</table>
				
				<input name="hysytjData_x" type="hidden" id="hysytjData_x"  value="${hysytjData_x }"/>
				<input name="hysytjData_y" type="hidden" id="hysytjData_y"  value="${hysytjData_y }"/>
				<input name="tjys" type="hidden" id="tjys"  value="${tjfxForm.tjys }"/>
				<input name="tjfs" type="hidden" id="tjfs"  value="${tjfxForm.tjfs }"/>
				<input name="zsfs" type="hidden" id="zsfs"  value="${tjfxForm.zsfs }"/>
				<input name="jldw" type="hidden" id="jldw"  value="${jldw }"/>
				
			</div>
		</div>
		<div id="main" style="height:400px;width:98%;border:0px solid #ccc;margin:auto;">
		</div>
		<script type="text/javascript">
			var hysytjData_y = document.getElementById("hysytjData_y").value;
			var hysytjData_x = document.getElementById("hysytjData_x").value;
			
			var tjfs = document.getElementById("tjfs").value;
			var tjys = document.getElementById("tjys").value;
			var zsfs = document.getElementById("zsfs").value;
			var jldw = document.getElementById("jldw").value;
			
			var selects = document.getElementsByName("tjfxForm.tjfs");
			for(var i=0;i<selects.length;i++){
				if(selects[i].value==tjfs){
					selects[i].checked=true;
					break;
				}
			}

			var selects2 = document.getElementsByName("tjfxForm.tjys");
			for(var i=0;i<selects2.length;i++){
				if(selects2[i].value==tjys){
					selects2[i].checked=true;
					break;
				}
			}

			var selects3 = document.getElementsByName("tjfxForm.zsfs");
			for(var i=0;i<selects3.length;i++){
				if(selects3[i].value==zsfs){
					selects3[i].checked=true;
					break;
				}
			}
			
			
			var titlemc=tjfs+"统计"+tjys;
			var strarray = new Array();
			strarray = hysytjData_x.split(",");

			var strarray2 = new Array();
			strarray2 = hysytjData_y.split(",");

			var btArray = new Array();
			for(var x=0;x<strarray.length;x++){
				var chartData = {};
				chartData['name']=strarray[x];
				chartData['value']=strarray2[x];
				btArray.push(chartData);
			}

			
			var myChart = echarts.init(document.getElementById("main"));
			var option = {
				title : {
		        text: titlemc,
		        //subtext: '纯属虚构',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c}"+jldw+" ({d}%)"
		    },
		    legend: {
		        orient : 'vertical',
		        x : 'left',
		        data:strarray
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {
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
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    series : [
		        {
		            name:tjys,
		            type:'pie',
		            radius : '55%',
		            center: ['50%', '50%'],
		            data:btArray
		            
		        }
		    ]
		};
		                    

			myChart.setOption(option);
			//alert(hysytjData_y);
			//var pushInfo1=hysytjData_y.split(",");
			//for(var x=0;x<=pushInfo1.length;x++){
			//	option.series[0].data.push(pushInfo1[x]);
			//}
			//myChart.setOption(option);
			
		</script>

		
</form>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

	</body>

</html>