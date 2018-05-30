<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海底管线安全</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/load.css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/seabedPipeline/znyj.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="http://localhost/arcgis_js_v316_sdk/arcgis_js_api/library/3.16/3.16/dijit/themes/tundra/tundra.css" />
	    <link rel="stylesheet" type="text/css" href="http://localhost/arcgis_js_v316_sdk/arcgis_js_api/library/3.16/3.16/esri/css/esri.css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/Javascript" src="http://localhost/arcgis_js_v316_sdk/arcgis_js_api/library/3.16/3.16/init.js"></script>
		<script type="text/Javascript" src="${contextPath}/js/seabedPipeline/znyj.js"></script>
		<script type="text/javascript" src="${contextPath}/js/scroll.js"></script>	
		<script type="text/javascript">
			function gobjlb() {
				window.open("bjlb.html", "displayWindow", "menubar=no,width=600,height=450,toolbar=no,location=no");
			}
					
			$(document).ready(function(){
			    $("#cz").click(function () {
					$("#mmsi").val("");
					$("#cablename").val("");
                })
                $("#scroll").panel({iWheelStep:32});
                //点击隐藏菜单
			    $(".controlVisible a").on("click", function() {
			        if ($(".seabedLine").css("display") == "block") {
			            $(".controlVisible a img").css("transform","rotate(0deg)");
			            $(".seabedLine").hide();
			            $(".controlVisible").css("left", "0");
			            $("#map").css("left", "0");
			        } else {
			            $(".controlVisible a img").css("transform","rotate(180deg)");
			            $(".seabedLine").show();
			            $(".controlVisible").css("left", "210px");
			            $("#map").css("left", "210px");
			        }
			    })
            });
            //查看详情，包括静态数据，船舶档案
            function xq(mmsid){
                document.getElementById("mmsid").value = mmsid;
                document.pip.action="${contextPath}/pip/pip_fetchBoatxq.do";
                document.pip.target="_self";
                document.pip.submit();
            }
            function dbxx(ldid){
                location="${contextPath}/pip/pip_fetchDbldDetaile.do?dbldxxEntity.id=" + ldid;
            }

            //删除
            function delZxjd(id){
                var r = confirm("请确认是否删除？");
                if ( r ) {
                    $.ajax({
                        type: "post",
                        dataType:"text",
                        url: "${contextPath}/pip/pip_removeWgcb.do",
                        data: {"wgcbEntity.id":id},
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
            //预警条件确认
           function setLine(){
           		$(".seabedSet").hide();
           		var data = {"gxyjtjEntity.id":listSqlid,
           					"gxyjtjEntity.piplinename":listName,
           					"gxyjtjEntity.piplineid":$("#object").val(),
           					"gxyjtjEntity.distance":$("#distance").val(),
           					"gxyjtjEntity.unit":$("#unit").val(),
           					"gxyjtjEntity.soglevel1":$("#linesog1").val(),
           					"gxyjtjEntity.soglevel2":$("#linesog2").val(),
           					"gxyjtjEntity.soglevel3":$("#linesog3").val()}
           		makeChange(data);
           }
           //取消设置预警条件
           function quXiao(){
           		$(".seabedSet").hide();
           }
		</script>
	</head>

	<body >

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海底管线安全</a></li>
				<li><a href="#">智能预警</a></li>
			</ul>
		</div>
		<div class="formbody">
			<div class="leftinfo1">
				<div id="usual1" class="usual">
					<div class="itab" >
						<ul>
							<li><a href="#tab1" >违规船舶信息记录</a></li>
							<li><a href="#tab2" class="selected">船舶位置</a></li>
						</ul>
					</div>
					<div class="tabscont" >
						<div id="tab1" class="tabson">
							<div class="main">
								<s:form name="pip" namespace="/pip" action="pip_fetchWgcb.do" method="post" >
									<input name="mmsid" id="mmsid" value="" type="hidden" />
									<div class="listtitle3">
										<img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询
									</div>
									<table width="100%" align="center" style="text-align:center;">
										<tr>
											<td>船舶mmsi：</td>
											<td>
												<s:textfield name="wgcbEntity.mmsi" id="mmsi" ></s:textfield>
											</td>
											<td>光缆名称：</td>
											<td>
												<s:textfield name="wgcbEntity.cablename" id="cablename" ></s:textfield>
											</td>
										</tr>
										<tr>
											<td colspan="6">
												<input name="cx" type="submit" class="scbtn1" value="查询" />
												<input name="cz" id="cz" type="button" class="scbtn1" value="重置" />
											</td>
										</tr>
									</table>
								</s:form>
								<br>

								<table class="tablelist">
									<thead>
									<tr>
										<th>序号</th>
										<th>船舶mmsi</th>
										<th>航速(单位1/10节)</th>
										<th>经度</th>
										<th>维度</th>
										<th>对地航向(1/10度为单位)</th>
										<th>光缆名称</th>
										<th>警报等级</th>
										<th>预警来源</th>
										<th>预警时间</th>
										<th>操作</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${wgcbList}" var="w" varStatus="j">
										<tr>
											<td>${j.count}</td>
											<td><a href="javascript:void(0)" onclick="xq('${w.mmsi}')" class="tablelink">${w.mmsi}</a></td>
											<td>${w.sog}</td>
											<td>${w.longitude}</td>
											<td>${w.latitude}</td>
											<td>${w.cog}</td>
											<td>${w.cablename}</td>
											<td>${w.warningrank}</td>
											<c:if test="${w.bjly ==null}">
												<td>${w.bjly}</td>
											</c:if>
											<c:if test="${w.bjly == '地波雷达'}">
												<td><a href="javascript:void(0)" onclick="dbxx('${w.ldid}')" class="tablelink">${w.bjly}</a></td>
											</c:if>
											<c:if test="${w.bjly =='船舶预警'}">
												<td>${w.bjly}</td>

											</c:if>

											<td>${w.addtime}</td>
											<td>
												<a href="javascript:void(0)" onclick="delZxjd('${w.id}')" class="tablelink">删除</a>&nbsp;
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
						<div id="tab2" class="tabson" style="position: relative;height: 100%;">
							<div id="map"></div>
							<div class="controlVisible">
								<a href="#"> 
									<img src="${contextPath}/images/seasProfession/right-jiantou.png" />
								</a>
							</div>
							<div class="seabedLine">
								<div class="title">
									<span>海岸线列表</span>
								</div>
								<div class="contain">
									<div id="scroll">
										<div style="width: 100%;">
											<ul class="menuList"></ul>
										</div>
									</div>
								</div>							
							</div>
							<div class="seabedSet">
								<table class="tablelist2" align="center">
									<tr>
										<th colspan="2">海岸线设置条件</th>
									</tr>									 					
									<tr>
										<td width="25%" style="background-color:#f5f8fa;">OBJECTID：</td>
										<td width="75%"><input id="object" type="text"></td>
									</tr>
									<tr>
										<td width="22%" style="background-color:#f5f8fa;">距离：</td>
										<td width="75%"><input id="distance" type="text"></td>
									</tr>
									<tr>
										<td width="22%" style="background-color:#f5f8fa;" >单位：</td>
										<td width="75%"><input id="unit"type="text"></td>
									</tr>
									<tr>
										<td width="22%" style="background-color:#f5f8fa;">一级航速：</td>
										<td width="75%"><input id="linesog1"type="text"></td>
									</tr>
									<tr>
										<td width="22%" style="background-color:#f5f8fa;">二级航速：</td>
										<td width="75%"><input id="linesog2"type="text"></td>
									</tr>
									<tr>
										<td width="22%" style="background-color:#f5f8fa;">三级航速：</td>
										<td width="75%"><input id="linesog3"type="text"></td>
									</tr>
									<tr>
										<td colspan="2" style="text-align:center;">
											<input name="back" type="button" class="scbtn" onclick="setLine();" value="确定">
											<input name="back" type="button" class="scbtn" onclick="quXiao();" value="取消">											
										</td>
									</tr>									
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

	</body>

</html>