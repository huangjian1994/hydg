<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>巡查计划管理</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>	
	<script>
		function goBack(){
			document.myForm.action="<%=basePath%>/patorlReport/patorlReport_fetchPatorlFk.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}

		function saveXcxxfk(){
			//校验
			if(document.getElementById("fillingunit").value ==""){
				alert("巡查单位不允许为空！");
				return false;
			}
			if(document.getElementById("begintime").value ==""){
				alert("巡查起始日期不允许为空！");
				return false;
			}
			if(document.getElementById("endtime").value ==""){
				alert("巡查结束日期不允许为空！");
				return false;
			}
			if(document.getElementById("leadername").value ==""){
				alert("实际领队姓名不允许为空！");
				return false;
			}
			if(document.getElementById("peoplename").value ==""){
				alert("实际巡查人员姓名不允许为空！");
				return false;
			}
			if(document.getElementById("feedbacktime").value ==""){
				alert("反馈日期不允许为空！");
				return false;
			}
			if(document.getElementById("feedbackname").value ==""){
				alert("反馈人姓名不允许为空！");
				return false;
			}
			if(document.getElementById("substance").value ==""){
				alert("巡查内容不允许为空！");
				return false;
			}
			if(document.getElementById("classify").value ==""){
				alert("反馈内容分类不允许为空！");
				return false;
			}
			if(document.getElementById("represent").value ==""){
				alert("反馈内容描述不允许为空！");
				return false;
			}

			var chks = document.getElementsByName("uploadFj");
			//alert(chks.length);
			if(chks.length==1){
				var filename=document.myForm.uploadFj.value;
				if(filename !=""){
					//alert("巡查照片不允许为空，请上传照片！");
					//return false;
				//}else{
					var hz=filename.substring(filename.length-4,filename.length);
					if (hz!=".jpg" && hz!=".png" && hz!=".JPG" && hz!=".PNG" && hz!=".gif"){
						alert("第1个文件框，请上传jpg、png或gif格式的照片！！"); 				
						   return false; 
					}
				}	
			}else if(chks.length>1){

			for(var i = 0; i < chks.length; i++) {
				var filename=document.myForm.uploadFj[i].value;
				if(filename ==""){
					alert("第"+(i+1)+"个文件框，巡查照片不允许为空，请上传照片！");
					return false;
				}else{
					var hz=filename.substring(filename.length-4,filename.length);
					if (hz!=".jpg" && hz!=".png" && hz!=".JPG" && hz!=".PNG" && hz!=".gif"){
						alert("第"+(i+1)+"个文件框，请上传jpg、png或gif格式的照片！！"); 				
						   return false; 
					}
				}				
			}
			}
			
			
			document.myForm.action="<%=basePath%>/patorlReport/patorlReport_addXcxxfk.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}

		var fileNo = 1;
		function addFileInput(){
			var fi = '<br /><input type="file" name="uploadFj" id="imgFile'
			+ fileNo +
			'" class="scinput" />'
			+ '&nbsp;&nbsp;<input type="button" value="移除" style="width:40px;" onclick="removeFileInput('
			+ fileNo +
			',this)" />';
			
			//var img = '<img id="imgDiv' + fileNo + '" style="margin-left:5px;width:180px;height:150px;float:left;" src="">';
			
			$("#fileTd").append(fi);
			//$("#imgTd").append(img);
			fileNo ++;
		}
		function removeFileInput(n,bt){
			//$("#imgDiv" + n).remove();
			$("#imgFile" + n).remove();
			$(bt).remove();
		}


		
	</script>	
	</head>
	
	<body>
	<form name="myForm" method="post" enctype="multipart/form-data">
	<input name="xcjhID" id="xcjhID" type="hidden" value="${xcjhID }" />
	
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海域海岛巡查</a>
				</li>
				<li>
					<a href="#">执法信息反馈</a>
				</li>
			</ul>
		</div>
		<div align="center">
			<div class="mainbox">
				<div class="leftinfo1">
					<div class="listtitle3">
						<img src="${contextPath}/images/seasInspection/i02.png" width="25" height="25" />新增
					</div>
					<div id="usual1" class="usual">
						<div id="tab1" class="tabson">
							<table width="100%" align="center" style="text-align:left;" class="tableXQ" >
								<tr>
									<!-- 
									<td style="background-color:#e8edef;">巡查计划ID：</td>
									<td>
									<input name="hyxcHdxcFkjcxx.patrolid" id="patrolid" type="hidden" class="scinput" value="${xcjhID }" style="width:180px;" /><font color="red">*</font>
									</td>
									 -->
									<td style="background-color:#e8edef;">巡查单位：</td>
									<td colspan="3">
									<input name="hyxcHdxcFkjcxx.fillingunit" id="fillingunit" type="text" class="scinput" value="" style="width:180px;" /><font color="red">*</font>
									</td>
								</tr>
								<tr>									
									<td style="background-color:#e8edef;">巡查起始日期：</td>
									<td>
									<input name="hyxcHdxcFkjcxx.begintime" id="begintime" type="text" class="scinput" value="" style="width:180px;"  onclick="WdatePicker()" readonly="readonly" /><font color="red">*</font>
									</td>
									<td style="background-color:#e8edef;">巡查结束日期：</td>
									<td>
									<input name="hyxcHdxcFkjcxx.endtime" id="endtime" type="text" class="scinput" value="" style="width:180px;"  onclick="WdatePicker()" readonly="readonly" /><font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">实际领队姓名：</td>
									<td>
									<input name="hyxcHdxcFkjcxx.leadername" id="leadername" type="text" class="scinput" value="" style="width:180px;" /><font color="red">*</font>
									<a href="#"><font color="blue">选择</font></a>
									</td>
									<td style="background-color:#e8edef;">实际巡查人员姓名：</td>
									<td>
									<input name="hyxcHdxcFkjcxx.peoplename" id="peoplename" type="text" class="scinput" value="" style="width:180px;" /><font color="red">*</font>
									<a href="#"><font color="blue">选择</font></a>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">反馈日期：</td>
									<td>
									<input name="hyxcHdxcFkjcxx.feedbacktime" id="feedbacktime" type="text" class="scinput" value="" style="width:180px;"  onclick="WdatePicker()" readonly="readonly" /><font color="red">*</font>
									</td>
									<td style="background-color:#e8edef;">反馈人姓名：</td>
									<td>
									<input name="hyxcHdxcFkjcxx.feedbackname" id="feedbackname" type="text" class="scinput" value="<s:property value="#session.user.name" />" style="width:180px;" /><font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">数据来源名称：</td>
									<td>
									<input name="hyxcHdxcFkjcxx.datasource" id="datasource" type="text" class="scinput" value="" style="width:180px;" />
									</td>
									<td style="background-color:#e8edef;">记录设备：</td>
									<td>
									<input name="hyxcHdxcFkjcxx.recorddevice" id="recorddevice" type="text" class="scinput" value="" style="width:180px;" />
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">巡查内容：</td>
									<td colspan="3">
									<textarea rows="4" cols="70" name="hyxcHdxcFkjcxx.substance" id="substance"></textarea><font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">反馈内容分类：</td>
									<td>
									<input name="hyxcHdxcFkjcxx.classify" id="classify" type="text" class="scinput" value="" style="width:180px;" /><font color="red">*</font>
									</td>
									<td style="background-color:#e8edef;">反馈内容描述：</td>
									<td>
									<input name="hyxcHdxcFkjcxx.represent" id="represent" type="text" class="scinput" value="" style="width:180px;" /><font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">备注：</td>
									<td colspan="3">
									<textarea rows="4" cols="70" name="hyxcHdxcFkjcxx.bz" id="bz"></textarea>
									
									</td>
								</tr>
								<!-- 
								<tr>
									<td width="20%" style="background-color:#e8edef;">新增时间：</td>
									<td width="30%" >${hyxcHdxcFkjcxx.addtime }</td>
									<td width="20%" style="background-color:#e8edef;">最后修改时间：</td>
									<td width="30%" >${hyxcHdxcFkjcxx.updatetime }</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">修改人姓名：</td>
									<td colspan="3">${hyxcHdxcFkjcxx.updateuser }</td>
								</tr>
								 -->
								<tr>
									<th colspan="4">巡查照片</th>
								</tr>
								<!-- 
								<tr>
									<td style="background-color:#e8edef;">文件类型：</td>
									<td colspan="3">
										<select name="hyxcHdxcFkfj.filetype" id="filetype" style="width:180px;">
											<option value="">-请选择-</option>
											<option value="照片">照片</option>
											<option value="文件">文件</option>
											<option value="视频">视频</option>
											<option value="音频">音频</option>
										</select><font color="red">*</font>
									</td>
								</tr>
								 -->
								<tr>
									<td style="background-color:#e8edef;">上传照片：
									<input type="button" value="添加" style="width:60px;" onclick="addFileInput()" />
									</td>
									<td colspan="3" id="fileTd">
									<input name="uploadFj" type="file" id="imgFile" class="scinput" />
									</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center;">
										<input type="button" class="scbtn1" name="btn" onclick="saveXcxxfk()" value="保存" />
										<input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack()" />
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>	
	</body>
</html>