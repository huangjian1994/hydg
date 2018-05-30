<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户修改</title>
    
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
	<link type="text/css" rel="stylesheet" href="${contextPath}/js/formValidator/style/validator.css"></link>
	<script src="${contextPath}/js/formValidator/formValidator-4.0.1.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${contextPath}/js/formValidator/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
	
	
	<script type="text/javascript">


	$(document).ready(function(){


		$.formValidator.initConfig({formID:"userAddForm",alertMessage:false,onError:function(msg){alert(msg)}});	
		$("#userAddForm_user_userName").formValidator({onShow:"请输入用户名",onFocus:"请输入2-12个字符",onCorrect:"该用户名可以注册"})
									   .inputValidator({min:2,max:12,onError:"输入的用户名非法,请确认"})
									   .ajaxValidator({
										    type : "POST",
											url : "${contextPath}/user/user_checkUserName.do",
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
											onError : "该用户名不可用，请更换用户名",
											onWait : "正在对用户名进行合法性校验，请稍候..."
										});
		
		$("#userAddForm_user_password").formValidator({onShow:"请输入密码",onFocus:"请输入4-8个字符",onCorrect:"密码正确"}).inputValidator({min:1,onError:"密码不能为空"});
		$("#userAddForm_user_name").formValidator({onShow:"请输入真实姓名",onCorrect:"输入正确"}).inputValidator({min:1,empty:{leftempty:false,rightempty:false,emptyerror:"姓名两边不能有空符号"},onError:"姓名不能为空,请确认"})
		$("#userAddForm_user_userId").formValidator({onShow:"请输入身份证号",onFocus:"请输入15或18位的身份证号",onCorrect:"身份证号正确"}).inputValidator({min:1,empty:{leftempty:false,rightempty:false,emptyerror:"身份证号两边不能有空格"},onError:"身份证号不能为空,请确认"}).functionValidator({fun:isCardID});
		$("#userAddForm_user_department").formValidator({onShow:"请输入所属部门",onFocus:"请输入4-20个字符",onCorrect:"输入部门"}).inputValidator({min:1,empty:{leftempty:false,rightempty:false,emptyerror:"部门两边不能有空格"},onError:"所属部门不能为空,请确认"})		
		
		//$("#userAddForm_user_email").formValidator({onShow:"请输入邮箱",onFocus:"请输入常用的邮箱地址",onCorrect:"邮箱输入正确",defaultValue:"@",forcevalid:true}).inputValidator({min:6,max:100,onError:"你输入的邮箱长度非法,请确认"}).regexValidator({regExp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",onError:"输入的邮箱格式不正确"});			
		

		
	

		$("#role").change(function(){
				
				var txt=$("option:selected","#role").text();
				
				setShowStyle(txt);
				
				

		});
	});


	function setShowStyle(txt){


		if(txt=="专家"){
			
			$("#expertsTab").css("display","block");
			$("#userAddForm_user_edubackground").formValidator({defaultValue:"博士"}).inputValidator({min:1,onError: "请选择学历"});
			$("#userAddForm_user_specialty").formValidator({onShow:"请输专业名称",onFocus:"请输入4-20个字符",onCorrect:"输入正确"}).inputValidator({min:1,onError:"专业不能为空"});
			$("#userAddForm_user_position").formValidator({onShow:"请输入职称",onFocus:"请输入4-20个字符",onCorrect:"职称正确"}).inputValidator({min:1,empty:{leftempty:false,rightempty:false,emptyerror:"职称两边不能有空格"},onError:"职称不能为空,请确认"});
			$("#userAddForm_user_professionalArea").formValidator({onShow:"请输入所属领域",onFocus:"请输入4-20个字符",onCorrect:"输入正确"}).inputValidator({min:1,empty:{leftempty:false,rightempty:false,emptyerror:"所属领域两边不能有空格"},onError:"所属领域不能为空,请确认"});		
			
		}else{
			
			//alert($("input","#expertsTab").size());
			
			$("input","#expertsTab").each(function(){

					$(this).val("");

			});
			$("option:eq(0)","#userAddForm_user_edubackground").attr("selected","selected");
			$("#expertsTab").css("display","none");
			$("#userAddForm_user_specialty").formValidator({onShow:""});
			$("#userAddForm_user_position").formValidator({onShow:""});
			$("#userAddForm_user_professionalArea").formValidator({onShow:""});
					
			
		}


	}


	function addUser(){
		
		
		$("#userAddForm").submit();
		
	}

