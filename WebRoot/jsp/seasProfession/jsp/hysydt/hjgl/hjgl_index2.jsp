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
	var wjlxY=document.getElementById("wjlxY").value;
	getDictionary("附件类型","wjlx",wjlxY);
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
	document.myForm.action="<%=basePath%>/seaRecord/seaRecord_fetchFileList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function resert(){
	document.getElementById("yhxmmc").value="";
	document.getElementById("hyglh").value="";
	document.getElementById("wjm").value="";
	document.getElementById("wjlx").value="";
}
//附件详情：下载附件
function downloadXmfj(fj,xmID){
	if(confirm("确定下载该附件吗？")){
		document.getElementById("fileName").value = fj;
		document.getElementById("xmID").value = xmID;
		document.myForm.action="<%=basePath%>/business/business_downLoadXmfj.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
}
function goHjgl1(){
		document.myForm.action="<%=basePath%>/seaRecord/seaRecord_fetchYhxm.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
function goHjgl2(){
	document.myForm.action="<%=basePath%>/seaRecord/seaRecord_fetchFileList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function goHjgl3(){
	document.myForm.action="<%=basePath%>/seaRecord/seaRecord_fetchImgList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

//证书详情
function zsxxDetail(xmID,zsID,zsbh){
	document.getElementById("xmID").value=xmID;
	document.getElementById("zsID").value=zsID;
	document.getElementById("zsbh").value=zsbh;
	//document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchZsxxDetail.do?indexNum=1";
	//document.myForm.target="_self";
	document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchZhxxDetailByHyglh.do";
	document.myForm.target="_blank";
	document.myForm.submit();
}
//项目详情
function xmxxDetail(xmID,xmmc){
	document.getElementById("xmID").value=xmID;
	document.getElementById("xmmc").value=xmmc;
	document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchYhxmDetaile.do";
	document.myForm.target="_blank";//_self
	//document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchXmxxDetail.do?indexNum=1";
	//document.myForm.target="_self";
	document.myForm.submit();
}

</script>
	</head>

	<body>
<form name="myForm" method="post" >
<input name="fileName" id="fileName" value="" type="hidden" />
<input name="xmID" id="xmID" value="" type="hidden" />
<input name="zsID" id="zsID" type="hidden" value="" />
<input name="zsbh" id="zsbh" type="hidden" value="" />
<input name="xmmc" id="xmmc" type="hidden" value="" />

	<div class="place">
		<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">海域使用动态管理</a></li>
			<li><a href="#">海籍管理</a></li>
			<li><a href="#">海籍历史资料管理</a></li>
		</ul>
	</div>
	<div class="formbody" >
		<div id="usual1" class="usual" >
			<div class="leftinfo1">
				<div class="itab" >
					<ul>
						<li><a href="###" onclick="goHjgl1()">海籍信息</a></li>
						<li><a href="###" onclick="goHjgl2()" class="selected">文件信息</a></li>
						<li><a href="###" onclick="goHjgl3()">图册信息</a></li>
					</ul>
				</div>
			
				<div class="listtitle"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
					<table width="100%" align="center" style="text-align:left;">
							<tr>
								<td>项目名称：</td>
								<td colspan="3" style="text-align: left;">
								&nbsp;&nbsp;
								<input name="searchForm.yhxmmc" id="yhxmmc" type="text" value="${searchForm.yhxmmc }" style="width:500px;" /></td>
								<!-- 
								<td>海域管理号：</td>
								<td>
								<input name="searchForm.hyglh" id="hyglh" type="text" value="${searchForm.hyglh }" style="width:180px;" />
								</td>
								 -->
							</tr>
							<tr>
								<td>文件名称：</td>
								<td style="text-align: left;">
								&nbsp;&nbsp;
								<input name="searchForm.wjm" id="wjm" type="text" value="${searchForm.wjm }" style="width:180px;" /></td>
								<td>文件类型：</td>
								<td style="text-align: left;">&nbsp;&nbsp;
								<select name="searchForm.wjlx" id="wjlx" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
									</select>
									<input name="wjlxY" id="wjlxY" type="hidden" value="${searchForm.wjlx }" />
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
				
				<table class="tablelist">
					<thead>
						<tr>
							<th width="4%">序号</th>
							<th width="15%">项目名称</th>
							
							<th width="15%">海域管理号</th>
							
							<th width="15%">文件名称</th>
							<th width="15%">文件类型</th>
							
							<!-- 
							<th width="20%">附件</th><td>${r.fj }</td>
							<th width="10%">文件类型</th><td>${r.wjlx }</td>
							<th width="8%">文件大小</th><td>${r.wjdx }KB</td>
							 -->
							
							<th width="8%">上传人</th>
							<th width="15%">上传时间</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${ fileList }" var="r" varStatus="j">
						<tr>
							<td>${ j.count }</td>
							<td>
							<a href="#" onclick="xmxxDetail('${r.xmid}','${r.yhxmmc }')" class="tablelink">
							${r.yhxmmc }</a>
							</td>
							<td>
							<a href="#" onclick="zsxxDetail('${r.xmid}','${r.zsid }','${r.hyglh }')" class="tablelink">
							${r.hyglh }</a>
							</td>
							<td>${r.fjmc }</td>
							<td>${r.fjlxmc }</td>
							
							
							<td>${r.scr }</td>
							<td>${r.scsj }</td>
							<td>
							<a href="###" onclick="docheck('<%=basePath%>/seaRecord/seaRecord_fetchFileDetail.do?xmfjID='+${r.id },w,h,x,y)" class="tablelink">详情</a>
							<a href="###" onclick="downloadXmfj('${r.fj }','${r.xmid }')" class="tablelink">下载</a>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				
			
		</div>
	</div>
</form>
<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
		

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');

			function getScreen (){
				var screenArr = [];
				var h = window.screen.height;
				var w = window.screen.width;
				screenArr.push(h,w);
				return screenArr;
			}
			var screenArr = getScreen();
			var w = (screenArr[1]/5)*3;
			var h = (screenArr[0]/5)*3;
			var x = screenArr[1]/5;
			var y = screenArr[0]/5;
				
			function docheck(url,w,h,x,y) {
				window.open(url, "displayWindow", "height=" + h + ",width=" + w + ",top=" + y + ",left=" + x + "");
			}	
			
		</script>
		

	</body>

</html>