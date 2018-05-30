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

		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海塘巡查管理</a>
				</li>
				<li>
					<a href="#">地面巡查采集上报管理</a>
				</li>
			</ul>
		</div>

			<div id="usual1" class="usual">
				<div class="leftinfo1">
					<div class="itab">
						<ul>
							<li>
								<a href="#tab1" class="selected">信息上报管理</a>
							</li>
							<li>
								<a href="#tab2">任务管理</a>
							</li>
						</ul>
					</div>
					<div class="formbody">
					<div id="tab1" class="tabson">
						<s:form namespace="/seaPatorl" action="swPatorl_loadSprs.do" method="post">
						<div class="leftinfo1">
							<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
							<table width="100%" align="center" style="text-align:center;">
								<tr>
									<td>问题类别：</td>
									<td align="left">
										<s:select name="spr.stEsclass" id="stEsclass" cssStyle="width:180px;height:25px;" list="#{'':'-请选择-','1':'重点围填海在建项目地面监视监测','2':'疑点疑区监视监测'}"></s:select>
									</td>
			
									<td>所属区县：</td>
									<td>
										<s:select name="spr.stAreacode" id="stAreacode" list="#{'':'-请选择-'}" cssStyle="width:180px;height:25px;" onchange="selectAdress()"></s:select>
									</td>
									<td>上报单编号：</td>
									<td><s:textfield name="spr.stEventsn" cssStyle="width:180px;" ></s:textfield></td>
								</tr>
								<tr>
			
									<td>上报人：</td>
									<td>
										<s:select name="spr.adduserid" id="adduserid" list="#{'':'-请选择-'}" cssStyle="width:180px;"></s:select>
									</td>
									<td>上报时间：</td>
									<td colspan="3" style="text-align:center;">
										<s:textfield onclick="WdatePicker()"  name="spr.addtime" cssStyle="width:150px;"></s:textfield>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<s:textfield onclick="WdatePicker()"  name="spr.lastupdatetime" cssStyle="width:150px;"></s:textfield>
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
						<div class="tools">
							<ul class="toolbar">
								<li>
									<a href="${contextPath}/seaPatorl/swPatorl_toAddSpr.do"><span><img src="${contextPath}/images/seasInspection/t01.png" /></span>新增</a>
								</li>
								<li>
									<a href="javascript:void(0);" onclick="$('#form_1').submit();"><span><img src="${contextPath}/images/seasInspection/t02.png" /></span>修改</a>
								</li>
								<!--<li><a href="zdwth.jsp"><span><img src="${contextPath}/images/seasInspection/t01.png" /></span>重点围填海在建项目地面监视监测</a></li>
        <li><a href="ydyq.jsp"><span><img src="${contextPath}/images/seasInspection/t01.png" /></span>疑点疑区监视监测</a></li>-->
							</ul>
						</div>
						<s:form id="form_1" namespace="/seaPatorl" action="swPatorl_loadSprById.do" method="post">
						<s:hidden name="op" value="1"></s:hidden>
						<table class="tablelist">
							<thead>
								<tr>
									<th style="width:30px;"></th>
									<th>上报单编号</th>
									<th>期限</th>
									<th>问题类别</th>
									<th>上报时间</th>
									<th>上报单位</th>
									<th>上报人</th>
									<th>上报方式</th>
									<th>所属区县</th>
									<th>里程桩</th>
									<th>上报描述</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sprs}" var="spr" varStatus="i">
									<tr>
										<td><input type="radio" name="spr.id" value="${spr.id }" /></td>
										<td>${spr.stEventsn }</td>
										<td>暂无</td>
										<td>${spr.stEsclass }</td>
										<td>${spr.addtime }</td>
										<td>${spr.stReportDepartment }</td>
										<td>${spr.addusername }</td>
										<td>${spr.stReportType }</td>
										<td>${spr.stAreacode }</td>
										<td>${spr.stScopeKm }km + ${spr.stScopem }m</td>
										<td>${spr.stDescription }</td>
										<td>
											<a href="javascript:void(0);" onclick="loadInfo('${spr.id }')" class="tablelink">查看</a>
											<%--信息未上报且为本人新增时--%>
											<c:if test="${sessionScope.user.id eq spr.adduserid && spr.nmState eq '1' }">
												<a href="javascript:void(0);" onclick="delSpr('${spr.id }')" class="tablelink">删除</a>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</s:form>
						<div class="pagin"  align="center">
							${pageBean }
						</div>
						<%--
						<div align="center">
					    	${pageBean}
					    </div>
						--%>
						</div>

					<div id="tab2" class="tabson">
						<div class="rightinfo">
							<iframe name="rwgl" frameborder="0" src="${contextPath}/seaPatorl/swPatorl_loadFlows.do" style="margin:0px;padding: 0px;width: 100%;height: 650px;"></iframe>
						</div>
					</div>
				</div>
				<br />
			</div>
		</div>
		<script type="text/javascript">
			$(function() {
				$("#usual1 ul").idTabs();
				$('.tablelist tbody tr:odd').addClass('odd');
				$("#form_1").submit(function (){
					var id = $("[type=radio][name='spr.id']:checked").val();
					if (id == null || id == "") {
						alert("请选择需修改的记录！")
						return false;
					}
				})



				
				var ids = new Array();
				var names = new Array();
				ids.push("adduserid");
				loadUserCode(ids,names);
				getDictionary("项目位置","stAreacode","${spr.stAreacode}");
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
						$("#adduserid").val("${spr.adduserid}")
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
			
			function loadInfo(sprId){
				location = "${contextPath}/seaPatorl/swPatorl_loadSprById.do?op=3&&spr.id=" + sprId;
			}

			function delSpr(sprId){
				var r = confirm("确定删除此记录？");
				if (r) {
					location = "${contextPath}/seaPatorl/swPatorl_delSprById.do?spr.id=" + sprId;
				}
			}

		</script>

	</body>

</html>