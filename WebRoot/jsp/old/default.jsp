<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
		body{-webkit-text-size-adjust:none;}
		body,h1,h2,h3,h4,h5,h6,hr,p,blockquote,dl, dt,dd,ul,ol,li,pre,form,fieldset,legend,button,input,textarea,th,td,iframe{margin:0; padding:0;}
		h1,h2,h3,h4,h5,h6{font-size:100%;}
		body,button,input,select,textarea {font-family:Tahoma,Arial,Roboto,”Droid Sans”,”Helvetica Neue”,”Droid Sans Fallback”,”Heiti SC”,sans-self;font-size:62.5%; line-height:1.5;}
		ol,ul{list-style:none;}
		
		html,body{ width:100%; height:100%; overflow:hidden;}
		.section-wrap{ width:100%;height:100%;overflow:visible;transition:transform 1s cubic-bezier(0.86,0,0.03,1);-webkit-transition:-webkit-transform 1s cubic-bezier(0.86,0,0.03,1);}
		.section-wrap .section{ position:relative; width:100%; height:100%; background-position:center center; background-repeat:no-repeat;}
		/*top:10%;color:#fff;*/
		.section-wrap .section .title{width:100%;position:absolute;font-size:2.4em;text-align:left;}
		.section-wrap .section .title p{ padding:0 4%;opacity:0}
		.section-wrap .section .title.active .tit{ opacity:1;transform:translateY(-25px);-webkit-transform:translateY(-25px);transition:all 2s cubic-bezier(0.86,0,0.8,1);-webkit-transition:all 2s cubic-bezier(0.86,0,0.8,1);}
		.section-wrap .section-1{ }/*background-color:#337ab7*/
		.section-wrap .section-2{ }/*background-color:#5cb85c*/
		.section-wrap .section-3{ background-color:#5bc0de}
		.section-wrap .section-4{ background-color:#f0ad4e}
		.section-wrap .section-5{ background-color:#d9534f}
		.put-section-0{ transform:translateY(0);-webkit-transform:translateY(0);}
		.put-section-1{ transform:translateY(-100%);-webkit-transform:translateY(-100%);}
		.put-section-2{ transform:translateY(-200%);-webkit-transform:translateY(-200%);}
		.put-section-3{ transform:translateY(-300%);-webkit-transform:translateY(-300%);}
		.put-section-4{ transform:translateY(-400%);-webkit-transform:translateY(-400%);}
		.section-btn{ width:14px;position:fixed;right:4%;top:50%;}
		.section-btn li{ width:14px;height:14px;cursor:pointer;text-indent:-9999px;border-radius:50%;-webkit-border-radius:50%;margin-bottom:12px; background:#BD362F;text-align:center; color:#fff; onsor:pointer;}
		.section-btn li.on{ background:#fff}
		/*color:#fff;border:1px solid #fff;*/
		.arrow{ opacity:1;animation:arrow 3s cubic-bezier(0.5,0,0.1,1) infinite;-webkit-animation:arrow 3s cubic-bezier(0.5,0,0.1,1) infinite;transform:rotate(-90deg);-webkit-transform:rotate(-90deg); position:absolute;bottom:10px;left:50%;margin-left:-30px;width:60px;height:60px;border-radius:100%;-webkit-border-radius:100%;line-height:60px;text-align:center;font-size:20px;color:#0033CC;border:1px solid #0033CC;cursor:pointer;overflow:hidden;}
		.arrow:hover{ animation-play-state:paused;-webkit-animation-play-state:paused;}
		@keyframes arrow{ %0,%100{bottom:10px; opacity:1;} 50%{bottom:50px; opacity:.5} }
		@-webkit-keyframes arrow{ %0,%100{bottom:10px; opacity:1;} 50%{bottom:50px; opacity:.5} }
	</style>
<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${contextPath}/js/jsapi.js"></script>
<script type="text/javascript" src="${contextPath}/js/format+zh_CN,default,corechart.I.js"></script>
<script type="text/javascript" src="${contextPath}/js/jquery.gvChart-1.0.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/jquery.ba-resize.min.js"></script>

<script type="text/javascript">
		gvChartInit();
		jQuery(document).ready(function(){

		jQuery('#myTable5').gvChart({
				chartType: 'PieChart',
				gvSettings: {
					vAxis: {title: 'No of players'},
					hAxis: {title: 'Month'},
					width: 650,
					height: 250
					}
			});
		});
		</script>
<style type="text/css">
<!--
.STYLE1 {font-family: "宋体"}
-->
</style>
</head>


<body >
    

    
    
    <div class="mainbox STYLE1" >
    
    <div class="mainleft">
    
   <div class="infoleft">
    
     <div class="listtitle" style="position:relative;"><a href="#" class="more1">更多</a><img src="../images/i09.png" width="25" height="25" style="position:absolute;margin-top:8px;left:0px;"/><span style="margin-left:15px;">通知通报</span></div>
    
     <ul class="newlist">
    <li><a href="#">关于对2016年三季度成绩突出的集体和个人记功的公告</a></li>
    <li><a href="#">关于开展海洋监测辅导报告的通知</a></li>
    <li><a href="#">关于举办第59期“海洋监测管理与创新思维”论坛</a></li>
	<li><a href="#">关于认真开好2016年度会议的通知</a></li>
    </ul>   
    </div>
    </div>
	<div class="inforight">
    <div class="listtitle" style="position:relative;"><a href="#" class="more1">更多</a><img src="${contextPath}/images/ico06.png" width="25" height="25" style="position:absolute;margin-top:8px;left:0px;"/><span style="margin-left:15px;">海洋快讯</span></div>
    
      <ul class="newlist">
    <li><a href="#">2016年12月29日每日海情动态第242期</a></li>
    <li><a href="#">2016年12月28日每日海情动态第241期</a></li>
	<li><a href="#">市海洋局中心组举行专题辅导报告</a></li>
	<li><a href="#">2016年12月27日每日海情动态第240期</a></li>
    </ul>  
    </div>
    <!--leftinfo end-->
    
    
    <div class="leftinfos">
    
   
    <div class="infoleft" style="margin-top:8px">
    
    <div class="listtitle" style="position:relative;"><a href="${contextPath}/门户.html" class="more1">更多</a><img src="${contextPath}/images/d05.png" width="25" height="25" style="position:absolute;margin-top:8px;left:0px;"/><span style="margin-left:15px;">相关功能</span></div>
    <div style="width:100px;text-align:center;height:100px;float:left;margin-top:15px;">
		<a href="#" target="bottomFrame" >
		<img src="${contextPath}/images/icon02-2.png" alt="" height="45" width="45" /></a><br/>
		<a href="#">海域可视化</a>
	</div>
	
	<div style="width:100px;text-align:center;height:100px;float:left;margin-top:15px;">
		<a href="#" target="bottomFrame" >
		<img src="${contextPath}/images/pdahchl.png" alt="" height="45" width="45" /></a><br/>
		<a href="#">海塘巡查</a>
	</div>
	<div style="width:100px;text-align:center;height:100px;float:left;margin-top:15px;">
		<a href="#" target="bottomFrame" >
		<img src="${contextPath}/images/qwxx.png" alt="" height="45" width="45" /></a><br/>
		<a href="#">船舶定位</a>
	</div>
	
	<div style="width:100px;text-align:center;height:100px;float:left;margin-right:10px;margin-left:10px;margin-top:15px;">
		<a href="#" target="bottomFrame" >
		<img src="${contextPath}/images/cllrjk.png" alt="" /></a><br/>
		<a href="#">岸基监视</a>
	</div>
    <div style="width:100px;text-align:center;height:100px;float:left;margin-top:15px;">
		<a href="#" target="bottomFrame" >
		<img src="${contextPath}/images/clda_zp.png" alt="" height="45" width="45" /></a><br/>
		<a href="#">视频管理</a>
	</div>
	
    </div>
    
    
    <div class="inforight" style="margin-top:8px">
    <div class="listtitle" style="position:relative;"><a href="#" class="more1">更多</a><img src="${contextPath}/images/icon01.png" width="25" height="25" style="position:absolute;margin-top:8px;left:0px;"/><span style="margin-left:15px;">待办事项</span></div>
    
     <ul class="newlist">
    <li><a href="#">2016年末汇报</a></li>
    <li><a href="#">海洋监测知识普及工作的相关报告</a></li>
    <li><a href="#">第59期海洋监测管理会议评选的相关报告</a></li>
	<li><a href="#">2016年海洋综合信息汇总报告</a></li>
    </ul>   
    </div>
    </div>
    </div>
    <!--mainleft end-->
    
    
    <div class="mainright">
    
    

    
    </div>
    <!--mainright end-->
    
</body>
<script type="text/javascript">
	setWidth();
	$(window).resize(function(){
		setWidth();	
	});
	function setWidth(){
		var width = ($('.leftinfos').width()-12)/2;
		$('.infoleft,.inforight').width(width);
	}
</script>
</html>
