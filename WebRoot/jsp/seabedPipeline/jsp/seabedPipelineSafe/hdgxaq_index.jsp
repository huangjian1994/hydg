<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>海底管线安全</title>
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/load.css" />
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
	 	<link href="${contextPath}/css/button.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/css/seabedPipeline/search-form.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
		<link rel="stylesheet" type="text/css" href="http://31.16.10.77:80/arcgis_js_v314_api/library/3.20/3.20/dijit/themes/tundra/tundra.css" />
		<link rel="stylesheet" type="text/css" href="http://31.16.10.77:80/arcgis_js_v314_api/library/3.20/3.20/esri/css/esri.css" />
		<script type="text/Javascript" src="http://31.16.10.77:80/arcgis_js_v314_api/library/3.20/3.20/init.js"></script>
		<script type="text/javascript" src="${contextPath}/js/seabedPipeline/showPipeLine.js"></script>
		<script type="text/javascript" src="${contextPath}/js/seabedPipeline/html5shiv.min.js"></script>

	<script type="text/javascript">
		function godatil() {
			window.open("detail.jsp", "displayWindow", "menubar=no,width=600,height=450,toolbar=no,location=no");
		}
	</script>	
	<script type="text/javascript">
        function searchToggle(obj, evt){
            var container = $(obj).closest('.search-wrapper');
			changeSym();
            if(!container.hasClass('active')){
            	  $(".container").css("left","200px");
                  container.addClass('active');
                  evt.preventDefault();
            }
            else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
                  container.removeClass('active');
                  // clear input
                  container.find('.search-input').val('');
                  // clear and hide result container when we press close
                  container.find('.result-container').fadeOut(100, function(){$(this).empty();});
                  $(".container").css("left","15px");
            }
        }
        function submitFn(obj, evt){
            value = $(obj).find('.search-input').val().trim();
            if(!value.length){
               alert("请输入查询条件")
            }
            else{
                doSearch();                
            }           
            evt.preventDefault();
        }
    </script>
	</head>

	<body>
		<div id="loader-wrapper">
	        <div id="loader"></div>
	        <div class="loader-section section-left"></div>
	        <div class="loader-section section-right"></div>
	        <div class="load_title">正在加载地图</div>
	    </div>
		<div class="place">
			<span><img src="${contextPath}/images/seabedPipeline/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">海底管线安全</a>
				</li>
				<li>
					<a href="#">海底管线可视化</a>
				</li>
			</ul>
		</div>
		<div id="map" style="position:absolute;left:0;right:0;top:40px;bottom:0;">
		
		</div>
		<section class="container" style="position:absolute;left:15px;top:80px;">
			<form onsubmit="submitFn(this, event);">
	            <div class="search-wrapper">
	                <div class="input-holder">
	                    <input type="text" value="${tj}" class="search-input" placeholder="Type to search" />
	                    <button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
	                </div>
	                <span class="close" onclick="searchToggle(this, event);"></span>
	                <div class="result-container">
						
	                </div>
	            </div>
	        </form>
		</section>

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

	</body>

</html>