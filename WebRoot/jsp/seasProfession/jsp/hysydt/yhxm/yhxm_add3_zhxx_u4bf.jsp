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
	//var yhfs_ej=document.getElementById("yhfsY").value;
	//getDictionary("用海方式","yhfs_ej","");

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

	//显示上传窗口
	function goAddXz(){
		document.getElementById("leftinfoDiv1").style.display="";
	}
	//隐藏窗口
	function noOpen(){
		document.getElementById("leftinfoDiv1").style.display="none";
	}

//保存
function addZht(){
	var filename1=document.myForm.upload.value;
	var hz1=filename1.substring(filename1.length-4,filename1.length);
	if(filename1==""){
		alert("请先上传宗海位置图！");
		return false;
	}
	//alert(hz1);
	if (hz1!=".jpg" && hz1!=".png" && hz1!=".JPG" && hz1!=".PNG" && hz1!=".gif"){
		alert("宗海位置图请上传jpg或png格式的图片！！"); 				
	    return false; 
	}
	var filename2=document.myForm.uploadJzt.value;
	var hz2=filename2.substring(filename2.length-4,filename2.length);
	if(filename2==""){
		alert("请先上传宗海界址图！");
		return false;
	}
	if (hz2!=".jpg" && hz2!=".png" && hz2!=".JPG" && hz2=".PNG" && hz2!=".gif"){
		alert("宗海界址图请上传jpg或png格式的图片！！"); 				
	    return false; 
	}
	document.myForm.action="<%=basePath%>/business/business_saveZht.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//修改
function updateZht(){
	document.myForm.action="<%=basePath%>/business/business_updateHysyj.do";
	document.myForm.target="_self";
	document.myForm.submit();
}
//删除
function deleteZht(zhtID){
	if(confirm("确定删除该记录吗？")){
		document.getElementById("zhtID").value = zhtID;
		document.myForm.action="<%=basePath%>/business/business_deleteZht.do";
		document.myForm.target="_self";
		document.myForm.submit();
	}
}



</script>
</head>
<body>
<form name="myForm" method="post" enctype="multipart/form-data">
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="leftinfo1">
				<div class="itab">
					<ul>
						<li><a href="###" onclick="goZsxxAdd1()">证书信息</a></li>
						<li><a href="###" onclick="goZsxxAdd2()" >用海方式</a></li>
						<li><a href="javaScript:goZsxxAdd3()" >海域使用金</a></li>
						<li><a href="###" onclick="goZsxxAdd4()" class="selected">宗海图</a></li>
						<li><a href="###" onclick="goZsxxAdd5()">申请材料</a></li>
						<li><a href="###" onclick="goZsxxAdd6()">地图定位</a></li>
					</ul>
				</div>
				
			<div id="tab9" class="tabson" >
			<input name="xmID" id="xmID" value="${xmID }" type="hidden" />
			<input name="zsID" id="zsID" value="${zsID }" type="hidden" />
			<input name="zhtID" id="zhtID" value="" type="hidden" />
			
			
			<div class="tools">
				<ul class="toolbar">
					<li>
						<a href="javaScript:goAddXz()" >
						<span><img src="${contextPath}/images/t01.png" /></span>新增</a>
					</li>
					<!-- 
					<li><a href="xg.jsp"><span><img src="${contextPath}/images/t02.png" /></span>修改</a></li>
					<li><a href="javascript:deleteZdclCljd();"><span><img src="${contextPath}/images/t03.png" /></span>删除</a></li>
					 -->
				</ul>
			</div>
			<table width="100%" class="tablelist" style="text-align:center;">
				<tr>
					<th width="5%">序号</th>
					<th width="25%">宗海位置图</th>
					<th width="25%">界址图</th>
					<th width="10%">新增人</th>
					<th width="15%">新增时间</th>
					<th width="10%">操作</th>
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
					<td>
						<!-- 
						<a href="###" onclick="getZht('${r.id }')" class="tablelink">修改</a>
						 -->
						<a href="###" onclick="deleteZht('${r.id }')" class="tablelink">删除</a>
					</td>
				</tr>
				</c:forEach>
			</table><br />
			
			
				<div class="leftinfo" id="leftinfoDiv1" style="display:;">
					<div class="listtitle"><img src="${contextPath}/images/ico04.png" width="20" height="20" />上传宗海图</div>
					<table class="tableXQ" width="100%">
						<tr>
							<td width="20%" style="background-color:#f5f8fa;">上传宗海位置图：</td>
							<td width="60%">
								<input name="upload" type="file" value="" style="width:400px;" />
								<font color="red">*</font>
							</td>
						</tr>
						<tr>
							<td style="background-color:#f5f8fa;">上传宗海界址图：</td>
							<td>
								<input name="uploadJzt" type="file" value="" style="width:400px;" />
								<font color="red">*</font>
							</td>
						</tr>

						<tr>
							<td colspan="2" style="text-align:center;">
							<input name="bc" type="button" class="scbtn" onclick="addZht()" value="保存" />
							<input name="cz" type="reset" class="scbtn"  value="重置" />
							<input name="qx" type="button" class="scbtn" onclick="noOpen()" value="取消" />
							
							</td>
						</tr>
					</table>
					</div>
				
			</div>
		</div>
		</div>
	</div>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');

			function goZsxxAdd1(){
				document.myForm.action="<%=basePath%>/business/business_getUpdateZhxx.do";
				document.myForm.target="_self";
				document.myForm.submit();
			}

			function goZsxxAdd2(){
				document.myForm.action="<%=basePath%>/business/business_fetchYhfs.do";
				document.myForm.target="_self";
				document.myForm.submit();
			}

			function goZsxxAdd3(){
				document.myForm.action="<%=basePath%>/business/business_fetchHysyj.do";
				document.myForm.target="_self";
				document.myForm.submit();
			}

			function goZsxxAdd4(){
				document.myForm.action="<%=basePath%>/business/business_fetchZhtList.do";
				document.myForm.target="_self";
				document.myForm.submit();
			}

			function goZsxxAdd5(){
				document.myForm.action="<%=basePath%>/business/business_fetchSqclList.do";
				document.myForm.target="_self";
				document.myForm.submit();
			}

			function goZsxxAdd6(){
				document.myForm.action="<%=basePath%>/business/business_goDtdw.do";
				document.myForm.target="_self";
				document.myForm.submit();
			}

			
			
		</script>
		
</form>
</body>
</html>