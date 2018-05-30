<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>船舶详细信息</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>
	<script>
        //返回
        function goBack(mmsi){
            document.getElementById("mmsi").value = mmsi;
            document.myForm.action="<%=basePath%>/ais/ais_oneRealtime.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }

	</script>

	<body>
	<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seabedPipeline/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">船舶详细信息</a></li>
			</ul>
		</div>
        <input name="mmsi" id="mmsi" value="" type="hidden" />

		<div class="formbody">
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<th style="background-color:#f5f8fa;" colspan="4">船舶档案信息</th>
				<c:forEach items="${boatRecords}" var="br" >
				<tr>
					<td style="background-color:#f5f8fa;" width="20%">船舶编号：</td>
					<td width="30%">${br.shipNo }</td>
					<td style="background-color:#f5f8fa;" width="20%">船舶MMSI：</td>
					<td width="30%">${br.mmsi }</td>

				</tr>
				<tr>
					<td style="background-color:#f5f8fa;" width="20%">船舶经营人：</td>
					<td width="20%">${br.operator }</td>
					<td style="background-color:#f5f8fa;" width="20%">船舶所有人：</td>
					<td width="30%">${br.owner }</td>
				</tr>

				<tr>
					<td style="background-color:#f5f8fa;" width="20%">本地船名：</td>
					<td width="20%">${br.localName }</td>
					<td style="background-color:#f5f8fa;" width="20%">英文船名：</td>
					<td width="30%">${br.shipNameEn }</td>
				</tr>
                    <tr>
					<td style="background-color:#f5f8fa;" width="20%">国籍：</td>
					<td width="20%">${br.flagCode }</td>
					<td style="background-color:#f5f8fa;" width="20%">初始登记号：</td>
					<td width="30%">${br.initialregistrationNo }</td>
				</tr>
                    <tr>
					<td style="background-color:#f5f8fa;" width="20%">船舶呼号：</td>
					<td width="20%">${br.callsign }</td>
					<td style="background-color:#f5f8fa;" width="20%">IC卡号：</td>
					<td width="30%">${br.icNo }</td>
				</tr>
                    <tr>
					<td style="background-color:#f5f8fa;" width="20%">总吨：</td>
					<td width="20%">${br.gross }</td>
					<td style="background-color:#f5f8fa;" width="20%">净吨：</td>
					<td width="30%">${br.net }</td>
				</tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">载重吨：</td>
                    <td width="20%">${br.dWT }</td>
                    <td style="background-color:#f5f8fa;" width="20%">最低安全配员数：</td>
                    <td width="30%">${br.minSafeManningNO }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">救生设备最大数：</td>
                    <td width="20%">${br.maxSurvivalEquipmentNO }</td>
                    <td style="background-color:#f5f8fa;" width="20%">船舶性质：</td>
                    <td width="30%">${br.inlandshipMark }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">船舶类型：</td>
                    <td width="20%">${br.shiptypeCode }</td>
                    <td style="background-color:#f5f8fa;" width="20%">船检登记号：</td>
                    <td width="30%">${br.shipsurveyNo }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">造船厂：</td>
                    <td width="20%">${br.shipyard }</td>
                    <td style="background-color:#f5f8fa;" width="20%">建成日期：</td>
                    <td width="30%">${br.buildDate }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">船体材料：</td>
                    <td width="20%">${br.hullMaterialCode }</td>
                    <td style="background-color:#f5f8fa;" width="20%">主机数量：</td>
                    <td width="30%">${br.powerNO }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">主机功率：</td>
                    <td width="20%">${br.power }</td>
                    <td style="background-color:#f5f8fa;" width="20%">船舶长度：</td>
                    <td width="30%">${br.loa }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">船舶型宽：</td>
                    <td width="20%">${br.bm }</td>
                    <td style="background-color:#f5f8fa;" width="20%">船籍港：</td>
                    <td width="30%">${br.registrationPort }</td>
                </tr>
                <tr>
                    <td style="background-color:#f5f8fa;" width="20%">推进器种类：</td>
                    <td width="20%">${br.propellerType }</td>
                    <td style="background-color:#f5f8fa;" width="20%">船舶型深：</td>
                    <td width="30%">${br.depth }</td>
                </tr>

                </c:forEach>
                <tr></tr>

            <th style="background-color:#f5f8fa;" colspan="4">船舶静态数据信息</th>
            <c:forEach items="${boatStaticList}" var="bs" >
            <tr>
                <td style="background-color:#f5f8fa;" width="20%">船舶MMSI：</td>
                <td width="30%">${bs.mmsi }</td>
                <td style="background-color:#f5f8fa;" width="20%">呼号：</td>
                <td width="30%">${bs.callno }</td>
            </tr>
            <tr>
                <td style="background-color:#f5f8fa;" width="20%">名称：</td>
                <td width="30%">${bs.shipname }</td>
                <td style="background-color:#f5f8fa;" width="20%">船舶和货物类型：</td>
                <td width="30%">${bs.shipAndCargType }</td>
            </tr>
            <tr>
                <td style="background-color:#f5f8fa;" width="20%">船长：</td>
                <td width="30%">${bs.length }</td>
                <td style="background-color:#f5f8fa;" width="20%">船宽：</td>
                <td width="30%">${bs.width }</td>
            </tr>
            <tr>
                <td style="background-color:#f5f8fa;" width="20%">预计到港时间：</td>
                <td width="30%">${bs.eta }</td>
                <td style="background-color:#f5f8fa;" width="20%">目前最大静态吃水：</td>
                <td width="30%">${bs.draft }</td>
            </tr>
            <tr>
                <td style="background-color:#f5f8fa;" width="20%">目的港：</td>
                <td width="30%">${bs.dest }</td>
            </tr>


            <tr>
                <td colspan="4" style="text-align:center;">
                    <input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack('${bs.mmsi }')" />
                </td>
            </tr>
            </c:forEach>
			</table>
		</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</form>
	</body>

</html>