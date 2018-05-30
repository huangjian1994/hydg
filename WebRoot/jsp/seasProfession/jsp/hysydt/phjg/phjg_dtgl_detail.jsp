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
//代码
$(document).ready(function(){
	var jgfsY=document.getElementById("jgfsY").value;
	getDictionary("监管方式","jgfs",jgfsY);
	getJgfs(jgfsY);
	//getXmmc();
});
//加载字典
function getDictionary(keyZ,selectID,historyZ){
	$.ajax({		  		
		type: "post",
		dataType:"json",
		url: "${contextPath}/business/business_fetchDictionary.do",
		data: "dictionary.key="+keyZ,
		success: function(d){
			for(var i=0;i<d.length;i++){
				//alert(d);
				if(d[i].dm==historyZ){
					$("<option value= '"+d[i].dm+"' selected>"+d[i].value+"</option>").appendTo("#"+selectID);
				}else{
					$("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
				}
				}
		}
	});	  
}

function getXmmc(){
	var yhxmmc= document.getElementById("hysyywHysydtYhxmphjgDt.yhxmmc").value;
	alert(yhxmmc);
	$.ajax({		  		
		type: "post",
		dataType:"json",
		url: "${contextPath}/business/business_fetchXmmc.do",
		//data: "dictionary.key="+keyZ,
		success: function(d){
			for(var i=0;i<d.length;i++){
				//alert(d);
				if(d.length>=1){
					if(yhxmmc== d[i][1]){
						$("<option value= '"+d[i][0]+","+d[i][1]+"' selected >"+d[i][1]+"</option>").appendTo("#yhxmmc");
					}else{
						$("<option value= '"+d[i][0]+","+d[i][1]+"'>"+d[i][1]+"</option>").appendTo("#yhxmmc");
					}
				}
				}
		}
	});	  
}

function getJgfs(jgfs){
	if(jgfs=="1"){
		document.getElementById("jsjcTR1").style.display="";
		document.getElementById("jsjcTR2").style.display="none";
		document.getElementById("jsjcTR3").style.display="";
		document.getElementById("jsjcTR4").style.display="";
		document.getElementById("jsjcTR5").style.display="";
		document.getElementById("jsjcTR6").style.display="";
		document.getElementById("jsjcTR7").style.display="";
		document.getElementById("jsjcTR8").style.display="";
		document.getElementById("jsjcTR9").style.display="";
		document.getElementById("jsjcTR10").style.display="";

		document.getElementById("jsjcTR11").style.display="none";
		document.getElementById("jsjcTR12").style.display="none";
		document.getElementById("jsjcTR13").style.display="none";
		document.getElementById("jsjcTR14").style.display="none";
		document.getElementById("jsjcTR15").style.display="none";
		document.getElementById("jsjcTR16").style.display="none";
		document.getElementById("jsjcTR17").style.display="none";
		document.getElementById("jsjcTR18").style.display="none";
		document.getElementById("jsjcTR19").style.display="none";
	}
	if(jgfs=="2"){
		document.getElementById("jsjcTR1").style.display="none";
		document.getElementById("jsjcTR2").style.display="";
		document.getElementById("jsjcTR3").style.display="";
		document.getElementById("jsjcTR4").style.display="";
		document.getElementById("jsjcTR5").style.display="";
		document.getElementById("jsjcTR6").style.display="none";
		document.getElementById("jsjcTR7").style.display="none";
		document.getElementById("jsjcTR8").style.display="";
		document.getElementById("jsjcTR9").style.display="";
		document.getElementById("jsjcTR10").style.display="none";

		document.getElementById("jsjcTR11").style.display="none";
		document.getElementById("jsjcTR12").style.display="none";
		document.getElementById("jsjcTR13").style.display="none";
		document.getElementById("jsjcTR14").style.display="none";
		document.getElementById("jsjcTR15").style.display="none";
		document.getElementById("jsjcTR16").style.display="none";
		document.getElementById("jsjcTR17").style.display="none";
		document.getElementById("jsjcTR18").style.display="none";
		document.getElementById("jsjcTR19").style.display="none";
	}

	if(jgfs=="3"){
		document.getElementById("jsjcTR1").style.display="none";
		document.getElementById("jsjcTR2").style.display="none";
		document.getElementById("jsjcTR3").style.display="none";
		document.getElementById("jsjcTR4").style.display="none";
		document.getElementById("jsjcTR5").style.display="none";
		document.getElementById("jsjcTR6").style.display="none";
		document.getElementById("jsjcTR7").style.display="none";
		document.getElementById("jsjcTR8").style.display="none";
		document.getElementById("jsjcTR9").style.display="none";
		document.getElementById("jsjcTR10").style.display="none";

		document.getElementById("jsjcTR11").style.display="";
		document.getElementById("jsjcTR12").style.display="";
		document.getElementById("jsjcTR13").style.display="";
		document.getElementById("jsjcTR14").style.display="";
		document.getElementById("jsjcTR15").style.display="";
		document.getElementById("jsjcTR16").style.display="";
		document.getElementById("jsjcTR17").style.display="none";
		document.getElementById("jsjcTR18").style.display="none";
		document.getElementById("jsjcTR19").style.display="none";
	}

	if(jgfs=="4"){
		document.getElementById("jsjcTR1").style.display="none";
		document.getElementById("jsjcTR2").style.display="none";
		document.getElementById("jsjcTR3").style.display="none";
		document.getElementById("jsjcTR4").style.display="none";
		document.getElementById("jsjcTR5").style.display="";
		document.getElementById("jsjcTR6").style.display="none";
		document.getElementById("jsjcTR7").style.display="none";
		document.getElementById("jsjcTR8").style.display="none";
		document.getElementById("jsjcTR9").style.display="none";
		document.getElementById("jsjcTR10").style.display="none";

		document.getElementById("jsjcTR11").style.display="none";
		document.getElementById("jsjcTR12").style.display="none";
		document.getElementById("jsjcTR13").style.display="none";
		document.getElementById("jsjcTR14").style.display="none";
		document.getElementById("jsjcTR15").style.display="none";
		document.getElementById("jsjcTR16").style.display="none";
		document.getElementById("jsjcTR17").style.display="";
		document.getElementById("jsjcTR18").style.display="";
		document.getElementById("jsjcTR19").style.display="";
	}
}

//返回
function goBack(){
	document.myForm.action="<%=basePath%>/business/business_fetchXmDtjgList.do";
	document.myForm.target="_self";
	document.myForm.submit();
}

function goVideoOpen(dtglFjID){
	document.myForm.action="<%=basePath%>/business/business_fetchVideoDetail.do?dtglFjID="+dtglFjID;
	document.myForm.target="_blank";
	document.myForm.submit();
}
</script>
	</head>

	<body>
<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海域使用动态管理</a></li>
				<li>
					<a href="#">用海项目批后监管</a>
				</li>
				<li>
					<a href="#">用海项目动态管理</a>
				</li>
			</ul>
		</div>
		<input name="xmID" id="xmID" value="${jgxmID }" type="hidden" />
		<input name="jgXmmc" id="jgXmmc" value="${jgXmmc }" type="hidden" />
		<input name="dtglID" id="dtglID" value="${dtglID }" type="hidden" />
	
		<div class="formbody">
			<div id="usual1" class="usual">
				<div class="leftinfo1">
					<div class="itab">
						<ul>
							<li>
								<a href="#tab1" class="selected">基本信息
								<c:if test="${not empty dtglID}">
								<img src="${contextPath}/images/f03.png" width="15" height="15"/>
								</c:if>
								<c:if test="${empty dtglID}">
								<img src="${contextPath}/images/close.png" width="15" height="15"/>
								</c:if>
								</a>
							</li>
							<li>
								<a href="#tab2" >监测范围
								<c:if test="${not empty yhxmyhfsjzdList}">
								<img src="${contextPath}/images/f03.png" width="15" height="15"/>
								</c:if>
								<c:if test="${empty yhxmyhfsjzdList}">
								<img src="${contextPath}/images/close.png" width="15" height="15"/>
								</c:if>
								</a>
							</li>
							<li>
								<a href="#tab3" >监测附件
								<c:if test="${not empty phjgDtglList}">
								<img src="${contextPath}/images/f03.png" width="15" height="15"/>
								</c:if>
								<c:if test="${empty phjgDtglList}">
								<img src="${contextPath}/images/close.png" width="15" height="15"/>
								</c:if>
								</a>
							</li>
						</ul>
					</div>
			
			<div id="tab1" class="tabson">
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td style="background-color:#f5f8fa;">监测类型：</td>
					<td colspan="3">
					<c:if test="${hysyywHysydtYhxmphjgDt.jgfs=='1' }">
					建设过程监管
					</c:if>
					<c:if test="${hysyywHysydtYhxmphjgDt.jgfs=='2' }">
					竣工用海复核
					</c:if>
					<c:if test="${hysyywHysydtYhxmphjgDt.jgfs=='3' }">
					日常监管
					</c:if>
					<c:if test="${hysyywHysydtYhxmphjgDt.jgfs=='4' }">
					核查监视监测
					</c:if>
					
					<input name="jgfsY" id="jgfsY" type="hidden" class="scinput" value="${hysyywHysydtYhxmphjgDt.jgfs }" style="width:180px;height:20px;" />
					
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;" width="20%">用海项目名称：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.yhxmmc }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">任务名称：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.rwmc }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">监测人员名单：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.hcrymd }</td>
				</tr>
				<tr>
					<td width="20%" style="background-color:#f5f8fa;">监测日期：</td>
					<td width="30%">${hysyywHysydtYhxmphjgDt.jgrq }</td>
					<td width="20%" style="background-color:#f5f8fa;">监测单位名称：</td>
					<td width="30%">${hysyywHysydtYhxmphjgDt.hcdwmc }</td>
				</tr>
				
				<tr>
					<th colspan="4">监测内容</th>
				</tr>
				
				<tr id="jsjcTR1"><!-- 建设过程监管 -->
					<td style="background-color:#f5f8fa;">是否已动工：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sfydg }</td>
				</tr>
				<tr id="jsjcTR2" style="display:none;"><!-- 竣工用海复核 -->
					<td style="background-color:#f5f8fa;">是否按规定有序施工：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sfagdyxsg }</td>
				</tr>
				<tr id="jsjcTR3"><!-- 建设过程监管、竣工用海复核 -->
					<td style="background-color:#f5f8fa;">是否超范围填海：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sfcfwth }</td>
				</tr>
				<tr id="jsjcTR4" ><!-- 建设过程监管、竣工用海复核 -->
					<td style="background-color:#f5f8fa;">用海界址是否改变：</td>
					<td>${hysyywHysydtYhxmphjgDt.yhjzsfgb }</td>
					<td style="background-color:#f5f8fa;">用海面积是否改变：</td>
					<td>${hysyywHysydtYhxmphjgDt.yhmjsfgb }</td>
				</tr>
				<tr id="jsjcTR5"><!-- 建设过程监管、竣工用海复核、核查监视监测信息 -->
					<td style="background-color:#f5f8fa;">用海面积：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.yhmj }</td>
				</tr>
				<tr id="jsjcTR6"><!-- 建设过程监管 -->
					<td style="background-color:#f5f8fa;">施工方式：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sgfs }</td>
				</tr>
				<tr id="jsjcTR7"><!-- 建设过程监管 -->
					<td style="background-color:#f5f8fa;">施工进展情况：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sgjzqk }</td>
				</tr>
				<tr id="jsjcTR8"><!-- 建设过程监管、竣工用海复核 -->
					<td style="background-color:#f5f8fa;">实际用途是否改变：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sjytsfgb }</td>
				</tr>
				<tr id="jsjcTR9"><!-- 建设过程监管、竣工用海复核 -->
					<td style="background-color:#f5f8fa;">实际用途改变内容：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sjytgbnr }</td>
				</tr>
				<tr id="jsjcTR10"><!-- 建设过程监管 -->
					<td style="background-color:#f5f8fa;">岸滩演变情况：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.atybqk }</td>
				</tr>
				
				<tr id="jsjcTR11" style="display:none;"><!-- 日常监管 -->
					<td style="background-color:#f5f8fa;">是否占用海域：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sfzyhy }</td>
				</tr>
				<tr id="jsjcTR12" style="display:none;"><!-- 日常监管 -->
					<td style="background-color:#f5f8fa;">占用海域情况：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.zyhyqk }</td>
				</tr>
				<tr id="jsjcTR13" style="display:none;"><!-- 日常监管 -->
					<td style="background-color:#f5f8fa;">是否有非法围填海活动：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sfffwth }</td>
				</tr>
				<tr id="jsjcTR14" style="display:none;"><!-- 日常监管 -->
					<td style="background-color:#f5f8fa;">非法围填海活动情况：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.ffwthqk }</td>
				</tr>
				<tr id="jsjcTR15" style="display:none;"><!-- 日常监管 -->
					<td style="background-color:#f5f8fa;">是否擅自改变海域用途：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sfszgbhyyt }</td>
				</tr>
				<tr id="jsjcTR16" style="display:none;"><!-- 日常监管 -->
					<td style="background-color:#f5f8fa;">擅自改变海域用途情况：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.szgbhyytqk }</td>
				</tr>

				<tr id="jsjcTR17" style="display:none;"><!-- 核查监视监测信息 -->
					<td style="background-color:#f5f8fa;">异点异区位置：</td>
					<td>${hysyywHysydtYhxmphjgDt.ydyqwz }</td>
					<td style="background-color:#f5f8fa;">用海方式：</td>
					<td>${hysyywHysydtYhxmphjgDt.yhfs }</td>
				</tr>
				<tr id="jsjcTR18" style="display:none;"><!-- 核查监视监测信息 -->
					<td style="background-color:#f5f8fa;">实际用途：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sjyt }</td>
				</tr>
				<tr id="jsjcTR19" style="display:none;"><!-- 核查监视监测信息 -->
					<td style="background-color:#f5f8fa;">是否违规用海：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.sfwgyh }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">备注：</td>
					<td colspan="3">
						${hysyywHysydtYhxmphjgDt.bz }
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">新增用户姓名：</td>
					<td colspan="3">${hysyywHysydtYhxmphjgDt.addusername }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">新增时间：</td>
					<td>${hysyywHysydtYhxmphjgDt.addtime }</td>
					<td  style="background-color:#f5f8fa;">最后修改时间：</td>
					<td>${hysyywHysydtYhxmphjgDt.lastupdatetime }</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack()" />
					</td>
				</tr>
			</table>
			</div>
			
			<div id="tab2" class="tabson">
				<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />界址点坐标</div>
				<table width="90%" id="jzdTable" class="tablelist" style="text-align:center;">
					<tr>
						<th width="10%">序号</th>
						<th width="25%">北纬</th>
						<th width="25%">东经</th>
						</tr>
						<c:forEach items="${ yhxmyhfsjzdList }" var="r" varStatus="j">
						<tr>
							<td>${ j.count }</td>
							<td>${r.wd }</td>
							<td>${r.jd }</td>
						</tr>
						</c:forEach>
						<tr>
							<td colspan="3" style="text-align:center;">
								<input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack()" />
							</td>
						</tr>
					</table>

			</div>
			
			<div id="tab3" class="tabson">
			<table class="tablelist" style="text-align:center;">
						
						<tr>
							<th width="5%">序号</th>
							<th width="25%">现场影像名称/现场照片名称</th>
							<th width="25%">图片/视频</th>
							<th width="10%">类型</th>
							<th width="10%">新增用户</th>
							<th width="15%">新增时间</th>
						</tr>
						<c:forEach items="${ phjgDtglList }" var="r" varStatus="j">
						<tr>
							<td>${ j.count }</td>
							<td>${r.xcyxmc }</td>
							<td>
							<c:if test="${r.type =='现场照片' }">
							<a href="<%=basePath%>/business/business_fetchJgxxZpDetail.do?zhtID=${r.id}" target="_blank">
							<img src="<%=basePath%>/business/business_fetchJgxxZp.do?dtglFjID=${r.id}" width="138" height="164"/>
							</a>
							</c:if>
							<c:if test="${r.type =='现场影像' }">
							<a href="#" onclick="goVideoOpen('${ r.id }')">
							<img alt="image" width="138" height="164" src="/hydg/files/video/picture/${ r.yxjtmc }" />
							</a>
							</c:if>
							</td>
							<td>${r.type }</td>
							<td>${r.addusername }</td>
							<td>${r.addtime }</td>
						</tr>
						</c:forEach>
						<tr>
							<td colspan="6" style="text-align:center;">
								<input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack()" />
							</td>
						</tr>
				</table>
			</div>
		</div>
	</div>
</div>
</form>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>
		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
			
		</script>

	</body>

</html>