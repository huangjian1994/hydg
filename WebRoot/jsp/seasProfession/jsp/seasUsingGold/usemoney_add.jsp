<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap.min.css" />
		<!--<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />-->
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/seasProfession/usemoney-add.css" />
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
					<a href="#">项目使用金新增</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>证书信息</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>用海项目名称</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>用海性质：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="经营性">经营性</option>
								<option value="非经营性">非经营性</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>申请人</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="未完成">未完成</option>
								<option value="已完成">已完成</option>
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
		<!--
		<div class="tools">
			<ul class="toolbar">
				<li>
					<a href="money-add.jsp"><span><img src="${contextPath}/images/seasProfession/t01.png" /></span>新增</a>
				</li>
			</ul>
		</div>
		-->
		<table class="tablelist">
			<thead>
				<tr>
					<th>证书信息<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i></th>
					<th>用海项目名称</th>
					<th>用海性质</th>
					<th>申请人</th>
					<th>用海方式</th>
					<th>附件</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<span>F3000002</span>&nbsp;&nbsp;&nbsp;
						<a href="zs-info.jsp">查看</a>
					</td>
					<td>100129818324</td>
					<td>经营性</td>
					<td>张三</td>
					<td>查看</td>
					<td>
						<a href="#">查看</a>
					</td>
					<td>
						<a href="money-add.jsp">新增</a>
						<a href="zs-info-change.jsp">修改</a>
						<a class="remove" href="#">删除</a>
					</td>
				</tr>
				<tr>
					<td>
						<span>F3000002</span>&nbsp;&nbsp;&nbsp;
						<a href="zs-info.jsp">查看</a>
					</td>
					<td>22342333342</td>
					<td>经营性</td>
					<td>李四</td>
					<td>查看</td>
					<td>
						<a href="#">查看</a>
					</td>
					<td>
						<a href="money-add.jsp">新增</a>
						<a href="zs-info-change.jsp">修改</a>
						<a class="remove" href="#">删除</a>
					</td>
				</tr>
				<tr>
					<td>
						<span>F3000002</span>&nbsp;&nbsp;&nbsp;
						<a href="zs-info.jsp">查看</a>
					</td>
					<td>3334234234234</td>
					<td>经营性</td>
					<td>王二</td>
					<td>查看</td>
					<td>
						<a href="#">查看</a>
					</td>
					<td>
						<a href="money-add.jsp">新增</a>
						<a href="zs-info-change.jsp">修改</a>
						<a class="remove" href="#">删除</a>
					</td>
				</tr>
				<tr>
					<td>
						<span>F3000002</span>&nbsp;&nbsp;&nbsp;
						<a href="zs-info.jsp">查看</a>
					</td>
					<td>2444444234234</td>
					<td>经营性</td>
					<td>赵一</td>
					<td>查看</td>
					<td>
						<a href="#">查看</a>
					</td>
					<td>
						<a href="money-add.jsp">新增</a>
						<a href="zs-info-change.jsp">修改</a>
						<a class="remove" href="#">删除</a>
					</td>
				</tr>
				<tr>
					<td>
						<span>F3000002</span>&nbsp;&nbsp;&nbsp;
						<a href="zs-info.jsp">查看</a>
					</td>
					<td>100129818324</td>
					<td>经营性</td>
					<td>张三</td>
					<td>查看</td>
					<td>
						<a href="#">查看</a>
					</td>
					<td>
						<a href="money-add.jsp">新增</a>
						<a href="zs-info-change.jsp">修改</a>
						<a class="remove" href="#">删除</a>
					</td>
				</tr>
				<tr>
					<td>
						<span>F3000002</span>&nbsp;&nbsp;&nbsp;
						<a href="zs-info.jsp">查看</a>
					</td>
					<td>100129818324</td>
					<td>经营性</td>
					<td>张三</td>
					<td>查看</td>
					<td>
						<a href="#">查看</a>
					</td>
					<td>
						<a href="money-add.jsp">新增</a>
						<a href="zs-info-change.jsp">修改</a>
						<a class="remove" href="#">删除</a>
					</td>
				</tr>
				<tr>
					<td>
						<span>F3000002</span>&nbsp;&nbsp;&nbsp;
						<a href="zs-info.jsp">查看</a>
					</td>
					<td>100129818324</td>
					<td>经营性</td>
					<td>张三</td>
					<td>查看</td>
					<td>
						<a href="#">查看</a>
					</td>
					<td>
						<a href="money-add.jsp">新增</a>
						<a href="zs-info-change.jsp">修改</a>
						<a class="remove" href="#">删除</a>
					</td>
				</tr>
				<tr>
					<td>
						<span>F3000002</span>&nbsp;&nbsp;&nbsp;
						<a href="zs-info.jsp">查看</a>
					</td>
					<td>100129818324</td>
					<td>经营性</td>
					<td>张三</td>
					<td>查看</td>
					<td>
						<a href="#">查看</a>
					</td>
					<td>
						<a href="money-add.jsp">新增</a>
						<a href="zs-info-change.jsp">修改</a>
						<a class="remove" href="#">删除</a>
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
	<script type="text/javascript">
		for(var i = 0; i < $(".tablelist tbody .remove").length; i++) {
			(function(indexI) {
				$(".remove").eq(indexI).on("click", function() {
					$(".tablelist tbody tr").eq(indexI).hide();
					i--;
				})
			})(i)
		}
	</script>

</html>