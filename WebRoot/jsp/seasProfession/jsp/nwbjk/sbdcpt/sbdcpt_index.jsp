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
	var ztY=document.getElementById("ztY").value;
	
	//getDictionary("项目位置","xmwz",xmwzY);
	getDictionary("推送状态","zt",ztY);

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
		document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchYhxmList.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	//重置
	function resert(){
		document.getElementById("hyglh").value ="";
		document.getElementById("yhxmmc").value ="";
		document.getElementById("hysyqr").value ="";
		document.getElementById("yhxz").value ="";
		document.getElementById("slrq").value ="";
		document.getElementById("zt").value ="";
	}

	//项目详情
	function detaileXmxx(xmID){
		document.getElementById("xmID").value = xmID;
		document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchYhxmDetaile2.do";
		document.myForm.target="_blank";//_self
		document.myForm.submit();
	}
	//海域管理号详情
	function detaileZhxx(xmID,zsID){
		document.getElementById("xmID").value = xmID;
		document.getElementById("zsID").value = zsID;
		document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchZhxxDetailByHyglh2.do";
		document.myForm.target="_blank";
		document.myForm.submit();
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

	//第一次推送
	function sendFirst(xmID,zsID){
		document.getElementById("xmID").value = xmID;
		document.getElementById("zsID").value = zsID;
		document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_goSendFirst.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	//第二次推送
	function sendSecond(xmID,zsID){
		document.getElementById("xmID").value = xmID;
		document.getElementById("zsID").value = zsID;
		document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_goSendSecond.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	//第三次推送
	function sendThird(xmID,zsID){
		document.getElementById("xmID").value = xmID;
		document.getElementById("zsID").value = zsID;
		document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_goSendThird.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	//清空MDB模板
	function clearMdb(){
		alert("清空MDB模板成功！");
		document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_clearMdbFile.do";
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
	<input name="xmID" id="xmID" value="" type="hidden" />
	<input name="zsID" id="zsID" value="" type="hidden" />
		
	<div class="formbody">
		<div id="usual1" class="usual" >
			<div class="leftinfo1">
				<div class="itab" >
					<ul>
						<li><a href="###" onclick="goSbdcjkpt()" class="selected">市不动产登记平台</a></li>
						<li><a href="###" onclick="goFkxx()" >反馈信息</a></li>
					</ul>
				</div>
				
				
			<div class="listtitle3"><img src="${contextPath}/images/ico06.png" width="25" height="25" />条件查询</div>
			<table width="100%" align="center" style="text-align:center;">
				<tr>
					<td style="height:35px;">海域管理号：</td>
					<td><input name="hysyywHysydtYhxmForm.hyglh" id="hyglh" value="${hysyywHysydtYhxmForm.hyglh }"  type="text"  style="width:180px;" /></td>
					<td style="height:35px;">用海项目名称：</td>
					<td><input name="hhysyywHysydtYhxmForm.yhxmmc" id="yhxmmc" value="${hysyywHysydtYhxmForm.yhxmmc }"  type="text"  style="width:180px;" /></td>
				</tr>
				<tr>
					<td style="height:35px;">海域使用权人：</td>
					<td><input name="hysyywHysydtYhxmForm.hysyqr" id="hysyqr" value="${hysyywHysydtYhxmForm.hysyqr }"  type="text"  style="width:180px;" /></td>
					<td style="height:35px;">用海性质：</td>
					<td><input name="hhysyywHysydtYhxmForm.yhxz" id="yhxz" value="${hysyywHysydtYhxmForm.yhxz }"  type="text"  style="width:180px;" /></td>
				</tr>
				<tr style="height:35px;">
					<td>受理日期：</td>
					<td><input name="hysyywHysydtYhxmForm.slrq" id="slrq" value="${hysyywHysydtYhxmForm.slrq }"  onclick="WdatePicker()" readonly="readonly" type="text"  style="width:180px;" /></td>
					<td>推送状态：</td>
					<td>
						<select name="hysyywHysydtYhxmForm.zt" id="zt" style="width:180px;">
							<option value="">-请选择-</option>
						</select>
						<input name="ztY" id="ztY" type="hidden" value="${hysyywHysydtYhxmForm.zt }" style="width:200px;" />
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<input name="查询" type="button" class="scbtn" value="查询" onclick="search()" />
						<input name="重置" type="button" class="scbtn" value="重置" onclick="resert()" />
						<input name="qk" type="button" class="scbtn" value="清空MDB模板" onclick="clearMdb()" style="width:100px;" />
					</td>
				</tr>
			</table>
		</div><br />

		<table class="tablelist">
			<thead>
				<tr>
					<!--  
					<th width="4%"><input type="checkbox" id ="cb" onclick="checkAll()" style="border:0;"/></th>
					<td><input type="checkbox" name="chk" id="chk${ j.count }" value="${ r[0]}" style="border:0;"/></td>
					-->
					<th width="4%">序号</th>
					<th width="8%">海域管理号</th>
					<th width="15%">用海项目名称</th>
					<th width="10%">海域使用权人</th>
					<th width="8%">用海性质</th>				
					<th width="10%">宗海面积（公顷）</th>
					<th width="8%">受理日期</th>
					<th width="15%">推送状态</th>
					<th width="12%">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ yhxmList }" var="r" varStatus="j">
				<tr>
					<td>${ j.count }</td>
					<td><a href="###" onclick="detaileZhxx('${r[0] }','${r[1] }')" class="tablelink">${r[2] }</a></td>
					<td><a href="###" onclick="detaileXmxx('${r[0] }')" class="tablelink">${r[3] }</a></td>
					<td>${r[4] }</td>
					<td>${r[5] }</td>
					<td>${r[8] }</td>
					<td>${r[13] }</td>
					<td style="word-wrap: break-word;word-break:break-all;">
					<c:if test="${ not empty r[10]}">
					<c:if test="${r[10]=='6' }">推送宗海信息成功</c:if>
					<c:if test="${r[10]!='6' && r[10]!='0' }">推送宗海信息失败</c:if>
					<c:if test="${r[10]=='0' }"></c:if>
					</c:if>
					
					<c:if test="${ not empty r[11]}">
					<c:if test="${r[11]=='1' }"><br />推送使用金缴纳信息成功</c:if>
					<c:if test="${r[11]!='1' && r[11]!='0' }"><br />推送使用金缴纳信息失败</c:if>
					<c:if test="${r[11]=='0' }"></c:if>
					</c:if>

					<c:if test="${ not empty r[12]}">
					<c:if test="${r[12]=='1' }"><br />推送配号信息成功</c:if>
					<c:if test="${r[12]!='1' && r[12]!='0' }"><br />推送配号信息失败</c:if>
					<c:if test="${r[12]=='0' }"></c:if>
					</c:if>
					</td>
					<td style="word-wrap: break-word;word-break:break-all;">
						<a href="###" onclick="sendFirst('${r[0]}','${r[1] }')" class="tablelink" title="推送宗海信息">推送宗海信息</a><br />
						
						<c:if test="${ r[14] !='0'}">
						<a href="###" onclick="sendSecond('${r[0]}','${r[1] }')" class="tablelink" title="推送海域使用金缴纳信息">推送使用金缴纳信息</a><br />
						</c:if>
						<c:if test="${ not empty r[2]}">
						<a href="###" onclick="sendThird('${r[0]}','${r[1] }')" class="tablelink" title="推送配号信息">推送配号信息</a>
						</c:if>
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