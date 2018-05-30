<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
            var yjlmcY=document.getElementById("yjlmcY").value;
            var ejlmcY=document.getElementById("ejlmcY").value;
            var xzqy1=document.getElementById("xzqy1").value;

            getDictionary("功能区划分级","yjlmc",yjlmcY);
            getDictionary("功能区划二级","ejlmc",ejlmcY);
            getDictionary("项目位置","xzqy",xzqy1);

        });
        //字典表查询
        function getDictionary(keyZ,selectID,historyZ){
            $.ajax({
                type: "post",
                dataType:"json",
                url: "${contextPath}/business/business_fetchDictionary.do",
                data: "dictionary.key="+keyZ,
                success: function(d){
                    for(var i=0;i<d.length;i++){
                        //alert(d[i].dm);
                        if(d[i].dm==historyZ){
                            $("<option value= '"+d[i].dm+"' selected>"+d[i].value+"</option>").appendTo("#"+selectID);
                        }else{
                            $("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
                        }
                    }
                }
            });
        }
        function goBack(){
            document.myForm.action="<%=basePath%>/zon/zon_fetchGnqhBack.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }

        //保存-修改
        function saveGnqh(){
            if(document.getElementById("yjlmc").value ==""){
                alert("一级类名称不允许为空！");
                return false;
            }
            if(document.getElementById("ejlmc").value ==""){
                alert("二级类名称不允许为空!");
                return false;
            }
            if(document.getElementById("hygnqhXxgl.gnqhmc").value ==""){
                alert("功能区划面名称不允许为空！");
                return false;
            }
            if($("#xzqy").val()==""){
                alert("行政区域不允许为空！");
                return false;
            }
            if($("#ghyhmj").val() ==""){
                alert("规划面积不允许为空！");
                return false;
            }
            if($("#axcd").val() ==""){
                alert("岸线长度不允许为空！");
                return false;
            }
            if($("#szd").val() ==""){
                alert("所在地不允许为空！");
                return false;
            }

            document.myForm.action="<%=basePath%>/zon/zon_updateGnqh.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }

        //新建/修改
        function addJzd(){
            console.log(jzdTable);
            var row_index1 =jzdTable.rows.length-1;
            var new_row=jzdTable.insertRow(jzdTable.rows.length-1);
            new_row.setAttribute("id", "row"+row_index1);
            var new_col=new_row.insertCell(0);
            new_col.innerHTML=row_index1;
            var new_col=new_row.insertCell(1);
            new_col.innerHTML="<input name='jzdXh' id='jzdXh"+row_index1+"' type='text' value='' style='width:200px;' />";

            var new_col=new_row.insertCell(2);
            new_col.innerHTML="<input name='jzdJd' id='jzdJd"+row_index1+"' type='text' value='' style='width:200px;'/>";
            var new_col=new_row.insertCell(3);
            new_col.innerHTML="<input name='jzdWd' id='jzdWd"+row_index1+"' type='text' value='' style='width:200px;'/>";
            var new_col=new_row.insertCell(4);
            new_col.innerHTML="<a href='###' onclick=\"deleteRow('row"+row_index1+ "')\" ><img src='${contextPath}/images/close.png' height='15px' /></a>";

        }

        function deleteRow(a){
            o=document.getElementById(a);
            o.parentNode.removeChild(o);
        }
        //删除界址点坐标
        function deleteJzd(jzdID) {
            if (confirm("确定删除该记录吗？")) {
                document.myForm.action = "<%=basePath%>/zon/zon_deleteJdz.do?jzdID=" + jzdID;
                document.myForm.target = "_self";
                document.myForm.submit();
            }
        }
        //保存界址点坐标
        function saveJzd(){
            //校验
            var tab = document.getElementById("jzdTable");
            //表格行数
            var rows = tab.rows.length ;
            var mess = "null";
            for(var i = 1; i <rows-1 ; i++){
                var jzdXhN = "jzdXh"+i;
                var jzdJdN = "jzdJd"+i;
                var jzdWdN = "jzdWd"+i;
                if(document.getElementById(jzdXhN).value == ""){
                    mess = "第"+(i)+"个序号不允许为空。";
                    break;
                }
                if(document.getElementById(jzdJdN).value == ""){
                    mess = "第"+(i)+"个经度不允许为空。";
                    break;
                }
                if(document.getElementById(jzdWdN).value == ""){
                    mess = "第"+(i)+"个纬度不允许为空。";
                    break;
                }
            }
            if(mess != "null"){
                alert(mess);
                return false;
            }

            document.myForm.action="<%=basePath%>/zon/zon_saveJzd.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }

        //下载导入模板
        function downloadYhfsJzdMb(){
            document.myForm.action="<%=basePath%>/zon/zon_downLoadGnqhJzdmb.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }

        //上传文件
        function uploadYhfsJdz(){
            //校验
            var filename=document.myForm.upload.value;
            if(filename==""){
                alert("请先上传文件！");
                return false;
            }
            var hz1=filename.substring(filename.length-4,filename.length);
            if (hz1!=".xls"){
                alert("请上传2003版本的Excel！！");
                return false;
            }
            document.myForm.action="<%=basePath%>/zon/zon_uploadJzdData.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }
	</script>
</head>

<body>
<form name="myForm" method="post" enctype="multipart/form-data" >
	<input name="xmID" id="xmID" value="${xmID }" type="hidden" />
	<div class="place">
		<span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li><a href="#">海洋功能区划管理</a></li>
			<li><a href="#">信息管理</a></li>
			<li><a href="#">修改</a></li>
		</ul>
	</div>

	<div class="formbody">
		<div class="leftinfo" >
			<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />修改</div>
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td style="background-color:#f5f8fa;" width="20%">一级类名称：</td>
					<td width="30%">
						<select name="hygnqhXxgl.yjlmc" id="yjlmc" style="width:180px;">
							<option value="">-请选择-</option>
						</select>
                        <font color="red">*</font>
						<input name="yjlmcY" id="yjlmcY" type="hidden" value="${hygnqhXxgl.yjlmc }" />
					</td>
					<td style="background-color:#f5f8fa;" width="20%">二级类名称：</td>
					<td width="30%">
						<select name="hygnqhXxgl.ejlmc" id="ejlmc" style="width:180px;height:25px;">
							<option value="">-请选择-</option>
						</select>
                        <font color="red">*</font>
						<input name="ejlmcY" id="ejlmcY" type="hidden" value="${hygnqhXxgl.ejlmc }" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">功能区划面名称：</td>
					<td>
                        <input name="hygnqhXxgl.gnqhmc" id="hygnqhXxgl.gnqhmc" type="text" class="scinput" value="${hygnqhXxgl.gnqhmc }" style="width:180px;height:20px;" />
                        <font color="red">*</font>
                    </td>
					<td style="background-color:#f5f8fa;">行政区域：</td>
					<td>
						<select name="hygnqhXxgl.xzqy" id="xzqy" style="width:180px;">
							<option value="">-请选择-</option>
						</select>
						<input name="xzqy1" id="xzqy1" type="hidden" class="scinput" value="${hygnqhXxgl.xzqy }" style="width:180px;height:20px;" />
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">规划面积：</td>
					<td>
						<input name="hygnqhXxgl.ghmj" id="ghmj" type="text" class="scinput" value="${hygnqhXxgl.ghmj }" style="width:180px;height:20px;" />公顷
						<font color="red">*</font>
					</td>

					<td style="background-color:#f5f8fa;">岸线长度：</td>
					<td>
						<input name="hygnqhXxgl.axcd" id="axcd" type="text" class="scinput" value="${hygnqhXxgl.axcd }" style="width:180px;height:20px;" />
						米<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">代码：</td>
					<td>
						<input name="hygnqhXxgl.kzldm" id="kzldm" type="text" class="scinput" value="${hygnqhXxgl.kzldm }" style="width:180px;height:20px;" />
					<td style="background-color:#f5f8fa;">所在地：</td>
					<td><input name="hygnqhXxgl.szd" id="szd" type="text" class="scinput" value="${hygnqhXxgl.szd }" style="width:180px;height:20px;" />
						<font color="red">*</font>
					</td>

				</tr>

				<tr>
					<td style="background-color:#f5f8fa;">地理范围：</td>
					<td colspan="3">
					<textarea name="hygnqhXxgl.dlfwmc" id="dlfwmc" style="width:800px;height:30px; overflow:auto;" >${hygnqhXxgl.dlfwmc }</textarea>
					</td>

				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海域使用管理要求：</td>
					<td colspan="3">
						<textarea name="hygnqhXxgl.syyq" id="syyq" style="width:800px;height:30px; overflow:auto;" >${hygnqhXxgl.syyq }</textarea>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">海洋环境保护要求：</td>
					<td colspan="3">
						<textarea name="hygnqhXxgl.hjbhyq" id="hjbhyq" style="width:800px;height:30px; overflow:auto;" >${hygnqhXxgl.hjbhyq }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">
						<input name="save" type="button" class="scbtn" onclick="saveGnqh()" value="保存" />
						<input name="back" type="button" class="scbtn" onclick="goBack()" value="返回" />

					</td>
				</tr>

			</table>
		</div>

		<div class="formpart">
			<input name="hygnqhXxgl.id" id="hygnqhXxgl.id" value="${hygnqhXxgl.id }" type="hidden" />
			<input name="hygnqhXxgl.addtime" id="hygnqhXxgl.addtime" value="${hygnqhXxgl.addtime }" type="hidden" />
			<input name="hygnqhXxgl.addusername" id="hygnqhXxgl.addusername" value="${hygnqhXxgl.addusername }" type="hidden" />
			<input name="hygnqhXxgl.adduserid" id="hygnqhXxgl.adduserid" value="${hygnqhXxgl.adduserid }" type="hidden" />
		</div>

		<div  class="formpart">

			<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />坐标修改</div>
			<div style="height: auto; border:1px solid #B5BFC4;">

				<table width="99%" id="jzdTable" style="margin:10px;" class="table-left" style="text-align:center;">
					<tr>
						<th>序号</th>
						<th>坐标序号</th>
						<th>经度</th>
						<th>纬度</th>
						<th width="15%">操作
							<a href="###" onclick="addJzd()">
								<img src="${contextPath}/images/t01.png" height="15px" title="新增" />
							</a>
						</th>
					</tr>
					<c:forEach items="${ xxglJzdList }" var="r" varStatus="j">
						<tr>
							<td>${ j.count }</td>
							<td><input name="jzdXh" id="jzdXh${ j.count }" type="text" value="${r.xh }" style="width:200px;" /></td>
							<td><input name="jzdJd" id="jzdJd${ j.count }" type="text" value="${r.jd }" style="width:200px;" /></td>
							<td><input name="jzdWd" id="jzdWd${ j.count }" type="text" value="${r.wd }" style="width:200px;" /></td>
							<td>
								<a href="###" onclick="deleteJzd('${r.id}')">
									<img src="${contextPath}/images/close1.png" height="15px" title="删除"/></a>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${empty xxglJzdList }">
					<tr>
						<td>
							1
						</td>
						<td>
							<input name="jzdXh" id="jzdXh1" type="text" value="" style="width:200px;" />
						</td>
						<td>
							<input name="jzdJd" id="jzdJd1" type="text" value="" style="width:200px;" />
						</td>
						<td>
							<input name="jzdWd" id="jzdWd1" type="text" value="" style="width:200px;" />
						</td>
					</tr>
					</c:if>

					<tr>
						<td colspan="5">
							<input name="bc"  type="button" class="scbtn1" onclick="saveJzd()" value="保存" />
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<input name="upload" id="upload" type="file"  value="" />
							<input name="dr" type="button" class="scbtn1" onclick="uploadYhfsJdz()" value="导入" />
							<input name="mbxz" type="button" class="scbtn1" onclick="downloadYhfsJzdMb()" value="模板下载" />
							<br />
							请先清空上面表格再上传！
						</td>
					</tr>

				</table>
			</div>
			<%--<div class="_right">--%>
				<%--<div class="xsgs">--%>
					<%--<p>显示格1式</p>--%>
					<%--<div class="xsgs_border">--%>
						<%--<label><input type="checkbox" name="check"/>度分秒方式显示</label>--%>
					<%--</div>--%>

				<%--</div>--%>
				<%--<div class="dr">--%>
					<%--<p>导入</p>--%>
					<%--<div class="dr_border">--%>
						<%--<select name="ssbm" id="ssbm" style="width:180px;height:25px;">--%>
							<%--<option value="">-请选择导入坐标串格式-</option>--%>
						<%--</select>--%>
						<%--<p><input type="button" class="scbtn1" name="btn" onclick="window.location='qhgl_xxgl.jsp'" value="粘贴" /></p>--%>

					<%--</div>--%>

				<%--</div>--%>
				<%--<div class="dc">--%>
					<%--<p>导出</p>--%>
					<%--<div class="dc_border">--%>
						<%--<select name="ssbm" id="ssb" style="width:180px;height:25px;">--%>
							<%--<option value="">-请选择导入坐标串格式-</option>--%>
						<%--</select>--%>
						<%--<p><label><input type="radio" name="radio"/>导出当前面坐标</label></p>--%>
						<%--<p><input type="button" class="scbtn1" name="btn" onclick="window.location='qhgl_xxgl.jsp'" value="导出" /></p>--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>
		</div>
	</div>
	<script type="text/javascript">
        $("#usual1 ul").idTabs();
        $('.tablelist tbody tr:odd').addClass('odd');
	</script>

</form>
</body>

</html>