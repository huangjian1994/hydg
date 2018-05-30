<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海洋自然保护区管理</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/dijit/themes/tundra/tundra.css" />
    	<link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/esri/css/esri.css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
		<script type="text/Javascript" src="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/init.js"></script>
        <style>
            #showMap{
                position: absolute;
                left: 200px;
                top: 238px;
                width: 550px;
                height: 350px;
                border-radius: 15px;
                border-top-right-radius: 20px;
                background-color: #f7f7f7;
                overflow: hidden;
                display: none;
            }
            #showMap .option-top{
                width: 100%;
                height: 30px;
                border-top-left-radius: 15px;
                border-top-right-radius: 15px;
                background-image: url(../images/menu-top.png);
                background-size: cover;
                ilter: progid:DXImageTransform.Microsoft.AlphaImageLoader( src='http://localhost:8080/hydg/images/menu-top.png', sizingMethod='scale');                
            }
            #showMap .option-top span {
                display: inline-block;
                font-size: 16px;
                color: white;
                line-height: 30px;
                padding-left: 10px;
            }
            #showMap .option-top img {
                float: right;
                width: 15px;
                padding: 9.5px 10px 0 0;
                height: 15px;
                cursor: pointer;
            }
        </style>
	</head>

	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海洋自然保护区管理</a>
				</li>
				<li>
					<a href="#">保护区基础信息管理</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<div class="leftinfo1">
				<s:form name="ocean" namespace="/ocean" action="ocean_fetchZrbhq.do" method="post" >
    				<div class="listtitle3"><img src="${contextPath}/images/seasProfession/ico06.png" width="25" height="25" />条件查询</div>
    				<table width="100%" align="center" style="text-align:center;">
    					<tr>
    						<td>保护区名称：</td>
    						<td>
    							<s:textfield name="hyzrbhqEntity.bhqmc" id="bhqmc" ></s:textfield>
    						</td>
    
    						<td>主管单位：</td>
    						<td>
    							<s:textfield name="hyzrbhqEntity.zgbm" id="zgbm" ></s:textfield>
    						</td>
    					</tr>
    					<tr>
    						<td>分类名称：</td>
    						<td><s:textfield name="hyzrbhqEntity.fl" id="fl" ></s:textfield></td>
    						<td>批建年份：</td>
    						<td><s:textfield name="hyzrbhqEntity.pjsj" id="pjsj" ></s:textfield></td>
    					</tr>
    					<tr>
    						<td colspan="6">
    							<input name="cx" type="submit" class="scbtn1" value="查询" />
    							<input name="cz"  onclick="czxx()" type="button" class="scbtn1" value="重置" />
    						</td>
    					</tr>
    				</table>
				</s:form>
			</div>
    		<div class="tools">
    			<ul class="toolbar">
    				<li>
    					<a href="#" onclick="toadd()"><span><img src="${contextPath}/images/seasProfession/t01.png" /></span>新增</a>
    				</li>
    
    			</ul>
    		</div>
    		<table class="tablelist">
    			<thead>
    				<tr>
    					<th>序号</th>
    					<th>保护区名称</th>
    					<th>保护区总面积(公顷)</th>
    					<th>主管部门</th>
    					<th>级别</th>
    					<th>行政区域</th>
    					<th>分类名称</th>
                        <th>批建时间</th>
    					<th>操作</th>
    				</tr>
    			</thead>
    			<tbody>
                <c:forEach items="${hyzrbhqEntityList}" var="bhq" varStatus="j">
    				<tr>
                        <td>${j.count}</td>
                        <td><a href="javascript:void(0)" onclick="detaileBhqid('${bhq.id}')" class="tablelink">${bhq.bhqmc}</a></td>
                        <td>${bhq.zmj}</td>
                        <td>${bhq.zgbm}</td>
                        <td>${bhq.jb}</td>
                        <td>${bhq.xzqh}</td>
                        <td>${bhq.fl}</td>
                        <td>${bhq.pjsj}</td>
    					<td>
    						<a href="javascript:void(0)" onclick="editBhqid('${bhq.id}')" class="tablelink">修改</a>
    						<a href="javascript:void(0)" onclick="delBhq('${bhq.id}')" class="tablelink">删除</a>&nbsp;
    						<a href="javascript:void(0)" onclick="getID('${bhq.bhqbh}')"class="tablelink">地图展示</a>&nbsp;
    					</td>
    				</tr>
                </c:forEach>
    			</tbody>
    		</table>
		</div>
        <div id="showMap">
            <div class="option-top">
                <span>地图展示</span>
                <img src="${contextPath}/images/menu-close.png" title="关闭" onclick="closeMap()">
            </div>
            <div id="map"></div>
        </div>		
        <script type="text/javascript" src="${contextPath}/js/seasProfession/protect.js"></script>
		<div align="center" style="font-size:14px;">
			<s:property value="pageBean" escapeHtml="false"/>
		</div>
		<script type="text/javascript">
            $("#usual1 ul").idTabs();
            $('.tablelist tbody tr:odd').addClass('odd');

            //重置
            function czxx() {
                document.getElementById("bhqmc").value ="";
                document.getElementById("zgbm").value ="";
                document.getElementById("fl").value ="";
                document.getElementById("pjsj").value ="";
            }
            //新增
            function toadd() {
                location = "${contextPath}/ocean/ocean_toaddBhq.do";
            }
            //修改
            function editBhqid(id){
                location = "${contextPath}/ocean/ocean_toEditBhq.do?hyzrbhqEntity.id=" + id;
            }
            //详情
            function detaileBhqid(id){
                location = "${contextPath}/ocean/ocean_toEditBhq.do?operate=0&&hyzrbhqEntity.id=" + id;
            }
            //删除
            function delBhq(id){
                var r = confirm("请确认是否删除？");
                if ( r ) {
                    $.ajax({
                        type: "post",
                        dataType:"text",
                        url: "${contextPath}/ocean/ocean_removeBhq.do",
                        data: {"hyzrbhqEntity.id":id},
                        success: function(result){
                            if ( result == "1" ) {
                                alert("删除成功！");
                                location.reload();
                            } else {
                                alert("删除失败！")
                            }
                        }
                    })
                }
            }
            function closeMap(){
                $("#showMap").hide();
            }
		</script>
	</body>
</html>