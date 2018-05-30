<!DOCTYPE html PUBLIC"-/W3C/DTD XHTML 1.0 Transitional/EN"
     "http:/www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>比对信息录入</title>
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
					<a href="#">系统比对</a>
				</li>
				<li>
					<a href="#">比对信息</a>
				</li>
			</ul>
		</div>
		<div id="usual1" class="usual">
			<div class="leftinfo1">
				<div class="itab">
					<ul>
						<li>
							<a href="#tab1">比对信息</a>
						</li>
					</ul>
				</div>
				<div class="formbody">
					<div id="tab1" class="tabson">
					<s:form id="compareForm" method="post" action="swPatorl_saveCompare.do" namespace="/seaPatorl">
						<table width="100%" class="tablelist2" align="center">
							<col width="15%"></col>
							<col width="35%"></col>
							<col width="15%"></col>
							<col width="20%"></col>
							<col width="15%"></col>
							<tr>
								<td style="background-color:#e8edef;">用海项目：</td>
								<td colspan="5">
									<s:select name="compareResult.projectId" id="projectId" list="#{'':'-请选择-'}" cssClass="scinput"  cssStyle="width:82%;height:25px;"></s:select>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">比对人:</td>
								<td>
									<s:textfield name="compareResult.addusername" cssClass="scinput" cssStyle="width:82%;height:25px;"></s:textfield>
								</td>
								<td style="background-color:#e8edef;">比对时间:</td>
								<td colspan="2">
									<s:textfield name="compareResult.lastupdatetime" cssClass="scinput" cssStyle="width:82%;height:25px;"></s:textfield>
								</td>
							</tr>
							<tr>
								<th style="text-align:center;" colspan="2">巡查数据</th>
								<th style="text-align:center;" colspan="2">系统记录</th>
								<th style="text-align:center;">比对结果</th>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">海域用途：</td>
								<td>
									<s:textfield name="compareResult.seaAreaUse[1]" cssClass="scinput" cssStyle="width:82%;height:25px;"></s:textfield>
								</td>
								<td colspan="2">
									<s:textfield name="compareResult.seaAreaUse[2]" cssClass="scinput" cssStyle="width:82%;height:25px;"></s:textfield>
								</td>
								<td>
									<c:choose>
										<c:when test="${compareResult.seaAreaUse[0] eq '1'}"><font color="green">一致</font></c:when>
										<c:otherwise><font color="red">不一致</font></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">项目性质：</td>
								<td>
									<s:select list="#{'':'-请选择-'}" name="compareResult.projectNature[1]" id="projectNature0" cssClass="scinput" cssStyle="width:50%;height:25px;"></s:select>
								</td>
								<td colspan="2">
									<s:select list="#{'':'-请选择-'}" name="compareResult.projectNature[2]" id="projectNature1" cssClass="scinput" cssStyle="width:50%;height:25px;"></s:select>
								</td>
								<td>
									<c:choose>
										<c:when test="${compareResult.projectNature[0] eq '1'}"><font color="green">一致</font></c:when>
										<c:otherwise><font color="red">不一致</font></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">用海方式：</td>
								<td>
									<s:select name="compareResult.seaUseWay[1]" id="seaUseWay0" list="#{'':'-请选择-'}" cssClass="scinput" cssStyle="width:50%;"></s:select>
								</td>
								<td colspan="2">
									<s:select name="compareResult.seaUseWay[2]" id="seaUseWay1" list="#{'':'-请选择-'}" cssClass="scinput" cssStyle="width:50%;"></s:select>
								</td>
								<td>
									<c:choose>
										<c:when test="${compareResult.seaUseWay[0] eq '1'}"><font color="green">一致</font></c:when>
										<c:otherwise><font color="red">不一致</font></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">用海范围：</td>
								<td>
									<s:select name="compareResult.seaUseRange[1]" id="seaUseRange0" cssClass="scinput" cssStyle="width:50%;" list="#{'':'-请选择-'}"></s:select>
								</td>
								<td colspan="2">
									<s:select name="compareResult.seaUseRange[2]" id="seaUseRange1" cssClass="scinput" cssStyle="width:50%;" list="#{'':'-请选择-'}"></s:select>
								</td>
								<td>
									<c:choose>
										<c:when test="${compareResult.seaUseRange[0] eq '1'}"><font color="green">一致</font></c:when>
										<c:otherwise><font color="red">不一致</font></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">用海面积：</td>
								<td>
									<s:textfield name="compareResult.seaUseAreage[1]" id="seaUseAreage" cssClass="scinput numDecText" cssStyle="width:50%;height:25px;"></s:textfield>
								</td>
								<td colspan="2">
									<s:textfield name="compareResult.seaUseAreage[2]" id="seaUseAreage" cssClass="scinput numDecText" cssStyle="width:50%;height:25px;"></s:textfield>
								</td>
								<td>
									<c:choose>
										<c:when test="${compareResult.seaUseAreage[0] eq '1'}"><font color="green">一致</font></c:when>
										<c:otherwise><font color="red">不一致</font></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">用海期限：</td>
								<td>
									<s:textfield name="compareResult.seaUseDeadline[1]" cssClass="scinput" cssStyle="width:50%;height:25px;"></s:textfield>
								</td>
								<td colspan="2">
									<s:textfield name="compareResult.seaUseDeadline[2]" cssClass="scinput" cssStyle="width:50%;height:25px;"></s:textfield>
								</td>
								<td>
									<c:choose>
										<c:when test="${compareResult.seaUseDeadline[0] eq '1'}"><font color="green">一致</font></c:when>
										<c:otherwise><font color="red">不一致</font></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">缴纳海域使用金：</td>
								<td>
									<s:select name="compareResult.isPay[1]" list="#{'':'-请选择-','0':'未支付','1':'已支付'}" cssClass="scinput" cssStyle="width:50%;"></s:select>
								</td>
								<td colspan="2">
									<s:select name="compareResult.isPay[2]" list="#{'':'-请选择-','0':'未支付','1':'已支付'}" cssClass="scinput" cssStyle="width:50%;"></s:select>
								</td>
								<td>
									<c:choose>
										<c:when test="${compareResult.isPay[0] eq '1'}"><font color="green">一致</font></c:when>
										<c:otherwise><font color="red">不一致</font></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td colspan="5" style="text-align:center;">
									<input name="fh" type="button" value="返回" class="scbtn1" onclick="location='${contextPath}/seaPatorl/swPatorl_loadCompares.do'" />
								</td>
							</tr>
						</table>
		    		</s:form>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
			$(function() {
				$("#usual1 ul").idTabs();
				$('tr:odd').addClass('odd');
				//限制文本框只能输入数字
				$(".numText").keyup(function(){    
	                $(this).val($(this).val().replace(/\D|^0/g,''));
	            }).bind("paste",function(){
	                $(this).val($(this).val().replace(/\D|^0/g,''));     
	            }).css("ime-mode", "disabled");
				//限制文本框只能输入数字和小数点
				$(".numDecText").keyup(function(){    
	                $(this).val($(this).val().replace(/[^0-9.]/g,''));    
                }).bind("paste",function(){
                    $(this).val($(this).val().replace(/[^0-9.]/g,''));     
                }).css("ime-mode", "disabled");

				getDictionary("项目位置","seaUseRange0","${compareResult.seaUseRange[1]}");
				getDictionary("项目位置","seaUseRange1","${compareResult.seaUseRange[2]}");
				
				getDictionary("用海性质","projectNature0","${compareResult.projectNature[1]}");
				getDictionary("用海性质","projectNature1","${compareResult.projectNature[2]}");
				
				getDictionary("用海方式","seaUseWay0","${compareResult.seaUseWay[1]}");
				getDictionary("用海方式","seaUseWay1","${compareResult.seaUseWay[2]}");
				
				getYhxm("projectId","${compare.projectId}");
			})
			
			function submitForm(){
				$("#sprForm").submit();
			}

			function saveCompare(){
				$("#compareForm").submit();
			}


			//用海项目
			function getYhxm(selectID,val){
				$.ajax({		  		
					type: "post",
					dataType:"json",
					url: "${contextPath}/seaPatorl/swPatorl_getXmCode.do",
					success: function(d){
						for(var i=0;i<d.length;i++){
							$("<option value= '"+d[i][0]+"'>"+d[i][1]+"</option>").appendTo("#"+selectID);
						}
						$("#"+selectID).val(val)
					}
				});	  
			}
			
			//加载字典
			function getDictionary(keyZ,selectID,historyZ){
				$.ajax({		  		
					type: "post",
					dataType:"json",
					url: "${contextPath}/business/business_fetchDictionary.do",
					data: "dictionary.key="+keyZ,
					success: function(d){
						for(var i=0;i<d.length;i++){
							if(d[i].dm==historyZ){
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