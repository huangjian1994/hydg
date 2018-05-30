<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">	
//代码
$(document).ready(function(){
	//var xmwzY=document.getElementById("xmwzY").value;
	//var ztY=document.getElementById("ztY").value;
	
	//getDictionary("项目位置","xmwz",xmwzY);
	//getDictionary("推送状态","zt",ztY);

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
		document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchSbhcptFk.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	//重置
	function resert(){
		document.getElementById("yhpwbh").value ="";
		document.getElementById("yhxmmc").value ="";
		document.getElementById("xmxz").value ="";
		document.getElementById("fzrq").value ="";
	}

	//获取反馈
	function searchFK(){
		document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchSbdcptFk.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	//详情
	function detaileFkxx(fkID){
		document.getElementById("fkID").value =fkID;
		document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchFkDetail.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	function detaileFkbd(fkID,approvalNum){
		document.getElementById("fkID").value =fkID;
		document.getElementById("approvalNum").value =approvalNum;
		document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchFkBd.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	function goSbdcjkpt(){
		document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchYhxmList.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	function goFkxx(){
		document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchSbhcptFk.do";
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
			<li><a href="#">内外部接口</a></li>
			<li><a href="#">市不动产登记平台</a></li>
		</ul>
	</div>
		<input name="fkID" id="fkID" value="" type="hidden" />
		<input name="approvalNum" id="approvalNum" value="" type="hidden" />
		
	<div class="formbody">
		<div id="usual1" class="usual" >
			<div class="leftinfo1">
				<div class="itab" >
					<ul>
						<li><a href="###" onclick="goSbdcjkpt()" >市不动产登记平台</a></li>
						<li><a href="###" onclick="goFkxx()" class="selected">反馈信息</a></li>
					</ul>
				</div>
				
			<div class="listtitle3"><img src="${contextPath}/images/ico06.png" width="25" height="25" />条件查询</div>
			<table width="100%" align="center" style="text-align:center;">
				<tr>
					<td style="height:35px;">用海批文编号：</td>
					<td><input name="searchForm.yhpwbh" id="yhpwbh" value="${searchForm.yhpwbh }"  type="text"  style="width:180px;" /></td>
					<td style="height:35px;">用海项目名称：</td>
					<td><input name="searchForm.yhxmmc" id="yhxmmc" value="${searchForm.yhxmmc }"  type="text"  style="width:180px;" /></td>
				</tr>
				<tr>
					<td style="height:35px;">项目性质：</td>
					<td><input name="searchForm.xmxz" id="xmxz" value="${searchForm.xmxz }"  type="text"  style="width:180px;" /></td>
					<td style="height:35px;">发证日期：</td>
					<td><input name="searchForm.fzrq" id="fzrq" value="${searchForm.fzrq }"  onclick="WdatePicker()" readonly="readonly" type="text"  style="width:180px;" /></td>
				</tr>
				
				<tr>
					<td colspan="4">
						<input name="查询" type="button" class="scbtn" value="查询" onclick="search()" />
						<input name="重置" type="button" class="scbtn" value="重置" onclick="resert()" />
						
						<input name="fk" type="button" class="scbtn" value="获取反馈信息" onclick="searchFK()"  style="width:100px;" />
					</td>
				</tr>
			</table>
		</div><br />
	
	<!-- 
	<div class="tools">
		<ul class="toolbar">
			<li>
				<a href="${contextPath}/jsp/seasProfession/jsp/hysydt/yhxm/yhxm_add.jsp">
				<span><img src="${contextPath}/images/t01.png" /></span>新增</a>
			</li>
			 
			<li><a href="xg.jsp"><span><img src="${contextPath}/images/t02.png" /></span>修改</a></li>
			<li><a href="javascript:deleteZdclCljd();"><span><img src="${contextPath}/images/t03.png" /></span>删除</a></li>
			
		</ul>
	</div>
	 -->
		<table class="tablelist">
			<thead>
				<tr>
					<th width="4%">序号</th>
					<th width="13%">用海批文编号</th>
					<th width="18%">项目名称</th>
					<th width="8%">项目性质</th>
					<th width="12%">用海总面积（公顷）</th>				
					<th width="10%">宗海面积（公顷）</th>
					<th width="10%">用海期限（年）</th>
					<th width="12%">发证日期</th>
					<th width="6%">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ fkList }" var="r" varStatus="j">
				<tr>
					<td>${ j.count }</td>
					<td>${r.approvalnum }</td>
					<td>${r.projectname }</td>
					<td>
						<c:if test="${r.seausekind=='1' }">经营性</c:if>
						<c:if test="${r.seausekind=='2' }">公益性</c:if>
					</td>
					<td>${r.usedarea }</td>
					<td>${r.area }</td>
					<td>${r.applyyear }</td>
					<td style="word-wrap: break-word;word-break:break-all;">${r.enddate }</td>
					<td style="word-wrap: break-word;word-break:break-all;">
						<a href="###" onclick="detaileFkxx('${r.id}')" class="tablelink">详情</a>&nbsp;
						<a href="###" onclick="detaileFkbd('${r.id}','${r.approvalnum}')" class="tablelink">比对</a>&nbsp;
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
</div>
</div>
</form>

	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>

<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
</body>
</html>