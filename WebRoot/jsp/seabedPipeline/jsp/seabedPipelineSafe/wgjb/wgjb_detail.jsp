<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海底管线安全</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

	</head>
	<script>
		function goBack(){
			document.myForm.action="<%=basePath%>/submarineline/submarineline_fetchWgjbList.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}
	
	</script>

	<body>
	<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seabedPipeline/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海底管线安全</a>
				</li>
				<li>
					<a href="#">违规举报管理</a>
				</li>
			</ul>
		</div>
		
		<div class="formbody" >
			<div id="usual1" class="usual">
				<div class="leftinfo1">
							<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
								<table style="width:98%;" class="tablelist2" align="center">
								<tr>
									<td width="20%" style="background-color:#f5f8fa;">船舶mmsi：</td>
									<td width="30%">${hdgxAqglWgjb.mmsi }</td>
									<td width="20%" style="background-color:#f5f8fa;">违规船名：</td>
									<td width="30%">${hdgxAqglWgjb.wgcm }</td>
								</tr>
								<tr>
									<td style="background-color:#f5f8fa;">船舶类别：</td>
									<td>${hdgxAqglWgjb.cblx }</td>
									<td style="background-color:#f5f8fa;">船舶负责人：</td>
									<td>${hdgxAqglWgjb.fzr }</td>
								</tr>
								<tr>
									<td style="background-color:#f5f8fa;">违规内容：</td>
									<td colspan="3">${hdgxAqglWgjb.wgnr }</td>
								</tr>
								<tr>
									<td style="background-color:#f5f8fa;">违规地点：</td>
									<td colspan="3">${hdgxAqglWgjb.wgdd }</td>
								</tr>
								<tr>
									<td style="background-color:#f5f8fa;">违规日期：</td>
									<td>${hdgxAqglWgjb.wgrq }</td>
									<td style="background-color:#f5f8fa;">巡查人：</td>
									<td>${hdgxAqglWgjb.jbr }</td>
								</tr>
								<tr>
									<td style="background-color:#f5f8fa;">后续处理情况：</td>
									<td colspan="3">${hdgxAqglWgjb.hxclqk }</td>
								</tr>
								<tr>
									<td style="background-color:#f5f8fa;">备注：</td>
									<td colspan="3">${hdgxAqglWgjb.bz }</td>
								</tr>
								<tr>
									<td style="background-color:#f5f8fa;">新增用户姓名：</td>
									<td>${hdgxAqglWgjb.addusername }</td>
									<td style="background-color:#f5f8fa;">新增时间：</td>
									<td>${hdgxAqglWgjb.addtime }</td>
								</tr>
								<tr>
									<td style="background-color:#f5f8fa;">修改用户姓名：</td>
									<td >${hdgxAqglWgjb.updateusername }</td>
									<td style="background-color:#f5f8fa;">最后修改时间：</td>
									<td >${hdgxAqglWgjb.lastupdatetime }</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center;">
										<input name="fh" type="button" value="返回" class="scbtn" onclick="goBack()" />
									</td>
								</tr>
							</table>
				</div>
			</div>
		</div>
	</form>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</body>

</html>