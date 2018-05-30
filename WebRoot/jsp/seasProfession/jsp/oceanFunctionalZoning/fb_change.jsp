<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>发布修改页面</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript">
        $(document).ready(function(){
            var gnqhmcY= $("#gnqhmcY").val();
            getMc(gnqhmcY);
        });
        //获取功能区划名称和ID
        function getMc(historyZ) {
            $.ajax({
                type:"post",
                dataType:"json",
                url:"${contextPath}/zon/zon_fetchGnqhMc.do",
                success: function(d){
                    for(var i=0;i<d.length;i++) {
                        if (d[i][1] == historyZ) {
                            $("<option value= '" + d[i][0] + "," + d[i][1] + "' selected>" + d[i][1] + "</option>").appendTo("#gnqhmc");
                        }else {
							$("<option value= '" + d[i][0] + "," + d[i][1] + "'>" + d[i][1] + "</option>").appendTo("#gnqhmc");
						}
                    }
                }
            });
        }

        //保存
       function updateFb() {
           if($("#bt").val() ==""){
               alert("标题不能为空！");
               return false;
           }
           if($("#zw").val() ==""){
               alert("正文不能为空！");
               return false;
           }
           //校验
           if(document.getElementById("gnqhmc").value ==""){
               alert("功能区名称不允许为空！");
               return false;
           }else{
               //分割gnqhmc
               var gnqhmc=document.getElementById("gnqhmc").value;
               var strarray = new Array();
               strarray = gnqhmc.split(",");
               document.getElementById("hygnqhFb.gnqhmc").value=strarray[1];
               document.getElementById("hygnqhFb.gnqhid").value=strarray[0];
           }
           if($("#fbr").val() ==""){
               alert("发布人不能为空！");
               return false;
           }
           if($("#fbsj").val() ==""){
               alert("发布时间不能为空！");
               return false;
           }
           if($("#fbdw").val() ==""){
               alert("发布单位不能为空！");
               return false;
           }
           document.myForm.action="<%=basePath%>/zon/zon_updateFb.do";
           document.myForm.target="_self";
           document.myForm.submit();
       }
        //返回
        function goBack() {
            document.myForm.action="<%=basePath%>/zon/zon_gobackFb.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }
	</script>
	</head>

	<body>
		<form id="myForm" name="myForm" method="post">
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海洋功能区划管理</a></li>
				<li><a href="#">海洋功能区划发布</a></li>
				<li><a href="#">修改</a></li>
			</ul>
		</div>
        <div class="formbody">
			<div class="leftinfo1">
       	 		<div class="listtitle">
				<img src="${contextPath}/images/ico02.png" width="20" height="20" />修改</div>
            <table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td style="background-color:#f5f8fa;">标题：</td>
					<td><input name="hygnqhFb.bt" id="bt" type="text" class="scinput" value="${hygnqhFb.bt}" style="width:783px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">正文：</td>
					<td><textarea name="hygnqhFb.zw" id="zw" style="width:783px;height:40px;">${hygnqhFb.zw}</textarea></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">功能区划名称：</td>
					<td><select name="gnqhmc" id="gnqhmc" style="width:250px;height:25px;">
						<option value="">-请选择-</option>
					</select>
						<font color="red">*</font>
						<input name="hygnqhFb.gnqhmc" id="hygnqhFb.gnqhmc" type="hidden" value="" />
						<input name="hygnqhFb.gnqhid" id="hygnqhFb.gnqhid" type="hidden" value="" />
						<input name="gnqhmcY" id="gnqhmcY" type="hidden" value="${hygnqhFb.gnqhmc }" style="width:200px;" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">发布单位：</td>
					<td><input name="hygnqhFb.fbdw" id="fbdw" type="text" class="scinput" value="${hygnqhFb.fbdw}" style="width:250px;height:20px;" />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">发布人：</td>
					<td><input name="hygnqhFb.fbr" id="fbr" type="text"   class="scinput" value="${hygnqhFb.fbr}" style="width:250px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">发布日期：</td>
					<td>
						<input name="hygnqhFb.fbsj" type="text" onclick="WdatePicker()" class="scinput" value="${hygnqhFb.fbsj}" style="width:250px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">修改人：</td>
					<td><input name="hygnqhFb.updateusername" id="updateusername" readonly="readonly" type="text" class="scinput" value="${hygnqhFb.fbr}" style="width:250px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">修改日期：</td>
					<td>
						<input name="hygnqhFb.lastupdatetime" id="lastupdatetime" readonly="readonly" type="text" class="scinput" value="${hygnqhFb.lastupdatetime}" style="width:250px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">备注：</td>
					<td><input name="hygnqhFb.bz" id="bz"  type="text" class="scinput" value="${hygnqhFb.bz}" style="width:250px;height:20px;" /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="updateFb()" value="保存" />
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack()" />
					</td>
				</tr>
               
			</table>
			<input name="xmID" id="xmID" value="${xmID }" type="hidden" />
            <input name="hygnqhFb.id" id="hygnqhFb.id" value="${hygnqhFb.id }" type="hidden" />
		</div>
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
		</form>
	</body>
</html>