<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>巡查计划管理</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>		
	</head>
	
	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海域海岛巡查</a></li>
				<li><a href="#">任务审核</a></li>
			</ul>
		</div>
		<div align="center">
			<div class="mainbox">
				<div class="leftinfo1">
					<div class="listtitle3">
						<img src="${contextPath}/images/seasInspection/i02.png" width="25" height="25" />详情
					</div>
					<div id="usual1" class="usual">
						<div id="tab1" class="tabson">
							<table width="100%" align="center" style="text-align:left;" class="tableXQ" cellSpacing='12' cellPadding='12'>
								<tr>
									<td style="width: 20%; background-color:#e8edef;">计划任务名称：</td>
									<td style="width: 30%">${xcjhEntity.patrolname }</td>
									<td style="background-color:#e8edef;">填表单位：</td>
									<td>${xcjhEntity.fillingdw }</td>
								</tr>
								<tr>									
									<td style="background-color:#e8edef;">起始日期：</td>
									<td>${xcjhEntity.begintime }</td>
									<td style="background-color:#e8edef;">结束日期：</td>
									<td>${xcjhEntity.endtime }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">领队姓名：</td>
									<td>${xcjhEntity.leadername }</td>
									<td style="background-color:#e8edef;">巡查方式：</td>
									<td>${xcjhEntity.inspectionmode }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">派出人员姓名：</td>
									<td colspan="3">${xcjhEntity.peoplename }</td>

								</tr>
								<tr>
									<td style="background-color:#e8edef;">巡查内容：</td>
									<td colspan="3">${xcjhEntity.substance }</td>
								</tr>
								
								<tr>
									<td style="background-color:#e8edef;">东边坐标：</td>
									<td>${xcjhEntity.east }</td>
									<td style="background-color:#e8edef;">南边坐标：</td>
									<td>${xcjhEntity.south }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">西边坐标：</td>
									<td>${xcjhEntity.west }</td>
									<td style="background-color:#e8edef;">北边坐标：</td>
									<td>${xcjhEntity.north }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">巡查范围（地点）描述：</td>
									<td colspan="3">${xcjhEntity.locationdesrcription }</td>
								</tr>

								<tr>
								<td style="background-color:#e8edef;">制定人姓名：</td>
								<td>${xcjhEntity.drafepeoplename }</td>
								<td style="background-color:#e8edef;">制定日期：</td>
								<td>${xcjhEntity.drafetdate }</td>
								</tr>

								<tr>
									<td style="background-color:#e8edef;">任务计划状态：</td>
									<td colspan="3">${xcjhEntity.planstatus }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">审批意见：</td>
									<td colspan="3">${xcjhEntity.approvalopinion }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">批准备注：</td>
									<td colspan="3">${xcjhEntity.approvebz }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">批准人姓名：</td>
									<td>${xcjhEntity.approveuser }</td>
									<td style="background-color:#e8edef;">批准日期：</td>
									<td>${xcjhEntity.approvetime }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">修改人姓名：</td>
									<td>${xcjhEntity.updateuser }</td>
									<td style="background-color:#e8edef;">修改日期：</td>
									<td>${xcjhEntity.updatetime }</td>
								</tr>



								<tr>
									<td colspan="4" style="text-align:center;">
										<input name="fh" type="button" value="返回" class="scbtn1" onclick="history.go(-1)" />
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</body>
</html>