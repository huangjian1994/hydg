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
		<script>
		function goBack(){
			document.myForm.action="<%=basePath%>/patorlReport/patorlReport_fetchPatorlReport.do";
			document.myForm.target="_self";
			document.myForm.submit();
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
					<a href="#">巡查问题上报</a>
				</li>
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
							<table width="100%" align="center" style="text-align:left;" class="tableXQ" >
								<tr>
									<td style="background-color:#e8edef;">上报人员姓名：</td>
									<td>${hyxcHdxcFxwt.sbrxm }</td>
									<td style="background-color:#e8edef;">上报人员单位名称：</td>
									<td>${hyxcHdxcFxwt.sbrdwmc }</td>
								</tr>
								<tr>									
									<td style="background-color:#e8edef;">上报人员联系电话：</td>
									<td>${hyxcHdxcFxwt.sbrlxdh }</td>
									<td style="background-color:#e8edef;">上报人员移动电话：</td>
									<td>${hyxcHdxcFxwt.sbryddh }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">上报日期：</td>
									<td>${hyxcHdxcFxwt.sbsj }</td>
									<td style="background-color:#e8edef;">发生地点所属区县：</td>
									<td>${hyxcHdxcFxwt.ssqx }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">发生地点：</td>
									<td colspan="3">${hyxcHdxcFxwt.fsdd }</td>
								</tr>
								
								<tr>
									<td style="background-color:#e8edef;">北纬：</td>
									<td>${hyxcHdxcFxwt.bw }</td>
									<td style="background-color:#e8edef;">东经：</td>
									<td>${hyxcHdxcFxwt.dj }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">问题类别：</td>
									<td colspan="3">${hyxcHdxcFxwt.wtlb }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">问题描述：</td>
									<td colspan="3">${hyxcHdxcFxwt.wtms }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">现场照片：</td>
									<td colspan="3">
									<a href="<%=basePath%>/patorlReport/patorlReport_fetchReportZpDetail.do?prID=${hyxcHdxcFxwt.id}" target="_blank">
										<img src="<%=basePath%>/patorlReport/patorlReport_fetchReportZp.do?prID=${hyxcHdxcFxwt.id}" width="138" height="164"/>
									</a>
									</td>
								</tr>
								<tr>
									<td width="20%" style="background-color:#e8edef;">新增时间：</td>
									<td width="30%" >${hyxcHdxcFxwt.addtime }</td>
									<td width="20%" style="background-color:#e8edef;">最后修改时间：</td>
									<td width="30%" >${hyxcHdxcFxwt.lastupdatetime }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">修改人姓名：</td>
									<td colspan="3">${hyxcHdxcFxwt.xgrxm }</td>
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