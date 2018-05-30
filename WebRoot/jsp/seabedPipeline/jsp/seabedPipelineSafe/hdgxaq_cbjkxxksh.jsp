<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>海底管线安全</title>
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/load.css" />
	<link href="${contextPath}/css/button.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/dijit/themes/tundra/tundra.css" />
    <link rel="stylesheet" type="text/css" href="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/esri/css/esri.css" />  
	<link href="${contextPath}/css/seabedPipeline/search-form.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>
	<script type="text/Javascript" src="http://31.16.10.160/arcgis_js_api/library/3.16/3.16/init.js"></script>
	<script type="text/javascript" src="${contextPath}/js/seabedPipeline/showShipInfo.js"></script>
	<script type="text/javascript" src="${contextPath}/js/seabedPipeline/html5shiv.min.js"></script>
	<style type="text/css">
			.menu {
				position: fixed;
				top: 50px;
				/* right: 1000px; */
				left: 50%;
				width: 5.3%;
				z-index: 400;
			}
			a{
			   white-space: nowrap
			}
			.menu p input {
				height: 30px;
				width: 190px;
			}
			.menu span {
				display: block;
			}
	</style>
	<script type="text/javascript">
		function godatil() {
			window.open("detail.jsp", "displayWindow", "menubar=no,width=600,height=450,toolbar=no,location=no");
		}
	</script>
	
	<script type="text/javascript">
        function searchToggle(obj, evt){
            var container = $(obj).closest('.search-wrapper');

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

            //_html = "Yup yup! Your search text sounds like this: ";
            if(!value.length){
                //_html = "Yup yup! Add some text friend :D";
                alert("请输入查询条件");
            }
            else{
                //_html += "<b>" + value + "</b>";
                doSearch();
            }

            //$(obj).find('.result-container').html('<span>' + _html + '</span>');
            //$(obj).find('.result-container').fadeIn(100);

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
	<div class="place" >
		<span><img src="${contextPath}/images/seabedPipeline/ico01.png" width="22" height="22" />位置：</span>
		<ul class="placeul">
			<li>
				<a href="#">海底管线安全</a>
			</li>
			<li>
				<a href="#">船舶监控信息可视化</a>
			</li>
		</ul>
	</div>
	<div id="map" style="position:absolute;left:0;right:0;top:40px;bottom:0;">
		
	</div>
	<div style="position:absolute;right:10px;top:55px;">
		<button class="button button-raised button-rounded button-glow button-primary" style="height:35px;padding:0 10px;" value="EXTENT" onclick="queryNow(this);">矩形实时查询</button>
		<button class="button button-raised button-rounded button-glow button-primary" style="height:35px;padding:0 10px;" value="CIRCLE" onclick="queryNow(this);">圆形实时查询</button>
	</div>
	
	<section class="container" style="position:absolute;left:15px;top:80px;">
		<form onsubmit="submitFn(this, event);">
            <div class="search-wrapper">
                <div class="input-holder">
                    <input type="text" value="${mmsi}" class="search-input" placeholder="Type to search" />
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