<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<title>Title</title>
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap.min.css" />		
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/style.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/yy.css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>

	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海岸线管理</a>
				</li>
				<li>
					<a href="#">海岸线调查统计</a>
				</li>
			</ul>
		</div>
		<ul id="myTab" class="nav nav-tabs">
			<li class="active">
				<a href="#dctj1" data-toggle="tab">调查统计维护</a>
			</li>
			<li>
				<a href="#dctj2" data-toggle="tab">调查统计查询</a>
			</li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="dctj1">
				<div class="formbody">
					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
						<table width="100%" align="center" style="text-align:center;">
							<tr>
								<td>岸段序号</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
								<td>海岸线长度</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
								<td>海岸线所在行政区划</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
							</tr>
							<tr>
								<td>海岸线位置</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
								<td>端点坐标</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
								<td>新增人</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
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
				<table class="tablelist">
					<thead>
						<tr>
							<th><input name="" type="checkbox" value="" checked="checked" /></th>
							<th>岸段序号<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
							<th>海岸线长度(千米)</th>
							<th>海岸线所在行政区划</th>
							<th>海岸线位置</th>
							<th>端点坐标</th>
							<th>新增人</th>
							<th>操作 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>H100000232</td>
							<td>1.6</td>
							<td>崇明</td>
							<td>东海</td>
							<td>东经22.3 北纬33.3</td>
							<td>张三</td>
							<td>
								<a href="dctj_detail.jsp" class="tablelink"> 查看</a>
								<a href="dctj_add.jsp" class="tablelink"> 新增</a>
								<a href="dctj_change.jsp" class="tablelink"> 修改</a>
							</td>
						</tr>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>H100000332</td>
							<td>1.8</td>
							<td>崇明</td>
							<td>东海</td>
							<td>东经21.3 北纬23.3</td>
							<td>张四</td>
							<td>
								<a href="dctj_detail.jsp" class="tablelink"> 查看</a>
								<a href="dctj_add.jsp" class="tablelink"> 新增</a>
								<a href="dctj_change.jsp" class="tablelink"> 修改</a>
							</td>
						</tr>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>H100000132</td>
							<td>2.6</td>
							<td>崇明</td>
							<td>东海</td>
							<td>东经12.3 北纬123.3</td>
							<td>张三</td>
							<td>
								<a href="dctj_detail.jsp" class="tablelink"> 查看</a>
								<a href="dctj_add.jsp" class="tablelink"> 新增</a>
								<a href="dctj_change.jsp" class="tablelink"> 修改</a>
							</td>
						</tr>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>H100000242</td>
							<td>3.6</td>
							<td>崇明</td>
							<td>东海</td>
							<td>东经25.3 北纬83.3</td>
							<td>张三</td>
							<td>
								<a href="dctj_detail.jsp" class="tablelink"> 查看</a>
								<a href="dctj_add.jsp" class="tablelink"> 新增</a>
								<a href="dctj_change.jsp" class="tablelink"> 修改</a>
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
			</div>
			<div class="tab-pane fade" id="dctj2">
				<div class="formbody">
					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
						<table width="100%" align="center" style="text-align:center;">
							<tr>
								<td width="20%">统计方式：</td>
								<td width="80%" style="text-align:left;">&nbsp;&nbsp;&nbsp;
									<td style="background-color:#e8edef;">海岸线类型</td>
								</td>
							</tr>
							<tr>
								<td>统计要素：</td>
								<td style="text-align:left;">&nbsp;&nbsp;&nbsp;
									<input name="" type="radio" value="" />证书数量&nbsp;&nbsp;&nbsp;
									<input name="" type="radio" value="" checked="checked" />海域使用面积&nbsp;&nbsp;&nbsp;
									<input name="" type="radio" value="" />海域使用总金额
								</td>
							</tr>
							<tr>
								<td>统计内容：</td>
								<td style="text-align:left;">&nbsp;&nbsp;&nbsp;
									<input name="" type="radio" value="" />本单位及下属单位数据&nbsp;&nbsp;&nbsp;
									<input name="" type="radio" value="" checked="checked" />本单位数据
								</td>
							</tr>
							<tr>
								<td>展示方式：</td>
								<td style="text-align:left;">&nbsp;&nbsp;&nbsp;
									<input name="" type="radio" value="" checked="checked" />柱状图&nbsp;&nbsp;&nbsp;
									<input name="" type="radio" value="" />饼状图&nbsp;&nbsp;&nbsp;
									<input name="" type="radio" value="" />折线图
								</td>
							</tr>

							<tr>
								<td colspan="2">
									<input name="" type="button" class="scbtn1" value="查询" />
									<input name="" type="reset" class="scbtn1" value="重置" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>