<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>查询统计</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />

		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>

		<script type="text/javascript">

			$(function (){
				getDictionary("项目位置","st_name_cd","${part}");
				
			})

			//加载字典
			//加载字典
			function getDictionary(keyZ,selectID,val){
				$.ajax({		  		
					type: "post",
					dataType:"json",
					url: "${contextPath}/business/business_fetchDictionary.do",
					data: "dictionary.key="+keyZ,
					success: function(d){
						for(var i=0;i<d.length;i++){
							//alert(d);
							if(d[i].dm==val){
								$("<option value= '"+d[i].dm+"' selected>"+d[i].value+"</option>").appendTo("#"+selectID);
							}else{
								$("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
							}
						}
					}
				});	  
			}

			function selectAdress(){
				$("#st_name").val($("#st_name_cd :selected").text());
			}

			function loadDetail(index){
				var reg = new RegExp("^\\d+$");
				if (!reg.test(index)) return;
				document.pageBeanForm.action = "${contextPath}/seaPatorl/swPatorl_loadSeawallPatorlInfoThroughWs.do?classify=" + index;
				gotoPage('${pageBean.curPage }');
			}

		</script>
	</head>

	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">查询统计</a>
				</li>
				<li>
					<a href="#">综合查询</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<s:form namespace="/seaPatorl" action="swPatorl_loadSeawallPatorlThroughWs.do" method="post">
			<s:hidden name="reload" value="1"></s:hidden>
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>分类：</td>
						<td align="left">
							<s:select name="type" id="type4" cssStyle="width:180px;height:25px;" list="#{'1':'堤防','2':'海塘'}"></s:select>
						</td>

						<td>巡查范围：</td>
						<td>
							<s:select name="part" id="st_name_cd" list="#{'':'-请选择-'}" cssStyle="width:180px;height:25px;" onchange="selectAdress()"></s:select>
							<s:hidden name="spfw.st_name" id="st_name"></s:hidden>
						</td>
						<td>处理状态：</td>
						<td>
							<s:select name="spfw.nm_state" id="nm_state" list="#{'':'-请选择-','1':'发现','2':'立案','3':'派遣','4':'处理','5':'结案'}" cssStyle="width:180px;height:25px;"></s:select>
						</td>
					</tr>
					<tr>
						<td>问题类别：</td>
						<td><s:textfield name="spfw.st_esclass" cssStyle="width:180px;" ></s:textfield></td>

						<td>巡查人员：</td>
						<td><s:textfield name="spfw.st_claimperson" cssStyle="width:180px;" ></s:textfield></td>
						
						<td>发现时间：</td>
						<td style="text-align:center;">
				
							<s:textfield onclick="WdatePicker()"  name="strBT" cssStyle="width:125px;"></s:textfield> &nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield onclick="WdatePicker()"  name="strET" cssStyle="width:125px;"></s:textfield>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<input type="submit" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" class="scbtn1" value="重置" /> &nbsp;&nbsp;&nbsp;&nbsp;
						</td>
					</tr>

				</table>
			</div>
			</s:form>

			<br />
			<table class="tablelist">
				<thead>
					<tr>
						<th>序号</th>
						<th>任务号</th>
						<th>发现时间</th>
						<th>问题类别</th>
						<th>巡查人员</th>
						<th>巡查范围</th>
						<th>处理状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${spfws}" var="sp" varStatus="i">
						<tr>
							<%--
							<td><input type="checkbox" name="chk" value="${sp.st_eventsn }" /></td>
							--%>
							<td>${i.index + 1 }</td>
							<td>${sp.st_eventsn }</td>
							<td>${sp.dt_discovertime }</td>
							<td>${sp.st_esclass } - ${sp.st_ebclass}</td>
							<td>${sp.st_claimperson }</td>
							<td>${sp.st_name } - ${sp.st_address }</td>
							<td>
								<c:choose>
									<c:when test="${sp.nm_state == '1' }">发现</c:when>
									<c:when test="${sp.nm_state == '2' }">立案</c:when>
									<c:when test="${sp.nm_state == '3' }">派发</c:when>
									<c:when test="${sp.nm_state == '4' }">处理</c:when>
									<c:when test="${sp.nm_state == '5' }">结案</c:when>
								</c:choose>
							
							</td>
							<td>
								<a href="javascript:void(0);" onclick="loadDetail('${i.index}')" class="tablelink">详情</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pagin"  align="center">
				${pageBean }
			</div>
		</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

	</body>

</html>