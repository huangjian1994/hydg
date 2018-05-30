<!DOCTYPE html PUBLIC"-/W3C/DTD XHTML 1.0 Transitional/EN"
     "http:/www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*,com.htcf.util.DateUtil" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html xmlns="http:/www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海域海岛巡查</title>

		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
	</head>

	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海塘巡查管理</a>
				</li>
				<li>
					<a href="#">巡查上报单详细信息</a>
				</li>
			</ul>
		</div>
	<div class="formbody">
			<div id="usual1" class="usual">
				<div class="leftinfo1">
					<div class="itab">
						<ul>
							<li>
								<a href="#tab1" class="selected">上报单信息</a>
							</li>
							<li>
								<a href="#tab2">立案信息</a>
							</li>
							<li>
								<a href="#tab3">派遣信息</a>
							</li>
							<li>
								<a href="#tab4">处理信息</a>
							</li>
							<li>
								<a href="#tab5">确认</a>
							</li>
							<li>
								<a href="#tab6">流程信息</a>
							</li>
							<li>
								<a href="#tab7">地图</a>
							</li>
						</ul>
					</div>

					<div id="tab1" class="tabson">
				   		<s:form id="sprForm1" method="post" action="swPatorl_addSpr.do" namespace="/seaPatorl" enctype="multipart/form-data">
				   			<s:hidden name="spr.id"></s:hidden>
				   			<s:hidden name="spr.addtime"></s:hidden>
				   			<s:hidden name="spr.addusername"></s:hidden>
				   			<s:hidden name="spr.adduserid"></s:hidden>
							<table width="100%" class="tablelist2" align="center">
								<col width="15%"></col>
								<col width="35%"></col>
								<col width="15%"></col>
								<col width="35%"></col>
								<th colspan="4" style="text-align:center;">巡查上报单</th>
								<tr>
									<td style="background-color:#e8edef;">问题类别：</td>
									<td colspan="3">
										<s:select disabled="true" name="spr.stEsclass" list="#{'':'-请选择-','1':'重点围填海在建项目地面监视监测','2':'疑点疑区监视监测'}"   cssStyle="width:25%;margin:3px 0px 3px 0px;"></s:select>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">巡查员：</td>
									<td>
										<s:hidden name="stPatrolPersonId" id="stPatrolPersonId"></s:hidden>
										<s:textfield readonly="true" name="spr.stPatrolPerson"  cssStyle="width:50%;height:25px;"></s:textfield>
									</td>
									<td style="background-color:#e8edef;">上报方式：</td>
									<td>
										<s:select disabled="true" name="spr.stReportType" list="#{'':'-请选择-','1':'巡查人员网上上报'}"  cssStyle="width:53%;height:25px;"></s:select>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">所在区县：</td>
									<td>
										<s:select disabled="true" name="spr.stAreacode" id="stAreacode" cssClass="scinput" cssStyle="width:50%;height:25px;" list="#{'':'-请选择-'}"></s:select>
									</td>
									<td style="background-color:#e8edef;">问题桩号范围：</td>
									<td>
										
										<s:textfield readonly="true" name="spr.stScopeKm" cssStyle="width:40px;height:25px;"></s:textfield>&nbsp;&nbsp;km
										&nbsp;+&nbsp;
										<s:textfield readonly="true" name="spr.stScopem" cssStyle="width:40px;height:25px;"></s:textfield>&nbsp;&nbsp;m
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">岸段属性：</td>
									<td>
										<s:select disabled="true" name="spr.stCoastSegmentAttr" list="#{'':'-请选择-','1':'一般岸段'}"  cssStyle="width:53%;height:25px;"></s:select>
									</td>
									<td style="background-color:#e8edef;">发现时间：</td>
									<td>
										<s:textfield readonly="true" name="spr.dtDiscovertime"  cssStyle="width:50%;height:25px;"></s:textfield>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">情况描述：</td>
									<td colspan="3">
										<s:textarea readonly="true" name="spr.stDescription"  cssStyle="width:82%;height:60px;"></s:textarea>
									</td>
								</tr>
				
								<tr style="height:180px;">
									<td style="background-color:#e8edef;">附件：
									</td>
									<td id="imgTd" colspan="3">
										<c:forEach items="${spr.attachments }" var="img">
											<img id="imgDiv" src="${contextPath}/seaPatorl/swPatorl_loadImg.do?path=${img.path }" style="margin-right:5px;width:180px;height:150px;float:left;">
										</c:forEach>
									</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center;">
										<input name="fh" type="button" value="返回" class="scbtn1" onclick="location='${contextPath}/seaPatorl/swPatorl_loadSprs.do'" />
									</td>
								</tr>
							</table>
				   		</s:form>
					</div>
					<div id="tab2" class="tabson">
					<c:if test="${fn:length(flows) > 0}">
				   		<s:form id="flowForm2" method="post" action="swPatorl_finishStep.do" namespace="/seaPatorl" enctype="multipart/form-data">
				   			<s:hidden name="flows[0].id"></s:hidden>
				   			<s:hidden name="flows[0].addtime"></s:hidden>
				   			<s:hidden name="flows[0].addusername"></s:hidden>
				   			<s:hidden name="flows[0].adduserid"></s:hidden>
				   			<s:hidden name="flows[0].opType"></s:hidden>
				   			<s:hidden name="flows[0].stPatrolId"></s:hidden>
				   			
							<table width="100%" class="tablelist2" align="center">
								<col width="15%"></col>
								<col width="35%"></col>
								<col width="15%"></col>
								<col width="35%"></col>
								<th colspan="4" style="text-align:center;">立案信息</th>
								<tr>
									<td style="background-color:#e8edef;">立案人员：</td>
									<td>
											<s:hidden name="flows[0].personId"></s:hidden>
											<s:textfield readonly="true" name="flows[0].person"  cssStyle="width:50%;height:25px;"></s:textfield>
									</td>
									<td style="background-color:#e8edef;">立案时间：</td>
									<s:if test="flows[0].opStatus != 1">
										<td>
											<%=DateUtil.dateToString(new Date(),"yyyy-MM-dd HH:mm:ss") %>
										</td>
									</s:if>
									<s:else>
										<td>
											<s:textfield readonly="true" name="flows[0].opTime"  cssStyle="width:50%;height:25px;"></s:textfield>
										</td>
									</s:else>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">审核操作：</td>
									<td colspan="3">
										<s:select name="flows[0].opWay" list="#{'11':'立案通过','10':'不予立案'}"  cssStyle="width:53%;"></s:select>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">立案意见：</td>
									<td colspan="3">
										<s:textarea name="flows[0].remark"  cssStyle="width:82%;height:60px;"></s:textarea>
									</td>
								</tr>
								
								<tr class="op3">
									<s:if test="flows[0].opStatus != 1">
										<td style="background-color:#e8edef;">派遣人：</td>
										<td colspan="3" style="text-align:center;">
											<s:select name="apprPersonId" id="apprPersonId" list="#{'':'-请选择-'}" cssClass="scinput" cssStyle="width:53%;"></s:select>
											<s:hidden name="apprPersonName" id="apprPersonName"></s:hidden>
										</td>
									</s:if>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center;">
										<s:if test="flows[0].opStatus != 1">
											<input type="submit" value="立案" class="scbtn1 op3" />
										</s:if>
										<input type="button" value="返回" class="scbtn1" onclick="location='${contextPath}/seaPatorl/swPatorl_loadSprs.do'" />
									</td>
								</tr>
							</table>
				   		</s:form>
					</c:if>
					</div>
					<div id="tab3" class="tabson">
					<c:if test="${fn:length(flows) > 1}">
				   		<s:form id="flowForm3" method="post" action="swPatorl_finishStep.do" namespace="/seaPatorl" enctype="multipart/form-data">
				   			<s:hidden name="flows[1].id"></s:hidden>
				   			<s:hidden name="flows[1].addtime"></s:hidden>
				   			<s:hidden name="flows[1].addusername"></s:hidden>
				   			<s:hidden name="flows[1].adduserid"></s:hidden>
				   			<s:hidden name="flows[1].opType"></s:hidden>
				   			<s:hidden name="flows[1].stPatrolId"></s:hidden>
				   			
							<table width="100%" class="tablelist2" align="center">
								<col width="15%"></col>
								<col width="35%"></col>
								<col width="15%"></col>
								<col width="35%"></col>
								<th colspan="4" style="text-align:center;">派遣信息</th>
								<tr>
									<td style="background-color:#e8edef;">派遣人员：</td>
									<td>
											<s:hidden name="flows[1].personId"></s:hidden>
											<s:textfield readonly="true" name="flows[1].person"  cssStyle="width:50%;height:25px;"></s:textfield>
									</td>
									<td style="background-color:#e8edef;">派发时间：</td>
									<s:if test="flows[1].opStatus != 1">
										<td>
											<%=DateUtil.dateToString(new Date(),"yyyy-MM-dd HH:mm:ss") %>
										</td>
									</s:if>
									<s:else>
										<td>
											<s:textfield readonly="true" name="flows[1].opTime"  cssStyle="width:50%;height:25px;"></s:textfield>
										</td>
									</s:else>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">派发类型：</td>
									<td>
										<s:textfield name="flows[1].opWay"  cssStyle="width:50%;height:25px;"></s:textfield>
										<!--<s:select name="flows[1].opWay" list="#{'1':'立案通过','00':'退回'}"  cssStyle="width:53%;"></s:select>
									--></td>
									<td style="background-color:#e8edef;">处理期限：</td>
									<td>
										<s:textfield name="flows[1].deadline"  cssStyle="width:50%;height:25px;"></s:textfield>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">派发意见：</td>
									<td colspan="3">
										<s:textarea name="flows[1].remark"  cssStyle="width:82%;height:60px;"></s:textarea>
									</td>
								</tr>
								<tr class="op3">
									<s:if test="flows[1].opStatus != 1">
										<td style="background-color:#e8edef;">处理人：</td>
										<td colspan="3" style="text-align:center;">
											<s:select name="apprPersonId" id="apprPersonId" list="#{'':'-请选择-'}" cssClass="scinput" cssStyle="width:53%;"></s:select>
											<s:hidden name="apprPersonName" id="apprPersonName"></s:hidden>
										</td>
									</s:if>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center;">
										<s:if test="flows[1].opStatus != 1">
											<input type="submit" value="派发" class="scbtn1 op3" />
										</s:if>
										<input type="button" value="返回" class="scbtn1" onclick="location='${contextPath}/seaPatorl/swPatorl_loadSprs.do'" />
									</td>
								</tr>
							</table>
				   		</s:form>
					</c:if>
					</div>
					<div id="tab4" class="tabson">
					
					<c:forEach items="${flows}" var="flow" varStatus="i">
						<c:if test="${i.index > 1 && i.index % 2 == 0  }">
				   		<s:form method="post" action="swPatorl_finishStep.do" namespace="/seaPatorl" enctype="multipart/form-data">
				   			<input type="hidden" name="flows[${i.index }].id" value="${flow.id }"/>
				   			<input type="hidden" name="flows[${i.index }].addtime" value="${flow.addtime }"/>
				   			<input type="hidden" name="flows[${i.index }].addusername" value="${flow.addusername }"/>
				   			<input type="hidden" name="flows[${i.index }].adduserid" value="${flow.adduserid }"/>
				   			<input type="hidden" name="flows[${i.index }].opType" value="${flow.opType }"/>
				   			<input type="hidden" name="flows[${i.index }].stPatrolId" value="${flow.stPatrolId }"/>
				   			
							<table width="100%" class="tablelist2" align="center">
								<col width="15%"></col>
								<col width="35%"></col>
								<col width="15%"></col>
								<col width="35%"></col>
								<th colspan="4" style="text-align:center;">处理信息</th>
								<tr>
									<td style="background-color:#e8edef;">处理人员：</td>
									<td>
										<input type="hidden" name="flows[${i.index }].personId" value="${flow.personId }"/>
										<input type="text" readonly="readonly" name="flows[${i.index }].person" value="${flow.person }" class="scinput" style="width:50%;" />
									</td>
									<td style="background-color:#e8edef;">处理时间：</td>
									<c:choose>
										<c:when test="${flow.opStatus == 1}">
											<td>
												<input name="flows[${i.index }].opTime" class="scinput" value="${flow.person }" style="width:50%;"/>
											</td>
										</c:when>
										<c:otherwise>
											<td>
												<%=DateUtil.dateToString(new Date(),"yyyy-MM-dd HH:mm:ss") %>
											</td>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">处理类型：</td>
									<td colspan="3">
										<input name="flows[${i.index }].opWay" value="${flow.opWay }" class="scinput" style="width:50%;"/>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">处理意见：</td>
									<td colspan="3">
										<textarea name="flows[${i.index}].remark" class="scinput" style="width:82%;height:60px;">${flow.remark }</textarea>
									</td>
								</tr>
								<tr class="op3">
									<c:if test="${flow.opStatus != 1}">
										<td style="background-color:#e8edef;">确认人：</td>
										<td colspan="3" style="text-align:center;">
											<s:select name="apprPersonId" id="apprPersonId" list="#{'':'-请选择-'}" cssClass="scinput" cssStyle="width:53%;"></s:select>
											<s:hidden name="apprPersonName" id="apprPersonName"></s:hidden>
										</td>
									</c:if>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center;">
										<c:if test="${flow.opStatus != 1}">
											<input type="submit" value="提交" class="scbtn1 op3" />
										</c:if>
										<input type="button" value="返回" class="scbtn1" onclick="location='${contextPath}/seaPatorl/swPatorl_loadSprs.do'" />
									</td>
								</tr>
							</table>
				   		</s:form>
					</c:if>
					</c:forEach>
					</div>
					<div id="tab5" class="tabson">
					<c:forEach items="${flows}" var="flow" varStatus="i">
						<c:if test="${i.index > 2 && i.index % 2 != 0  }">
				   		<s:form id="flowForm4" method="post" action="swPatorl_finishStep.do" namespace="/seaPatorl" enctype="multipart/form-data">
				   			<input type="hidden" name="flows[${i.index }].id" value="${flow.id }"/>
				   			<input type="hidden" name="flows[${i.index }].addtime" value="${flow.addtime }"/>
				   			<input type="hidden" name="flows[${i.index }].addusername" value="${flow.addusername }"/>
				   			<input type="hidden" name="flows[${i.index }].adduserid" value="${flow.adduserid }"/>
				   			<input type="hidden" name="flows[${i.index }].opType" value="${flow.opType }"/>
				   			<input type="hidden" name="flows[${i.index }].stPatrolId" value="${flow.stPatrolId }"/>
				   			<%--确认人员--%>
				   			<input type="hidden" name="flows[${i.index }].personId" value="${sessionScope.user.id }"/>
							<input type="hidden" name="flows[${i.index }].person" value="${sessionScope.user.name }" />
							
							<table width="100%" class="tablelist2" align="center">
								<col width="25%"></col>
								<col width="75%"></col>
								<th colspan="2" style="text-align:center;">确认</th>
								<tr>
									<td style="background-color:#e8edef;">确认类型：</td>
									<td >
										<select name="flows[${i.index }].opWay" class="scinput" style="width:53%;">
											<c:choose>
												<c:when test="${flow.opWay eq '00'}">
													<option value="01">确认完成</option>
													<option value="00" selected="selected">退回派发</option>
												</c:when>
												<c:otherwise>
													<option value="01" selected="selected">确认完成</option>
													<option value="00">退回派发</option>
												</c:otherwise>
											</c:choose>
											
										</select>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">确认附件：</td>
									<td>
										<c:choose>
											<c:when test="${flow.opStatus != 1}">
												<input type="file" name="dealFile" class="scinput" style="width:53%;" />
											</c:when>
											<c:otherwise>
												<input type="button" value="下载" class="scbtn1" onclick="downloadFile('${flow.id}')" />
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">确认意见：</td>
									<td>
										<textarea name="flows[${i.index}].remark" class="scinput" style="width:82%;height:60px;">${flow.remark }</textarea>
									</td>
								</tr>
				
								<tr>
									<td colspan="4" style="text-align:center;">
										<c:if test="${flow.opStatus != 1}">
											<input type="submit" value="确认" class="scbtn1 op3" />
										</c:if>
										<input type="button" value="返回" class="scbtn1" onclick="location='${contextPath}/seaPatorl/swPatorl_loadSprs.do'" />
									</td>
								</tr>
							</table>
				   		</s:form>
				   		</c:if>
					</c:forEach>
					</div>
					<div id="tab6" class="tabson">
						<table class="tablelist">
							<thead>
								<tr>
									<th>序号</th>
									<th>流程</th>
									<th>处理方式</th>
									<th>操作人员</th>
									<th>操作时间</th>
									<th>备注</th>
									<th>操作状态</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${fn:length(flows) > 0}">
									<tr>
										<td>1</td>
										<td>上报</td>
										<td>信息上报</td>
										<td>${spr.addusername }</td>
										<td>${spr.addtime }</td>
										<td>${spr.stDescription }</td>
										<td>已完成</td>
									</tr>
								</c:if>
								<c:forEach items="${flows}" var="flow" varStatus="i">
									<tr>
										<td>${i.index + 2 }</td>
										<td>
											<c:choose>
												<c:when test="${flow.opType == 2 }">立案</c:when>
												<c:when test="${flow.opType == 3 }">派遣</c:when>
												<c:when test="${flow.opType == 4 }">处理</c:when>
												<c:when test="${flow.opType == 5 }">确认</c:when>
											</c:choose>
										
										</td>
										<td>
											<c:choose>
												<c:when test="${flow.opWay == '10' }">不予立案</c:when>
												<c:when test="${flow.opWay == '11' }">立案通过</c:when>
												<c:when test="${flow.opWay == '00' }">退回派发</c:when>
												<c:when test="${flow.opWay == '01' }">确认完成</c:when>
												<c:otherwise>${flow.opWay}</c:otherwise>
											</c:choose>
										</td>
										<td>${flow.person }</td>
										<td>${flow.opTime }</td>
										<td>${flow.remark }</td>
										<td>
											<c:choose>
												<c:when test="${flow.opStatus == 0 }">处理中</c:when>
												<c:when test="${flow.opStatus == 1 }">已处理</c:when>
											</c:choose>
											<c:if test="${!(flow.attachment eq null) }">
												<input type="button" value="附件" class="scbtn1" onclick="downloadFile('${flow.id}')" />
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
			</div>
		</div>
	</div>
	</body>
	<script type="text/javascript">

			$(function() {
				if ( '3' == '${op}' ) {
					$(".op3").remove();
				}
				
				$("#usual1 ul").idTabs();
				getDictionary("项目位置","stAreacode","${spr.stAreacode}");
				var uids = new Array();
				var unames = new Array();
				uids.push("apprPersonId");
				unames.push("apprPersonName");
				loadUserCode(uids,unames);
			})
			
			function downloadFile(id){
				location = "${contextPath}/seaPatorl/swPatorl_downloadFlowAttachment.do?flow.id=" + id;
			}

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
						for(var i=0;i<d.length;i++){
							for ( var j = 0; j < ids.length; j++) {
								$("<option value= '"+d[i].id+"'>"+d[i].text+"</option>").appendTo("#"+ids[j]);
							}
						}
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

		</script>
</html>