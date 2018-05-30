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
	//var yhfs_ej=document.getElementById("yhfsY").value;
	getDictionary("用海方式","yhfs_ej","");

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


//保存
function addHysyj(){
	document.myForm.action="<%=basePath%>/business/business_saveHysyj.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//修改
function updateHysyj(){
	document.myForm.action="<%=basePath%>/business/business_updateHysyj.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//删除
function deleteHysyj(hysyjID){
	if(confirm("确定删除该记录吗？")){
		document.getElementById("hysyjID").value = hysyjID;
		document.myForm.action="<%=basePath%>/business/business_deleteHysyj.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
}


</script>
</head>
<body>
<form name="myForm" method="post" >
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
						<li><a href="###" onclick="goZsxxAdd5()" >申请材料
							<c:if test="${not empty yhxmsqclList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmsqclList}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if></a>
						</li>
						<li><a href="###" onclick="goZsxxAdd6()" class="selected">地图定位
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
			
				<div id ="mapDW" style="height:600px"></div>
				
			</div>
		</div>
		</div>
	</div>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		<script type="text/javascript" src="${contextPath}/js/seasProfession/zhxxDDW.js"></script>
		
</form>
</body>
</html>