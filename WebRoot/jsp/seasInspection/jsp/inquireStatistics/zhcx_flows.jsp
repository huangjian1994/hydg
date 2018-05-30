<!DOCTYPE html PUBLIC"-/W3C/DTD XHTML 1.0 Transitional/EN"
     "http:/www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*,com.htcf.util.DateUtil" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html xmlns="http:/www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海域海岛巡查</title>

		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
	</head>

	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>海塘巡查管理</li>
				<li>巡查上报单详细信息</li>
			</ul>
		</div>
	<div class="formbody">
			<div id="usual1" class="usual">
				<div class="leftinfo1">
					<div class="itab">
						<ul>
							<li>
								<a href="#tab1" class="selected">立案信息</a>
							</li>
							<li>
								<a href="#tab2">派遣信息</a>
							</li>
							<li>
								<a href="#tab3">处理信息</a>
							</li>
							<li>
								<a href="#tab4">结案</a>
							</li>
							<!--
							<li><a href="#tab5">流程信息</a></li>
							<li><a href="#tab6">地图</a></li>
							-->
						</ul>
					</div>

					<div id="tab1" class="tabson">
						<table width="100%" class="tablelist2" align="center">
							<col width="15%"></col>
							<col width="35%"></col>
							<col width="15%"></col>
							<col width="35%"></col>
							<th colspan="4" style="text-align:center;">立案信息</th>
							<tr>
								<td style="background-color:#e8edef;">立案人员：</td>
								<td>${flowMap.LA.RY }</td>
								<td style="background-color:#e8edef;">立案时间：</td>
								<td>${flowMap.LA.LA_TIME }</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">案卷编号：</td>
								<td colspan="3">${flowMap.LA.AJBH }</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">立案备注：</td>
								<td colspan="3">${flowMap.LA.LABZ }</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">是否超期案件：</td>
								<td>${flowMap.LA.CQAJ }</td>
								<td style="background-color:#e8edef;">是否督办案件：</td>
								<td>${flowMap.LA.DBAJ }</td>
							</tr>
							
						</table>
						
					</div>
					<div id="tab2" class="tabson">
						<table width="100%" class="tablelist2" align="center">
							<col width="15%"></col>
							<col width="35%"></col>
							<col width="15%"></col>
							<col width="35%"></col>
							<th colspan="4" style="text-align:center;">派遣信息</th>
							<tr>
								<td style="background-color:#e8edef;">派遣人员：</td>
								<td>${flowMap.PQ.PQRY }</td>
								<td style="background-color:#e8edef;">派发时间：</td>
								<td>${flowMap.PQ.PQ_TIME }</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">处理部门：</td>
								<td>${flowMap.PQ.CLBM }</td>
								<td style="background-color:#e8edef;">处理期限：</td>
								<td>${flowMap.PQ.SJYQ }</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">派遣备注：</td>
								<td colspan="3">${flowMap.PQ.PQBZ }</td>
							</tr>
						</table>
					</div>
					<div id="tab3" class="tabson">
							<table width="100%" class="tablelist2" align="center">
								<col width="15%"></col>
								<col width="35%"></col>
								<col width="15%"></col>
								<col width="35%"></col>
								<th colspan="4" style="text-align:center;">处理信息</th>
								<tr>
									<td style="background-color:#e8edef;">处理人员：</td>
									<td>${flowMap.CL.CLRY }</td>
									<td style="background-color:#e8edef;">处理时间：</td>
									<td>${flowMap.CL.CL_TIME }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">处理意见：</td>
									<td colspan="3">${flowMap.CL.CLYJ }</td>
								</tr>
							</table>
					</div>
					<div id="tab4" class="tabson">
						<table width="100%" class="tablelist2" align="center">
							<col width="25%"></col>
							<col width="75%"></col>
							<th colspan="2" style="text-align:center;">结案</th>
							<tr>
								<td style="background-color:#e8edef;">核查时间：</td>
								<td>${flowMap.JA.JA_TIME }</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">核查人员：</td>
								<td>${flowMap.JA.HCRY }</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">核查意见：</td>
								<td>${flowMap.JA.HCYJ }</td>
							</tr>
			
							<tr>
								<td style="background-color:#e8edef;">附件：</td>
								<td>${flowMap.JA.FJ }</td>
							</tr>
						</table>
					</div>
					<!--
					<div id="tab5" class="tabson"></div>
					<div id="tab6" class="tabson"></div>
					-->
			
			</div>
			<div align="center">
				<table>
					<tr>
						<td colspan="4"  style="text-align:center; border:0px " >
							<input name="fh" type="button" value="返回" class="scbtn1" onclick="history.go(-1)" />
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</body>
	<script type="text/javascript">
		$(function() {
			$("#usual1 ul").idTabs();
		})
	</script>
</html>