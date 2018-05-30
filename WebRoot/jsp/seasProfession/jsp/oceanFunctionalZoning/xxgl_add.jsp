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
		function checkAll() {
			var cb = document.getElementById("cb");
			var chks = document.getElementsByName("chk");
			if(cb.checked == true) {
				for(var i = 0; i < chks.length; i++) {
					chks[i].checked = true;
				}
			} else {
				for(var i = 0; i < chks.length; i++) {
					chks[i].checked = false;
				}
			}
		}
		<!--使用onchange="jumpMenu()"触发jumpMenu()方法-->
		function jumpMenu(e) {
			window.location.href = e.value;
		}


	</script>
	
	<script type="text/javascript">
        //代码
        $(document).ready(function(){
//            var yjlmcY=document.getElementById("yjlmcY").value;
//            var ejlmcY=document.getElementById("ejlmcY").value;
            getDictionary("功能区划分级","yjlmc");
            getDictionary("功能区划二级","ejlmc");
            getDictionary("项目位置","xzqy");

        });
        //字典表查询
        function getDictionary(keyZ,selectID){
            $.ajax({
                type: "post",
                dataType:"json",
                url: "${contextPath}/business/business_fetchDictionary.do",
                data: "dictionary.key="+keyZ,
                success: function(d){
                    for(var i=0;i<d.length;i++){
                        //alert(d[i].dm);
						$("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
                    }
                }
            });
        }

        //保存界址点坐标
        function saveYhfsJzd(){
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

            document.myForm.action="<%=basePath%>/business/business_saveJzdzb.do";
            document.myForm.target="_self";
            document.myForm.submit();
        }

        //新建/修改
        function addJzd(){
            alert(1);
            var row_index1 =jzdTable.rows.length-1;
            var new_row=jzdTable.insertRow(jzdTable.rows.length-1);
            new_row.setAttribute("id", "row"+row_index1);
            alert(2);
            var new_col=new_row.insertCell(0);
            new_col.innerHTML=row_index1+"<input name='jzdXh' id='jzdXh"+row_index1+"' type='text' value='' style='width:80px;' />";

            var new_col=new_row.insertCell(1);
            new_col.innerHTML="<input name='jzdWd' id='jzdWd"+row_index1+"' type='text' value='' style='width:80px;'/>";

            var new_col=new_row.insertCell(2);
            new_col.innerHTML="<input name='jzdJd' id='jzdJd"+row_index1+"' type='text' value='' style='width:80px;'/>";
            var new_col=new_row.insertCell(3);
            new_col.innerHTML="<a href='###' onclick=\"deleteRow('row"+row_index1+ "')\" ><img src='${contextPath}/images/close.png' height='15px' /></a>";

        }

        function deleteRow(a){
            o=document.getElementById(a);
            o.parentNode.removeChild(o);
        }

		function goBack(){
		document.myForm.action="<%=basePath%>/zon/zon_fetchGnqhBack.do";
		document.myForm.target="_self";
		document.myForm.submit();
		}

		//保存-修改
		function saveGnqh(){
            if($("#yjlmc").val() ==""){
				alert("一级类名称不允许为空！");
				return false;
			}
            if($("#ejlmc").val() ==""){
				alert("二级类名称不允许为空!");
				return false;
			}
            if($("#gnqhmc").val() ==""){
				alert("功能区划面名称不允许为空！");
				return false;
			}
            if($("#xzqy").val() ==""){
                alert("行政区域不允许为空！");
                return false;
            }
            if($("#ghmj").val() ==""){
                alert("规划面积不允许为空！");
                return false;
            }
            if($("#axcd").val() ==""){
                alert("行政区域不允许为空！");
                return false;
			}
            if($("#szd").val() ==""){
                alert("所在地不允许为空！");
                return false;
            }

			document.myForm.action="<%=basePath%>/zon/zon_addGnqh.do";
			document.myForm.target="_self";
			document.myForm.submit();
	}
	</script>
	</head>

	<body>
		<form name="myForm" method="post" >
			<input name="xmID" id="xmID" value="${xmID }" type="hidden" />
		<div class="place">
			<span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海洋功能区划管理</a></li>
				<li><a href="#">信息管理</a></li>
				<li><a href="#">新增</a></li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo" >
				<div class="listtitle">
					<img src="${contextPath}/images/f03.png" width="20" height="20" />新增
				</div>
				<table width="100%" align="center" style="text-align:left;" class="tablelist2">
					<tr>
						<td style="background-color:#f5f8fa;" width="20%">一级类名称：</td>
						<td width="30%">
							<select name="hygnqhXxgl.yjlmc" id="yjlmc" style="width:180px;">
								<option value="">-请选择-</option>
							</select>
                            <font color="red">*</font>
						</td>
						<td style="background-color:#f5f8fa;" width="20%">二级类名称：</td>
						<td width="30%">
							<select name="hygnqhXxgl.ejlmc" id="ejlmc" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
							</select>
                            <font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">功能区划面名称：</td>
						<td><input name="hygnqhXxgl.gnqhmc" id="gnqhmc" type="text" class="scinput" value="" style="width:180px;height:20px;" />
                            <font color="red">*</font>
                        </td>
						<td style="background-color:#f5f8fa;">行政区域：</td>
						<td><select name="hygnqhXxgl.xzqy" id="xzqy" style="width:180px;">
							<option value="">-请选择-</option>
						</select>
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">规划面积：</td>
						<td><input name="hygnqhXxgl.ghmj" id="ghmj" type="text" class="scinput" value="" style="width:180px;height:20px;" />公顷
							<font color="red">*</font>
						</td>

						<td style="background-color:#f5f8fa;">岸线长度：</td>
						<td><input name="hygnqhXxgl.axcd" id="axcd" type="text" class="scinput" value="" style="width:180px;height:20px;" />米
							<font color="red">*</font>
                        </td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">代码：</td>
						<td><input name="hygnqhXxgl.kzldm" id="kzldm" type="text" class="scinput" value="" style="width:180px;height:20px;" />
						</td>

						<td style="background-color:#f5f8fa;">所在地：</td>
						<td><input name="hygnqhXxgl.szd" id=szd" type="text" class="scinput" value="" style="width:180px;height:20px;" />
							<font color="red">*</font>
                        </td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">地理范围：</td>
						<td colspan="3">
						<textarea name="hygnqhXxgl.dlfwmc" id="dlfwmc" style="width:800px;height:30px; overflow:auto;" /></textarea>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海域使用管理要求：</td>
						<td colspan="3">
							<textarea name="hygnqhXxgl.syyq" id="syyq" style="width:800px;height:30px; overflow:auto;" /></textarea>
						</td>
					</tr>
					<tr>
						<td style="background-color:#f5f8fa;">海洋环境保护要求：</td>
						<td colspan="3">
							<textarea name="hygnqhXxgl.hjbhyq" id="hjbhyq" style="width:800px;height:30px; overflow:auto;" /></textarea>
						</td>
					</tr>

				</table>
			</div>

			<div class="formpart">
				
				<table width="100%" align="center" style="text-align:left;" class="tableXQ">
					<tr>
						<td colspan="4" style="text-align:center;">
						<input name="save" type="button" class="scbtn" onclick="saveGnqh()" value="保存" />
						<input name="back" type="button" class="scbtn" onclick="goBack()" value="返回" />
						
						</td>
					</tr>
				</table>
			</div>

			<%--<div class="formpart">
				<p>界址点坐标</p>
				<div style="height:400px;border:1px solid #B5BFC4;">
					<table width="70%" id="jzdTable" style="margin:10px;" class="table_left" style="text-align:center;">
						<tr>
							<th>序号</th>
							<th>经度</th>
							<th>纬度</th>
							<th width="15%">操作
								<a href="###" onclick="addJzd()">
									<img src="${contextPath}/images/t01.png" height="15px" title="新增" />
								</a>
							</th>
						</tr>
                        <c:forEach items="${ gnqhList }" var="r" varStatus="j">
                            <tr>
                                <td>${ j.count }<input name="jzdXh" id="jzdXh${ j.count }" type="text" value="${r.xh }" style="width:80px;" /></td>
                                <td><input name="jzdJd" id="jzdJd${ j.count }" type="text" value="${r.jd }" style="width:80px;" /></td>
                                <td><input name="jzdWd" id="jzdWd${ j.count }" type="text" value="${r.wd }" style="width:80px;" /></td>
                                <td>
                                    <a href="###" onclick="deleteJzd('${r.id}')">
                                        <img src="${contextPath}/images/close1.png" height="15px" title="删除"/></a>

                                    <a><img src="${contextPath}/images/UP.png" height="15px" /></a>

                                    <a><img src="${contextPath}/images/DOWN.png" height="15px" /></a>
                                </td>
                            </tr>
                        </c:forEach>
						<c:if test="${empty gnqhList }">
							<tr>
								<td>
									1<input name="jzdXh" id="jzdXh1" type="text" value="" style="width:80px;" />
								</td>
								<td>
									<input name="jzdJd" id="jzdJd1" type="text" value="" style="width:80px;" />
								</td>
								<td>
									<input name="jzdWd" id="jzdWd1" type="text" value="" style="width:80px;" />
								</td>

							</tr>
						</c:if>
						<tr>
							<td colspan="4">
								<input name="bc"  type="button" class="scbtn1" onclick="saveYhfsJzd()" value="保存" />
							</td>
						</tr>
					</table>
		</div>
		<div class="_right">
			<div class="xsgs">
				<p>显示格式</p>
				<div class="xsgs_border">
					<label><input type="checkbox" name="check"/>度分秒方式显示</label>
				</div>

			</div>
			<div class="dr">
				<p>导入</p>
				<div class="dr_border">
					<select name="ssbm" id="ssm" style="height:25px;">
						<option value="">-请选择导入坐标串格式-</option>
					</select>
					<p><input type="button" class="scbtn1" name="btn" onclick="window.location='qhgl_xxgl.jsp'" value="粘贴" /></p>

				</div>

			</div>
			<div class="dc">
				<p>导出</p>
				<div class="dc_border">
					<select name="ssbm" id="ssbm" style="height:25px;">
						<option value="">-请选择导入坐标串格式-</option>
					</select>

					<p><label><input type="radio" name="radio"/>导出当前面坐标</label></p>
					<p><input type="button" class="scbtn1" name="btn" onclick="window.location='qhgl_xxgl.jsp'" value="导出" /></p>
				</div>

			</div>
		</div>
			</div>--%>
		</div>
	</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');
			

		</script>

	</form>
	</body>

</html>