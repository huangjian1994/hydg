<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
	<script type="text/javascript">
	function goBack1(){
		document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchHysyjList.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	function goBack2(){
		document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchHysyjList2.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	function goBack3(){
		document.myForm.action="<%=basePath%>/seaUseGold/seaUseGold_fetchHysyjList3.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	</script>
	</head>

<body>
<form name="myForm" method="post" >
	<div class="place" >
		<span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">用海项目信息</a></li>
		</ul>
	</div>
	<input name="xmID" id="xmID" value="${xmID }" type="hidden" />
	<input name="zsID" id="zsID" value="" type="hidden" />
	<input name="fileName" id="fileName" value="" type="hidden" />
	
	
	<div class="formbody" >
		<div id="usual1" class="usual">
			<div class="leftinfo1">

					<table style="width:98%;" class="tablelist2" align="center">
							<tr>
								<th colspan="4">基本信息</th>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">用海项目名称：</td>
								<td colspan="3">${hysyywHysydtYhxm.yhxmmc }</td>
							</tr>
							<!-- 发改委项目代码 -->
							<tr>
								<td width="22%"  style="background-color:#f5f8fa;">项目位置：</td>
								<td width="28%">${hysyywHysydtYhxm.xmwz }</td>
								<td width="20%"  style="background-color:#f5f8fa;">证书数量：</td>
								<td width="30%">${hysyywHysydtYhxm.zssl }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">用海总面积：</td>
								<td>${hysyywHysydtYhxm.yhzmj }公顷</td>
								<td  style="background-color:#f5f8fa;">投资额：</td>
								<td>${hysyywHysydtYhxm.tze } ${hysyywHysydtYhxm.tzedw }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">占用岸线：</td>
								<td>${hysyywHysydtYhxm.zyax }米</td>
								<td  style="background-color:#f5f8fa;">新增案线：</td>
								<td>${hysyywHysydtYhxm.xzax }米</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">其中占用自然岸线：</td>
								<td>${hysyywHysydtYhxm.zyax_zr }米</td>
								<td  style="background-color:#f5f8fa;">占用人工岸线：</td>
								<td>${hysyywHysydtYhxm.zyax_rg }米</td>
							</tr>
							<tr>
								<td style="background-color:#f5f8fa;">项目性质：<!-- 新增的 --></td>
								<td colspan="3">${hysyywHysydtYhxm.xmxz }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">受理机关级别：<!-- 新增的 --></td>
								<td>${hysyywHysydtYhxm.sljgjb }</td>
								<td  style="background-color:#f5f8fa;">受理日期：<!-- 新增的 --></td>
								<td>${hysyywHysydtYhxm.slrq }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">海域等别：</td>
								<td>${hysyywHysydtYhxm.hydb }</td>
								<td  style="background-color:#f5f8fa;">用海批准日期：<!-- 未加字段 --></td>
								<td>${hysyywHysydtYhxm.yhpzrq }</td>
							</tr>
							<tr>
								<td style="background-color:#f5f8fa;">登记机关：</td>
								<td>${hysyywHysydtYhxm.djjg }</td>
								<td  style="background-color:#f5f8fa;">发证机关级别：</td>
								<td>${hysyywHysydtYhxm.fzjgjb }</td>
								
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">发证机关：</td>
								<td>${hysyywHysydtYhxm.fzjg }</td>
								<td style="background-color:#f5f8fa;">审批机关：</td>
								<td >${hysyywHysydtYhxm.spjg }</td>
							</tr>
							<!-- 
							<tr>
								<td  style="background-color:#f5f8fa;">用海位置文字说明：</td>
								<td colspan="3"></td>
							</tr>
							 -->
							<tr>
								<td  style="background-color:#f5f8fa;">项目其他相关批准文件和材料：</td>
								<td colspan="3">${hysyywHysydtYhxm.xmwjcl }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">备注：</td>
								<td colspan="3">${hysyywHysydtYhxm.bz }</td>
							</tr>
							<tr>
								<th colspan="4">使用权人信息</th>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">海域使用权人：</td>
								<td>${hysyywHysydtYhxm.hysyqr }</td>
								<td  style="background-color:#f5f8fa;">法定代表人：</td>
								<td>${hysyywHysydtYhxm.fddbr }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">法定代表人职务：</td>
								<td>${hysyywHysydtYhxm.fddbrzw }</td>
								<td  style="background-color:#f5f8fa;">法定代表人身份证：</td>
								<td>${hysyywHysydtYhxm.fddbrsfz }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">联系人姓名：</td>
								<td>${hysyywHysydtYhxm.lxrxm }</td>
								<td  style="background-color:#f5f8fa;">联系人电话：</td>
								<td>${hysyywHysydtYhxm.lxrdh }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">手机：</td>
								<td>${hysyywHysydtYhxm.sj }</td>
								<td  style="background-color:#f5f8fa;">传真：</td>
								<td>${hysyywHysydtYhxm.cz }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">邮政编码：</td>
								<td>${hysyywHysydtYhxm.yzbm }</td>
								<td style="background-color:#f5f8fa;">通讯地址：</td>
								<td>${hysyywHysydtYhxm.txdz }</td>
							</tr>
							<tr>
								<th colspan="4">海籍调查信息</th>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">测绘负责人：</td>
								<td>${hysyywHysydtYhxm.chfzr }</td>
								<td  style="background-color:#f5f8fa;">测绘单位：</td>
								<td>${hysyywHysydtYhxm.chdw }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">测绘日期：</td>
								<td>${hysyywHysydtYhxm.chrq }</td>
								<td  style="background-color:#f5f8fa;">测绘点数：</td>
								<td>${hysyywHysydtYhxm.chds }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">投影：</td>
								<td>${hysyywHysydtYhxm.ty }</td>
								<td  style="background-color:#f5f8fa;">概略比例尺：</td>
								<td>${hysyywHysydtYhxm.glblc }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">坐标系名称：</td>
								<td colspan="4">${hysyywHysydtYhxm.zbxmc }</td>
							</tr>
							<tr>
								<th colspan="4">论证报告</th>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">论证报告名称：</td>
								<td>${hysyywHysydtYhxm.lzbgmc }</td>
								<td  style="background-color:#f5f8fa;">论证单位：</td>
								<td>${hysyywHysydtYhxm.lzdw }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">资质等级：</td>
								<td>${hysyywHysydtYhxm.zzdj }</td>
								<td  style="background-color:#f5f8fa;">项目负责人：</td>
								<td>${hysyywHysydtYhxm.xmfzr }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">组织评审部门：</td>
								<td>${hysyywHysydtYhxm.zzpsbm }</td>
								<td  style="background-color:#f5f8fa;">评审专家组组长：</td>
								<td>${hysyywHysydtYhxm.pszjzzz }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">评审日期：</td>
								<td>${hysyywHysydtYhxm.psrq }</td>
								<td  style="background-color:#f5f8fa;">质量评估分：</td>
								<td>${hysyywHysydtYhxm.zlpgf }</td>
							</tr>
							<tr>
								<th colspan="4">其他信息</th>
							</tr>
							<tr>
								<td style="background-color:#f5f8fa;">新增用户姓名：</td>
								<td colspan="3">${hysyywHysydtYhxm.addusername }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">新增时间：</td>
								<td>${hysyywHysydtYhxm.addtime }</td>
								<td  style="background-color:#f5f8fa;">最后修改时间：</td>
								<td>${hysyywHysydtYhxm.lastupdatetime }</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align:center;">
								
								<c:if test="${indexNum=='1' }">
								<input name="back" type="button" class="scbtn" onclick="goBack1()" value="返回" />
								</c:if>
								<c:if test="${indexNum=='2' }">
								<input name="back" type="button" class="scbtn" onclick="goBack2()" value="返回" />
								</c:if>
								<c:if test="${indexNum=='3' }">
								<input name="back" type="button" class="scbtn" onclick="goBack3()" value="返回" />
								</c:if>
								
								</td>
							</tr>
					</table>

		</div>
		</div>
	</div>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

</form>
</body>
</html>