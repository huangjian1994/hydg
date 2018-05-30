<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海底管线安全</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

	</head>
	<script>
	$(document).ready(function(){		
		getDictionary("违规船舶类型","cblx","");
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
	
		function saveWgjb(){
			if(document.getElementById("mmsi").value ==""){
				alert("船舶mmsi不允许为空！");
				return false;
			}
			if(document.getElementById("wgcm").value ==""){
				alert("违规船名不允许为空！");
				return false;
			}
			if(document.getElementById("cblx").value ==""){
				alert("船舶类别不允许为空！");
				return false;
			}
			if(document.getElementById("fzr").value ==""){
				alert("船舶负责人不允许为空！");
				return false;
			}
			if(document.getElementById("wgnr").value ==""){
				alert("违规内容不允许为空！");
				return false;
			}
			if(document.getElementById("wgdd").value ==""){
				alert("违规地点不允许为空！");
				return false;
			}
			if(document.getElementById("wgrq").value ==""){
				alert("违规日期不允许为空！");
				return false;
			}
			if(document.getElementById("jbr").value ==""){
				alert("巡查人不允许为空！");
				return false;
			}
			document.myForm.action="<%=basePath%>/submarineline/submarineline_addWgjb.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}

		function goBack(){
			document.myForm.action="<%=basePath%>/submarineline/submarineline_fetchWgjbList.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}
	
	</script>

	<body>
	<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seabedPipeline/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海底管线安全</a>
				</li>
				<li>
					<a href="#">违规举报管理</a>
				</li>
			</ul>
		</div>
		
		<div class="formbody" >
			<div id="usual1" class="usual">
				<div class="leftinfo1">
							<div class="listtitle"><img src="${contextPath}/images/ico02.png" width="20" height="20" />新增</div>
								<table style="width:98%;" class="tablelist2" align="center">
								<tr>
									<td width="20%" style="background-color:#f5f8fa;">船舶mmsi：</td>
									<td width="30%"><input name="hdgxAqglWgjb.mmsi" id="mmsi" type="text" class="scinput" value="" style="width:200px;" /><font color="red">*</font></td>
									<td width="20%" style="background-color:#f5f8fa;">违规船名：</td>
									<td width="30%"><input name="hdgxAqglWgjb.wgcm" id="wgcm" type="text" class="scinput" value="" style="width:200px;"/><font color="red">*</font></td>
								</tr>
								<tr>
									<td style="background-color:#f5f8fa;">船舶类别：</td>
									<td>
										<select name="hdgxAqglWgjb.cblx" id="cblx" style="width:200px;">
											<option value="">-请选择-</option>
											<!-- 
											<option value="非法取砂船舶">非法取砂船舶</option>
											<option value="工程作业船">工程作业船</option>
											 -->
										</select><font color="red">*</font>
									</td>
									<td style="background-color:#f5f8fa;">船舶负责人：</td>
									<td><input name="hdgxAqglWgjb.fzr" id="fzr" type="text" class="scinput" value="" style="width:200px;"/><font color="red">*</font></td>
								</tr>
								<tr>
									<td style="background-color:#f5f8fa;">违规内容：</td>
									<td colspan="3">
									<textarea name="hdgxAqglWgjb.wgnr" id="wgnr" rows="3" cols="80" ></textarea><font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td style="background-color:#f5f8fa;">违规地点：</td>
									<td colspan="3">
									<textarea name="hdgxAqglWgjb.wgdd" id="wgdd" rows="3" cols="80" ></textarea><font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td style="background-color:#f5f8fa;">违规日期：</td>
									<td>
										<input name="hdgxAqglWgjb.wgrq" id="wgrq" type="text" class="scinput" value="" onclick="WdatePicker()" readonly="readonly" style="width:200px;" />
										<font color="red">*</font>
									</td>
									<td style="background-color:#f5f8fa;">巡查人：</td>
									<td><input name="hdgxAqglWgjb.jbr" id="jbr" type="text" class="scinput" value="" style="width:200px;" /><font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td style="background-color:#f5f8fa;">后续处理情况：</td>
									<td colspan="3">
									<textarea name="hdgxAqglWgjb.hxclqk" id="hxclqk" rows="3" cols="80" ></textarea>
									</td>
								</tr>
								<tr>
									<td style="background-color:#f5f8fa;">备注：</td>
									<td colspan="3">
									<textarea name="hdgxAqglWgjb.bz" id="bz" rows="3" cols="80" ></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center;">
										<input type="button" class="scbtn" name="btn" onclick="saveWgjb()" value="保存">
										<input name="fh" type="button" value="返回" class="scbtn" onclick="goBack()" />
									</td>
								</tr>
							</table>
				</div>
			</div>
		</div>
	</form>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</body>

</html>