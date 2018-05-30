<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<title>参数配置</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />

		<link href="${contextPath}/css/style_tt.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>

		<script language="javascript">
			$(function() {
				//导航切换
				$(".disklist li").click(function() {
					$(".disklist li.selected").removeClass("selected")
					$(this).addClass("selected");
				})
			})
		</script>
		<script type="text/javascript">
			var lscount = 1;

			function addKey(rowNum) {
				t = lscount;
				lscount += 1;
				//alert(lscount);
				document.getElementById("zjhmCount").value = lscount;
				var rowNum = rowNum.parentNode.parentNode.rowIndex + t;
				var i = yxxx.rows.length;
				var newTr0 = yxxx.insertRow(rowNum);
				var newTd00 = newTr0.insertCell();
				newTd00.style.cssText = "text-align:right;";
				var newTd10 = newTr0.insertCell();
				newTd10.style.cssText = "text-align:left";
				newTd00.innerHTML = '<font color="red">参数值名称' + lscount + '：</font>';
				newTd10.innerHTML = "<input type='text' id='t" + lscount + "' class='scinput02' style='width:100px'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "<input type='button' value='删除' class='btn02' style='width:60px;height:20px;' onclick='removeTeacher(this)'/>";
			}

			function removeTeacher(rowNum) {
				yxxx.deleteRow(rowNum.parentNode.parentNode.rowIndex);
				lscount = lscount - 1;
				document.getElementById("zjhmCount").value = lscount;
			}

			function Cspz_back() {
				open("CspzIndex.html", "rightFrame");
			}
		</script>

	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">系统管理</a>
				</li>
				<li>
					<a href="#">参数配置</a>
				</li>
				<li>
					<a href="#">参数新增</a>
				</li>
			</ul>
		</div>

		<input type="hidden" name="zjhmCount" id="zjhmCount" value="1" />
		<table class="filetable3" id="yxxx">

			<tbody>

				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right" width="10%">参数名称：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
				</tr>
				<tr style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right" width="10%">参数类型：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" class="scinput02" style="width:100px" /></td>
				</tr>
				<tr id="row1" style=" border:1px solid #b5bfc4;">
					<td style=" border:1px solid #b5bfc4;text-align:right" width="10%">参数值名称：</td>
					<td style=" border:1px solid #b5bfc4;text-align:left" width="20%"><input type="text" id="t1" class="scinput02" style="width:100px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="添加" class="btn02" style="width:60px;height:20px;" onclick="addKey(this)" /></td>
				</tr>

			</tbody>

		</table>

		<table class="filetable3">
			<tbody>
				<tr style="height:40px;">
					<td width="30%"></td>
					<td style="text-align:center" width="10%"><input type="submit" value="提交" class="btn02" style="width:60px;height:20px;" /></td>
					<td style=" text-align:center" width="10%"><input type="reset" value="重置" class="btn02" style="width:60px;height:20px;" /></td>
					<td style=" text-align:center" width="10%"><input type="button" value="取消" class="btn02" style="width:60px;height:20px;" onclick="Cspz_back()" /></td>
					<td width="30%"></td>
				</tr>
			</tbody>
		</table>

	</body>

</html>