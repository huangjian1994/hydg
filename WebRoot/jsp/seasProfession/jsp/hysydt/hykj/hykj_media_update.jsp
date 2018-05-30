<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	//返回
	function goBack(){
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_fetchDmtxx2.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	//修改
	function xgDmtxx(){
		if(document.getElementById("hysyywHygnqhHykjDmtxx.wjm").value ==""){
			alert("文件名称不允许为空！");
			return false;
		}
		if(document.getElementById("hysyywHygnqhHykjDmtxx.wjsm").value ==""){
			alert("文件说明不允许为空！");
			return false;
		}
		if(document.getElementById("wjlx").value ==""){
			alert("文件类型不允许为空！");
			return false;
		}
		var wjlx = document.getElementById("wjlx").value;
		//校验
		var filename=document.myForm.upload.value;
		if(filename==""){
			alert("请先上传文件！");
			return false;
		}
		var hz=filename.substring(filename.length-4,filename.length);
		if(wjlx=="文件"){
			if (hz!=".doc" && hz!=".docx" && hz!=".xls" && hz!=".xlsx" && hz!=".txt"){
				alert("文件类型是文件，请上传doc、docx、xls、xlsx或txt格式的文件！！"); 				
			    return false; 
			}
		}
		if(wjlx=="照片"){
			if (hz!=".jpg" && hz!=".png" && hz!=".JPG" && hz!=".PNG" && hz!=".gif"){
				alert("文件类型是照片，请上传jpg、png或gif格式的图片！！"); 				
			    return false; 
			}
		}
		if(wjlx=="音频"){
			if (hz!=".mp4"){
				alert("文件类型是音频，请上传mp4格式的音频！！"); 				
			    return false; 
			}
		}
		if(wjlx=="视频"){
			if(hz!=".wmv" && hz!=".mp4" && hz!=".avi" && hz!=".ogg" && hz!=".webm" && hz!=".3gp" && hz!=".WMV" && hz!=".MP4" && hz!=".AVI"){
				alert("文件类型是视频，请上传视频格式的文件！");
				return false;
			}
		}
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_updateMedia.do";
		document.myForm.target="_self";
		document.myForm.submit();
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
<form name="myForm" method="post" enctype="multipart/form-data">
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li><a href="#">海域使用动态管理</a></li>
				<li><a href="#">海域勘界管理</a></li>
				<li><a href="#">多媒体信息管理</a></li>
			</ul>
		</div>
		<input name="dmtID" id="dmtID" value="" type="hidden" />
		<div class="formbody">
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/ticon.png" width="20" height="20" />修改</div>
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#f5f8fa;">文件名称：</td>
					<td colspan="3">
					<input name="hysyywHygnqhHykjDmtxx.wjm" id="hysyywHygnqhHykjDmtxx.wjm" type="text" value="${hysyywHygnqhHykjDmtxx.wjm }" style="width:180px;" />
					<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">文件说明：</td>
					<td colspan="3">
						<textarea name="hysyywHygnqhHykjDmtxx.wjsm" id="hysyywHygnqhHykjDmtxx.wjsm" rows="4" cols="60">${hysyywHygnqhHykjDmtxx.wjsm }</textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">文件类型：</td>
					<td colspan="3">
						<select name="hysyywHygnqhHykjDmtxx.wjlx" id="wjlx" style="width:180px;">
							<option value="">-请选择-</option>
							<option value="文件">文件</option>
							<option value="照片">照片</option>
							<option value="音频">音频</option>
							<option value="视频">视频</option>
						</select><font color="red">*</font>
						<input name="wjlxY" id="wjlxY" type="hidden" value="${hysyywHygnqhHykjDmtxx.wjlx }" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">旧附件名称：</td>
					<td>
						<input name="hysyywHygnqhHykjDmtxx.fj" id="hysyywHygnqhHykjDmtxx.fj" type="hidden" value="${hysyywHygnqhHykjDmtxx.fj }" />
						
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
						${hysyywHygnqhHykjDmtxx.fj }
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">上传新附件：</td>
					<td>
						<input name="upload" type="file" value="" style="width:400px;" />
						<font color="red">*</font>
					</td>
				</tr>
				
				<tr>
					<td style="background-color:#f5f8fa;">备注：</td>
					<td colspan="3">
						<textarea name="hysyywHygnqhHykjDmtxx.bz" id="hysyywHygnqhHykjDmtxx.bz" rows="4" cols="60">${hysyywHygnqhHykjDmtxx.bz }</textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn" name="xg" onclick="xgDmtxx()" value="修改" />
						<input name="fh" type="button" value="返回" class="scbtn" onclick="goBack()" />
					
						<input name="hysyywHygnqhHykjDmtxx.id" id="hysyywHygnqhHykjDmtxx.id" type="hidden" value="${hysyywHygnqhHykjDmtxx.id }" />
						<input name="hysyywHygnqhHykjDmtxx.addtime" id="hysyywHygnqhHykjDmtxx.addtime" type="hidden" value="${hysyywHygnqhHykjDmtxx.addtime }" />
						<input name="hysyywHygnqhHykjDmtxx.lastupdatetime" id="hysyywHygnqhHykjDmtxx.lastupdatetime" type="hidden" value="${hysyywHygnqhHykjDmtxx.lastupdatetime }" />
						<input name="hysyywHygnqhHykjDmtxx.addusername" id="hysyywHygnqhHykjDmtxx.addusername" type="hidden" value="${hysyywHygnqhHykjDmtxx.addusername }" />
						<input name="hysyywHygnqhHykjDmtxx.adduserid" id="hysyywHygnqhHykjDmtxx.adduserid" type="hidden" value="${hysyywHygnqhHykjDmtxx.adduserid }" />
						<input name="hysyywHygnqhHykjDmtxx.fjlj" id="hysyywHygnqhHykjDmtxx.fjlj" type="hidden" value="${hysyywHygnqhHykjDmtxx.fjlj }" />
				
					</td>
				</tr>
			</table>
			</div>
		</div>

		<script type="text/javascript">
		if(document.getElementById("wjlxY").value!=""){
			document.getElementById("wjlx").value = document.getElementById("wjlxY").value;
		}else{
			document.getElementById("wjlx").value ="";
		}
		
		
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

</form>
	</body>

</html>