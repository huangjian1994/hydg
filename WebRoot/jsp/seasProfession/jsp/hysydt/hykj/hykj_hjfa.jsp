<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../../common.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${contextPath}/css/button.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/load.css" />
		<!-- <link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" /> -->
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/delete.css" />
		<!-- <link href="${contextPath}/css/seabedPipeline/search-form.css" rel="stylesheet" type="text/css" /> -->
		<link href="${contextPath}/css/seasProfession/hykj_hjfa.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/dijit/themes/tundra/tundra.css" />
    	<link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/esri/css/esri.css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/delete.js"></script>
		<script type="text/javascript" src="${contextPath}/js/seasProfession/hykj_hjfa.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
    	<script type="text/Javascript" src="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/init.js"></script>
		<script type="text/javascript" src="${contextPath}/js/seasProfession/surveyAnalysis.js"></script>
		<script type="text/javascript" src="${contextPath}/js/seabedPipeline/html5shiv.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>		
    	<script type="text/javascript">	    
        	//上传
        	function upLoadData(){
        		//判空
        		if(document.getElementById("name").value ==""){
        			alert("修订名称不允许为空！");
        			return false;
        		}
        		if(document.getElementById("people").value ==""){
        			alert("修订人不允许为空！");
        			return false;
        		}
        		if(document.getElementById("time").value ==""){
        			alert("修订日期不允许为空！");
        			return false;
        		}
        		//校验
        		var filename=document.myForm.upload.value;
        		if(filename==""){
        			alert("请先上传文件！");
        			return false;
        		}
        		var hz=filename.substring(filename.length-4,filename.length);
        		if (hz!=".xls"){
        			alert("请上传xls格式的文件！！"); 				
        			return false; 
        		}
        
        		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_saveClAnalyze.do";
        		document.myForm.target="_self";
        		document.myForm.submit();
        	}        
        	//下载模板
        	function xzZbmb(){
        		document.myForm.action="<%=basePath%>/seaDemarcation/seaDemarcation_downLoadHjfaJwd.do";
        		document.myForm.target="_self";
        		document.myForm.submit();
        	}
        </script>
	</head>
	<body>
	<form name="myForm" method="post" enctype="multipart/form-data">
	<!---->
		<div id="loader-wrapper">
	        <div id="loader"></div>
	        <div class="loader-section section-left"></div>
	        <div class="loader-section section-right"></div>
	        <div class="load_title">正在加载地图</div>
	    </div>
  
			<div class="place">
				<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
				<ul class="placeul">
					<li>
						<a href="#">海域使用动态管理</a>
					</li>
					<li>
						<a href="#">海域勘界管理</a>
					</li>
					<li>
						<a href="#">划界方案综合分析</a>
					</li>
				</ul>
			</div>
			<div class="formbody" style="position:absolute;right:10px;top:50px;z-index:10;">
				<div class="tools">
					<button class="button button-glow button-rounded button-raised button-primary" value="EXTENT">
						<a href="${contextPath}/seaDemarcation/seaDemarcation_fetchHjfaTj.do"><span>
						<img src="${contextPath}/images/ico03.png" width="24" height="24" /></span>材料统计</a>
					</button>					
				</div>
			</div>
			<div id="map"></div>			
			<button class="button button-raised button-glow button-rounded button-primary" style="position:absolute;right:27px;top:110px;width:160px;z-index:10;" type="button" onclick="showUp();">新增</button>		
			<div id="submit">
				<ul>
					<li style="padding: 10px 0px;overflow: hidden;border-bottom: 1px black solid;">
						<div style="float: left;text-align: center;"><span style="font-size: 16px;">上传</span></div>
						<img style="float: right;cursor: pointer;" src="${contextPath}/images/close.png" alt="关闭" />
					</li>
					<li style="padding: 10px;"><label for="name">划界方案名称：</label><input id="name" name="coastline.lineName" type="text" /><font color="red">*</font></li>
					<li style="padding: 10px;"><label for="people">新增人：</label><input id="people" name="coastline.lineUpdatePerson" type="text" /><font color="red">*</font></li>
					<li style="padding: 10px;"><label for="time">新增日期：</label><input id="time" name="coastline.lineUpdateTime" type="text" onclick="WdatePicker()" readonly="readonly"/><font color="red">*</font></li>
					<li style="padding: 10px;"><label for="info">备注：</label><input id="info" name="coastline.lineUpdateReason" type="text" /></li>
					<li style="padding: 10px;"><label for="info">上传经纬度：</label><input id="upload" name="upload" type="file" />&nbsp;
					<a href="###" onclick="xzZbmb()"><font color="blue">下载模板</font></a>
					</li>
					
					<li style="padding: 10px;text-align: center;">
					<!-- 
					<input style="height:30px;padding:0 10px;margin-left: 30px;line-height: 30px;" class="button button-raised button-glow button-rounded button-primary" type="submit" value="提交" onclick="upLoad();" />
					 -->
					<input style="height:30px;padding:0 10px;margin-left: 30px;line-height: 30px;" class="button button-raised button-glow button-rounded button-primary" type="button" value="提交" onclick="upLoadData();" />
					
					</li>
				</ul>			
			</div>		
			<div class="option">
				<div class="option-icon">
					<img src="${contextPath}/images/seasProfession/menu-icon.png"  />
				</div>				
			</div>
            <div class="option-contain">
                <div class="menu-top">
                    <div>
                        <span>划界方案列表</span>
                        <img class="close fr" src="${contextPath}/images/menu-close.png" title="关闭" />
                    </div>
                </div>
                <div class="menu"> 
                    <ul></ul>
                </div>
            </div>
		</form>
	</body>
</html>