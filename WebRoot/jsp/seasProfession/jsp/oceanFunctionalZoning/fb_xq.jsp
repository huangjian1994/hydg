<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>功能区划发布详情页面</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        //返回
        function goBack(){
            document.myForm.action="<%=basePath%>/zon/zon_fetchFb.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }
    </script>
    </head>
	<body>
    <form id="myForm" name="myForm" method="post">
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海洋功能区划管理</a></li>
				<li><a href="#">海洋功能区划发布</a></li>
				<li><a href="#">详情</a></li>
			</ul>
		</div>
        <div class="formbody">
        <div class="leftinfo1">
       	 <div class="listtitle">
			<img src="${contextPath}/images/ico02.png" width="20" height="20" />详情</div>
            <table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td style="background-color:#f5f8fa;">标题：</td>
					<td style="width:783px;height:20px;" >${hygnqhFb.bt}</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">正文：</td>
					<td style="width:783px;height:20px;" >${hygnqhFb.zw}</td>
				</tr>
                <tr>
                    <td style="background-color:#f5f8fa;">功能区名称：</td>
                    <td style="width:783px;height:20px;" >${hygnqhFb.gnqhmc}</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;">发布单位：</td>
                    <td style="width:783px;height:20px;" >${hygnqhFb.fbdw}</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;">发布时间：</td>
                    <td style="width:783px;height:20px;" >${hygnqhFb.fbsj}</td>
                </tr>
				<tr>
					<td style="background-color:#f5f8fa;">发布人：</td>
					<td style="width:783px;height:20px;" >${hygnqhFb.fbr}</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">备注：</td>
					<td style="width:783px;height:20px;" >${hygnqhFb.bz}</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">修改人：</td>
					<td style="width:783px;height:20px;" >${hygnqhFb.updateusername}</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">修改时间：</td>
					<td style="width:783px;height:20px;" >${hygnqhFb.lastupdatetime}</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<input name="fh"  type="button" value="返回" class="scbtn1" onclick="goBack()" />
					</td>
				</tr>
			</table>
		</div>
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
    </form>
	</body>
</html>