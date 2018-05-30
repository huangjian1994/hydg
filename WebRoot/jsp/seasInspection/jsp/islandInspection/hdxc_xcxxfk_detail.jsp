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
			document.myForm.action="<%=basePath%>/patorlReport/patorlReport_fetchPatorlFk.do";
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
					<a href="#">执法信息反馈</a>
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
									<td style="background-color:#e8edef;">巡查计划ID：</td>
									<td>${hyxcHdxcFkjcxx.patrolid }</td>
									<td style="background-color:#e8edef;">巡查单位：</td>
									<td>${hyxcHdxcFkjcxx.fillingunit }</td>
								</tr>
								<tr>									
									<td style="background-color:#e8edef;">巡查起始日期：</td>
									<td>${hyxcHdxcFkjcxx.begintime }</td>
									<td style="background-color:#e8edef;">巡查结束日期：</td>
									<td>${hyxcHdxcFkjcxx.endtime }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">实际领队姓名：</td>
									<td>${hyxcHdxcFkjcxx.leadername }</td>
									<td style="background-color:#e8edef;">实际巡查人员姓名：</td>
									<td>${hyxcHdxcFkjcxx.peoplename }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">反馈日期：</td>
									<td>${hyxcHdxcFkjcxx.feedbacktime }</td>
									<td style="background-color:#e8edef;">反馈人姓名：</td>
									<td>${hyxcHdxcFkjcxx.feedbackname }</td>
								</tr>
								
								
								<tr>
									<td style="background-color:#e8edef;">数据来源名称：</td>
									<td>${hyxcHdxcFkjcxx.datasource }</td>
									<td style="background-color:#e8edef;">记录设备：</td>
									<td>${hyxcHdxcFkjcxx.recorddevice }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">巡查内容：</td>
									<td colspan="3">
									${hyxcHdxcFkjcxx.substance }
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">反馈内容分类：</td>
									<td>${hyxcHdxcFkjcxx.classify }</td>
									<td style="background-color:#e8edef;">反馈内容描述：</td>
									<td>${hyxcHdxcFkjcxx.represent }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">备注：</td>
									<td colspan="3">
									${hyxcHdxcFkjcxx.bz }
									</td>
								</tr>
								
								<tr>
									<td width="20%" style="background-color:#e8edef;">新增时间：</td>
									<td width="30%" >${hyxcHdxcFkjcxx.addtime }</td>
									<td width="20%" style="background-color:#e8edef;">最后修改时间：</td>
									<td width="30%" >${hyxcHdxcFkjcxx.updatetime }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">修改人姓名：</td>
									<td colspan="3">${hyxcHdxcFkjcxx.updateuser }</td>
								</tr>
								<tr>
									<th colspan="4">巡查照片</th>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">照片：</td>
									<td colspan="3">
									<c:forEach items="${ xcfkfjList }" var="r" varStatus="j">
									<a href="<%=basePath%>/patorlReport/patorlReport_fetchXcfkZpDetail.do?fkfjID=${r.id}" target="_blank">
										<img src="<%=basePath%>/patorlReport/patorlReport_fetchXcfkZp.do?fkfjID=${r.id}" width="138" height="164"/>
									</a>
									&nbsp;&nbsp;
									</c:forEach>
									
									</td>
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