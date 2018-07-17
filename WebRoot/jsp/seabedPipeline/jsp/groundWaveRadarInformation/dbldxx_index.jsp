<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>地波雷达信息</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/mycharts/echarts-all.js"></script>

		<script type="text/javascript">
            $(document).ready(function(){

                $("#cz").click(function () {
                    $("#radarareacode").val("");
                    $("#oId").val("");
                    $("#hhShip").val("");
                    $("#deipTime").val("");
                })
            });

            //船舶详情
            function cbxq(oId) {
                alert(oId);
				location="${contextPath}/dbld/dbld_fetchBoatxqDbld.do?dbldxxEntity.mmsi=" + oId;
            }

            //地波雷达详情
            function dbldxq(id) {
				location="${contextPath}/dbld/dbld_fetchDbldDetaile.do?dbldxxEntity.id=" + id;
            }
		</script>
	</head>

	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seabedPipeline/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">地波雷达信息</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
            <s:form name="dbld" namespace="/dbld" action="dbld_fetchDbldxx.do" method="post" >
				<input name="oIdi" id="oIdi" value="" type="hidden" />
                <div class="leftinfo1">
                    <div class="listtitle3"><img src="${contextPath}/images/seabedPipeline/ico06.png" width="25" height="25" />条件查询</div>
                    <table width="100%" align="center" style="text-align:center;">
                        <tr>
                            <td>雷达区号：</td>
                            <td>
								<s:textfield name="dbldxxEntity.radarareacode" id="radarareacode" ></s:textfield>
                            </td>
                            <td>船舶Mmsi：</td>
                            <td>
								<s:textfield name="dbldxxEntity.oId" id="oId" ></s:textfield>
                            </td>
                        </tr>
                        <tr>
                            <td>船舶呼号：</td>
                            <td>
								<s:textfield name="dbldxxEntity.hhShip" id="hhShip" ></s:textfield>
                            </td>
                            <td>入库时间：</td>

							<td>
								<input name="dbldxxEntity.deipTime" id="deipTime" value="${dbldxxEntity.deipTime}"
									   onclick="WdatePicker()" readonly="readonly" style="width:170px; overflow:auto;" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <input name="cx"  type="submit" class="scbtn1" value="查询" />
                                <input name="cz" id="cz" type="button" class="scbtn1" value="重置" />
                            </td>

                        </tr>
                    </table>
                </div>
            </s:form>
			<br>
		<table class="tablelist">
			<thead>
				<tr>
					<th>序号</th>
					<th>雷达区号</th>
					<th>船舶mmsi</th>
					<th>船名</th>

					<th>经度</th>
					<th>维度</th>
					<th>航向(1/10度为单位)</th>
					<th>航速(单位1/10节)</th>
					<th>船舶呼号</th>
					<th>详情</th>
				</tr>
			</thead>
			<tbody>
            <c:forEach items="${dbldxxEntityList}" var="dbldxx" varStatus="j">
				<tr>
					<th>${j.count}</th>
					<td>${dbldxx.radarareacode}</td>
					<td><a href="javascript:void(0)" onclick="cbxq('${dbldxx.oId}')" class="tablelink">${dbldxx.oId}</a></td>
					<td>${dbldxx.eShipname}</td>

					<td>${dbldxx.longitude}</td>
					<td>${dbldxx.latitude}</td>
					<td>${dbldxx.azimuth}</td>
					<td>${dbldxx.speed}</td>
					<td>${dbldxx.hhShip}</td>
					<td>
						<a href="###" onclick="dbldxq('${dbldxx.id}')" class="tablelink">查看</a>
					</td>
				</tr>
            </c:forEach>
			</tbody>
		</table>

			<div align="center">
				${pageBean}
			</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

			</div>
		</div>
	</body>
</html>