</script>

  </head>
  
  <body>
  
    <div class="place">
    <span><img src="${contextPath}/images/ico01.png" width="22" height="22" />位置：</span>
    <ul class="placeul">
    <li><a href="#">系统管理</a></li>
    <li><a href="#">用户管理</a></li>
	<li><a href="#">用户新增</a></li>
    </ul>
    </div>
    <br/>
    

  	<s:form id="userAddForm" action="/user/user_add.do" onsubmit="return validate()" >
  		<input type="hidden" name="roleIds"  id="roleIds" />
  		<table class="edit_tab">
  			
  			<tr>
  				<td class="label" >用户名</td>
  				<td ><s:textfield name="user.userName" cssClass="text" ></s:textfield></td>
  				<td class="tip"><div  id="userAddForm_user_userNameTip" ></div></td>
  			</tr>
  			<tr>
  				<td class="label">密码 </td>
  				<td ><s:textfield name="user.password" cssClass="text" ></s:textfield></td>
  				<td class="tip"><div  id="userAddForm_user_passwordTip" ></div></td>
  			</tr>
  			
  			<tr>
  				<td class="label">姓名</td>
  				<td ><s:textfield name="user.name"  cssClass="text"/></td>
  				<td class="tip"><div  id="userAddForm_user_nameTip" ></div></td>
  			</tr>
  			<tr>
  				<td class="label">性别</td>
  				<td>
  				<s:select name="user.gender" list="#{'男 ':'男','女':'女'}"  cssClass="text"></s:select>
  				</td>	
  				<td class="tip"><div  id="userAddForm_user_nameTip" ></div></td>
  			</tr>
  			
  			
  			<tr>
  				<td  class="label">身份证号</td>
  				<td ><s:textfield name="user.userId"  cssClass="text"/></td>
  				<td class="tip"><div  id="userAddForm_user_userIdTip" ></div></td>
  			</tr>
  			<tr>
  				<td  class="label">公安警号</td>
  				<td ><s:textfield name="user.policeNo"  cssClass="text"/></td>
  				<td class="tip"><div  id="userAddForm_user_policeNoTip" ></div></td>
  			</tr>
  			
  			<tr>
  				<td  class="label">所属单位</td>
  				<td >
  					<s:textfield name="user.organization"  cssClass="text" ></s:textfield>
  					<%--<s:select id="organizationId" name="user.organizationId" list="#{'':'-请选择-','1':'科技处','2':'警务处'}"  cssClass="text" onchange="setValue()"></s:select>
  					
  					<s:hidden id="organization" name="user.organization"></s:hidden>
  					--%>
  				</td>
  				<td class="tip"><div  id="userAddForm_user_organizationTip"  ></div></td>
  			</tr>
  			
  			<tr>
  				<td  class="label">单位编码</td>
  				<td >
  					<s:textfield name="user.organizationId"  cssClass="text"  ></s:textfield>
  				</td>
  				<td class="tip"><div  id="userAddForm_user_organizationIdTip" ></div></td>
  			</tr>
  			
  			<tr>
  				<td  class="label">所属部门</td>
  				<td >
  					<s:textfield name="user.department"  cssClass="text" ></s:textfield>
  					<%--<s:select id="departmentId" name="user.departmentId" list="#{'':'-请选择-','信息办':'信息办','标准组':'标准组'}"  cssClass="text"></s:select>
  					<s:hidden id="department" name="user.department"></s:hidden>
  					--%>
  				</td>
  				<td class="tip"><div  id="userAddForm_user_departmentTip" ></div></td>
  			</tr>
  			<tr>
  				<td  class="label">部门编码</td>
  				<td >
  					<s:textfield name="user.departmentId"  cssClass="text" ></s:textfield>
  					<%--<s:select id="departmentId" name="user.departmentId" list="#{'':'-请选择-','信息办':'信息办','标准组':'标准组'}"  cssClass="text"></s:select>
  					<s:hidden id="department" name="user.department"></s:hidden>
  					--%>
  				</td>
  				<td class="tip"><div  id="userAddForm_user_departmentIdTip" ></div></td>
  			</tr>
  			
  			<tr>
  				<td  class="label">手机号码</td>
  				<td  ><s:textfield name="user.mphone" cssClass="text" ></s:textfield></td>
  				<td class="tip"><div  id="userAddForm_user_mphoneTip" ></div></td>
  			</tr>
  			
  			<tr>
  				<td  class="label">邮箱地址</td>
  				<td ><s:textfield name="user.email"  cssClass="text"  /></td> 
  				<td class="tip"><div  id="userAddForm_user_emailTip" ></div></td>
  			</tr>
  			
  			
  			
  			<tr>
  				<td  class="label"> 地址信息</td>
  				<td ><s:textfield name="user.address"  cssClass="text"/></td> 
  				<td class="tip"><div  id="userAddForm_user_addressTip" ></div></td>
  			</tr>
  			
  			<tr>
  			
  				<td  class="label" >角色设置</td>
  				<td >
  					<s:select id="role"  name="user.role.id" list="roleList" listKey="id" listValue="roleName" cssClass="text" ></s:select>
  				</td>
  				
  				<td  class="tip">
  					<div id="userAddForm_user_role_idTip" ></div>
  				</td>
  				
  			</tr>
  		
			
		   </table>
  		
  		<br/>
		<table class="edit_tab" id="expertsTab" style="display: none">
			<tr>
  				
  				<td  class="label"  >学历</td>
  				<td class="content">
  					<s:select name="user.edubackground" list="#{'':'请选择 ','学士':'学士','硕士':'硕士','博士':'博士','研究生':'研究生','教授':'教授'}"  cssClass="text"></s:select>
  					
  				</td>
  				
  				<td  class="tip">
  					<div id="userAddForm_user_edubackgroundTip" ></div>
  				</td>
  				
  			</tr>
  			
  			<tr>
  				<td  class="label" >专业</td>
  				<td class="content">
  					<s:textfield name="user.specialty"  cssClass="text"></s:textfield>
  				</td>
  				
  				<td  class="tip">
  					<div id="userAddForm_user_specialtyTip" ></div>
  				</td>
  				
  			</tr>
  			
  			<tr>
  				<td  class="label" >职称</td>
  				<td class="content">
  					<s:textfield name="user.position"  cssClass="text"></s:textfield>
  				</td>
  					
  				<td  class="tip">
  					<div id="userAddForm_user_positionTip" ></div>
  				</td>
  				
  			</tr>
  			
  			<tr>
  				
  				<td  class="label" >所属领域</td>
  				<td class="content">
  					<s:textfield name="user.professionalArea"  cssClass="text"></s:textfield>
  				</td>
  				
  				<td  class="tip">
  					<div id="userAddForm_user_professionalAreaTip" ></div>
  				</td>
  				
  			</tr>
		</table>
		
  		<br/>
  		<table class="edit_tab" >
  		
  			<tr style="height: 60px">
  				<td colspan="3" align="center" style="border:0px solid white">
	  				<input type="button" id="button" value="提交" class="btn"   onclick="addUser()" /> &nbsp;&nbsp;&nbsp;&nbsp;
	  				<input type="reset" value="重置"  class="btn"  />&nbsp;&nbsp;&nbsp;&nbsp;
	  				<input type="button" value="取消" class="btn" onclick="window.location.href='<%=basePath%>/user/user_list.do'"/>
  				</td>
  			</tr>
  		</table>
   	</s:form>
   	
   	<br/>
   	
  
  </body>
</html>
