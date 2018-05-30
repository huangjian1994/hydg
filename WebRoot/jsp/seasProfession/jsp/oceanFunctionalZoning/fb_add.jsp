<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>辅助划分新增</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>

	<script type="text/javascript">
        $(document).ready(function(){
            getMc();
        });
        //获取功能区划名称和ID
        function getMc() {
            $.ajax({
                type:"post",
                dataType:"json",
                url:"${contextPath}/zon/zon_fetchGnqhMc.do",
                success: function(d){
                    for(var i=0;i<d.length;i++){
                        // alert(d);
                        $("<option value= '"+d[i][0]+","+d[i][1]+"'>"+d[i][1]+"</option>").appendTo("#gnqhmc");
                    }
                }
            });
        }

        //新增
		function addFb() {
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
            document.myForm.action="<%=basePath%>/zon/zon_addFb.do";
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

	<body>
	 <form id="myForm" name="myForm" method="post">
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海洋功能区划管理</a></li>
				<li><a href="#">海洋功能区划发布</a></li>
				<li><a href="#">新增</a></li>
			</ul>
		</div>
		<div class="formbody">
		<div class="leftinfo1">
		<div class="listtitle">
				<img src="${contextPath}/images/ico02.png" width="20" height="20" />新增</div>
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td style="background-color:#f5f8fa;">标题：</td>
					<td colspan="3">
						<input name="hygnqhFb.bt" id="bt" type="text" class="scinput" value="" style="width:783px;height:20px;" />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">正文：</td>
					<td colspan="3"><textarea name="hygnqhFb.zw" id="zw" style="width:783px;height:40px;"></textarea>
						<font color="red">*</font>
					</td>

				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">功能区划名称：</td>
					<td>
                        <select name="gnqhmc" id="gnqhmc" style="width:250px;height:25px;">
                           <option value="">-请选择-</option>
                        </select>
                        <font color="red">*</font>
                        <input name="hygnqhFb.gnqhmc" id="hygnqhFb.gnqhmc" type="hidden" value="" />
                        <input name="hygnqhFb.gnqhid" id="hygnqhFb.gnqhid" type="hidden" value="" />
					</td>
					<td style="background-color:#f5f8fa;">发布单位：</td>
					<td><input name="hygnqhFb.fbdw" id="fbdw" type="text" class="scinput" value="" style="width:250px;height:20px;" />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">发布人：</td>
					<td><input name="hygnqhFb.fbr" id="fbr" type="text" class="scinput" value="" style="width:250px;height:20px;" />
						<font color="red">*</font>
					</td>
					<td style="background-color:#f5f8fa;">发布日期：</td>
					<td>
                        <%--<input name="hygnqhFb.fbsj" id="fbsj" type="text" class="scinput" value="" style="width:180px;height:20px;" />--%>
                        <input name="hygnqhFb.fbsj" id="fbsj"
                               type="text" onclick="WdatePicker()" readonly="readonly" value="" style="width:250px;" />
						<font color="red">*</font>
					</td>
				</tr>

				<tr>
					<td style="background-color:#f5f8fa;">备注：</td>
					<td colspan="3">
					<textarea name="hygnqhFb.bz" id="bz" type="text" class="scinput" value="" style="width:783px;height:40px;" ></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input name="btn" type="button" class="scbtn1"  onclick="addFb()" value="保存" />
						<input name="fh" type="button"  class="scbtn1" onclick="goBack()" value="返回" />
					</td>
				</tr>
			</table>
			</div>
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
     </form>
	</body>

</html>