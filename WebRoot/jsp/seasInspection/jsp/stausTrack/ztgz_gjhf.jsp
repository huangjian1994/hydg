<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>轨迹回放</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
        <link href="${contextPath}/css/ystep.css" rel="stylesheet" type="text/css" /> 
        <link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/dijit/themes/tundra/tundra.css" />
        <link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/esri/css/esri.css" />
        <script type="text/javascript" src="${contextPath}/js/jquery.js"></script>		
        <script type="text/Javascript" src="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/init.js"></script>            
        <script type="text/javascript">
        //点击居中方法
              function asdf(obj){
                  console.log($(obj).children(".rwh").attr("objectId"))
                  var num = $(obj).children(".rwh").attr("objectId")
                  focusGra(num);
              }              
              //重置
              function resert(){
                  document.getElementById("st_claimperson").value ="";
                  document.getElementById("claimperson").value ="";
              } 
              function closeYstep(){
                $("#ystep").hide();
              }             
        </script>
	</head>
	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">状态跟踪</a></li>
				<li><a href="#">轨迹回放</a></li>
			</ul>
		</div>
		<div class="formbody" style="position:absolute;left:0;right:0;top:40px;bottom:0;overflow:hidden;width:100%;">
			<s:form namespace="/status" action="status_loadSeawallPatorlThroughWs.do?lb=2" method="post">
      			<div class="leftinfo1">
      				<div class="listtitle3"><img src="${contextPath}/images/seasInspection/ico06.png" width="25" height="25" />条件查询</div>
      				<table width="100%" align="center" style="text-align:center;">
      					<tr>

							<td>问题类别：</td>
							<td>
								<s:textfield name="spfw.st_esclass" id="esclass" cssStyle="width:200px;" ></s:textfield>
							</td>
							<td>巡查范围：</td>
							<td>
								<s:select name="part" id="st_name_cd" list="#{'':''}" cssStyle="width:200px;height:25px;" onchange="selectAdress()"></s:select>
								<s:hidden name="spfw.st_name" id="st_name"></s:hidden>
							</td>


      					</tr>
						<tr>
							<td>巡查人员：</td>
							<td><s:textfield name="spfw.st_claimperson" id="st_claimperson" cssStyle="width:200px;" ></s:textfield></td>

							<td>发现时间：</td>
							<td style="text-align:center;">
								<s:textfield onclick="WdatePicker()"  name="strBT" cssStyle="width:200px;"></s:textfield> &nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield onclick="WdatePicker()"  name="strET" cssStyle="width:125px;"></s:textfield>
							</td>

						</tr>
      					<tr>
      						<td colspan="6">
      							<input type="submit" class="scbtn1" value="查询" /> &nbsp;&nbsp;&nbsp;&nbsp;
      							<input type="button" class="scbtn1" value="重置" onclick="resert()" /> &nbsp;&nbsp;&nbsp;&nbsp;
      						</td>
      					</tr>
      				</table>
      			</div>
			</s:form>
            <div style="width:100%;position:absolute;left:18px;bottom:0;right:18px;top:118px;">                                       
        		<div id="sjjk" style="height:100%;float:left;border-left:1px solid gray;border-bottom:1px solid gray;">     			
        			<div class="table" style="background-color:white;">
        				<table class="tablelist">
        					<thead>
        					<tr>
        						<th style="word-break: keep-all;">序号</th>
        						<th style="word-break: keep-all;">问题类别</th>
        						<th style="word-break: keep-all;">巡查人员</th>
        						<th style="word-break: keep-all;">巡查范围</th>
        						<th style="word-break: keep-all;">处理状态</th>
        					</tr>
        					</thead>
        					<tbody>
        					<c:forEach items="${spfws}" var="sp" varStatus="i">
        						<tr onclick="asdf(this)">
        							<td>${i.index + 1 }</td>
        							<td objectId="${sp.st_eventsn}" class="rwh">${sp.st_esclass } - ${sp.st_ebclass}</td>
  
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
        						</tr>
        					</c:forEach>
        					</tbody>        					
        				</table>
                        <div align="center">${pageBeanS}</div>
        			</div>
        		</div>
                <div id="map" style="height:100%;"></div>
                <div id="ystep">
                    <div class="option-top">                           
                        <span>事件</span>
                        <img src="${contextPath}/images/close.png" title="关闭" onclick="closeYstep()"/>                          
                    </div>
                    <div class="option-body"> </div>
                </div>
            </div> 
        </div>		
	</body>
    <script type="text/javascript" src="${contextPath}/js/setStep.js"></script>
    <script type="text/javascript" src="${contextPath}/js/seasInspection/ztgz.js"></script>
    <script type="text/javascript">
        $(function(){
            if('${jsonArr}'!= null){
                var jsondata = '${jsonArr}';
                init(jsondata); 
            }
        })
    </script>
</html>