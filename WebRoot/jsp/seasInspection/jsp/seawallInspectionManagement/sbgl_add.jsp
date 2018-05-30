<!DOCTYPE html PUBLIC"-/W3C/DTD XHTML 1.0 Transitional/EN"
     "http:/www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*,com.htcf.code.Consts" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海域海岛巡查</title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
        <div class="place">
			<span><img src="${contextPath}/images/seasInspection/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海塘巡查管理</a>
				</li>
				<li>
					<a href="#">采集上报管理</a>
				</li>
			</ul>
		</div>

		<div class="formbody">			
    		<s:form id="sprForm" method="post" action="swPatorl_submitSpr.do" namespace="/seaPatorl" enctype="multipart/form-data">
    			<s:hidden name="op" id="op"></s:hidden>
    			<s:hidden name="spr.id"></s:hidden>
    			<s:hidden name="spr.addtime"></s:hidden>
    			<s:hidden name="spr.addusername"></s:hidden>
    			<s:hidden name="spr.adduserid"></s:hidden>
				<table width="100%" class="tablelist2" align="center">
					<col width="15%"></col>
					<col width="35%"></col>
					<col width="15%"></col>
					<col width="35%"></col>
					<th colspan="4" style="text-align:center;">巡查信息上报</th>
					<tr>
						<td style="background-color:#e8edef;">问题类别：</td>
						<td colspan="3">
							<s:select name="spr.stEsclass" list="#{'':'-请选择-','1':'重点围填海在建项目地面监视监测','2':'疑点疑区监视监测'}" cssClass="scinput"  cssStyle="width:82%;height:25px;"></s:select>
						</td>
					</tr>
					<tr>
						<td style="background-color:#e8edef;">巡查员：</td>
						<td id="stPatrolPersonTd" style="position:relative">
							<s:hidden name="spr.stPatrolPersonId" id="stPatrolPersonId"></s:hidden>
							<s:textfield onclick="$('#userCheckbox').toggle()" name="spr.stPatrolPerson" id="stPatrolPerson" cssClass="scinput" cssStyle="width:53%;"></s:textfield>
							<ul id='userCheckbox' style='border-radius:5px;display:none;position:absolute;top:31px;left:11px;background-color:white;width:53%;border-left:1px solid #efefef;border-right:1px solid #efefef;border-bottom:1px solid #efefef'>
							</ul>
						</td>
						<td style="background-color:#e8edef;">上报方式：</td>
						<td>
							<s:select name="spr.stReportType" list="#{'':'-请选择-','1':'巡查人员网上上报'}" cssClass="scinput" cssStyle="width:53%;"></s:select>
						</td>
					</tr>
					<tr>
						<td style="background-color:#e8edef;">所在区县：</td>
						<td>
							<s:select name="spr.stAreacode" id="stAreacode" cssClass="scinput" cssStyle="width:50%;" list="#{'':'-请选择-'}"></s:select>
						</td>
						<td style="background-color:#e8edef;">问题桩号范围：</td>
						<td>
							
							<s:textfield name="spr.stScopeKm" cssClass="numDecText" cssStyle="width:40px;height:25px;"></s:textfield>&nbsp;&nbsp;km
							&nbsp;+&nbsp;
							<s:textfield name="spr.stScopem" cssClass="numDecText" cssStyle="width:40px;height:25px;"></s:textfield>&nbsp;&nbsp;m
						</td>
					</tr>
					<tr>
						<td style="background-color:#e8edef;">岸段属性：</td>
						<td>
							<s:select name="spr.stCoastSegmentAttr" list="#{'':'-请选择-','1':'一般岸段'}" cssClass="scinput" cssStyle="width:53%;"></s:select>
						</td>
						<td style="background-color:#e8edef;">发现时间：</td>
						<td>
							<s:textfield readonly="true" onclick="WdatePicker()" id="dtDiscovertime" name="spr.dtDiscovertime" cssStyle="width:50%;"></s:textfield>
						</td>
					</tr>
					<tr>
						<td style="background-color:#e8edef;">情况描述：</td>
						<td colspan="3">
							<s:textarea name="spr.stDescription" cssStyle="width:82%;height:60px;"></s:textarea>
						</td>
					</tr>
	
					<tr style="height:180px;">
						<td style="background-color:#e8edef;">上传附件：<br/>
							<input type="button" value="添加" style="width:60px;" onclick="addFileInput()" />
						</td>
						<td id="imgTd" colspan="3">
							<img id="imgDiv" style="width:180px;height:150px;float:left;" src="">
						</td>
					</tr>
					<tr>
						<td id="fileTd" colspan="4" style="text-align:center;">
							<input name="attachmentFiles" type="file" id="imgFile" class="scinput" style="width:65px;" onchange="previewImg('imgDiv',this)"/>
						</td>
					</tr>
					<tr>
						<td style="background-color:#e8edef;">上报到：</td>
						<td colspan="3" style="text-align:center;">
							<s:select name="apprPersonId" id="apprPersonId" list="#{'':'-请选择-'}" cssClass="scinput" cssStyle="width:53%;"></s:select>
							<s:hidden name="apprPersonName" id="apprPersonName"></s:hidden>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="text-align:center;">
							<!--<input type="button" class="scbtn1" name="btn" onclick="window.location='dmcjsb.jsp'" value="保存">-->
							<input type="button" class="scbtn1" name="btn" onclick="submitForm(0)" value="保存">
							<c:if test="${(spr.nmState eq null || spr.nmState eq '1')}">
								<input type="button" class="scbtn1" name="btn" onclick="submitForm(1)" value="上报">
							</c:if>
							<input name="fh" type="button" value="返回" class="scbtn1" onclick="location='${contextPath}/seaPatorl/swPatorl_loadSprs.do'" />
						</td>
					</tr>
				</table>
    		</s:form>
		</div>
	</body>
	<script type="text/javascript">
			$(function() {
				$('tr:odd').addClass('odd');
				//限制文本框只能输入数字
				$(".numText").keyup(function(){    
	                $(this).val($(this).val().replace(/\D|^0/g,''));
	            }).bind("paste",function(){
	                $(this).val($(this).val().replace(/\D|^0/g,''));     
	            }).css("ime-mode", "disabled");
				//限制文本框只能输入数字和小数点
				$(".numDecText").keyup(function(){    
	                $(this).val($(this).val().replace(/[^0-9.]/g,''));    
                }).bind("paste",function(){
                    $(this).val($(this).val().replace(/[^0-9.]/g,''));     
                }).css("ime-mode", "disabled");

				getDictionary("项目位置","stAreacode","${spr.stAreacode}");
				var uids = new Array();
				var unames = new Array();
				var vals = new Array();
				//uids.push("stPatrolPersonId");
				uids.push("apprPersonId");
				//unames.push("stPatrolPerson");
				unames.push("apprPersonName");
				//vals.push("${spr.stPatrolPersonId}");
				
				loadUserCode(uids,unames,vals);

				loadUserCheckbox("userCheckbox","stPatrolPerson");
				
			})
			
			function submitForm(i){
				$("#op").val(i);
				if ( i == 0 ) {
					//保存
					$("#sprForm").submit();
				} else {
					//上报
					var uid = $("#apprPersonId").val();
					if ( uid == null || uid == "" ) {
						alert("请选择审批人！")
						return;
					}
					$("#sprForm").submit();
				}
			}
			//校验文件类型
			function checkImg(img){
				var imgPath = img.value;
				var type = imgPath.substring(imgPath.lastIndexOf(".") + 1, imgPath.length).toLowerCase();
				if ( type != null && type != "" && type!="jpg" && type != "bmp" && type != "gif" && type != "png" && type != "jpeg" ) {
					alert("图片文件格式错误！");
					return false;
				}
				return true;
			}

			
			//图片预览
			function previewImg(divImg,img){
				if ( checkImg(img) ) {
					try{
						var imgPath = "";
						var browserz_agent = navigator.userAgent;
						if ( browserz_agent.indexOf("Firefox") !=-1 || browserz_agent.indexOf("Chrome") !=-1 ) {
							if ( img.files.length > 0) {
								imgPath = window.URL.createObjectURL(img.files.item(0));
							}
							//document.getElementById(divImg).innerHTML = innerHTML + '<img id="imgPreview" src="' + imgPath +'" style="width:180px;height:150px;float:left;"/>';
							$("#" + divImg).attr("src",imgPath);
						} else {
							img.select();
							var preview = document.getElementById(divImg);
							preview.style.width = 180;
							preview.style.height = 150;

							var reallocalpath = document.selection.createRange().text//IE下获取实际的本地文件路径
							preview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='image',src=\"" + reallocalpath + "\")";


						}
					}catch(e){
						alert("图片格式错误！");
					}
				}
			}
			
			var fileNo = 1;
			
			function addFileInput(){
				var fi = '<input type="file" name="attachmentFiles" id="imgFile'
				+ fileNo +
				'" class="scinput" style="margin-left:15px;width:65px;" onchange="previewImg(\'imgDiv'
				+ fileNo +
				'\',this)"/>'
				+ '<input type="button" value="移除" style="width:40px;" onclick="removeFileInput('
				+ fileNo +
				',this)" />';
				
				var img = '<img id="imgDiv' + fileNo + '" style="margin-left:5px;width:180px;height:150px;float:left;" src="">';
				
				$("#fileTd").append(fi);
				$("#imgTd").append(img);
				fileNo ++;
			}
			
			function removeFileInput(n,bt){
				$("#imgDiv" + n).remove();
				$("#imgFile" + n).remove();
				$(bt).remove();
			}
			//结合loadUserCode(ids,names)方法使用
			function onChangeVal(id, name){
				$("#"+id).change(function(){
					$("#" + name).val($("#"+ id +" option:selected").text())
				});
			}
			//加载用户多选下拉框
			function loadUserCheckbox(id,name,val){
				$.ajax({		  		
					type: "post",
					dataType:"json",
					url: "${contextPath}/user/user_loadUserCode.do",
					success: function(d){
						var html = "";
						for(var i=0;i<d.length;i++){
							//$("<option value= '"+d[i].id+"'>"+d[i].text+"</option>").appendTo("#"+ids[j]);
							html += "<li>" + "<input onchange='userCheckedChange(this,\"stPatrolPersonId\",\"stPatrolPerson\")' type='checkbox' name='" + name + "' value='" + d[i].id + "'>" + d[i].text + "</li>";
						}
						$("#"+id).html(html);
					}
				});	  
			}

			function userCheckedChange(e,id_id,name_id){
				var name = $(e).attr("name");
				var vals = "";
				var texts = "";
				$("[name="+name+"]:checked").each(function(){
					if (vals != "") {
						vals += ",";
						texts += ",";
					}
					vals += $(this).val();
					texts += $(this).parent().text();
				})
				$("#"+id_id).val(vals);
				$("#"+name_id).val(texts);
			}

			//加载用户字典
			function loadUserCode(ids,names,vals){
				for ( var i = 0; i < ids.length; i++) {
					onChangeVal(ids[i],names[i]);
				}
				$.ajax({		  		
					type: "post",
					dataType:"json",
					url: "${contextPath}/user/user_loadUserCode.do",
					success: function(d){
						for ( var j = 0; j < ids.length; j++) {
							for(var i=0;i<d.length;i++){
								$("<option value= '"+d[i].id+"'>"+d[i].text+"</option>").appendTo("#"+ids[j]);
							}
							if ( j < vals.length) {
								$("#"+ids[j]).val(vals[j])
							}
						}
					}
				});	  
			}
			//加载字典
			function getDictionary(keyZ,selectID,val){
				$.ajax({		  		
					type: "post",
					dataType:"json",
					url: "${contextPath}/business/business_fetchDictionary.do",
					data: "dictionary.key="+keyZ,
					success: function(d){
						for(var i=0;i<d.length;i++){
							$("<option value= '"+d[i].dm+"'>"+d[i].value+"</option>").appendTo("#"+selectID);
						}
						$("#"+selectID).val(val);
					}
				});	  
			}
			
		</script>
</html>