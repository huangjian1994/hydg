<!DOCTYPE HTML>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>船舶静态数据信息</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>
	<script type="text/javascript">
		function boat() {
		    if($("#Mmsino").val() ==""){
		        alert("船舶Mmsi不能为空！");
                return false;
            }
            document.myForm.action ="<%=basePath%>/ais/ais_aisStaticRecord.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }
        //重置
        function resert(){
            document.getElementById("Mmsino").value="";
            //document.getElementById("qywz").value="";
        }
	</script>
	<body>
    <form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seabedPipeline/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">船舶静态数据信息</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seabedPipeline/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td width="35%">船舶MMSI：</td>
						<td width="65">
							<input   name="Mmsi" id="Mmsino" type="text" placeholder="请输入船舶Mmsi，多个请以,分割"
									 class="scinput" value="${Mmsi}" style="width:90%;"  />
						</td>

					</tr>
					<tr>
						<td colspan="8">
							<input name="cx" onclick="boat()" type="button" class="scbtn1" value="查询" />
							<input name="cz" onclick="resert()" type="button" class="scbtn1" value="重置" />
						</td>
					</tr>
				</table>
			</div>

		<table class="tablelist">
			<thead>
				<tr>

					<th>船舶MMSI</th>
					<th>呼号</th>
					<th>名称</th>
					<th>船舶和货物类型</th>
					<th>船长</th>
					<th>船宽</th>
					<th>预计到港时间</th>
					<th>目前最大静态吃水</th>
					<th>目的港</th>

				</tr>
			</thead>
			<tbody>
			<c:forEach items="${boatStaticList}" var="bs" >
				<tr>
					<td>${bs.mmsi}</td>
					<td>${bs.callno}</td>
					<td>${bs.shipname}</td>
					<td>${bs.shipAndCargType}</td>
					<td>${bs.length}</td>
					<td>${bs.width}</td>
					<td>${bs.eta}</td>
					<td>${bs.draft}</td>
					<td>${bs.dest}</td>

				</tr>
			</c:forEach>
			</tbody>
            <%--<div>
				${chuanbos}
            </div>--%>
		</table>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		</div>
		</div>
    </form>
	</body>

</html>