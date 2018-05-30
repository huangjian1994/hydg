<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>地波雷达信息</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>

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
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seabedPipeline/ico06.png" width="25" height="25" />条件查询</div>
				<table width="90%" align="center" style="text-align:center;">
					<tr>
						<td>目标雷达：</td>
						<td>
							<input name="" type="text" class="scinput" value="" style="height:20px;" />
						</td>
						<td>雷达区号：</td>
						<td>
							<input name="" type="text" class="scinput" value="" style="height:20px;" />
						</td>
						<td>目标编号：</td>
						<td>
							<input name="" type="text" class="scinput" value="" style="height:20px;" />
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<input name="" type="button" class="scbtn1" value="查询" />
							<input name="" type="reset" class="scbtn1" value="重置" />
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="tools">
			<ul class="toolbar">
				<li>
					<a href="dbldxx_add1.jsp"><span><img src="${contextPath}/images/seabedPipeline/t01.png" /></span>新增</a>
				</li>
				<li>
					<a href="dbldxx_update.jsp"><span><img src="${contextPath}/images/seabedPipeline/t02.png" /></span>修改</a>
				</li>
			</ul>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="" type="checkbox" value="" checked="checked" /></th>
					<th>目标雷达<i class="sort"><img src="${contextPath}/images/seabedPipeline/px.gif" /></i></th>
					<th>雷达区号</th>
					<th>时间</th>
					<th>目标编号</th>
					<th>距离</th>
					<th>经纬度</th>
					<th>航速</th>
					<th>航向</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>雷达1</td>
					<td>区号1</td>
					<td>2012-5-6</td>
					<td>bk213</td>
					<td>海岸五千米</td>
					<td>北纬39度</td>
					<td>航速2km/h</td>
					<td>西北15度</td>
					<td>
						<a href="dbldxx_detail.jsp" class="tablelink">查看</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>雷达2</td>
					<td>区号2</td>
					<td>2012-8-9</td>
					<td>bk217</td>
					<td>海岸四千米</td>
					<td>北纬39.56度</td>
					<td>航速1km/h</td>
					<td>西北45度</td>
					<td>
						<a href="${contextPath}/jsp/seabedPipeline/jsp/groundWaveRadarInformation/dbldxx_detail.jsp" class="tablelink">查看</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>雷达3</td>
					<td>区号3</td>
					<td>2012-9-9</td>
					<td>bk221</td>
					<td>海岸四千米</td>
					<td>北纬39.56度</td>
					<td>航速3km/h</td>
					<td>西南45度</td>
					<td>
						<a href="${contextPath}/jsp/seabedPipeline/jsp/groundWaveRadarInformation/dbldxx_detail.jsp" class="tablelink">查看</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>雷达4</td>
					<td>区号4</td>
					<td>2012-10-9</td>
					<td>bk223</td>
					<td>海岸四千米</td>
					<td>北纬39.56度</td>
					<td>航速1km/h</td>
					<td>西北45度</td>
					<td>
						<a href="dbldxx_detail.jsp" class="tablelink">查看</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>雷达5</td>
					<td>区号5</td>
					<td>2012-11-9</td>
					<td>bk225</td>
					<td>海岸五千米</td>
					<td>北纬39.56度</td>
					<td>航速5km/h</td>
					<td>西北45度</td>
					<td>
						<a href="${contextPath}/jsp/seabedPipeline/jsp/groundWaveRadarInformation/dbldxx_detail.jsp" class="tablelink">查看</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>雷达6</td>
					<td>区号6</td>
					<td>2012-12-9</td>
					<td>bk227</td>
					<td>海岸三千米</td>
					<td>北纬40.56度</td>
					<td>航速1km/h</td>
					<td>西北10度</td>
					<td>
						<a href="${contextPath}/jsp/seabedPipeline/jsp/groundWaveRadarInformation/dbldxx_detail.jsp" class="tablelink">查看</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="pagin">
			<div class="message">共<i class="blue">10</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
			<ul class="paginList">
				<li class="paginItem">
					<a href="javascript:;"><span class="pagepre"></span></a>
				</li>
				<li class="paginItem">
					<a href="javascript:;">1</a>
				</li>
				<li class="paginItem current">
					<a href="javascript:;">2</a>
				</li>
				<li class="paginItem">
					<a href="javascript:;">3</a>
				</li>
				<li class="paginItem">
					<a href="javascript:;">4</a>
				</li>
				<li class="paginItem">
					<a href="javascript:;">5</a>
				</li>
				<li class="paginItem more">
					<a href="javascript:;">...</a>
				</li>
				<li class="paginItem">
					<a href="javascript:;">10</a>
				</li>
				<li class="paginItem">
					<a href="javascript:;"><span class="pagenxt"></span></a>
				</li>
			</ul>
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

		</div>

	</body>

</html>