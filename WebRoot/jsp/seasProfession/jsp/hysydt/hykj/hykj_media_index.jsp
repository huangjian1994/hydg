<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
function search(){
	document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_fetchDmtxx.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//重置
function resert(){
	document.getElementById("wjm").value ="";
	document.getElementById("wjlx").value ="";
}
//删除
function deleteDmtxx(dmtID){
	if(confirm("确定删除该记录吗？")){
		document.getElementById("dmtID").value = dmtID;
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_deleteMedia.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
}
//详情
function detailDmtxx(dmtID){
	document.getElementById("dmtID").value = dmtID;
	document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_fetchMediaDetail.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

//修改
function getUpdateDmtxx(dmtID){
	document.getElementById("dmtID").value = dmtID;
	document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_getUpdateMedia.do";
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
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li><a href="#">海域使用动态管理</a></li>
				<li>
					<a href="#">海域勘界管理</a>
				</li>
				<li>
					<a href="#">多媒体信息管理</a>
				</li>
			</ul>
		</div>
		<input name="dmtID" id="dmtID" value="" type="hidden" />
		<input name="fileName" id="fileName" value="" type="hidden" />
		
		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td width="20%">文件名称：</td>
						<td width="30%"><input name="hysyywHygnqhHykjDmtxx.wjm" id="wjm" type="text" value="${hysyywHygnqhHykjDmtxx.wjm }" style="width:180px;" /></td>
						<td width="20%">文件类型：</td>
						<td width="30%">
							<select name="hysyywHygnqhHykjDmtxx.wjlx" id="wjlx" style="width:180px;">
								<option value="">-请选择-</option>
								<option value="文件">文件</option>
								<option value="照片">照片</option>
								<option value="音频">音频</option>
								<option value="视频">视频</option>
							</select>
							<input name="wjlxY" id="wjlxY" type="hidden" value="${hysyywHygnqhHykjDmtxx.wjlx }" />
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<input name="查询" type="button" class="scbtn" value="查询" onclick="search()" />
							<input name="重置" type="button" class="scbtn" value="重置" onclick="resert()" />
						</td>
					</tr>
				</table>
			</div><br />
		
		<div class="tools">
			<ul class="toolbar">
				<li>
					<a href="${contextPath}/jsp/seasProfession/jsp/hysydt/hykj/hykj_media_add.jsp"><span>
					<img src="${contextPath}/images/seasProfession/t01.png"/></span>新增</a>
				</li>
			</ul>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<!-- 
					<th width="5%"><input name="" type="checkbox" value="" /></th>
					<td><input name="" type="checkbox" value="" /></td>
					 -->
					<th width="5%">序号</th>
					<th width="15%">文件名</th>
					<th width="15%">文件说明</th>
					<th width="10%">文件类型</th>
					<th width="10%">图片/视频</th>
					<th width="10%">上传人</th>
					<th width="15%">上传时间</th>
					<th width="15%">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${ mediaList }" var="r" varStatus="j">
				<tr>
					<td>${j.count }</td>
					<td>${r.wjm }</td>
					<td>${r.wjsm }</td>
					<td>${r.wjlx }</td>
					<td>
					<c:if test="${r.wjlx =='照片' }">
						<a href="<%=basePath%>/seaDemarcation/seaDemarcation_fetchDmtxxZpDetail.do?dmtID=${r.id}" target="_blank">
						<img src="<%=basePath%>/seaDemarcation/seaDemarcation_fetchDmtxxZp.do?dmtID=${r.id}" width="138" height="164"/>
						</a>
					</c:if>
					<c:if test="${r.wjlx =='视频' }">
						<a href="###" onclick="goVideoOpen('${ r.id }')">
						<img alt="image" width="138" height="164" src="/hydg/files/media/picture/${ r.spjtmc }" />
						</a>
					</c:if>
					</td>
					<td>${r.scr }</td>
					<td>${r.scsj }</td>
					<td>
						<a href="###" onclick="detailDmtxx('${r.id }')"  class="tablelink">详情</a>
						<a href="###" onclick="getUpdateDmtxx('${r.id }')"  class="tablelink">修改</a>
						<a href="###" onclick="deleteDmtxx('${r.id }')" class="tablelink">删除</a>
						<a href="###" onclick="downloadMediafj('${r.fj }')" class="tablelink">下载</a>
						<c:if test="${r.wjlx=='视频' || r.wjlx=='音频'}">
						<a  href="###" onclick="goVideoOpen('${ r.id }')" class="tablelink">播放</a>
						</c:if>
						
						
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
</form>
	<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>

	
		<script type="text/javascript">
		if(document.getElementById("wjlxY").value==""){
			document.getElementById("wjlx").value = "";
		}else{
			document.getElementById("wjlx").value = document.getElementById("wjlxY").value;
		}
		
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

	</body>

</html>