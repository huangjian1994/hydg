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
		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_addMedia.do";
		document.myForm.target="_self";
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
		
		<div class="formbody">
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/ico02.png" width="20" height="20" />新增</div>
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
					</td>
				</tr>
				
				<tr>
					<td style="background-color:#f5f8fa;">附件：</td>
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
						<input type="button" class="scbtn" name="xg" onclick="xgDmtxx()" value="新增" />
						<input name="fh" type="button" value="返回" class="scbtn" onclick="goBack()" />
		
					</td>
				</tr>
			</table>
			</div>
		</div>

		<script type="text/javascript">

			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

</form>
	</body>

</html>