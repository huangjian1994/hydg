<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">用海项目审批</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>用海项目名称：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>项目类型：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="非填海项目用海行政许可">非填海项目用海行政许可</option>
								<option value="填海项目用海行政许可">填海项目用海行政许可</option>
								<option value="临时用海审批">临时用海审批</option>
								<option value="无居民海岛使用项目审批">无居民海岛使用项目审批</option>
							</select>
						</td>
						<td>申请时间：</td>
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
					<th>证书信息</th>
					<th>用海项目名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
					<th>项目类型</th>
					<th>申请人</th>
					<th>申请时间</th>
					<th>申请单位</th>
					<th>审批状态</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>F20150202</td>
					<td>外高桥港区</td>
					<td>临时用海审批</td>
					<td>张三</td>
					<td>2016-9-1</td>
					<td>嘎嘎嘎</td>
					<td>
						<a href="#" class="tablelink">详情</a>&nbsp;&nbsp;
						<a href="dsp.jsp" class="tablelink">待审批</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>F20150202</td>
					<td>上海滨江森林公园</td>
					<td>临时用海审</td>
					<td>李四</td>
					<td>2016-10-21</td>
					<td>哈哈哈</td>
					<td>
						<a href="#" class="tablelink">详情</a>&nbsp;&nbsp;
						<a href="dsp.jsp" class="tablelink">待审批</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>F20150202</td>
					<td>外高桥港区</td>
					<td>临时用海审批</td>
					<td>张三</td>
					<td>2016-9-1</td>
					<td>嘎嘎嘎</td>
					<td>
						<a href="#" class="tablelink">详情</a>&nbsp;&nbsp;
						<a href="dsp.jsp" class="tablelink">待审批</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>F20150202</td>
					<td>上海滨江森林公园</td>
					<td>临时用海审</td>
					<td>李四</td>
					<td>2016-10-21</td>
					<td>哈哈哈</td>
					<td>
						<a href="#" class="tablelink">详情</a>&nbsp;&nbsp;
						<a href="dsp.jsp" class="tablelink">待审批</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>F20150202</td>
					<td>外高桥港区</td>
					<td>临时用海审批</td>
					<td>张三</td>
					<td>2016-9-1</td>
					<td>嘎嘎嘎</td>
					<td>
						<a href="#" class="tablelink">详情</a>&nbsp;&nbsp;
						<a href="dsp.jsp" class="tablelink">待审批</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>F20150202</td>
					<td>上海滨江森林公园</td>
					<td>临时用海审</td>
					<td>李四</td>
					<td>2016-10-21</td>
					<td>哈哈哈</td>
					<td>
						<a href="#" class="tablelink">详情</a>&nbsp;&nbsp;
						<a href="dsp.jsp" class="tablelink">待审批</a>
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