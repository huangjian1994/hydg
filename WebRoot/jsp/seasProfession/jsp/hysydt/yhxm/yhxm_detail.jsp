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
$(document).ready(function(){
	var xmwzTd = document.getElementById("xmwzTd").innerHTML;
	var tzedwTD = document.getElementById("tzedwTD").innerHTML;
	var hydbTD = document.getElementById("hydbTD").innerHTML;
	var sljgjbTD = document.getElementById("sljgjbTD").innerHTML;
	var fzjgjbTD = document.getElementById("fzjgjbTD").innerHTML;
	var tyTD = document.getElementById("tyTD").innerHTML;
	var zbxmcTD = document.getElementById("zbxmcTD").innerHTML;
	var xmxzTD = document.getElementById("xmxzTD").innerHTML;
	var zzdjTD = document.getElementById("zzdjTD").innerHTML;

	getDictionaryFy("项目位置","xmwzTd",xmwzTd);
	getDictionaryFy("海域等别","hydbTD",hydbTD);
	getDictionaryFy("受理机关级别","sljgjbTD",sljgjbTD);
	getDictionaryFy("投资额","tzedwTD",tzedwTD);
	getDictionaryFy("发证机关级别","fzjgjbTD",fzjgjbTD);
	getDictionaryFy("投影","tyTD",tyTD);
	getDictionaryFy("坐标系名称","zbxmcTD",zbxmcTD);
	getDictionaryFy("用海性质","xmxzTD",xmxzTD);
	getDictionaryFy("资质等级","zzdjTD",zzdjTD);
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



		function reinitIframe(){ 
		var iframe = document.getElementById("zhxxFrame"); 
		try{ 
		var bHeight = iframe.contentWindow.document.body.scrollHeight; 
		var dHeight = iframe.contentWindow.document.documentElement.scrollHeight; 
		var height = Math.max(bHeight, dHeight); 
		iframe.height = height; 
		}catch (ex){} 
		} 		
		window.setInterval("reinitIframe()", 200); 		
</script>

	<script type="text/javascript">
	//返回
	function goBack(){
		document.myForm.action="<%=basePath%>/business/business_fetchYhxm.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}


	//证书信息详情
	function detaileXmxxZsxx(zsID){
		document.getElementById("zsID").value = zsID;
		document.myForm.action="<%=basePath%>/business/business_fetchZhxxDetail.do";
		document.myForm.target="zhxxFrame";
		document.myForm.submit();
	}

	//附件详情：下载附件
	function downloadXmfj(fj){
		if(confirm("确定下载该附件吗？")){
			document.getElementById("fileName").value = fj;
			document.myForm.action="<%=basePath%>/business/business_downLoadXmfj.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}
	}

	//显示详情窗口
	function goDetail(fjmc,fjlx,fj,wjlx,wjdx,scr,scsj,bz,lastupdatetime){
		document.getElementById("fjmc").innerHTML=fjmc;
		document.getElementById("fjlx").innerHTML=fjlx;
		document.getElementById("fj").innerHTML=fj;
		document.getElementById("wjlx").innerHTML=wjlx;
		document.getElementById("wjdx").innerHTML=wjdx;
		document.getElementById("scr").innerHTML=scr;
		document.getElementById("scsj").innerHTML=scsj;
		document.getElementById("bz").innerHTML=bz;
		document.getElementById("lastupdatetime").innerHTML=lastupdatetime;
		
		document.getElementById("leftinfoDiv2").style.display="";
	}

	//隐藏详情窗口
	function noDetail(){
		document.getElementById("leftinfoDiv2").style.display="none";
	}
	</script>
	</head>

<body>
<form name="myForm" method="post" >
	<div class="place" >
		<span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">海域使用动态管理</a></li>
			<li><a href="#">用海项目信息管理</a></li>
			<li><a href="#">详情</a></li>
		</ul>
	</div>
	<input name="xmID" id="xmID" value="${xmID }" type="hidden" />
	<input name="zsID" id="zsID" value="" type="hidden" />
	<input name="fileName" id="fileName" value="" type="hidden" />
	
	
	<div class="formbody" >
		<div id="usual1" class="usual">
			<div class="leftinfo1">
				<div class="itab" >
					<ul>
						<li><a href="#tab1" class="selected">项目信息
							<c:if test="${not empty xmID}">
							<img src="${contextPath}/images/f03.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty xmID}">
							<img src="${contextPath}/images/close.png" width="15" height="15"/>
							</c:if>
							</a></li>
						<li><a href="#tab2">项目附件
							<c:if test="${not empty yhxmfjList}">
							<img src="${contextPath}/images/f03.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmfjList}">
							<img src="${contextPath}/images/close.png" width="15" height="15"/>
							</c:if>
						</a></li>
						<li><a href="#tab3">宗海信息
							<c:if test="${not empty yhxmzsxxList}">
							<img src="${contextPath}/images/f03.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmzsxxList}">
							<img src="${contextPath}/images/close.png" width="15" height="15"/>
							</c:if>
						</a></li>
					</ul>
				</div>
					
				<div id="tab1" class="tabson">
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
								<td width="28%" id="xmwzTd">${hysyywHysydtYhxm.xmwz }</td>
								<td width="20%"  style="background-color:#f5f8fa;">证书数量：</td>
								<td width="30%">${hysyywHysydtYhxm.zssl }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">用海总面积：</td>
								<td>${hysyywHysydtYhxm.yhzmj }公顷</td>
								<td  style="background-color:#f5f8fa;">投资额：</td>
								<td>${hysyywHysydtYhxm.tze } <font id="tzedwTD">${hysyywHysydtYhxm.tzedw }</font></td>
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
								<td  style="background-color:#f5f8fa;">预计就业人数：</td>
								<td>${hysyywHysydtYhxm.yjjyrs }人</td>
								<td  style="background-color:#f5f8fa;">预计拉动区域经济产值：</td>
								<td>${hysyywHysydtYhxm.yjldqyjjcz }万元</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">临近土地平均价格：</td>
								<td>${hysyywHysydtYhxm.ljtdpjjg }万元/公顷</td>
								<td  style="background-color:#f5f8fa;">填海成本：</td>
								<td>${hysyywHysydtYhxm.thcb }万元/公顷</td>
							</tr>
							<tr>
								<td style="background-color:#f5f8fa;">项目性质：<!-- 新增的 --></td>
								<td colspan="3" id="xmxzTD">${hysyywHysydtYhxm.xmxz }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">受理机关级别：<!-- 新增的 --></td>
								<td id="sljgjbTD">${hysyywHysydtYhxm.sljgjb }</td>
								<td  style="background-color:#f5f8fa;">受理日期：<!-- 新增的 --></td>
								<td>${hysyywHysydtYhxm.slrq }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">海域等别：</td>
								<td id="hydbTD">${hysyywHysydtYhxm.hydb }</td>
								<td  style="background-color:#f5f8fa;">用海批准日期：<!-- 未加字段 --></td>
								<td>${hysyywHysydtYhxm.yhpzrq }</td>
							</tr>
							<tr>
								<td style="background-color:#f5f8fa;">登记机关：</td>
								<td>${hysyywHysydtYhxm.djjg }</td>
								<td  style="background-color:#f5f8fa;">发证机关级别：</td>
								<td id="fzjgjbTD">${hysyywHysydtYhxm.fzjgjb }</td>
								
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
								<td  style="background-color:#f5f8fa;">社会信用代码：</td>
								<td colspan="4">${hysyywHysydtYhxm.shxydm }</td>
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
								<td id="tyTD">${hysyywHysydtYhxm.ty }</td>
								<td  style="background-color:#f5f8fa;">概略比例尺：</td>
								<td>${hysyywHysydtYhxm.glblc }</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">坐标系名称：</td>
								<td colspan="4" id="zbxmcTD">${hysyywHysydtYhxm.zbxmc }</td>
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
								<td id="zzdjTD">${hysyywHysydtYhxm.zzdj }</td>
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
								<input name="back" type="button" class="scbtn" onclick="goBack()" value="返回" />
								</td>
							</tr>
					</table>
				</div>
				<div id="tab2" class="tabson">
					<table class="tablelist" style="width:98%;border: solid 1px #c7c7c7;" align="center">
						<thead>
						<tr style="border: solid 1px #c7c7c7;" >
							<th width="4%">序号</th>
							<th width="12%">附件名称</th>
							<th width="10%">附件类型</th>
							<th width="12%">附件</th>
							<!-- 
							<th width="10%">文件类型</th><td>${r.wjlx }</td>
							 -->
							<th width="8%">文件大小</th>
							<th width="8%">上传人</th>
							<th width="13%">上传时间</th>
							<th width="12%">操作</th>
						</tr>
						</thead>
						<c:forEach items="${ yhxmfjList }" var="r" varStatus="j">
						<tr>
							<td>${ j.count }</td>
							<td>${r.fjmc }</td>
							<td>${r.fjlxmc }</td>
							<td>${r.fj }</td>
							<td>${r.wjdx }KB</td>
							<td>${r.scr }</td>
							<td>${r.scsj }</td>
							<td>
							<a href="###" onclick="goDetail('${r.fjmc }','${r.fjlxmc }','${r.fj }','${r.wjlx }','${r.wjdx }','${r.scr }','${r.scsj }','${r.bz }','${r.lastupdatetime }')" class="tablelink">详情</a>
							<a href="###" onclick="downloadXmfj('${r.fj }')" class="tablelink">下载</a>
							</td>
						</tr>
						</c:forEach>
						<tr>
							<td colspan="8" style="text-align:center;">
								<input name="back" type="button" class="scbtn" onclick="goBack()" value="返回" />
							</td>
						</tr>
					</table><br />
					
					<div class="leftinfo" id="leftinfoDiv2" style="display:none;">
					<div class="listtitle"><img src="${contextPath}/images/i02.png" width="25" height="25" />附件详情</div>
					<table class="tableXQ" width="100%">
						<tr>
						<!-- fjmc,fjlx,fj,wjlx,wjdx,scr,scsj,bz,lastupdatetime -->
							<td width="20%" style="background-color:#f5f8fa;">附件名称：</td>
							<td width="30%" ><span id="fjmc"></span></td>
							<td width="20%" style="background-color:#f5f8fa;">附件类型：</td>
							<td width="30%"><span id="fjlx"></span></td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">附件：</td>
							<td><span id="fj"></span></td>
							<td style="background-color:#f5f8fa;">文件类型：</td>
							<td><span id="wjlx"></span></td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">文件大小（KB）：</td>
							<td><span id="wjdx"></span></td>
							<td style="background-color:#f5f8fa;">上传人：</td>
							<td><span id="scr"></span></td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">上传时间：</td>
							<td><span id="scsj"></span></td>
							<td style="background-color:#f5f8fa;">最后修改时间：</td>
							<td><span id="lastupdatetime"></span></td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">备注：</td>
							<td colspan="3"><span id="bz"></span></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align:center;">
								<input name="qx" type="button" class="scbtn" onclick="noDetail()" value="取消" />
							</td>
						</tr>
					</table>
					</div>
				</div>
				
			<div id="tab3" class="tabson">
				<table class="tablelist" style="width:98%;border: solid 1px #c7c7c7;" align="center">
					<thead>
					<tr style="border: solid 1px #c7c7c7;" >
						<th width="5%">序号</th>
						<th width="10%">海域管理号</th>
						<th width="15%">用海项目名称</th>
						<th width="20%">海域使用权人</th>
						<th width="25%">用海类型</th>
						<!-- 
						<th width="15%">用海方式</th><td>（${r.zhmj }公顷）</td>
						 -->
						<th width="6%">用海性质</th>
						<th width="6%">操作</th>
					</tr>
					</thead>
					<c:forEach items="${ yhxmzsxxList }" var="r" varStatus="j">
					<tr>
						<td>${ j.count }</td>
						<td>${r[2] }</td>
						<td>${r[3] }</td>
						<td>${r[4] }</td>
						<td>${r[6] }
							<c:if test="${ not empty r[8] }">、${r[8] }</c:if>
							（${r[9] }公顷）
						</td>
						<td>${r[11] }</td>
						<td><a href="###" onclick="detaileXmxxZsxx('${r[0] }')" class="tablelink">详情</a></td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="7" style="text-align:center;">
							<input name="back" type="button" class="scbtn" onclick="goBack()" value="返回" />
						</td>
					</tr>
				</table>
				
				
				
				<!-- height:630px; -->
				<iframe name="zhxxFrame" id="zhxxFrame" style="text-align:center;width:100%;border: 0px solid red" align="middle" scrolling="no" frameborder="0"  onLoad="reinitIframe()" ></iframe>
				
				
			</div>
		
		</div>
		</div>
	</div>


		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

</form>
</body>
</html>