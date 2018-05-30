<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	//代码
	$(document).ready(function(){	
		var tyTD = document.getElementById("tyTD").innerHTML;
		var zbxmcTD = document.getElementById("zbxmcTD").innerHTML;
		var zsdjTD = document.getElementById("zsdjTD").innerHTML;

		getDictionaryFy("投影","tyTD",tyTD);
		getDictionaryFy("坐标系名称","zbxmcTD",zbxmcTD);
		getDictionaryFy("资质等级","zzdjTD",zzdjTD);
		getDictionaryFy("资质等级","zsdjTD",zsdjTD);

		var zzlx=document.getElementById("zzlx").value;
		getZzxx(zzlx);
		
	});
	
	//翻译字典
	function getDictionaryFy(keyZ,tableTdID,historyZ){
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

	function getZzxx(zzlx){
		
		if(zzlx=="海域使用论证资质证书"){
			//2-9
			document.getElementById("zzTr2").style.display="";
			document.getElementById("zzTr3").style.display="";
			document.getElementById("zzTr4").style.display="";
			document.getElementById("zzTr5").style.display="";
			document.getElementById("zzTr6").style.display="";
			document.getElementById("zzTr7").style.display="";
			document.getElementById("zzTr8").style.display="";
			document.getElementById("zzTr9").style.display="";
			//10-12
			document.getElementById("zzTr10").style.display="none";
			document.getElementById("zzTr11").style.display="none";
			document.getElementById("zzTr12").style.display="none";

			//15-18
			document.getElementById("zzTr15").style.display="none";
			document.getElementById("zzTr16").style.display="none";
			document.getElementById("zzTr17").style.display="none";
			document.getElementById("zzTr18").style.display="none";
			//19-22
			document.getElementById("zzTr19").style.display="none";
			document.getElementById("zzTr20").style.display="none";
			document.getElementById("zzTr21").style.display="none";
			document.getElementById("zzTr22").style.display="none";
		}
		if(zzlx=="测绘资质证书"){
			//2-9
			document.getElementById("zzTr2").style.display="";
			document.getElementById("zzTr3").style.display="";
			document.getElementById("zzTr4").style.display="none";
			document.getElementById("zzTr5").style.display="";
			document.getElementById("zzTr6").style.display="";
			document.getElementById("zzTr7").style.display="none";
			document.getElementById("zzTr8").style.display="none";
			document.getElementById("zzTr9").style.display="none";
			//10-12
			document.getElementById("zzTr10").style.display="";
			document.getElementById("zzTr11").style.display="";
			document.getElementById("zzTr12").style.display="";

			//15-18
			document.getElementById("zzTr15").style.display="none";
			document.getElementById("zzTr16").style.display="none";
			document.getElementById("zzTr17").style.display="none";
			document.getElementById("zzTr18").style.display="none";
			//19-22
			document.getElementById("zzTr19").style.display="none";
			document.getElementById("zzTr20").style.display="none";
			document.getElementById("zzTr21").style.display="none";
			document.getElementById("zzTr22").style.display="none";
		}
		if(zzlx=="论证报告"){
			//2-9
			document.getElementById("zzTr2").style.display="none";
			document.getElementById("zzTr3").style.display="none";
			document.getElementById("zzTr4").style.display="none";
			document.getElementById("zzTr5").style.display="none";
			document.getElementById("zzTr6").style.display="none";
			document.getElementById("zzTr7").style.display="none";
			document.getElementById("zzTr8").style.display="none";
			document.getElementById("zzTr9").style.display="none";
			//10-12
			document.getElementById("zzTr10").style.display="none";
			document.getElementById("zzTr11").style.display="none";
			document.getElementById("zzTr12").style.display="none";

			//15-18
			document.getElementById("zzTr15").style.display="none";
			document.getElementById("zzTr16").style.display="none";
			document.getElementById("zzTr17").style.display="none";
			document.getElementById("zzTr18").style.display="none";
			//19-22
			document.getElementById("zzTr19").style.display="";
			document.getElementById("zzTr20").style.display="";
			document.getElementById("zzTr21").style.display="";
			document.getElementById("zzTr22").style.display="";
		}
		if(zzlx=="海籍调查信息"){
			//2-9
			document.getElementById("zzTr2").style.display="none";
			document.getElementById("zzTr3").style.display="none";
			document.getElementById("zzTr4").style.display="none";
			document.getElementById("zzTr5").style.display="none";
			document.getElementById("zzTr6").style.display="none";
			document.getElementById("zzTr7").style.display="none";
			document.getElementById("zzTr8").style.display="none";
			document.getElementById("zzTr9").style.display="none";
			//10-12
			document.getElementById("zzTr10").style.display="none";
			document.getElementById("zzTr11").style.display="none";
			document.getElementById("zzTr12").style.display="none";

			//15-18
			document.getElementById("zzTr15").style.display="";
			document.getElementById("zzTr16").style.display="";
			document.getElementById("zzTr17").style.display="";
			document.getElementById("zzTr18").style.display="";
			//19-22
			document.getElementById("zzTr19").style.display="none";
			document.getElementById("zzTr20").style.display="none";
			document.getElementById("zzTr21").style.display="none";
			document.getElementById("zzTr22").style.display="none";
		}
	}
	
	//返回
	function goBack(){
		document.myForm.action="${contextPath}/qualification/qualification_fetchQualificationList.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}

	//下载附件
	function downloadfjwj(fileName){
		if(confirm("确定下载该附件吗？")){
			document.getElementById("fileName").value = fileName;
			document.myForm.action="<%=basePath%>/qualification/qualification_downLoadFjwj.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}
	}
	
    </script>
	</head>

<body>
<form name="myForm" method="post" >
	<div class="place" >
		<span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">内外部接口</a></li>
			<li><a href="#">资质管理</a></li>
		</ul>
	</div>

	<input name="zzlx" id="zzlx" value="${hysyywNwbjkZzgl.zzlx }" type="hidden" />
	<input name="fileName" id="fileName" value="" type="hidden" />
		
	<div class="formbody" >
		<div id="usual1" class="usual">
			<div class="leftinfo1">
				<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
					<table style="width:98%;" class="tablelist2" align="center">
							<tr id="zzTr1">
								<td style="background-color:#f5f8fa;">资质类型：</td>
								<td colspan="3">${hysyywNwbjkZzgl.zzlx }</td>
							</tr>
							
							<tr>
								<td  style="background-color:#f5f8fa;">社会信用代码：</td>
								<td colspan="3">${hysyywNwbjkZzgl.shxydm }</td>
							</tr>
							<tr id="zzTr2">
								<td  style="background-color:#f5f8fa;">证书编号：</td>
								<td>${hysyywNwbjkZzgl.zsbh }</td>
								<td  style="background-color:#f5f8fa;">单位名称：</td>
								<td>${hysyywNwbjkZzgl.dwmc }</td>
							</tr>
							<tr id="zzTr3">
								<td  style="background-color:#f5f8fa;">法定代表人：</td>
								<td>${hysyywNwbjkZzgl.fddbr }</td>
								<td  style="background-color:#f5f8fa;">证书等级：</td>
								<td id="zsdjTD">${hysyywNwbjkZzgl.zsdj }</td>
							</tr>
							<tr id="zzTr4">
								<td  style="background-color:#f5f8fa;">业务范围：</td>
								<td colspan="3">${hysyywNwbjkZzgl.ywfw }</td>
							</tr>
							<tr id="zzTr5">
								<td  style="background-color:#f5f8fa;">有效期至：</td>
								<td colspan="3">${hysyywNwbjkZzgl.yxqz }</td>
							</tr>
							<tr id="zzTr6">
								<td  style="background-color:#f5f8fa;">发证机关：</td>
								<td>${hysyywNwbjkZzgl.fzjg }</td>
								<td style="background-color:#f5f8fa;">发证日期：</td>
								<td>${hysyywNwbjkZzgl.fzrq }</td>
							</tr>
							<tr id="zzTr7">
								<td  style="background-color:#f5f8fa;">联系地址：</td>
								<td colspan="3">${hysyywNwbjkZzgl.lxdz }</td>
							</tr>
							<tr id="zzTr8">
								<td  style="background-color:#f5f8fa;">联系部门：</td>
								<td>${hysyywNwbjkZzgl.lxbm }</td>
								<td style="background-color:#f5f8fa;">联系人：</td>
								<td>${hysyywNwbjkZzgl.lxr }</td>
							</tr>
							<tr id="zzTr9">
								<td  style="background-color:#f5f8fa;">电话：</td>
								<td>${hysyywNwbjkZzgl.dh }</td>
								<td  style="background-color:#f5f8fa;">E-mail：</td>
								<td>${hysyywNwbjkZzgl.e_mail }</td>
							</tr>
							<!-- 测绘资质证书 -->
							<tr id="zzTr10" style="display:none;">
								<td  style="background-color:#f5f8fa;">注册地址：</td>
								<td colspan="3">${hysyywNwbjkZzgl.zcdz }</td>
							</tr>
							<tr id="zzTr11" style="display:none;">
								<td  style="background-color:#f5f8fa;">专业范围：</td>
								<td colspan="3">${hysyywNwbjkZzgl.zyfw }</td>
							</tr>
							<tr id="zzTr12" style="display:none;">
								<td  style="background-color:#f5f8fa;">测绘资料发出负责人：</td>
								<td colspan="3">${hysyywNwbjkZzgl.chzlfcfzr }</td>
							</tr>
							
							<!-- 海籍调查信息 -->
							
							<tr id="zzTr15" style="display:none;">
								<td  style="background-color:#f5f8fa;">测绘负责人：</td>
								<td>${hysyywNwbjkZzgl.chfzr }</td>
								<td  style="background-color:#f5f8fa;">测绘单位：</td>
								<td>${hysyywNwbjkZzgl.chdw }</td>
							</tr>
							<tr id="zzTr16" style="display:none;">
								<td  style="background-color:#f5f8fa;">测绘日期：</td>
								<td>${hysyywNwbjkZzgl.chrq }</td>
								<td  style="background-color:#f5f8fa;">测绘点数：</td>
								<td>${hysyywNwbjkZzgl.chds }</td>
							</tr>
							<tr id="zzTr17" style="display:none;">
								<td  style="background-color:#f5f8fa;">投影：</td>
								<td id="tyTD">${hysyywNwbjkZzgl.ty }</td>
								<td  style="background-color:#f5f8fa;">概略比例尺：</td>
								<td>${hysyywNwbjkZzgl.glblc }</td>
							</tr>
							<tr id="zzTr18" style="display:none;">
								<td  style="background-color:#f5f8fa;">坐标系名称：</td>
								<td colspan="3" id="zbxmcTD">${hysyywNwbjkZzgl.zbxmc }</td>
							</tr>
							
							<!-- 论证报告 -->
							<tr id="zzTr19" style="display:none;">
								<td  style="background-color:#f5f8fa;">论证报告名称：</td>
								<td>${hysyywNwbjkZzgl.lzbgmc }</td>
								<td  style="background-color:#f5f8fa;">论证单位：</td>
								<td>${hysyywNwbjkZzgl.lzdw }</td>
							</tr>
							<tr id="zzTr20" style="display:none;">
								<td  style="background-color:#f5f8fa;">资质等级：</td>
								<td id="zzdjTD">${hysyywNwbjkZzgl.zzdj }</td>
								<td  style="background-color:#f5f8fa;">项目负责人：</td>
								<td>${hysyywNwbjkZzgl.xmfzr }</td>
							</tr>
							<tr id="zzTr21" style="display:none;">
								<td  style="background-color:#f5f8fa;">组织评审部门：</td>
								<td>${hysyywNwbjkZzgl.zzpsbm }</td>
								<td  style="background-color:#f5f8fa;">评审专家组组长：</td>
								<td>${hysyywNwbjkZzgl.pszjzzz }</td>
							</tr>
							<tr id="zzTr22" style="display:none;">
								<td  style="background-color:#f5f8fa;">评审日期：</td>
								<td>${hysyywNwbjkZzgl.psrq }</td>
								<td  style="background-color:#f5f8fa;">质量评估分：</td>
								<td>${hysyywNwbjkZzgl.zlpgf }</td>
							</tr>
							
							<tr id="zzTr13">
								<td  style="background-color:#f5f8fa;">附件（图片）名称：</td>
								<td >
									<a href="###" onclick="downloadfjwj('${hysyywNwbjkZzgl.fjtpmc }')">
									<font color="blue">${hysyywNwbjkZzgl.fjtpmc }</font>
									</a>
								</td>
								<td  style="background-color:#f5f8fa;">图片：</td>
								<td colspan="3">
									<c:if test="${hysyywNwbjkZzgl.istp=='是'}">
									<a href="<%=basePath%>/qualification/qualification_fetchFjtpDetail.do?zzID=${hysyywNwbjkZzgl.id}" target="_blank">
									<img src="<%=basePath%>/qualification/qualification_fetchFjtp.do?zzID=${hysyywNwbjkZzgl.id}" width="138" height="164"/>
									</a>可点击放大查看
									</c:if>
									
								</td>
							</tr>
							<tr id="zzTr14">
								<td  style="background-color:#f5f8fa;">附件（文件）：</td>
								<td colspan="3">
									<a href="###" onclick="downloadfjwj('${hysyywNwbjkZzgl.fjwj }')">
									<font color="blue">${hysyywNwbjkZzgl.fjwj }</font>
									</a>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f5f8fa;">新增用户姓名：</td>
								<td colspan="3">${hysyywNwbjkZzgl.addusername }</td>
							</tr>
							<tr>
								<td width="20%" style="background-color:#f5f8fa;">新增时间：</td>
								<td width="30%">${hysyywNwbjkZzgl.addtime }</td>
								<td width="20%" style="background-color:#f5f8fa;">最后修改时间：</td>
								<td width="30%">${hysyywNwbjkZzgl.lastupdatetime }</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align:center;">
								<input name="back" type="button" class="scbtn" onclick="goBack()" value="返回" />
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