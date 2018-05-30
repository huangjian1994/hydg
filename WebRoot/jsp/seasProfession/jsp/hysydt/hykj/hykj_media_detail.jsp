<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
//返回
function goBack(){
	document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_fetchDmtxx.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//下载附件
function downloadMediafj(fj){
	if(confirm("确定下载该附件吗？")){
		document.getElementById("fileName").value = fj;
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_downLoadMediafj.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
}

function goVideoOpen(dmtID){
	document.getElementById("dmtID").value = dmtID;
	document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_fetchVideoDetail.do";
	document.myForm.target="_blank";
	document.myForm.submit();
}
</script>
	</head>
	<body>
<form name="myForm" method="post" >
<input name="dmtID" id="dmtID" value="" type="hidden" />

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li><a href="#">海域使用动态管理</a></li>
				<li><a href="#">海域勘界管理</a></li>
				<li><a href="#">多媒体信息管理</a></li>
			</ul>
		</div>
		<input name="fileName" id="fileName" value="" type="hidden" />
		<div class="formbody">
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#f5f8fa;">文件名称：</td>
					<td colspan="3">${hysyywHygnqhHykjDmtxx.wjm }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">文件说明：</td>
					<td colspan="3">${hysyywHygnqhHykjDmtxx.wjsm }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">文件类型：</td>
					<td colspan="3">${hysyywHygnqhHykjDmtxx.wjlx }</td>
				</tr>
				<tr>
					<td width="18%" style="background-color:#f5f8fa;">上传人：</td>
					<td width="25%">${hysyywHygnqhHykjDmtxx.scr }</td>
					<td width="18%" style="background-color:#f5f8fa;">上传时间：</td>
					<td width="25%">${hysyywHygnqhHykjDmtxx.scsj }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">附件：</td>
					<td>
					${hysyywHygnqhHykjDmtxx.fj }
					</td>
					<td colspan="2">
					<c:if test="${hysyywHygnqhHykjDmtxx.wjlx =='照片' }">
						<a href="<%=basePath%>/seaDemarcation/seaDemarcation_fetchDmtxxZpDetail.do?dmtID=${hysyywHygnqhHykjDmtxx.id}" target="_blank">
						<img src="<%=basePath%>/seaDemarcation/seaDemarcation_fetchDmtxxZp.do?dmtID=${hysyywHygnqhHykjDmtxx.id}" width="138" height="164"/>
						</a>
					</c:if>
					<c:if test="${hysyywHygnqhHykjDmtxx.wjlx =='视频' }">
						<img alt="image" width="138" height="164" src="/hydg/files/media/picture/${hysyywHygnqhHykjDmtxx.spjtmc }" />
						&nbsp;&nbsp;
						<a href="###" onclick="goVideoOpen('${ hysyywHygnqhHykjDmtxx.id }')">
						<font color="blue">播放</font>
						</a>
					</c:if>
					<c:if test="${hysyywHygnqhHykjDmtxx.wjlx =='音频' }">
						&nbsp;&nbsp;
						<a href="###" onclick="goVideoOpen('${ hysyywHygnqhHykjDmtxx.id }')">
						<font color="blue">播放</font>
						</a>
					</c:if>
					&nbsp;&nbsp;
					<a href="###" onclick="downloadMediafj('${hysyywHygnqhHykjDmtxx.fj }')" class="tablelink">
					<font color="blue">下载</font>
					</a>
					
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">备注：</td>
					<td colspan="3">${hysyywHygnqhHykjDmtxx.bz }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">新增用户姓名：</td>
					<td colspan="3">${hysyywHygnqhHykjDmtxx.addusername }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">新增时间：</td>
					<td>${hysyywHygnqhHykjDmtxx.addtime }</td>
					<td  style="background-color:#f5f8fa;">最后修改时间：</td>
					<td>${hysyywHygnqhHykjDmtxx.lastupdatetime }</td>
				</tr>
					
				<tr>
					<td colspan="4" style="text-align:center;">
						<input name="fh" type="button" value="返回" class="scbtn" onclick="goBack()" />
					</td>
				</tr>
			</table>
			</div>
		</div>
</form>
	</body>
	

	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</html>