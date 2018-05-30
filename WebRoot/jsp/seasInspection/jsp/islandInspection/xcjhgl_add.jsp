<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>巡查计划管理</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
	</head>
	<script>

        function saveXcjh(){
            if(document.getElementById("patrolname").value ==""){
                alert("计划任务名称不允许为空！");
                return false;
            }
            if(document.getElementById("fillingdw").value ==""){
                alert("填表单位不允许为空！");
                return false;
            }
            if(document.getElementById("begintime").value ==""){
                alert("起始时间不允许为空！");
                return false;
            }
            if(document.getElementById("endtime").value ==""){
                alert("结束时间不允许为空！");
                return false;
            }
            if(document.getElementById("leadername").value ==""){
                alert("领队名称不允许为空！");
                return false;
            }
            if(document.getElementById("inspectionmode").value ==""){
                alert("巡查方式不允许为空！");
                return false;
            }
            if(document.getElementById("peoplename").value ==""){
                alert("派出人员不允许为空！");
                return false;
            }
            if(document.getElementById("east").value ==""){
                alert("东经不允许为空！");
                return false;
            }
            if(document.getElementById("south").value ==""){
                alert("南经不允许为空！");
                return false;
            }
            if(document.getElementById("west").value ==""){
                alert("西经不允许为空！");
                return false;
            }
            if(document.getElementById("north").value ==""){
                alert("北经不允许为空！");
                return false;
            }
            if(document.getElementById("substance").value ==""){
                alert("巡查内容不允许为空！");
                return false;
            }
            if(document.getElementById("locationdesrcription").value ==""){
                alert("巡查地点描述不允许为空！");
                return false;
            }
  /*          if(document.getElementById("drafepeoplename").value ==""){
                alert("制定人不允许为空！");
                return false;
            }
            if(document.getElementById("drafetdate").value ==""){
                alert("制定日期不允许为空！");
                return false;
            }*/

            document.myForm.action="<%=basePath%>/seaIslandPatrol/seaIslandPatrol_addXcjh.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }

        //返回
        function goBack(){
            document.myForm.action="<%=basePath%>/seaIslandPatrol/seaIslandPatrol_fetchXcjhBack.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }

	</script>
	<body>
	<form name="myForm" method="post" enctype="multipart/form-data">
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海域海岛巡查</a></li>
				<li><a href="#">巡查问题上报</a></li>
			</ul>
		</div>
		<div align="center">
			<div class="mainbox">
				<div class="leftinfo1">
					<div class="listtitle3">
						<img src="${contextPath}/images/seasInspection/i02.png" width="25" height="25" />新增
					</div>
					<div id="usual1" class="usual">
						<div id="tab1" class="tabson">
							<table width="100%" align="center" style="text-align:left;" class="tableXQ" cellSpacing='12' cellPadding='12'>
								<tr>
									<td style="background-color:#e8edef;">计划任务名称：</td>
									<td><input name="xcjhEntity.patrolname" id="patrolname" type="text"
												   class="scinput" value="" style="width:200px;" /><font color="red">*</font></td>
									<td style="background-color:#e8edef;">填表单位：</td>
									<td><input name="xcjhEntity.fillingdw" id="fillingdw" type="text"
											   class="scinput" value="" style="width:200px;" /><font color="red">*</font></td>

								</tr>
								<tr>
									<td style="background-color:#e8edef;">起始时间：</td>
									<td><input name="xcjhEntity.begintime" id="begintime" type="text" class="scinput" value=""
											   onclick="WdatePicker()" readonly="readonly"  style="width:200px;" /><font color="red">*</font></td>
									<td style="background-color:#e8edef;">结束时间：</td>
									<td><input name="xcjhEntity.endtime" id="endtime" type="text" class="scinput" value=""
											   onclick="WdatePicker()" readonly="readonly" style="width:200px;" /><font color="red">*</font></td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">领队名称：</td>
									<td><input name="xcjhEntity.leadername" id="leadername" type="text"
											   class="scinput" value="" style="width:200px;" /><font color="red">*</font></td>
									<td style="background-color:#e8edef;">巡查方式：</td>
									<td><input name="xcjhEntity.inspectionmode" id="inspectionmode" type="text"
											   class="scinput" value="" style="width:200px;" /><font color="red">*</font></td>
								</tr>

								<tr>
									<td style="background-color:#e8edef;">派出人员：</td>
									<td><input name="xcjhEntity.peoplename" id="peoplename"
											   type="text" class="scinput" value="" style="width:200px;" /><font color="red">*</font></td>
								</tr>

								<tr>
									<td style="background-color:#e8edef;">巡查范围坐标（东）：</td>
									<td><input name="xcjhEntity.east" id="east" type="text" class="scinput" value="" style="width:200px;height:20px;" /><font color="red">*</font></td>
									<td style="background-color:#e8edef;">巡查范围坐标（南）：</td>
									<td ><input name="xcjhEntity.south" id="south" type="text" class="scinput" value="" style="width:200px;height:20px;"/><font color="red">*</font></td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">巡查范围坐标（西）：</td>
									<td><input name="xcjhEntity.west" id="west" type="text" class="scinput" value="" style="width:200px;height:20px;" /><font color="red">*</font></td>
									<td style="background-color:#e8edef;">巡查范围坐标（北）：</td>
									<td ><input name="xcjhEntity.north" id="north" type="text" class="scinput" value="" style="width:200px;height:20px;"/><font color="red">*</font></td>
								</tr>

								<tr>
									<td style="background-color:#e8edef;">巡查内容：</td>
									<td colspan="3">
										<textarea rows="4" cols="70" name="xcjhEntity.substance"
												  id="substance"></textarea><font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">巡查地点描述：</td>
									<td colspan="3">
									<textarea rows="4" cols="70" name="xcjhEntity.locationdesrcription"
											  id="locationdesrcription"></textarea><font color="red">*</font>
									</td>
								</tr>

								<%--<tr>
									<td style="background-color:#e8edef;">制定人姓名：</td>
									<td><input name="xcjhEntity.drafepeoplename" id="drafepeoplename" type="text" class="scinput" value="" style="width:200px;height:20px;" /><font color="red">*</font></td>
									<td style="background-color:#e8edef;">制定日期：</td>
									<td ><input name="xcjhEntity.drafetdate" id="drafetdate" type="text" class="scinput" value=""
													onclick="WdatePicker()" readonly="readonly" style="width:200px;" /><font color="red">*</font></td>
								</tr>--%>
								<%--<tr>
									<td style="background-color:#e8edef;">批准日期：</td>
									<td><input name="xcjhEntity.approvetime" id="approvetime" type="text" class="scinput" value="" style="width:200px;height:20px;" /></td>
									<td style="background-color:#e8edef;">批准人：</td>
									<td ><input name="xcjhEntity.approveuser" id="approveuser" type="text" class="scinput" value="这是....." style="width:200px;height:20px;"/></td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">批准备注：</td>
									<td colspan="3"><textarea rows="4" cols="70" name="xcjhEntity.approvebz"
															  id="approvebz"></textarea></td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">审批意见：</td>
									<td colspan="3">
										<textarea rows="4" cols="70" name="xcjhEntity.approvalopinion"
												  id="approvalopinion"></textarea><font color="red">*</font>
									</td>
								</tr>--%>


								<tr>
									<td colspan="4" style="text-align:center;">
										<input type="button" class="scbtn1" name="btn"  onclick="saveXcjh()" value="保存">
										<input name="fh" type="button" value="返回" class="scbtn1"  onclick="goBack()" />
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	</body>
</html>