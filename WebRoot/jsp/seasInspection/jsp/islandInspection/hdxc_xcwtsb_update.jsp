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

	//代码
	$(document).ready(function(){
		var ssqx=document.getElementById("ssqxY").value;
		var wtlb=document.getElementById("wtlbY").value;
		
		getDictionary("行政区划","ssqx",ssqx);
		getDictionary("海岛巡查问题类别","wtlb",wtlb);

		$(".NumText").keyup(function(){    
            $(this).val($(this).val().replace(/\D|^0/g,''));
        }).bind("paste",function(){  //CTR+V事件处理    
            $(this).val($(this).val().replace(/\D|^0/g,''));     
        }).css("ime-mode", "disabled"); //CSS设置输入法不可用

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
					if(d[i].value==historyZ){
						$("<option value= '"+d[i].value+"' selected>"+d[i].value+"</option>").appendTo("#"+selectID);
					}else{
						$("<option value= '"+d[i].value+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
					}
				}
			}
		});	  
	}


	
	function goBack(){
		document.myForm.action="<%=basePath%>/patorlReport/patorlReport_fetchPatorlReport.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	function updateReport(){
		if(document.getElementById("sbrxm").value ==""){
			alert("上报人员姓名不允许为空！");
			return false;
		}
		if(document.getElementById("sbrdwmc").value ==""){
			alert("上报人员单位名称不允许为空！");
			return false;
		}if(document.getElementById("sbrlxdh").value ==""){
			alert("上报人员联系电话不允许为空！");
			return false;
		}if(document.getElementById("sbryddh").value ==""){
			alert("上报人员移动电话不允许为空！");
			return false;
		}
		if(document.getElementById("sbsj").value ==""){
			alert("上报日期不允许为空！");
			return false;
		}if(document.getElementById("ssqx").value ==""){
			alert("发生地点所属区县不允许为空！");
			return false;
		}if(document.getElementById("fsdd").value ==""){
			alert("发生地点不允许为空！");
			return false;
		}if(document.getElementById("bw").value ==""){
			alert("北纬不允许为空！");
			return false;
		}if(document.getElementById("dj").value ==""){
			alert("东经不允许为空！");
			return false;
		}if(document.getElementById("wtlb").value ==""){
			alert("问题类别不允许为空！");
			return false;
		}if(document.getElementById("wtms").value ==""){
			alert("问题描述不允许为空！");
			return false;
		}
		//校验
		var filename=document.myForm.upload.value;
		if(filename !=""){
			var hz=filename.substring(filename.length-4,filename.length);
			if (hz!=".jpg" && hz!=".png" && hz!=".JPG" && hz!=".PNG" && hz!=".gif"){
				alert("请上传jpg、png或gif格式的图片！！"); 				
				   return false; 
			}
		}

		document.myForm.action="<%=basePath%>/patorlReport/patorlReport_updateReport.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	</script>
	</head>
	<body>
	<form name="myForm" method="post" enctype="multipart/form-data">
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海域海岛巡查</a>
				</li>
				<li>
					<a href="#">巡查问题上报</a>
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
							<table width="100%" align="center" style="text-align:left;" class="tableXQ">
								<tr>
									<td style="background-color:#e8edef;">上报人员姓名：</td>
									<td><input name="hyxcHdxcFxwt.sbrxm" id="sbrxm" type="text" class="scinput" value="${hyxcHdxcFxwt.sbrxm }" style="width:180px;" /><font color="red">*</font>
									</td>
									<td style="background-color:#e8edef;">上报人员单位名称：</td>
									<td><input name="hyxcHdxcFxwt.sbrdwmc" id="sbrdwmc" type="text" class="scinput" value="${hyxcHdxcFxwt.sbrdwmc }" style="width:180px;" /><font color="red">*</font></td>
								</tr>
								<tr>									
									<td style="background-color:#e8edef;">上报人员联系电话：</td>
									<td><input name="hyxcHdxcFxwt.sbrlxdh" id="sbrlxdh" type="text" class="scinput" value="${hyxcHdxcFxwt.sbrlxdh }" style="width:180px;" /><font color="red">*</font></td>
									<td style="background-color:#e8edef;">上报人员移动电话：</td>
									<td><input name="hyxcHdxcFxwt.sbryddh" id="sbryddh" type="text" class="scinput" value="${hyxcHdxcFxwt.sbryddh }" style="width:180px;" /><font color="red">*</font></td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">上报日期：</td>
									<td><input name="hyxcHdxcFxwt.sbsj" id="sbsj" type="text" class="scinput" value="${hyxcHdxcFxwt.sbsj }" style="width:180px;" onclick="WdatePicker()" readonly="readonly" /><font color="red">*</font></td>
									
									<td style="background-color:#e8edef;">发生地点所属区县：</td>
									<td>
										<select name="hyxcHdxcFxwt.ssqx" id="ssqx" style="width:180px;">
											<option value="">-请选择-</option>
										</select><font color="red">*</font>
										<input name="ssqxY" id="ssqxY" type="hidden" value="${hyxcHdxcFxwt.ssqx }"/>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">发生地点：</td>
									<td colspan="3"><input name="hyxcHdxcFxwt.fsdd" id="fsdd" type="text" class="scinput" value="${hyxcHdxcFxwt.fsdd }" style="width:500px;" /><font color="red">*</font></td>
								</tr>
								
								
								<tr>
									<td width="20%" style="background-color:#e8edef;">北纬：</td>
									<td width="30%"><input name="hyxcHdxcFxwt.bw" id="bw" type="text" class="scinput" value="${hyxcHdxcFxwt.bw }" style="width:180px;" /><font color="red">*</font></td>
									<td width="20%" style="background-color:#e8edef;">东经：</td>
									<td width="30%"><input name="hyxcHdxcFxwt.dj" id="dj" type="text" class="scinput" value="${hyxcHdxcFxwt.dj }" style="width:180px;" /><font color="red">*</font></td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">问题类别：</td>
									<td colspan="3">
										<select name="hyxcHdxcFxwt.wtlb" id="wtlb" style="width:180px;">
											<option value="">-请选择-</option>
										</select><font color="red">*</font>
										<input name="wtlbY" id="wtlbY" type="hidden" value="${hyxcHdxcFxwt.wtlb }"/>
										
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">问题描述：</td>
									<td colspan="3">
									<textarea rows="4" cols="70" name="hyxcHdxcFxwt.wtms" id="wtms">${hyxcHdxcFxwt.wtms }</textarea><font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">现场原始照片：</td>
									<td colspan="3">
									<a href="<%=basePath%>/patorlReport/patorlReport_fetchReportZpDetail.do?prID=${hyxcHdxcFxwt.id}" target="_blank">
										<img src="<%=basePath%>/patorlReport/patorlReport_fetchReportZp.do?prID=${hyxcHdxcFxwt.id}" width="138" height="164"/>
									</a>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">现场新照片：</td>
									<td colspan="3">
										<input name="upload"  type="file" style="width:180px;" />
									</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center;">
										<input name="hyxcHdxcFxwt.id" id="hyxcHdxcFxwt.id" type="hidden" value="${hyxcHdxcFxwt.id }" />
										<input name="hyxcHdxcFxwt.addtime" id="hyxcHdxcFxwt.addtime" type="hidden" value="${hyxcHdxcFxwt.addtime }" />
										<input name="hyxcHdxcFxwt.lastupdatetime" id="hyxcHdxcFxwt.lastupdatetime" type="hidden" value="${hyxcHdxcFxwt.lastupdatetime }" />
										<input name="hyxcHdxcFxwt.sbrid" id="hyxcHdxcFxwt.sbrid" type="hidden" value="${hyxcHdxcFxwt.sbrid }" />
						
										
										<input type="button" class="scbtn1" name="btn" onclick="updateReport()" value="修改" />
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