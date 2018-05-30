<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>

		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/easyui.css" rel="stylesheet" type="text/css" />
		<!--<link href="${contextPath}/css/select.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/icon.css" rel="stylesheet" type="text/css" />-->

		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.easyui.min.js"></script>

		<script type="text/javascript">
			$(function() {
				$('#cc').combo({
					required: true,
					editable: false
				});
				$('#sp').appendTo($('#cc').combo('panel'));
				$('#sp input').click(function() {
					var v = $(this).val();
					var s = $(this).next('span').text();
					$('#cc').combo('setValue', v).combo('setText', s).combo('hidePanel');
				});
			});
		</script>

	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">统计分析</a>
				</li>
				<li>
					<a href="#">地面监视监测报告</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<div id="usual1" class="usual">
				<div class="leftinfo1">
					<div class="itab">
						<ul>
							<li>
								<a href="#tab1" class="selected">地面监视监测计划执法情况</a>
							</li>
							<li>
								<a href="#tab2">海域使用新增或变更动态</a>
							</li>
							<li>
								<a href="#tab3">监视监测成果数据质量评价</a>
							</li>
						</ul>
					</div>

					<div id="tab1" class="tabson">
						<div class="formbody">
							<div class="leftinfo1">
								<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
								<table width="100%" align="center" style="text-align:center;">
									<tr>
										<td>区域名称：</td>
										<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>

										<td>录入人：</td>
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
									<th>区域名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
									<th>执行数</th>
									<th>录入人</th>
									<th>录入时间</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>上海滨江森林公园</td>
									<td>6</td>
									<td>张三</td>
									<td>2016-10-25</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>外高桥港区</td>
									<td>8</td>
									<td>李四</td>
									<td>2016-10-12</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>长江口区域</td>
									<td>5</td>
									<td>赵六</td>
									<td>2016-7-21</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>杭州湾区域</td>
									<td>7</td>
									<td>王五</td>
									<td>2016-5-2</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>崇头边滩保留区</td>
									<td>10</td>
									<td>李鹏</td>
									<td>2016-4-25</td>
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

					<div id="tab2" class="tabson">
						<div class="formbody">
							<div class="leftinfo1">
								<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
								<table width="100%" align="center" style="text-align:center;">
									<tr>
										<td>海域名称：</td>
										<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>

										<td>录入人：</td>
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
									<th>海域名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
									<th>是否新增</th>
									<th>是否变更</th>
									<th>变更时间</th>
									<th>录入人</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>上海滨江森林公园</td>
									<td>否</td>
									<td>否</td>
									<td></td>
									<td>张三</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>外高桥港区</td>
									<td>是</td>
									<td>否</td>
									<td></td>
									<td>李四</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>长江口区域</td>
									<td>否</td>
									<td>是</td>
									<td>2016-9-25</td>
									<td>王五</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>杭州湾区域</td>
									<td>是</td>
									<td>是</td>
									<td>2016-10-12</td>
									<td>赵六</td>
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

					<div id="tab3" class="tabson">
						<div class="formbody">
							<div class="leftinfo1">
								<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
								<table width="100%" align="center" style="text-align:center;">
									<tr>
										<td>监测时间：</td>
										<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>

										<td>监测地点：</td>
										<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
										<td>监测区域：</td>
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
									<th>监测时间<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
									<th>监测地点</th>
									<th>监测区域</th>
									<th>数据质量</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>2016-10-25</td>
									<td>上海滨江森林公园</td>
									<td>金山区</td>
									<td>好</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>2016-9-21</td>
									<td>长江口区域</td>
									<td>黄浦区</td>
									<td>中</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>2016-6-2</td>
									<td>杭州湾区域</td>
									<td>松江区</td>
									<td>中</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>2016-5-11</td>
									<td>崇头边滩保留区</td>
									<td>崇明县</td>
									<td>好</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>2016-4-28</td>
									<td>外高桥港区</td>
									<td>浦东新区</td>
									<td>低</td>
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
					<br />

				</div>
			</div>
			<script type="text/javascript">
				$("#usual1 ul").idTabs();
			</script>

			<script type="text/javascript">
				$('.tablelist tbody tr:odd').addClass('odd');
			</script>

	</body>

</html>