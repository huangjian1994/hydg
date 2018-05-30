<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
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
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海域勘界管理</a>
				</li>
				<li>
					<a href="#">海籍历史资料管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div id="usual1" class="usual">
				<div class="leftinfo1">
					<div class="itab">
						<ul>
							<li>
								<a href="#tab1" class="selected">详细信息</a>
							</li>
						</ul>
					</div>
					<div id="tab1" class="tabson">
						<div class="div3">
							<p><span></span>基本信息</p>
							<table class="table_5" style="width:100%;">
								<tr>
									<td width="13%">用海项目名称：</td>
									<td colspan="3"><input name="" type="text" value="" style="width:79%;" /></td>
								</tr>
								<tr>
									<td width="13%">项目位置：</td>
									<td><input name="" type="text" value="" style="width:180px;" /></td>
									<td width="13%">证书数量：</td>
									<td><input name="" type="text" value="" style="width:180px;" /></td>
								</tr>
								<tr>
									<td width="13%">用海总面积：</td>
									<td><input name="" type="text" value="" style="width:180px;" />公顷</td>
									<td width="13%">投资额：</td>
									<td><input name="" type="text" value="" style="width:90px;" />
										<select name="ssbm" id="ssbm" style="width:85px;">
											<option value="万人民币">万人民币</option>
											<option value="千万人民币">千万人民币</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="13%">占用岸线：</td>
									<td><input name="" type="text" value="" style="width:180px;" />米</td>
									<td width="13%">新增岸线：</td>
									<td><input name="" type="text" value="" style="width:180px;" />米</td>
								</tr>
								<tr>
									<td width="13%">海域等别：</td>
									<td>
										<select name="ssbm" id="ssbm" style="width:180px;">
											<option value="一等">一等</option>
											<option value="二等">二等</option>
										</select>
									</td>
									<td width="13%">登记机关：</td>
									<td><input name="" type="text" value="" style="width:180px;" /></td>
								</tr>
								<tr>
									<td width="13%">受理日期：</td>
									<td>
										<select name="ssbm" id="ssbm" style="width:180px;">
											<option value="国家级">国家级</option>
										</select>
									</td>
									<td width="13%">受理日期：</td>
									<td><input name="" type="text" value="" style="width:180px;" /></td>
								</tr>
								<tr>
									<td width="13%">项目其他相关批准文件和材料：</td>
									<td colspan="3"><textarea cols="85"></textarea></td>
								</tr>
								<tr>
									<td width="13%">备注：</td>
									<td colspan="3"><textarea cols="85"></textarea></td>
								</tr>
							</table>
							<p><span></span>使用权人信息</p>
							<p><span></span>海域调查信息</p>
							<div style="width:30%;margin:15px auto;">
								<input name="" type="button" class="scbtn1" onclick="window.location='xmsq_adddetail.jsp'" value="保存" />
							</div>

						</div>
					</div>
				</div>
			</div>
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