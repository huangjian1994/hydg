<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java"  pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>违规举报管理</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
		//代码
		$(document).ready(function(){
			var cblxY =document.getElementById("cblxY").value;
			
			getDictionary("违规船舶类型","cblx",cblxY);
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
						if(d[i].value==historyZ){
							$("<option value= '"+d[i].value+"' selected>"+d[i].value+"</option>").appendTo("#"+selectID);
						}else{
							$("<option value= '"+d[i].value+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
						}
					}
				}
			});	  
		}
		
		//查询
		function search(){
			document.myForm.action="<%=basePath%>/submarineline/submarineline_fetchWgjbList.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}

		function resert(){
			document.getElementById("mmsi").value="";
			document.getElementById("wgcm").value="";
			document.getElementById("cblx").value="";
			document.getElementById("wgrq").value="";
		}

		//详情
		function goWgjbDetail(wgjbID){
			document.getElementById("wgjbID").value=wgjbID;
			document.myForm.action="<%=basePath%>/submarineline/submarineline_fetchWgjbDetail.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}
		//修改
		function goUpdateWgjb(wgjbID){
			document.getElementById("wgjbID").value=wgjbID;
			document.myForm.action="<%=basePath%>/submarineline/submarineline_getWgjbForUpdate.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}
		//删除
		function goDeleteWgjb(wgjbID){
			if(confirm("确定删除该记录吗？")){
			document.getElementById("wgjbID").value=wgjbID;
			document.myForm.action="<%=basePath%>/submarineline/submarineline_deleteWgjbxx.do";
			document.myForm.target="_self";
			document.myForm.submit();
			}
		}
		</script>
	</head>

	<body>
<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seabedPipeline/ico01.png" width="22" height="22"  alt="位置"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海底管线安全</a>
				</li>
				<li>
					<a href="#">违规举报管理</a>
				</li>
			</ul>
		</div>
	<input name="wgjbID" id="wgjbID" type="hidden" value="" />
		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seabedPipeline/ico06.png" width="25" height="25"  alt=""/>条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td width="20%" >船舶mmsi：</td>
						<td width="30%"><input name="searchForm.mmsi" id="mmsi" type="text" value="${searchForm.mmsi }" style="width:200px;" /></td>
						<td width="20%" >违规船名：</td>
						<td width="30%"><input name="searchForm.wgcm" id="wgcm" type="text" value="${searchForm.wgcm }" style="width:200px;"/></td>
					</tr>
					<tr>
						<td align="right">违规船舶类型：</td>
						<td align="left">
							<select name="searchForm.cblx" id="cblx" style="width:200px;">
								<option value="">-请选择-</option>
								<!-- 
								<option value="非法取砂船舶">非法取砂船舶</option>
								<option value="工程作业船">工程作业船</option>
								 -->
							</select>
							<input name="cblxY" id="cblxY" type="hidden" value="${searchForm.cblx }" style="width:200px;"/>
						</td>
						<td align="right">违规日期：</td>
						<td align="left">
                            <input name="searchForm.wgrq" id="wgrq" value="${searchForm.wgrq }" type="text" onclick="WdatePicker()" readonly="readonly" style="width:200px;"/>
                        </td>
					</tr>
					<tr>
						<td colspan="4">
							<input name="查询" type="button" class="scbtn" value="查询" onclick="search()" />
							<input name="重置" type="button" class="scbtn" value="重置" onclick="resert()" />
						</td>
					</tr>
				</table>
			</div>

			<br />
			<div class="tools">
				<ul class="toolbar">
					<li>
						<a href="${contextPath}/jsp/seabedPipeline/jsp/seabedPipelineSafe/wgjb/wgjb_add.jsp">
                            <span><img src="${contextPath}/images/seabedPipeline/t01.png" alt="新增"/></span>新增</a>
					</li>
					<!-- 
					<li>
						<a href="${contextPath}/jsp/seabedPipeline/jsp/seabedPipelineSafe/wgjbgl_uptate.jsp">
                            <span><img src="${contextPath}/images/seabedPipeline/t02.png" alt="修改" /></span>修改</a>
					</li>
					 -->
				</ul>
			</div>
			<table class="tablelist">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>船舶mmsi</th>
                    <th>违规船名</th>
                    <th>船舶类别</th>
                    <th>船舶负责人</th>
                    <th>违规内容</th>
                    <th>违规地点</th>
                    <th>违规日期</th>
                    <th>巡查人</th>
                    <th>操作</th>
                </tr>
                </thead>
				<tbody>
				<c:forEach items="${ wgjbList }" var="r" varStatus="j">
					<tr>
						<td>${ j.count }</td>
						<td>${r.mmsi }</td>
						<td>${r.wgcm }</td>
						<td>${r.cblx }</td>
						<td>${r.fzr }</td>
						<td>${r.wgnr }</td>
						<td>${r.wgdd }</td>
						<td>${r.wgrq }</td>
						<td>${r.jbr }</td>
						<td>
							<a href="###" onclick="goWgjbDetail('${r.id }')"  class="tablelink">详情</a>&nbsp;&nbsp;
							<a href="###" onclick="goUpdateWgjb('${r.id }')"  class="tablelink">修改</a> &nbsp;&nbsp;
							<a href="###" onclick="goDeleteWgjb('${r.id }')"  class="tablelink">删除</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>

			</table>
		</div>
</form>
<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

    </body>

</html>