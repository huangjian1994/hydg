<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
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
			});
		</script>

	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">用海项目批后监管</a>
				</li>
				<li>
					<a href="#">批后监管</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<div id="usual1" class="usual">
				<div class="leftinfo1">
					<div class="itab">
						<ul>
							<li>
								<a href="#tab1" class="selected">建设过程监管</a>
							</li>
							<li>
								<a href="#tab2">竣工用海复核</a>
							</li>
							<li>
								<a href="#tab3">日常监管</a>
							</li>
							<li>
								<a href="#tab4">核查监视监测</a>
							</li>
						</ul>
					</div>

					<div id="tab1" class="tabson">
						<div class="tools">
							<ul class="toolbar">
								<li>
									<a href="jsgc_add.jsp"><span><img src="${contextPath}/images/seasProfession/t01.png"/></span>新增</a>
								</li>
								<li>
									<a href="jsgc_change.jsp"><span><img src="${contextPath}/images/seasProfession/t02.png"/></span>修改</a>
								</li>
							</ul>
						</div>
						<table class="tablelist">
							<thead>
								<tr>
									<th><input name="" type="checkbox" value="" checked="checked" /></th>
									<th>用海项目名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif"/></i></th>
									<th>用海界址</th>
									<th>用海面积(平方米)</th>
									<th>施工方式</th>
									<th>施工进展情况</th>
									<th>实际用途是否改变</th>
									<th>岸滩演变情况</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>外高桥港区</td>
									<td>东经121度北纬39度</td>
									<td>500</td>
									<td>外来施工</td>
									<td>施工中</td>
									<td>否</td>
									<td>无</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>长江口区域</td>
									<td>东经120度北纬39度</td>
									<td>400</td>
									<td>外来施工</td>
									<td>施工中断</td>
									<td>否</td>
									<td>无</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>杭州湾区域</td>
									<td>东经120.9度北纬38.8度</td>
									<td>600</td>
									<td>外来施工</td>
									<td>施工中</td>
									<td>否</td>
									<td>无</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>崇头边滩保留区</td>
									<td>东经121度北纬39度</td>
									<td>500</td>
									<td>外来施工</td>
									<td>施工中</td>
									<td>否</td>
									<td>无</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>长江口区域</td>
									<td>东经120度北纬39度</td>
									<td>400</td>
									<td>外来施工</td>
									<td>施工中断</td>
									<td>否</td>
									<td>无</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="pagin">
							<div class="message">共<i class="blue">10</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
							<ul class="paginList">
								<li class="paginItem">
									<a href="javascript:;"><span class="pagepre"></span></a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">1</a>
								</li>
								<li class="paginItem current">
									<a href="javascript:;">2</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">3</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">4</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">5</a>
								</li>
								<li class="paginItem more">
									<a href="javascript:;">...</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">10</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;"><span class="pagenxt"></span></a>
								</li>
							</ul>
						</div>
					</div>

					<div id="tab2" class="tabson">

						<div class="tools">
							<ul class="toolbar">
								<li>
									<a href="jgfh_add.jsp"><span><img src="${contextPath}/images/seasProfession/t01.png"/></span>新增</a>
								</li>
								<li>
									<a href="jgfh_change.jsp"><span><img src="${contextPath}/images/seasProfession/t02.png"/></span>修改</a>
								</li>
							</ul>
						</div>
						<table class="tablelist">
							<thead>
								<tr>
									<th><input name="" type="checkbox" value="" checked="checked" /></th>
									<th>用海项目名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif"/></i></th>
									<th>用海界址</th>
									<th>用海面积(平方米)</th>
									<th>施工方式</th>
									<th>施工进展情况</th>
									<th>实际用途</th>
									<th>岸滩演变情况</th>
									<th>复核是否一致</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>外高桥港区</td>
									<td>东经121度北纬39度</td>
									<td>500</td>
									<td>外来施工</td>
									<td>施工中</td>
									<td>哈哈</td>
									<td>无</td>
									<td>是</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>长江口区域</td>
									<td>东经120度北纬38度</td>
									<td>450</td>
									<td>外来施工</td>
									<td>施工中</td>
									<td>哈哈</td>
									<td>无</td>
									<td>是</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>杭州湾区域</td>
									<td>东经121度北纬39度</td>
									<td>300</td>
									<td>外来施工</td>
									<td>施工中断</td>
									<td>哈哈</td>
									<td>无</td>
									<td>是</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>崇头边滩保留区</td>
									<td>东经123度北纬39.9度</td>
									<td>600</td>
									<td>外来施工</td>
									<td>施工中</td>
									<td>哈哈</td>
									<td>无</td>
									<td>是</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>外高桥港区</td>
									<td>东经121度北纬39度</td>
									<td>500</td>
									<td>外来施工</td>
									<td>施工中</td>
									<td>哈哈</td>
									<td>无</td>
									<td>是</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="pagin">
							<div class="message">共<i class="blue">10</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
							<ul class="paginList">
								<li class="paginItem">
									<a href="javascript:;"><span class="pagepre"></span></a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">1</a>
								</li>
								<li class="paginItem current">
									<a href="javascript:;">2</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">3</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">4</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">5</a>
								</li>
								<li class="paginItem more">
									<a href="javascript:;">...</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">10</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;"><span class="pagenxt"></span></a>
								</li>
							</ul>
						</div>
					</div>

					<div id="tab3" class="tabson">
						<div class="tools">
							<ul class="toolbar">
								<li>
									<a href="rcjg_add.jsp"><span><img src="${contextPath}/images/seasProfession/t01.png"/></span>新增</a>
								</li>
								<li>
									<a href="rcjg_change.jsp"><span><img src="${contextPath}/images/seasProfession/t02.png"/></span>修改</a>
								</li>
							</ul>
						</div>

						<table class="tablelist">
							<thead>
								<tr>
									<th><input name="" type="checkbox" value="" checked="checked" /></th>
									<th>用海项目名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif"/></i></th>
									<th>占用海域</th>
									<th>有无非法围填海活动</th>
									<th>是否擅自改变海域用途</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>外高桥港</td>
									<td>东海</td>
									<td>无</td>
									<td>否</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>杭州湾区域</td>
									<td>南海</td>
									<td>无</td>
									<td>否</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>长江口区域</td>
									<td>东海</td>
									<td>有</td>
									<td>是</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>外高桥港</td>
									<td>东海</td>
									<td>无</td>
									<td>否</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>上海滨江森林公园</td>
									<td>东海</td>
									<td>无</td>
									<td>否</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="pagin">
							<div class="message">共<i class="blue">10</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
							<ul class="paginList">
								<li class="paginItem">
									<a href="javascript:;"><span class="pagepre"></span></a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">1</a>
								</li>
								<li class="paginItem current">
									<a href="javascript:;">2</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">3</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">4</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">5</a>
								</li>
								<li class="paginItem more">
									<a href="javascript:;">...</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">10</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;"><span class="pagenxt"></span></a>
								</li>
							</ul>
						</div>
					</div>

					<div id="tab4" class="tabson">

						<div class="tools">
							<ul class="toolbar">
								<li>
									<a href="hcjsjc_add.jsp"><span><img src="${contextPath}/images/seasProfession/t01.png"/></span>新增</a>
								</li>
								<li>
									<a href="hcjsjc_change.jsp"><span><img src="${contextPath}/images/seasProfession/t02.png"/></span>修改</a>
								</li>
							</ul>
						</div>
						<table class="tablelist">
							<thead>
								<tr>
									<th><input name="" type="checkbox" value="" checked="checked" /></th>
									<th>用海项目名称<i class="sort"><img src="${contextPath}/images/seasProfession/px.gif"/></i></th>
									<th>异点异区</th>
									<th>违规用海信息</th>
									<th>核查数据</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>外高桥港</td>
									<td>广告</td>
									<td>发生权属纠纷的用海</td>
									<td>222</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>上海滨江森林公园</td>
									<td>设施</td>
									<td>发生权属纠纷的用海</td>
									<td>222</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>长江口区域</td>
									<td>哈哈</td>
									<td>临时用海审批</td>
									<td>866</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>杭州湾区域</td>
									<td>广告</td>
									<td>发生权属纠纷的用海</td>
									<td>333</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>崇头边滩保留区</td>
									<td>定的</td>
									<td>临时用海审批</td>
									<td>55</td>
									<td>
										<a href="#" class="tablelink"> 删除</a>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="pagin">
							<div class="message">共<i class="blue">10</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
							<ul class="paginList">
								<li class="paginItem">
									<a href="javascript:;"><span class="pagepre"></span></a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">1</a>
								</li>
								<li class="paginItem current">
									<a href="javascript:;">2</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">3</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">4</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">5</a>
								</li>
								<li class="paginItem more">
									<a href="javascript:;">...</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;">10</a>
								</li>
								<li class="paginItem">
									<a href="javascript:;"><span class="pagenxt"></span></a>
								</li>
							</ul>
						</div>
					</div>
					<br/>

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