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
					<a href="#">海洋功能区划管理</a>
				</li>
				<li>
					<a href="#">信息管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div id="usual1" class="usual">
				<div class="leftinfo1">
					<div class="itab">
						<ul>
							<li>
								<a href="#tab1" class="selected">受理信息</a>
							</li>
							<li>
								<a href="#tab2">初审报告</a>
							</li>
						</ul>
					</div>
					<div id="tab1" class="tabson">
						<div id="main1" style="height:800px;width:955px;border:0px solid #ccc;margin:auto;">
							<table width="100%" class="table_2">
								<th>宗海列表</th>
								<tr>
									<td width="25%">宗海信息</td>
									<td width="25%">用海项目信息</td>
									<td width="25%">申请用海年限（年）</td>
									<td width="25%">申请人</td>
								</tr>
								<tr>
									<td width="25%"></td>
									<td width="25%"></td>
									<td width="25%"></td>
									<td width="25%"></td>
								</tr>
								<tr>
									<td colspan="4">
										<input type="button" class="scbtn1" name="btn" onclick="window.location='xzzh.jsp'" value="新增宗海">
										<input type="button" class="scbtn1" name="btn" onclick="window.location='xmsq_adddetail.jsp'" value="查看项目"></td>
								</tr>

							</table>
							<div id="usual1" class="usual">
								<div class="leftinfo1">
									<div class="itab">
										<ul>
											<li>
												<a href="#tab3" class="selected">项目信息</a>
											</li>
											<li>
												<a href="#tab4">项目附件</a>
											</li>
										</ul>
									</div>
									<div id="tab3" class="tabson">
										<div id="main1" style="height:500px;width:955px;border:0px solid #ccc;margin:auto;">
											<table width="100%" class="table_1" align="left">
												<th>基本信息</th>
												<tr>
													<td width="13%">用海项目名称：</td>
													<td colspan="3"><input name="" type="text" value="扩建工程" style="width:80%;" /></td>
												</tr>
												<tr>
													<td width="13%">项目位置：</td>
													<td><input name="" type="text" value="浙江省" style="width:180px;" /></td>
													<td width="13%">证书数量：</td>
													<td><input name="" type="text" value="1" style="width:180px;" /></td>
												</tr>
												<tr>
													<td width="13%">用海总面积：</td>
													<td><input name="" type="text" value="222" style="width:180px;" />公顷</td>
													<td width="13%">投资额：</td>
													<td><input name="" type="text" value="111" style="width:90px;" />
														<select name="ssbm" id="ssbm" style="width:85px;">
															<option value="万人民币">万人民币</option>
															<option value="千万人民币">千万人民币</option>
														</select>
													</td>
												</tr>
												<tr>
													<td width="13%">占用岸线：</td>
													<td><input name="" type="text" value="11" style="width:180px;" />米</td>
													<td width="13%">新增案线：</td>
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
													<td width="13%">受理机关级别：</td>
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
													<td colspan="3"><textarea cols="80"></textarea></td>
												</tr>
												<tr>
													<td width="13%">备注：</td>
													<td colspan="3"><textarea cols="80"></textarea></td>
												</tr>
												<tr>
													<th>申请人信息</th>
													<td colspan="3"></td>
												</tr>
												<tr>
													<td colspan="4"></td>
												</tr>
												<tr>
													<th>海籍调查信息</th>
													<td colspan="3"></td>
												</tr>
												<tr>
													<td colspan="4"></td>
												</tr>
												<tr>
													<td colspan="4" style="text-align:center;">
														<input name="" type="button" class="scbtn1" onclick="window.location='xmsq_adddetail.jsp'" value="保存" />
														<input name="" type="button" class="scbtn1" onclick="window.location='xmsq_adddetail.jsp'" value="删除" />
													</td>
												</tr>
											</table>
										</div>

									</div>
									<div id="tab4" class="tabson">
										<div class="div3">
											<p><span></span>附件列表</p>
											<table class="table_4" width="100%">
												<tr>
													<th><input name="" type="checkbox" value="" /></th>
													<th>附件名</th>
													<th>附件类型</th>
													<th>文件类型</th>
													<th>文件大小（KB）</th>
													<th>上传人</th>
													<th>上传时间</th>
													<th>查看</th>
												</tr>
												<tr>
													<th><input name="" type="checkbox" value="" /></th>
													<td>海域使用论证报告.doc</td>
													<td>海域使用论证报告</td>
													<td>doc</td>
													<td>64.5</td>
													<td>宋德瑞</td>
													<td>2017-5-22</td>
													<td>查看</td>
												</tr>
											</table>
											<div class="left_button"><input name="" type="button" class="scbtn1" onclick="window.location=''" value="删除" /></div>
										</div>
										<div class="div3">
											<p><span></span>上传附件</p>

											<table class="table_3" width="35%">
												<tr>
													<td width="40%">附件名称:</td>
													<td width="60%"><input name="" type="text" value="" style="width:180px;" /></td>
												</tr>
												<tr>
													<td>附件类型:</td>
													<td>
														<select name="ssbm" id="ssbm" style="width:180px;">
															<option value="">--请选择--</option>
															<option value="海域论证报告">海域论证报告</option>
															<option value="海域论证报告">海域论证报告</option>
														</select>
													</td>
												</tr>
												<tr>
													<td>上传附件:</td>
													<td>
														<input name="" type="file" value="11" style="width:180px;" />
													</td>
												</tr>
												<tr>
													<td>备注:</td>
													<td>
														<textarea cols="20" rows="5"></textarea>
													</td>
												</tr>
												<tr>
													<td><input name="" type="button" class="scbtn2" onclick="window.location=''" value="保存" /></td>
													<td><input name="" type="button" class="scbtn2" onclick="window.location=''" value="重置" /></td>
												</tr>
											</table>

										</div>

									</div>
								</div>
							</div>
						</div>
						<div id="tab2" class="tabson">
							<div id="main1" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
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