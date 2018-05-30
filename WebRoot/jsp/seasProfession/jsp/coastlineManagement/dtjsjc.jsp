<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}//js/jquery.js"></script>
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
					<a href="#">动态监视监测管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>海岸线名称：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="一号海岸线">一号海岸线</option>
								<option value="二号海岸线">二号海岸线</option>
							</select>
						</td>

						<td>管辖单位：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="上海市海洋局">上海市海洋局</option>
								<option value="崇明分局">崇明分局</option>
							</select>
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

		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="" type="checkbox" value="" checked="checked" /></th>
					<th>海岸线名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif"/></i></th>
					<th>海岸侵蚀程度</th>
					<th>冲於程度</th>
					<th>海水入侵程度</th>
					<th>蓝藻程度</th>
					<th>富营养化程度</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>一号海岸线</td>
					<td>一般</td>
					<td>一般</td>
					<td>一般</td>
					<td>中等</td>
					<td>严重</td>
					<td>
						<a href="dtjsjc_detail.jsp" class="tablelink"> 查看</a>
						<a href="dtjsjc_add.jsp" class="tablelink"> 新增</a>
						<a href="dtjsjc_change.jsp" class="tablelink"> 修改</a>
						<a href="jsjc.jsp" class="tablelink"> 监视监测</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>二号海岸线</td>
					<td>中等</td>
					<td>中等</td>
					<td>中等</td>
					<td>一般</td>
					<td>一般</td>
					<td>
						<a href="dtjsjc_detail.jsp" class="tablelink"> 查看</a>
						<a href="dtjsjc_add.jsp" class="tablelink"> 新增</a>
						<a href="dtjsjc_change.jsp" class="tablelink"> 修改</a>
						<a href="jsjc.jsp" class="tablelink"> 监视监测</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>三号海岸线</td>
					<td>一般</td>
					<td>中等</td>
					<td>中等</td>
					<td>严重</td>
					<td>一般</td>
					<td>
						<a href="dtjsjc_detail.jsp" class="tablelink"> 查看</a>
						<a href="dtjsjc_add.jsp" class="tablelink"> 新增</a>
						<a href="dtjsjc_change.jsp" class="tablelink"> 修改</a>
						<a href="jsjc.jsp" class="tablelink"> 监视监测</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>四号海岸线</td>
					<td>严重</td>
					<td>严重</td>
					<td>严重</td>
					<td>一般</td>
					<td>中等</td>
					<td>
						<a href="dtjsjc_detail.jsp" class="tablelink"> 查看</a>
						<a href="dtjsjc_add.jsp" class="tablelink"> 新增</a>
						<a href="dtjsjc_change.jsp" class="tablelink"> 修改</a>
						<a href="jsjc.jsp" class="tablelink"> 监视监测</a>
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