<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>权限新增</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<style type="text/css">
	
		*{font-size:10pt;font-family:'微软雅黑';margin:0;padding:0;}
		*{margin:0px;padding:0px}
		
		.position_div{color:#18549A;width:700px;height:28px;background-image: url('${contextPath}/images/postion_back.png')}
	.main_div{width:680px;height:auto;margin-left:10px}
	table{border-collapse:collapse;border:0px solid #b5bfc4}
	td{border:0px solid #b5bfc4;}
	.search_tab{width:100%; height:60px;}  
	.search_tab td{border:1px solid #b5bfc4;text-align:center;}
	.list_tab{width:100%;height:auto;}
	.btn{width:45px;height: 25px;}
		
	    .place{height:40px; background:url(${contextPath}/images/righttop.gif) repeat-x;}
        .place span{line-height:40px; font-weight:bold;float:left; margin-left:12px;}
	    .placeul li{float:left; line-height:40px; padding-left:7px; padding-right:12px; background:url(../images/rlist.gif) no-repeat right;}
        .placeul li:last-child{background:none;}
        a,a:focus{text-decoration:none;color:#000;outline:none;blr:expression(this.onFocus=this.blur());}
        a:hover{color:#00a4ac;text-decoration:none;}
	</style>
	<link rel="StyleSheet" href="${contextPath}/js/dtree/dtree.css" type="text/css" />
	<script type="text/javascript" src="${contextPath}/js/dtree/dtree.js"></script>
	
	<script type="text/javascript">
	


		$(document).ready(function(){

			//alert("nihao");
					
				//添加checkbox
				$(".dTreeNode").each(function(){
					//alert($(this).text());
					if($(this).text()!=='权限分配树') {
						var idValue;
						if($(this).find('a.node').length>0) {
							
							var node=$(this).find('input[name=idValue]:eq(0)');
							
							idValue=node.val();
							
							//if(node.attr("alt")=="node"){
							//	node.after('<input type="checkbox" name="menuId" checked="checked" value="'+idValue+'" style="display:none" />');
							//}else{
								node.after('<input type="checkbox" name="menuId"  value="'+idValue+'" />');
							//}
							//alert(node.attr("alt"));
							
							
						} else {
							
							var node=$(this).find('input[name=idValue]:eq(0)');
							
							idValue=node.val();
							
							//if(node.attr("alt")=="node"){
							//	node.after('<input type="checkbox" name="menuId" checked="checked" value="'+idValue+'" style="display:none" />');
							//}else{
								node.after('<input type="checkbox" name="menuId"  value="'+idValue+'" />');
							//}
						}
					} else {
						
						$(this).append('<input type="checkbox" id="selectAll" title="是否全选"/>');
						
					}
				});


				//是否全选
				$("#selectAll").click(function(){


						$("input[name=menuId]").each(function(){

							$(this).attr("checked",$("#selectAll").attr("checked"));


						});	
				});
						
				
			});

	

		
		function setAuth(){

			var ids="";
			
			$("input[name='menuId']:checked","#roleAuthForm").each(function(){
					ids+=$(this).val()+",";	

				});
			
			ids=ids.substring(0,ids.length-1);

			//alert("ids===="+ids);


			//return ;
				

			$("#roleAuthForm_ids").val(ids);
			

			$("#roleAuthForm").submit();
		}

		
	
	</script>

</head>
<body>

	<div class="place">
    <span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
    <ul class="placeul">
    <li><a href="#">系统管理</a></li>
    <li><a href="#">权限管理</a></li>
	<li><a href="#">权限新增</a></li>
    </ul>
    </div>
    
    
	
    
    <s:form id="roleAuthForm" action="role/role_add.do" >
	  			<s:hidden  name="ids"></s:hidden>
		  		<table class="search_tab">
		   		<tr>
		   			<td colspan="2" align="center">角色名 :${role.roleName}
		   				
		   			<s:hidden name="role.roleName"></s:hidden>
		   			<s:hidden name="role.description"></s:hidden> 
		   			</td>
		   		</tr>
		   		</table>
		   		<br/>
		   	 <table class="list_tab">
		   		
	   			<tr>
	   				<td width="300px"></td>
	   				<td>
	   					<div class="dtree">
			
							<p><a href="javascript: d.openAll();">展开</a> | <a href="javascript: d.closeAll();">关闭</a></p>
						
							<script type="text/javascript">
								<!--

								d = new dTree('d',"${contextPath}/js/dtree/");
				
								d.add(0,-1,'权限分配树');
				
								<c:forEach items="${menuList}" var="menu">
									
									var pid;
									var menuName="${menu.menuName}";
									
									if(jQuery.trim('${menu.parent.id}')) {
										pid = '${menu.parent.id}';
										menuName=menuName+"<input type='hidden' name='idValue' value='${menu.id}' alt='leaf'/>";
									}else{
										pid = '${menu.parent.id}';
										menuName=menuName+"<input type='hidden' name='idValue' value='${menu.id}' alt='node'/>";

										}
									
									d.add('${menu.id}',pid,menuName,'','${menu.menuName}','');
				
								</c:forEach>
								
								document.write(d);
						
								//-->
							</script>
			
						</div>
			
					</td>
			</tr>
		  
	   		<tr height="100px">
	   			<td width="300px"></td>
		   		<td>
		   			<input type="button" value="提交" onclick="setAuth()" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;
		   			<input type="button" value="取消" onclick="window.location.href='<%=basePath%>/role/role_list.do'" class="btn" />
		   		</td>
	   		</tr>
	   	</table>
	   	</s:form>
	
	
    
    
   

</body>

</html>
