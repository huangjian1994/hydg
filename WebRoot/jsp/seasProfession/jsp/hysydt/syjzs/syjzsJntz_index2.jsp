<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
	
	<link href="${contextPath}/css/jQueryUI/jquery-ui-1.8.2.custom.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${contextPath}/js/jQueryUI/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/jQueryUI/jquery-ui-1.8.2.custom.min.js"></script>
	
	
<script type="text/javascript">
//代码
$(document).ready(function(){
	var yhxzY=document.getElementById("yhxzY").value;
	getDictionary("用海性质","yhxz",yhxzY);

	var jnfsY=document.getElementById("jnfsY").value;
	getDictionary("使用金缴纳方式","jnfs",jnfsY);

	//indexDialog();//预警
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
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchZhxxList2.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function resert(){
	document.getElementById("yhxmmc").value="";
	document.getElementById("hysyqr").value="";
	document.getElementById("hyglh").value="";
	document.getElementById("yhxz").value="";
	document.getElementById("jnfs").value="";
	document.getElementById("zt").value="";
}

//证书详情
function zsxxDetail(xmID,zsID){
	document.getElementById("xmID").value=xmID;
	document.getElementById("zsID").value=zsID;
	document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchZhxxDetailByHyglh.do";
	document.myForm.target="_blank";
	document.myForm.submit();
}
//项目详情
function xmxxDetail(xmID){
	document.getElementById("xmID").value=xmID;
	document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchYhxmDetaile.do";
	document.myForm.target="_blank";//_self
	document.myForm.submit();
}

function goJntz1(){
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchZhxxList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function goJntz2(){
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchZhxxList2.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//新增
function goJntzadd(){
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_goJntzaddJsp.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

//详情
function goJntzDetail(jntzID){
	document.getElementById("jntzID").value=jntzID;
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchJntzDetail.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//修改
function goUpdateJntz(jntzID){
	document.getElementById("jntzID").value=jntzID;
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_getJntzUpdate.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//删除
function goDeleteJntz(jntzID){
	if(confirm("确定删除该记录吗？")){
	document.getElementById("jntzID").value=jntzID;
	document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_deleteJntz.do";
	document.myForm.target="_self";
	document.myForm.submit();
	}
}
//预警
function indexDialog(){
	var indexNum = $("#indexNum").val();
	if(indexNum == "1"){
    	$.ajax({
			type : "post",
			dataType : "json",
			url : "${contextPath}/messagePrompt/messagePrompt_openDialog.do",
			success : function(data) {
				//alert(data[0]+"--"+data[1]);
				$("#yjsTotal").html(data[2]);
				//$("#yjsToday").html(data[1]);
				$("#dialog").dialog({
					modal: true,
				    width: 420,
				    height: 210,
				    buttons: {
				 		关闭: function() {
				        	$( this ).dialog( "close" );
				        }
				    }
				});
			}
		});
    }else{
    	$("#dialog").hide();
    }
}
</script>
	</head>

	<body>
<form name="myForm" method="post" >
<input type="hidden" id="indexNum" value="1" />

<input name="zsID" id="zsID" type="hidden" value="" />
<input name="xmID" id="xmID" type="hidden" value="" />
<input name="zsbh" id="zsbh" type="hidden" value="" />
<input name="jntzID" id="jntzID" type="hidden" value="" />
<input name="indexNum" id="indexNum" type="hidden" value="2" />

	<div class="place">
		<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">海域使用动态管理</a></li>
			<li>
				<a href="#">海域使用金征收管理</a>
			</li>
			<li>
				<a href="#">海域使用金缴纳通知</a>
			</li>
		</ul>
	</div>
	<div class="formbody" >
		<div id="usual1" class="usual" >
			<div class="leftinfo1">
				<div class="itab" >
					<ul>
						<li><a href="###" onclick="goJntz1()" >用海项目缴纳通知</a></li>
						<li><a href="###" onclick="goJntz2()" class="selected">缴纳通知记录</a></li>
					</ul>
				</div>
			
				<div class="listtitle"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
					<table width="100%" align="center" style="text-align:left;">
							<tr>
								<td>海域管理号：</td>
								<td><input name="searchForm.hyglh" id="hyglh" type="text" value="${searchForm.hyglh }" style="width:180px;" /></td>
								<td>项目名称：</td>
								<td><input name="searchForm.yhxmmc" id="yhxmmc" type="text" value="${searchForm.yhxmmc }" style="width:180px;" /></td>
								</tr>
							<tr>
								<td>用海性质：</td>
								<td>
									<select name="searchForm.yhxz" id="yhxz" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
									</select>
									<input name="yhxzY" id="yhxzY" type="hidden" value="${searchForm.yhxz }" />
								</td>
								<td>海域使用权人：</td>
								<td><input name="searchForm.hysyqr" id="hysyqr" type="text" value="${searchForm.hysyqr }" style="width:180px;" /></td>
							</tr>
							<tr>
								<td>使用金缴纳方式：</td>
								<td>
									<select name="searchForm.jnfs" id="jnfs" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
									</select>
									<input name="jnfsY" id="jnfsY" type="hidden" value="${searchForm.jnfs }" />
								</td>
								<td>状态：</td>
								<td>
									<select name="searchForm.zt" id="zt" style="width:180px;height:25px;">
										<option value="">-请选择-</option>
										<option value="已缴纳">已缴纳</option>
										<option value="未缴纳">未缴纳</option>
									</select>
									<input name="ztY" id="ztY" type="hidden" value="${searchForm.zt }" />
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<input name="查询" type="button" class="scbtn" value="查询" onclick="search()" />
									<input name="重置" type="button" class="scbtn" value="重置" onclick="resert()" />
									
									<input name="yj" type="button" class="scbtn" value="逾期提醒" onclick="indexDialog()" />
									
								</td>
							</tr>
						</table>
					</div><br />
						
				<div class="tools">
					<ul class="toolbar">
						<li>
							<a href="${contextPath}/jsp/seasProfession/jsp/hysydt/syjzs/syjzsJntz_add2.jsp"><span>
							<img src="${contextPath}/images/seasProfession/t01.png" /></span>新增</a>
						</li>
					</ul>
				</div>
				
				<table class="tablelist">
					<thead>
						<tr>
							<!-- 
							<th><input name="" type="checkbox" value="" style="border:0;"/></th>
							<td><input name="" type="checkbox" value="" style="border:0;"/></td>
							 -->
							<th>序号</th>
							<th>海域管理号</th>
							<th>项目名称</th>
							<th>用海性质</th>
							<th>海域使用权人</th>
							<th>使用金缴纳方式</th>
							<th>通知日期</th>
							<th>开户行</th>
							<th>状态</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${ zhxxList }" var="r" varStatus="j">
						<tr>
							<td>${ j.count }</td>
							<td><a href="#" onclick="zsxxDetail('${r[2] }','${r[1] }')" class="tablelink">${r[3] }</a></td>
							<td><a href="#" onclick="xmxxDetail('${r[2] }')" class="tablelink">${r[4] }</a></td>
							<td>${r[6] }</td>
							<td>${r[7] }</td>
							<td>${r[9] }</td>
							<td>
							<c:if test="${r[10] <todayDate && r[12]=='未缴纳' }">
							<font color="red">${r[10] }</font>
							</c:if>
							
							<c:if test="${r[12]=='已缴纳' }">
							${r[10] }
							</c:if>
							
							<c:if test="${r[10] >=todayDate && r[12]=='未缴纳' }">
							${r[10] }
							</c:if>
							
							</td>
							<td>${r[11] }</td>
							<td>${r[12] }</td>
							<td>
								<a href="###" onclick="goJntzDetail('${r[0] }')" class="tablelink">详情</a>
								<a href="###" onclick="goUpdateJntz('${r[0] }')" class="tablelink">修改</a>
								<c:if test="${r[12]=='未缴纳' }">
								<a href="###" onclick="goDeleteJntz('${r[0] }')" class="tablelink">删除</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				
			
		</div>
	</div>
	
	<div id="dialog" title="提示信息" style="display:none;">
	  <span style="font-size:18px;">
	  <img src="${contextPath}/images/gth.jpg" width="22" height="22" />
	    海域使用金逾期未缴纳：
	  </span>
	  <br/>
	  <span style="font-size:14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;海域使用金逾期未缴纳记录数
		  <font id="yjsTotal" color="#fc0202"></font>&nbsp;条。
	  </span>
	 
	</div>
	
</form>
<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
		

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
			if(document.getElementById("ztY").value ==""){
				document.getElementById("zt").value ="";
			}else{
				document.getElementById("zt").value =document.getElementById("ztY").value;
			}
			
		</script>
		

	</body>

</html>