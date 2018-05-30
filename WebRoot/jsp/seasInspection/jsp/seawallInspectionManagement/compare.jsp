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
					<a href="#">信息录入</a>
				</li>
			</ul>
		</div>
		<div id="usual1" class="usual">
			<div class="leftinfo1">
				<div class="itab">
					<ul>
						<c:choose>
							<c:when test="${op eq '1'}">
								<li>
									<a href="#tab1">信息录入</a>
								</li>
								<li>
									<a href="#tab2" class="selected">比对结果</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="#tab1" class="selected">信息录入</a>
								</li>
								<li>
									<a href="#tab2">比对结果</a>
								</li>
							</c:otherwise>
						</c:choose>
						
					</ul>
				</div>
				<div class="formbody">
					<div id="tab1" class="tabson">
		    		<s:form id="sprForm" method="post" action="swPatorl_compareInfo.do" namespace="/seaPatorl">
		    			<s:hidden name="compare.id"></s:hidden>
		    			<s:hidden name="compare.addtime"></s:hidden>
		    			<s:hidden name="compare.addusername"></s:hidden>
		    			<s:hidden name="compare.adduserid"></s:hidden>
						<table width="100%" class="tablelist2" align="center">
							<col width="15%"></col>
							<col width="35%"></col>
							<col width="15%"></col>
							<col width="35%"></col>
							<th colspan="4" style="text-align:center;">信息录入</th>
							<tr>
								<td style="background-color:#e8edef;">用海项目：</td>
								<td colspan="3">
									<s:select name="compare.projectId" id="projectId" list="#{'':'-请选择-'}" cssClass="scinput"  cssStyle="width:82%;height:25px;"></s:select>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">海域用途：</td>
								<td colspan="3">
									<s:textfield name="compare.seaAreaUse" cssClass="scinput" cssStyle="width:82%;height:25px;"></s:textfield>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">项目性质：</td>
								<td>
									<s:select list="#{'':'-请选择-'}" name="compare.projectNature" id="projectNature" cssClass="scinput" cssStyle="width:50%;height:25px;"></s:select>
								</td>
								<td style="background-color:#e8edef;">用海方式：</td>
								<td>
									<s:select name="compare.seaUseWay" id="seaUseWay" list="#{'':'-请选择-'}" cssClass="scinput" cssStyle="width:50%;"></s:select>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">用海范围：</td>
								<td>
									<s:select name="compare.seaUseRange" id="seaUseRange" cssClass="scinput" cssStyle="width:50%;" list="#{'':'-请选择-'}"></s:select>
								</td>
								<td style="background-color:#e8edef;">用海面积：</td>
								<td>
									<s:textfield name="compare.seaUseAreage" id="seaUseAreage" cssClass="scinput numDecText" cssStyle="width:50%;height:25px;"></s:textfield>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">用海期限：</td>
								<td>
								
									<s:textfield name="compare.seaUseDeadline" id="seaUseDeadline" cssClass="scinput" cssStyle="width:50%;height:25px;"></s:textfield>
								</td>
								<td style="background-color:#e8edef;">缴纳海域使用金：</td>
								<td>
									<s:select name="compare.isPay" list="#{'':'-请选择-','0':'未支付','1':'已支付'}" cssClass="scinput" cssStyle="width:50%;"></s:select>
								</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align:center;">
									<!--<input type="button" class="scbtn1" name="btn" onclick="window.location='dmcjsb.jsp'" value="保存">-->
									<input type="button" class="scbtn1" name="btn" onclick="submitForm()" value="比对">
									<input name="fh" type="button" value="返回" class="scbtn1" onclick="location='${contextPath}/seaPatorl/swPatorl_loadCompares.do'" />
								</td>
							</tr>
						</table>
		    		</s:form>
					</div>
					<div id="tab2" class="tabson">
					<s:form id="compareForm" method="post" action="swPatorl_saveCompare.do" namespace="/seaPatorl">
		    			<s:hidden name="compare.id"></s:hidden>
		    			<s:hidden name="compare.addtime"></s:hidden>
		    			<s:hidden name="compare.addusername"></s:hidden>
		    			<s:hidden name="compare.adduserid"></s:hidden>
		    			<s:hidden name="compare.projectName"></s:hidden>
						<table width="100%" class="tablelist2" align="center">
							<col width="15%"></col>
							<col width="35%"></col>
							<col width="35%"></col>
							<col width="15%"></col>
							<th colspan="4" style="text-align:center;">比对结果</th>
							<tr>
								<td style="background-color:#e8edef;">用海项目：</td>
								<td colspan="3">
									<s:select name="compare.projectId" id="projectId0" list="#{'':'-请选择-'}" cssClass="scinput"  cssStyle="width:82%;height:25px;"></s:select>
								</td>
							</tr>
							<tr>
								<th style="text-align:center;" colspan="2">巡查数据</th>
								<th style="text-align:center;" colspan="2">系统记录</th>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">海域用途：</td>
								<td>
									<s:textfield name="compares[0].seaAreaUse" cssClass="scinput" cssStyle="width:82%;height:25px;"></s:textfield>
								</td>
								<td>
									<s:textfield name="compares[1].seaAreaUse" cssClass="scinput" cssStyle="width:82%;height:25px;"></s:textfield>
								</td>
								<td>
									<c:choose>
										<c:when test="${compares[0].seaAreaUse eq compares[1].seaAreaUse}"><font color="green">一致</font></c:when>
										<c:otherwise><font color="red">不一致</font></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">项目性质：</td>
								<td>
									<s:select list="#{'':'-请选择-'}" name="compares[0].projectNature" id="projectNature0" cssClass="scinput" cssStyle="width:50%;height:25px;"></s:select>
								</td>
								<td>
									<s:select list="#{'':'-请选择-'}" name="compares[1].projectNature" id="projectNature1" cssClass="scinput" cssStyle="width:50%;height:25px;"></s:select>
								</td>
								<td>
									<c:choose>
										<c:when test="${compares[0].projectNature eq compares[1].projectNature}"><font color="green">一致</font></c:when>
										<c:otherwise><font color="red">不一致</font></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">用海方式：</td>
								<td>
									<s:select name="compares[0].seaUseWay" id="seaUseWay0" list="#{'':'-请选择-'}" cssClass="scinput" cssStyle="width:50%;"></s:select>
								</td>
								<td>
									<s:select name="compares[1].seaUseWay" id="seaUseWay1" list="#{'':'-请选择-'}" cssClass="scinput" cssStyle="width:50%;"></s:select>
								</td>
								<td>
									<c:choose>
										<c:when test="${compares[0].seaUseWay eq compares[1].seaUseWay}"><font color="green">一致</font></c:when>
										<c:otherwise><font color="red">不一致</font></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">用海范围：</td>
								<td>
									<s:select name="compares[0].seaUseRange" id="seaUseRange0" cssClass="scinput" cssStyle="width:50%;" list="#{'':'-请选择-'}"></s:select>
								</td>
								<td>
									<s:select name="compares[1].seaUseRange" id="seaUseRange1" cssClass="scinput" cssStyle="width:50%;" list="#{'':'-请选择-'}"></s:select>
								</td>
								<td>
									<c:choose>
										<c:when test="${compares[0].seaUseRange eq compares[1].seaUseRange}"><font color="green">一致</font></c:when>
										<c:otherwise><font color="red">不一致</font></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">用海面积：</td>
								<td>
									<s:textfield name="compares[0].seaUseAreage" id="seaUseAreage" cssClass="scinput numDecText" cssStyle="width:50%;height:25px;"></s:textfield>
								</td>
								<td>
									<s:textfield name="compares[1].seaUseAreage" id="seaUseAreage" cssClass="scinput numDecText" cssStyle="width:50%;height:25px;"></s:textfield>
								</td>
								<td>
									<c:choose>
										<c:when test="${compares[0].seaUseAreage eq compares[1].seaUseAreage}"><font color="green">一致</font></c:when>
										<c:otherwise><font color="red">不一致</font></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">用海期限：</td>
								<td>
									<s:textfield name="compares[0].seaUseDeadline" cssClass="scinput" cssStyle="width:50%;height:25px;"></s:textfield>
								</td>
								<td>
									<s:textfield name="compares[1].seaUseDeadline" cssClass="scinput" cssStyle="width:50%;height:25px;"></s:textfield>
								</td>
								<td>
									<c:choose>
										<c:when test="${compares[0].seaUseDeadline eq compares[1].seaUseDeadline}"><font color="green">一致</font></c:when>
										<c:otherwise><font color="red">不一致</font></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td style="background-color:#e8edef;">缴纳海域使用金：</td>
								<td>
									<s:select name="compares[0].isPay" list="#{'':'-请选择-','0':'未支付','1':'已支付'}" cssClass="scinput" cssStyle="width:50%;"></s:select>
								</td>
								<td>
									<s:select name="compares[1].isPay" list="#{'':'-请选择-','0':'未支付','1':'已支付'}" cssClass="scinput" cssStyle="width:50%;"></s:select>
								</td>
								<td>
									<c:choose>
										<c:when test="${compares[0].isPay eq compares[1].isPay}"><font color="green">一致</font></c:when>
										<c:otherwise><font color="red">不一致</font></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align:center;">
									<!--<input type="button" class="scbtn1" name="btn" onclick="window.location='dmcjsb.jsp'" value="保存">-->
									<input type="button" class="scbtn1" name="btn" onclick="saveCompare()" value="保存比对结果">
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

				getDictionary("项目位置","seaUseRange","${compare.seaUseRange}");
				getDictionary("项目位置","seaUseRange0","${compares[0].seaUseRange}");
				getDictionary("项目位置","seaUseRange1","${compares[1].seaUseRange}");
				
				getDictionary("用海性质","projectNature","${compare.projectNature}");
				getDictionary("用海性质","projectNature0","${compares[0].projectNature}");
				getDictionary("用海性质","projectNature1","${compares[1].projectNature}");
				
				getDictionary("用海方式","seaUseWay","${compare.seaUseWay}");
				getDictionary("用海方式","seaUseWay0","${compares[0].seaUseWay}");
				getDictionary("用海方式","seaUseWay1","${compares[1].seaUseWay}");
				
				getYhxm("projectId","${compare.projectId}");
				getYhxm("projectId0","${compare.projectId}");
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