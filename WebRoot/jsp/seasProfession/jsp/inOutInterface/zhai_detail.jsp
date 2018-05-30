<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap.min.css" />
		<!--<link href="${contextPath}/jsp/seasProfession/css/style.css" rel="stylesheet" type="text/css" />-->
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/style.css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	</head>

	<body>
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">内外部接口</a>
				</li>
				<li>
					<a href="#">宗海</a>
				</li>
				<li>
					<a href="#">宗海查看</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<table width="100%" align="center" style="text-align:left;" class="tableXQ">
				<tr>
					<td style="background-color:#e8edef;">宗海代码</td>
					<td><input name="" type="text" class="scinput" value="H1000003776" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">宗海特征码</td>
					<td><input name="" type="text" class="scinput" value="31238882" style="width:180px;height:20px;" /></td>

				</tr>
				<tr>
					<td style="background-color:#e8edef;">要素代码</td>
					<td><input name="" type="text" class="scinput" value="123123123" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">不动产单元代码</td>
					<td><input name="" type="text" class="scinput" value="33343434" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">不动产类型</td>
					<td><input name="" type="text" class="scinput" value="类型1" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">不动产类型选项</td>
					<td>
						<select name="ssbm" id="" style="width:180px;height:25px;">
							<option value="">-请选择-</option>
							<option value="逐年缴纳">类型1</option>
							<option value="一次性缴纳">类型2</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">标识码</td>
					<td><input name="" type="text" class="scinput" value="3232HGD" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">海岛名称</td>
					<td><input name="" type="text" class="scinput" value="崇明岛" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海岛位置</td>
					<td><input name="" type="text" class="scinput" value="长江口区域" style="width:180px;height:20px;" /></td>

					<td style="background-color:#e8edef;">海岛用途</td>
					<td><input name="" type="text" class="scinput" value="商业用海" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">海域等级</td>
					<td><input name="" type="text" class="scinput" value="3" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">面积</td>
					<td><input name="" type="text" class="scinput" value="30公顷" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">面积单位</td>
					<td><input name="" type="text" class="scinput" value="公顷" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">批文编号</td>
					<td><input name="" type="text" class="scinput" value="23132123" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">区县代码</td>
					<td><input name="" type="text" class="scinput" value="333333" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">属地代码</td>
					<td><input name="" type="text" class="scinput" value="444444" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">使用金总额</td>
					<td><input name="" type="text" class="scinput" value="1231231元" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">项目编号</td>
					<td><input name="" type="text" class="scinput" value="123123" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">项目名称</td>
					<td><input name="" type="text" class="scinput" value="大风厂" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">项目性质</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用岛范围</td>
					<td><input name="" type="text" class="scinput" value="123" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">用岛面积</td>
					<td><input name="" type="text" class="scinput" value="3333公顷" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用岛类型A</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">用岛类型B</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">用岛年限</td>
					<td><input name="" type="text" class="scinput" value="3年" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">用岛设施</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">宗海面积</td>
					<td><input name="" type="text" class="scinput" value="2332公顷" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">宗海图</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">坐落</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">占用海岸线</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">备注</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">图形信息</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>
				<tr>
					<td style="background-color:#e8edef;">状态</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
					<td style="background-color:#e8edef;">注销该宗海的批文编号</td>
					<td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;" /></td>
				</tr>

				<tr>
					<td colspan="4" style="text-align:center;">

						<input name="fh" type="button" value="返回" class="scbtn1" onclick="window.location='zhai.jsp'" />
					</td>
				</tr>
			</table>
		</div>
	</body>
	<script type="text/javascript">
		$("#usual1 ul").idTabs();
	</script>

	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</html>