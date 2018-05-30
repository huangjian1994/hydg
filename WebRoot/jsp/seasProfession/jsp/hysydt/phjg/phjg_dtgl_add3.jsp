<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
//代码
$(document).ready(function(){
	//var jgfsY=document.getElementById("jgfsY").value;
	//getDictionary("监管方式","jgfs",jgfsY);
	//getXmmc();//项目名称
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
function goAdd1(){
	document.myForm.action="<%=basePath%>/business/business_getJgxxUpdate.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goAdd2(){
	document.myForm.action="<%=basePath%>/business/business_fetchJgxxJcfw.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goAdd3(){
	document.myForm.action="<%=basePath%>/business/business_fetchJgxxJcfj.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//返回
function goBack(){
	document.myForm.action="<%=basePath%>/business/business_fetchXmDtjgList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function addJgxxXczp(){
	var filename1=document.myForm.upload.value;
	var hz1=filename1.substring(filename1.length-4,filename1.length);
	if(filename1==""){
		alert("请先上传现场照片！");
		return false;
	}
	//alert(hz1);
	if (hz1!=".jpg" && hz1!=".png" && hz1!=".JPG" && hz1!=".PNG" && hz1!=".gif"){
		alert("现场照片请上传jpg或png格式的图片！！"); 				
	    return false; 
	}
	document.myForm.action="<%=basePath%>/business/business_saveXczp.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function addJgxxXcyx(){
	var filename2=document.myForm.uploadJzt.value;
	var hz=filename2.substring(filename2.length-4,filename2.length);
	if(filename2==""){
		alert("请先上传现场影像！");
		return false;
	}
	if(hz!=".wmv" && hz!=".mp4" && hz!=".avi" && hz!=".ogg" && hz!=".webm" && hz!=".3gp" && hz!=".WMV" && hz!=".MP4" && hz!=".AVI"){
		alert("请上传视频格式的文件！");
		return false;
	}
	document.myForm.action="<%=basePath%>/business/business_uploadVideo.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

//删除
function deleteJgxxFj(dtglFjID){
	if(confirm("确定删除该记录吗？")){
		document.getElementById("dtglFjID").value = dtglFjID;
		document.myForm.action="<%=basePath%>/business/business_deleteXczp.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
}

function goVideoOpen(dtglFjID){
	document.getElementById("dtglFjID").value = dtglFjID;
	document.myForm.action="<%=basePath%>/business/business_fetchVideoDetail.do";
	document.myForm.target="_blank";
	document.myForm.submit();
}
</script>
	</head>

	<body>
<form name="myForm" method="post"  enctype="multipart/form-data">
		<div class="place">
			<span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海域使用动态管理</a></li>
				<li>
					<a href="#">用海项目批后监管</a>
				</li>
				<li>
					<a href="#">用海项目动态管理</a>
				</li>
			</ul>
		</div>
		<input name="xmID" id="xmID" value="${xmID }" type="hidden" />
		<input name="dtglID" id="dtglID" value="${dtglID }" type="hidden" />
		<input name="dtglFjID" id="dtglFjID" value="" type="hidden" />
	
		<div class="formbody">
			<div id="usual1" class="usual">
				<div class="leftinfo1">
					<div class="itab">
						<ul>
							<li>
								<a href="###" onclick="goAdd1()" >基本信息
								<c:if test="${not empty dtglID}">
								<img src="${contextPath}/images/t02.png" width="15" height="15"/>
								</c:if>
								<c:if test="${empty dtglID}">
								<img src="${contextPath}/images/t03.png" width="15" height="15"/>
								</c:if>
								</a>
							</li>
							<li>
								<a href="###" onclick="goAdd2()" >监测范围
								<c:if test="${not empty yhxmyhfsjzdList}">
								<img src="${contextPath}/images/t02.png" width="15" height="15"/>
								</c:if>
								<c:if test="${empty yhxmyhfsjzdList}">
								<img src="${contextPath}/images/t03.png" width="15" height="15"/>
								</c:if>
								</a>
							</li>
							<li>
								<a href="###" onclick="goAdd3()" class="selected">监测附件
								<c:if test="${not empty phjgDtglList}">
								<img src="${contextPath}/images/t02.png" width="15" height="15"/>
								</c:if>
								<c:if test="${empty phjgDtglList}">
								<img src="${contextPath}/images/t03.png" width="15" height="15"/>
								</c:if>
								</a>
							</li>
						</ul>
					</div>
				<table class="tablelist" style="text-align:center;">
						
						<tr>
							<th width="5%">序号</th>
							<th width="25%">现场影像名称/现场照片名称</th>
							<th width="25%">图片/视频</th>
							<th width="10%">类型</th>
							<th width="10%">新增用户</th>
							<th width="15%">新增时间</th>
							<th width="15%">操作</th>
						</tr>
						<c:forEach items="${ phjgDtglList }" var="r" varStatus="j">
						<tr>
							<td>${ j.count }</td>
							<td>${r.xcyxmc }</td>
							<td>
							<c:if test="${r.type =='现场照片' }">
							<a href="<%=basePath%>/business/business_fetchJgxxZpDetail.do?zhtID=${r.id}" target="_blank">
							<img src="<%=basePath%>/business/business_fetchJgxxZp.do?dtglFjID=${r.id}" width="138" height="164"/>
							</a>
							</c:if>
							<c:if test="${r.type =='现场影像' }">
							<a href="#" onclick="goVideoOpen('${ r.id }')">
							<img alt="image" width="138" height="164" src="/hydg/files/video/picture/${ r.yxjtmc }" />
							</a>
							</c:if>
							</td>
							<td>${r.type }</td>
							<td>${r.addusername }</td>
							<td>${r.addtime }</td>
							<td>
							<a href="###" onclick="deleteJgxxFj('${r.id }')" class="tablelink">删除</a>
							</td>
						</tr>
						</c:forEach>
				</table><br />
			
			
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/ico02.png" width="20" height="20" />新增</div>
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td style="background-color:#f5f8fa;">现场照片：</td>
					<td colspan="2">
						<input type="file" name="upload" id="" />
					</td>
					<td>
					<input type="button" class="scbtn1" name="btn" onclick="addJgxxXczp()" value="照片上传" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">现场影像：</td>
					<td colspan="2">
						<input type="file" name="uploadJzt" id="" />
					</td>
					<td>
					<input type="button" class="scbtn1" name="btn" onclick="addJgxxXcyx()" value="影像上传" />
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack()" />
					</td>
				</tr>
			</table>
			</div>
		</div>
	</div>
</div>
</form>
		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

	</body>

</html>