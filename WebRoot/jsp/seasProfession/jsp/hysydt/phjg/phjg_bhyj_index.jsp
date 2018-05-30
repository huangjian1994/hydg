<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
  	<link href="${contextPath}/css/jQueryUI/jquery-ui-1.8.2.custom.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${contextPath}/js/jQueryUI/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/jQueryUI/jquery-ui-1.8.2.custom.min.js"></script>
	
	
<script type="text/javascript">
//代码
$(document).ready(function(){
	var xmwzY=document.getElementById("xmwzY").value;
	getDictionary("项目位置","xmwz",xmwzY);
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

//查询
function search(){
	document.myForm.action="<%=basePath%>/business/business_fetchYjxm.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//查看该项目的监管信息--总数
function goJGzs(xmID,jgXmmc){
	document.getElementById("xmID").value = xmID;
	document.getElementById("jgXmmc").value = jgXmmc;
	document.myForm.action="<%=basePath%>/business/business_fetchXmjgList1.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//查看该项目的监管信息--问题数
function goJGwts(xmID,jgXmmc){
	document.getElementById("xmID").value = xmID;
	document.getElementById("jgXmmc").value = jgXmmc;
	document.myForm.action="<%=basePath%>/business/business_fetchXmjgList2.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//查看该项目的监管信息--预警数
function goJGyjs(xmID,jgXmmc,yjid){
	document.getElementById("xmID").value = xmID;
	document.getElementById("jgXmmc").value = jgXmmc;
	document.getElementById("yjid").value = yjid;
	document.myForm.action="<%=basePath%>/business/business_fetchXmjgList3.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function resert(){
	document.getElementById("yhxmmc").value="";
	document.getElementById("xmwz").value="";
}
//项目详情
function xmxxDetail(xmID){
	document.getElementById("xmID").value = xmID;
	document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchYhxmDetaile.do";
	document.myForm.target="_blank";
	document.myForm.submit();
}

function indexDialog(){
	var indexNum = $("#indexNum").val();
	if(indexNum == "1"){
    	$.ajax({
			type : "post",
			dataType : "json",
			url : "${contextPath}/messagePrompt/messagePrompt_openDialog.do",
			success : function(data) {
				//alert(data[0]+"--"+data[1]);
				$("#yjsTotal").html(data[0]);
				$("#yjsToday").html(data[1]);
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

//预警信息详情
function goYjxxDetail(bhyjID){
	document.getElementById("bhyjID").value = bhyjID;
	document.myForm.action="<%=basePath%>/business/business_fetchYjxxDetail.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//预警信息删除
function goYjxxDelete(bhyjID){
	if(confirm("确定删除该记录吗？")){
	document.getElementById("bhyjID").value = bhyjID;
	document.myForm.action="<%=basePath%>/business/business_deleteYjxx.do";
	document.myForm.target="_self";
	document.myForm.submit();
	}
}
//预警信息修改
function goYjxxUpdate(bhyjID){
	if(confirm("确定修改该记录吗？")){
	document.getElementById("bhyjID").value = bhyjID;
	document.myForm.action="<%=basePath%>/business/business_getYjxxForUpdate.do";
	document.myForm.target="_self";
	document.myForm.submit();
	}
}


</script>
</head>
<body>
<form name="myForm" method="post" >
<input type="hidden" id="indexNum" value="1" />
		<div class="place">
			<span><img src="${contextPath}/images/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li><a href="#">海域使用动态管理</a></li>
				<li>
					<a href="#">用海项目批后监管</a>
				</li>
				<li>
					<a href="#">用海项目变化预警</a>
				</li>
			</ul>
		</div>
		<input name="xmID" id="xmID" value="" type="hidden" />
		<input name="jgXmmc" id="jgXmmc" value="" type="hidden" />
		<input name="bhyjID" id="bhyjID" value="" type="hidden" />
		<input name="hysyywHysydtYhxmphjgDtForm.yjid" id="yjid" value="" type="hidden" />
		
		
		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td style="height:35px;">用海项目名称：</td>
						<td><input name="hysyywHysydtYhxmForm.yhxmmc" id="yhxmmc" value="${hysyywHysydtYhxmForm.yhxmmc }"  type="text" style="width:180px;" /></td>
						<td>项目位置：</td>
						<td>
						<select name="hysyywHysydtYhxmForm.xmwz" id="xmwz" style="width:180px;">
								<option value="">-请选择-</option>
						</select>
						<input name="xmwzY" id="xmwzY" type="hidden" value="${hysyywHysydtYhxmForm.xmwz }" style="width:200px;" />
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<input name="cx" type="button" class="scbtn" value="查询" onclick="search()" />
							<input name="cz" type="button" class="scbtn" value="重置" onclick="resert()" />

							<input name="yj" type="button" class="scbtn" value="预警" onclick="indexDialog()" />

						</td>
					</tr>
				</table>
			</div><br />
		
	<div class="tools">
		<ul class="toolbar">
			<li>
				<a href="${contextPath}/jsp/seasProfession/jsp/hysydt/phjg/phjg_bhyj_add.jsp">
				<span><img src="${contextPath}/images/t01.png"/></span>新增</a>
			</li>
		</ul>
	</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th>序号</th>
					<th>用海项目名称</th>
					<th>海域使用权人</th>
					<!-- 
					<th>用海面积</th><td>${r.yhzmj}公顷</td>
					 -->
					<th>项目位置</th>
					<th>监管总数</th>
					<th>问题数</th>
					<th>预警起始日期</th>
					<th>预警终止日期</th>
					<th>预警数</th>
					<th >操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${ phjgBhyjList }" var="r" varStatus="j">
				<tr>
					<td>${j.count}</td>
					<td><a href="###" onclick="xmxxDetail('${r.xmid }')" class="tablelink">${r.xmmc}</a></td>
					<td>${r.hysyqr}</td>
					<td>${r.xmwz}</td>
					<td>
						<c:if test="${r.zjgs!='0'}">
						<a href="###" onclick="goJGzs('${r.xmid }','${r.xmmc}')" class="tablelink">${r.zjgs}</a>
						</c:if>
						<c:if test="${r.zjgs=='0'}">
						${r.zjgs}
						</c:if>
					</td>
					<td>
						<c:if test="${r.wts!='0'}">
						<a href="###" onclick="goJGwts('${r.xmid }','${r.xmmc}')" class="tablelink">${r.wts}</a>
						</c:if>
						<c:if test="${r.wts=='0'}">
						${r.wts}
						</c:if>
					</td>
					<td>${r.yjjkqsrq}</td>
					<td>${r.yjjkzzrq}</td>
					<td>
						<c:if test="${r.yjs!='0'}">
						<a href="###" onclick="goJGyjs('${r.xmid }','${r.xmmc}','${r.id }')" class="tablelink">${r.yjs}</a>
						</c:if>
						<c:if test="${r.yjs=='0'}">
						${r.yjs}
						</c:if>
					</td>
					<td>
						<a href="###" onclick="goYjxxDetail('${r.id }')" class="tablelink">详情</a>
						<a href="###" onclick="goYjxxUpdate('${r.id }')" class="tablelink">修改</a>
						<a href="###" onclick="goYjxxDelete('${r.id }')" class="tablelink">删除</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		</div>
		
	<div id="dialog" title="提示信息" style="display:none;">
	  <span style="font-size:18px;">
	  <img src="${contextPath}/images/gth.jpg" width="22" height="22" />
	    用海项目变化预警：
	  </span>
	  <br/>
	  <span style="font-size:14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用海项目监管全部预警数为
		  <font id="yjsTotal" color="#fc0202"></font>&nbsp;条，当日预警数为
		  <font id="yjsToday" color="#fc0202"></font>&nbsp;条。
	  </span>
	 
	</div>
		
		
		
	</form>	
	<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
</body>

</html>