<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用海项目</title>
	<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">	
//代码
$(document).ready(function(){
	var xmwzY=document.getElementById("xmwzY").value;
	var ztY=document.getElementById("ztY").value;
	
	getDictionary("项目位置","xmwz",xmwzY);
	getDictionary("项目状态","zt",ztY);

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

	//查询
	function search(){
		document.myForm.action="<%=basePath%>/business/business_fetchYhxm.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	//重置
	function resert(){
		document.getElementById("yhxmmc").value ="";
		document.getElementById("xmwz").value ="";
		document.getElementById("slrq").value ="";
		document.getElementById("zt").value ="";
	}

	//详情
	function detaileXmxx(xmID){
		document.getElementById("xmID").value = xmID;
		document.myForm.action="<%=basePath%>/business/business_fetchYhxmDetaile.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	function detaileXmxxYb(xmID){
		//alert(xmID);
		$.ajax({		  		
			type: "post",
			dataType:"json",
			url: "${contextPath}/business/business_getYhxmDetail.do",
			data: "xmID="+xmID,
			success: function(d){
				//alert(d);
				for(var i=0;i<d.length;i++){
					if(i==0){
						alert("主键="+d[i][0]+"，用海项目名称="+d[i][1]+"，项目位置="+d[i][2]+"，用海总面积="+d[i][3]+d[i][4]+"，海域等别="+d[i][5]+"，受理日期="+d[i][6]+"，用海批准日期="+d[i][7]+"，海域使用权人="+d[i][8]);
					}
				}
			}
		});
		
	}
	//删除
	function deleteXmxx(xmID){
		if(confirm("确定删除该记录吗？")){
			document.getElementById("xmID").value = xmID;
			document.myForm.action="<%=basePath%>/business/business_deleteYhxm.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}
	}

	//修改
	function updateXmxx(xmID){
		if(confirm("确定修改该记录吗？")){
			document.getElementById("xmID").value = xmID;
			document.myForm.action="<%=basePath%>/business/business_getYhxmDetaile.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}
	}

	//全选
	function checkAll(){
		var cb = document.getElementById("cb");
		var chks = document.getElementsByName("chk");
		if(cb.checked==true){
			for(var i=0;i<chks.length;i++){
				chks[i].checked=true;
			}
		}else{
			for(var i=0;i<chks.length;i++){
				chks[i].checked=false;
			}
		}
	}

	function ceshi(){
		document.myForm.action="<%=basePath%>/business/business_chaoshi.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
</script>
</head>
<body>
<form name="myForm" method="post" >
	<div class="place" >
		<span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">海域使用动态管理</a></li>
			<li><a href="#">用海项目信息管理</a></li>
		</ul>
	</div>
	<input name="xmID" id="xmID" value="" type="hidden" />
	
	<div class="formbody" >
		<div class="leftinfo1">
			<div class="listtitle3"><img src="${contextPath}/images/ico06.png" width="25" height="25" />条件查询</div>
			<table width="100%" align="center" style="text-align:center;">
				<tr>
					<td style="height:35px;">用海项目名称：</td>
					<td><input name="hysyywHysydtYhxm.yhxmmc" id="yhxmmc" value="${hysyywHysydtYhxm.yhxmmc }"  type="text"  style="width:180px;" /></td>
					<td>项目位置：</td>
					<td>
					<select name="hysyywHysydtYhxm.xmwz" id="xmwz" style="width:180px;">
							<option value="">-请选择-</option>
					</select>
					<input name="xmwzY" id="xmwzY" type="hidden" value="${hysyywHysydtYhxm.xmwz }" style="width:200px;" />
					</td>
				</tr>
				<tr style="height:35px;">
					<td>受理日期：</td>
					<td><input name="hysyywHysydtYhxm.slrq" id="slrq" value="${hysyywHysydtYhxm.slrq }"  onclick="WdatePicker()" readonly="readonly" type="text"  style="width:180px;" /></td>
					<td>状态：</td>
					<td>
						<select name="hysyywHysydtYhxm.zt" id="zt" style="width:180px;">
							<option value="">-请选择-</option>
						</select>
						<input name="ztY" id="ztY" type="hidden" value="${hysyywHysydtYhxm.zt }" style="width:200px;" />
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<input name="查询" type="button" class="scbtn" value="查询" onclick="search()" />
						<input name="重置" type="button" class="scbtn" value="重置" onclick="resert()" />
					<!-- 
					<input name="cs" type="button" class="scbtn" value="测试" onclick="ceshi()" />
						 -->
					</td>
				</tr>
			</table>
		</div><br />
	
	
	<div class="tools">
		<ul class="toolbar">
			<li>
				<a href="${contextPath}/jsp/seasProfession/jsp/hysydt/yhxm/yhxm_add.jsp">
				<span><img src="${contextPath}/images/t01.png" /></span>新增</a>
			</li>
			<!-- 
			<li><a href="xg.jsp"><span><img src="${contextPath}/images/t02.png" /></span>修改</a></li>
			<li><a href="javascript:deleteZdclCljd();"><span><img src="${contextPath}/images/t03.png" /></span>删除</a></li>
			 -->
		</ul>
	</div>
	
		<table class="tablelist">
			<thead>
				<tr>
					<!-- 
					<th><input type="checkbox" id ="cb" onclick="checkAll()" style="border:0;"/></th>
					<td><input type="checkbox" name="chk" id="chk${ j.count }" value="" style="border:0;"/></td>
					 -->
					<th>序号</th>
					<th>用海项目名称</th>
					<th>海域使用权人</th>
					<th>项目位置</th>
					<th>证书数量</th>				
					<th>用海总面积（公顷）</th>
					<th>受理日期</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ yhxmList }" var="r" varStatus="j">
				<tr>
					<td>${ j.count }</td>
					<td>${r[1] }</td>
					<td>${r[2] }</td>
					<td>${r[3] }</td>
					<td>${r[4] }</td>
					<td>${r[5] }</td>
					<td>${r[6] }</td>
					<td>${r[7] }</td>
					<td>
						<a href="###" onclick="detaileXmxx('${r[0] }')" class="tablelink">详情</a>&nbsp;
						<!-- 
						<a href="###" onclick="detaileXmxxYb('${r[0] }')" class="tablelink">详情json</a>&nbsp;
						 -->
						<a href="###" onclick="updateXmxx('${r[0] }')" class="tablelink">修改</a>&nbsp;
						<a href="###" onclick="deleteXmxx('${r[0] }')" class="tablelink">删除</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
</div>
</form>

	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>

<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
</body>
</html>