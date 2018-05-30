<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
    	<script type="text/javascript">
        	function saveUpdateJsjcInfo(){
        		if(document.getElementById("thysyywHysydtHaxJsjc.haxid").value ==""){
        			alert("海岸线名称不允许为空！");
        			return false;
        		}
        		if(document.getElementById("jsjcrq").value ==""){
        			alert("监视监测日期不允许为空！");
        			return false;
        		}
        		if(document.getElementById("jsjcrxm").value ==""){
        			alert("监视监测人姓名不允许为空！");
        			return false;
        		}
        		
        		document.myForm.action="<%=basePath%>/dgiff/dgiff_saveUpdateJsjcInfo.do";
        		document.myForm.target="_self";
        		document.myForm.submit();
        	}
        	function goBack(){
        		document.myForm.action="<%=basePath%>/dgiff/dgiff_JsjcListView.do";
        		document.myForm.target="_self";
        		document.myForm.submit();
        	}
        </script>
	</head>
    <body>
        <form name="myForm" method="post">
        	<div class="place">
        		<span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
        		<ul class="placeul">
        			<li><a href="#">海域使用动态管理</a></li>
        			<li><a href="#">海岸线管理</a></li>
        			<li><a href="#">海岸线动态监视监测管理</a></li>
        		</ul>
        	</div>
        	<input name="thysyywHysydtHaxJsjc.id" id="thysyywHysydtHaxJsjc.id" value="${thysyywHysydtHaxJsjc.id}" type="hidden"/>
        	<input name="thysyywHysydtHaxJsjc.addtime" id="thysyywHysydtHaxJsjc.addtime" value="${thysyywHysydtHaxJsjc.addtime}" type="hidden"/>
        	<div class="formbody">
      			<div class="leftinfo1">
   				    <div class="listtitle"><img src="${contextPath}/images/ticon.png" width="20" height="20" />修改</div>
   					<table style="width:100%;" class="tablelist2" align="center">
						<tr>
							<td  style="background-color:#f5f8fa;" title="若找不到海岸线名称，请先在《海岸线基础信息管理》中新增海岸线。">海岸线名称：</td>
							<td colspan="3" title="若找不到海岸线名称，请先在《海岸线基础信息管理》中新增海岸线。">
								<select name="thysyywHysydtHaxJsjc.haxid" id="thysyywHysydtHaxJsjc.haxid" style="width:200px;">
									<c:forEach items="${thysyywHysydtHaxJcxxList}" var="r" varStatus="j">
										<option <c:if test="${thysyywHysydtHaxJsjc.haxid==r.id }">selected="selected"</c:if>  value="${r.id}">${r.name}</option>
									</c:forEach>
								</select>
								<font color="red">*</font>
							</td>
						</tr>
						<tr>
							<td width="20%" style="background-color:#f5f8fa;">海岸是否侵蚀：</td>
							<td width="20%">
								<input style="border:0;" name="thysyywHysydtHaxJsjc.sfqs" <c:if test="${thysyywHysydtHaxJsjc.sfqs=='是' }">checked="checked"</c:if> type="radio" value="是"/>是
								<input style="border:0;" name="thysyywHysydtHaxJsjc.sfqs" <c:if test="${thysyywHysydtHaxJsjc.sfqs=='否' }">checked="checked"</c:if> type="radio" value="否"/>否
							</td>
							<td width="20%" style="background-color:#f5f8fa;">侵蚀情况：</td>
							<td width="40%">
								<textarea name="thysyywHysydtHaxJsjc.qsqk" id="thysyywHysydtHaxJsjc.qsqk" rows="3" cols="35">${thysyywHysydtHaxJsjc.qsqk}</textarea>
							</td>
						</tr>
						<tr>
							<td width="20%" style="background-color:#f5f8fa;">海岸是否冲淤：</td>
							<td width="20%">
								<input style="border:0;" name="thysyywHysydtHaxJsjc.sfcy" <c:if test="${thysyywHysydtHaxJsjc.sfcy=='是' }">checked="checked"</c:if> type="radio" value="是"/>是
								<input style="border:0;" name="thysyywHysydtHaxJsjc.sfcy" <c:if test="${thysyywHysydtHaxJsjc.sfcy=='否' }">checked="checked"</c:if> type="radio" value="否"/>否
							</td>
							<td width="20%" style="background-color:#f5f8fa;">冲淤情况：</td>
							<td width="40%">
								<textarea name="thysyywHysydtHaxJsjc.cyqk" id="thysyywHysydtHaxJsjc.cyqk" rows="3" cols="35">${thysyywHysydtHaxJsjc.cyqk}</textarea>
							</td>
						</tr>
						<tr>
							<td width="20%" style="background-color:#f5f8fa;">海岸是否海水入侵：</td>
							<td width="20%">
								<input style="border:0;" name="thysyywHysydtHaxJsjc.sfhsrq" <c:if test="${thysyywHysydtHaxJsjc.sfhsrq=='是' }">checked="checked"</c:if> type="radio" value="是"/>是
								<input style="border:0;" name="thysyywHysydtHaxJsjc.sfhsrq" <c:if test="${thysyywHysydtHaxJsjc.sfhsrq=='否' }">checked="checked"</c:if> type="radio" value="否"/>否
							</td>
							<td width="20%" style="background-color:#f5f8fa;">海水入侵情况：</td>
							<td width="40%">
								<textarea name="thysyywHysydtHaxJsjc.hsrqqk" id="thysyywHysydtHaxJsjc.hsrqqk" rows="3" cols="35">${thysyywHysydtHaxJsjc.hsrqqk}</textarea>
							</td>
						</tr>
						<tr>
							<td width="20%" style="background-color:#f5f8fa;">海岸是否有蓝藻：</td>
							<td width="20%">
								<input style="border:0;" name="thysyywHysydtHaxJsjc.sfylz" <c:if test="${thysyywHysydtHaxJsjc.sfylz=='是' }">checked="checked"</c:if> type="radio" value="是"/>是
								<input style="border:0;" name="thysyywHysydtHaxJsjc.sfylz" <c:if test="${thysyywHysydtHaxJsjc.sfylz=='否' }">checked="checked"</c:if> type="radio" value="否"/>否
							</td>
							<td width="20%" style="background-color:#f5f8fa;">蓝藻情况：</td>
							<td width="40%">
								<textarea name="thysyywHysydtHaxJsjc.lzqk" id="thysyywHysydtHaxJsjc.lzqk" rows="3" cols="35">${thysyywHysydtHaxJsjc.lzqk}</textarea>
							</td>
						</tr>
						<tr>
							<td width="20%" style="background-color:#f5f8fa;">海岸是否富营养化：</td>
							<td width="20%">
								<input style="border:0;" name="thysyywHysydtHaxJsjc.sffyyh" <c:if test="${thysyywHysydtHaxJsjc.sffyyh=='是' }">checked="checked"</c:if> type="radio" value="是"/>是
								<input style="border:0;" name="thysyywHysydtHaxJsjc.sffyyh" <c:if test="${thysyywHysydtHaxJsjc.sffyyh=='否' }">checked="checked"</c:if> type="radio" value="否"/>否
							</td>
							<td width="20%" style="background-color:#f5f8fa;">富营养化情况：</td>
							<td width="40%">
								<textarea name="thysyywHysydtHaxJsjc.fyyhqk" id="thysyywHysydtHaxJsjc.fyyhqk" rows="3" cols="35">${thysyywHysydtHaxJsjc.fyyhqk}</textarea>
							</td>
						</tr>
						<tr>
							<td width="20%" style="background-color:#f5f8fa;">海岸线是否有纠纷：
							
							</td>
							<td width="20%">
								<input style="border:0;" name="thysyywHysydtHaxJsjc.sfyjf" type="radio" value="是" <c:if test="${thysyywHysydtHaxJsjc.sfyjf=='是' }">checked="checked"</c:if> />是
								<input style="border:0;" name="thysyywHysydtHaxJsjc.sfyjf" type="radio" value="否" <c:if test="${thysyywHysydtHaxJsjc.sfyjf=='否'}">checked="checked"</c:if> />否
							</td>
							<td width="20%" style="background-color:#f5f8fa;">纠纷情况：</td>
							<td width="40%">
								<textarea name="thysyywHysydtHaxJsjc.jfqk" id="thysyywHysydtHaxJsjc.jfqk" rows="3" cols="35">${thysyywHysydtHaxJsjc.jfqk}</textarea>
							</td>
						</tr>
						<tr>
							<td width="20%" style="background-color:#f5f8fa;">是否违法占用海岸线：</td>
							<td width="20%">
								<input style="border:0;" name="thysyywHysydtHaxJsjc.sfywfzyhaxqk" <c:if test="${thysyywHysydtHaxJsjc.sfywfzyhaxqk=='是' }">checked="checked"</c:if> type="radio" value="是"/>是
								<input style="border:0;" name="thysyywHysydtHaxJsjc.sfywfzyhaxqk" <c:if test="${thysyywHysydtHaxJsjc.sfywfzyhaxqk=='否' }">checked="checked"</c:if> type="radio" value="否"/>否
							</td>
							<td width="20%" style="background-color:#f5f8fa;">违法占用海岸线情况：</td>
							<td width="40%">
								<textarea name="thysyywHysydtHaxJsjc.wfzyhaxqk" id="thysyywHysydtHaxJsjc.wfzyhaxqk" rows="3" cols="35">${thysyywHysydtHaxJsjc.wfzyhaxqk}</textarea>
							</td>
						</tr>
						<tr>	
							<td style="background-color:#f5f8fa;">监视监测日期：</td>
							<td>
								<input name="thysyywHysydtHaxJsjc.jsjcrq" id="jsjcrq" onclick="WdatePicker()" readonly="readonly" type="text" value="${thysyywHysydtHaxJsjc.jsjcrq }" style="width:180px;" />
								<font color="red">*</font>
							</td>
							<td style="background-color:#f5f8fa;">监视监测人姓名：</td>
							<td>
								<input name="thysyywHysydtHaxJsjc.jsjcrxm" id="jsjcrxm" type="text" value="${thysyywHysydtHaxJsjc.jsjcrxm }" style="width:200px;" />
								<font color="red">*</font>
							</td>
						</tr>
						<tr>	
							<td style="background-color:#f5f8fa;">备注：</td>
							<td colspan="3">
								<textarea name="thysyywHysydtHaxJsjc.bz" id="thysyywHysydtHaxJsjc.bz" rows="3" cols="80" >${thysyywHysydtHaxJsjc.bz }</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="4" style="text-align:center;">
								<input name="save" type="button" class="scbtn" onclick="saveUpdateJsjcInfo()" value="保存"/>
								<input name="back" type="button" class="scbtn" onclick="goBack()" value="返回"/>
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