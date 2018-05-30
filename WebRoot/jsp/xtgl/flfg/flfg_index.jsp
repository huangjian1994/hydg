<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

<title>法律法规</title>
<link href="${contextPath}/css/style_o.css" rel="stylesheet" type="text/css" />
</head>


<body>
	<div class="place">
		<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li>
				<a href="javascript:void(0)">系统管理</a>
			</li>
			<li>
				<a href="javascript:void(0)">海洋法律法规</a>
			</li>
		</ul>
	</div>
    <s:form name="seaLaw" namespace="/seaLaw" action="law_loadLawPage.do" method="post" >
	    <table class="filetable3">
		  	<tbody>
		   		<tr>
		   		    <td width="20%"></td>
		   			<td style="text-align:right" width="10%">法律法规：</td>
		   			<td style="text-align:left" width="20%"> <s:textfield name="seaLaw.lawName" cssStyle="width:200px"> </s:textfield></td>
		   			<td style="text-align:right" width="10%">摘要：</td>
		   			<td style="text-align:left" width="20%"><s:textfield name="seaLaw.lawAbstract" cssStyle="width:200px"></s:textfield>
		   			</td>
		   			<td width="25%"></td>
		   		</tr>
		   		<tr style="height:60px;">
		   		    <td></td>
		   			 <td colspan="2" style="text-align:right; height:30px;">
		   				<input type="submit" value="查询"  class="scbtn" />&nbsp;&nbsp;&nbsp;&nbsp;  
		   			 </td>
		   			 <td colspan="2"  style="text-align:left;height:30px;">
		   				&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="新增" onclick="addSeaLaw()" class="scbtn"   />
		   			</td>
		   			<td></td>
		   		</tr>
		   	</tbody>
	 	</table>
    </s:form>
  	<br/>
	
	
	<table class="tablelist23">
    	<thead>
	    	<tr>
		        <th width="5%">序号<i class="sort"><img src="${contextPath}/images/px.gif" /></i></th>
		        <th width="20%">法律法规名称</th>
		        <th width="20%">摘要</th>
		        <th width="15%">上传时间</th>
		        <th  width="10%">文号</th>
				<th  width="10%">操作</th>
	        </tr>
        </thead>
		
        <tbody>
        
        	<c:forEach items="${seaLaws}" var="law" varStatus="i">
        		<tr>
        			<td>${i.index + 1}</td>
        			 <td><a href="javascript:void(0)" onclick="loadLaw('${law.id}')" class="tablelink">${law.lawName }</a></td>
        			 <td>${law.lawAbstract }</td>
        			 <td>${law.addtime }</td>
        			 <td>${law.articleNum }</td>
        			 <td>
        			 	<a href="javascript:void(0)" onclick="downloadFile('${law.id}')" class="tablelink">下载</a>&nbsp;
						<a href="javascript:void(0)" onclick="delSeaLaw('${law.id}')" class="tablelink">删除</a>&nbsp;
						<a href="javascript:void(0)" onclick="editSeaLaw('${law.id}')" class="tablelink">修改</a>
        			 </td>
        		</tr>
        	</c:forEach>
        
        <tr>
        <%--<td>1</td>
        <td><a href="#" class="tablelink">2015年海域综合管理工作要点</a></td>
        <td>2015年海域综合管理工作要点</td>
        <td>2015-02-10 15:29:06</td>
        <td>SH2015001</td>
		<td><a href="#" class="tablelink">打开</a>&nbsp;
		<a href="#" class="tablelink">删除</a>&nbsp;
		<a href="#" class="tablelink">修改</a>
		</td>
        </tr> 
        --%>
        </tbody>
    </table>
    <br/>
	<div align="center">
    	${pageBean}
    </div>
    <%--
    <div class="pagin">
    	<div class="message">共<i class="blue">4</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem current"><a href="javascript:;">1</a></li>
        <li class="paginItem" onclick=""><a href="javascript:;">2</a></li>
        <li class="paginItem"><a href="javascript:;">3</a></li>
        <li class="paginItem"><a href="javascript:;">4</a></li>
        <li class="paginItem"><a href="javascript:;">5</a></li>
        <li class="paginItem more"><a href="javascript:;">...</a></li>
        <li class="paginItem"><a href="javascript:;">10</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>
    --%>
    <script type="text/javascript">
	    $(function(){
			$('.tablelist23 tbody tr:odd').addClass('odd');
	    })
    
    	function downloadFile(id){
	    	location = "${contextPath}/seaLaw/law_downloadFile.do?seaLaw.id=" + id;
	    }
	    function delSeaLaw(id){
			
			var r = confirm("请确认是否删除？"); 
			if ( r ) {
			   $.ajax({
			    	type: "post",
					dataType:"text",
					url: "${contextPath}/seaLaw/law_removeSeaLaw.do",
					data: {"seaLaw.id":id},
					success: function(result){
						if ( result == "1" ) {
							alert("删除成功！");
							location.reload();
						} else {
							alert("删除失败！")
						}
					}
				})
			}
	    }

		function addSeaLaw(){
			location = "${contextPath}/seaLaw/law_toAddSeaLaw.do";
		}
		
		function editSeaLaw(id){
			location = "${contextPath}/seaLaw/law_toEditSeaLaw.do?seaLaw.id=" + id;
		}

		function loadLaw(id){
			location = "${contextPath}/seaLaw/law_loadLaw.do?operate=0&&seaLaw.id=" + id;
		}

	</script>

</body>

</html>
