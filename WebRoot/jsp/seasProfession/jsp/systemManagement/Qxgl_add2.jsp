<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<title>权限管理</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />

		<link href="${contextPath}/css/style_tt.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/dtree.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/dtree.js"></script>

		<script language="javascript">
			$(function() {
				//导航切换
				$(".disklist li").click(function() {
					$(".disklist li.selected").removeClass("selected")
					$(this).addClass("selected");
				})
			})
		</script>
		<script type="text/javascript">
			function back() {
				open("QxglIndex.jsp", "rightFrame");

			}
		</script>
		<style>
			.list_tab {
				width: 100%;
				height: auto;
			}
		</style>

	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">系统管理</a>
				</li>
				<li>
					<a href="#">权限管理</a>
				</li>
				<li>
					<a href="#">权限新增</a>
				</li>
			</ul>
		</div>

		<table class="filetable3">

			<tbody>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right" width="10%">角色名：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%">管理员</td>

				</tr>

			</tbody>

		</table>
		<table list_tab>
			<tr>
				<td width="200px"></td>
				<td style="text-align:left;">
					<div class="dtree">
						<p>
							<a href="javascript: d.openAll();">展开</a> |
							<a href="javascript: d.closeAll();">关闭</a>
						</p>

						<script type="text/javascript">
							d = new dTree('d', '${contextPath}/images/seasProfession/');

							d.add(0, -1, '权限分配树', '', '', '${contextPath}/images/seasProfession/img/base.gif');
							d.add(1, 0, '车辆建档', 'Qxgl_add2.jsp', '', '', '${contextPath}/images/seasProfession/img/folder.gif');
							d.add(2, 1, '车辆查询', 'Qxgl_add2.jsp');
							d.add(3, 1, '车辆管理', 'Qxgl_add2.jsp');
							d.add(4, 0, '车辆轨迹', 'Qxgl_add2.jsp', '', '', '${contextPath}/images/seasProfession/img/folder.gif');
							d.add(5, 4, '进出沪轨迹', 'Qxgl_add2.jsp');
							d.add(6, 4, '违章轨迹', 'Qxgl_add2.jsp');
							d.add(7, 0, '车主档案', 'Qxgl_add2.jsp', '', '', '${contextPath}/images/seasProfession/img/folder.gif');
							d.add(8, 7, '车主档案查询', 'Qxgl_add2.jsp');
							d.add(9, 7, '车主档案管理', 'Qxgl_add2.jsp');

							d.add(10, 0, '车辆流入监控', 'Qxgl_add2.jsp', '', '', '${contextPath}/images/seasProfession/img/folder.gif');
							d.add(11, 10, '重点敏感区域车辆比对', 'Qxgl_add2.jsp');
							d.add(12, 10, '重点车辆监控比对', 'Qxgl_add2.jsp');

							d.add(13, 0, '核查核录', 'Qxgl_add2.jsp', '', '', '${contextPath}/images/seasProfession/img/folder.gif');
							d.add(14, 13, '核查核录查询', 'Qxgl_add2.jsp');
							d.add(15, 13, '核查核录管理', 'Qxgl_add2.jsp');

							d.add(16, 0, '查询研判', 'Qxgl_add2.jsp', '', '', '${contextPath}/images/seasProfession/img/folder.gif');
							d.add(17, 16, '套牌车分析', 'Qxgl_add2.jsp');
							d.add(18, 16, '车辆轨迹分析', 'Qxgl_add2.jsp');
							d.add(19, 16, '高危地区车辆分析', 'Qxgl_add2.jsp');
							d.add(20, 16, '同行车辆碰撞分析', 'Qxgl_add2.jsp');

							d.add(21, 0, '系统管理', 'Qxgl_add2.jsp', '', '', '${contextPath}/images/seasProfession/img/folder.gif');
							d.add(22, 21, '用户管理', 'Qxgl_add2.jsp');
							d.add(23, 21, '角色管理', 'Qxgl_add2.jsp');
							d.add(24, 21, '菜单管理', 'Qxgl_add2.jsp');
							d.add(25, 21, '日志管理', 'Qxgl_add2.jsp');
							d.add(26, 21, '配置管理', 'Qxgl_add2.jsp');
							document.write(d);
						</script>

					</div>
				</td>
			</tr>
			<tr height="100px">
				<td width="200px"></td>
				<td>
					<input type="submit" value="提交" onclick="" class="btn02" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="取消" onclick="back()" class="btn02" />
				</td>
			</tr>
		</table>

	</body>

</html>