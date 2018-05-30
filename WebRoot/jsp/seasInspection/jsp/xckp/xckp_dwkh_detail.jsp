<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	
	//返回
	function goBack(){
		document.myForm.action="<%=basePath%>/patorl/patorl_fetchXckpDwkh.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	
	</script>
	</head>

	<body>
<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li><a href="#">巡查考评管理</a></li>
				<li><a href="#">巡查单位考核管理</a></li>
			</ul>
		</div>
		
		<div class="formbody">
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td style="background-color:#f5f8fa;">巡查类型：</td>
					<td colspan="3">${hyxcXckpDwkh.xclx }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">行政区划：</td>
					<td>${hyxcXckpDwkh.xzqhmc }</td>
					<td style="background-color:#f5f8fa;">单位名称：</td>
					<td>${hyxcXckpDwkh.dwmc }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">年份：</td>
					<td>${hyxcXckpDwkh.year }</td>
					<td style="background-color:#f5f8fa;">月份：</td>
					<td>${hyxcXckpDwkh.month }</td>
				</tr>
				
				<tr>
					<td width="20%" style="background-color:#f5f8fa;">评分部门：</td>
					<td width="30%">${hyxcXckpDwkh.dfbm }</td>
					<td width="20%" style="background-color:#f5f8fa;">评分 人：</td>
					<td width="20%">${hyxcXckpDwkh.dfr }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">评分日期：</td>
					<td colspan="3">${hyxcXckpDwkh.dfrq }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">备注：</td>
					<td colspan="3">${hyxcXckpDwkh.bz }</td>
				</tr>
				<tr>
					<th colspan="4">考核评分</th>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">总分：</td>
					<td colspan="3">${hyxcXckpDwkh.zf }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">1.管理机构：</td>
					<td colspan="3">${hyxcXckpDwkh.gljg }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">2.计划管理：</td>
					<td colspan="3">${hyxcXckpDwkh.jhgl }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">3.精神文明：</td>
					<td colspan="3">${hyxcXckpDwkh.jswm }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">4.制度管理：</td>
					<td colspan="3">${hyxcXckpDwkh.zdgl }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">5.档案管理：</td>
					<td colspan="3">${hyxcXckpDwkh.dagl }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">6.日常管理：</td>
					<td colspan="3">${hyxcXckpDwkh.rcgl }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">7.安全管理：</td>
					<td colspan="3">${hyxcXckpDwkh.aqgl }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">8.信息上报量：</td>
					<td colspan="3">${hyxcXckpDwkh.xxsbl }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">9.巡查次数：</td>
					<td colspan="3">${hyxcXckpDwkh.xccs }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">10.巡查路径：</td>
					<td colspan="3">${hyxcXckpDwkh.xclj }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">11.社会测评：</td>
					<td colspan="3">${hyxcXckpDwkh.shcp }</td>
				</tr>
				
				
				<tr>
					<td style="background-color:#f5f8fa;">新增用户姓名：</td>
					<td colspan="3">${hyxcXckpDwkh.addusername }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">新增时间：</td>
					<td>${hyxcXckpDwkh.addtime }</td>
					<td  style="background-color:#f5f8fa;">最后修改时间：</td>
					<td>${hyxcXckpDwkh.lastupdatetime }</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input name="fh" type="button" value="返回" class="scbtn" onclick="goBack()" />
					</td>
				</tr>
			</table>
			</div>
		</div>

		<script type="text/javascript">

			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

</form>
	</body>

</html>