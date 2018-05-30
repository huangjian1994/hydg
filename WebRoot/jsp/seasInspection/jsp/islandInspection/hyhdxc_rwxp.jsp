<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海域海岛巡查</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript">

            //查询
            function goSearch(){
                document.myForm.action="<%=basePath%>/seaIslandPatrol/seaIslandPatrol_fetchXcjh.do";
                document.myForm.target="_self";
                document.myForm.submit();

            }

            //重置
            function goCz(){
                document.getElementById("patrolname").value="";
                document.getElementById("fillingdw").value="";
                document.getElementById("leadername").value="";
                document.getElementById("drafetdate").value="";
                document.getElementById("drafepeoplename").value="";
                document.getElementById("planstatus").value="";

            }

            //详情
            function xcjhDetail(jhId){
                document.getElementById("jhId").value = jhId;
                document.myForm.action="<%=basePath%>/seaIslandPatrol/seaIslandPatrol_xcjhDetail.do";
                document.myForm.target="_self";
                document.myForm.submit();
            }

            //修改
            function xcjhtUpdate(jhId){
                document.getElementById("jhId").value = jhId;
                document.myForm.action="<%=basePath%>/seaIslandPatrol/seaIslandPatrol_getXcjhUpdate.do";
                document.myForm.target="_self";
                document.myForm.submit();
            }
            //删除
            function deleteXcjh(jhId){
                document.getElementById("jhId").value = jhId;
                if(confirm("确定删除该记录吗？")){
                    document.myForm.action="<%=basePath%>/seaIslandPatrol/seaIslandPatrol_deleteXcjh.do";
                    document.myForm.target="_self";
                    document.myForm.submit();
                }
            }
		</script>
	</head>
	<body>
	<form id="myForm" name="myForm" method="post">
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海域海岛巡查</a></li>
				<li><a href="#">巡查任务计划</a></li>
			</ul>
		</div>
		<input name="jhId" id="jhId" value="" type="hidden" />

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3">
					<img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询
				</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>计划任务名称：</td>
						<td><input name="xcjhEntity.patrolname" id="patrolname"
								   type="text"  value="" style="width:180px;" />
						</td>
						<td>填表单位：</td>
						<td><input name="xcjhEntity.fillingdw" id="fillingdw"
								   type="text" value="${xcjhEntity.fillingdw }" style="width:180px;" />
						</td>
						<td>领队人姓名：</td>
						<td><input name="xcjhEntity.leadername" id="leadername"
								   type="text" value="${xcjhEntity.leadername }" style="width:180px;" />
						</td>

					</tr>
					<tr>
						<td>制定日期：</td>
						<td><input name="xcjhEntity.drafetdate" id="drafetdate" type="text"
								   value="${xcjhEntity.drafetdate }" style="width:180px;" onclick="WdatePicker()" readonly="readonly" /></td>
						<td>制定人姓名：</td>
						<td><input name="xcjhEntity.drafepeoplename" id="drafepeoplename"
								   type="text" value="${xcjhEntity.drafepeoplename }" style="width:180px;" />
						</td>
						<td align="right">计划状态：</td>
						<td align="left">
							<select name="xcjhEntity.planstatus" id="planstatus" style="width:180px;height:25px;">
								<option value="" selected="selected">-请选择-</option>
								<option value="未审核" >未审核</option>
								<option value="审核通过">审核通过</option>
								<option value="审核未通过">审核未通过</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<input name="" type="button" class="scbtn1" value="查询" onclick="goSearch()"/>
							<input name="" type="button" class="scbtn1" value="重置" onclick="goCz()"/>
						</td>
					</tr>
				</table>
			</div>
			<br />
			<div class="tools">
				<ul class="toolbar">
					<li>
						<a href="${contextPath}/jsp/seasInspection/jsp/islandInspection/xcjhgl_add.jsp">
							<span><img src="${contextPath}/images/seasInspection/t01.png" /></span>新增任务</a>
					</li>
				</ul>
			</div>
			<table class="tablelist">
				<thead>
					<tr>
						<th>序号</th>
						<th>计划任务名称</th>
						<th>填表单位</th>
						<th>领队姓名</th>
						<th>巡查方式</th>
						<th>制定人姓名</th>
						<th>制定日期</th>
						<th>计划推送状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${ xcjhList }" var="r" varStatus="j">
					<tr>
						<td>${j.count }</td>
						<td>${r.patrolname }</td>
						<td>${r.fillingdw }</td>
						<td>${r.leadername }</td>
						<td>${r.inspectionmode }</td>
						<td>${r.drafepeoplename }</td>
						<td>${r.drafetdate }</td>
						<td>${r.planstatus }</td>
						<td>
							<c:if test="${r.planstatus == '未审核' or r.planstatus =='审核不通过'}">
								<a href="###" onclick="xcjhDetail('${r.id }')" class="tablelink">详情</a>
								<a href="###" onclick="xcjhtUpdate('${r.id }')" class="tablelink">修改</a>
								<a href="###" onclick="deleteXcjh('${r.id }')" class="tablelink">删除</a>
							</c:if>
							<c:if test="${r.planstatus == '审核通过' or r.planstatus =='已巡查'}">
								<a href="###" onclick="xcjhDetail('${r.id }')" class="tablelink">详情</a>

							</c:if>

						</td>
					</tr>
				</c:forEach>
				</tbody>

			</table>			
		</div>

	</form>
	<div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
	</body>
</html>