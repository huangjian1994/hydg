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
//新建/修改
function addJzd(){
	var row_index1 =jzdTable.rows.length-1;
    var new_row=jzdTable.insertRow(jzdTable.rows.length-1);  
    new_row.setAttribute("id", "row"+row_index1);   
    var new_col=new_row.insertCell(0);
    new_col.innerHTML=row_index1+"<input name='jzdXh' id='jzdXh"+row_index1+"' type='text' value='' style='width:120px;' />";  
    
    var new_col=new_row.insertCell(1);
    new_col.innerHTML="<input name='jzdWd' id='jzdWd"+row_index1+"' type='text' value='' style='width:200px;'/>";   
    var new_col=new_row.insertCell(2);
    new_col.innerHTML="<input name='jzdJd' id='jzdJd"+row_index1+"' type='text' value='' style='width:200px;'/>";
    var new_col=new_row.insertCell(3);
    new_col.innerHTML="<a href='###' onclick=\"deleteRow('row"+row_index1+ "')\" ><img src='${contextPath}/images/close.png' height='15px' /></a>";  
    
}  

 function deleteRow(a){
	o=document.getElementById(a);
	o.parentNode.removeChild(o);
}  

	//保存界址点坐标
	function saveJgxxJzd(){
		//校验
		var tab = document.getElementById("jzdTable");
		//表格行数
	    var rows = tab.rows.length ;
	    var mess = "null";
		for(var i = 1; i <rows-1 ; i++){
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
		document.myForm.action="<%=basePath%>/business/business_saveJcrwJzdzb.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	//删除界址点坐标
	function deleteJzd(jzdID){
		if(confirm("确定删除该记录吗？")){
		document.myForm.action="<%=basePath%>/business/business_deleteJcrwJdzzb.do?jzdID="+jzdID;
		document.myForm.target="_self";
		document.myForm.submit();
		}
	}
</script>
	</head>

	<body>
<form name="myForm" method="post" >
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
								<a href="###" onclick="goAdd2()" class="selected">监测范围
								<c:if test="${not empty yhxmyhfsjzdList}">
								<img src="${contextPath}/images/t02.png" width="15" height="15"/>
								</c:if>
								<c:if test="${empty yhxmyhfsjzdList}">
								<img src="${contextPath}/images/t03.png" width="15" height="15"/>
								</c:if>
								</a>
							</li>
							<li>
								<a href="###" onclick="goAdd3()">监测附件
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
			
				
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/ico02.png" width="20" height="20" />界址点坐标</div>
				<table width="90%" id="jzdTable" class="tablelist" style="text-align:center;">
						<!--
						<tr>
							<th colspan="4" style="text-align: left;">&nbsp;&nbsp;界址点坐标</th>
						</tr>
						  -->
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
							<td>${ j.count }<input name="jzdXh" id="jzdXh${ j.count }" type="text" value="${r.xh }" style="width:120px;" /></td>
							<td><input name="jzdWd" id="jzdWd${ j.count }" type="text" value="${r.wd }" style="width:200px;" /></td>
							<td><input name="jzdJd" id="jzdJd${ j.count }" type="text" value="${r.jd }" style="width:200px;" /></td>
							<td>
							<a href="###" onclick="deleteJzd('${r.id}')">
							<img src="${contextPath}/images/close1.png" height="15px" title="删除"/></a>
							<!-- 
							<a><img src="${contextPath}/images/UP.png" height="15px" /></a>
							
							<a><img src="${contextPath}/images/DOWN.png" height="15px" /></a>
							 -->
							</td>
						</tr>
						</c:forEach>
						<c:if test="${empty yhxmyhfsjzdList }">
							<tr>
							<td>
								1<input name="jzdXh" id="jzdXh1" type="text" value="" style="width:120px;" />
							</td>
							<td>
								<input name="jzdWd" id="jzdWd1" type="text" value="" style="width:200px;" />
							</td>
							<td>
								<input name="jzdJd" id="jzdJd1" type="text" value="" style="width:200px;" />
							</td>
							<td>
							</td>
							</tr>
						</c:if>
						<tr>
							<td colspan="4">
								<input name="bc" type="button" class="scbtn1" onclick="saveJgxxJzd()" value="保存" />
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