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
		var zbxmcY=document.getElementById("zbxmcY").value;
		var tyY=document.getElementById("tyY").value;
		var zsdjY =document.getElementById("zsdjY").value;
		var zzdjY =document.getElementById("zzdjY").value;

		getDictionary("投影","ty",tyY);
		getDictionary("坐标系名称","zbxmc",zbxmcY);
		getDictionary("资质等级","zsdj",zsdjY);
		getDictionary("资质等级","zzdj",zzdjY);
		
		/*JQuery 限制文本框只能输入数字*/
		$(".NumText").keyup(function(){    
		                $(this).val($(this).val().replace(/\D|^0/g,''));
		            }).bind("paste",function(){  //CTR+V事件处理    
		                $(this).val($(this).val().replace(/\D|^0/g,''));     
		            }).css("ime-mode", "disabled"); //CSS设置输入法不可用
		/*JQuery 限制文本框只能输入数字和小数点*/
		$(".NumDecText").keyup(function(){    
		                $(this).val($(this).val().replace(/[^0-9.]/g,''));    
		                }).bind("paste",function(){  //CTR+V事件处理    
		                    $(this).val($(this).val().replace(/[^0-9.]/g,''));     
		                }).css("ime-mode", "disabled"); //CSS设置输入法不可用 


		var zzlx=document.getElementById("zzlx").value;
		getZzxxHx(zzlx);
		
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

	function getZzxxHx(zzlx){
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

	function getZzxx(obj){
		var zzlx=obj.value;
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

	//保存
	function saveYhxm(){
		if(document.getElementById("zzlx").value ==""){
			alert("资质类型不允许为空！");
			return false;
		}
		var zzlx=document.getElementById("zzlx").value;

		if(zzlx=="海域使用论证资质证书"){
			
		if(document.getElementById("zsbh").value ==""){
			alert("证书编号不允许为空！");
			return false;
		}
		if(document.getElementById("dwmc").value ==""){
			alert("单位名称不允许为空！");
			return false;
		}
		if(document.getElementById("fddbr").value ==""){
			alert("法定代表人不允许为空！");
			return false;
		}
		if(document.getElementById("zsdj").value ==""){
			alert("证书等级不允许为空！");
			return false;
		}
		if(document.getElementById("ywfw").value ==""){
			alert("业务范围不允许为空！");
			return false;
		}
		if(document.getElementById("yxqz").value ==""){
			alert("有效期至不允许为空！");
			return false;
		}
		if(document.getElementById("fzjg").value ==""){
			alert("发证机关不允许为空！");
			return false;
		}
		if(document.getElementById("fzrq").value ==""){
			alert("发证日期不允许为空！");
			return false;
		}
		}
		if(zzlx=="测绘资质证书"){
			if(document.getElementById("zsbh").value ==""){
				alert("证书编号不允许为空！");
				return false;
			}
			if(document.getElementById("dwmc").value ==""){
				alert("单位名称不允许为空！");
				return false;
			}
			if(document.getElementById("fddbr").value ==""){
				alert("法定代表人不允许为空！");
				return false;
			}
			if(document.getElementById("zsdj").value ==""){
				alert("证书等级不允许为空！");
				return false;
			}
			if(document.getElementById("yxqz").value ==""){
				alert("有效期至不允许为空！");
				return false;
			}
			if(document.getElementById("fzjg").value ==""){
				alert("发证机关不允许为空！");
				return false;
			}
			if(document.getElementById("fzrq").value ==""){
				alert("发证日期不允许为空！");
				return false;
			}
			if(document.getElementById("zcdz").value ==""){
				alert("注册地址不允许为空！");
				return false;
			}
			if(document.getElementById("zyfw").value ==""){
				alert("专业范围不允许为空！");
				return false;
			}
			if(document.getElementById("chzlfcfzr").value ==""){
				alert("测绘资料发出负责人不允许为空！");
				return false;
			}
			
		}
		if(zzlx=="论证报告"){
			if(document.getElementById("lzbgmc").value ==""){
				alert("论证报告名称不允许为空！");
				return false;
			}
			if(document.getElementById("lzdw").value ==""){
				alert("论证单位不允许为空！");
				return false;
			}
			if(document.getElementById("zzdj").value ==""){
				alert("资质等级不允许为空！");
				return false;
			}
			if(document.getElementById("xmfzr").value ==""){
				alert("项目负责人不允许为空！");
				return false;
			}
			if(document.getElementById("zzpsbm").value ==""){
				alert("组织评审部门不允许为空！");
				return false;
			}
			if(document.getElementById("pszjzzz").value ==""){
				alert("评审专家组组长不允许为空！");
				return false;
			}
			if(document.getElementById("psrq").value ==""){
				alert("评审日期不允许为空！");
				return false;
			}
			if(document.getElementById("zlpgf").value ==""){
				alert("质量评估分不允许为空！");
				return false;
			}
		}
		if(zzlx=="海籍调查信息"){
			if(document.getElementById("chfzr").value ==""){
				alert("测绘负责人不允许为空！");
				return false;
			}
			if(document.getElementById("chdw").value ==""){
				alert("测绘单位不允许为空！");
				return false;
			}
			if(document.getElementById("chrq").value ==""){
				alert("测绘日期不允许为空！");
				return false;
			}
			if(document.getElementById("chds").value ==""){
				alert("测绘点数不允许为空！");
				return false;
			}
			if(document.getElementById("ty").value ==""){
				alert("投影不允许为空！");
				return false;
			}
			if(document.getElementById("glblc").value ==""){
				alert("概略比例尺不允许为空！");
				return false;
			}
			if(document.getElementById("zbxmc").value ==""){
				alert("坐标系名称不允许为空！");
				return false;
			}
		}
		//上传图片控制格式
		var filename1=document.myForm.upload.value;
		var hz1=filename1.substring(filename1.length-4,filename1.length);
		if(filename1 !=""){
			if (hz1!=".jpg" && hz1!=".png" && hz1!=".JPG" && hz1!=".PNG" && hz1!=".gif"){
				alert("请上传jpg或png格式的图片！！"); 				
			    return false; 
			}
		}
		document.myForm.action="<%=basePath%>/qualification/qualification_updateQualification.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
    </script>
	</head>

<body>
<form name="myForm" method="post" enctype="multipart/form-data">
	<div class="place" >
		<span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">内外部接口</a></li>
			<li><a href="#">资质管理</a></li>
		</ul>
	</div>
	<input name="xmID" id="xmID" value="" type="hidden" />
	<input name="zsID" id="zsID" value="" type="hidden" />
	
	
	<div class="formbody" >
		<div id="usual1" class="usual">
			<div class="leftinfo1">
				<div class="listtitle"><img src="${contextPath}/images/ico02.png" width="20" height="20" />修改</div>
					<table style="width:98%;" class="tablelist2" align="center">
							<tr id="zzTr1">
								<td style="background-color:#f5f8fa;">资质类型：</td>
								<td colspan="3">
									<select name="hysyywNwbjkZzgl.zzlx" id="zzlx" style="width:200px;" onchange="getZzxx(this)">
										<option value="">-请选择-</option>
										<option value="海域使用论证资质证书">海域使用论证资质证书</option>
										<option value="测绘资质证书">测绘资质证书</option>
										<!-- 
										<option value="论证报告">论证报告</option>
										<option value="海籍调查信息">海籍调查信息</option>
										 -->
									</select>
									<font color="red">*</font>
									<input name="zzlxY" id="zzlxY" type="hidden" value="${hysyywNwbjkZzgl.zzlx }"/>
								</td>
							</tr>
							<tr>
								<td  style="background-color:#f5f8fa;">社会信用代码：</td>
								<td colspan="3">
									<input name="hysyywNwbjkZzgl.shxydm" id="hysyywNwbjkZzgl.shxydm" type="text" value="${hysyywNwbjkZzgl.shxydm }" style="width:400px;" />
								</td>
							</tr>
							<tr id="zzTr2">
								<td  style="background-color:#f5f8fa;">证书编号：</td>
								<td>
									<input name="hysyywNwbjkZzgl.zsbh" id="zsbh" type="text" value="${hysyywNwbjkZzgl.zsbh }" style="width:200px;" />
									<font color="red">*</font>
								</td>
								<td  style="background-color:#f5f8fa;">单位名称：</td>
								<td>
									<input name="hysyywNwbjkZzgl.dwmc" id="dwmc" type="text" value="${hysyywNwbjkZzgl.dwmc }" style="width:200px;" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr id="zzTr3">
								<td  style="background-color:#f5f8fa;">法定代表人：</td>
								<td>
									<input name="hysyywNwbjkZzgl.fddbr" id="fddbr" type="text" value="${hysyywNwbjkZzgl.fddbr }" style="width:200px;" />
									<font color="red">*</font>
								</td>
								<td  style="background-color:#f5f8fa;">证书等级：</td>
								<td>
									<select name="hysyywNwbjkZzgl.zsdj" id="zsdj" style="width:200px;">
										<option value="">-请选择-</option>
									</select><font color="red">*</font>
									<input name="zsdjY" id="zsdjY" type="hidden" value="${hysyywNwbjkZzgl.zsdj }"/>
								</td>
							</tr>
							<tr id="zzTr4">
								<td  style="background-color:#f5f8fa;">业务范围：</td>
								<td colspan="3">
									<textarea name="hysyywNwbjkZzgl.ywfw" id="ywfw" rows="3" cols="80" >${hysyywNwbjkZzgl.ywfw }</textarea>
									<font color="red">*</font>
								</td>
							</tr>
							<tr id="zzTr5">

								<td  style="background-color:#f5f8fa;">有效期至：</td>
								<td colspan="3">
									<input name="hysyywNwbjkZzgl.yxqz" id="yxqz" type="text" value="${hysyywNwbjkZzgl.yxqz }" style="width:200px;" onclick="WdatePicker()" readonly="readonly" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr id="zzTr6">
								<td  style="background-color:#f5f8fa;">发证机关：</td>
								<td>
									<input name="hysyywNwbjkZzgl.fzjg" id="fzjg" type="text" value="${hysyywNwbjkZzgl.fzjg }" style="width:200px;" />
									<font color="red">*</font>
								</td>
								<td  style="background-color:#f5f8fa;">发证日期：</td>
								<td>
									<input name="hysyywNwbjkZzgl.fzrq" id="fzrq" onclick="WdatePicker()" readonly="readonly" type="text" value="${hysyywNwbjkZzgl.fzrq }" style="width:200px;" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr id="zzTr7">
								<td  style="background-color:#f5f8fa;">联系地址：</td>
								<td colspan="3">
									<input name="hysyywNwbjkZzgl.lxdz" id="lxdz" type="text" value="${hysyywNwbjkZzgl.lxdz }" style="width:500px;" />
								</td>
							</tr>
							<tr id="zzTr8">
								<td  style="background-color:#f5f8fa;">联系部门：</td>
								<td>
									<input name="hysyywNwbjkZzgl.lxbm" id="lxbm" type="text" value="${hysyywNwbjkZzgl.lxbm }" style="width:200px;" />
								</td>
								<td style="background-color:#f5f8fa;">联系人：</td>
								<td>
								<input name="hysyywNwbjkZzgl.lxr" id="lxr" type="text" value="${hysyywNwbjkZzgl.lxr }" style="width:200px;" />
								</td>
							</tr>
							<tr id="zzTr9">
								<td  style="background-color:#f5f8fa;">电话：</td>
								<td>
									<input name="hysyywNwbjkZzgl.dh" id="dh" type="text" value="${hysyywNwbjkZzgl.dh }" style="width:200px;" />
								</td>
								<td  style="background-color:#f5f8fa;">E-mail：</td>
								<td>
								<input name="hysyywNwbjkZzgl.e_mail" id="e_mail" type="text" value="${hysyywNwbjkZzgl.e_mail }" style="width:200px;" />
								</td>
							</tr>
							<!-- 测绘资质证书 -->
							<tr id="zzTr10" style="display:none;">
								<td  style="background-color:#f5f8fa;">注册地址：</td>
								<td colspan="3">
									<input name="hysyywNwbjkZzgl.zcdz" id="zcdz" type="text" value="${hysyywNwbjkZzgl.zcdz }" style="width:500px;" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr id="zzTr11" style="display:none;">
								<td  style="background-color:#f5f8fa;">专业范围：</td>
								<td colspan="3">
									<textarea name="hysyywNwbjkZzgl.zyfw" id="zyfw" rows="3" cols="80" >${hysyywNwbjkZzgl.zyfw }</textarea>
									<font color="red">*</font>
								</td>
							</tr>
							<tr id="zzTr12" style="display:none;">
								<td  style="background-color:#f5f8fa;">测绘资料发出负责人：</td>
								<td colspan="3">
									<input name="hysyywNwbjkZzgl.chzlfcfzr" id="chzlfcfzr" type="text" value="${hysyywNwbjkZzgl.chzlfcfzr }" />
									<font color="red">*</font>
								</td>
							</tr>
							
							<!-- 海籍调查信息 -->
							
							<tr id="zzTr15" style="display:none;">
								<td  style="background-color:#f5f8fa;">测绘负责人：</td>
								<td>
									<input name="hysyywNwbjkZzgl.chfzr" id="chfzr" type="text"  value="${hysyywNwbjkZzgl.chfzr }" style="width:200px;" />
									<font color="red">*</font>
								</td>
								<td  style="background-color:#f5f8fa;">测绘单位：</td>
								<td>
									<input name="hysyywNwbjkZzgl.chdw" id="chdw" type="text" value="${hysyywNwbjkZzgl.chdw }" style="width:200px;" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr id="zzTr16" style="display:none;">
								<td  style="background-color:#f5f8fa;">测绘日期：</td>
								<td>
									<input name="hysyywNwbjkZzgl.chrq" id="chrq" type="text" onclick="WdatePicker()" readonly="readonly" value="${hysyywNwbjkZzgl.chrq }" style="width:200px;" />
									<font color="red">*</font>
								</td>
								<td  style="background-color:#f5f8fa;">测绘点数：</td>
								<td>
									<input name="hysyywNwbjkZzgl.chds" id="chds" type="text" value="${hysyywNwbjkZzgl.chds }" class="NumText" style="width:200px;" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr id="zzTr17" style="display:none;">
								<td  style="background-color:#f5f8fa;">投影：</td>
								<td>
									<select name="hysyywNwbjkZzgl.ty" id="ty" style="width:200px;">
										<option value="">-请选择-</option>
									</select><font color="red">*</font>
									<input name="tyY" id="tyY" type="hidden" value="${hysyywNwbjkZzgl.ty }"/>
								</td>
								<td  style="background-color:#f5f8fa;">概略比例尺：</td>
								<td>
									<input name="hysyywNwbjkZzgl.glblc" id="glblc" type="text" value="${hysyywNwbjkZzgl.glblc }" style="width:200px;" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr id="zzTr18" style="display:none;">
								<td  style="background-color:#f5f8fa;">坐标系名称：</td>
								<td colspan="3">
									<select name="hysyywNwbjkZzgl.zbxmc" id="zbxmc" style="width:200px;">
										<option value="">-请选择-</option>
									</select><font color="red">*</font>
									<input name="zbxmcY" id="zbxmcY" type="hidden" value="${hysyywNwbjkZzgl.zbxmc }"/>
								</td>
							</tr>
							
							<!-- 论证报告 -->
							<tr id="zzTr19" style="display:none;">
								<td  style="background-color:#f5f8fa;">论证报告名称：</td>
								<td><input name="hysyywNwbjkZzgl.lzbgmc" id="lzbgmc" type="text" value="${hysyywNwbjkZzgl.lzbgmc }" style="width:200px;" />
									<font color="red">*</font>
								</td>
								<td  style="background-color:#f5f8fa;">论证单位：</td>
								<td><input name="hysyywNwbjkZzgl.lzdw" id="lzdw" type="text" value="${hysyywNwbjkZzgl.lzdw }" style="width:200px;" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr id="zzTr20" style="display:none;">
								<td  style="background-color:#f5f8fa;">资质等级：</td>
								<td>
									<select name="hysyywNwbjkZzgl.zzdj" id="zzdj" style="width:200px;">
										<option value="">-请选择-</option>
									</select><font color="red">*</font>
									<input name="zzdjY" id="zzdjY" type="hidden" value="${hysyywNwbjkZzgl.zzdj }"/>
								</td>
								<td  style="background-color:#f5f8fa;">项目负责人：</td>
								<td><input name="hysyywNwbjkZzgl.xmfzr" id="xmfzr" type="text" value="${hysyywNwbjkZzgl.xmfzr }" style="width:200px;" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr id="zzTr21" style="display:none;">
								<td  style="background-color:#f5f8fa;">组织评审部门：</td>
								<td><input name="hysyywNwbjkZzgl.zzpsbm" id="zzpsbm" type="text" value="${hysyywNwbjkZzgl.zzpsbm }" style="width:200px;" /><font color="red">*</font></td>
								<td  style="background-color:#f5f8fa;">评审专家组组长：</td>
								<td><input name="hysyywNwbjkZzgl.pszjzzz" id="pszjzzz" type="text" value="${hysyywNwbjkZzgl.pszjzzz }" style="width:200px;" /><font color="red">*</font></td>
							</tr>
							<tr id="zzTr22" style="display:none;">
								<td width="20%" style="background-color:#f5f8fa;">评审日期：</td>
								<td width="30%"><input name="hysyywNwbjkZzgl.psrq" id="psrq" type="text" value="${hysyywNwbjkZzgl.psrq }" onclick="WdatePicker()" readonly="readonly" style="width:200px;" /><font color="red">*</font></td>
								<td width="20%" style="background-color:#f5f8fa;">质量评估分：</td>
								<td width="30%"><input name="hysyywNwbjkZzgl.zlpgf" id="zlpgf" type="text" class="NumText" value="${hysyywNwbjkZzgl.zlpgf }" style="width:200px;" /><font color="red">*</font></td>
							</tr>
							
							<tr id="zzTr13">
								<td  style="background-color:#f5f8fa;">附件（图片）：</td>
								<td colspan="3">
									旧图片：${hysyywNwbjkZzgl.fjtpmc }<br />
									新：<input name="upload" type="file" value="" style="width:400px;" />
								</td>
							</tr>
							<tr id="zzTr14">
								<td  style="background-color:#f5f8fa;">附件（文件）：</td>
								<td colspan="3">
									旧文件：${hysyywNwbjkZzgl.fjwj }<br />
									新：<input name="uploadSjwj" type="file" value="" style="width:400px;" />
								</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align:center;">
								<input name="save" type="button" class="scbtn" onclick="saveYhxm()" value="保存" />
								<input name="back" type="button" class="scbtn" onclick="goBack()" value="返回" />
								<input name="hysyywNwbjkZzgl.id" id="hysyywNwbjkZzgl.id" value="${hysyywNwbjkZzgl.id }" type="hidden" />
								<input name="hysyywNwbjkZzgl.addtime" id="hysyywNwbjkZzgl.addtime" value="${hysyywNwbjkZzgl.addtime }" type="hidden" />
								<input name="hysyywNwbjkZzgl.addusername" id="hysyywNwbjkZzgl.addusername" value="${hysyywNwbjkZzgl.addusername }" type="hidden" />
								<input name="hysyywNwbjkZzgl.adduserid" id="hysyywNwbjkZzgl.adduserid" value="${hysyywNwbjkZzgl.adduserid }" type="hidden" />
								<input name="hysyywNwbjkZzgl.fjtp" id="hysyywNwbjkZzgl.fjtp" value="${hysyywNwbjkZzgl.fjtp }" type="hidden" />
								<input name="hysyywNwbjkZzgl.fjtpmc" id="hysyywNwbjkZzgl.fjtpmc" value="${hysyywNwbjkZzgl.fjtpmc }" type="hidden" />
								<input name="hysyywNwbjkZzgl.fjwj" id="hysyywNwbjkZzgl.fjwj" value="${hysyywNwbjkZzgl.fjwj }" type="hidden" />
								
								
								</td>
							</tr>
					</table>
			</div>
		</div>
	</div>


		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');

			if(document.getElementById("zzlxY").value ==""){
				document.getElementById("zzlx").value ="";
			}else{
				document.getElementById("zzlx").value =document.getElementById("zzlxY").value;
			}

			
		</script>

</form>
</body>
</html>