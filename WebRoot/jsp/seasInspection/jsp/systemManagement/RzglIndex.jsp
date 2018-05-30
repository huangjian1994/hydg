<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<title>日志管理</title>
		<link href="${contextPath}/css/style_tt.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/WdatePicker.js"></script>

		<script language="javascript">
			$(function() {
				//导航切换
				$(".disklist li").click(function() {
					$(".disklist li.selected").removeClass("selected")
					$(this).addClass("selected");
				})
			})
		</script>
		<script language="javascript">
			function add_yonghu() {
				open("Yhgl_add.jsp", "rightFrame");
			}
		</script>
	</head>

	<body>

		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">系统管理</a>
				</li>
				<li>
					<a href="#">日志管理</a>
				</li>
			</ul>
		</div>

		<table class="filetable3">

			<tbody>

				<tr>
					<td width="18%"></td>
					<td style="text-align:right" width="10%">操作用户：</td>
					<td style="text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
					<td style="text-align:right" width="10%">操作类型：</td>
					<td style="text-align:left" width="20%">
						<select>
							<option id="s0" value="请选择">-请选择-</option>
							<option id="s1" value="登录">登录</option>
							<option id="s1" value="查询">查询</option>
							<option id="s2" value="增加">增加</option>
							<option id="s3" value="删除">删除</option>
							<option id="s4" value="修改">修改</option>
						</select>
					</td>
					<td width="25%"></td>
				</tr>

				<tr>
					<td></td>
					<td style="text-align:right">操作模块：</td>
					<td style="text-align:left"><input type="text" class="scinput02" style="width:100px" /></td>
					<td style="text-align:right">操作时间：</td>
					<td style="text-align:left"><input type="text" value="" class="scinput02" style="width:100px" onclick="WdatePicker()" />
					</td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td colspan="4" style="text-align:center; height:30px;"><input type="button" value="查询" class="btn02" style="width:60px;height:20px;" /></td>
					<td></td>
				</tr>

			</tbody>

		</table>

		<br/>

		<table class="tablelist">
			<thead>
				<tr>
					<th width="5%">序号<i class="sort"><img src="${contextPath}/images/seasInspection/px.gif" /></i></th>
					<th width="25%">操作模块</th>
					<th width="10%">操作用户</th>
					<th width="15%">操作时间</th>
					<th width="10%">操作IP</th>
					<th width="10%">操作类型</th>
					<th width="10%">操作状态</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>1</td>
					<td>
						<a href="Qxgl_add2.jsp" class="tablelink">工作概况-查看</a>
					</td>
					<td>张三</td>
					<td>2015-02-10 15:29:06</td>
					<td>10.15.71.191</td>
					<td></td>
					<td>成功</td>
				</tr>

				<tr>
					<td>2</td>
					<td>
						<a href="Qxgl_add2.jsp" class="tablelink">系统管理-修改用户信息</a>
					</td>
					<td>赵柳</td>
					<td>2015-02-08 09:29:06</td>
					<td>10.15.60.163</td>
					<td>修改</td>
					<td>成功</td>
				</tr>

				<tr>
					<td>3</td>
					<td>
						<a href="Qxgl_add2.jsp" class="tablelink">人员查询-查询人员信息</a>
					</td>
					<td>李四</td>
					<td>2015-02-10 15:28:36</td>
					<td>10.15.49.12</td>
					<td>查询</td>
					<td>成功</td>
				</tr>

				<tr>
					<td>4</td>
					<td>
						<a href="Qxgl_add2.jsp" class="tablelink">数据导入</a>
					</td>
					<td>王五</td>
					<td>2015-02-10 15:28:28</td>
					<td>10.15.49.32</td>
					<td>增加</td>
					<td>成功</td>
				</tr>

			</tbody>
		</table>
		<table class="tablelist">
			<thead>
				<tr>
					<th style="text-align:center">执行的SQL </th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>
						SELECT GMSFHM, NAME, SEX, MZ, HJDZ,xzdxz,rq,cjsj,rystate,rkbs FROM SJCX_HCBD_JBXX where 1=1
					</td>

				</tr>

			</tbody>
		</table>
		<div class="pagin">
			<div class="message">共<i class="blue">4</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
			<ul class="paginList">
				<li class="paginItem">
					<a href="javascript:;"><span class="pagepre"></span></a>
				</li>
				<li class="paginItem current">
					<a href="javascript:;">1</a>
				</li>
				<li class="paginItem" onclick="">
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
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

	</body>

</html>