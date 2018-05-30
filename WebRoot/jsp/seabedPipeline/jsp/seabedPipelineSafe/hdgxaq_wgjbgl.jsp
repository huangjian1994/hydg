<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java"  pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>违规举报管理</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js" ></script>
        <script type="text/javascript" src="${contextPath}/js/select-ui.min.js" ></script>

		<script type="text/javascript">

		</script>
	</head>

	<body>

		<div class="place">
			<span><img src="${contextPath}/images/seabedPipeline/ico01.png" width="22" height="22"  alt="位置"/>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海底管线安全</a>
				</li>
				<li>
					<a href="#">违规举报管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">
			<s:form name="zon" namespace="/zon"  method="post" >
			<div class="leftinfo1">
				<div class="listtitle3"><img src="${contextPath}/images/seabedPipeline/ico06.png" width="25" height="25"  alt=""/>条件查询</div>
				<table width="100%" align="center" style="text-align:center;">
					<tr>
						<td align="right">违规船舶类型：</td>
						<td align="left">
							<select name="sbm" id="ssbm" style="width:180px;height:25px;">
								<option value="">-请选择-</option>
								<option value="定期" selected="selected">工程作业船</option>
								<option value="不定期">非法取砂船舶</option>
							</select>
						</td>
						<td align="right">违规日期：</td>
						<td align="left">
                            <label>
                            <input name="" id="wgrq" type="text" class="dfinput1" style="width:180px;height:25px;"/>
                            </label>
                        </td>
					</tr>

					<tr>
						<td colspan="6">
							<input name="" type="button" class="scbtn1" value="查询" />
							<input name="" type="reset" class="scbtn1" value="重置" />
						</td>
					</tr>
				</table>
			</div>
			</s:form>

			<br />
			<div class="tools">
				<ul class="toolbar">
					<li>
						<a href="${contextPath}/jsp/seabedPipeline/jsp/seabedPipelineSafe/wgjbgl_add.jsp">
                            <span><img src="${contextPath}/images/seabedPipeline/t01.png" alt="新增"/></span>新增</a>
					</li>
					<li>
						<a href="${contextPath}/jsp/seabedPipeline/jsp/seabedPipelineSafe/wgjbgl_uptate.jsp">
                            <span><img src="${contextPath}/images/seabedPipeline/t02.png" alt="修改" /></span>修改</a>
					</li>
				</ul>
			</div>
			<table class="tablelist">

                <thead>
                <tr>
                    <th>船名</th>
                    <th>违规船舶类型</th>
                    <th>违规原因</th>
                    <th>违规地点</th>
                    <th>违规日期</th>
                    <th>巡查人</th>
                    <th>后续处理</th>
                    <th>操作</th>
                </tr>
                </thead>
				<tbody>
					<tr>
						<td>bk322</td>
						<td>工程作业船</td>
						<td>违规停靠</td>
						<td>地点2</td>
						<td>2015-5-9</td>
						<td>李明</td>
						<td>待处理</td>
						<td>
							<a href="#" class="tablelink">删除</a> &nbsp;&nbsp;&nbsp;&nbsp;
							<a href="${contextPath}/jsp/seabedPipeline/jsp/seabedPipelineSafe/wgjbgl_detail.jsp" class="tablelink">详情</a>
						</td>
					</tr>
				</tbody>

			</table>
		</div>

		<script type="text/javascript">
			$("#usual1").find("ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

    </body>

</html>