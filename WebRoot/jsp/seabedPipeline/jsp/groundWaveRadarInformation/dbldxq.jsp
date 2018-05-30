<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>

		<script type="text/javascript">
			function checkAll() {
				var cb = document.getElementById("cb");
				var chks = document.getElementsByName("chk");
				if(cb.checked == true) {
					for(var i = 0; i < chks.length; i++) {
						chks[i].checked = true;
					}
				} else {
					for(var i = 0; i < chks.length; i++) {
						chks[i].checked = false;
					}
				}
			}
			<!--使用onchange="jumpMenu()"触发jumpMenu()方法-->
			function jumpMenu(e) {
				window.location.href = e.value;
			}
		</script>
		<script type="text/javascript">

		//返回
		function goBack(){
			document.myForm.action="<%=basePath%>/dbld/dbld_fetchDbldxx.do";
			document.myForm.target="_self";
			document.myForm.submit();

		}
		</script>
	</head>

	<body>
		<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">地波雷达信息</a></li>
				<li><a href="#">详细信息</a></li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo" >
				<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td style="background-color:#f5f8fa;" width="20%">雷达区号：</td>
					<td width="30%" id="yjlmcY">${dbldxxEntity.radarareacode }</td>
					<td style="background-color:#f5f8fa;" width="20%">船舶mmsi：</td>
					<td width="30%" id="ejlmcY">${dbldxxEntity.mmsi }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">距离(千米)：</td>
					<td>${dbldxxEntity.distance }</td>
					<td style="background-color:#f5f8fa;">时间：</td>
					<td>${dbldxxEntity.deipTime }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">经度：</td>
					<td>${dbldxxEntity.longitude }</td>

					<td style="background-color:#f5f8fa;">维度：</td>
					<td>${dbldxxEntity.latitude }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">航速(单位1/10节)：</td>
					<td>${dbldxxEntity.speed }</td>

					<td style="background-color:#f5f8fa;">航向(1/10度为单位)：</td>
					<td>${dbldxxEntity.azimuth }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">本地船名：</td>
					<td>${dbldxxEntity.shipname }</td>

					<td style="background-color:#f5f8fa;">英文船名：</td>
					<td id="xzqyY">${dbldxxEntity.eShipname }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">初始登记号：</td>
					<td>${dbldxxEntity.rInitId }</td>
					<td style="background-color:#f5f8fa;">船舶呼号：</td>
					<td>${dbldxxEntity.hhShip}</td>

				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">IMO编号：</td>
					<td>${dbldxxEntity.imo }</td>
					<td style="background-color:#f5f8fa;">数据来源名称：</td>
					<td>${dbldxxEntity.fromNam }</td>

				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack()" />
					</td>
				</tr>
			</table>
		</div>
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

	</form>
	</body>

</html>