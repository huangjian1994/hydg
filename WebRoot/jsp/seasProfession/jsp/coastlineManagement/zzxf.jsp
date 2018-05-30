<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<title>Title</title>		
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/style.css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>		
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
					<a href="#">海岸线整治修复</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>工程项目名称</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>岸段序号</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>项目形式</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
					</tr>
					<tr>
						<td>位置</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>轮廓</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
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
					<th>工程项目名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif"/></i></th>
					<th>岸段序号</th>
					<th>项目形式</th>
					<th>位置</th>
					<th>轮廓</th>
					<th>姓名</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>大风厂</td>
					<td>H100000232</td>
					<td>崇明</td>
					<td>东海</td>
					<td>东经22.3 北纬33.3</td>
					<td>张三</td>
					<td>
						<a href="zzxf_detail.jsp" class="tablelink"> 查看</a>
						<a href="zzxf_add.jsp" class="tablelink"> 新增</a>
						<a href="zzxf_change.jsp" class="tablelink"> 修改</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>大风厂</td>
					<td>H100000222</td>
					<td>崇明</td>
					<td>东海</td>
					<td>东经21.3 北纬23.3</td>
					<td>张四</td>
					<td>
						<a href="zzxf_detail.jsp" class="tablelink"> 查看</a>
						<a href="zzxf_add.jsp" class="tablelink"> 新增</a>
						<a href="zzxf_change.jsp" class="tablelink"> 修改</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>大风厂</td>
					<td>H100000232</td>
					<td>崇明</td>
					<td>东海</td>
					<td>东经12.3 北纬123.3</td>
					<td>张三</td>
					<td>
						<a href="zzxf_detail.jsp" class="tablelink"> 查看</a>
						<a href="zzxf_add.jsp" class="tablelink"> 新增</a>
						<a href="zzxf_change.jsp" class="tablelink"> 修改</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>大风厂</td>
					<td>H100000232</td>
					<td>崇明</td>
					<td>东海</td>
					<td>东经25.3 北纬83.3</td>
					<td>张三</td>
					<td>
						<a href="zzxf_detail.jsp" class="tablelink"> 查看</a>
						<a href="zzxf_add.jsp" class="tablelink"> 新增</a>
						<a href="zzxf_change.jsp" class="tablelink"> 修改</a>
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

	</body>

</html>