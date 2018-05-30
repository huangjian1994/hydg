<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href=".${contextPath}/css/bootstrap.min.css" />
		<!--<link href=".${contextPath}/css/style.css" rel="stylesheet" type="text/css" />-->
		<link rel="stylesheet" type="text/css" href=".${contextPath}/css/seasProfession/jiaona-info.css" />
		<link href=".${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src=".${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src=".${contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src=".${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src=".${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src=".${contextPath}/js/editor/kindeditor.js"></script>
	</head>

	<body>
		<div class="place">
			<span><img src=".${contextPath}/jimages/seasProfession/ico01.png" width="22" height="22" />位置：</span>
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
				<a href="#jiaona-info" data-toggle="tab">海域使用金缴纳信息</a>
			</li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="jiaona-info">
				<div class="formbody">
					<table width="100%" align="center" style="text-align:left;" class="tableXQ">
						<tr>
							<th>证书编号</th>
							<th style="background-color:#e8edef;text-align: center;" colspan="3">F3000002</th>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">项目名称</td>
							<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
							<td style="background-color:#e8edef;">项目位置：</td>
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
							<td style="background-color:#e8edef;">海域使用权人</td>
							<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
							<td style="background-color:#e8edef;">确权方式</td>
							<td>
								<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
									<option value="">-请选择-</option>
									<option value="申请审批">申请审批</option>
								</select>
							</td>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">用海类型A</td>
							<td>
								<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
									<option value="">-请选择-</option>
									<option value="工业用海">工业用海</option>
								</select>
							</td>
							<td style="background-color:#e8edef;">用海类型B</td>
							<td>
								<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
									<option value="">-请选择-</option>
									<option value="工业用海">固体矿产开采用海</option>
								</select>
							</td>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">是否为临时用海</td>
							<td>
								<input type="radio" name="shi" id="" value="是" />是
								<input type="radio" name="shi" id="" value="否" />否
							</td>
							<td style="background-color:#e8edef;">用海时限（日）</td>
							<td>
								<input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
							</td>
						</tr>

						<tr style="margin-top: 10px;">
							<td style="background-color:#e8edef;">缴纳日期</td>
							<td><input name="" type="datetime" class="scinput" value="" style="width:180px;height:20px;" /></td>
							<td style="background-color:#e8edef;">项目类型</td>
							<td>
								<input type="radio" name="pro" id="" value="原有项目" />原有项目
								<input type="radio" name="pro" id="" value="新增项目" />新增项目
							</td>
						</tr>
						<tr>
							<td style="background-color:#e8edef;">登记人</td>
							<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" />
							</td>
							<td style="background-color:#e8edef;">登记时间</td>
							<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
						</tr>
					</table>
					<table width="100%" align="center" style="text-align:center;margin-top: 20px;" class="tableXQ table1">
						<tr>
							<td></td>
							<td></td>
							<td colspan="2">海域使用金应征金额（元）</td>
							<td colspan="3">海域使用金征收金额（元）</td>
							<td colspan="3">海域使用金减免金额（元）</td>

						</tr>
						<tr>
							<td>用海方式（二级）</td>
							<td>用海面积（公顷）</td>
							<td>中央国库</td>
							<td>地方国库</td>
							<td>中央国库</td>
							<td>地方国库</td>
							<td>小计</td>
							<td>中央国库</td>
							<td>地方国库</td>
							<td>小计</td>
						</tr>
						<tr>
							<td><input name="" type="text" class="scinput" value="" style="width:95%" /></td>
							<td><input name="" type="text" class="scinput" value="" style="width:95%" /></td>
							<td><input name="" type="text" class="scinput" value="" style="width:95%" /></td>
							<td><input name="" type="text" class="scinput" value="" style="width:95%" /></td>
							<td><input name="" type="text" class="scinput" value="" style="width:95%" /></td>
							<td><input name="" type="text" class="scinput" value="" style="width:95%" /></td>
							<td><input name="" type="text" class="scinput" value="" style="width:95%" /></td>
							<td><input name="" type="text" class="scinput" value="" style="width:95%" /></td>
							<td><input name="" type="text" class="scinput" value="" style="width:95%" /></td>
							<td><input name="" type="text" class="scinput" value="" style="width:95%" /></td>
						</tr>
					</table>
				</div>
				<div class="tools" style="margin-top: 20px;">
					<ul class="toolbar">
						<li>
							<a href="#">新增</a>
						</li>
						<li>
							<a href="#">修改</a>
						</li>
						<li>
							<a href="#">删除</a>
						</li>
						<li>
							<a href="#">保存</a>
						</li>
						<li>
							<a href="#">取消</a>
						</li>
						<li>
							<a href="#">明细</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		$("#usual1 ul").idTabs();
	</script>

	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</html>