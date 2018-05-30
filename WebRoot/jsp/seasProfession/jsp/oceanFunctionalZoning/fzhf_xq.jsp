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
			function checkAll() {
				var cb = document.getElementById("cb");
				var chks = document.getElementsByName("chk");
				if(cb.checked == true) {
					for(var i = 0; i < chks.length; i++) {
						chks[i].checked = true;
					}
				} else {
					for(var i = 0; i < chks.length; i++) {
						chks[i].checked = false;
					}
				}
			}
			<!--使用onchange="jumpMenu()"触发jumpMenu()方法-->
			function jumpMenu(e) {
				window.location.href = e.value;
			}
		</script>
        <script type="text/javascript">
            //返回
            function goBack(){
                document.myForm.action="<%=basePath%>/zon/zon_fetchFzhf.do";
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
				<li><a href="#">辅助划分</a></li>
                <li><a href="#">详请</a></li>
			</ul>
		</div>
        <div class="formbody">
            <div class="leftinfo" >
                <div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
            <table width="100%" align="center" style="text-align:left;" class="tableXQ">
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">功能区划名称：</td>
                    <td width="30%">${hysyywHygnqhFzhf.gnqhmc }</td>
                    <td style="background-color:#f5f8fa;" width="20%">规划期限：</td>
                    <td width="30%">${hysyywHygnqhFzhf.ghqx }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;">规划类型：</td>
                    <td>${hysyywHygnqhFzhf.ghlx }</td>
                    <td style="background-color:#f5f8fa;">规划用海面积：</td>
                    <td>${hysyywHygnqhFzhf.ghyhmj }公顷</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;">规划填海面积：</td>
                    <td>${hysyywHygnqhFzhf.ghthmj }公顷</td>
                    <td style="background-color:#f5f8fa;">规划用海功能定位：</td>
                    <td>${hysyywHygnqhFzhf.ghyhgndw }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;">规划简介：</td>
                    <td>${hysyywHygnqhFzhf.ghjj }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;">辅助划分名称：</td>
                    <td>${hysyywHygnqhFzhf.fzhfmc }</td>
                    <td style="background-color:#f5f8fa;">是否允许建立设施：</td>
                    <td>${hysyywHygnqhFzhf.sfyxjlss }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;">设施内容：</td>
                    <td>${hysyywHygnqhFzhf.ssnr }</td>
                    <td style="background-color:#f5f8fa;">是否允许人员作业：</td>
                    <td>${hysyywHygnqhFzhf.sfyxryzy }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;">作业内容：</td>
                    <td>${hysyywHygnqhFzhf.zynr }</td>
                    <td style="background-color:#f5f8fa;">禁止项：</td>
                    <td>${hysyywHygnqhFzhf.jzx }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;">适宜项：</td>
                    <td>${hysyywHygnqhFzhf.syx }</td>
                    <td style="background-color:#f5f8fa;">不适宜项：</td>
                    <td>${hysyywHygnqhFzhf.bsyx }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;">描述：</td>
                    <td>${hysyywHygnqhFzhf.ms }</td>
                    <td style="background-color:#f5f8fa;">编制：</td>
                    <td>${hysyywHygnqhFzhf.bz }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;">新增人：</td>
                    <td>${hysyywHygnqhFzhf.addusername }</td>
                    <td style="background-color:#f5f8fa;">新增时间：</td>
                    <td>${hysyywHygnqhFzhf.addtime}</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;">修改人：</td>
                    <td>${hysyywHygnqhFzhf.updateusername }</td>
                    <td style="background-color:#f5f8fa;">修改时间：</td>
                    <td>${hysyywHygnqhFzhf.lastupdatetime}</td>
                </tr>
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