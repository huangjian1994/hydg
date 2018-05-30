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
			<li><a href="#">证书信息</a></li>
		</ul>
	</div>
	<input name="xmID" id="xmID" value="${xmID }" type="hidden" />
	<input name="zsID" id="zsID" value="" type="hidden" />
	<input name="fileName" id="fileName" value="" type="hidden" />
	
	
	<div class="formbody" >
		<div id="usual1" class="usual">
			<div class="leftinfo1">

					<table class="tablelist2" width="100%">
					<tr>
						<th colspan="4">项目基本信息</th>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">用海项目名称：</td>
						<td>${hysyywHysydtYhxmZsxx.yhxmmc}</td>
						<td style="background-color:#f5f8fa;">海域使用权人：</td>
						<td>${hysyywHysydtYhxmZsxx.hysyqr }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">用海面积：</td>
						<td>${hysyywHysydtYhxmZsxx.yhmj }公顷</td>
						<td style="background-color:#f5f8fa;">海域等别：</td>
						<td>${hysyywHysydtYhxmZsxx.hydb }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">法定代表人：</td>
						<td>${hysyywHysydtYhxmZsxx.fddbr }</td>
						<td style="background-color:#f5f8fa;">通讯地址：</td>
						<td>${hysyywHysydtYhxmZsxx.txdz }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">发证机关：</td>
						<td>${hysyywHysydtYhxmZsxx.fzjg }</td>
						<td style="background-color:#f5f8fa;">发证机关级别：</td>
						<td>${hysyywHysydtYhxmZsxx.fzjgjb }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">项目其他相关批准文件和材料：</td>
						<td colspan="3">${hysyywHysydtYhxmZsxx.wjcl }</td>
					</tr>
					<tr>
						<th colspan="4">登记信息</th>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">登记编号：</td>
						<td>${hysyywHysydtYhxmZsxx.djbh }</td>
						<td style="background-color:#f5f8fa;">初始登记日期：</td>
						<td>${hysyywHysydtYhxmZsxx.csdjrq }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">登记人：</td>
						<td>${hysyywHysydtYhxmZsxx.djr }</td>
						<td style="background-color:#f5f8fa;">审核人：</td>
						<td>${hysyywHysydtYhxmZsxx.shrxm }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">不动产权证书编号：</td>
						<td>${hysyywHysydtYhxmZsxx.bdcqzsbh }</td>
						<td style="background-color:#f5f8fa;">不动产单元号：</td>
						<td>${hysyywHysydtYhxmZsxx.bdcdyh }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">登记类型：</td>
						<td colspan="3">${hysyywHysydtYhxmZsxx.djlx }</td>
					</tr>
					<tr>
						<th colspan="4">宗海信息</th>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">用海起始日期：</td>
						<td>${hysyywHysydtYhxmZsxx.yhqsnx }</td>
						<td style="background-color:#f5f8fa;">用海终止日期：</td>
						<td>${hysyywHysydtYhxmZsxx.yhzznx }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">用海年限：</td>
						<td>${hysyywHysydtYhxmZsxx.yhnx }</td>
						<td style="background-color:#f5f8fa;">宗海面积：</td>
						<td>${hysyywHysydtYhxmZsxx.zhmj }公顷</td>
					</tr>
					<tr>
						<td width="18%" style="background-color:#f5f8fa;">用海类型A：</td>
						<td width="25%">${hysyywHysydtYhxmZsxx.yhlxa }</td>
						<td width="18%" style="background-color:#f5f8fa;">用海类型B：</td>
						<td width="25%">${hysyywHysydtYhxmZsxx.yhlxb }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">用海性质：</td>
						<td>${hysyywHysydtYhxmZsxx.yhxz }</td>
						<td style="background-color:#f5f8fa;">确权方式：</td>
						<td>${hysyywHysydtYhxmZsxx.qqfs }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海域使用金征收标准依据：</td>
						<td>${hysyywHysydtYhxmZsxx.syjzsbzyj }</td>
						<td style="background-color:#f5f8fa;">用海设施和构筑物：</td>
						<td>${hysyywHysydtYhxmZsxx.yhssgzw }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海域使用金总额：</td>
						<td>${hysyywHysydtYhxmZsxx.syjze }元</td>
						<td style="background-color:#f5f8fa;">海域使用金缴纳方式：</td>
						<td>${hysyywHysydtYhxmZsxx.syjjnfs }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">所属海域：</td>
						<td colspan="3">${hysyywHysydtYhxmZsxx.sshy }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海域使用金征收标准：</td>
						<td colspan="3">${hysyywHysydtYhxmZsxx.syjzsbz }</td>
					</tr>
					
					<tr>
						<td style="background-color:#f5f8fa;">用海位置文字说明：</td>
						<td colspan="3">${hysyywHysydtYhxmZsxx.yhwzwzsm }</td>
					</tr>
					<tr>
						<th colspan="4">海籍管理文书图件</th>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海籍调查表号：</td>
						<td>${hysyywHysydtYhxmZsxx.hjdcbh }</td>
						<td style="background-color:#f5f8fa;">审批表号或批准合同号：</td>
						<td>${hysyywHysydtYhxmZsxx.spbh }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海籍编号：</td>
						<td>${hysyywHysydtYhxmZsxx.hjbh }</td>
						<td style="background-color:#f5f8fa;">海籍图号：</td>
						<td>${hysyywHysydtYhxmZsxx.hjth }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海域管理号：</td>
						<td>${hysyywHysydtYhxmZsxx.hyglh }</td>
						<td style="background-color:#f5f8fa;">发证日期：</td>
						<td>${hysyywHysydtYhxmZsxx.fzrq }</td>
					</tr>
					<tr>
						<th colspan="4">备注</th>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">备注：</td>
						<td colspan="3">${hysyywHysydtYhxmZsxx.bz }</td>
					</tr>
					<tr>
						<th colspan="4">重叠信息</th>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">重叠信息：</td>
						<td colspan="3">${hysyywHysydtYhxmZsxx.cdxx }</td>
					</tr>
					<tr>
						<th colspan="4">其他信息</th>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">新增用户姓名：</td>
						<td colspan="3">${hysyywHysydtYhxmZsxx.addusername }</td>
					</tr>
					<tr>
						<td  style="background-color:#f5f8fa;">新增时间：</td>
						<td>${hysyywHysydtYhxmZsxx.addtime }</td>
						<td  style="background-color:#f5f8fa;">最后修改时间：</td>
						<td>${hysyywHysydtYhxmZsxx.lastupdatetime }</td>
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