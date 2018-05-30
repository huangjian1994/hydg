<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>辅助划分新增页面</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />


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

            function saveFzhf() {
                //校验
                if(document.getElementById("gnqhmc").value ==""){
                    alert("功能区名称不允许为空！");
                    return false;
                }else{
                    //分割gnqhmc
                    var gnqhmc=document.getElementById("gnqhmc").value;
                    var strarray = new Array();
                    strarray = gnqhmc.split(",");
                    document.getElementById("hysyywHygnqhFzhf.gnqhmc").value=strarray[1];
                    document.getElementById("hysyywHygnqhFzhf.gnqhid").value=strarray[0];

                }
                if($("#fzhfmc").val() ==""){
                    alert("辅助划分名称不能为空！");
                    return false;
                }
                if($("#bz").val() ==""){
                    alert("编制不能为空！");
                    return false;
                }
                if($("#sfyxjlss").val() ==""){
                    alert("是否允许建立设施不能为空！");
                    return false;
                }
                if($("#sfyxryzy").val() ==""){
                    alert("是否允许人员作业不能为空！");
                    return false;
                }
                if($("#ghthmj").val() ==""){
                    alert("规划填海面积不能为空！");
                    return false;
                }
                if($("#ghyhmj").val() ==""){
                    alert("规划用海面积不能为空！");
                    return false;
                }

                document.myForm.action="<%=basePath%>/zon/zon_addFzhf.do";
                document.myForm.target="_self";
                document.myForm.submit();
            }
            function goBack(){
                document.myForm.action="<%=basePath%>/zon/zon_fetchFzhf.do";
                document.myForm.target="_self";
                document.myForm.submit();
            }

		</script>
	</head>

	<body>
    <form name="myForm" method="post" >

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海洋功能区划管理</a></li>
				<li><a href="#">辅助划分</a></li>
				<li><a href="#">新增</a></li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo" >
				<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />新增</div>
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
                <tr>
                    <th colspan="4">辅助区划信息</th>
                </tr>
				<tr>
                    <td style="background-color:#f5f8fa;">选择要辅助划分的功能区名称：</td>
					<td colspan="3">
						<select name="gnqhmc" id="gnqhmc" style="width:250px;height:25px;">
                            <option value="">-请选择-</option>
						</select>
                        <font color="red">*</font>
                        <input name="xmID" id="xmID" type="hidden" value="" />
                        <input name="hysyywHygnqhFzhf.gnqhmc" id="hysyywHygnqhFzhf.gnqhmc" type="hidden" value="" />
                        <input name="hysyywHygnqhFzhf.gnqhid" id="hysyywHygnqhFzhf.gnqhid" type="hidden" value="" />
					</td>
				</tr>

				<tr>
					<td  style="background-color:#f5f8fa;">辅助划分名称：</td>
					<td >
                        <input name="hysyywHygnqhFzhf.fzhfmc" id="fzhfmc" type="text" class="scinput" value="" style="width:250px;height:20px;" />
                        <font color="red">*</font>
                    </td>
					<td style="background-color:#f5f8fa;">编制：</td>
					<td>
						<select name="hysyywHygnqhFzhf.bz" id="bz" style="width:250px;height:25px;">
							<option value="">-请选择-</option>
							<option value="定期">定期</option>
							<option value="不定期">不定期</option>
						</select>
                        <font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">是否允许建立设施：</td>
					<td>
                        <select name="hysyywHygnqhFzhf.sfyxjlss" id="sfyxjlss" style="width:250px;height:25px;">
                            <option value="">-请选择-</option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                        <font color="red">*</font>
					</td>
					<td style="background-color:#f5f8fa;">设施包括：</td>
					<td><textarea name="hysyywHygnqhFzhf.ssnr" id="hysyywHygnqhFzhf.ssnr" style="width:250px;height:40px; overflow:auto;" /></textarea>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">是否允许人员作业：</td>
					<td>
                        <select name="hysyywHygnqhFzhf.sfyxryzy" id="sfyxryzy" style="width:250px;height:25px;">
                            <option value="">-请选择-</option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                        <font color="red">*</font>
					</td>
					<td style="background-color:#f5f8fa;">作业内容：</td>
					<td><textarea name="hysyywHygnqhFzhf.zynr" id="hysyywHygnqhFzhf.zynr" style="width:250px;height:40px; overflow:auto;" /></textarea>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">规划填海面积：</td>
					<td><input name="hysyywHygnqhFzhf.ghthmj" id="ghthmj" style="width:250px;height:20px; overflow:auto;" ></input>公顷
						<font color="red">*</font>
					</td>
					<td style="background-color:#f5f8fa;">规划用海面积：</td>
					<td><input name="hysyywHygnqhFzhf.ghyhmj" id="ghyhmj" style="width:250px;height:20px; overflow:auto;" ></input>公顷
						<font color="red">*</font>
					</td>
				</tr>
                <tr>
                    <td style="background-color:#f5f8fa;">规划简介：</td>
                    <td><textarea name="hysyywHygnqhFzhf.ghjj" id="hysyywHygnqhFzhf.ghjj" style="width:250px;height:40px; overflow:auto;" /></textarea>
                    </td>
                    <td style="background-color:#f5f8fa;">规划用海功能定位：</td>
                    <td><textarea name="hysyywHygnqhFzhf.ghyhgndw" id="hysyywHygnqhFzhf.ghyhgndw" style="width:250px;height:40px; overflow:auto;" /></textarea>
                    </td>
                </tr>

                <tr>
                    <td style="background-color:#f5f8fa;">规划类型：</td>
                    <td><textarea name="hysyywHygnqhFzhf.ghlx" id="hysyywHygnqhFzhf.ghlx" style="width:250px;height:40px; overflow:auto;" ></textarea>
                    </td>
                    <td style="background-color:#f5f8fa;">规划期限：</td>
                    <td><textarea name="hysyywHygnqhFzhf.ghqx" id="hysyywHygnqhFzhf.ghqx" style="width:250px;height:40px; overflow:auto;" ></textarea>
                    </td>
                </tr>
				<tr>
					<td style="background-color:#f5f8fa;">禁止项：</td>
					<td><textarea name="hysyywHygnqhFzhf.jzx" id="hysyywHygnqhFzhf.jzx" style="width:250px;height:40px; overflow:auto;" ></textarea>
					</td>
					<td style="background-color:#f5f8fa;">适宜项：</td>
					<td><textarea name="hysyywHygnqhFzhf.syx" id="hysyywHygnqhFzhf.syx" style="width:250px;height:40px; overflow:auto;" ></textarea>
					</td>
				</tr>

				<tr>
					<td style="background-color:#f5f8fa;">不适宜项：</td>
					<td><textarea name="hysyywHygnqhFzhf.bsyx" id="hysyywHygnqhFzhf.bsyx" style="width:250px;height:40px; overflow:auto;" ></textarea>
					</td>
					<td style="background-color:#f5f8fa;">描述：</td>
					<td><textarea name="hysyywHygnqhFzhf.ms" id="hysyywHygnqhFzhf.ms" style="width:250px;height:40px; overflow:auto;" ></textarea>
					</td>
				</tr>

				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" name="btn" onclick="saveFzhf()" value="保存">
						<input name="fh" type="button" value="返回" class="scbtn1" onclick="goBack()" />
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