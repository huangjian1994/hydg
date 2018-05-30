<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>许可信息</title>
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
	document.myForm.action="<%=basePath%>/permit/permit_toPermit.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function resert(){
	$("#itemname").val("");
	$("#applier").val("");
	$("#projectname").val("");
	$("#division").val("");
}

//详情
function goZzglDetail(id){
	<%--document.myForm.action="<%=basePath%>/qualification/qualification_fetchQualificationDetail.do";--%>
	<%--document.myForm.target="_self";--%>
	<%--document.myForm.submit();--%>
    location = "${contextPath}/permit/permit_goPermitDetaile.do?xzxkxx.projectid=" + id;
}


</script>
	</head>

	<body>
<form name="myForm" method="post"  action="">

<input name="zzID" id="zzID" type="hidden" value="" />
<input name="zzType" id="zzType" type="hidden" value="" />

	<div class="place">
		<span>
			<img src="${contextPath}/images/seasProfession/ico01.png" alt="位置" width="22" height="22" />位置：
		</span>
		<ul class="placeul">
			<li><a href="#">行政许可信息</a></li>
		</ul>
	</div>
	<div class="formbody" >
		<div class="leftinfo1">
			<div class="listtitle3">
				<img src="${contextPath}/images/ico06.png" alt="查询" width="25" height="25" />条件查询
			</div>
		<table width="100%" align="center" style="text-align:left;">
			<tr>
				<td width="20%" style="background-color:#f5f8fa;">事项名称：</td>
				<td width="30%">
				<input name="xzxkxx.itemname" id="itemname" type="text" value="${xzxkxx.itemname }" style="width:180px" />
				</td>
				<td width="20%" style="background-color:#f5f8fa;">申请人：</td>
				<td width="30%">
					<input name="xzxkxx.applier" id="applier" type="text" value="${xzxkxx.applier }" style="width: 180px"/>
				</td>
			</tr>
			<tr>
				<td style="background-color:#f5f8fa;">项目名称：</td>
				<td>
					<input name="xzxkxx.projectname" id="projectname" type="text" value="${xzxkxx.projectname}" style="width:180px;"/>
				</td>
				<td style="background-color:#f5f8fa;">行政区：</td>
				<td ><input name="xzxkxx.division" id="division" type="text" value="${xzxkxx.division }" style="width:180px;"/></td>
				<td colspan="2"></td>
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
				
				<table class="tablelist">
					<thead>
						<tr>
							<th width="3%">序号</th>
							<th width="12%">事项名称</th>
							<th width="10%">受理日期</th>
							<th width="15%">申请人</th>
							<th width="15%">申请地址</th>
							<th width="5%">行政区</th>
							<th width="15%">项目名称</th>
							<th width="20%">项目地址</th>
							<th width="5%">操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${ xzxkList }" var="x" varStatus="j">
						<tr>
							<td>${ j.count }</td>
							<td>${x[3] }</td>
							<td>${x[5]}</td>
							<td>${x[7]}</td>
							<td>${x[8]}</td>
							<td>${x[9]}</td>
							<td>${x[11]}</td>
							<td>${x[23]}</td>

							<td>
								<a href="#" onclick="goZzglDetail('${x[0] }')" class="tablelink">详情</a>
								<%--<a href="#" onclick="goUpdateZzgl('${x.id }')" class="tablelink">修改</a>--%>
								<%--<a href="#" onclick="goDeleteZzgl('${x.id }')" class="tablelink">删除</a>--%>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

			
	</div>
</form>
<div align="center" style="font-size:14px;">
    <s:property value="pageBean" escapeHtml="false"/>
</div>
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