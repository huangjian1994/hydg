<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>

		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/easyui.css" rel="stylesheet" type="text/css" />
		<!--<link href="${contextPath}/css/select.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/icon.css" rel="stylesheet" type="text/css" />-->

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/mycharts/echarts-all.js"></script>

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

			function godatil() {
				window.open("detail.html", "displayWindow", "menubar=yes,width=600,height=450");
			}
		</script>

	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海域综合查询</a>
				</li>
				<li>
					<a href="#">海域勘界可视化</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div id="usual1" class="usual">

				<div id="tab1" class="tabson">
					<div class="leftinfo1">
						<!--开始-->

						<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
						<table width="90%" align="center" style="text-align:center;">
							<tr>
								<td>海域名称：</td>
								<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
								<td>区县：</td>
								<td>
									<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="崇明县">崇明县</option>
										<option value="宝山区">宝山区</option>
										<option value="浦东新区">浦东新区</option>
										<option value="奉贤区">奉贤区</option>
										<option value="金山区">金山区</option>
									</select>
								</td>

								<td>
									<input name="" type="button" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
									<input name="" type="reset" class="scbtn1" value="重置" /> &nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>

						</table>
					</div>
					<!--结束-->
					<!--下边开始-->
					<div id="usual1" class="usual" style="width:250px; height:500px;float:left">
						<!--左上边开始--->
						<div class="leftinfo1">
							<!--开始-->

							<table width="90%" align="center" style="text-align:center;">
								<tr>
									<td align="left" width="150px"> <img src="${contextPath}/images/seasProfession/leftico02.png" /> &nbsp;&nbsp;
										<a target="aaa" href="${contextPath}/images/seasProfession/zhcx/chongming.PNG">历史沿革</a>
									</td>
								</tr>
								<tr>
									<td align="left" width="150px"> <img src="${contextPath}/images/seasProfession/leftico02.png" /> &nbsp;&nbsp;
										<a target="aaa" href="${contextPath}/images/seasProfession/zhcx/damap.png">海洋经济</a>
									</td>
								</tr>
								<tr>
									<td align="left" width="150px"> <img src="${contextPath}/images/seasProfession/leftico02.png" /> &nbsp;&nbsp;
										<a target="aaa" href="${contextPath}/images/seasProfession/zhcx/hygnqhksh.PNG">自然地理和地质地貌概况</a>
									</td>
								</tr>
								<tr>
									<td align="left" width="150px"> <img src="${contextPath}/images/seasProfession/leftico02.png" /> &nbsp;&nbsp;
										<a target="aaa" href="${contextPath}/images/seasProfession/zhcx/damap.png">海洋环境</a>
									</td>
								</tr>
								<tr>
									<td align="left" width="150px"> <img src="${contextPath}/images/seasProfession/leftico02.png" /> &nbsp;&nbsp;
										<a target="aaa" href="${contextPath}/images/seasProfession/zhcx/11.PNG">海洋资源</a>
									</td>
								</tr>
								<tr>
									<td align="left" width="150px"> <img src="${contextPath}/images/seasProfession/leftico02.png" /> &nbsp;&nbsp;
										<a target="aaa" href="${contextPath}/images/seasProfession/zhcx/damap.png">开发与管理现状</a>
									</td>
								</tr>
								<tr>
									<td align="left" width="150px"> <img src="${contextPath}/images/seasProfession/leftico02.png" /> &nbsp;&nbsp;
										<a target="aaa" href="${contextPath}/images/seasProfession/zhcx/11.PNG">海域</a>
									</td>
								</tr>
								<tr>
									<td align="left" width="150px"> <img src="${contextPath}/images/seasProfession/leftico02.png" /> &nbsp;&nbsp;
										<a target="aaa" href="${contextPath}/images/seasProfession/zhcx/damap.png">滩涂</a>
									</td>
								</tr>
								<tr>
									<td align="left" width="150px"> <img src="${contextPath}/images/seasProfession/leftico02.png" /> &nbsp;&nbsp;
										<a target="aaa" href="${contextPath}/images/seasProfession/zhcx/damap.png">浅海</a>
									</td>
								</tr>
								<tr>
									<td align="left" width="150px"> <img src="${contextPath}/images/seasProfession/leftico02.png" /> &nbsp;&nbsp;
										<a target="aaa" href="${contextPath}/images/seasProfession/zhcx/hygnqhksh.PNG">岛屿使用和归属争议的缘由和结果</a>
									</td>
								</tr>
							</table>
						</div>
						<!---左上边结束--->

					</div>

					<div style="float:left;">
						<div style="margin-left:2px"><iframe frameborder="0" scrolling="no" name="aaa" width="750px" height="600px" src="${contextPath}/images/seasProfession/zhcx/hygnqhksh.PNG"></iframe></div>

					</div>
					<!--下边结束-->

				</div>

			</div>
			<br />
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

	</body>

</html>