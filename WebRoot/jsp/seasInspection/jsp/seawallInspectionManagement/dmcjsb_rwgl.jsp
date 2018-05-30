<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>

		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />

		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>

	</head>

	<body>
		<s:form namespace="/seaPatorl" action="swPatorl_loadFlows.do" method="post">
		<div class="leftinfo1">
			<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
			<table width="100%" align="center" style="text-align:center;">
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
				<col style="width: 30%" />
				<tr>
					<td>上报单编号：</td>
					<td align="left">
						<s:textfield name="flow.stPatrolId" cssStyle="width:180px;height:25px;"></s:textfield>
					</td>

					<td>流程：</td>
					<td><s:select name="flow.opType" id="opType" list="#{'':'-请选择-','1':'上报','2':'立案','3':'派遣','4':'处理','5':'确认'}" cssStyle="width:180px;height:25px;" onchange="selectAdress()"></s:select></td>

					<td>时间：</td>
					<td style="text-align:center;">
						<s:textfield onclick="WdatePicker()"  name="flow.addtime" cssStyle="width:125px;"></s:textfield>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<s:textfield onclick="WdatePicker()"  name="flow.lastupdatetime" cssStyle="width:125px;"></s:textfield>
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
					<th style="width:30px;"></th>
					<th>上报单编号</th>
					<th>问题类别</th>
					<th>上报单位</th>
					<th>上报人</th>
					<th>上报描述</th>
					<th>流程</th>
					<th>时间</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${flows}" var="flow" varStatus="i">
					<tr>
						<td>${i.index + 1 }</td>
						<td>${sprs[i.index].stEventsn }</td>
						<td>${sprs[i.index].stEsclass }</td>
						<td>${sprs[i.index].stReportDepartment }</td>
						<td>${sprs[i.index].addusername }</td>
						<td>${sprs[i.index].stDescription }</td>
						<td>
							<c:choose>
								<c:when test="${flow.opType == 2 }">立案</c:when>
								<c:when test="${flow.opType == 3 }">派遣</c:when>
								<c:when test="${flow.opType == 4 }">处理</c:when>
								<c:when test="${flow.opType == 5 }">确认</c:when>
							</c:choose>
						</td>
						<td>${flow.addtime }</td>
						<td>
							<c:choose>
								<c:when test="${flow.opStatus == 0 }"><font color="red">待处理</font></c:when>
								<c:when test="${flow.opStatus == 1 }"><font color="green">已处理</font></c:when>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${flow.opStatus == 0 }">
									<a href="javascript:void(0);" onclick="loadInfo('${flow.stPatrolId }',2)" class="tablelink">处理</a>
								</c:when>
								<c:when test="${flow.opStatus == 1 }">
									<a href="javascript:void(0);" onclick="loadInfo('${flow.stPatrolId }',3)" class="tablelink">查看</a>
								</c:when>
							</c:choose>
							
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

		<div class="pagin"  align="center">
			${pageBean }
		</div>
		<script type="text/javascript">
			$(function() {
				$('.tablelist tbody tr:odd').addClass('odd');

				var ids = new Array();
				var names = new Array();
				ids.push("adduserid");
				loadUserCode(ids,names);
			});

			//结合loadUserCode(ids,names)方法使用
			function onChangeVal(id, name){
				$("#"+id).change(function(){
					$("#" + name).val($("#"+ id +" option:selected").text())
				});
			}
			//加载用户字典
			function loadUserCode(ids,names){
				for ( var i = 0; i < ids.length; i++) {
					onChangeVal(ids[i],names[i]);
				}
				$.ajax({		  		
					type: "post",
					dataType:"json",
					url: "${contextPath}/user/user_loadUserCode.do",
					success: function(d){
						for ( var j = 0; j < ids.length; j++) {
							for(var i=0;i<d.length;i++){
								$("<option value= '"+d[i].id+"'>"+d[i].text+"</option>").appendTo("#"+ids[j]);
							}
						}
						$("#adduserid").val("${flow.adduserid}")
					}
				});	  
			}

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
			
			function loadInfo(sprId,op){
				window.parent.location = "${contextPath}/seaPatorl/swPatorl_loadSprById.do?op=" + op + "&&spr.id=" + sprId;
			}
		</script>

	</body>

</html>