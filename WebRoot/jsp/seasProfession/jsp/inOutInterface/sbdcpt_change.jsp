<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>

		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/easyui.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.easyui.min.js"></script>

		<script type="text/javascript">
			$(function() {
				$('#cc').combo({
					required: true,
					editable: false
				});
				$('#sp').appendTo($('#cc').combo('panel'));
				$('#sp input').click(function() {
					var v = $(this).val();
					var s = $(this).next('span').text();
					$('#cc').combo('setValue', v).combo('setText', s).combo('hidePanel');
				});
				for(var i = 0; i < $(".bc").length; i++) {
					(function(indexI) {
						$(".bc").eq(indexI).on("click", function() {
							alert("保存成功");
						})
					})(i)
				}
			});
		</script>

	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">内外部接口</a>
				</li>
				<li>
					<a href="#">市不动产接口平台</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<div id="usual1" class="usual">
				<div class="leftinfo1">
					<div class="itab">
						<ul>
							<li>
								<a href="#tab1" class="selected">宗海</a>
							</li>
							<li>
								<a href="#tab3">用海批文</a>
							</li>
							<li>
								<a href="#tab8">用海情况</a>
							</li>
							<li>
								<a href="#tab6">宗海附图</a>
							</li>
							<li>
								<a href="#tab2">海域坐标</a>
							</li>
							<li>
								<a href="#tab9">用海面域定点顺序表</a>
							</li>
							<li>
								<a href="#tab7">海域使用金缴纳情况</a>
							</li>
							<li>
								<a href="#tab5">配号表</a>
							</li>
							<li>
								<a href="#tab4">海域变更表</a>
							</li>
						</ul>
					</div>

					<div id="tab1" class="tabson">
						<div class="formbody">
							<table width="100%" align="center" style="text-align:left;" class="tableXQ">
								<tr>
									<td style="background-color:#e8edef;">宗海代码</td>
									<td><input name="" type="text" class="scinput" value="H128713" style="width:180px;height:20px;" />
									</td>
									<td style="background-color:#e8edef;">宗海特征码</td>
									<td><input name="" type="text" class="scinput" value="FD1231" style="width:180px;height:20px;" />
									</td>

								</tr>
								<tr>
									<td style="background-color:#e8edef;">要素代码</td>
									<td><input name="" type="text" class="scinput" value="122231" style="width:180px;height:20px;" />
									</td>
									<td style="background-color:#e8edef;">不动产单元代码</td>
									<td><input name="" type="text" class="scinput" value="R12312" style="width:180px;height:20px;" />
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">不动产类型</td>
									<td><input name="" type="text" class="scinput" value="类型A" style="width:180px;height:20px;" />
									</td>
									<td style="background-color:#e8edef;">不动产类型选项</td>
									<td>
										<select name="ssbm" id="" style="width:180px;height:25px;">
											<option value="">-请选择-</option>
											<option selected value="逐年缴纳">类型1</option>
											<option value="一次性缴纳">类型2</option>
										</select>
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">标识码</td>
									<td><input name="" type="text" class="scinput" value="H123123" style="width:180px;height:20px;" />
									</td>
									<td style="background-color:#e8edef;">海岛名称</td>
									<td><input name="" type="text" class="scinput" value="崇明" style="width:180px;height:20px;" />
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">海岛位置</td>
									<td><input name="" type="text" class="scinput" value="海边" style="width:180px;height:20px;" />
									</td>
									<td style="background-color:#e8edef;">海岛用途</td>
									<td><input name="" type="text" class="scinput" value="商业" style="width:180px;height:20px;" />
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">海域等级</td>
									<td><input name="" type="text" class="scinput" value="2" style="width:180px;height:20px;" />
									</td>
									<td style="background-color:#e8edef;">面积</td>
									<td><input name="" type="text" class="scinput" value="1.6" style="width:180px;height:20px;" />
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">面积单位</td>
									<td><input name="" type="text" class="scinput" value="公顷" style="width:180px;height:20px;" />
									</td>
									<td style="background-color:#e8edef;">批文编号</td>
									<td><input name="" type="text" class="scinput" value="JK123123" style="width:180px;height:20px;" />
									</td>
								</tr>
								<tr>
									<td style="background-color:#e8edef;">区县代码</td>
									<td><input name="" type="text" class="scinput" value="1231231" style="width:180px;height:20px;" />
									</td>
									<td style="background-color:#e8edef;">属地代码</td>
									<td>
										<input name="" type="text" class="scinput" value=FF123123" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">使用金总额</td>
                            <td><input name="" type="text" class="scinput" value="12312" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">项目编号</td>
                            <td><input name="" type="text" class="scinput" value="1111312312" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">项目名称</td>
                            <td><input name="" type="text" class="scinput" value="大风厂" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">项目性质</td>
                            <td><input name="" type="text" class="scinput" value="商业" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">用岛范围</td>
                            <td><input name="" type="text" class="scinput" value="1.6" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">用岛面积</td>
                            <td><input name="" type="text" class="scinput" value="公顷" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">用岛类型A</td>
                            <td><input name="" type="text" class="scinput" value="A" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">用岛类型B</td>
                            <td><input name="" type="text" class="scinput" value="B" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">用岛年限</td>
                            <td><input name="" type="text" class="scinput" value="3" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">用岛设施</td>
                            <td><input name="" type="text" class="scinput" value="33" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">宗海面积</td>
                            <td><input name="" type="text" class="scinput" value="3.3" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">宗海图</td>
                            <td><input name="" type="text" class="scinput" value="" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">坐落</td>
                            <td><input name="" type="text" class="scinput" value="123" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">占用海岸线</td>
                            <td><input name="" type="text" class="scinput" value="一号海岸线" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">备注</td>
                            <td><input name="" type="text" class="scinput" value="123" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">图形信息</td>
                            <td><input name="" type="text" class="scinput" value="123" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">状态</td>
                            <td><input name="" type="text" class="scinput" value="123" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">注销该宗海的批文编号</td>
                            <td><input name="" type="text" class="scinput" value="123131" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align:center;">
                                <input type="button" class="scbtn1 bc"  value="保存">
                                <input type="button" class="scbtn1"  value="返回"
                                       onclick="window.location='zhai.jsp'">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="tab2" class="tabson">
                <div class="formbody">
                    <table width="100%" align="center" style="text-align:left;" class="tableXQ">
                        <tr>
                            <td style="background-color:#e8edef;">宗海代码</td>
                            <td><input name="" type="text" class="scinput" value="H123123" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">坐标编号</td>
                            <td><input name="" type="text" class="scinput" value="1231231" style="width:180px;height:20px;"/>
                            </td>

                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">北纬</td>
                            <td><input name="" type="text" class="scinput" value="22.3" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">东经</td>
                            <td><input name="" type="text" class="scinput" value="33.2" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">批文编号</td>
                            <td><input name="" type="text" class="scinput" value="1231231" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align:center;">
                                <input type="button" class="scbtn1 bc"  value="保存" >
                                <input type="button" class="scbtn1"  value="返回"
                                       onclick="window.location='zhai.jsp'">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="tab3" class="tabson">
                <div class="formbody">
                    <table width="100%" align="center" style="text-align:left;" class="tableXQ">
                        <tr>
                            <td style="background-color:#e8edef;">批文编号</td>
                            <td><input name="" type="text" class="scinput" value="1231231" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">项目名称</td>
                            <td><input name="" type="text" class="scinput" value="大风厂" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">用海单位</td>
                            <td><input name="" type="text" class="scinput" value="1231" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">用海性质</td>
                            <td><input name="" type="text" class="scinput" value="商业" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">用海总面积</td>
                            <td><input name="" type="text" class="scinput" value="1.2" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">面积单位</td>
                            <td><input name="" type="text" class="scinput" value="公顷" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">年限</td>
                            <td><input name="" type="text" class="scinput" value="12" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">截止日期</td>
                            <td><input name="" type="text" class="scinput" value="2022-09-11" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">发文单位</td>
                            <td><input name="" type="text" class="scinput" value="水务局" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">变更类型</td>
                            <td><input name="" type="text" class="scinput" value="A" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align:center;">
                                <input type="button" class="scbtn1 bc"  value="保存" >
                                <input type="button" class="scbtn1"  value="返回"
                                       onclick="window.location='zhai.jsp'">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div id="tab4" class="tabson">
                <div class="formbody">
                    <table width="100%" align="center" style="text-align:left;" class="tableXQ">
                        <tr>
                            <td style="background-color:#e8edef;">批文编号</td>
                            <td><input name="" type="text" class="scinput" value="H1231231" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">变更状态</td>
                            <td><input name="" type="text" class="scinput" value="A" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">变更类型</td>
                            <td><input name="" type="text" class="scinput" value="A" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align:center;">
                                <input type="button" class="scbtn1 bc"  value="保存" >
                                <input type="button" class="scbtn1"  value="返回"
                                       onclick="window.location='zhai.jsp'">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="tab5" class="tabson">
                <div class="formbody">
                    <table width="100%" align="center" style="text-align:left;" class="tableXQ">
                        <tr>
                            <td style="background-color:#e8edef;">宗海编号</td>
                            <td><input name="" type="text" class="scinput" value="H123123123" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">批文号</td>
                            <td><input name="" type="text" class="scinput" value="FG1231313" style="width:180px;height:20px;"/>

                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">受理编号</td>
                            <td><input name="" type="text" class="scinput" value="GG1231231" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">开始日期</td>
                            <td><input name="" type="text" class="scinput" value="2011-09-11" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">配号结果</td>
                            <td><input name="" type="text" class="scinput" value="OK" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">配号人</td>
                            <td><input name="" type="text" class="scinput" value="张三" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">配号日期</td>
                            <td><input name="" type="text" class="scinput" value="2013-11-11" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align:center;">
                                <input type="button" class="scbtn1 bc"  value="保存" >
                                <input type="button" class="scbtn1"  value="返回"
                                       onclick="window.location='zhai.jsp'">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="tab6" class="tabson">
                <div class="formbody">
                    <table width="100%" align="center" style="text-align:left;" class="tableXQ">
                        <tr>
                            <td style="background-color:#e8edef;">附图编号</td>
                            <td><input name="" type="text" class="scinput" value="123123123" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">宗海编号</td>
                            <td><input name="" type="text" class="scinput" value="GH12312313" style="width:180px;height:20px;"/>

                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">宗海位置图</td>
                            <td><input name="" type="text" class="scinput" value="123" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">宗海界址图</td>
                            <td><input name="" type="text" class="scinput" value="123" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align:center;">
                                <input type="button" class="scbtn1 bc"  value="保存" >
                                <input type="button" class="scbtn1"  value="返回"
                                       onclick="window.location='zhai.jsp'">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="tab7" class="tabson">
                <div class="formbody">
                    <table width="100%" align="center" style="text-align:left;" class="tableXQ">
                        <tr>
                            <td style="background-color:#e8edef;">宗海编号</td>
                            <td><input name="" type="text" class="scinput" value="H131231" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">使用金缴纳编号</td>
                            <td><input name="" type="text" class="scinput" value="GH1321231" style="width:180px;height:20px;"/>
                            </td>

                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">缴纳人</td>
                            <td><input name="" type="text" class="scinput" value="张三" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">缴纳日期</td>
                            <td><input name="" type="text" class="scinput" value="2011-11-11" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">缴纳情况</td>
                            <td><input name="" type="text" class="scinput" value="已缴纳" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">备注</td>
                            <td><input name="" type="text" class="scinput" value="123" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">收款人</td>
                            <td><input name="" type="text" class="scinput" value="战三" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">收款金额</td>
                            <td><input name="" type="text" class="scinput" value="123123" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align:center;">
                                <input type="button" class="scbtn1 bc"  value="保存" >
                                <input type="button" class="scbtn1"  value="返回"
                                       onclick="window.location='zhai.jsp'">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="tab8" class="tabson">
                <div class="formbody">
                    <table width="100%" align="center" style="text-align:left;" class="tableXQ">
                        <tr>
                            <td style="background-color:#e8edef;">用海编号</td>
                            <td><input name="" type="text" class="scinput" value="H123123" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">宗海编号</td>
                            <td><input name="" type="text" class="scinput" value="H1231231231" style="width:180px;height:20px;"/>
                            </td>

                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">用海方式</td>
                            <td><input name="" type="text" class="scinput" value="商业" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">面积</td>
                            <td><input name="" type="text" class="scinput" value="1.6" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">面积单位</td>
                            <td><input name="" type="text" class="scinput" value="公顷" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">具体用途</td>
                            <td><input name="" type="text" class="scinput" value="商业" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">使用金数额</td>
                            <td><input name="" type="text" class="scinput" value="123123" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">坐标范围</td>
                            <td><input name="" type="text" class="scinput" value="123123" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">备注</td>
                            <td><input name="" type="text" class="scinput" value="12313" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align:center;">
                                <input type="button" class="scbtn1 bc"  value="保存" >
                                <input type="button" class="scbtn1"  value="返回"
                                       onclick="window.location='zhai.jsp'">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="tab9" class="tabson">
                <div class="formbody">
                    <table width="100%" align="center" style="text-align:left;" class="tableXQ">
                        <tr>
                            <td style="background-color:#e8edef;">宗海代码</td>
                            <td><input name="" type="text" class="scinput" value="H123123" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">坐标编号</td>
                            <td><input name="" type="text" class="scinput" value="123123" style="width:180px;height:20px;"/>
                            </td>

                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">用海编号</td>
                            <td><input name="" type="text" class="scinput" value="123123" style="width:180px;height:20px;"/>
                            </td>
                            <td style="background-color:#e8edef;">序号</td>
                            <td><input name="" type="text" class="scinput" value="123123" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e8edef;">批文编号</td>
                            <td><input name="" type="text" class="scinput" value="123123123" style="width:180px;height:20px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align:center;">
                                <input type="button" class="scbtn1 bc"  value="保存" >
                                <input type="button" class="scbtn1"  value="返回"
                                       onclick="window.location='zhai.jsp'">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <script type="text/javascript">
                $("#usual1 ul").idTabs();
            </script>

            <script type="text/javascript">
                $('.tablelist tbody tr:odd').addClass('odd');
            </script>

</body>

</html>