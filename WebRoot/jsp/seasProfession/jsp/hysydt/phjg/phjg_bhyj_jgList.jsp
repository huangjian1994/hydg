<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>

<script type="text/javascript">
//返回
function goBack(){
	document.myForm.action="<%=basePath%>/business/business_fetchYjxm.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//
function fetchJgxx(jgfs){
	document.myForm.action="<%=basePath%>/business/business_fetchXmDtjgList.do?jgfs="+jgfs;
	document.myForm.target="_self";
	document.myForm.submit();
}
//详情
function detailJgxx(dtglID){
	document.getElementById("dtglID").value = dtglID;
	document.myForm.action="<%=basePath%>/business/business_fetchYhxmglDetail.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//项目详情
function xmxxDetail(){
	document.myForm.action="<%=basePath%>/sbdcpt/sbdcpt_fetchYhxmDetaile.do";
	document.myForm.target="_blank";
	document.myForm.submit();
}
//未实现
function wsx(){

	
}
</script>
</head>

<body>
<form name="myForm" method="post" >
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
				<li>
					<a href="#">监管信息</a>
				</li>
			</ul>
		</div>
		<input name="xmID" id="xmID" value="${xmID }" type="hidden" />
		<input name="jgXmmc" id="jgXmmc" value="${jgXmmc }" type="hidden" />
		<input name="dtglID" id="dtglID" value="" type="hidden" />
		<input name="jgfs" id="jgfs" value="${jgfs }" type="hidden" />
		<input name="hysyywHysydtYhxmphjgDtForm.yjid" id="yjid" value="${hysyywHysydtYhxmphjgDtForm.yjid }" type="hidden" />
		
		
		<div class="formbody">
			<div id="usual1" class="usual">
				<div class="leftinfo1">
					<div class="itab">
						<ul>
							<li>
								<a href="#tab1" class="selected">建设过程监管&nbsp;<font color="red"><s:property value="phjgDtglList1.size()" /></font></a>
							</li>
							<li>
								<a href="#tab2" >竣工用海复核&nbsp;<font color="red"><s:property value="phjgDtglList2.size()" /></font></a>
							</li>
							<li>
								<a href="#tab3" >日常监管&nbsp;<font color="red"><s:property value="phjgDtglList3.size()" /></font></a>
							</li>
							<li>
								<a href="#tab4" >核查监视监测&nbsp;<font color="red"><s:property value="phjgDtglList4.size()" /></font></a>
							</li>
						</ul>
					</div>

					<div id="tab1" class="tabson">
						<div class="tools">
							<ul class="toolbar">
								<li>
									<a href="javaScript:wsx()">
									<span><img src="${contextPath}/images/main/31.png" width="24" height="24"/></span>视频监视</a>
								</li>
								<li>
									<a href="javaScript:wsx()">
									<span><img src="${contextPath}/images/main/pdahchl.png" width="24" height="24"/></span>海域巡查</a>
								</li>
								<li>
									<a href="javaScript:goBack()"><span><img src="${contextPath}/images/goback.png"/></span>返回</a>
								</li>
							</ul>
						</div>
						
						<table class="tablelist">
							<thead>
								<tr>
									<th>序号</th>
									<th>用海项目名称</th>
									<th>监管日期</th>
									<th>界址是否改变</th>
									<th>用海界址</th>
									<th>面积是否改变</th>
									<th>用海面积</th>
									<th>施工方式</th>
									<th>施工进展情况</th>
									<th>实际用途是否改变</th>
									<th>实际用途改变内容</th>
									<th>岸滩演变情况</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ phjgDtglList1 }" var="r" varStatus="j">
								<tr>
									<td>${j.count }</td>
									<td><a href="###" onclick="xmxxDetail()" class="tablelink">${r.yhxmmc }</a></td>
									<td>${r.jgrq }</td>
									<td>
										<c:if test="${r.yhjzsfgb=='是' }">
										<font color="blue">${r.yhjzsfgb }</font>
										</c:if>
										<c:if test="${r.yhjzsfgb!='是' }">
										${r.yhjzsfgb }
										</c:if>
									</td>
									<td>${r.yhjz }</td>
									<td>
										<c:if test="${r.yhmjsfgb=='是' }">
										<font color="blue">${r.yhmjsfgb }</font>
										</c:if>
										<c:if test="${r.yhmjsfgb!='是' }">
										${r.yhmjsfgb }
										</c:if>
									</td>
									<td>${r.yhmj }公顷</td>
									<td>${r.sgfs }</td>
									<td>${r.sgjzqk }</td>
									<td>
										<c:if test="${r.sjytsfgb=='是' }">
										<font color="blue">${r.sjytsfgb }</font>
										</c:if>
										<c:if test="${r.sjytsfgb!='是' }">
										${r.sjytsfgb }
										</c:if>
									</td>
									<td>${r.sjytgbnr }</td>
									<td>${r.atybqk }</td>
									<td>
										<a href="###" onclick="detailJgxx('${r.id }')" class="tablelink">详情</a>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						
					</div>

					<div id="tab2" class="tabson">

						<div class="tools">
							<ul class="toolbar">
								<li>
									<a href="javaScript:wsx()">
									<span><img src="${contextPath}/images/main/31.png" width="24" height="24"/></span>视频监视</a>
								</li>
								<li>
									<a href="javaScript:wsx()">
									<span><img src="${contextPath}/images/main/pdahchl.png" width="24" height="24"/></span>海域巡查</a>
								</li>
								<li>
									<a href="javaScript:goBack()"><span><img src="${contextPath}/images/goback.png"/></span>返回</a>
								</li>
							</ul>
						</div>
						<table class="tablelist">
							<thead>
								<tr>
									<th>序号</th>
									<th>用海项目名称</th>
									<th>监管日期</th>
									<th>用海界址是否改变</th>
									<th>用海界址</th>
									<th>用海面积是否改变</th>
									<th>用海面积</th>
									<th>实际用途是否改变</th>
									<th>实际用途改变内容</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ phjgDtglList2 }" var="r" varStatus="j">
								<tr>
									<td>${j.count }</td>
									<td><a href="###" onclick="xmxxDetail()" class="tablelink">${r.yhxmmc }</a></td>
									<td>${r.jgrq }</td>
									<td>
										<c:if test="${r.yhjzsfgb=='是' }">
										<font color="blue">${r.yhjzsfgb }</font>
										</c:if>
										<c:if test="${r.yhjzsfgb!='是' }">
										${r.yhjzsfgb }
										</c:if>
									</td>
									<td>${r.yhjz }</td>
									<td>
										<c:if test="${r.yhmjsfgb=='是' }">
										<font color="blue">${r.yhmjsfgb }</font>
										</c:if>
										<c:if test="${r.yhmjsfgb!='是' }">
										${r.yhmjsfgb }
										</c:if>
									</td>
									<td>${r.yhmj }公顷</td>
									<td>
										<c:if test="${r.sjytsfgb=='是' }">
										<font color="blue">${r.sjytsfgb }</font>
										</c:if>
										<c:if test="${r.sjytsfgb!='是' }">
										${r.sjytsfgb }
										</c:if>
									</td>
									<td>${r.sjytgbnr }</td>
									<td>
										<a href="###" onclick="detailJgxx('${r.id }')" class="tablelink">详情</a>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						
					</div>

					<div id="tab3" class="tabson">
						<div class="tools">
							<ul class="toolbar">
								<li>
									<a href="javaScript:wsx()">
									<span><img src="${contextPath}/images/main/31.png" width="24" height="24"/></span>视频监视</a>
								</li>
								<li>
									<a href="javaScript:wsx()">
									<span><img src="${contextPath}/images/main/pdahchl.png" width="24" height="24"/></span>海域巡查</a>
								</li>
								<li>
									<a href="javaScript:goBack()"><span><img src="${contextPath}/images/goback.png"/></span>返回</a>
								</li>
							</ul>
						</div>

						<table class="tablelist">
							<thead>
								<tr>
									<th>序号</th>
									<th>用海项目名称</th>
									<th>监管日期</th>
									<th>是否占用海域</th>
									<th>占用海域情况</th>
									<th>是否有非法围填海活动</th>
									<th>非法围填海活动情况</th>
									<th>是否擅自改变海域用途</th>
									<th>擅自改变海域用途情况</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ phjgDtglList3 }" var="r" varStatus="j">
								<tr>
									<td>${j.count }</td>
									<td><a href="###" onclick="xmxxDetail()" class="tablelink">${r.yhxmmc }</a></td>
									<td>${r.jgrq }</td>
									<td>
										<c:if test="${r.sfzyhy=='是' }">
										<font color="blue">${r.sfzyhy }</font>
										</c:if>
										<c:if test="${r.sfzyhy!='是' }">
										${r.sfzyhy }
										</c:if>
									</td>
									<td>${r.zyhyqk }</td>
									<td>
										<c:if test="${r.sfffwth=='是' }">
										<font color="blue">${r.sfffwth }</font>
										</c:if>
										<c:if test="${r.sfffwth!='是' }">
										${r.sfffwth }
										</c:if>
									</td>
									<td>${r.ffwthqk }</td>
									<td>
										<c:if test="${r.sfszgbhyyt=='是' }">
										<font color="blue">${r.sfszgbhyyt }</font>
										</c:if>
										<c:if test="${r.sfszgbhyyt!='是' }">
										${r.sfszgbhyyt }
										</c:if>
									</td>
									<td>${r.szgbhyytqk }</td>
									<td>
										<a href="###" onclick="detailJgxx('${r.id }')" class="tablelink">详情</a>
									</td>
								</tr>
								</c:forEach>
								
							</tbody>
						</table>
						
					</div>

					<div id="tab4" class="tabson">

						<div class="tools">
							<ul class="toolbar">
								<li>
									<a href="javaScript:wsx()">
									<span><img src="${contextPath}/images/main/31.png" width="24" height="24"/></span>视频监视</a>
								</li>
								<li>
									<a href="javaScript:wsx()">
									<span><img src="${contextPath}/images/main/pdahchl.png" width="24" height="24"/></span>海域巡查</a>
								</li>
								<li>
									<a href="javaScript:goBack()"><span><img src="${contextPath}/images/goback.png"/></span>返回</a>
								</li>
							</ul>
						</div>
						<table class="tablelist">
							<thead>
								<tr>
									<th>序号</th>
									<th>用海项目名称</th>
									<th>监管日期</th>
									<th>核查监视监测信息</th>
									<!-- 
									<th>异点异区</th>
									<th>违规用海信息</th>
									<th>核查数据</th>
									 -->
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ phjgDtglList4 }" var="r" varStatus="j">
								<tr>
									<td>${j.count }</td>
									<td><a href="###" onclick="xmxxDetail()" class="tablelink">${r.yhxmmc }</a></td>
									<td>${r.jgrq }</td>
									<td>${r.hcjsjc }</td>
									<td>
										<a href="###" onclick="detailJgxx('${r.id }')" class="tablelink">详情</a>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						
					</div>
					
				</div>
			</div>
			</div>
			<script type="text/javascript">
				$("#usual1 ul").idTabs();
			</script>

			<script type="text/javascript">
				$('.tablelist tbody tr:odd').addClass('odd');
			</script>
</form>
	</body>
</html>