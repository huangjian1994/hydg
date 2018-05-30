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
		function reinitIframe(){ 
		var iframe = document.getElementById("zhxxFrame"); 
		try{ 
		var bHeight = iframe.contentWindow.document.body.scrollHeight; 
		var dHeight = iframe.contentWindow.document.documentElement.scrollHeight; 
		var height = Math.max(bHeight, dHeight); 
		iframe.height = height; 
		}catch (ex){} 
		} 		
		window.setInterval("reinitIframe()", 200); 		
</script>

	<script type="text/javascript">
	function goBack(){
		document.myForm.action="<%=basePath%>/business/business_fetchYhxmBack.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	function goAdd1(){
		document.myForm.action="<%=basePath%>/business/business_addYhxmSuccess.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	function goAdd2(){
		document.myForm.action="<%=basePath%>/business/business_addYhxmFj.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	function goAdd3(){
		document.myForm.action="<%=basePath%>/business/business_addYhxmZhxx.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	//证书信息详情
	function detaileXmxxZsxx(zsID){
		document.getElementById("zsID").value = zsID;
		document.myForm.action="<%=basePath%>/business/business_fetchZhxxDetail.do";
		document.myForm.target="zhxxFrame";
		document.myForm.submit();
	}

	//到新增宗海页面
	function goAddzhxx(){
		document.myForm.action="<%=basePath%>/business/business_goZhxxadd.do";
		document.myForm.target="zhxxFrame";
		document.myForm.submit();
	}
	//到修改宗海页面
	function getUpdateZhxx(zsID){
		document.getElementById("zsID").value = zsID;
		document.myForm.action="<%=basePath%>/business/business_getUpdateZhxx.do";
		document.myForm.target="zhxxFrame";
		document.myForm.submit();
	}
	//删除证书信息
	function deleteZhxx(zsID){
		if(confirm("确定删除该记录吗？")){
			document.getElementById("zsID").value = zsID;
			document.myForm.action="<%=basePath%>/business/business_deleteZhxx.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}
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
			<li><a href="#">新增</a></li>
		</ul>
	</div>
	<input name="xmID" id="xmID" value="${xmID }" type="hidden" />
	<input name="zsID" id="zsID" value="${zsID }" type="hidden" />
	
	
	<div class="formbody" >
		<div id="usual1" class="usual">
			<div class="leftinfo1">
				<div class="itab" >
					<ul>
						<li><a href="###" onclick="goAdd1()">
							项目信息
							<c:if test="${not empty xmID}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty xmID}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if>
						</a></li>
						<li><a href="###" onclick="goAdd2()">项目附件
							<c:if test="${not empty yhxmfjList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmfjList}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if>
						</a></li>
						<li><a href="###" onclick="goAdd3()" class="selected">宗海信息
							<c:if test="${not empty yhxmzsxxList}">
							<img src="${contextPath}/images/t02.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmzsxxList}">
							<img src="${contextPath}/images/t03.png" width="15" height="15"/>
							</c:if>
						</a></li>
					</ul>
					
				</div>
				
				
			<div id="tab3" class="tabson">
				<table class="tablelist" style="width:98%;border: solid 1px #c7c7c7;" align="center">
					<thead>
					<tr style="border: solid 1px #c7c7c7;" >
						<th width="5%">序号</th>
						<th width="10%">海域管理号</th>
						<th width="15%">用海项目名称</th>
						<th width="15%">海域使用权人</th>
						<th width="25%">用海类型</th>
						<!-- 
						<th width="15%">用海方式</th><td>（${r.zhmj }公顷）</td>
						 -->
						<th width="8%">用海性质</th>
						<th width="10%">操作</th>
					</tr>
					</thead>
					<c:forEach items="${ yhxmzsxxList }" var="r" varStatus="j">
					<tr>
						<td>${ j.count }</td>
						<td>${r[2] }</td>
						<td>${r[3] }</td>
						<td>${r[4] }</td>
						<td>${r[6] }
							<c:if test="${ not empty r[8] }">、${r[8] }</c:if>
							（${r[9] }公顷）
						</td>
						<td>${r[11] }</td>
						<td>
						<a href="###" onclick="detaileXmxxZsxx('${r[0] }')" class="tablelink">详情</a>
						<a href="###" onclick="getUpdateZhxx('${r[0] }')" class="tablelink">修改</a>
						<a href="###" onclick="deleteZhxx('${r[0]}')" class="tablelink">删除</a>
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="7" style="text-align:center;">
							<input name="add" type="button" class="scbtn" onclick="goAddzhxx()" value="新增宗海" />
							<!-- 只可新增与项目证书数量一致的证书 -->
							<input name="back" type="button" class="scbtn" onclick="goBack()" value="返回" />
						</td>
					</tr>
				</table>

				<!-- height:800px; -->
				<iframe name="zhxxFrame" id="zhxxFrame" src="<%=basePath%>/business/business_getUpdateZhxx.do?xmID=${xmID }&zsID=${zsID}" style="text-align:center;width:100%;border: 0px solid red" align="middle" scrolling="no" frameborder="0"  onLoad="reinitIframe()" ></iframe>
				
				
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