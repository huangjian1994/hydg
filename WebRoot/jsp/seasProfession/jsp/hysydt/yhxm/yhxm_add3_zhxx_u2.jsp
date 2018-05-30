<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/dijit/themes/tundra/tundra.css" />
    <link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/esri/css/esri.css" />
	<script type="text/Javascript" src="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/init.js"></script>	

<script type="text/javascript">
//代码
$(document).ready(function(){
	var yhfsY=document.getElementById("yhfsY").value;
	getDictionary("用海方式","yhfs",yhfsY);

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
	document.getElementById("hysyywHysydtYhxmYhfs.id").value="";
	document.getElementById("hysyywHysydtYhxmYhfs.addtime").value="";
	document.getElementById("hysyywHysydtYhxmYhfs.lastupdatetime").value="";
	document.getElementById("hysyywHysydtYhxmYhfs.addusername").value="";
	document.getElementById("hysyywHysydtYhxmYhfs.adduserid").value="";
	document.getElementById("hysyywHysydtYhxmYhfs.xmid").value="";
	document.getElementById("hysyywHysydtYhxmYhfs.zsid").value="";
	
	document.getElementById("hysyywHysydtYhxmYhfs.bs").value="";
	document.getElementById("yhfs").value="";
	document.getElementById("hysyywHysydtYhxmYhfs.mj").value="";
	document.getElementById("hysyywHysydtYhxmYhfs.jtyt").value="";
	document.getElementById("xgButton").style.display="none";
	document.getElementById("bcButton").style.display="none";
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
	//新增用海方式
	function saveYhfs(){
		if(document.getElementById("hysyywHysydtYhxmYhfs.bs").value ==""){
			alert("标识不允许为空！");
			return false;
		}
		if(document.getElementById("yhfs").value ==""){
			alert("用海方式不允许为空！");
			return false;
		}
		if(document.getElementById("hysyywHysydtYhxmYhfs.mj").value ==""){
			alert("面积不允许为空！");
			return false;
		}
		document.myForm.action="<%=basePath%>/business/business_addYhfs.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	
	function getUpdate(id,addtime,lastupdatetime,addusername,adduserid,xmid,zsid,
			bs,yhfs,mj,jtyt){
		document.getElementById("hysyywHysydtYhxmYhfs.id").value=id;
		document.getElementById("hysyywHysydtYhxmYhfs.addtime").value=addtime;
		document.getElementById("hysyywHysydtYhxmYhfs.lastupdatetime").value=lastupdatetime;
		document.getElementById("hysyywHysydtYhxmYhfs.addusername").value=addusername;
		document.getElementById("hysyywHysydtYhxmYhfs.adduserid").value=adduserid;
		document.getElementById("hysyywHysydtYhxmYhfs.xmid").value=xmid;
		document.getElementById("hysyywHysydtYhxmYhfs.zsid").value=zsid;
		
		document.getElementById("hysyywHysydtYhxmYhfs.bs").value=bs;
		document.getElementById("yhfs").value=yhfs;
		document.getElementById("hysyywHysydtYhxmYhfs.mj").value=mj;
		document.getElementById("hysyywHysydtYhxmYhfs.jtyt").value=jtyt;
		document.getElementById("xgButton").style.display="";
		document.getElementById("bcButton").style.display="none";
	}

	//用海方式-详情
	function getDetaile(id,addtime,lastupdatetime,addusername,adduserid,xmid,zsid,
			bs,yhfs,mj,jtyt){
		document.getElementById("hysyywHysydtYhxmYhfs.id").value=id;
		document.getElementById("hysyywHysydtYhxmYhfs.addtime").value=addtime;
		document.getElementById("hysyywHysydtYhxmYhfs.lastupdatetime").value=lastupdatetime;
		document.getElementById("hysyywHysydtYhxmYhfs.addusername").value=addusername;
		document.getElementById("hysyywHysydtYhxmYhfs.adduserid").value=adduserid;
		document.getElementById("hysyywHysydtYhxmYhfs.xmid").value=xmid;
		document.getElementById("hysyywHysydtYhxmYhfs.zsid").value=zsid;
		
		document.getElementById("hysyywHysydtYhxmYhfs.bs").value=bs;
		document.getElementById("yhfs").value=yhfs;
		document.getElementById("hysyywHysydtYhxmYhfs.mj").value=mj;
		document.getElementById("hysyywHysydtYhxmYhfs.jtyt").value=jtyt;
		document.getElementById("xgButton").style.display="none";
		document.getElementById("bcButton").style.display="none";
	}
	
	//用海方式-修改
	function updateYhfs(){
		if(document.getElementById("hysyywHysydtYhxmYhfs.bs").value ==""){
			alert("标识不允许为空！");
			return false;
		}
		if(document.getElementById("yhfs").value ==""){
			alert("用海方式不允许为空！");
			return false;
		}
		if(document.getElementById("hysyywHysydtYhxmYhfs.mj").value ==""){
			alert("面积不允许为空！");
			return false;
		}
		document.myForm.action="<%=basePath%>/business/business_updateYhxmYhfs.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	//用海方式-删除
	function deleteYhfs(yhfsID){
		if(confirm("确定删除该记录吗？")){
		document.getElementById("yhfsID").value = yhfsID;
		document.myForm.action="<%=basePath%>/business/business_deleteYhxmYhfs.do";
		document.myForm.target="_self";
		document.myForm.submit();
		}
	}

	//保存界址点坐标
	function saveYhfsJzd(){
		//校验
		var tab = document.getElementById("jzdTable");
		//表格行数
	    var rows = tab.rows.length ;
	    var mess = "null";
		for(var i = 1; i <rows-2 ; i++){
			var jzdXhN = "jzdXh"+i;
			var jzdJdN = "jzdJd"+i;
			var jzdWdN = "jzdWd"+i;
			if(document.getElementById(jzdXhN).value == ""){
				mess = "第"+(i)+"个序号不允许为空。";
				break;
			} 
			if(document.getElementById(jzdJdN).value == ""){
				mess = "第"+(i)+"个经度不允许为空。";
				break;
			}
			if(document.getElementById(jzdWdN).value == ""){
				mess = "第"+(i)+"个纬度不允许为空。";
				break;
			}
		}	
		if(mess != "null"){
			alert(mess);
			return false;
		}
		
		document.myForm.action="<%=basePath%>/business/business_saveJzdzb.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	//删除界址点坐标
	function deleteJzd(jzdID){
		if(confirm("确定删除该记录吗？")){
		document.myForm.action="<%=basePath%>/business/business_deleteYhxmJdzzb.do?jzdID="+jzdID;
		document.myForm.target="_self";
		document.myForm.submit();
		}
	}


	//新建/修改
	function addJzd(){
		var row_index1 =jzdTable.rows.length-2;
	    var new_row=jzdTable.insertRow(jzdTable.rows.length-2);  
	    //alert(row_index1);
	    new_row.setAttribute("id", "row"+row_index1);   
	    var new_col=new_row.insertCell(0);
	    new_col.innerHTML=row_index1+"<input name='jzdXh' id='jzdXh"+row_index1+"' type='text' value='' style='width:80px;' />";  

	    var new_col=new_row.insertCell(1);
	    new_col.innerHTML="<input name='jzdWd' id='jzdWd"+row_index1+"' type='text' value='' style='width:80px;'/>";   
	    
	    var new_col=new_row.insertCell(2);
	    new_col.innerHTML="<input name='jzdJd' id='jzdJd"+row_index1+"' type='text' value='' style='width:80px;'/>";
	    var new_col=new_row.insertCell(3);
	    new_col.innerHTML="<a href='###' onclick=\"deleteRow('row"+row_index1+ "')\" ><img src='${contextPath}/images/close.png' height='15px' /></a>";  
	    new_col.innerHTML+="<a href='###' onclick=\"goUp('"+row_index1+"')\" ><img src='${contextPath}/images/UP.png' height='15px' /></a><a href='###'  onclick=\"goDown('"+row_index1+"')\"><img src='${contextPath}/images/DOWN.png' height='15px' /></a>";  
    }  

	function deleteRow(a){
		o=document.getElementById(a);
		o.parentNode.removeChild(o);
	}

	
	function goUp(rowIndex){
		if(rowIndex != "1"){
			var rowIndex2 = rowIndex-1;
			//alert("rowIndex="+rowIndex+",rowIndex2="+rowIndex2);
			var jzdJdN1 = "jzdJd"+rowIndex;
			var jzdWdN1 = "jzdWd"+rowIndex;
			var jzdWd1 = document.getElementById(jzdWdN1).value;
			var jzdJd1 = document.getElementById(jzdJdN1).value;
	
			var jzdJdN2 = "jzdJd"+rowIndex2;
			var jzdWdN2 = "jzdWd"+rowIndex2;
			var jzdWd2 = document.getElementById(jzdWdN2).value;
			var jzdJd2 = document.getElementById(jzdJdN2).value;
			//alert("jzdWd1="+jzdWd1+",jzdJd1="+jzdJd1);
			//alert("jzdWd2="+jzdWd2+",jzdJd2="+jzdJd2);

			document.getElementById(jzdWdN1).value=jzdWd2;
			document.getElementById(jzdJdN1).value=jzdJd2;

			document.getElementById(jzdWdN2).value=jzdWd1;
			document.getElementById(jzdJdN2).value=jzdJd1;
		}
	}

	function goDown(rowIndex){
		var tableHs =jzdTable.rows.length;
		tableHs = tableHs-2;
		//alert(tableHs);
		if(tableHs!=rowIndex){
			
		var rowIndex1=rowIndex;
		var rowIndex2 = ++rowIndex1;
		
		//alert("rowIndex="+rowIndex+",rowIndex2="+rowIndex2);
		var jzdJdN1 = "jzdJd"+rowIndex;
		var jzdWdN1 = "jzdWd"+rowIndex;
		var jzdWd1 = document.getElementById(jzdWdN1).value;
		var jzdJd1 = document.getElementById(jzdJdN1).value;

		var jzdJdN2 = "jzdJd"+rowIndex2;
		var jzdWdN2 = "jzdWd"+rowIndex2;
		var jzdWd2 = document.getElementById(jzdWdN2).value;
		var jzdJd2 = document.getElementById(jzdJdN2).value;
		//alert("jzdWd1="+jzdWd1+",jzdJd1="+jzdJd1);
		//alert("jzdWd2="+jzdWd2+",jzdJd2="+jzdJd2);

		document.getElementById(jzdWdN1).value=jzdWd2;
		document.getElementById(jzdJdN1).value=jzdJd2;

		document.getElementById(jzdWdN2).value=jzdWd1;
		document.getElementById(jzdJdN2).value=jzdJd1;

		}
		
	}
	//下载模板
	function downloadYhfsJzdMb(){
		document.myForm.action="<%=basePath%>/business/business_downLoadYhfsJzdmb.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	//上传
	function uploadYhfsJdz(){
		//校验
		var filename=document.myForm.upload.value;
		if(filename==""){
			alert("请先上传文件！");
			return false;
		}
		var hz1=filename.substring(filename.length-4,filename.length);
		if (hz1!=".xls"){
			alert("请上传2003版本的Excel！！"); 				
		    return false; 
		}
		document.myForm.action="<%=basePath%>/business/business_uploadYhfsJzdData.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}


	//异步获取界址点坐标
	function getJzd(){
		var xmID = document.getElementById("xmID").value;
		var zsID = document.getElementById("zsID").value;
		$.ajax({		  		
			type: "post",
			dataType:"json",
			url: "${contextPath}/business/business_getYhfsJzd.do",
			data: "xmID="+xmID+"&zsID="+zsID,
			success: function(d){
				alert(d);
				for(var i=0;i<d.length;i++){
					if(i==0){
					alert("序号="+d[i].xh+"，北纬="+d[i].wd+"，东经="+d[i].jd);
					}
				}
			}
		});	  
	}
</script>
</head>
<body>
<form name="myForm"  method="post" enctype="multipart/form-data" >
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
						<li><a href="###" onclick="goZsxxAdd2()" class="selected" >用海方式
							<c:if test="${not empty yhxmyhfsList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmyhfsList }">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if></a>
						</li>
						<li><a href="###" onclick="goZsxxAdd3()">海域使用金
							<c:if test="${not empty yhxmsyjList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmsyjList}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if></a>
						</li>
						<li><a href="###" onclick="goZsxxAdd4()">宗海图
							<c:if test="${not empty yhxmzhtList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmzhtList}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if></a>
						</li>
						<li><a href="###" onclick="goZsxxAdd5()">申请材料
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
			<input name="yhfsID" id="yhfsID" value="" type="hidden" />
			<!-- 
			<input name="jzdNum" id="jzdNum" value="<s:property value="yhxmyhfsjzdList.size()" />" type="text" />
			 -->
				<div style="height: auto;float:left; width:100%;">
				<div class="yhfslb" style="height: auto;float:left;width:49%;">
					<p><span></span>用海方式列表</p>
				<table class="tablelist" width="95%">
					<tr>
						<th width="5%">序号</th>
						<th width="6%">标识</th>
						<th width="20%">用海方式</th>
						<th width="10%">面积</th>
						<th width="10%">操作</th>
						<!--  <th width="20%">具体用途</th><td>${r.jtyt }</td>
						-->
					</tr>
					<c:forEach items="${ yhxmyhfsList }" var="r" varStatus="j">
					<tr>
						<td>${ j.count }</td>
						<td>${r.bs }</td>
						<td><a href="###" onclick="getDetaile('${r.id }','${r.addtime }','${r.lastupdatetime }','${r.addusername }','${r.adduserid }','${r.xmid }','${r.zsid }','${r.bs }','${r.yhfs }','${r.mj }','${r.jtyt }')" class="tablelink">
							${r.yhfsmc }</a></td>
						<td>${r.mj }公顷<!-- 公顷 getDetaile--></td>
						<td>
							<a href="###" onclick="getUpdate('${r.id }','${r.addtime }','${r.lastupdatetime }','${r.addusername }','${r.adduserid }','${r.xmid }','${r.zsid }','${r.bs }','${r.yhfs }','${r.mj }','${r.jtyt }')" class="tablelink">修改</a>
							<a href="###" onclick="deleteYhfs('${r.id }')" class="tablelink">删除</a>
						</td>
					</tr>
					</c:forEach>
				</table>
				</div>
				<div class="sxxx" style="height: auto;float:right;width:49%;">
					<p><span></span>属性信息</p>
					<table class="tableXQ" width="100%">
						<tr>
							<td style="text-align:left;background-color:#f5f8fa;">标识：</td>
							<td style="text-align:left;">
							<input name="hysyywHysydtYhxmYhfs.bs" id="hysyywHysydtYhxmYhfs.bs" type="text" value="${hysyywHysydtYhxmYhfs.bs }" style="width:180px;" /><font color="red">*</font>
							</td>
						</tr>
						<tr>
							<td width="20%" style="text-align:left;background-color:#f5f8fa;">用海方式：</td>
							<td width="70%" style="text-align:left;">
								<select name="hysyywHysydtYhxmYhfs.yhfs" id="yhfs" style="width:180px;">
									<option value="">-请选择-</option>
								</select><font color="red">*</font>
								<input name="yhfsY" id="yhfsY" type="hidden" value="${hysyywHysydtYhxmYhfs.yhfs }" style="width:180px;" />
							</td>
						</tr>
						
						<tr>
							<td style="text-align:left;background-color:#f5f8fa;">面积：</td>
							<td style="text-align:left;">
								<input name="hysyywHysydtYhxmYhfs.mj" id="hysyywHysydtYhxmYhfs.mj" class="NumDecText" type="text" value="${hysyywHysydtYhxmYhfs.mj }" style="width:180px;" />
								公顷<font color="red">*</font>
								<input name="hysyywHysydtYhxmYhfs.mjdw" id="hysyywHysydtYhxmYhfs.mjdw" type="hidden" value="3" style="width:180px;" />
							</td>
						</tr>
						<tr>
							<td style="text-align:left;background-color:#f5f8fa;">具体用途：</td>
							<td style="text-align:left;">
							<textarea name="hysyywHysydtYhxmYhfs.jtyt" id="hysyywHysydtYhxmYhfs.jtyt" cols="30" rows="2" >${hysyywHysydtYhxmYhfs.jtyt }</textarea></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:center;">
							<span id="bcButton">
								<input name="bc"  type="button" class="scbtn1" onclick="saveYhfs()" value="保存" />
								<input name="cz" type="reset" class="scbtn1"  value="重置" />
							</span>
							<span id="xgButton" style="display:none;">	
								<input name="xg" id="" type="button" class="scbtn1" onclick="updateYhfs()" value="修改" />
							</span>
								<input name="hysyywHysydtYhxmYhfs.id" id="hysyywHysydtYhxmYhfs.id" type="hidden" value="" />
								<input name="hysyywHysydtYhxmYhfs.addtime" id="hysyywHysydtYhxmYhfs.addtime" type="hidden" value="" />
								<input name="hysyywHysydtYhxmYhfs.lastupdatetime" id="hysyywHysydtYhxmYhfs.lastupdatetime" type="hidden" value="" />
								<input name="hysyywHysydtYhxmYhfs.addusername" id="hysyywHysydtYhxmYhfs.addusername" type="hidden" value="" />
								<input name="hysyywHysydtYhxmYhfs.adduserid" id="hysyywHysydtYhxmYhfs.adduserid" type="hidden" value="" />
								<input name="hysyywHysydtYhxmYhfs.xmid" id="hysyywHysydtYhxmYhfs.xmid" type="hidden" value="" />
								<input name="hysyywHysydtYhxmYhfs.zsid" id="hysyywHysydtYhxmYhfs.zsid" type="hidden" value="" />
					
							</td>
						</tr>
					</table>
				</div>
				
				<br /><br />
				
				
				
				</div>
				
				
				<div style="height: auto;float:left; width:100%;" >
				<div class="yhsyt" style="height: auto;float:left;width:49%;margin-top: 10px;">
					<p><span></span>用海示意图</p>
					<div id="mapFS"></div>
					<!-- 图片 
					<input name="ybhq"  type="button" class="scbtn1" onclick="getJzd()" value="异步获取" />
					-->
				</div>
				
				<div class="jzdzb" style="height: auto;float:right;width:50%;margin-top: 10px;">
					<p><span></span>界址点坐标</p>
					
					<table width="100%" id="jzdTable" class="tablelist" style="text-align:center;">
						<tr>
							<th width="25%">序号</th>
							<th width="25%">北纬</th>
							<th width="25%">东经</th>
							<th width="15%">操作
							<a href="###" onclick="addJzd()">
							<img src="${contextPath}/images/t01.png" height="15px" title="新增" />
							</a>
							</th>
						</tr>
						<c:forEach items="${ yhxmyhfsjzdList }" var="r" varStatus="j">
						<tr>
							<td>${ j.count }<input name="jzdXh" id="jzdXh${ j.count }" type="text" value="${r.xh }" style="width:80px;" /></td>
							<td><input name="jzdWd" id="jzdWd${ j.count }" type="text" value="${r.wd }" style="width:80px;" /></td>
							<td><input name="jzdJd" id="jzdJd${ j.count }" type="text" value="${r.jd }" style="width:80px;" /></td>
							<td>
							<a href="###" onclick="deleteJzd('${r.id}')">
							<img src="${contextPath}/images/close1.png" height="15px" title="删除"/></a>
							<!--  -->
							<a href="###" onclick="goUp('${ j.count }')" ><img src="${contextPath}/images/UP.png" height="15px" /></a>
							
							<a href="###" onclick="goDown('${ j.count }')" ><img src="${contextPath}/images/DOWN.png" height="15px" /></a>
							
							</td>
						</tr>
						</c:forEach>
						<c:if test="${empty yhxmyhfsjzdList }">
							<tr>
							<td>
								1<input name="jzdXh" id="jzdXh1" type="text" value="" style="width:80px;" />
							</td>
							<td>
								<input name="jzdWd" id="jzdWd1" type="text" value="" style="width:80px;" />
							</td>
							<td>
								<input name="jzdJd" id="jzdJd1" type="text" value="" style="width:80px;" />
							</td>
							<td>
								<a href="###" onclick="goDown('1')" ><img src="${contextPath}/images/DOWN.png" height="15px" /></a>
							</td>
							</tr>
						</c:if>
						<tr>
							<td colspan="4">
								<input name="bc"  type="button" class="scbtn1" onclick="saveYhfsJzd()" value="保存" />
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<input name="upload" id="upload" type="file"  value="" />
								<input name="dr" type="button" class="scbtn1" onclick="uploadYhfsJdz()" value="导入" />
								<input name="mbxz" type="button" class="scbtn1" onclick="downloadYhfsJzdMb()" value="模板下载" />
								<br />
								请先清空再上传！
							</td>
						</tr>
						
						
					</table>
					<!-- 
							<br />
							<table class="tableXQ" width="100%">
								<tr>
									<td style="background-color:#f5f8fa;">显示格式：</td>
									<td style="background-color:#ffffff;">
									<input type="radio" name="check" class="checkbox" checked="checked" />度分秒方式显示
									<br />
									<input type="radio" name="check" class="checkbox" />经度纬度值方式显示
									</td>
									<td style="background-color:#ffffff;">
									<input name="" type="button" class="scbtn1" onclick="" value="互换" />
									</td>
								</tr>
								<tr>
									<td style="background-color:#f5f8fa;">导出：</td>
									<td style="background-color:#ffffff;">
									<select name="" id="" style="width:150px;">
										<option value="">请选择导出坐标串格式</option>
									</select>
									</td>
									<td style="background-color:#ffffff;">
									<input name="" type="button" class="scbtn1" onclick="" value="导出" />
									</td>
								</tr>
							</table>
							 -->
					
				</div>
				</div>
				
				&nbsp;
			
			</div>

			

		</div>
		</div>
	</div>


		

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');

		</script>

		<script type="text/javascript" src="${contextPath}/js/seasProfession/zhxxDFS.js"></script>
</form>
</body>
</html>