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
						<h1 style="font-size:16px;">项目信息</h1>
						<div id="main1" style="height:500px;width:955px;border:0px solid #ccc;margin:auto;">
							<table width="100%" class="table_1" align="left">
								<th>基本信息</th>
								<tr>
									<td width="13%">用海项目名称：</td>
									<td colspan="3"><input name="" type="text" value="" style="width:80%;" /></td>
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
											<option value="">-请选择-</option>
											<option value="万人民币">万人民币</option>
											<option value="千万人民币">千万人民币</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="13%">占用岸线：</td>
									<td><input name="" type="text" value="" style="width:180px;" />米</td>
									<td width="13%">新增案线：</td>
									<td><input name="" type="text" value="" style="width:180px;" />米</td>
								</tr>
								<tr>
									<td width="13%">海域等别：</td>
									<td>
										<select name="ssbm" id="ssbm" style="width:180px;">
											<option value="">-请选择-</option>
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
											<option value="">-请选择-</option>
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
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div id="tab2" class="tabson">
						<div id="main1" style="height:400px;width:955px;border:0px solid #ccc;margin:auto;">
						</div>
					</div>

					<!-- <table width="100%" align="center" style="text-align:left;" class="tableXQ">
    	   <tr>
    		<td style="background-color:#e8edef;">用海项目名称：</td>
    		<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;"/></td>
    		<td style="background-color:#e8edef;">项目类型：</td>
    		<td> <select name="ssbm" id="ssbm" style="width:180px;height:25px;">
      					<option value="">-请选择-</option>
      					<option value="非填海项目用海行政许可">非填海项目用海行政许可</option>
    					<option value="填海项目用海行政许可" >填海项目用海行政许可</option>
                    <option value="临时用海审批">临时用海审批</option>
    					<option value="无居民海岛使用项目审批" >无居民海岛使用项目审批</option>
                    </select>
        </td>
    	  </tr>
       <tr>
    		<td style="background-color:#e8edef;">用海面积：</td>
    		<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;"/></td>
    		<td style="background-color:#e8edef;">使用年限：</td>
    		<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;"/></td>
    	  </tr>
    	  <tr>
    		<td style="background-color:#e8edef;">申请人：</td>
    		<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;"/>
        </td>
    		<td style="background-color:#e8edef;">申请时间：</td>
    		<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;"/>
        </td>
    	  </tr> 
       <tr>
    		<td style="background-color:#e8edef;">文件上传：</td>
    		<td colspan="3"><form method="post" enctype='multipart/form-data'><input name="picture" type="file"  class="scinput" value="" style="width:180px;height:20px;"/></form></td>
    	  </tr>
    	  <tr>
    		<td colspan="4" style="text-align:center;">
    		<input type="button" class="scbtn1" name="btn" onclick="window.location='xmsq.jsp'" value="提交申请">
        <input name="fh" type="button" value="返回" class="scbtn1"  onclick="window.location='xmsq.jsp'" />
    		</td>
    	  </tr>
    	</table> -->
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