<!DOCTYPE HTML>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>船舶档案信息</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>
	<script type="text/javascript">
		function boat() {
		    if($("#Mmsino").val() ==""){
		        alert("船舶Mmsi不能为空！");
                return false;
            }
            document.myForm.action ="<%=basePath%>/ais/ais_boatRecord.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }
        //重置
        function resert(){
            document.getElementById("Mmsino").value="";
            //document.getElementById("qywz").value="";
        }
	</script>
	<body>
    <form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seabedPipeline/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">船舶档案信息</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seabedPipeline/ico06.png" width="25" height="25" />条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td width="35%">船舶MMSI：</td>
						<td width="65">
							<input   name="Mmsi" id="Mmsino" type="text" placeholder="请输入船舶Mmsi，多个请以,分割"
									 class="scinput" value="${Mmsi}" style="width:90%;"  />
						</td>

					</tr>
					<tr>
						<td colspan="8">
							<input name="cx" onclick="boat()" type="button" class="scbtn1" value="查询" />
							<input name="cz" onclick="resert()" type="button" class="scbtn1" value="重置" />
						</td>
					</tr>
				</table>
			</div>

		<table class="tablelist">
			<thead>
				<tr>
					<th>船舶编号</th>
					<th>船舶MMSI</th>
					<th>船舶经营人</th>
					<th>船舶所有人</th>
					<th>本地船名</th>
					<th>英文船名</th>
					<th>国籍</th>
					<th>初始登记号</th>
					<th>船舶呼号</th>
					<th>IC卡号</th>
					<th>IMO编号</th>
					<th>总吨</th>
					<th>净吨</th>
					<th>载重吨</th>
					<th>最低安全配员数</th>
					<th>救生设备最大数</th>

					<th>船舶性质</th>
					<th>船舶类型</th>
					<th>船检登记号</th>
					<th>造船厂</th>
					<th>建成日期</th>
					<th>船体材料</th>
					<th>主机数量</th>
					<th>主机功率</th>
					<th>船舶长度</th>
					<th>船舶型宽</th>
					<th>船籍港</th>
					<th>推进器种类</th>
					<th>船舶型深</th>

				</tr>
			</thead>
			<tbody>
			<c:forEach items="${boatRecords}" var="br" >
				<tr>
					<td>${br.shipNo}</td>
					<td>${br.mmsi}</td>
					<td>${br.operator}</td>
					<td>${br.owner}</td>
					<td>${br.localName}</td>
					<td>${br.shipNameEn}</td>
					<td>${br.flagCode}</td>
					<td>${br.initialregistrationNo}</td>
					<td>${br.callsign}</td>
					<td>${br.icNo}</td>
					<td>${br.imoNo}</td>
					<td>${br.gross}</td>
					<td>${br.net}</td>
					<td>${br.dWT}</td>
					<td>${br.minSafeManningNO}</td>
					<td>${br.maxSurvivalEquipmentNO}</td>
					<td>${br.inlandshipMark}</td>
					<td>${br.shiptypeCode}</td>
					<td>${br.shipsurveyNo}</td>
					<td>${br.shipyard}</td>
					<td>${br.buildDate}</td>
					<td>${br.hullMaterialCode}</td>
					<td>${br.powerNO}</td>
					<td>${br.power}</td>
					<td>${br.loa}</td>
					<td>${br.bm}</td>
					<td>${br.registrationPort}</td>
					<td>${br.propellerType}</td>
					<td>${br.depth}</td>


					<%--<td>
						<a href="cbdwxx_detail.jsp" class="tablelink">查看</a>
						<a href="#" class="tablelink"> 删除</a>
					</td>--%>
				</tr>
			</c:forEach>
			</tbody>
            <%--<div>
				${chuanbos}
            </div>--%>
		</table>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		</div>
		</div>
    </form>
	</body>

</html>