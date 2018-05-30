<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>

<script type="text/javascript">
//代码
$(document).ready(function(){
	var zsdjY =document.getElementById("zsdjY").value;
	
	getDictionary("资质等级","zsdj",zsdjY);
});
//加载字典
function getDictionary(keyZ,selectID,historyZ){
	$.ajax({		  		
		type: "post",
		dataType:"json",
		url: "${contextPath}/business/business_fetchDictionary.do",
		data: "dictionary.key="+keyZ,
		success: function(d){
			for(var i=0;i<d.length;i++){
				//alert(d);
				if(d[i].dm==historyZ){
					$("<option value= '"+d[i].dm+"' selected>"+d[i].value+"</option>").appendTo("#"+selectID);
				}else{
					$("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
				}
				}
		}
	});	  
}
//查询
function search(){
	document.myForm.action="<%=basePath%>/qualification/qualification_fetchQualificationList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function resert(){
	document.getElementById("shxydm").value="";
	document.getElementById("zzlx").value="";
	document.getElementById("zsdj").value="";
	document.getElementById("dwmc").value="";
	document.getElementById("fddbr").value="";
	document.getElementById("zsbh").value="";
}

//详情
function goZzglDetail(zzID){
	document.getElementById("zzID").value=zzID;
	document.myForm.action="<%=basePath%>/qualification/qualification_fetchQualificationDetail.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//修改
function goUpdateZzgl(zzID){
	document.getElementById("zzID").value=zzID;
	document.myForm.action="<%=basePath%>/qualification/qualification_fetchQualificationUpdate.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//删除
function goDeleteZzgl(zzID){
	if(confirm("确定删除该记录吗？")){
	document.getElementById("zzID").value=zzID;
	document.myForm.action="<%=basePath%>/qualification/qualification_deleteQualification.do";
	document.myForm.target="_self";
	document.myForm.submit();
	}
}

</script>
	</head>

	<body>
<form name="myForm" method="post" >

<input name="zzID" id="zzID" type="hidden" value="" />
<input name="zzType" id="zzType" type="hidden" value="" />


	<div class="place">
		<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">内外部接口</a></li>
			<li><a href="#">资质管理</a></li>
		</ul>
	</div>
	<div class="formbody" >
		<div class="leftinfo1">
			<div class="listtitle3"><img src="${contextPath}/images/ico06.png" width="25" height="25" />条件查询</div>
		<table width="100%" align="center" style="text-align:left;">
			<tr>
				<td style="background-color:#f5f8fa;">社会信用代码：</td>
				<td>
					<input name="searchForm.shxydm" id="shxydm" type="text" value="${searchForm.shxydm }" style="width:180px;"/>
				</td>
				
				<td style="background-color:#f5f8fa;">单位名称：</td>
				<td ><input name="searchForm.dwmc" id="dwmc" type="text" value="${searchForm.dwmc }" style="width:180px;"/></td>
			</tr>
			
			<tr>
				<td width="20%" style="background-color:#f5f8fa;">资质类型：</td>
				<td width="30%">
				<select name="searchForm.zzlx" id="zzlx" style="width:180px;">
					<option value="">-请选择-</option>
					<option value="海域使用论证资质证书">海域使用论证资质证书</option>
					<option value="测绘资质证书">测绘资质证书</option>
					<!-- 
					<option value="论证报告">论证报告</option>
					<option value="海籍调查信息">海籍调查信息</option>
					 -->
				</select>
				<input name="zzlxY" id="zzlxY" type="hidden" value="${searchForm.zzlx }" />
				</td>
				<td width="20%" style="background-color:#f5f8fa;">证书等级：</td>
				<td width="30%">
					<select name="searchForm.zsdj" id="zsdj" style="width:180px;">
						<option value="">-请选择-</option>
					</select>
					<input name="zsdjY" id="zsdjY" type="hidden" value="${searchForm.zsdj }" />
				</td>
			</tr>
			<tr>
				<td style="background-color:#f5f8fa;">证书编号：</td>
				<td ><input name="searchForm.zsbh" id="zsbh" type="text" value="${searchForm.zsbh }" style="width:180px;"/></td>
				<td style="background-color:#f5f8fa;">法定代表人：</td>
				<td ><input name="searchForm.fddbr" id="fddbr" type="text" value="${searchForm.fddbr }" style="width:180px;"/></td>
			
			</tr>
			<tr>
				<td colspan="4">
					<input name="查询" type="button" class="scbtn" value="查询" onclick="search()" />
					<input name="重置" type="button" class="scbtn" value="重置" onclick="resert()" />
				</td>
			</tr>
		</table>
		</div>
		<br />
	
				<div class="tools">
					<ul class="toolbar">
						<li>
							<a href="${contextPath}/jsp/seasProfession/jsp/nwbjk/zzgl/zzgl_add.jsp" ><span>
							<img src="${contextPath}/images/seasProfession/t01.png" /></span>新增</a>
						</li>
						
					</ul>
				</div>
				
				<table class="tablelist">
					<thead>
						<tr>
							<th>序号</th>
							<th>社会信用代码</th>
							<th>单位名称</th>
							<th>资质类型</th>
							<th>证书编号</th>
							<th>证书等级</th>
							
							<th>法定代表人</th>
							<th>有效期至</th>
							<th>发证机关</th>
							<th>发证日期</th>
							<!-- 
							<th>论证报告名称</th>
							<th>测绘单位</th>
							<td>${r.lzbgmc }</td>
							<td>${r.chdw }</td>
							 -->
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${ zzList }" var="r" varStatus="j">
						<tr>
							<td>${ j.count }</td>
							<td>${r.shxydm }</td>
							<td>${r.dwmc }</td>
							<td>${r.zzlx }</td>
							<td>${r.zsbh }</td>
							<td>
							<c:if test="${r.zsdj=='1' }">甲级</c:if>
							<c:if test="${r.zsdj=='2' }">乙级</c:if>
							<c:if test="${r.zsdj=='3' }">丙级</c:if>
							</td>
							
							<td>${r.fddbr }</td>
							<td>${r.yxqz }</td>
							<td>${r.fzjg }</td>
							<td>${r.fzrq }</td>
							
							<td>
								<a href="###" onclick="goZzglDetail('${r.id }')" class="tablelink">详情</a>
								<a href="###" onclick="goUpdateZzgl('${r.id }')" class="tablelink">修改</a>
								<a href="###" onclick="goDeleteZzgl('${r.id }')" class="tablelink">删除</a>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				
				
				
			
	</div>
</form>
<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
		

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
			if(document.getElementById("zzlxY").value ==""){
				document.getElementById("zzlx").value ="";
			}else{
				document.getElementById("zzlx").value =document.getElementById("zzlxY").value;
			}
		</script>
		

	</body>

</html>