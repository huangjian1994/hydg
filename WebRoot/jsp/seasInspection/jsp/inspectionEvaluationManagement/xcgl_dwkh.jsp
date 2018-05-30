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
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">巡查考评管理</a>
				</li>
				<li>
					<a href="#">巡查单位考核</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div id="usual1" class="usual">
				<div class="leftinfo1">
					<div class="itab">
						<ul>
							<li>
								<a href="#tab1" class="selected">查询</a>
							</li>
							<li>
								<a href="#tab2">月报</a>
							</li>
							<li>
								<a href="#tab3">季报</a>
							</li>
							<li>
								<a href="#tab4">年报</a>
							</li>
						</ul>
					</div>

					<div id="tab1" class="tabson">
						<div class="leftinfo1">
							<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
							<table width="90%" align="center" style="text-align:center;">
								<tr>
									<td>巡查单位：</td>
									<td>
										<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
											<option value="">-请选择-</option>
											<option value="第一支队">第一支队</option>
											<option value="第二支队">第二支队</option>
											<option value="崇明第一分队">崇明第一分队</option>
											<option value="奉贤第一分队">奉贤第一分队</option>
										</select>

									</td>
									<td>巡查时间段：</td>
									<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" />至<input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
								</tr>
								<tr>
									<td colspan="6">
										<input name="" type="button" class="scbtn1" value="查询" />
										<input name="" type="reset" class="scbtn1" value="重置" />
									</td>
								</tr>
							</table>
						</div>
						<div style="float:right"><input name="" type="button" class="scbtn1" value="导出表" />
							<input name="" type="button" class="scbtn1" value="打印" /></div>
						<table class="tablelist">
							<thead>
								<tr>
									<th><input name="" type="checkbox" value="" checked="checked" /></th>
									<th>巡查单位<i class="sort"><img src="${contextPath}/images/seasInspection/px.gif" /></i></th>
									<th>管理机构</th>
									<th>计划管理</th>
									<th>精神文明</th>
									<th>制度管理</th>
									<th>档案管理</th>
									<th>日常管理</th>
									<th>安全管理</th>
									<th>信息上报量</th>
									<th>巡查次数</th>
									<th>巡查路径</th>
									<th>社会测评</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第一支队</td>
									<td>98</td>
									<td>96</td>
									<td>93</td>
									<td>94</td>
									<td>97</td>
									<td>96</td>
									<td>99</td>
									<td>91</td>
									<td>96</td>
									<td>95</td>
									<td>96</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>崇明第一分队</td>
									<td>94</td>
									<td>92</td>
									<td>93</td>
									<td>95</td>
									<td>91</td>
									<td>90</td>
									<td>92</td>
									<td>96</td>
									<td>94</td>
									<td>97</td>
									<td>98</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第二支队</td>
									<td>96</td>
									<td>99</td>
									<td>95</td>
									<td>95</td>
									<td>96</td>
									<td>97</td>
									<td>92</td>
									<td>90</td>
									<td>99</td>
									<td>97</td>
									<td>93</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>崇明第一分队</td>
									<td>94</td>
									<td>92</td>
									<td>93</td>
									<td>95</td>
									<td>91</td>
									<td>90</td>
									<td>92</td>
									<td>96</td>
									<td>94</td>
									<td>97</td>
									<td>98</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第一支队</td>
									<td>98</td>
									<td>96</td>
									<td>93</td>
									<td>94</td>
									<td>97</td>
									<td>96</td>
									<td>99</td>
									<td>91</td>
									<td>96</td>
									<td>95</td>
									<td>96</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第一支队</td>
									<td>98</td>
									<td>96</td>
									<td>93</td>
									<td>94</td>
									<td>97</td>
									<td>96</td>
									<td>99</td>
									<td>91</td>
									<td>96</td>
									<td>95</td>
									<td>96</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第二支队</td>
									<td>96</td>
									<td>99</td>
									<td>95</td>
									<td>95</td>
									<td>96</td>
									<td>97</td>
									<td>92</td>
									<td>90</td>
									<td>99</td>
									<td>97</td>
									<td>93</td>
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
									<a href="javascript:;"></a>
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
						<div class="leftinfo1">
							<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
							<table width="90%" align="center" style="text-align:center;">
								<tr>
									<td>巡查单位：</td>
									<td>
										<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
											<option value="">-请选择-</option>
											<option value="第一支队">第一支队</option>
											<option value="第二支队">第二支队</option>
											<option value="崇明第一分队">崇明第一分队</option>
											<option value="奉贤第一分队">奉贤第一分队</option>
										</select>

									</td>
									<td>巡查月份：</td>
									<td>
										<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
											<option value="">-请选择-</option>
											<option value="1月">1月</option>
											<option value="2月">2月</option>
											<option value="3月">3月</option>
											<option value="4月">4月</option>
											<option value="5月">5月</option>
											<option value="6月">6月</option>
											<option value="7月">7月</option>
											<option value="8月">8月</option>
											<option value="9月">9月</option>
											<option value="10月">10月</option>
											<option value="11月">11月</option>
											<option value="12月">12月</option>
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
						<div style="float:right"><input name="" type="button" class="scbtn1" value="导出表" />
							<input name="" type="button" class="scbtn1" value="打印" /></div>
						<table class="tablelist">
							<thead>
								<tr>
									<th><input name="" type="checkbox" value="" checked="checked" /></th>
									<th>巡查单位<i class="sort"><img src="${contextPath}/images/seasInspection/px.gif" /></i></th>
									<th>管理机构</th>
									<th>计划管理</th>
									<th>精神文明</th>
									<th>制度管理</th>
									<th>档案管理</th>
									<th>日常管理</th>
									<th>安全管理</th>
									<th>信息上报量</th>
									<th>巡查次数</th>
									<th>巡查路径</th>
									<th>社会测评</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第一支队</td>
									<td>98</td>
									<td>96</td>
									<td>93</td>
									<td>94</td>
									<td>97</td>
									<td>96</td>
									<td>99</td>
									<td>91</td>
									<td>96</td>
									<td>95</td>
									<td>96</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>崇明第一分队</td>
									<td>94</td>
									<td>92</td>
									<td>93</td>
									<td>95</td>
									<td>91</td>
									<td>90</td>
									<td>92</td>
									<td>96</td>
									<td>94</td>
									<td>97</td>
									<td>98</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第二支队</td>
									<td>96</td>
									<td>99</td>
									<td>95</td>
									<td>95</td>
									<td>96</td>
									<td>97</td>
									<td>92</td>
									<td>90</td>
									<td>99</td>
									<td>97</td>
									<td>93</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>崇明第一分队</td>
									<td>94</td>
									<td>92</td>
									<td>93</td>
									<td>95</td>
									<td>91</td>
									<td>90</td>
									<td>92</td>
									<td>96</td>
									<td>94</td>
									<td>97</td>
									<td>98</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第一支队</td>
									<td>98</td>
									<td>96</td>
									<td>93</td>
									<td>94</td>
									<td>97</td>
									<td>96</td>
									<td>99</td>
									<td>91</td>
									<td>96</td>
									<td>95</td>
									<td>96</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第一支队</td>
									<td>98</td>
									<td>96</td>
									<td>93</td>
									<td>94</td>
									<td>97</td>
									<td>96</td>
									<td>99</td>
									<td>91</td>
									<td>96</td>
									<td>95</td>
									<td>96</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第二支队</td>
									<td>96</td>
									<td>99</td>
									<td>95</td>
									<td>95</td>
									<td>96</td>
									<td>97</td>
									<td>92</td>
									<td>90</td>
									<td>99</td>
									<td>97</td>
									<td>93</td>
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
						<div class="leftinfo1">
							<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
							<table width="90%" align="center" style="text-align:center;">
								<tr>
									<td>巡查单位：</td>
									<td>
										<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
											<option value="">-请选择-</option>
											<option value="第一支队">第一支队</option>
											<option value="第二支队">第二支队</option>
											<option value="崇明第一分队">崇明第一分队</option>
											<option value="奉贤第一分队">奉贤第一分队</option>
										</select>

									</td>
									<td>巡查季度：</td>
									<td>
										<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
											<option value="">-请选择-</option>
											<option value="第一季度">第一季度</option>
											<option value="第二季度">第二季度</option>
											<option value="第三季度">第三季度</option>
											<option value="第四季度">第四季度</option>
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
						<div style="float:right"><input name="" type="button" class="scbtn1" value="导出表" />
							<input name="" type="button" class="scbtn1" value="打印" /></div>
						<table class="tablelist">
							<thead>
								<tr>
									<th><input name="" type="checkbox" value="" checked="checked" /></th>
									<th>巡查单位<i class="sort"><img src="${contextPath}/images/seasInspection/px.gif" /></i></th>
									<th>管理机构</th>
									<th>计划管理</th>
									<th>精神文明</th>
									<th>制度管理</th>
									<th>档案管理</th>
									<th>日常管理</th>
									<th>安全管理</th>
									<th>信息上报量</th>
									<th>巡查次数</th>
									<th>巡查路径</th>
									<th>社会测评</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第一支队</td>
									<td>98</td>
									<td>96</td>
									<td>93</td>
									<td>94</td>
									<td>97</td>
									<td>96</td>
									<td>99</td>
									<td>91</td>
									<td>96</td>
									<td>95</td>
									<td>96</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>崇明第一分队</td>
									<td>94</td>
									<td>92</td>
									<td>93</td>
									<td>95</td>
									<td>91</td>
									<td>90</td>
									<td>92</td>
									<td>96</td>
									<td>94</td>
									<td>97</td>
									<td>98</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第二支队</td>
									<td>96</td>
									<td>99</td>
									<td>95</td>
									<td>95</td>
									<td>96</td>
									<td>97</td>
									<td>92</td>
									<td>90</td>
									<td>99</td>
									<td>97</td>
									<td>93</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>崇明第一分队</td>
									<td>94</td>
									<td>92</td>
									<td>93</td>
									<td>95</td>
									<td>91</td>
									<td>90</td>
									<td>92</td>
									<td>96</td>
									<td>94</td>
									<td>97</td>
									<td>98</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第一支队</td>
									<td>98</td>
									<td>96</td>
									<td>93</td>
									<td>94</td>
									<td>97</td>
									<td>96</td>
									<td>99</td>
									<td>91</td>
									<td>96</td>
									<td>95</td>
									<td>96</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第一支队</td>
									<td>98</td>
									<td>96</td>
									<td>93</td>
									<td>94</td>
									<td>97</td>
									<td>96</td>
									<td>99</td>
									<td>91</td>
									<td>96</td>
									<td>95</td>
									<td>96</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第二支队</td>
									<td>96</td>
									<td>99</td>
									<td>95</td>
									<td>95</td>
									<td>96</td>
									<td>97</td>
									<td>92</td>
									<td>90</td>
									<td>99</td>
									<td>97</td>
									<td>93</td>
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

					<div id="tab4" class="tabson">
						<div class="leftinfo1">
							<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
							<table width="90%" align="center" style="text-align:center;">
								<tr>
									<td>巡查单位：</td>
									<td>
										<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
											<option value="">-请选择-</option>
											<option value="第一支队">第一支队</option>
											<option value="第二支队">第二支队</option>
											<option value="崇明第一分队">崇明第一分队</option>
											<option value="奉贤第一分队">奉贤第一分队</option>
										</select>

									</td>
									<td>巡查年份：</td>
									<td>
										<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
											<option value="">-请选择-</option>
											<option value="2016年">2016年</option>
											<option value="2017年">2017年</option>
											<option value="2018年">2018年</option>
											<option value="2019年">2019年</option>
											<option value="2020年">2020年</option>
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
						<div style="float:right"><input name="" type="button" class="scbtn1" value="导出表" />
							<input name="" type="button" class="scbtn1" value="打印" /></div>
						<table class="tablelist">
							<thead>
								<tr>
									<th><input name="" type="checkbox" value="" checked="checked" /></th>
									<th>巡查单位<i class="sort"><img src="${contextPath}/images/seasInspection/px.gif" /></i></th>
									<th>管理机构</th>
									<th>计划管理</th>
									<th>精神文明</th>
									<th>制度管理</th>
									<th>档案管理</th>
									<th>日常管理</th>
									<th>安全管理</th>
									<th>信息上报量</th>
									<th>巡查次数</th>
									<th>巡查路径</th>
									<th>社会测评</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第一支队</td>
									<td>98</td>
									<td>96</td>
									<td>93</td>
									<td>94</td>
									<td>97</td>
									<td>96</td>
									<td>99</td>
									<td>91</td>
									<td>96</td>
									<td>95</td>
									<td>96</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>崇明第一分队</td>
									<td>94</td>
									<td>92</td>
									<td>93</td>
									<td>95</td>
									<td>91</td>
									<td>90</td>
									<td>92</td>
									<td>96</td>
									<td>94</td>
									<td>97</td>
									<td>98</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第二支队</td>
									<td>96</td>
									<td>99</td>
									<td>95</td>
									<td>95</td>
									<td>96</td>
									<td>97</td>
									<td>92</td>
									<td>90</td>
									<td>99</td>
									<td>97</td>
									<td>93</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>崇明第一分队</td>
									<td>94</td>
									<td>92</td>
									<td>93</td>
									<td>95</td>
									<td>91</td>
									<td>90</td>
									<td>92</td>
									<td>96</td>
									<td>94</td>
									<td>97</td>
									<td>98</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第一支队</td>
									<td>98</td>
									<td>96</td>
									<td>93</td>
									<td>94</td>
									<td>97</td>
									<td>96</td>
									<td>99</td>
									<td>91</td>
									<td>96</td>
									<td>95</td>
									<td>96</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第一支队</td>
									<td>98</td>
									<td>96</td>
									<td>93</td>
									<td>94</td>
									<td>97</td>
									<td>96</td>
									<td>99</td>
									<td>91</td>
									<td>96</td>
									<td>95</td>
									<td>96</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>第二支队</td>
									<td>96</td>
									<td>99</td>
									<td>95</td>
									<td>95</td>
									<td>96</td>
									<td>97</td>
									<td>92</td>
									<td>90</td>
									<td>99</td>
									<td>97</td>
									<td>93</td>
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