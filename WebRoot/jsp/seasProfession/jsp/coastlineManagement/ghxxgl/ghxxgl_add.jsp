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
    		document.myForm.action="<%=basePath%>/dgiff/dgiff_fetchHaxGhxxList.do";
    		document.myForm.target="_self";
    		document.myForm.submit();
    	}
    	//保存
    	function addGhxx(){
    		if(document.getElementById("wjm").value ==""){
    			alert("文件名称不允许为空！");
    			return false;
    		}
    		if(document.getElementById("wjlx").value ==""){
    			alert("文件类型不允许为空！");
    			return false;
    		}
    		var wjlx=document.getElementById("wjlx").value;
    		//校验
    		var filename1=document.myForm.upload.value;
    		if(filename1==""){
    			alert("请先上传文件！");
    			return false;
    		}
    		//判断文件格式
    		var hz1=filename1.substring(filename1.length-4,filename1.length);
    		if(filename1 !=""){
    			if(wjlx=="WORD"){
    				//alert(hz1);
    				if (hz1!=".doc" && hz1!="docx"){
    					alert("请上传WORD格式的文件！！"); 				
    				    return false; 
    				}
    			}
    			if(wjlx=="PDF"){
    				if (hz1!=".pdf" && hz1!=".PDF"){
    					alert("请上传PDF格式的文件！！"); 				
    				    return false; 
    				}
    			}
    		}
    		document.myForm.action="<%=basePath%>/dgiff/dgiff_addHaxGhxx.do";
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
				<li><a href="#">海岸线管理</a></li>
				<li><a href="#">海岸线规划信息管理</a></li>
			</ul>
		</div>		
		<div class="formbody">
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/ico02.png" width="20" height="20" />新增</div>
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#f5f8fa;">文件名称：</td>
					<td colspan="3">
					<input name="hysyywHysydtHaxGhxx.wjm" id="wjm" type="text" value="" style="width:500px;" />
					<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">文件类型：</td>
					<td colspan="3">
						<select name="hysyywHysydtHaxGhxx.wjlx" id="wjlx" style="width:200px;">
							<option value="">-请选择-</option>
							<option value="PDF">PDF</option>
							<option value="WORD">WORD</option>
						</select>
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">附件：</td>
					<td colspan="3">
						<input name="upload" type="file" value="" style="width:400px;" />
						<font color="red">*</font>
					</td>
				</tr>				
				<tr>
					<td style="background-color:#f5f8fa;">备注：</td>
					<td colspan="3">
						<textarea name="hysyywHysydtHaxGhxx.bz" id="hysyywHysydtHaxGhxx.bz" rows="4" cols="60"></textarea>
					</td>
				</tr>				
				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn" name="xg" onclick="addGhxx()" value="保存" />
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