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
	document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_fetchSlsj.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

//下载附件
function downloadMediafj(fj){
	if(confirm("确定下载该文件吗？")){
		document.getElementById("fileName").value = fj;
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_downLoadSlsj.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
}
</script>
	</head>
	<body>
<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li><a href="#">海域使用动态管理</a></li>
				<li><a href="#">海域勘界管理</a></li>
				<li><a href="#">矢量数据管理</a></li>
			</ul>
		</div>
		<input name="fileName" id="fileName" value="" type="hidden" />
		<div class="formbody">
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#f5f8fa;">矢量数据名称：</td>
					<td colspan="3">${hysyywHygnqhHykjSlsj.slsjmc }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">矢量数据类型：</td>
					<td colspan="3">${hysyywHygnqhHykjSlsj.sjlx }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">数据文件名：</td>
					<td colspan="3">
					<a href="###" onclick="downloadMediafj('${hysyywHygnqhHykjSlsj.sjwjm }')" class="tablelink">
					<font color="blue">${hysyywHygnqhHykjSlsj.sjwjm }</font></a>
					</td>
				</tr>
				<!-- 
				<tr>
					<td style="background-color:#f5f8fa;">数据保存路径：</td>
					<td colspan="3">${hysyywHygnqhHykjSlsj.sjbclj }</td>
				</tr>
				 -->
				 <tr>
					<td style="background-color:#f5f8fa;">数据使用链接：</td>
					<td colspan="3">${hysyywHygnqhHykjSlsj.sjlj }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">数据来源：</td>
					<td colspan="3">${hysyywHygnqhHykjSlsj.sjly }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">附件：</td>
					<td colspan="3">
					<a href="###" onclick="downloadMediafj('${hysyywHygnqhHykjSlsj.fj }')" class="tablelink">
					<font color="blue">${hysyywHygnqhHykjSlsj.fj }</font></a>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">备注：</td>
					<td colspan="3">${hysyywHygnqhHykjSlsj.bz }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">新增用户姓名：</td>
					<td colspan="3">${hysyywHygnqhHykjSlsj.addusername }</td>
				</tr>
				<tr>
					<td width="18%" style="background-color:#f5f8fa;">新增时间：</td>
					<td width="25%">${hysyywHygnqhHykjSlsj.addtime }</td>
					<td width="18%" style="background-color:#f5f8fa;">最后修改时间：</td>
					<td width="25%">${hysyywHygnqhHykjSlsj.lastupdatetime }</td>
				</tr>
					
				<tr>
					<td colspan="4" style="text-align:center;">
						<input name="fh" type="button" value="地图展示" class="scbtn" onclick="" />
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