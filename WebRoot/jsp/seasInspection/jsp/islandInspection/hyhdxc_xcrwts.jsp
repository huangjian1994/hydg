<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海域海岛巡查</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
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
		</script>
	</head>
	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海域海岛巡查</a>
				</li>
				<li>
					<a href="#">巡查任务审核</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
				<table width="90%" align="center" style="text-align:center;">
					<tr>
						<td>检查方式：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="定期" selected="selected">定期</option>
								<option value="不定期">不定期</option>
							</select>
						</td>
						<td>巡查范围：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="崇明县" selected="selected">崇明县</option>
								<option value="宝山区">宝山区</option>
								<option value="浦东新区">浦东新区</option>
								<option value="奉贤区">奉贤区</option>
								<option value="金山区">金山区</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>问题分类：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="巡视" selected="selected">巡视</option>
								<option value="巡航">巡航</option>
								<option value="监察">监察</option>
								<option value="检查">检查</option>
							</select>
						</td>
						<td>审核状态：</td>
						<td>
							<select name="ssbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="待审核" selected="selected">待审核</option>
								<option value="审核通过">审核通过</option>
								<option value="审核不通过">审核不通过</option>
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

			<br />
			<div class="tools">
				<ul class="toolbar">
					<li>
						<a href="#"><span><img src="${contextPath}/images/seasInspection/t02.png" /></span>批量审核</a>
					</li>
				</ul>
			</div>
			<table class="tablelist">
				<thead>
					<tr>
						<th><input type="checkbox" id="cb" onclick="checkAll()" /></th>
						<th>序号</th>
						<th>问题分类</th>
						<th>检测海岛</th>
						<th>下派领队</th>
						<th>人员个数</th>
						<th>检查方式</th>
						<th>巡查范围</th>
						<th>审核状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" name="chk" id="chk" value="" /></td>
						<td>1</td>
						<td>巡视</td>
						<td>鸡骨礁</td>
						<td>黄翔</td>
						<td>3</td>
						<td>定期</td>
						<td>崇明县</td>
						<td>待审核</td>
						<td>
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_sh.jsp" class="tablelink">审核</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_detail.jsp" class="tablelink">详情</a>
						</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td><input type="checkbox" name="chk" id="chk" value="" /></td>
						<td>2</td>
						<td>巡航</td>
						<td>荷包岛</td>
						<td>杜佳明</td>
						<td>5</td>
						<td>不定期</td>
						<td>宝山区</td>
						<td>审核不通过</td>
						<td>
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_sh.jsp" class="tablelink">审核</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_detail.jsp" class="tablelink">详情</a>
						</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td><input type="checkbox" name="chk" id="chk" value="" /></td>
						<td>3</td>
						<td>监察</td>
						<td>长滩岛</td>
						<td>陈建国</td>
						<td>4</td>
						<td>定期</td>
						<td>奉贤区</td>
						<td>审核通过</td>
						<td>
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_sh.jsp" class="tablelink">审核</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_detail.jsp" class="tablelink">详情</a>
						</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td><input type="checkbox" name="chk" id="chk" value="" /></td>
						<td>4</td>
						<td>检查</td>
						<td>暗礁</td>
						<td>杨天帆</td>
						<td>3</td>
						<td>定期</td>
						<td>崇明县</td>
						<td>待审核</td>
						<td>
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_sh.jsp" class="tablelink">审核</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_detail.jsp" class="tablelink">详情</a>
						</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td><input type="checkbox" name="chk" id="chk" value="" /></td>
						<td>5</td>
						<td>巡视</td>
						<td>海洋岛</td>
						<td>泱黎</td>
						<td>3</td>
						<td>定期</td>
						<td>金山区</td>
						<td>待审核</td>
						<td>
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_sh.jsp" class="tablelink">审核</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_detail.jsp" class="tablelink">详情</a>
						</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td><input type="checkbox" name="chk" id="chk" value="" /></td>
						<td>6</td>
						<td>监察</td>
						<td>鸡骨礁</td>
						<td>徐天翔</td>
						<td>3</td>
						<td>定期</td>
						<td>金山区</td>
						<td>待审核</td>
						<td>
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_sh.jsp" class="tablelink">审核</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_detail.jsp" class="tablelink">详情</a>
						</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td><input type="checkbox" name="chk" id="chk" value="" /></td>
						<td>7</td>
						<td>监察</td>
						<td>暗礁</td>
						<td>周宇浩</td>
						<td>3</td>
						<td>定期</td>
						<td>浦东新区</td>
						<td>审核不通过</td>
						<td>
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_sh.jsp" class="tablelink">审核</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_detail.jsp" class="tablelink">详情</a>
						</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td><input type="checkbox" name="chk" id="chk" value="" /></td>
						<td>8</td>
						<td>巡航</td>
						<td>海洋岛</td>
						<td>黄天仁</td>
						<td>3</td>
						<td>不定期</td>
						<td>奉贤区</td>
						<td>审核通过</td>
						<td>
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_sh.jsp" class="tablelink">审核</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_detail.jsp" class="tablelink">详情</a>
						</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td><input type="checkbox" name="chk" id="chk" value="" /></td>
						<td>9</td>
						<td>监察</td>
						<td>鸡骨礁</td>
						<td>周秦天</td>
						<td>3</td>
						<td>定期</td>
						<td>宝山区</td>
						<td>审核通过</td>
						<td>
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_sh.jsp" class="tablelink">审核</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_detail.jsp" class="tablelink">详情</a>
						</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td><input type="checkbox" name="chk" id="chk" value="" /></td>
						<td>10</td>
						<td>巡视</td>
						<td>暗礁</td>
						<td>王天颖</td>
						<td>3</td>
						<td>定期</td>
						<td>崇明县</td>
						<td>待审核</td>
						<td>
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_sh.jsp" class="tablelink">审核</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcrwtj_detail.jsp" class="tablelink">详情</a>
						</td>
					</tr>
				</tbody>
			</table>			
		</div>
	</body>
</html>