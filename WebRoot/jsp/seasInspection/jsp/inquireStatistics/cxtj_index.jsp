<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>查询统计</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/select.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>

		<script type="text/javascript">
			KE.show({
				id: 'content7',
				cssPath: './index.css'
			});
		</script>

		<script type="text/javascript">
			$(document).ready(function(e) {
				$(".select1").uedSelect({
					width: 345
				});
				$(".select2").uedSelect({
					width: 167
				});
				$(".select3").uedSelect({
					width: 100
				});
			});

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
		</script>
		<style>
			.search {
				width: 100px;
				height: 28px;
				background-image:url(${contextPath}/images/seasInspection/search01.png);
			}
		</style>
	</head>

	<body>

		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">查询统计</a>
				</li>
				<li>
					<a href="#">分类管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">

			<div id="usual1" class="usual">

				<div class="itab">
					<ul>
						<li>
							<a href="#tab1">视频类</a>
						</li>
						<li>
							<a href="#tab2">图片类</a>
						</li>
						<li>
							<a href="#tab3">语音类</a>
						</li>
						<li>
							<a href="#tab4">文字类</a>
						</li>
					</ul>
				</div>

				<div id="tab1" class="tabson">
					<ul class="seachform">
						<li><input name="" type="text" value="请输入查询内容" class="scinput" /></li>
						<li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询" /></li>
						<li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="导入" /></li>
						<li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="批量删除" /></li>
					</ul>
					<ul class="toolbar2">
						<span><input name="" type="checkbox" value="" checked="checked"/>
	&nbsp;&nbsp;全选
	</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span>共搜索出3条结果</span>
					</ul>

					<ul class="imglist">

						<li class="selected">
							<span style="text-align:center"><img src="${contextPath}/images/seasInspection/map/map1.jpg" height="130" width="154" /></span>
							<h2><input name="" type="checkbox" value="" checked="checked"/>&nbsp;&nbsp;<a href="#">视频1</a></h2>
							<p>
								<a href="#">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="#">详情</a>
							</p>
						</li>

						<li>
							<span style="text-align:center"><img src="${contextPath}/images/seasInspection/map/map2.jpg"  height="130" width="154"/></span>
							<h2><input name="" type="checkbox" value="" checked="checked"/>&nbsp;&nbsp;<a href="#">视频2</a></h2>
							<p>
								<a href="#">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="#">详情</a>
							</p>
						</li>

						<li>
							<span style="text-align:center"><img src="${contextPath}/images/seasInspection/map/map4.jpg" height="130" width="154"/></span>
							<h2><input name="" type="checkbox" value="" checked="checked"/>&nbsp;&nbsp;<a href="#">视频3</a></h2>
							<p>
								<a href="#">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="#">详情</a>
							</p>
						</li>
					</ul>
				</div>

				<div id="tab2" class="tabson">
					<!--<div class="formtext">Hi，<b>admin</b>，欢迎您试用信息发布功能！</div>-->
					<ul class="seachform">
						<li><input name="" type="text" value="请输入查询内容" class="scinput" /></li>
						<li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询" /></li>
						<li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="导入" /></li>
						<li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="批量删除" /></li>
					</ul>
					<ul class="toolbar2">
						<span><input name="" type="checkbox" value="" checked="checked"/>
	&nbsp;&nbsp;全选
	</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span>共搜索出3条结果</span>
					</ul>

					<ul class="imglist">

						<li class="selected">
							<span style="text-align:center"><img src="${contextPath}/images/seasInspection/map/map5.jpg" height="130" width="154"/></span>
							<h2><input name="" type="checkbox" value="" checked="checked"/>&nbsp;&nbsp;<a href="#">图片1</a></h2>
							<p>
								<a href="#">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="#">详情</a>
							</p>
						</li>

						<li>
							<span style="text-align:center"><img src="${contextPath}/images/seasInspection/map/map6.jpg" height="130" width="154"/></span>
							<h2><input name="" type="checkbox" value="" checked="checked"/>&nbsp;&nbsp;<a href="#">图片2</a></h2>
							<p>
								<a href="#">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="#">详情</a>
							</p>
						</li>

						<li>
							<span style="text-align:center"><img src="${contextPath}/images/seasInspection/map/map7.jpg" height="130" width="154"/></span>
							<h2><input name="" type="checkbox" value="" checked="checked"/>&nbsp;&nbsp;<a href="#">图片3</a></h2>
							<p>
								<a href="#">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="#">详情</a>
							</p>
						</li>
					</ul>
				</div>

				<div id="tab3" class="tabson">
					<ul class="seachform">
						<li><input name="" type="text" value="请输入查询内容" class="scinput" /></li>
						<li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询" /></li>
						<li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="导入" /></li>
						<li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="批量删除" /></li>
					</ul>
					<ul class="toolbar2">
						<span><input name="" type="checkbox" value="" checked="checked"/>
	&nbsp;&nbsp;全选
	</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span>共搜索出1条结果</span>
					</ul>
					<ul class="imglist">
						<li class="selected">
							<span style="text-align:center"><img src="${contextPath}/images/seasInspection/map/map10.jpg" height="130" width="154" /></span>
							<h2><input name="" type="checkbox" value="" checked="checked"/>&nbsp;&nbsp;<a href="#">录音1</a></h2>
							<p>
								<a href="#">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="#">详情</a>
							</p>
						</li>
					</ul>
				</div>
				<div id="tab4" class="tabson">
					<ul class="seachform">
						<li><input name="" type="text" value="请输入查询内容" class="scinput" /></li>
						<li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询" /></li>
						<li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="批量删除" /></li>
					</ul>
					<!---         分割              -->

					<div class="formbody">
						<table class="tablelist">
							<thead>
								<tr>
									<th><input type="checkbox" id="cb" onclick="checkAll()" /></th>
									<th>序号</th>
									<th>问题分类</th>
									<th>检测海岛</th>
									<th>领队</th>
									<th>人员个数</th>
									<th>检查方式</th>
									<th>巡查范围</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" name="chk" id="chk" value="" /></td>
									<td>1</td>
									<td>巡视</td>
									<td>鸡骨礁</td>
									<td>黄翔</td>
									<td>3</td>
									<td>定期</td>
									<td>崇明县</td>
									<td>

										<a href="${contextPath}/jsp/seasInspection/海域海岛巡查/xcrwtj_sbdetail.html" class="tablelink">详情</a>
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td><input type="checkbox" name="chk" id="chk" value="" /></td>
									<td>2</td>
									<td>巡航</td>
									<td>荷包岛</td>
									<td>杜佳明</td>
									<td>5</td>
									<td>不定期</td>
									<td>宝山区</td>

									<td>

										<a href="${contextPath}/jsp/seasInspection/海域海岛巡查/xcrwtj_sbdetail.html" class="tablelink">详情</a>
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td><input type="checkbox" name="chk" id="chk" value="" /></td>
									<td>3</td>
									<td>监察</td>
									<td>长滩岛</td>
									<td>陈建国</td>
									<td>4</td>
									<td>定期</td>
									<td>奉贤区</td>

									<td>

										<a href="${contextPath}/jsp/seasInspection/海域海岛巡查/xcrwtj_sbdetail.html" class="tablelink">详情</a>
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td><input type="checkbox" name="chk" id="chk" value="" /></td>
									<td>4</td>
									<td>检查</td>
									<td>暗礁</td>
									<td>杨天帆</td>
									<td>3</td>
									<td>定期</td>
									<td>崇明县</td>

									<td>

										<a href="${contextPath}/jsp/seasInspection/海域海岛巡查/xcrwtj_sbdetail.html" class="tablelink">详情</a>
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td><input type="checkbox" name="chk" id="chk" value="" /></td>
									<td>5</td>
									<td>巡视</td>
									<td>海洋岛</td>
									<td>泱黎</td>
									<td>3</td>
									<td>定期</td>
									<td>金山区</td>

									<td>

										<a href="${contextPath}/jsp/seasInspection/海域海岛巡查/xcrwtj_sbdetail.html" class="tablelink">详情</a>
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td><input type="checkbox" name="chk" id="chk" value="" /></td>
									<td>6</td>
									<td>监察</td>
									<td>鸡骨礁</td>
									<td>徐天翔</td>
									<td>3</td>
									<td>定期</td>
									<td>金山区</td>

									<td>

										<a href="${contextPath}/jsp/seasInspection/海域海岛巡查/xcrwtj_sbdetail.html" class="tablelink">详情</a>
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td><input type="checkbox" name="chk" id="chk" value="" /></td>
									<td>7</td>
									<td>监察</td>
									<td>暗礁</td>
									<td>周宇浩</td>
									<td>3</td>
									<td>定期</td>
									<td>浦东新区</td>

									<td>

										<a href="${contextPath}/jsp/seasInspection/海域海岛巡查/xcrwtj_sbdetail.html" class="tablelink">详情</a>
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td><input type="checkbox" name="chk" id="chk" value="" /></td>
									<td>8</td>
									<td>巡航</td>
									<td>海洋岛</td>
									<td>黄天仁</td>
									<td>3</td>
									<td>不定期</td>
									<td>奉贤区</td>

									<td>

										<a href="${contextPath}/jsp/seasInspection/海域海岛巡查/xcrwtj_sbdetail.html" class="tablelink">详情</a>
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td><input type="checkbox" name="chk" id="chk" value="" /></td>
									<td>9</td>
									<td>监察</td>
									<td>鸡骨礁</td>
									<td>周秦天</td>
									<td>3</td>
									<td>定期</td>
									<td>宝山区</td>

									<td>

										<a href="${contextPath}/jsp/seasInspection/海域海岛巡查/xcrwtj_sbdetail.html" class="tablelink">详情</a>
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td><input type="checkbox" name="chk" id="chk" value="" /></td>
									<td>10</td>
									<td>巡视</td>
									<td>暗礁</td>
									<td>王天颖</td>
									<td>3</td>
									<td>定期</td>
									<td>崇明县</td>

									<td>

										<a href="${contextPath}/jsp/seasInspection/海域海岛巡查/xcrwtj_sbdetail.html" class="tablelink">详情</a>
									</td>
								</tr>
							</tbody>

						</table>
						<div class="pagin">
							<div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
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

					<!--=======-->
				</div>

			</div>

			<script type="text/javascript">
				$("#usual1 ul").idTabs();
			</script>

			<script type="text/javascript">
				$('.tablelist tbody tr:odd').addClass('odd');
			</script>

		</div>

		</div>

	</body>

</html>