<!DOCTYPE HTML>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>船舶定位信息</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>
	<script type="text/javascript">
		function OneRealtime() {
		    if($("#Mmsino").val() ==""){
		        alert("船舶Mmsi不能为空！");
                return false;
            }
            document.myForm.action ="<%=basePath%>/ais/ais_oneRealtime.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }
        //重置
        function resert(){
            document.getElementById("Mmsino").value="";
            document.getElementById("qywz").value="";
        }
        //查看详情，包括静态数据，船舶档案
        function xq(mmsid){
            document.getElementById("mmsid").value = mmsid;
            alert(mmsid);
            document.myForm.action="<%=basePath%>/ais/ais_fetchBoatxq.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }

	</script>
	<body>
    <form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seabedPipeline/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">船舶定位信息</a>
				</li>
			</ul>
		</div>
        <input name="mmsid" id="mmsid" value="" type="hidden" />

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seabedPipeline/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>船舶MMSI：</td>
						<td width="35%">
							<input  name="Mmsi" id="Mmsino" type="text" placeholder="请输入船舶Mmsi，多个请以,分割" class="scinput" value="${Mmsi}" style="width:300px;"  />
						</td>
						<td>AIS区域实时位置数据查询：</td>
						<td>
							<input name="" id="qywz" type="text" class="scinput" value="" style="width:180px;" />
						</td>
					</tr>
					<tr>
						<td colspan="8">
							<input name="cx" onclick="OneRealtime()" type="button" class="scbtn1" value="查询" />
							<input name="cz" onclick="resert()" type="button" class="scbtn1" value="重置" />
						</td>
					</tr>
				</table>
			</div>

		<table class="tablelist">
			<thead>
				<tr>
					<th>船舶Mmsi</th>
					<th>航速</th>
					<th>对地航向(1/10度为单位)</th>
					<th>真艏向</th>
					<th>经度</th>
					<th>纬度</th>
					<th>AIS时间戳</th>
					<th>接收时间戳</th>
					<th>详情</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${chuanbos}" var="chuanbo" >
				<tr>
					<td>${chuanbo.mmsi}</td>
					<td>${chuanbo.sog}</td>
					<td>${chuanbo.cog}</td>
					<td>${chuanbo.thead}</td>
					<td>${chuanbo.longitude}</td>
					<td>${chuanbo.latitude}</td>
					<td>${chuanbo.utctime}</td>
					<td>${chuanbo.receivetime}</td>
					<td><a href="#" onclick="xq('${chuanbo.mmsi }')" class="tablelink">详情</a></td>
					<%--<td>
						<a href="cbdwxx_detail.jsp" class="tablelink">查看</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>--%>
				</tr>
			</c:forEach>
			</tbody>
            <%--<div>
				${chuanbos}
            </div>--%>
		</table>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>
		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		</div>
		</div>
    </form>
	</body>

</html>