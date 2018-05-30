<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	//代码
	$(document).ready(function(){
		//var ztY=document.getElementById("ztY").value;
		
		getDictionary("行政区划","xzqhY","");

		$(".NumText").keyup(function(){    
            $(this).val($(this).val().replace(/\D|^0/g,''));
        }).bind("paste",function(){  //CTR+V事件处理    
            $(this).val($(this).val().replace(/\D|^0/g,''));     
        }).css("ime-mode", "disabled"); //CSS设置输入法不可用

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
						$("<option value= '"+d[i].dm+","+d[i].value+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
					}
					}
			}
		});	  
	}
	//返回
	function goBack(){
		document.myForm.action="<%=basePath%>/patorl/patorl_fetchXckhRykh.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
	
	</script>
	</head>

	<body>
<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li><a href="#">巡查考评管理</a></li>
				<li><a href="#">巡查人员考核评价管理</a></li>
			</ul>
		</div>
		
		<div class="formbody">
			<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />详情</div>
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td style="background-color:#f5f8fa;">巡查类型：</td>
					<td colspan="3">${hyxcXckpRykh.xclx }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">巡查人姓名：</td>
					<td colspan="3">${hyxcXckpRykh.xm }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">行政区划：</td>
					<td>${hyxcXckpRykh.xzqhmc }</td>
					<td style="background-color:#f5f8fa;">单位名称：</td>
					<td>${hyxcXckpRykh.dwmc}</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">年份：</td>
					<td>${hyxcXckpRykh.year }</td>
					<td style="background-color:#f5f8fa;">月份：</td>
					<td>${hyxcXckpRykh.month }</td>
				</tr>
				<tr>
					<td width="20%" style="background-color:#f5f8fa;">评分部门：</td>
					<td width="30%">${hyxcXckpRykh.dfbm }</td>
					<td width="20%" style="background-color:#f5f8fa;">评分 人：</td>
					<td width="30%">${hyxcXckpRykh.dfr }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">评分日期：</td>
					<td colspan="3">${hyxcXckpRykh.dfrq }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">备注：</td>
					<td colspan="3">${hyxcXckpRykh.bz }</td>
				</tr>
				<tr>
					<th colspan="4">考核评分</th>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">1.巡查办理数：</td>
					<td colspan="3">${hyxcXckpRykh.xcbls }</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">2.重要性：</td>
					<td colspan="3">
						重要：${hyxcXckpRykh.zyx_zy }&nbsp;&nbsp;&nbsp;&nbsp;
						一般：${hyxcXckpRykh.zyx_yb }&nbsp;&nbsp;&nbsp;&nbsp;
						不重要：${hyxcXckpRykh.zyx_b }
					</td>
				</tr>

				<tr>
					<td style="background-color:#f5f8fa;">3.响应时间：</td>
					<td colspan="3">
						快速：${hyxcXckpRykh.xysj_ks }&nbsp;&nbsp;&nbsp;&nbsp;
						一般：${hyxcXckpRykh.xysj_yb }&nbsp;&nbsp;&nbsp;&nbsp;
						不及时：${hyxcXckpRykh.xysj_b }
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">总分：</td>
					<td colspan="3">${hyxcXckpRykh.zf }</td>
				</tr>
				
				<tr>
					<td style="background-color:#f5f8fa;">新增用户姓名：</td>
					<td colspan="3">${hyxcXckpRykh.addusername }</td>
				</tr>
				<tr>
					<td  style="background-color:#f5f8fa;">新增时间：</td>
					<td>${hyxcXckpRykh.addtime }</td>
					<td  style="background-color:#f5f8fa;">最后修改时间：</td>
					<td>${hyxcXckpRykh.lastupdatetime }</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input name="fh" type="button" value="返回" class="scbtn" onclick="goBack()" />
					</td>
				</tr>
			</table>
			</div>
		</div>

		<script type="text/javascript">

			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

</form>
	</body>

</html>