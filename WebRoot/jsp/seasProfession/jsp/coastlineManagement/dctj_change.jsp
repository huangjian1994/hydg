<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<style>
			.hax {
				display: none;
				;
			}
			
			.hax_first {
				display: inline-block;
			}
		</style>
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
		<script>
			$(function() {
				function linked(first, second) {
					$(first).change(function() {
						var index = $(this).get(0).selectedIndex;
						$(second).hide().eq(index).show();
					});
				}
				linked("#hax-type", ".hax");
			})
		</script>
		<script type="text/javascript">
			function checkAll() {
				var cb = document.getElementById("cb");
				var chks = document.getElementsByName("chk");
				if(cb.checked == true) {
					for(var i = 0; i < chks.length; i++) {
						chks[i].checked = true;
					}
				} else {
					for(var i = 0; i < chks.length; i++) {
						chks[i].checked = false;
					}
				}
			}

			<!--使用onchange="jumpMenu()"触发jumpMenu()方法-->
			function jumpMenu(e) {
				window.location.href = e.value;
			}
		</script>
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

		<div class="formbody">

			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">海岸线名称</td>
					<td><input name="" type="text" class="scinput" value="一号海岸线" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">海岸线长度(千米)</td>
					<td><input name="" type="text" class="scinput" value="1.6" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">
						<select id="hax-type">
							<option>------------海岸线类型-------------</option>
							<option>人工岸线</option>
							<option selected>自然岸线</option>
							<option>具有自然岸滩形态特征和生物功能的海岸线</option>
						</select>
					</td>
					<td>
						<select class="hax hax_first">
							<option>砂质岸线</option>
						</select>

						<select class="hax">
							<option>----请选择----</option>
							<option>人工岸线</option>
						</select>
						<select class="hax">
							<option>----请选择----</option>
							<option>砂质岸线</option>
							<option>淤泥质岸线</option>
							<option>基岩岸线</option>
							<option>河口岸线</option>
						</select>
						<select class="hax">
							<option>----请选择----</option>
							<option>自然恢复的岸线</option>
							<option>整治修复的岸线</option>
							<option>海洋保护区内的具有生态功能岸线</option>
						</select>
					</td>
					<td style="background-color:#e8edef;">海岸线所在行政区划</td>
					<td><input name="" type="text" class="scinput" value="崇明" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海岸线位置</td>
					<td><input name="" type="text" class="scinput" value="一号海岸线" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">端点坐标</td>
					<td><input name="" type="text" class="scinput" value="1.6" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海岸线保有率</td>
					<td><input name="" type="text" class="scinput" value="划分" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">海岸线保护类别</td>
					<td>
						<select>
							<option>----请选择----</option>
							<option>严格保护岸线</option>
							<option selected>限制开发岸线</option>
							<option>优化利用岸线</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">开发利用现状</td>
					<td>
						<select>
							<option>----请选择----</option>
							<option>渔业岸线</option>
							<option>工业岸线</option>
							<option>港口岸线</option>
							<option>旅游岸线</option>
							<option selected>城乡岸线</option>
							<option>其他利用岸线</option>
							<option>未利用岸线</option>
						</select>
					</td>
					<td style="background-color:#e8edef;">整治修复情况</td>
					<td>
						<select>
							<option>----请选择----</option>
							<option selected>已完成</option>
							<option>实施中</option>
							<option>计划中</option>
							<option>尚未有计划</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">动态变化情况</td>
					<td>
						<select>
							<option>----请选择----</option>
							<option>未发生变化</option>
							<option selected>围填海占用</option>
							<option>整治修复新形成</option>
							<option>自然恢复形成</option>
						</select>
					</td>
					<td style="background-color:#e8edef;">新增人</td>
					<td><input name="" type="text" class="scinput" value="2016-9-25" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">新增时间</td>
					<td><input name="" type="text" class="scinput" value="李四" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">最近修改时间</td>
					<td><input name="" type="text" class="scinput" value="2016-9-25" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="window.location='dctj.jsp'" value="保存">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='dctj.jsp'" />
					</td>
				</tr>
			</table>
		</div>
		<div>
			<script type="text/javascript">
				$("#usual1 ul").idTabs();
			</script>

			<script type="text/javascript">
				$('.tablelist tbody tr:odd').addClass('odd');
			</script>

		</div>

	</body>

</html>