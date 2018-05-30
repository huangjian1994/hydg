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
	getDictionary("附件类型","Afjlx","");
	getDictionary("附件类型","Ufjlx","");

	/*JQuery 限制文本框只能输入数字*/
	$(".NumText").keyup(function(){
	                $(this).val($(this).val().replace(/\D|^0/g,''));
	            }).bind("paste",function(){  //CTR+V事件处理    
	                $(this).val($(this).val().replace(/\D|^0/g,''));     
	            }).css("ime-mode", "disabled"); //CSS设置输入法不可用
	/*JQuery 限制文本框只能输入数字和小数点*/
	$(".NumDecText").keyup(function(){
	                $(this).val($(this).val().replace(/[^0-9.]/g,''));    
	                }).bind("paste",function(){  //CTR+V事件处理    
	                    $(this).val($(this).val().replace(/[^0-9.]/g,''));     
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
				if(d[i].dm==historyZ){
					$("<option value= '"+d[i].dm+"' selected>"+d[i].value+"</option>").appendTo("#"+selectID);
				}else{
					$("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
				}
				}
		}
	});	  
}



function goZsxxAdd1(){
	document.myForm.action="<%=basePath%>/business/business_getUpdateZhxx.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goZsxxAdd2(){
	document.myForm.action="<%=basePath%>/business/business_fetchYhfs.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goZsxxAdd3(){
	document.myForm.action="<%=basePath%>/business/business_fetchHysyj.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goZsxxAdd4(){
	document.myForm.action="<%=basePath%>/business/business_fetchZhtList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goZsxxAdd5(){
	document.myForm.action="<%=basePath%>/business/business_fetchSqclList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
function goZsxxAdd6(){
	document.myForm.action="<%=basePath%>/business/business_goDtdw.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

	//显示详情窗口
	function goDetail(fjmc,fjlx,fj,wjlx,wjdx,scr,scsj,bz,lastupdatetime){
		document.getElementById("fjmc").innerHTML=fjmc;
		document.getElementById("fjlx").innerHTML=fjlx;
		document.getElementById("fj").innerHTML=fj;
		document.getElementById("wjlx").innerHTML=wjlx;
		document.getElementById("wjdx").innerHTML=wjdx;
		document.getElementById("scr").innerHTML=scr;
		document.getElementById("scsj").innerHTML=scsj;
		document.getElementById("bz").innerHTML=bz;
		document.getElementById("lastupdatetime").innerHTML=lastupdatetime;
		
		document.getElementById("leftinfoDiv1").style.display="none";
		document.getElementById("leftinfoDiv2").style.display="";
		document.getElementById("leftinfoDiv3").style.display="none";
	}
	//隐藏窗口
	function noOpen(){
		document.getElementById("leftinfoDiv1").style.display="none";
		document.getElementById("leftinfoDiv2").style.display="none";
		document.getElementById("leftinfoDiv3").style.display="none";
	}
	//显示上传窗口
	function goAdd(){
		document.getElementById("leftinfoDiv1").style.display="";
		document.getElementById("leftinfoDiv2").style.display="none";
		document.getElementById("leftinfoDiv3").style.display="none";
	}
	
	//保存-附件
	function saveFj(){
		if(document.getElementById("hysyywHysydtYhxmXmfj.fjmc").value ==""){
			alert("附件名称不允许为空！");
			return false;
		}
		if(document.getElementById("Afjlx").value ==""){
			alert("附件类型不允许为空！");
			return false;
		}
		//校验
		var filename=document.myForm.upload[0].value;
		if(filename==""){
			alert("请先上传文件！");
			return false;
		}
		document.myForm.action="<%=basePath%>/business/business_saveYhxmFj5.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	//删除
	function deleteXmfj(xmfjID){
		if(confirm("确定删除该记录吗？")){
			document.getElementById("xmfjID").value = xmfjID;
			document.myForm.action="<%=basePath%>/business/business_deleteYhxmFj5.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}
	}

	//下载附件
	function downloadXmfj(fj){
		if(confirm("确定下载该附件吗？")){
			document.getElementById("fileName").value = fj;
			document.myForm.action="<%=basePath%>/business/business_downLoadXmfj.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}
	}
	
	//修改
	function updateXmfj(id,addtime,lastupdatetime,addusername,adduserid,xmid,
			fjmc,fjlx,fj,wjlx,wjdx,scr,scsj,bz,fjlj){
		document.getElementById("fjU").innerHTML=fj;

		document.getElementById("hysyywHysydtYhxmXmfjU.id").value=id;
		document.getElementById("hysyywHysydtYhxmXmfjU.addtime").value=addtime;
		document.getElementById("hysyywHysydtYhxmXmfjU.lastupdatetime").value=lastupdatetime;
		document.getElementById("hysyywHysydtYhxmXmfjU.addusername").value=addusername;
		document.getElementById("hysyywHysydtYhxmXmfjU.adduserid").value=adduserid;
		document.getElementById("hysyywHysydtYhxmXmfjU.xmid").value=xmid;
		document.getElementById("hysyywHysydtYhxmXmfjU.fjmc").value=fjmc;
		document.getElementById("Ufjlx").value=fjlx;
		document.getElementById("hysyywHysydtYhxmXmfjU.fj").value=fj;
		document.getElementById("hysyywHysydtYhxmXmfjU.wjlx").value=wjlx;
		document.getElementById("hysyywHysydtYhxmXmfjU.wjdx").value=wjdx;
		document.getElementById("hysyywHysydtYhxmXmfjU.scr").value=scr;
		document.getElementById("hysyywHysydtYhxmXmfjU.scsj").value=scsj;
		document.getElementById("hysyywHysydtYhxmXmfjU.bz").value=bz;
		document.getElementById("hysyywHysydtYhxmXmfjU.fjlj").value=fjlj;
		
		document.getElementById("leftinfoDiv1").style.display="none";
		document.getElementById("leftinfoDiv2").style.display="none";
		document.getElementById("leftinfoDiv3").style.display="";
	}
	
	//附件修改
	function updateFj(){
		if(document.getElementById("hysyywHysydtYhxmXmfjU.fjmc").value ==""){
			alert("附件名称不允许为空！");
			return false;
		}
		if(document.getElementById("Ufjlx").value ==""){
			alert("附件类型不允许为空！");
			return false;
		}
		
		document.myForm.action="<%=basePath%>/business/business_updateYhxmFj5.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

</script>
</head>
<body>
<form name="myForm" method="post" enctype="multipart/form-data">
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="leftinfo1">
				<div class="itab">
					<ul>
						<li>
							<a href="###" onclick="goZsxxAdd1()">证书信息
							<c:if test="${not empty zsID}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty zsID}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if>
							</a>
						</li>
						<li><a href="###" onclick="goZsxxAdd2()" >用海方式
							<c:if test="${not empty yhxmyhfsList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmyhfsList }">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if></a>
						</li>
						<li><a href="###" onclick="goZsxxAdd3()" >海域使用金
							<c:if test="${not empty yhxmsyjList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmsyjList}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if></a>
						</li>
						<li><a href="###" onclick="goZsxxAdd4()" >宗海图
							<c:if test="${not empty yhxmzhtList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmzhtList}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if></a>
						</li>
						<li><a href="###" onclick="goZsxxAdd5()" class="selected">申请材料
							<c:if test="${not empty yhxmsqclList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmsqclList}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if></a>
						</li>
						<li><a href="###" onclick="goZsxxAdd6()">地图定位
							<c:if test="${not empty yhxmyhfsjzdList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmyhfsjzdList}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if></a>
						</li>
					</ul>
				</div>
				
			<div id="tab9" class="tabson" >
			<input name="xmID" id="xmID" value="${xmID }" type="hidden" />
			<input name="zsID" id="zsID" value="${zsID }" type="hidden" />
			<input name="hysyywHysydtYhxmXmfj.xmid" id="hysyywHysydtYhxmXmfj.xmid" value="${xmID }" type="hidden" />
			<input name="hysyywHysydtYhxmXmfj.zsid" id="hysyywHysydtYhxmXmfj.zsid" value="${zsID }" type="hidden" />
			<input name="xmfjID" id="xmfjID" value="" type="hidden" />
			<input name="fileName" id="fileName" value="" type="hidden" />
	
			<table class="tablelist" style="width:98%;border: solid 1px #c7c7c7;" align="center">
						<thead>
						<tr style="border: solid 1px #c7c7c7;" >
							<th width="4%">序号</th>
							<th width="12%">附件名称</th>
							<th width="10%">附件类型</th>
							<th width="12%">附件</th>
							<!-- 
							<th width="10%">文件类型</th><td>${r.wjlx }</td>
							 -->
							<th width="8%">文件大小</th>
							<th width="8%">上传人</th>
							<th width="13%">上传时间</th>
							<th width="12%">操作</th>
						</tr>
						</thead>
						<c:forEach items="${ yhxmsqclList }" var="r" varStatus="j">
						<tr>
							<td>${ j.count }</td>
							<td>${r.fjmc }</td>
							<td>${r.fjlxmc }</td>
							<td>${r.fj }</td>
							
							<td>${r.wjdx }KB</td>
							<td>${r.scr }</td>
							<td>${r.scsj }</td>
							<td>
							<a href="###" onclick="goDetail('${r.fjmc }','${r.fjlxmc }','${r.fj }','${r.wjlx }','${r.wjdx }','${r.scr }','${r.scsj }','${r.bz }','${r.lastupdatetime }')" class="tablelink">详情</a>
							<a href="###" onclick="downloadXmfj('${r.fj }')" class="tablelink">下载</a>
							<a href="###" onclick="updateXmfj('${r.id }','${r.addtime }','${r.lastupdatetime }','${r.addusername }','${r.adduserid }','${r.xmid }','${r.fjmc }','${r.fjlx }','${r.fj }','${r.wjlx }','${r.wjdx }','${r.scr }','${r.scsj }','${r.bz }','${r.fjlj }')" class="tablelink">修改</a>
							<a href="###" onclick="deleteXmfj('${r.id }')" class="tablelink">删除</a>
							</td>
						</tr>
						</c:forEach>
						<tr>
							<td colspan="8" style="text-align:center;">
								<input name="add" type="button" class="scbtn" onclick="goAdd()" value="新增" />
							</td>
						</tr>
					</table><br />
					
				<div class="leftinfo" id="leftinfoDiv1" style="display:none;">
					<div class="listtitle"><img src="${contextPath}/images/ico04.png" width="20" height="20" />上传附件</div>
					<table class="tableXQ" width="100%">
						<tr>
							<td width="20%" style="background-color:#f5f8fa;">附件名称：</td>
							<td width="60%" >
							<input name="hysyywHysydtYhxmXmfj.fjmc" id="hysyywHysydtYhxmXmfj.fjmc" type="text" value="" style="width:400px;" />
							<font color="red">*</font>
							</td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">附件类型：</td>
							<td>
								<select name="hysyywHysydtYhxmXmfj.fjlx" id="Afjlx" style="width:180px;">
									<option value="">--请选择--</option>
								</select><font color="red">*</font>
							</td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">上传附件：</td>
							<td>
								<input name="upload" type="file" value="" style="width:400px;" />
								<font color="red">*</font>
							</td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">备注：</td>
							<td><textarea name="hysyywHysydtYhxmXmfj.bz" id="hysyywHysydtYhxmXmfj.bz" cols="60" rows="4"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:center;">
							<input name="bc" type="button" class="scbtn" onclick="saveFj()" value="保存" />
							<input name="cz" type="reset" class="scbtn"  value="重置" />
							<input name="qx" type="button" class="scbtn" onclick="noOpen()" value="取消" />
							
							</td>
						</tr>
					</table>
					</div>
					
					
					<div class="leftinfo" id="leftinfoDiv2" style="display:none;">
					<div class="listtitle"><img src="${contextPath}/images/i02.png" width="20" height="20" />附件详情</div>
					<table class="tableXQ" width="100%">
						<tr>
						<!-- fjmc,fjlx,fj,wjlx,wjdx,scr,scsj,bz,lastupdatetime -->
							<td width="20%" style="background-color:#f5f8fa;">附件名称：</td>
							<td width="30%" ><span id="fjmc"></span></td>
							<td width="20%" style="background-color:#f5f8fa;">附件类型：</td>
							<td width="30%"><span id="fjlx"></span></td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">附件：</td>
							<td><span id="fj"></span></td>
							<td style="background-color:#f5f8fa;">文件类型：</td>
							<td><span id="wjlx"></span></td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">文件大小（KB）：</td>
							<td><span id="wjdx"></span></td>
							<td style="background-color:#f5f8fa;">上传人：</td>
							<td><span id="scr"></span></td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">上传时间：</td>
							<td><span id="scsj"></span></td>
							<td style="background-color:#f5f8fa;">最后修改时间：</td>
							<td><span id="lastupdatetime"></span></td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">备注：</td>
							<td colspan="3"><span id="bz"></span></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align:center;">
								<input name="qx" type="button" class="scbtn" onclick="noOpen()" value="取消" />
							</td>
						</tr>
					</table>
					</div>
					
					
					<div class="leftinfo" id="leftinfoDiv3" style="display:none;">
					<div class="listtitle"><img src="${contextPath}/images/ico04.png" width="20" height="20" />附件修改</div>
					
					
					<table class="tableXQ" width="100%">
						<tr>
							<td width="20%" style="background-color:#f5f8fa;">附件名称：</td>
							<td width="60%" >
							<input name="hysyywHysydtYhxmXmfjU.fjmc" id="hysyywHysydtYhxmXmfjU.fjmc" type="text" value="" style="width:400px;" />
							<font color="red">*</font>
							</td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">附件类型：</td>
							<td>
								<select name="hysyywHysydtYhxmXmfjU.fjlx" id="Ufjlx" style="width:180px;">
									<option value="">--请选择--</option>
								</select><font color="red">*</font>
								
							</td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">旧附件：</td>
							<td>
							<input name="hysyywHysydtYhxmXmfjU.fj" id="hysyywHysydtYhxmXmfjU.fj" type="hidden" value="" />
							<span id="fjU"></span>
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
							<td><textarea name="hysyywHysydtYhxmXmfjU.bz" id="hysyywHysydtYhxmXmfjU.bz" cols="60" rows="4"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:center;">
							<input name="bc" type="button" class="scbtn" onclick="updateFj()" value="修改" />
							<input name="qx" type="button" class="scbtn" onclick="noOpen()" value="取消" />
							</td>
						</tr>
					</table>
					<input name="hysyywHysydtYhxmXmfjU.id" id="hysyywHysydtYhxmXmfjU.id" type="hidden" value="" />
					<input name="hysyywHysydtYhxmXmfjU.addtime" id="hysyywHysydtYhxmXmfjU.addtime" type="hidden" value="" />
					<input name="hysyywHysydtYhxmXmfjU.lastupdatetime" id="hysyywHysydtYhxmXmfjU.lastupdatetime" type="hidden" value="" />
					<input name="hysyywHysydtYhxmXmfjU.addusername" id="hysyywHysydtYhxmXmfjU.addusername" type="hidden" value="" />
					<input name="hysyywHysydtYhxmXmfjU.adduserid" id="hysyywHysydtYhxmXmfjU.adduserid" type="hidden" value="" />
					<input name="hysyywHysydtYhxmXmfjU.xmid" id="hysyywHysydtYhxmXmfjU.xmid" type="hidden" value="" />
					
					<input name="hysyywHysydtYhxmXmfjU.wjlx" id="hysyywHysydtYhxmXmfjU.wjlx" type="hidden" value="" />
					<input name="hysyywHysydtYhxmXmfjU.wjdx" id="hysyywHysydtYhxmXmfjU.wjdx" type="hidden" value="" />
					<input name="hysyywHysydtYhxmXmfjU.scr" id="hysyywHysydtYhxmXmfjU.scr" type="hidden" value="" />
					<input name="hysyywHysydtYhxmXmfjU.scsj" id="hysyywHysydtYhxmXmfjU.scsj" type="hidden" value="" />
					<input name="hysyywHysydtYhxmXmfjU.fjlj" id="hysyywHysydtYhxmXmfjU.fjlj" type="hidden" value="" />
					</div>
				
			</div>
		</div>
		</div>
	</div>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');

			
		</script>
		
</form>
</body>
</html>