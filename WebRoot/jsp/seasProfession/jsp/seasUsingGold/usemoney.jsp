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
			<span><img src="${contextPath}/images/seasProfession/images/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海岸线管理</a>
				</li>
				<li>
					<a href="#">使用金征收管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/images/ico06.png" width="25" height="25" />条件查询</div>
				<table width="90%" align="center" style="text-align:center;">
					<tr>
						<td>海域名称：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>海域等别：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>

						<td>用海项目名称：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="长江口区域">长江口区域</option>
								<option value="杭州湾区域">杭州湾区域</option>
								<option value="外高桥港区">外高桥港区</option>
								<option value="崇头边滩保留区">崇头边滩保留区</option>
								<option value="上海滨江森林公园">上海滨江森林公园</option>
								<option value="东海大桥海上风电场区">东海大桥海上风电场区</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>用海类型：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>征收状态：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>

						<td>缴纳时间：</td>
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
		<!--<div style="margin-bottom:5px;">
			<input name="" type="button" class="scbtn1" value="标准价格展示" onclick="window.location='price_show.html'" style="width:90px;" />
		</div>-->
		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="" type="checkbox" value="" checked="checked" /></th>
					<th>海域名称<i class="sort"><img src="${contextPath}/images/seasProfession/images/px.gif" /></i></th>
					<th>海域等别</th>
					<th>用海项目名称</th>
					<th>用海类型</th>
					<th>使用金应缴纳(万元)</th>
					<th>使用金已缴纳(万元)</th>
					<th>使用金未缴纳(万元)</th>
					<th>使用金缴纳时间</th>
					<th>付款人</th>
					<th>收款人</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>外高桥港区</td>
					<td>1</td>
					<td>发生的附件</td>
					<td>海域</td>
					<td>16</td>
					<td>15</td>
					<td>1</td>
					<td>2016-10-21</td>
					<td>张三</td>
					<td>李四</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>机构户外</td>
					<td>2</td>
					<td>进入维护</td>
					<td>海滩</td>
					<td>10</td>
					<td>8</td>
					<td>2</td>
					<td>2016-9-2</td>
					<td>刘六</td>
					<td>李四</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>饿哦日语</td>
					<td>3</td>
					<td>疯狂的时光</td>
					<td>海岛</td>
					<td>15</td>
					<td>15</td>
					<td>0</td>
					<td>2016-7-21</td>
					<td>王红</td>
					<td>李四</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>花多少了符</td>
					<td>2</td>
					<td>多个方法</td>
					<td>海塘</td>
					<td>15</td>
					<td>13</td>
					<td>2</td>
					<td>2016-1-09</td>
					<td>大胖</td>
					<td>李四</td>
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