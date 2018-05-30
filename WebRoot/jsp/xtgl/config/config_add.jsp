<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>字典管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<style type="text/css">
	
		*{font-size:10pt;font-family:'微软雅黑';margin:0;padding:0;}
		*{margin:0px;padding:0px}
		
		table{border-collapse:collapse;border:1px solid #b5bfc4;}
		tr{height:40px}
		td{text-align:center;border:1px solid #b5bfc4}
		.position_div{color:#18549A;width:700px;height:28px;background-image: url('${contextPath}/images/postion_back.png')}
		.main_div{width:680px;margin-left:10px;}
		.edit_tab{width:100%;}
		.edit_tab .label{text-align:right;width:100px;padding-right:50px;background-color:#e8edef}
		.text{width:200px;background-color: white;height:24px;border: 1px solid #9BBAD6 }
		.edit_tab .tip{text-align:left;border-left:1px solid white;width:200px;}
		.btn{width:45px;height: 25px;}
		
	    .place{height:40px; background:url(${contextPath}/images/righttop.gif) repeat-x;}
        .place span{line-height:40px; font-weight:bold;float:left; margin-left:12px;}
	    .placeul li{float:left; line-height:40px; padding-left:7px; padding-right:12px; background:url(${contextPath}/images/rlist.gif) no-repeat right;}
        .placeul li:last-child{background:none;}
        a,a:focus{text-decoration:none;color:#000;outline:none;blr:expression(this.onFocus=this.blur());}
        a:hover{color:#00a4ac;text-decoration:none;}
	</style>


	<script type="text/javascript">
	
		function addKey(){
		
		    if (document.getElementById("key").value == "") {
				alert("字典键名称不允许为空");
			    return false;
			}
			if (document.getElementById("value").value == "") {
				alert("字典值不允许为空");
			    return false;
			}
			
			document.configAddForm.action="${contextPath}/config/config_addKey.do";
			document.configAddForm.target="_self";
			document.configAddForm.submit();
			//$("#configAddForm").submit();
            
		}

		
	</script>
  </head>
  
   <body>
  	
	<div class="place">
    <span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
    <ul class="placeul">
    <li><a href="#">系统管理</a></li>
    <li><a href="#">字典管理</a></li>
	<li><a href="#">字典新增</a></li>
    </ul>
    </div>
    <br/>

  	<s:form id="configAddForm" action="/config/config_addKey.do" >
	   <table class="edit_tab">
  			
	   		<tr>
	   			<td class="label">字典键名称 </td>
	   			<td><s:textfield name="dictionary.key" cssClass="text" id="key"></s:textfield></td>
	   			<td class="tip"><div id="roleAddForm_role_roleNameTip"></div></td>
	   		</tr>
	   		<tr>
	   			<td class="label">字典键值</td>
	   			<td><s:textfield name="dictionary.value" cssClass="text" id="value"></s:textfield></td>
	   			<td class="tip"></td>     
	   		</tr>
	   		<tr>
	   			<td class="label">代码</td>
	   			<td><s:textfield name="dictionary.dm" cssClass="text" id="dm"></s:textfield></td>
	   			<td class="tip"></td>     
	   		</tr>
	   		<tr>
	   			<td class="label">别名</td>
	   			<td><s:textfield name="dictionary.bm" cssClass="text" id="bm"></s:textfield></td>
	   			<td class="tip"></td>     
	   		</tr>
	   		<tr>
	   			<td class="label">系数</td>
	   			<td><s:textfield name="dictionary.xs" cssClass="text" id="xs"></s:textfield></td>
	   			<td class="tip"></td>     
	   		</tr>
	   		<tr>
  				<td colspan="3" align="center">
  				 <input type="button" name="add" value="提交" onclick="addKey()" class="btn" />	&nbsp;&nbsp;&nbsp;&nbsp; 
  				 <input type="reset" value="重置" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;
  				 <input type="button" value="取消" onclick="window.location.href='<%=basePath%>/config/config_list.do'" class="btn" />
  			</td>
  			</tr>
	   	</table>
   	</s:form>
   	
  </body>
</html>

