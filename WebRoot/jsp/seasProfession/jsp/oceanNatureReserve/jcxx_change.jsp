<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<%String redfont = "<font color='red'>*</font>"; %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>保护区信息新增、修改</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>

		<script type="text/javascript">

		</script>
	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海洋自然保护区管理</a>
				</li>
				<c:if test="${hyzrbhqEntity.id == null}">
					<li>
						<a href="javascript:void(0)">新增</a>
					</li>
				</c:if>
				<c:if test="${hyzrbhqEntity.id != null}">
					<li>
						<a href="javascript:void(0)">修改</a>
					</li>
				</c:if>

			</ul>
		</div>

		<div class="formbody">
			<s:form id="oceanForm" name="ocean" namespace="/ocean" method="post" enctype='multipart/form-data'>
				<s:hidden name="hyzrbhqEntity.id"></s:hidden>
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">保护区编号：</td>
					<td>
						<input name="hyzrbhqEntity.bhqbh" id="bhqbh" value="${hyzrbhqEntity.bhqbh}" style="width:250px;height:20px; overflow:auto;" />
						<%=redfont%>
					</td>
					<td style="background-color:#e8edef;">保护区名称：</td>
					<td>
						<input name="hyzrbhqEntity.bhqmc" id="bhqmc" value="${hyzrbhqEntity.bhqmc}" style="width:250px;height:20px; overflow:auto;" />
						<%=redfont%>
					</td>
				<tr>
					<td style="background-color:#e8edef;">行政区域：</td>
					<td>
						<input name="hyzrbhqEntity.xzqh" id="xzqh" value="${hyzrbhqEntity.xzqh}" style="width:250px;height:20px; overflow:auto;" />
						<%=redfont%>
					</td>
					<td style="background-color:#e8edef;">主管部门：</td>
					<td>
						<input name="hyzrbhqEntity.zgbm" id="zgbm" value="${hyzrbhqEntity.zgbm}" style="width:250px;height:20px; overflow:auto;" />
						<%=redfont%>
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">分类名称：</td>
					<td>
						<input name="hyzrbhqEntity.fl" id="fl" value="${hyzrbhqEntity.fl}" style="width:250px;height:20px; overflow:auto;" />
						<%=redfont%>
					</td>
					<td style="background-color:#e8edef;">级别名称：</td>
					<td>
						<input name="hyzrbhqEntity.jb" id="jb" value="${hyzrbhqEntity.jb}" style="width:250px;height:20px; overflow:auto;" />
						<%=redfont%>
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">总面积(可精确到小数点后3位)：</td>
					<td>
						<input name="hyzrbhqEntity.zmj" id="zmj" value="${hyzrbhqEntity.zmj}" style="width:250px;height:20px; overflow:auto;" />
						<%=redfont%>
					</td>
					<td style="background-color:#e8edef;">始建/批建时间：</td>
					<td>

						<input name="hyzrbhqEntity.pjsj" id="pjsj" value="${hyzrbhqEntity.pjsj}"
							   onclick="WdatePicker()" readonly="readonly" style="width:250px; overflow:auto;" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">重点保护对象：</td>
					<td>
					<s:textarea id="zdbhdx" name="hyzrbhqEntity.zdbhdx" cssClass="scinput" cssStyle="width: 250px;height:80px;"></s:textarea>

					</td>
					<td style="background-color:#e8edef;">相关设施情况：</td>
					<td>
						<s:textarea id="xgssqk" name="hyzrbhqEntity.xgssqk" cssClass="scinput" cssStyle="width: 250px;height:80px;"></s:textarea>
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">区域点经纬度：</td>
					<td colspan="6">
						<s:textarea id="geo" name="hyzrbhqEntity.geo" cssClass="scinput" cssStyle="width: 100%;height: 150px;"></s:textarea>
					</td>
				</tr>

				<tr id="add">
					<td style="background-color:#f5f8fa;">新增人：</td>
					<td>
						<input name="hyzrbhqEntity.cjr" id="cjr"  value="${hyzrbhqEntity.cjr}" type="text" style="width:250px;height:30px; overflow:auto;" />
					</td>
					<td style="background-color:#f5f8fa;">新增时间：</td>
					<td>
						<input name="hyzrbhqEntity.cjsj" id="cjsj"  value="${hyzrbhqEntity.cjsj}" type="sjsj" style="width:250px;height:30px; overflow:auto;" />
					</td>
				</tr>
				<tr id="update">
					<td style="background-color:#f5f8fa;">修改人：</td>
					<td>
						<input name="hyzrbhqEntity.xgr" id="xgr" value="${hyzrbhqEntity.xgr}" type="text" style="width:250px;height:30px; overflow:auto;" />
					</td>
					<td style="background-color:#f5f8fa;">修改时间：</td>
					<td>
						<input name="hyzrbhqEntity.xgsj" id="xgsj"  value="${hyzrbhqEntity.xgsj}" type="text" style="width:250px;height:30px; overflow:auto;" />
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<c:if test="${'0'!= operate}">
							<s:submit cssClass="scbtn1" value="保存"></s:submit>
						</c:if>
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='${contextPath}/ocean/ocean_fetchZrbhq.do'" />
					</td>
				</tr>
			</table>
		</div>

		</s:form>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');

            var id = '${hyzrbhqEntity.id}';
            var operate = "${operate}";
            $(function(){
                //operate 0:查看详情
                if ( "0" == operate ) {
                    $(":input").attr("readonly","readonly");
                    $("#zdbhdx").attr("readonly","readonly");
                    $("#xgssqk").attr("readonly","readonly");
                    $("#geo").attr("readonly","readonly");
                    $("").attr("disabled","");
                } else {
                    $("#add,#update").hide();
                    if ( id == '' ) {
                        $("#oceanForm").attr("action","${contextPath}/ocean/ocean_addBhq.do");
                    } else {
                        $("#oceanForm").attr("action","${contextPath}/ocean/ocean_updateBhq.do");
                    }
                    $("#oceanForm").submit(function(){
                        return dataCheck();
//                    return false;
                    })
                }
            })

            function dataCheck(){
                var bhqbh = $("#bhqbh").val();
                var bhqmc = $("#bhqmc").val();
                var xzqh = $("#xzqh").val();
                var zgbm = $("#zgbm").val();
                var fl = $("#fl").val();
                var jb = $("#jb").val();
                var zmj = $("#zmj").val();


                if ( bhqbh == "" ) {
                    alert("保护区编号不可为空！");
                    return false;
                }
                if ( bhqmc == "" ) {
                    alert("保护区名称不可为空！");
                    return false;
                }
                if ( xzqh == "" ) {
                    alert("行政区域不可为空！");
                    return false;
                }
                if ( zgbm == "" ) {
                    alert("主管部门不可为空！");
                    return false;
                }if ( fl == "" ) {
                    alert("分类名称不可为空！");
                    return false;
                }if ( zmj == "" ) {
                    alert("总面积不可为空！");
                    return false;
                }
                if ( zmj != "" ) {
                    var reg = /^[0-9]+(.[0-9]{1,3})?$/;
                    if ( !reg.test(zmj) ) {
                        alert("面积必须为数字！");
                        return false;
                    }
                }
            }
		</script>

		</div>

	</body>

</html>