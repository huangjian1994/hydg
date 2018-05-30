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
	document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_fetchHjfa.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//重置
function resert(){
	document.getElementById("wjm").value ="";
	document.getElementById("wjlx").value ="";
}


//删除
function deleteHjfa(hjfaID){
	if(confirm("确定删除该记录吗？")){
		document.getElementById("hjfaID").value = hjfaID;
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_deletehjfa.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
}
//详情
function detailHjfa(hjfaID){
	document.getElementById("hjfaID").value = hjfaID;
	document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_fetchhjfaDetail.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

//修改
function getUpdateHjfa(hjfaID){
	document.getElementById("hjfaID").value = hjfaID;
	document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_getUpdateHjfa.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//下载附件
function downloadHjfafj(fj){
	if(confirm("确定下载该附件吗？")){
		document.getElementById("fileName").value = fj;
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_downLoadHjfa.do";
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
				<li>
					<a href="#">海域勘界管理</a>
				</li>
				<li>
					<a href="#">划界方案综合分析</a>
				</li>
			</ul>
		</div>
		<input name="hjfaID" id="hjfaID" value="" type="hidden" />
		<input name="fileName" id="fileName" value="" type="hidden" />
		
		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td width="20%">文件名称：</td>
						<td width="30%"><input name="hysyywHygnqhHykjHjfa.wjm" id="wjm" type="text" value="${hysyywHygnqhHykjDmtxx.wjm }" style="width:180px;" /></td>
						<td width="20%">文件类型：</td>
						<td width="30%">
							<select name="hysyywHygnqhHykjHjfa.wjlx" id="wjlx" style="width:180px;">
								<option value="">-请选择-</option>
								<option value="报告">报告</option>
								<option value="方案">方案</option>
								<option value="实施方案">实施方案</option>
								<option value="图件jpg">图件jpg</option>
								<option value="协议">协议</option>
								<option value="照片Word">照片Word</option>
								<option value="其他">其他</option>
							</select>
							<input name="wjlxY" id="wjlxY" type="hidden" value="${hysyywHygnqhHykjHjfa.wjlx }" />
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
					<a href="${contextPath}/jsp/seasProfession/jsp/hysydt/hykj/hykj_hjfa_add.jsp"><span>
					<img src="${contextPath}/images/seasProfession/t01.png"/></span>新增</a>
				</li>
				<li>
					<a href="${contextPath}/seaDemarcation/seaDemarcation_fetchHjfaTj.do"><span>
					<img src="${contextPath}/images/goback.png"/></span>返回</a>
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
					<th width="20%">海域界线材料文件名</th>
					<th width="10%">材料文件类型</th>
					<th width="25%">海域界线材料</th>
					<th width="8%">上传人</th>
					<th width="15%">上传时间</th>
					<th width="15%">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${ hjfaList }" var="r" varStatus="j">
				<tr>
					<td>${j.count }</td>
					<td>${r.wjm }</td>
					<td>${r.wjlx }</td>
					<td>
					<!-- 
					<img src="<%=basePath%>/files/hykj/hjfa/${r.fj }" width="138" height="164"/>
					<a href="###" onclick="detailHjfa('${r.id }')"></a>
					 
					<c:if test="${r.wjlx =='图件jpg' }">
					
					<img src="C:/hydg/hykj/hjfa/${r.fj }" width="138" height="164"/>
					
					
					</c:if>
					<c:if test="${r.wjlx !='图件jpg' }">
					${r.fj }
					</c:if>
					-->
					${r.fj }
					</td>
					<td>${r.addusername }</td>
					<td>${r.addtime }</td>
					<td>
						<a href="###" onclick="detailHjfa('${r.id }')"  class="tablelink">详情</a>
						<a href="###" onclick="getUpdateHjfa('${r.id }')"  class="tablelink">修改</a>
						<a href="###" onclick="deleteHjfa('${r.id }')" class="tablelink">删除</a>
						<a href="###" onclick="downloadHjfafj('${r.fj }')" class="tablelink">下载</a>
					
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