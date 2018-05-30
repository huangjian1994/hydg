<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap.min.css" />
		<!--<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />-->
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/seasProfession/jiaona.css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>

	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">使用金征收管理</a>
				</li>
				<li>
					<a href="#">使用金缴纳</a>
				</li>
			</ul>
		</div>
		<ul id="myTab" class="nav nav-tabs">
			<li class="active">
				<a href="#jiaona1" data-toggle="tab">已授权项目海域使用金缴纳</a>
			</li>
			<li>
				<a href="#jiaona2" data-toggle="tab">临时用海域使用金缴纳</a>
			</li>
			<li>
				<a href="#jiaona3" data-toggle="tab">海域使用金缴纳记录</a>
			</li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="jiaona1">
				<div class="formbody">
					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
						<table width="100%" align="center" style="text-align:center;">
							<tr>
								<td>项目名称：</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
								<td>使用权人</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
								<td>证书编号</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
							</tr>
							<tr>
								<td>项目状态：</td>
								<td>
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="未完成">未完成</option>
										<option value="已完成">已完成</option>
									</select>
								</td>
								<td>项目位置：</td>
								<td>
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="浦东区">浦东区</option>
										<option value="闵行区">闵行区</option>
										<option value="静安区">静安区</option>
									</select>
								</td>
								<td>缴纳类型：</td>
								<td>
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="全部">全部</option>
										<option value="部分">部分</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>证书级别</td>
								<td>
									<input type="checkbox" name="" id="gj" value="" /><label for="gj">国家级别</label>
									<input type="checkbox" name="" id="sj" value="" /><label for="sj">省级</label>
									<input type="checkbox" name="" id="shij" value="" /><label for="shij">市级</label>
									<input type="checkbox" name="" id="qj" value="" /><label for="qj">区县级</label>
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
							<th>缴纳明细<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
							<th>证书编号</th>
							<th>项目名称</th>
							<th>用海性质</th>
							<th>发证级别</th>
							<th>海域使用权人</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>
								<a href="jiaona-info.jsp">缴纳明细</a>
							</td>
							<td>
								<a href="#">100129818324</a>
							</td>
							<td>
								<a href="#">会飞的鱼</a>
							</td>
							<td>经营性</td>
							<td>国家级</td>
							<td>11235</td>
						</tr>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>
								<a href="jiaona-info.jsp">缴纳明细</a>
							</td>
							<td>
								<a href="#">100123818324</a>
							</td>
							<td>
								<a href="#">会飞的鸟</a>
							</td>
							<td>经营性</td>
							<td>国家级</td>
							<td>833</td>
						</tr>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>
								<a href="jiaona-info.jsp">缴纳明细</a>
							</td>
							<td>
								<a href="#">10044218324</a>
							</td>
							<td>
								<a href="#">会飞的虫</a>
							</td>
							<td>经营性</td>
							<td>国家级</td>
							<td>1533</td>
						</tr>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>
								<a href="jiaona-info.jsp">缴纳明细</a>
							</td>
							<td>
								<a href="#">1001232324</a>
							</td>
							<td>
								<a href="#">发生的附件</a>
							</td>
							<td>经营性</td>
							<td>国家级</td>
							<td>1333</td>

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
			<div class="tab-pane fade" id="jiaona2">
				<div class="formbody">
					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
						<table width="100%" align="center" style="text-align:center;">
							<tr>
								<td>项目名称：</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
								<td>海域使用权人</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
							</tr>
							<tr>
								<td>用海性质：</td>
								<td>
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="经营性">经营性</option>
										<option value="非经营性">非经营性</option>
									</select>
								</td>
								<td>项目位置：</td>
								<td>
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="浦东区">浦东区</option>
										<option value="闵行区">闵行区</option>
										<option value="静安区">静安区</option>
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
							<th>缴纳明细<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
							<th>临时用海项目</th>
							<th>海域使用权人</th>
							<th>项目性质</th>
							<th>海域使用权人</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>
								<a href="jiaona-info.jsp">缴纳明细</a>
							</td>
							<td>100129818324</td>
							<td>发生的附件</td>
							<td>经营性</td>
							<td>国家级</td>
						</tr>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>
								<a href="jiaona-info.jsp">缴纳明细</a>
							</td>
							<td>22342333342</td>
							<td>进入维护</td>
							<td>经营性</td>
							<td>国家级</td>
						</tr>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>
								<a href="jiaona-info.jsp">缴纳明细</a>
							</td>
							<td>3334234234234</td>
							<td>疯狂的时光</td>
							<td>经营性</td>
							<td>国家级</td>
						</tr>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>
								<a href="jiaona-info.jsp">缴纳明细</a>
							</td>
							<td>2444444234234</td>
							<td>多个方法</td>
							<td>经营性</td>
							<td>国家级</td>
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
			<div class="tab-pane fade" id="jiaona3">
				<div class="formbody">
					<div class="leftinfo1">
						<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
						<table width="100%" align="center" style="text-align:center;">
							<tr>
								<td>项目名称：</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
								<td>海域使用权人</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
							</tr>
							<tr>
								<td>用海性质：</td>
								<td>
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="经营性">经营性</option>
										<option value="非经营性">非经营性</option>
									</select>
								</td>
								<td>项目位置：</td>
								<td>
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="浦东区">浦东区</option>
										<option value="闵行区">闵行区</option>
										<option value="静安区">静安区</option>
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
				<div class="tools">
					<ul class="toolbar">
						<li>
							<a href="jiaona-info-add.jsp"><span><img src="${contextPath}/images/seasProfession/t01.png" /></span>新增</a>
						</li>
					</ul>
				</div>
				<table class="tablelist">
					<thead>
						<tr>
							<th><input name="" type="checkbox" value="" checked="checked" /></th>
							<th>缴纳时间<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
							<th>证书编号</th>
							<th>项目名称</th>
							<th>海域使用权人</th>
							<th>是否临时项目</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>2014-05-12</td>
							<td>100129818324</td>
							<td>发生的附件</td>
							<td>张三</td>
							<td>是</td>
						</tr>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>2014-05-13</td>
							<td>22342333342</td>
							<td>进入维护</td>
							<td>李四</td>
							<td>否</td>
						</tr>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>2016-05-12</td>
							<td>3334234234234</td>
							<td>疯狂的时光</td>
							<td>王二</td>
							<td>否</td>
						</tr>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>2015-05-12</td>
							<td>2444444234234</td>
							<td>多个方法</td>
							<td>赵一</td>
							<td>是</td>
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