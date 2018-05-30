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
		<link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/dijit/themes/tundra/tundra.css" />
    	<link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/esri/css/esri.css" />
	    <script type="text/Javascript" src="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/init.js"></script>

<script>
$(document).ready(function(){
	getDictionary("用海方式","yhfs_ej","");
	getDictionary("使用金缴纳方式","jnfs","");

	
	var hydbTD = document.getElementById("hydbTD").innerHTML;
	var fzjgjbTD = document.getElementById("fzjgjbTD").innerHTML;
	var yhxzTD = document.getElementById("yhxzTD").innerHTML;
	var yhlxaTD = document.getElementById("yhlxaTD").innerHTML;
	var yhlxbTD = document.getElementById("yhlxbTD").innerHTML;
	var qqfsTD = document.getElementById("qqfsTD").innerHTML;
	var syjjnfsTD = document.getElementById("syjjnfsTD").innerHTML;

	getDictionaryFy("海域等别","hydbTD",hydbTD);
	getDictionaryFy("发证机关级别","fzjgjbTD",fzjgjbTD);
	getDictionaryFy("用海性质","yhxzTD",yhxzTD);
	getDictionaryFy("用海类型A","yhlxaTD",yhlxaTD);
	getDictionaryFy("用海类型B","yhlxbTD",yhlxbTD);
	getDictionaryFy("确权方式","qqfsTD",qqfsTD);
	getDictionaryFy("使用金缴纳方式","syjjnfsTD",syjjnfsTD);
	
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

	//显示详情窗口--申请材料
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
		
		//document.getElementById("leftinfoDiv1").style.display="none";
		document.getElementById("leftinfoDiv2").style.display="";
		//document.getElementById("leftinfoDiv3").style.display="none";
	}
	//详情隐藏--申请材料
	function noOpenSqcl(){
		document.getElementById("leftinfoDiv2").style.display="none";
	}
	//下载附件
	function downloadXmfj(fj){
		if(confirm("确定下载该附件吗？")){
			document.getElementById("fileName").value = fj;
			document.myForm.action="<%=basePath%>/business/business_downLoadXmfj.do";
			document.myForm.target="_self";
			document.myForm.submit();
		}
	}
	
	
	
	
	//详情隐藏--海域使用金
	function noOpenHysyj(){
		document.getElementById("hysyjDetailTable").style.display="none";
	}
	
	//详情-海域使用金
	function goDetailHysyj(id,addtime,lastupdatetime,addusername,adduserid,xmid,zsid,
		yhfs_ej,yhmj,yzje_zygk,yzje_dfgk,zsje_zygk,zsje_dfgk,zsje_xj,
		jmje_zygk,jmje_dfgk,jmje_xj,jnrq,xmlx,djr,djsj,
		sfwlsyh,yhsx,sm,syjdqrq,jnfs,
		yzje_ze,yzje_s,yzje_shi,yzje_q,
		zsje_s,zsje_shi,zsje_q,
		jmje_s,jmje_shi,jmje_q){
		
		
		document.getElementById("hysyjDetailTable").style.display="";
	//alert(yhfs_ej);
	document.getElementById("yhfs_ej").value=yhfs_ej;
	document.getElementById("hysyywHysydtYhxmHysyj.yhmj").innerHTML=yhmj;
	document.getElementById("hysyywHysydtYhxmHysyj.yzje_zygk").innerHTML=yzje_zygk;
	document.getElementById("hysyywHysydtYhxmHysyj.yzje_dfgk").innerHTML=yzje_dfgk;
	
	document.getElementById("hysyywHysydtYhxmHysyj.zsje_zygk").innerHTML=zsje_zygk;
	document.getElementById("hysyywHysydtYhxmHysyj.zsje_dfgk").innerHTML=zsje_dfgk;
	document.getElementById("hysyywHysydtYhxmHysyj.zsje_xj").innerHTML=zsje_xj;
	
	document.getElementById("hysyywHysydtYhxmHysyj.jmje_zygk").innerHTML=jmje_zygk;
	document.getElementById("hysyywHysydtYhxmHysyj.jmje_dfgk").innerHTML=jmje_dfgk;
	document.getElementById("hysyywHysydtYhxmHysyj.jmje_xj").innerHTML=jmje_xj;

	document.getElementById("hysyywHysydtYhxmHysyj.jnrq").innerHTML=jnrq;
	document.getElementById("hysyywHysydtYhxmHysyj.xmlx").innerHTML=xmlx;
	document.getElementById("hysyywHysydtYhxmHysyj.sfwlsyh").innerHTML=sfwlsyh;
	
	
	document.getElementById("hysyywHysydtYhxmHysyj.yhsx").innerHTML=yhsx;
	document.getElementById("hysyywHysydtYhxmHysyj.sm").innerHTML=sm;
	document.getElementById("hysyywHysydtYhxmHysyj.syjdqrq").innerHTML=syjdqrq;
	document.getElementById("jnfs").value=jnfs;
	document.getElementById("hysyywHysydtYhxmHysyj.yzje_ze").innerHTML=yzje_ze;
	document.getElementById("hysyywHysydtYhxmHysyj.yzje_s").innerHTML=yzje_s;
	document.getElementById("hysyywHysydtYhxmHysyj.yzje_shi").innerHTML=yzje_shi;
	document.getElementById("hysyywHysydtYhxmHysyj.yzje_q").innerHTML=yzje_q;
	
	document.getElementById("hysyywHysydtYhxmHysyj.zsje_s").innerHTML=zsje_s;
	document.getElementById("hysyywHysydtYhxmHysyj.zsje_shi").innerHTML=zsje_shi;
	document.getElementById("hysyywHysydtYhxmHysyj.zsje_q").innerHTML=zsje_q;
	
	document.getElementById("hysyywHysydtYhxmHysyj.jmje_s").innerHTML=jmje_s;
	document.getElementById("hysyywHysydtYhxmHysyj.jmje_shi").innerHTML=jmje_shi;
	document.getElementById("hysyywHysydtYhxmHysyj.jmje_q").innerHTML=jmje_q;
		
	document.getElementById("hysyywHysydtYhxmHysyj.djr").innerHTML=djr;
	document.getElementById("hysyywHysydtYhxmHysyj.djsj").innerHTML=djsj;
	
}

	//异步获取界址点坐标
	function getJzd(){
		var xmID = document.getElementById("xmID").value;
		var zsID = document.getElementById("zsID").value;
		$.ajax({		  		
			type: "post",
			dataType:"json",
			url: "${contextPath}/business/business_getYhfsJzd.do",
			data: "xmID="+xmID+"&zsID="+zsID,
			success: function(d){
				alert(d);
				for(var i=0;i<d.length;i++){
					if(i==0){
					alert("序号="+d[i].xh+"，北纬="+d[i].wd+"，东经="+d[i].jd);
					}
				}
			}
		});	  
	}

	
</script>
</head>
<body>
<form name="myForm" method="post" >
<input name="fileName" id="fileName" value="" type="hidden" />
<input name="xmID" id="xmID" value="${xmID }" type="hidden" />
<input name="zsID" id="zsID" value="${hysyywHysydtYhxmZsxx.id }" type="hidden" />

	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="leftinfo1">
				<div class="itab">
					<ul>
						<li><a href="#tab9" class="selected">证书信息
							<c:if test="${not empty hysyywHysydtYhxmZsxx}">
							<img src="${contextPath}/images/f03.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty hysyywHysydtYhxmZsxx}">
							<img src="${contextPath}/images/close.png" width="15" height="15"/>
							</c:if>
						</a></li>
						<li><a href="#tab4">用海方式
							<c:if test="${not empty yhxmyhfsList}">
							<img src="${contextPath}/images/f03.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmyhfsList}">
							<img src="${contextPath}/images/close.png" width="15" height="15"/>
							</c:if>
						</a></li>
						<li><a href="#tab5">海域使用金
							<c:if test="${not empty yhxmsyjList}">
							<img src="${contextPath}/images/f03.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmsyjList}">
							<img src="${contextPath}/images/close.png" width="15" height="15"/>
							</c:if>
						</a></li>
						<li><a href="#tab6">宗海图
							<c:if test="${not empty yhxmzhtList}">
							<img src="${contextPath}/images/f03.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmzhtList}">
							<img src="${contextPath}/images/close.png" width="15" height="15"/>
							</c:if>
						</a></li>
						<li><a href="#tab7">申请材料
							<c:if test="${not empty yhxmsqclList}">
							<img src="${contextPath}/images/f03.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmsqclList}">
							<img src="${contextPath}/images/close.png" width="15" height="15"/>
							</c:if>
						</a></li>
						<li><a href="#tab8">地图定位
							<c:if test="${not empty yhxmyhfsjzdList}">
							<img src="${contextPath}/images/f03.png" width="15" height="15"/>
							</c:if>
							<c:if test="${empty yhxmyhfsjzdList}">
							<img src="${contextPath}/images/close.png" width="15" height="15"/>
							</c:if>
						</a></li>
					</ul>
				</div>
			<div id="tab9" class="tabson" >
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
						<td id="hydbTD">${hysyywHysydtYhxmZsxx.hydb }</td>
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
						<td id="fzjgjbTD">${hysyywHysydtYhxmZsxx.fzjgjb }</td>
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
						<td style="background-color:#f5f8fa;">不动产权证书发证日期：</td>
						<td>${hysyywHysydtYhxmZsxx.bdcqzsfzrq }</td>
						<td style="background-color:#f5f8fa;">登记类型：</td>
						<td>${hysyywHysydtYhxmZsxx.djlx }</td>
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
						<td width="25%" id="yhlxaTD">${hysyywHysydtYhxmZsxx.yhlxa }</td>
						<td width="18%" style="background-color:#f5f8fa;">用海类型B：</td>
						<td width="25%" id="yhlxbTD">${hysyywHysydtYhxmZsxx.yhlxb }</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">用海性质：</td>
						<td id="yhxzTD">${hysyywHysydtYhxmZsxx.yhxz }</td>
						<td style="background-color:#f5f8fa;">确权方式：</td>
						<td id="qqfsTD">${hysyywHysydtYhxmZsxx.qqfs }</td>
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
						<td id="syjjnfsTD">${hysyywHysydtYhxmZsxx.syjjnfs }</td>
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
				</table>
			</div>

			<div id="tab4" class="tabson">
				<div class="yhfslb" style="height: auto;float:left;width:49%;">
				<p><span></span>用海方式列表</p></div>
				<table class="tablelist" width="95%">
					<tr>
						<th width="5%">序号</th>
						<th width="10%">标识</th>
						<th width="10%">用海方式</th>
						<th width="10%">面积</th>
						<th width="20%">具体用途</th>
						<!--  
						<th>操作</th><td></td>
						-->
					</tr>
					<c:forEach items="${ yhxmyhfsList }" var="r" varStatus="j">
					<tr>
						<td>${ j.count }</td>
						<td>${r.bs }</td>
						<td>${r.yhfsmc }</td>
						<td>${r.mj }公顷<!-- 公顷 --></td>
						<td>${r.jtyt }</td>
						
					</tr>
					</c:forEach>
				</table>
				<br />
				
				
				<div style="height: auto;float:left; width:100%;" >
				<div class="yhsyt" style="height: auto;float:left;width:49%;margin-top: 10px;">
					<p><span></span>用海示意图</p>
					<div id="mapFS"></div>
					<!-- 图片
					<input name="ybhq"  type="button" class="scbtn1" onclick="getJzd()" value="异步获取" />
					 -->
				</div>
				
				<div class="jzdzb" style="height: auto;float:right;width:50%;margin-top: 10px;">
					<p><span></span>界址点坐标</p>
					
					<table width="100%" class="tablelist" style="text-align:center;">
						<tr>
							<th>序号</th>
							<th>北纬</th>
							<th>东经</th>
						</tr>
						<c:forEach items="${ yhxmyhfsjzdList }" var="r" varStatus="j">
						<tr>
							<td width="20%">${r.xh }</td>
							<td width="30%">${r.wd }</td>
							<td width="30%">${r.jd }</td>
						</tr>
						</c:forEach>
					</table>
					<!-- 
					<br />
					<table class="tableXQ" width="100%">
						<tr>
							<td style="background-color:#f5f8fa;">显示格式：</td>
							<td style="background-color:#ffffff;">
								<input type="radio" name="check" class="checkbox" checked="checked" />度分秒方式显示
								<br />
								<input type="radio" name="check" class="checkbox" />经度纬度值方式显示
							</td>
							<td style="background-color:#ffffff;">
								<input name="" type="button" class="scbtn1" onclick="" value="互换" />
							</td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">导出：</td>
							<td style="background-color:#ffffff;">
								<select name="" id="" style="width:150px;">
									<option value="">请选择导出坐标串格式</option>
								</select>
							</td>
							<td style="background-color:#ffffff;">
								<input name="" type="button" class="scbtn1" onclick="" value="导出" />
							</td>
						</tr>
					</table>
					 -->
				</div>
				&nbsp;
			</div>
			&nbsp;
		</div>

		<div id="tab5" class="tabson">
			<table width="100%" align="center" class="tablelist2" style="text-align:left;">
					<!-- 
					t.id tid,y.id yid,t.zsh,y.yhxmmc,y.xmwz,y.hysyqr,t.QQFS,
				t.YHLXA,t.YHLXB,t.SFWLSYH,t.YHSX
					 -->
					<tr>
						<th colspan="10" style="text-align:left;">
						<img src="${contextPath}/images/ico04.png" width="20" height="20" />缴纳明细
						</th>
					</tr>
					<c:forEach items="${ zsxxList }" var="r" varStatus="j">
					<!-- 
					<tr>
						<td style="background-color:#f5f8fa;">海域管理号：</td>
						<td colspan="3">${r[2]}
						<input name="hysyywHysydtYhxmHysyj.hyglh" id="hysyywHysydtYhxmHysyj.hyglh" type="hidden" value="${r[2]}" />
						</td>
					</tr>
					 -->
					<tr>
						<td width="20%" style="background-color:#f5f8fa;">项目名称：</td>
						<td width="30%">${r[3] }
						<input name="hysyywHysydtYhxmHysyj.xmmc" id="xmmc" type="hidden" value="${r[3] }" />
						</td>
						<td width="20%" style="background-color:#f5f8fa;">项目位置：</td>
						<td width="30%">${r[11] }
						<input name="hysyywHysydtYhxmHysyj.xmwz" id="xmwz" type="hidden" value="${r[4] }" />
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海域使用权人：</td>
						<td>${r[5] }
						<input name="hysyywHysydtYhxmHysyj.hysyqr" id="hysyqr" type="hidden" value="${r[5] }" />
						</td>
						<td style="background-color:#f5f8fa;">确权方式：</td>
						<td>${r[12] }
						<input name="hysyywHysydtYhxmHysyj.qqfs" id="qqfs" type="hidden" value="${r[6] }" />
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">用海类型A：</td>
						<td>${r[13] }
						<input name="hysyywHysydtYhxmHysyj.yhlxa" id="yhlxa" type="hidden" value="${r[7] }" />
						</td>
						<td style="background-color:#f5f8fa;">用海类型B：</td>
						<td>${r[14] }
						<input name="hysyywHysydtYhxmHysyj.yhlxb" id="yhlxb" type="hidden" value="${r[8] }" />
						</td>
					</tr>
					</c:forEach>
				</table><br />
				<table class="tablelist"  width="100%">
					<tr>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th colspan="6">海域使用金应征金额（元）</th>
						<th colspan="6">海域使用金征收金额（元）</th>
						<th colspan="6">海域使用金减免金额（元）</th>
						<th></th>
					</tr>
					<tr>
						<th>序号</th>
						<th>缴纳日期</th>
						<th>用海方式<!-- （二级） --></th>
						<th>用海面积<!-- （公顷） --></th>
						
						<th>总额</th>
						<th>中央</th>
						<th>地方</th>
						<th>省</th>
						<th>市</th>
						<th>区县</th>
						
						<th>总额</th>
						<th>中央</th>
						<th>地方</th>
						<th>省</th>
						<th>市</th>
						<th>区县</th>
						
						<th>总额</th>
						<th>中央</th>
						<th>地方</th>
						<th>省</th>
						<th>市</th>
						<th>区县</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${ yhxmsyjList }" var="r" varStatus="j">
					<tr>
						<td>${ j.count }</td>
						<td>${r.jnrq }</td>
						<td>
						<c:if test="${r.yhfs_ej=='11' }">建设填海造地</c:if>
						<c:if test="${r.yhfs_ej=='12' }">农业填海造地</c:if>
						<c:if test="${r.yhfs_ej=='13' }">废弃物处置填海造地</c:if>
						<c:if test="${r.yhfs_ej=='21' }">非透水构筑物</c:if>
						<c:if test="${r.yhfs_ej=='22' }">跨海桥梁、海底隧道等</c:if>
						<c:if test="${r.yhfs_ej=='23' }">透水构筑物</c:if>
						<c:if test="${r.yhfs_ej=='31' }">港池、蓄水等</c:if>
						<c:if test="${r.yhfs_ej=='32' }">盐业</c:if>
						<c:if test="${r.yhfs_ej=='33' }">围海养殖</c:if>
						<c:if test="${r.yhfs_ej=='41' }">开放式养殖</c:if>
						<c:if test="${r.yhfs_ej=='42' }">浴场</c:if>
						<c:if test="${r.yhfs_ej=='43' }">游乐场</c:if>
						<c:if test="${r.yhfs_ej=='44' }">专用航道、锚地及其它开放式</c:if>
						<c:if test="${r.yhfs_ej=='51' }">人工岛式油气开采</c:if>
						<c:if test="${r.yhfs_ej=='52' }">平台式油气开采</c:if>
						<c:if test="${r.yhfs_ej=='53' }">海底电缆管道</c:if>
						<c:if test="${r.yhfs_ej=='54' }">海砂等矿产开采</c:if>
						<c:if test="${r.yhfs_ej=='55' }">取、排水口</c:if>
						<c:if test="${r.yhfs_ej=='56' }">污水达标排放</c:if>
						<c:if test="${r.yhfs_ej=='57' }">倾倒</c:if>
						</td>
						
						
						<td>${r.yhmj }公顷</td>
						
						<td>${r.yzje_ze }</td>
						<td>${r.yzje_zygk }</td>
						<td>${r.yzje_dfgk }</td>
						<td>${r.yzje_s }</td>
						<td>${r.yzje_shi }</td>
						<td>${r.yzje_q }</td>
						
						<td>${r.zsje_xj }</td>
						<td>${r.zsje_zygk }</td>
						<td>${r.zsje_dfgk }</td>
						<td>${r.zsje_s }</td>
						<td>${r.zsje_shi }</td>
						<td>${r.zsje_q }</td>
						
						<td>${r.jmje_xj }</td>
						<td>${r.jmje_zygk }</td>
						<td>${r.jmje_dfgk }</td>
						<td>${r.jmje_s }</td>
						<td>${r.jmje_shi }</td>
						<td>${r.jmje_q }</td>
						<td>
						<a href="###" onclick="goDetailHysyj('${r.id }','${r.addtime }','${r.lastupdatetime }','${r.addusername }','${r.adduserid }','${r.xmid }','${r.zsid }',
							'${r.yhfs_ej }','${r.yhmj }','${r.yzje_zygk }','${r.yzje_dfgk }','${r.zsje_zygk }','${r.zsje_dfgk }',
							'${r.zsje_xj }','${r.jmje_zygk }','${r.jmje_dfgk }','${r.jmje_xj }','${r.jnrq }','${r.xmlx }','${r.djr}','${r.djsj }',
							'${r.sfwlsyh }','${r.yhsx }','${r.sm }','${r.syjdqrq }','${r.jnfs }',
							'${r.yzje_ze }','${r.yzje_s }','${r.yzje_shi }','${r.yzje_q }',
							'${r.zsje_s }','${r.zsje_shi }','${r.zsje_q }',
							'${r.jmje_s }','${r.jmje_shi }','${r.jmje_q }')" class="tablelink">详情</a>
						</td>
					</tr>
					</c:forEach>
					
				</table><br />
			
			
				<table class="tablelist" id="hysyjDetailTable" width="100%" style="display:none;">
					<tr>
						<th colspan="18" style="text-align:left;">
						<img src="${contextPath}/images/ico04.png" width="20" height="20" />详情
						</th>
					</tr>
					<tr>
					<td colspan="18">
					<table width="100%" align="center" class="tableXQ" style="text-align:left;">
					<tr>
						<td style="background-color:#f5f8fa;">是否为临时用海：</td>
						<td style="background-color:#ffffff;"><span id="hysyywHysydtYhxmHysyj.sfwlsyh"></span>
						</td>
						<td style="background-color:#f5f8fa;">用海时限（日）：</td>
						<td style="background-color:#ffffff;"><span id="hysyywHysydtYhxmHysyj.yhsx"></span>
						</td>
					</tr>
					<tr>
						<td width="20%" style="background-color:#f5f8fa;">缴纳日期：</td>
						<td width="30%" style="background-color:#ffffff;">
							<span id="hysyywHysydtYhxmHysyj.jnrq"></span>
						</td>
						<td width="20%" style="background-color:#f5f8fa;">项目类型：</td>
						<td width="30%" style="background-color:#ffffff;">
							<span id="hysyywHysydtYhxmHysyj.xmlx"></span>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">登记人：</td>
						<td style="background-color:#ffffff;">
							<span id="hysyywHysydtYhxmHysyj.djr"></span>
						</td>
						<td style="background-color:#f5f8fa;">缴纳登记日期：</td>
						<td style="background-color:#ffffff;">
							<span id="hysyywHysydtYhxmHysyj.djsj"></span>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">说明：</td>
						<td colspan="3" style="background-color:#ffffff;">
							<span id="hysyywHysydtYhxmHysyj.sm"></span>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">用海方式（二级）：</td>
						<td style="background-color:#ffffff;">
							<select name="hysyywHysydtYhxmHysyj.yhfs_ej" id="yhfs_ej" >
								<option value="">-请选择-</option>
							</select>
						</td>
						<td style="background-color:#f5f8fa;">用海面积（公顷）：</td>
						<td style="background-color:#ffffff;"><span id="hysyywHysydtYhxmHysyj.yhmj"></span></td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">使用金到期日期：</td>
						<td style="background-color:#ffffff;"><span id="hysyywHysydtYhxmHysyj.syjdqrq"></span></td>
						<td style="background-color:#f5f8fa;">缴纳方式：</td>
						<td style="background-color:#ffffff;">
							<select name="hysyywHysydtYhxmHysyj.jnfs" id="jnfs" style="width:100px;">
								<option value="">-请选择-</option>
							</select></td>
					</tr>
					</table>
					</td>
					</tr>
					<tr>
						<th colspan="6">海域使用金应征金额（元）</th>
						<th colspan="6">海域使用金征收金额（元）</th>
						<th colspan="6">海域使用金减免金额（元）</th>
					</tr>
					<tr>
						
						<th width="5%">总额</th>
						<th width="5%">中央</th>
						<th width="5%">地方</th>
						<th width="5%">省</th>
						<th width="5%">市</th>
						<th width="5%">区县</th>
						
						<th width="5%">总额</th>
						<th width="5%">中央</th>
						<th width="5%">地方</th>
						<th width="5%">省</th>
						<th width="5%">市</th>
						<th width="5%">区县</th>
						
						<th width="5%">总额</th>
						<th width="5%">中央</th>
						<th width="5%">地方</th>
						<th width="5%">省</th>
						<th width="5%">市</th>
						<th width="5%">区县</th>
						
					</tr>
					<tr>
						
						<td><span id="hysyywHysydtYhxmHysyj.yzje_ze"></span></td>
						<td><span id="hysyywHysydtYhxmHysyj.yzje_zygk"></span></td>
						<td><span id="hysyywHysydtYhxmHysyj.yzje_dfgk"></span></td>
						<td><span id="hysyywHysydtYhxmHysyj.yzje_s"></span></td>
						<td><span id="hysyywHysydtYhxmHysyj.yzje_shi"></span></td>
						<td><span id="hysyywHysydtYhxmHysyj.yzje_q"></span></td>
						
						<td><span id="hysyywHysydtYhxmHysyj.zsje_xj"></span></td>
						<td><span id="hysyywHysydtYhxmHysyj.zsje_zygk"></span></td>
						<td><span id="hysyywHysydtYhxmHysyj.zsje_dfgk"></span></td>
						<td><span id="hysyywHysydtYhxmHysyj.zsje_s"></span></td>
						<td><span id="hysyywHysydtYhxmHysyj.zsje_shi"></span></td>
						<td><span id="hysyywHysydtYhxmHysyj.zsje_q"></span></td>
						
						<td><span id="hysyywHysydtYhxmHysyj.jmje_xj"></span></td>
						<td><span id="hysyywHysydtYhxmHysyj.jmje_zygk"></span></td>
						<td><span id="hysyywHysydtYhxmHysyj.jmje_dfgk"></span></td>
						<td><span id="hysyywHysydtYhxmHysyj.jmje_s"></span></td>
						<td><span id="hysyywHysydtYhxmHysyj.jmje_shi"></span></td>
						<td><span id="hysyywHysydtYhxmHysyj.jmje_q"></span></td>
						
					</tr>
					<tr>
						<td colspan="18" style="text-align:center;">	
							<input name="xg" type="button" class="scbtn1" onclick="noOpenHysyj()" value="取消" />
						</td>
					</tr>
				</table>
			
		</div>
		
		
		<div id="tab6" class="tabson">
			<table width="100%" class="tablelist" style="text-align:center;">
				<tr>
					<th width="5%">序号</th>
					<th width="30%">用海位置图</th>
					<th width="30%">界址图</th>
					<th width="15%">新增人</th>
					<th width="15%">新增时间</th>
				</tr>
				<c:forEach items="${ yhxmzhtList }" var="r" varStatus="j">
				<tr>
					<td>${j.count }</td>
					<td>
					<a href="<%=basePath%>/business/business_fetchZhtDetail.do?zhtID=${r.id}&zhttype=yhwzt" target="_blank">
					<img src="<%=basePath%>/business/business_fetchZht.do?zhtID=${r.id}&zhttype=yhwzt" width="138" height="164"/>
					</a>
					</td>
					<td>
					<a href="<%=basePath%>/business/business_fetchZhtDetail.do?zhtID=${r.id}&zhttype=jzt" target="_blank">
					<img src="<%=basePath%>/business/business_fetchZht.do?zhtID=${r.id}&zhttype=jzt" width="138" height="164"/>
					</a>
					</td>
					<td>${r.addusername }</td>
					<td>${r.addtime }</td>
				</tr>
				</c:forEach>
			</table>
		
		</div>
		
		<div id="tab7" class="tabson">
			<table width="100%" class="tablelist" style="text-align:center;">
				<tr>
					<th width="5%">序号</th>
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
				<c:forEach items="${ yhxmsqclList }" var="r" varStatus="j">
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
			</table><br />
			
			<div class="leftinfo" id="leftinfoDiv2" style="display:none;">
					<div class="listtitle"><img src="${contextPath}/images/i02.png" width="20" height="20" />附件详情</div>
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
								<input name="qx" type="button" class="scbtn" onclick="noOpenSqcl()" value="取消" />
							</td>
						</tr>
					</table>
					</div>
			
		</div>
		
		<div id="tab8" class="tabson">
			<div id ="mapDW" style="height:600px"></div>
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
		
		<script type="text/javascript" src="${contextPath}/js/seasProfession/zhxxDFS.js"></script>
		<script type="text/javascript" src="${contextPath}/js/seasProfession/zhxxDDW.js"></script>

</form>
</body>
</html>