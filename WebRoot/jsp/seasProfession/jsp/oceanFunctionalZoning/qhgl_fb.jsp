<!DOCTYPE>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海洋功能区发布</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
	</head>
    <style type="text/css">
        table{
            table-layout:fixed;/* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */  }
        #zw{
            width:100%;
            word-break:keep-all;/* 不换行 */
            white-space:nowrap;/* 不换行 */
            overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
            text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用*/
        }
    </style>
    <script type="text/javascript">
		/*
		$(document).ready(function(){

            var gnqhmcY=document.getElementById("gnqhmcY").value;
            getMc(gnqhmcY);
            });
        //获取功能区划名称和ID
        function getMc(historyZ) {
            $.ajax({
                type:"post",
                dataType:"json",
                url:"${contextPath}/zon/zon_fetchGnqhMc.do",
                success: function(d){
                    for(var i=0;i<d.length;i++){
                        if(d[i][1].value==historyZ){
                            $("<option value= '"+d[i][1]+"' selected>"+d[i][1]+"</option>").appendTo("#gnqhmc");
                        }else {
                            $("<option value= '"+d[i][1]+"'>"+d[i][1]+"</option>").appendTo("#gnqhmc");
                        }
                        // alert(d);
                    }
                }
            });
        }*/
        //查询
        function search(){
            document.myForm.action="<%=basePath%>/zon/zon_fetchFb.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }
        
        //重置
        function resert() {
            document.getElementById("bt").value="";
            document.getElementById("fbr").value="";
        }
        //详情
        function detailefb(xmID) {
            document.getElementById("xmID").value = xmID;
            document.myForm.action="<%=basePath%>/zon/zon_gnqhfbDetaile.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }
        //删除
        function deleteFb(xmID) {
            if (confirm("确定删除该记录吗？")) {
                document.getElementById("xmID").value = xmID;
                document.myForm.action = "<%=basePath%>/zon/zon_deleteFb.do";
                document.myForm.target = "_self";
                document.myForm.submit();
            }
        }
        //修改
        function updateFb(xmID){
            if(confirm("确定修改该记录吗？")){
                document.getElementById("xmID").value = xmID;
                document.myForm.action="<%=basePath%>/zon/zon_getFbDetaile.do";
                document.myForm.target="_self";
                document.myForm.submit();
            }
        }

    </script>
	<body>
    <form id="myForm" name="myForm" method="post">
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海洋功能区划管理</a></li>
				<li><a href="#">海洋功能区划发布</a></li>
			</ul>
		</div>
		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
                <input name="xmID" id="xmID" type="hidden" value="" />
                <table width="100%" align="center" style="text-align:center;">
                    <tr>
                        <td width="20%">标题：</td>
                        <td width="30%" ><input name="hygnqhFb.bt" id="bt" type="text" class="dfinput1" value="${hygnqhFb.bt}" style="width: 200px" />
						</td>
                        <td width="20%">发布人：</td>
                        <td width="30%"><input name="hygnqhFb.fbr" id="fbr" type="text" class="dfinput1" value="${hygnqhFb.fbr}"  style="width: 200px"  />
                    </td>
                    </tr>
                   
					<tr>
						<td colspan="4">
							<input name="cx" onclick="search()" type="button" class="scbtn1" value="查询" />
							<input name="cz" onclick="resert()" type="button" class="scbtn1" value="重置" />
						</td>
					</tr>
				</table>
			</div>
        <br/>
		<div class="tools">
			<ul class="toolbar">
				<li>
					<a href="${contextPath}/jsp/seasProfession/jsp/oceanFunctionalZoning/fb_add.jsp">
                    <span><img src="${contextPath}/images/t01.png" /></span>新增</a>
				</li>
			</ul>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th>序号</th>
					<th>标题</th>
					<th>正文</th>
                    <th>功能区名称</th>
					<th>发布单位</th>
					<th>发布日期</th>
					<th>发布人</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
            <c:forEach items="${ gnqhfbList }" var="r" varStatus="j">
				<tr>
					<td>${j.count}</td>
					<td>${r.bt}</td>
					<td id="zw">${r.zw}</td>
					<td>${r.gnqhmc}</td>
					<td>${r.fbdw}</td>
					<td>${r.fbsj}</td>
					<td>${r.fbr}</td>
					<td>
						<a href="#"  onclick="detailefb('${r.id }')" class="tablelink">详情</a>
						<a href="#" onclick="updateFb('${r.id}')" class="tablelink">修改</a>
						<a href="#" onclick="deleteFb('${r.id }')" class="tablelink"> 删除</a>
					</td>
				</tr>
            </c:forEach>
			</tbody>
		</table>
		</div>
        <script type="text/javascript">
            $("#usual1 ul").idTabs();
            $('.tablelist tbody tr:odd').addClass('odd');
        </script>
       
    </form>
    <div align="center" style="font-size:14px;"><s:property value="pageBean" escapeHtml="false"/></div>
    </body>
</html>