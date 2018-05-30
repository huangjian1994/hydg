<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />

		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>

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
	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海洋功能区划管理</a>
				</li>
				<li>
					<a href="#">信息管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">

			<div id="usual1" class="usual">
				<div class="leftinfo1">
					<div class="itab">
						<ul>
							<li>
								<a href="#tab1" class="selected">项目信息</a>
							</li>
							<li>
								<a href="#tab2">项目附件</a>
							</li>
							<li>
								<a href="#tab3">证书信息</a>
							</li>
							<li>
								<a href="#tab4">用海方式</a>
							</li>
							<li>
								<a href="#tab5">海域使用金</a>
							</li>
							<li>
								<a href="#tab6">宗海图</a>
							</li>
							<li>
								<a href="#tab7">申请材料</a>
							</li>
							<li>
								<a href="#tab8">地图定位</a>
							</li>
						</ul>
					</div>
					<div id="tab1" class="tabson">
						<div id="main1" style="height:500px;width:955px;border:0px solid #ccc;margin:auto;">
							<table width="100%" class="table_1" align="left">
								<th>基本信息</th>
								<tr>
									<td width="13%">用海项目名称：</td>
									<td colspan="3"><input name="" type="text" value="扩建工程" style="width:80%;" /></td>
								</tr>
								<tr>
									<td width="13%">项目位置：</td>
									<td><input name="" type="text" value="浙江省" style="width:180px;" /></td>
									<td width="13%">证书数量：</td>
									<td><input name="" type="text" value="1" style="width:180px;" /></td>
								</tr>
								<tr>
									<td width="13%">用海总面积：</td>
									<td><input name="" type="text" value="222" style="width:180px;" />公顷</td>
									<td width="13%">投资额：</td>
									<td><input name="" type="text" value="111" style="width:90px;" />
										<select name="ssbm" id="ssbm" style="width:85px;">
											<option value="万人民币">万人民币</option>
											<option value="千万人民币">千万人民币</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="13%">占用岸线：</td>
									<td><input name="" type="text" value="11" style="width:180px;" />米</td>
									<td width="13%">新增案线：</td>
									<td><input name="" type="text" value="" style="width:180px;" />米</td>
								</tr>
								<tr>
									<td width="13%">海域等别：</td>
									<td>
										<select name="ssbm" id="ssbm" style="width:180px;">
											<option value="一等">一等</option>
											<option value="二等">二等</option>
										</select>
									</td>
									<td width="13%">登记机关：</td>
									<td><input name="" type="text" value="" style="width:180px;" /></td>
								</tr>
								<tr>
									<td width="13%">受理机关级别：</td>
									<td>
										<select name="ssbm" id="ssbm" style="width:180px;">
											<option value="国家级">国家级</option>
										</select>
									</td>
									<td width="13%">受理日期：</td>
									<td><input name="" type="text" value="" style="width:180px;" /></td>
								</tr>
								<tr>
									<td width="13%">项目其他相关批准文件和材料：</td>
									<td colspan="3"><textarea cols="80"></textarea></td>
								</tr>
								<tr>
									<td width="13%">备注：</td>
									<td colspan="3"><textarea cols="80"></textarea></td>
								</tr>
								<tr>
									<th>申请人信息</th>
									<td colspan="3"></td>
								</tr>
								<tr>
									<td colspan="4"></td>
								</tr>
								<tr>
									<th>海籍调查信息</th>
									<td colspan="3"></td>
								</tr>
								<tr>
									<td colspan="4"></td>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center;">
										<input name="" type="button" class="scbtn1" onclick="window.location='xmsq_adddetail.jsp'" value="保存" />
										<input name="" type="button" class="scbtn1" onclick="window.location='xmsq_adddetail.jsp'" value="删除" />
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div id="tab2" class="tabson">
						<div class="div3">
							<p><span></span>附件列表</p>
							<table class="table_4" width="100%">
								<tr>
									<th><input name="" type="checkbox" value="" /></th>
									<th>附件名</th>
									<th>附件类型</th>
									<th>文件类型</th>
									<th>文件大小（KB）</th>
									<th>上传人</th>
									<th>上传时间</th>
									<th>查看</th>
								</tr>
								<tr>
									<th><input name="" type="checkbox" value="" /></th>
									<td>海域使用论证报告.doc</td>
									<td>海域使用论证报告</td>
									<td>doc</td>
									<td>64.5</td>
									<td>宋德瑞</td>
									<td>2017-5-22</td>
									<td>查看</td>
								</tr>
							</table>
							<div class="left_button"><input name="" type="button" class="scbtn1" onclick="window.location=''" value="删除" /></div>
						</div>
						<div class="div3">
							<p><span></span>上传附件</p>

							<table class="table_3" width="35%">
								<tr>
									<td width="40%">附件名称:</td>
									<td width="60%"><input name="" type="text" value="" style="width:180px;" /></td>
								</tr>
								<tr>
									<td>附件类型:</td>
									<td>
										<select name="ssbm" id="ssbm" style="width:180px;">
											<option value="">--请选择--</option>
											<option value="海域论证报告">海域论证报告</option>
											<option value="海域论证报告">海域论证报告</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>上传附件:</td>
									<td>
										<input name="" type="file" value="11" style="width:180px;" />
									</td>
								</tr>
								<tr>
									<td>备注:</td>
									<td>
										<textarea cols="20" rows="5"></textarea>
									</td>
								</tr>
								<tr>
									<td><input name="" type="button" class="scbtn2" onclick="window.location=''" value="保存" /></td>
									<td><input name="" type="button" class="scbtn2" onclick="window.location=''" value="重置" /></td>
								</tr>
							</table>

						</div>

					</div>
				</div>
			</div>
		</div>
		<div id="tab3" class="tabson">
			<div class="div3">
				<p><span></span>证书基本信息</p>
				<span>宗海信息</span>
				<div class="_line"></div>
				<table class="table_5" width="100%">
					<tr>
						<td>用海类型A</td>
						<td>
							<select name="" id="" style="width:180px;">
								<option value="交通运输用海">交通运输用海</option>
							</select>
						</td>
						<td>用海类型B</td>
						<td>
							<select name="" id="" style="width:180px;">
								<option value="港口用海">港口用海</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>用海年限</td>
						<td>
							<input name="" type="text" value="1" style="width:180px;" />
						</td>
						<td>宗海面积</td>
						<td>
							<input name="" type="text" value="50.000" style="width:180px;" />公顷
						</td>
					</tr>
					<tr>
						<td>用海性质</td>
						<td>
							<select name="" id="" style="width:180px;">
								<option value="经营性">经营性</option>
							</select>
						</td>
						<td>确权方式</td>
						<td>
							<select name="" id="" style="width:180px;">
								<option value="申请审批">申请审批</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>用海位置文字说明</td>
						<td colspan="3">
							<textarea cols="70">
                             </textarea>
						</td>
					</tr>
					<tr>
						<td>备注</td>
						<td colspan="3">
							<textarea cols="70">
                             </textarea>
						</td>
					</tr>
				</table>
				<span style="margin-top:30px;">海籍管理文书图件</span>
				<div class="_line"></div>
				<table class="table_5" width="100%">
					<tr>
						<td width="12%">海籍调查表号</td>
						<td width="38%"><input name="" type="text" value="20170522" style="width:180px;" /></td>
						<td width="20%">审批表号或批准合同号</td>
						<td width="30%"><input name="" type="text" value="20170523" style="width:180px;" /></td>
					</tr>
					<tr>
						<td>海籍编号</td>
						<td><input name="" type="text" value="020345" style="width:180px;" /></td>
						<td>海籍图号</td>
						<td><input name="" type="text" value="245678" style="width:180px;" /></td>
					</tr>
				</table>

				<div class="b_button">
					<input name="" type="button" class="scbtn2" onclick="window.location=''" value="保存" />
					<input name="" type="button" class="scbtn2" onclick="window.location=''" value="删除" />
					<input name="" type="button" class="scbtn2" onclick="window.location=''" value="导出" />
				</div>
			</div>
		</div>
		<div id="tab4" class="tabson">
			<div class="div3">
				<div class="yhleft">
					<div class="yhfslb">
						<p><span></span>用海方式列表</p>
						<table class="table_4" width="95%">
							<tr>
								<th>标识</th>
								<th>用海方式</th>
								<th>面积</th>
							</tr>
							<tr>
								<td>B</td>
								<td>取、排水口</td>
								<td>114</td>
							</tr>
						</table>
						<div class="b_button" style="width:80%">
							<input name="" type="button" class="scbtn2" onclick="window.location=''" value="保存" />
							<input name="" type="button" class="scbtn2" onclick="window.location=''" value="删除" />
							<input name="" type="button" class="scbtn2" onclick="window.location=''" value="导出" />
						</div>
					</div>
					<div class="yhsyt">
						<p><span></span>用海示意图</p>
						<div><img src="${contextPath}/images/seasProfession/eg1.png" /></div>

					</div>
				</div>
				<div class="yhright">
					<div class="sxxx">
						<p><span></span>属性信息</p>
						<table class="table_4" width="90%">
							<tr>
								<td width="20%" style="text-align:left;">用海方式</td>
								<td width="70%" style="text-align:left;">
									<select name="" id="" style="width:180px;">
										<option value="55、取、排水口">55、取、排水口</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="text-align:left;">面积</td>
								<td style="text-align:left;"><input name="" type="text" value="114" style="width:180px;" />(自动计算面积：114公顷)</td>
							</tr>
							<tr>
								<td style="text-align:left;">具体用途</td>
								<td style="text-align:left;"><textarea></textarea></td>
							</tr>
						</table>
					</div>
					<div class="jzdzb">
						<p><span></span>界址点坐标</p>
						<div class="jzd">
							<table width="60%" style="margin:10px;" class="table_4" style="text-align:center;">
								<tr>
									<th>序号</th>
									<th>经度</th>
									<th>纬度</th>
									<th>操作</th>
								</tr>
								<tr>
									<td width="20%">B1</td>
									<td width="30%">33°41'24"</td>
									<td width="30%">120°28'24"</td>
									<td width="20%">
										<a><img src="${contextPath}/images/seasProfession/close1.png" height="12px" /></a>
										<a><img src="${contextPath}/images/seasProfession/UP.png" height="12px" /></a>
										<a><img src="${contextPath}/images/seasProfession/DOWN.png" height="12px" /></a>
									</td>
								</tr>
								<tr>
									<td width="20%">B2</td>
									<td width="30%">33°41'24"</td>
									<td width="30%">120°28'24"</td>
									<td width="20%">
										<a><img src="${contextPath}/images/seasProfession/close1.png" height="12px" /></a>
										<a><img src="${contextPath}/images/seasProfession/UP.png" height="12px" /></a>
										<a><img src="${contextPath}/images/seasProfession/DOWN.png" height="12px" /></a>
									</td>
								</tr>
								<tr>
									<td width="20%">B3</td>
									<td width="30%">33°41'24"</td>
									<td width="30%">120°28'24"</td>
									<td width="20%">
										<a><img src="${contextPath}/images/seasProfession/close1.png" height="12px" /></a>
										<a><img src="${contextPath}/images/seasProfession/UP.png" height="12px" /></a>
										<a><img src="${contextPath}/images/seasProfession/DOWN.png" height="12px" /></a>
									</td>
								</tr>
								<tr>
									<td width="20%">B4</td>
									<td width="30%">33°41'24"</td>
									<td width="30%">120°28'24"</td>
									<td width="20%">
										<a><img src="${contextPath}/images/seasProfession/close1.png" height="12px" /></a>
										<a><img src="${contextPath}/images/seasProfession/UP.png" height="12px" /></a>
										<a><img src="${contextPath}/images/seasProfession/DOWN.png" height="12px" /></a>
									</td>
								</tr>
								<tr>
									<td width="20%">B5</td>
									<td width="30%">33°41'24"</td>
									<td width="30%">120°28'24"</td>
									<td width="20%">
										<a><img src="${contextPath}/images/seasProfession/close1.png" height="12px" /></a>
										<a><img src="${contextPath}/images/seasProfession/UP.png" height="12px" /></a>
										<a><img src="${contextPath}/images/seasProfession/DOWN.png" height="12px" /></a>
									</td>
								</tr>
								<tr>
									<td width="20%">B6</td>
									<td width="30%">33°41'24"</td>
									<td width="30%">120°28'24"</td>
									<td width="20%">
										<a><img src="${contextPath}/images/seasProfession/close1.png" height="12px" /></a>
										<a><img src="${contextPath}/images/seasProfession/UP.png" height="12px" /></a>
										<a><img src="${contextPath}/images/seasProfession/DOWN.png" height="12px" /></a>
									</td>
								</tr>
								<tr>
									<td width="20%">B7</td>
									<td width="30%">33°41'24"</td>
									<td width="30%">120°28'24"</td>
									<td width="20%">
										<a><img src="${contextPath}/images/seasProfession/close1.png" height="12px" /></a>
										<a><img src="${contextPath}/images/seasProfession/UP.png" height="12px" /></a>
										<a><img src="${contextPath}/images/seasProfession/DOWN.png" height="12px" /></a>
									</td>
								</tr>

							</table>
							<div class="jzd_right">
								<span>显示格式</span>
								<div class="_line"></div>
								<label><input type="checkbox" name="check" class="checkbox"/>度分秒方式显示</label>
								<p>左边经度纬度值<input name="" type="button" class="scbtn1" onclick="window.location=''" value="互换" /></p>
								<span style="margin-top:10px;">导入</span>
								<div class="_line"></div>
								<select name="" id="" style="width:150px;">
									<option value="请选择导入坐标串格式">请选择导入坐标串格式</option>
								</select>
								<input name="" type="button" class="scbtn1" onclick="window.location=''" value="导入" />
								<input name="" type="button" class="scbtn1" onclick="window.location=''" value="粘贴" />
								<span style="margin-top:10px;">导出</span>
								<div class="_line"></div>
								<select name="" id="" style="width:150px;">
									<option value="请选择导出坐标串格式">请选择导出坐标串格式</option>
								</select>
								<input name="" type="button" class="scbtn1" onclick="window.location=''" value="导出" />

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<div id="tab5" class="tabson">
			<div class="div3">
				<span>详细信息区</span>
				<div class="_line"></div>
				<table class="table_5" width="100%">
					<tr>
						<td>证书编号</td>
						<td colspan="3"> F20060101</td>
					</tr>
					<tr>
						<td>项目名称</td>
						<td><input name="" type="text" value="扩建工程" style="width:180px;" /></td>
						<td>项目位置</td>
						<td><input name="" type="text" value="浦东新区" style="width:180px;" /></td>
					</tr>
					<tr>
						<td>海域使用权人</td>
						<td><input name="" type="text" value="发电责任有限公司" style="width:180px;" /> </td>
						<td>确权方式</td>
						<td>
							<select name="" id="" style="width:180px;">
								<option value="申请审批">申请审批</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>用海类型A</td>
						<td>
							<select name="" id="" style="width:180px;">
								<option value="工业用海">工业用海</option>
							</select>
						</td>
						<td>用海类型B</td>
						<td>
							<select name="" id="" style="width:180px;">
								<option value="电力工业用海">电力工业用海</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>是否为临时用海</td>
						<td> <label><input type="radio" name="radio" class="radio"/>是<input type="radio" name="radio" class="radio"/>否</label>
						</td>
						<td>用海时限（日）</td>
						<td> <input name="" type="text" value="" style="width:180px;" /></td>
					</tr>
					<tr>
						<td>缴纳日期</td>
						<td><input name="" type="text" value="" style="width:180px;" /></td>
						<td>项目类型</td>
						<td> <label><input type="radio" name="radio" class="radio"/>原有项目<input type="radio" name="radio" class="radio"/>现有项目</label></td>
					</tr>
					<tr>
						<td>登记人</td>
						<td><input name="" type="text" value="宋德瑞" style="width:180px;" /></td>
						<td>登记时间</td>
						<td><input name="" type="text" value="2017-5-22" style="width:180px;" /></td>
					</tr>
				</table>
				<span style="margin-top:30px;">海籍管理文书图件</span>
				<div class="_line"></div>
				<table class="table_5" width="100%">
					<tr>
						<td width="12%">海籍调查表号</td>
						<td width="38%"><input name="" type="text" value="20170522" style="width:180px;" /></td>
						<td width="20%">审批表号或批准合同号</td>
						<td width="30%"><input name="" type="text" value="20170523" style="width:180px;" /></td>
					</tr>
					<tr>
						<td>海籍编号</td>
						<td><input name="" type="text" value="020345" style="width:180px;" /></td>
						<td>海籍图号</td>
						<td><input name="" type="text" value="245678" style="width:180px;" /></td>
					</tr>
				</table>

				<table class="table_4" width="100%">
					<tr>
						<th></th>
						<th></th>
						<th colspan="2">海域使用金应征金额（元）</th>
						<th colspan="3">海域使用金应征金额（元）</th>
						<th colspan="3">海域使用金减免金额（元）</th>
					</tr>
					<tr>
						<th width="18%">用海方式（二级）</th>
						<th width="18%">用海面积（公顷）</th>
						<th width="8%">中央国库</th>
						<th width="8%">地方国库</th>
						<th width="8%">中央国库</th>
						<th width="8%">地方国库</th>
						<th width="8%">小计</th>
						<th width="8%">中央国库</th>
						<th width="8%">地方国库</th>
						<th width="8%">小计</th>
					</tr>
					<tr>
						<td>
							<select name="" id="" style="width:100px;">
								<option value="55、取、排水口">55、取、排水口</option>
							</select>
						</td>
						<td><input name="" type="text" value="11" style="width:100px;" /></td>
						<td><input name="" type="text" value="" style="width:50px;" /></td>
						<td><input name="" type="text" value="" style="width:50px;" /></td>
						<td><input name="" type="text" value="" style="width:50px;" /></td>
						<td><input name="" type="text" value="" style="width:50px;" /></td>
						<td><input name="" type="text" value="" style="width:50px;" /></td>
						<td><input name="" type="text" value="" style="width:50px;" /></td>
						<td><input name="" type="text" value="" style="width:50px;" /></td>
						<td><input name="" type="text" value="" style="width:50px;" /></td>
					</tr>
				</table>

				<div class="b_button" width="40%;">
					<input name="" type="button" class="scbtn2" onclick="window.location=''" value="保存" />
					<input name="" type="button" class="scbtn2" onclick="window.location=''" value="取消" />
					<input name="" type="button" class="scbtn2" onclick="window.location=''" value="明细" />
				</div>
			</div>
		</div>
		<div id="tab6" class="tabson">
		</div>
		<div id="tab7" class="tabson">
		</div>
		<div id="tab8" class="tabson">
			<div><img src="${contextPath}/images/seasProfession/eg2.png" /></div>
		</div>
		</div>
		</div>
		</div>
		</div>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

		</div>

	</body>

</html>