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
					<a href="#">市不动产登记平台接口</a>
				</li>
				<li>
					<a href="#">用海坐标</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="90%" align="center" style="text-align:center;">
					<tr>
						<td>宗海代码：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>坐标编号：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>北纬：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
					</tr>
					<tr>
						<td>东经</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>批文编号</td>
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
					<th>宗海代码<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif"/></i></th>
					<th>坐标编号</th>
					<th>北纬</th>
					<th>东经</th>
					<th>批文编号</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>H1000001231</td>
					<td>321299888823</td>
					<td>27.2</td>
					<td>33.5</td>
					<td>3323232</td>
					<td>
						<a href="yhzb_add.jsp" class="tablelink">新增</a>
						<a href="yhzb_change.jsp" class="tablelink">修改</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>H1000000232</td>
					<td>321233321233</td>
					<td>44.5</td>
					<td>55.4</td>
					<td>3323233</td>
					<td>
						<a href="yhzb_add.jsp" class="tablelink">新增</a>
						<a href="yhzb_change.jsp" class="tablelink">修改</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>H1000009876</td>
					<td>387495876473</td>
					<td>12.3</td>
					<td>33.2</td>
					<td>3323221</td>
					<td>
						<a href="yhzb_add.jsp" class="tablelink">新增</a>
						<a href="yhzb_change.jsp" class="tablelink">修改</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>H1000003874</td>
					<td>329876483764</td>
					<td>54.8</td>
					<td>23.5</td>
					<td>3323233</td>
					<td>
						<a href="yhzb_add.jsp" class="tablelink">新增</a>
						<a href="yhzb_change.jsp" class="tablelink">修改</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>

				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>H1000008763</td>
					<td>312987674367</td>
					<td>77.6</td>
					<td>45.6</td>
					<td>3323233</td>
					<td>
						<a href="yhzb_add.jsp" class="tablelink">新增</a>
						<a href="yhzb_change.jsp" class="tablelink">修改</a>
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
	</body>
	<script type="text/javascript">
		$("#usual1 ul").idTabs();
	</script>

	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</html>