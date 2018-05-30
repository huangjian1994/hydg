<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>菜单编辑</title>
     <%response.setHeader("Pragma","cache");response.setHeader("Cache-Control","cache");response.setDateHeader("Expires",10);%>
	<meta http-equiv="pragma" content="cache">
	<meta http-equiv="cache-control" content="cache">
	<meta http-equiv="expires" content="10">    
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
	<link href="${contextPath}/css/style_tt.css" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="${contextPath}/js/formValidator/style/validator.css"></link>
	<script src="${contextPath}/js/formValidator/formValidator-4.0.1.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${contextPath}/js/formValidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
	
	
	<script type="text/javascript">
$(document).ready(function(){

		
		$.formValidator.initConfig({formID:"menuEidtForm",alertMessage:false,onError:function(msg){alert(msg)}});	

		$("#menuEidtForm_menu_menuName").formValidator({onShow:"",onFocus:"请输入2-10个汉字",onCorrect:"该菜单名可用"})
									   .inputValidator({min:4,max:20,onError:"你输入的菜单名非法,请确认"})
									   .ajaxValidator({
										   type : "POST",
											url : "${contextPath}/menu/menu_checkMenu.do?menu.id="+$("#menuId").val(),
											datatype : "json",
											success : function(data){
								
												//alert(data);
													
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
											onError : "该菜单名不可用，请更换菜单名",
											onWait : "正在对菜单名进行合法性校验，请稍候..."
										});
		
		$("#menuEidtForm_menu_code").formValidator({onShow:"",onFocus:"请输入4-10个字符",onCorrect:"菜单编码正确"})
									.inputValidator({min:1,onError:"菜单编码不能为空"})
									.ajaxValidator({
									    type : "post",
										url : "${contextPath}/menu/menu_checkMenu.do?menu.id="+$("#menuId").val(),
										datatype : "json",
										success : function(data){

											//alert("data=="+data);
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
										onError : "该菜单编码不可用，请更换菜单编码",
										onWait : "正在对菜单编码进行合法性校验，请稍候..."
								});
		
		$("#menuAddForm_menu_resourceURL").formValidator({onShow:"请输入资源路径",onCorrect:"输入正确"}).inputValidator({min:1,empty:{leftempty:false,rightempty:false,emptyerror:"资源路径两边不能有空符号"},onError:"资源路径不能为空,请确认"});
		

		 var pid="${menu.parent.id}";
		 
		 
		 getParent(pid);

		 //alert(pid);

		});

	 function getParent(pid){
		  
		  
		    $("option","#menuEidtForm_menu_parent_id").remove();
		  
			var level=$("option:selected","#menuEidtForm_menu_menuLevel").val();
			
			if(level=="")
				
			return;
			
			//alert("菜单级别--"+level);
			level=level-1;
			
		  $.ajax({
		  		
			   type: "post",
			   dataType:"json",
			   url: "${contextPath}/menu/menu_getPatents.do",
			   data: "menu.menuLevel="+level,
			   success: function(d){
			    	for(var i=0;i<d.length;i++){
				    		if(pid&&d[i].id==pid){
				    			 $("<option selected='selected' value= '"+d[i].id+"'>"+d[i].menuName+"</option>").appendTo("#menuEidtForm_menu_parent_id");
					    	}else{

					    		 $("<option  value= '"+d[i].id+"'>"+d[i].menuName+"</option>").appendTo("#menuEidtForm_menu_parent_id");
						    }
			    		 
			    	}
			   
			   }
			});
		  
	  }
					
	</script>
	
	
  </head>
  
  <body>
  		
	<div class="place">
    <span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
    <ul class="placeul">
    <li>系统管理</li>
    <li>菜单管理</li>
    <li>菜单修改</li>
    </ul>
    </div>
  			<s:form id="menuEidtForm" action="menu_edit" namespace="/menu">
	  		<s:hidden name="menu.id" id="menuId"></s:hidden>
	  		<s:hidden name="menu.orderIndex"></s:hidden>
	  		<table  class="edit_tab">
	  			<tr>
	  				<td class="label">菜单名称</td>
	  				<td> <s:textfield name="menu.menuName"  cssClass="text"  ></s:textfield></td>
	  				<td class="tip"><div id="menuEidtForm_menu_menuNameTip"></div></td>
	  			</tr>
	  			<tr>
	  				<td  class="label">菜单编码 </td>
	  				<td><s:textfield name="menu.code" cssClass="text" ></s:textfield></td>
	  				<td class="tip"><div id="menuEidtForm_menu_codeTip"></div></td>
	  			</tr>
	  			<tr>
	  				<td  class="label">资源路径 </td>
	  				<td><s:textfield name="menu.resourceURL" cssClass="text"  ></s:textfield></td>
	  				<td class="tip"><div id="menuEidtForm_menu_resourceURLTip"></div></td>
	  			</tr>
	  			<tr>
	  				<td class="label">菜单级别</td>
	  				<td> <s:select  name="menu.menuLevel" list="#{'1':'一级', '2':'二级','3':'三级'}" cssClass="text"  onchange="getParent()"></s:select></td>
	  				<td class="tip"></td>
	  			</tr>
	
	
	  			<tr>
	  				<td class="label">菜单父节点</td><td>
	  					<select name="menu.parent.id" id="menuEidtForm_menu_parent_id"  class="text">
  						
  						</select>
	  				</td>
	  				<td class="tip"></td>
	  			</tr>
	  			
	  			<tr>
	  				<td colspan="3" align="center">
		  				<input type="submit" value="修改"  />&nbsp;&nbsp;&nbsp;&nbsp;
		  				<input type="button" value="取消" onclick="window.location.href='<%=basePath%>/menu/menu_list.do'"  />
	  				</td>
	  			</tr>
	  		</table>	
	   	</s:form>

		   	<br/>
	<div align="center">
    	${pageBean}
    </div>
    
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
   		
  </body>
</html>
