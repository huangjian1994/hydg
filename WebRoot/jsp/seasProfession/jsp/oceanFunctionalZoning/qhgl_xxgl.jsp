<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>功能区划信息管理</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
	</head>
	<script type="text/javascript">
        //代码
        $(document).ready(function(){
            var yjlmcY=document.getElementById("yjlmcY").value;
            var ejlmcY=document.getElementById("ejlmcY").value;
            var xzqyY=document.getElementById("xzqyY").value;

            getDictionary("功能区划分级","yjlmc",yjlmcY);
            getDictionary("功能区划二级","ejlmc",ejlmcY);
            getDictionary("项目位置","xzqy",xzqyY);
        });
		//字典表查询
        function getDictionary(keyZ,selectID,historyZ){
            $.ajax({
                type: "post",
                dataType:"json",
                url: "${contextPath}/business/business_fetchDictionary.do",
                data: "dictionary.key="+keyZ,
                success: function(d){
                    for(var i=0;i<d.length;i++){
                        //alert(d[i].dm);
                        if(d[i].dm==historyZ){
                            $("<option value= '"+d[i].dm+"' selected>"+d[i].value+"</option>").appendTo("#"+selectID);
                        }else{
                            $("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
                        }
                    }
                }
            });
        }

		//查询
		function search(){

//            var y=document.getElementById("yjlmc").value;
//            alert(y);
		document.myForm.action="<%=basePath%>/zon/zon_fetchGnqh.do";
		document.myForm.target="_self";
		document.myForm.submit();
		}
		//查看详情
		function detaileXmxx(xmID){
			document.getElementById("xmID").value = xmID;
			document.myForm.action="<%=basePath%>/zon/zon_fetchGnqhDetaile.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}
		//重置
		function resert(){
            document.getElementById("gnqhmc").value ="";
            document.getElementById("yjlmc").value ="";
			document.getElementById("ejlmc").value ="";
			document.getElementById("xzqy").value ="";
		}
        //删除
        function deleteXmxx(xmID) {
            if (confirm("确定删除该记录吗？")) {
                document.getElementById("xmID").value = xmID;
                document.myForm.action = "<%=basePath%>/zon/zon_deleteGnqh.do";
                document.myForm.target = "_self";
                document.myForm.submit();
            }
        }
        //修改
        function updateXmxx(xmID){
            if(confirm("确定修改该记录吗？")){
                document.getElementById("xmID").value = xmID;
                document.myForm.action="<%=basePath%>/zon/zon_getGnqhDetaile.do";
                document.myForm.target="_self";
                document.myForm.submit();
            }
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
		<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海洋功能区划管理</a></li>
				<li><a href="${contextPath}/zon/zon_fetchGnqh.do">信息管理</a></li>
			</ul>
		</div>
		<input name="xmID" id="xmID" value="" type="hidden" />
		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td>功能区划名称：</td>
						<td>
							<input name="hygnqhXxgl.gnqhmc" id="gnqhmc" value="${hygnqhXxgl.gnqhmc }" type="text"  style="width:180px;" />
						</td>
						<td>行政区域：</td>
						<td>
							<select name="hygnqhXxgl.xzqy" id="xzqy" style="width:180px;">
								<option value="">-请选择-</option>
							</select>
							<input name="xzqyY" id="xzqyY" value="${hygnqhXxgl.xzqy }" type="hidden"  style="width:180px;" />
						</td>
					</tr>
					<tr>
						<td>一级类名称：</td>
						<td>
							<select name="hygnqhXxgl.yjlmc" id="yjlmc" style="width:180px;">
								<option value="">-请选择-</option>
							</select>
							<input name="yjlmcY" id="yjlmcY" value="${hygnqhXxgl.yjlmc }" type="hidden"  style="width:180px;" />
						</td>
						<td>二级类名称：</td>
						<td>
							<select name="hygnqhXxgl.ejlmc" id="ejlmc" style="width:180px;">
								<option value="">-请选择-</option>
							</select>
							<input name="ejlmcY" id="ejlmcY" type="hidden" value="${hygnqhXxgl.ejlmc }" style="width:180px;" /></td>

					</tr>
					<tr>
						<td colspan="8">
							<input name="查询" type="button" class="scbtn" value="查询" onclick="search()" />
							<input name="重置" type="button" class="scbtn" value="重置" onclick="resert()" />
						</td>
					</tr>
				</table>
			</div><br/>

		
			<div class="tools">
				<ul class="toolbar">
					<li>
						<a href="${contextPath}/jsp/seasProfession/jsp/oceanFunctionalZoning/xxgl_add.jsp">
						<span>
							<img src="${contextPath}/images/seasProfession/t01.png" />
						</span>新增
						</a>
					</li>
					
				</ul>
			</div>
		
			<table class="tablelist">
				<thead>
					<tr>
						<th>序号</th>
						<th>功能区划名称</th>
						<th>一级类名称<!--<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif" /></i>  --></th>
						<th>二级类名称</th>
						<th>行政区域</th>
						<th>规划面积(公顷)</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ gnqhList }" var="r" varStatus="j">
					<tr>
						<td>${ j.count } </td>
						<td>${r[7] }</td>
						<td>${r[5]}</td>
						<td >${r[6] }</td>
						<td>${r[15] }</td>
						<td>${r[8] }</td>
						<td>
							<a href="###" onclick="detaileXmxx('${r[0] }')" class="tablelink">详情</a>&nbsp;
							<a href="###" onclick="updateXmxx('${r[0] }')" class="tablelink">修改</a>&nbsp;
							<a href="###" onclick="deleteXmxx('${r[0] }')" class="tablelink">删除</a>
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