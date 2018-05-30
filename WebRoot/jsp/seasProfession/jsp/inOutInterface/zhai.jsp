<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">市不动产登记平台接口</a>
				</li>
				<li>
					<a href="#">宗海</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="90%" align="center" style="text-align:center;">
					<tr>
						<td>宗海代码：</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>海岛名称：</td>
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
						<td>项目编号</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>
						<td>批文编号</td>
						<td><input name="" type="text" class="dfinput1" value="" style="width:180px;" /></td>

						<td>宗海特征码</td>
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
		<div class="tools">
			<ul class="toolbar">
				<li>
					<a href="sbdcpt_add.jsp"><span><img src="${contextPath}/images/seasProfession/t01.png"/></span>新增</a>
				</li>
			</ul>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="" type="checkbox" value="" checked="checked" /></th>
					<th>宗海代码<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif"/></i></th>
					<th>项目编号</th>
					<th>宗海特征码</th>
					<th>海岛名称</th>
					<th>用海项目名称</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>H1000001231</td>
					<td>321299888823</td>
					<td>232322</td>
					<td>外高桥港区</td>
					<td>长江口区域</td>
					<td>未推送</td>
					<td>
						<a href="#" class="tablelink ts">推送</a>
						<a href="sbdcpt_detail.jsp" class="tablelink">查看</a>
						<a href="sbdcpt_change.jsp" class="tablelink"> 修改</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>H1000000232</td>
					<td>321233321233</td>
					<td>333323</td>
					<td>东海大桥海上风电场区</td>
					<td>杭州湾区域</td>
					<td>已推送成果信息</td>
					<td>
						<a href="#" class="tablelink ts">推送</a>
						<a href="sbdcpt_detail.jsp" class="tablelink">查看</a>
						<a href="sbdcpt_change.jsp" class="tablelink"> 修改</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>H1000009876</td>
					<td>387495876473</td>
					<td>876546</td>
					<td>上海滨江森林公园</td>
					<td>外高桥港区</td>
					<td>已推送海域使用金</td>
					<td>
						<a href="#" class="tablelink ts">推送</a>
						<a href="sbdcpt_detail.jsp" class="tablelink">查看</a>
						<a href="sbdcpt_change.jsp" class="tablelink"> 修改</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>
				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>H1000003874</td>
					<td>329876483764</td>
					<td>389874</td>
					<td>东海大桥海上风电场区</td>
					<td>杭州湾区域</td>
					<td>已推送配号</td>
					<td>
						<a href="#" class="tablelink ts">推送</a>
						<a href="sbdcpt_detail.jsp" class="tablelink">查看</a>
						<a href="sbdcpt_change.jsp" class="tablelink"> 修改</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>
				</tr>

				<tr>
					<td><input name="" type="checkbox" value="" /></td>
					<td>H1000008763</td>
					<td>312987674367</td>
					<td>387465</td>
					<td>上海滨江森林公园</td>
					<td>长江口区域</td>
					<td>已接受反馈</td>
					<td>
						<a href="#" class="tablelink ts">推送</a>
						<a href="sbdcpt_detaill.jsp" class="tablelink">查看</a>
						<a href="sbdcpt_change.jsp" class="tablelink"> 修改</a>
						<a href="#" class="tablelink"> 删除</a>
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
		$(function() {
			for(var i = 0; i < $(".ts").length; i++) {
				(function(indexI) {
					$(".ts").eq(indexI).on("click", function() {
						alert("推送成功");
					})
				})(i)
			}
		})
	</script>

	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</html>