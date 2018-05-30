<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>

		<script type="text/javascript">
            $(document).ready(function(){
                var yjlmcY=document.getElementById("yjlmcY").innerHTML;
                var ejlmcY=document.getElementById("ejlmcY").innerHTML;
                var xzqyY=document.getElementById("xzqyY").innerHTML;
                getDictionary("功能区划分级","yjlmcY",yjlmcY);
                getDictionary("功能区划二级","ejlmcY",ejlmcY);
                getDictionary("项目位置","xzqyY",xzqyY);

            });
            //加载字典
            function getDictionary(keyZ,tableTdID,historyZ){
                $.ajax({
                    type: "post",
                    dataType:"json",
                    url: "${contextPath}/business/business_fetchDictionary.do",
                    data: "dictionary.key="+keyZ,
                    success: function(d){
                        for(var i=0;i<d.length;i++){
                            //alert(d);
                            if(d[i].dm==historyZ){
                                document.getElementById(tableTdID).innerHTML=d[i].value;
                            }else{

                            }
                        }
                    }
                });
            }
		//返回
		function goBack(){
			document.myForm.action="<%=basePath%>/zon/zon_fetchGnqh.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}
		</script>
	</head>

	<body>
		<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海洋功能区划管理</a></li>
				<li><a href="#">信息管理</a></li>
				<li><a href="#">详细信息</a></li>
			</ul>
		</div>

		<div class="formbody">
			<tr class="leftinfo" >
				<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td style="background-color:#f5f8fa;" width="20%">一级类名称：</td>
					<td width="30%" id="yjlmcY">${hygnqhXxgl.yjlmc }</td>
					<td style="background-color:#f5f8fa;" width="20%">二级类名称：</td>
					<td width="30%" id="ejlmcY">${hygnqhXxgl.ejlmc }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">功能区划名称：</td>
					<td>${hygnqhXxgl.gnqhmc }</td>
					<td style="background-color:#f5f8fa;">行政区域：</td>
					<td>${hygnqhXxgl.xzqy }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">规划面积：</td>
					<td>${hygnqhXxgl.ghmj }公顷</td>
					<td style="background-color:#f5f8fa;">岸线长度：</td>
					<td>${hygnqhXxgl.axcd }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">代码：</td>
					<td>${hygnqhXxgl.kzldm }</td>
					<td style="background-color:#f5f8fa;">所在地：</td>
					<td>${hygnqhXxgl.szd }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">地理范围：</td>
					<td colspan="3">${hygnqhXxgl.dlfwmc }</td>

				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域使用管理要求：</td>
					<td colspan="3">${hygnqhXxgl.syyq }</td>

				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海洋环境保护要求：</td>
					<td colspan="3">${hygnqhXxgl.hjbhyq }</td>

				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">新增时间：</td>
					<td>${hygnqhXxgl.addtime }</td>
					<td style="background-color:#f5f8fa;">新增人：</td>
					<td>${hygnqhXxgl.addusername}</td>

				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">修改时间：</td>
					<td>${hygnqhXxgl.lastupdatetime }</td>
					<td style="background-color:#f5f8fa;">修改人：</td>
					<td>${hygnqhXxgl.updateusername }</td>

				</tr>
				<tr>
					<th colspan="4" style="background-color:#f5f8fa;">
						<img src="${contextPath}/images/f03.png" width="20" height="20" />坐标信息
					</th>

				</tr>
				<tr>
					<th>序号</th>
					<th>坐标序号</th>
					<th>经度</th>
					<th>纬度</th>
				</tr>
				<c:forEach items="${ xxglJzdList }" var="r" varStatus="j">
					<tr>
						<td >${ j.count }</td>
						<td ><input name="jzdXh" id="jzdXh${ j.count }" type="text" value="${r.xh }" /></td>
						<td><input name="jzdJd" id="jzdJd${ j.count }" type="text" value="${r.jd }"  /></td>
						<td><input name="jzdWd" id="jzdWd${ j.count }" type="text" value="${r.wd }"  /></td>
					</tr>
				</c:forEach>

				<tr>
					<td colspan="4" style="text-align:center;">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack()" />
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