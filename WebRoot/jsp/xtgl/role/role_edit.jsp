<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>角色编辑</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="StyleSheet" href="${contextPath}/js/dtree/dtree.css" type="text/css" />
	<script type="text/javascript" src="${contextPath}/js/dtree/dtree.js"></script>
	<link type="text/css" rel="stylesheet" href="${contextPath}/js/formValidator/style/validator.css"></link>
	<script src="${contextPath}/js/formValidator/formValidator-4.0.1.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${contextPath}/js/formValidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
	
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
	<script type="text/javascript">
	


		$(document).ready(function(){

			$.formValidator.initConfig({formID:"roleAuthForm",alertMessage:false,onError:function(msg){alert(msg)}});	
			$("#roleAuthForm_role_roleName").formValidator({onShow:"",onFocus:"请输入2-12个字符",onCorrect:"该角色名可用"})
										   .inputValidator({min:2,max:12,onError:"你输入的角色名非法,请确认"})
										   .ajaxValidator({
											    type : "POST",
												url : "${contextPath}/role/role_checkRole.do?role.id="+$("#roleId").val(),
												datatype : "json",
												success : function(data){
														
										            if( data == "1" )
													{
										                return true;
													}
										            else
													{
										                return false;
													}
												},
												buttons: $("#button"),
												error: function(){alert("服务器没有返回数据，可能服务器忙，请重试");},
												onError : "该角色名不可用，请更换角色名",
												onWait : "正在对角色名进行合法性校验，请稍候..."
											});


				$(".dTreeNode").each(function(){
					//alert($(this).text());
					if($(this).text()!=='权限分配树') {
						var idValue;
						if($(this).find('a.node').length>0) {
							
							var node=$(this).find('input[name=idValue]:eq(0)');
							
							idValue=node.val();
							//alert("idValue="+idValue);
							//if(node.attr("alt")=="node"){
							//	node.after('<input type="checkbox" name="menuId" checked="checked" value="'+idValue+'"  />');
							//}else{
								node.after('<input type="checkbox" name="menuId"  value="'+idValue+'" />');
							//}
							//alert(node.attr("alt"));
							
							
						} else {
							
							var node=$(this).find('input[name=idValue]:eq(0)');
							
							idValue=node.val();
							
							//if(node.attr("alt")=="node"){
							//	node.after('<input type="checkbox" name="menuId" checked="checked" value="'+idValue+'"  />');
							//}else{
								node.after('<input type="checkbox" name="menuId"  value="'+idValue+'" />');
							//}
						}

						
					} else {
						
						$(this).append('<input type="checkbox" id="selectAll" title="是否全选"/>');
						
					}
				});

				init();



				$("#selectAll").click(function(){


						$("input[name=menuId]").each(function(){

							$(this).attr("checked",$("#selectAll").attr("checked"));


						});	
				});
						
				
			});


		function init(){
			$("input[name=menuId]").each(function(){

				 <c:forEach items="${roleMenuList}" var="menu">

		    		if($(this).val()=='${menu.id}'){
							$(this).attr("checked","checked");

			    		}
	   			    
	   			 </c:forEach>
					

			});


		} 
	


		function setAuth(){

			var ids="";
			
			$("input[name='menuId']:checked","#roleAuthForm").each(function(){
					ids+=$(this).val()+",";	

				});
			
			ids=ids.substring(0,ids.length-1);
				

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
	<li><a href="#">权限修改</a></li>
    </ul>
    </div>
  		
  		<br/>
  		
  
  		
	  	<s:form id="roleAuthForm" action="role/role_edit.do" >
	  		<s:hidden  name="ids"></s:hidden>
	  		
	  		
		   	<table class="search_tab">
		   		
		   		<tr>
		   			<td colspan="5" align="center">角色名 :
		   				
		   			<s:textfield name="role.roleName" cssClass="text"></s:textfield>
		   			<s:hidden name="role.id" id="roleId"></s:hidden>
		   					 
		   			</td>
		   			<td class="tip"><div id="roleAuthForm_role_roleNameTip"></div></td>
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

