<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>功能区辅助划分</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
        <script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
	</head>

    <script type="text/javascript">

        //查询
        function cx() {
            document.getElementById("myForm").action="<%=basePath%>/zon/zon_fetchFzhf.do";
            document.getElementById("myForm").target="_self";
            document.myForm.submit();

        }
        //重置
        function resert(){
            document.getElementById("gnqmc").value ="";
            document.getElementById("fzhfmc").value ="";
            document.getElementById("bz").value ="";
        }

        //查看详情
        function detaileFzhf(xmID) {
            document.getElementById("xmID").value = xmID;
            document.myForm.action="<%=basePath%>/zon/zon_fetchFzhfDetaile.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }

       //修改
        function updataFzhf(xmID) {
            document.getElementById("xmID").value = xmID;
            document.myForm.action="<%=basePath%>/zon/zon_getFzhfDetaile.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }

        //删除
        function deleteFzhf(xmID) {
            if (confirm("确定删除该记录吗？")) {
                location = "<%=basePath%>/zon/zon_deleteFzhf.do?xmID="+xmID;
            }
            <%--location = "${contextPath}/seaLaw/law_downloadFile.do?seaLaw.id=" + id;--%>
        }


        //全选
        function checkAll(){
            var cb = document.getElementById("cb");
            var chks = document.getElementsByName("chk");
            if(cb.checked==true){
                for(var i=0;i<chks.length;i++){
                    chks[i].checked=true;
                }
            }else{
                for(var i=0;i<chks.length;i++){
                    chks[i].checked=false;
                }
            }
        }
    </script>

	<body>
		<form id="myForm" name="myForm" method="post">
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海洋功能区划管理</a></li>
				<li><a href="${contextPath}/zon/zon_fetchFzhf.do">辅助划分</a></li>
			</ul>
		</div>
            <input name="xmID" id="xmID" value="" type="hidden" />
		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>功能区名称：</td>
						<td>
							<input name="hysyywHygnqhFzhf.gnqhmc" id="gnqmc" value="${hysyywHygnqhFzhf.gnqhmc }" type="text"  style="width:180px;" />
						</td>
						<td>辅助划分名称：</td>
						<td>
							<input name="hysyywHygnqhFzhf.fzhfmc" id="fzhfmc" value="${hysyywHygnqhFzhf.fzhfmc }" type="text"  style="width:180px;" />
						</td>

						<td>编制：</td>
						<td>
							<select name="hysyywHygnqhFzhf.bz" id="bz" style="width:180px;height:25px;">
								<option ${hysyywHygnqhFzhf.bz==""?"selected=selected":""} value="" >-请选择-</option>
								<option ${hysyywHygnqhFzhf.bz=="定期"?"selected=selected":""} value="定期">定期</option>
								<option ${hysyywHygnqhFzhf.bz=="不定期"?"selected=selected":""} value="不定期">不定期</option>
							</select>
						</td>
						<%--<input name="bzY" id="bzY" type="hidden" value="${hysyywHygnqhFzhf.bz }" style="width:200px;" />--%>
					</tr>
					<tr>
						<td colspan="6">
                            <input name="查询" type="button" class="scbtn" value="查询" onclick="cx()"/>
                            <input name="重置" type="button" class="scbtn" value="重置" onclick="resert()" />
						</td>
					</tr>
				</table>
				<br/>


				<div class="tools">
					<ul class="toolbar">
						<li>
							<a href="${contextPath}/jsp/seasProfession/jsp/oceanFunctionalZoning/fzhf_add.jsp">
								<span><img src="${contextPath}/images/seasProfession/t01.png" /></span>新增</a>
						</li>
					</ul>
				</div>
				<table class="tablelist">
					<thead>
						<tr>
		                    <th>序号</th>
							<th>功能区名称</th>
							<th>辅助划分名称</th>
							<th>规划用海面积</th>
							<th>规划填海面积</th>
							<th>规划期限</th>
							<th>规划用海定位</th>
							<th>编制</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ fzhfList }" var="r" varStatus="j">
						<tr>
							<td>${j.count}</td>
							<td>${r.gnqhmc}</td>
							<td>${r.fzhfmc}</td>
							<td>${r.ghyhmj}</td>
							<td>${r.ghthmj}</td>
		                    <td>${r.ghqx}</td>
							<td>${r.ghyhgndw}</td>
							<td>${r.bz}</td>
							<td>
								<a href="#" class="tablelink" onclick="detaileFzhf('${r.id}')">详情</a>
								<a href="#" class="tablelink" onclick="updataFzhf('${r.id}')">修改</a>
								<a href="#" class="tablelink" onclick="deleteFzhf('${r.id }')"> 删除</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>			
			</div>
		</form>
		<div align="center" style="font-size:14px;">
			<s:property value="pageBean" escapeHtml="false"/>
		</div>
	</body>
</html>