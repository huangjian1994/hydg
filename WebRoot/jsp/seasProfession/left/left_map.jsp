<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common.jsp"%>
<%@include file="../../message.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>

		<link rel="stylesheet" type="text/css" href="${contextPath}/css/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/icon.css" />
		<link href="${contextPath}/css/seasProfession/left-map.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.easyui.min.js"></script>
		<script>
	        function addTab(obj,title, url) {	        	
	        	var $ul = $(obj).parent(".title").next('ul');	        	
	            $('dd').find('ul').slideUp();
	            if ($ul.is(':visible')) {
	                $(obj).parent(".title").next('ul').slideUp();
	            } else {
	                $(obj).parent(".title").next('ul').slideDown(100,load());
	            }
	            function load(){
	            	var timer = setTimeout(function(){
		            	if ($('#tt').tabs('exists', title)) {
			                $('#tt').tabs('select', title);
			            } else {
			                var content = '<iframe scrolling="auto" frameborder="0"  id="map" src="' + url + '" style="width:100%;height:100%;"></iframe>';
			                $('#tt').tabs('add', {
			                    title: title,
			                    content: content,
			                    closable: true,                                     
			                });
			            }
		            },400)
	            }
		                       
	        }	        
    	</script>
		<script type="text/javascript">    	
	        $(function () {		             
	            for(var i = 0;i < $('input[type="checkbox"]').length;i++){
			    	(function(indexI){
			    		$('input[type="checkbox"]').eq(indexI).on("click",function(event){
			    			mapIndex = indexI; 			    			
			    			event.stopPropagation();//阻止事件冒泡即可
			    		})
			    	})(i)
			    }          
	           addTab(".selected","海域动态可视化","${contextPath}/jsp/seasProfession/jsp/arcgis/map.jsp?s=hydt&index=1");		           	
	        })	        
	       			 	
    </script>
	</head>
	<body style="background: #f0f9fd;">
		<div style="height: 100%; width: 187px">
			<div class="lefttop">
				<span></span>
				<s:property value="#session.user.role.roleName" />
				：
				<s:property value="#session.user.name" />
			</div>
			<dl class="leftmenu">
				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seasProfession/leftico01.png" /> </span>
						<a class="easyui-linkbutton" href="#" onclick="addTab(this,'国家提供资源可视化','${contextPath}/jsp/seasProfession/jsp/arcgis/map.jsp?s=gjzy&index=0')">国家提供资源可视化</a>
					</div>
				</dd>
				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seasProfession/leftico01.png" /> </span>
						<a class="easyui-linkbutton selected" href="#" onclick="addTab(this,'海域动态可视化','${contextPath}/jsp/seasProfession/jsp/arcgis/map.jsp?s=hydt&index=1')">海域动态可视化</a>
					</div>
					<ul class="menuson">
						<li>
							<input type="checkbox" name="" id="4" value="海域使用项目新增" />
							<span>海域使用项目新增</span>
						</li>
						<li>
							<input type="checkbox" name="" id="5" value="海域使用项目原有" />
							<span>海域使用项目原有</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层3" id="35" value="倾倒区" />
							<span>倾倒区</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层3" id="34" value="公共排污口" />
							<span>公共排污口</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层3" id="36" value="公共航道" />
							<span>公共航道</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层3" id="37" value="公共锚地" />
							<span>公共锚地</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层3" id="38" value="公共路桥" />
							<span>公共路桥</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层3" id="39" value="保护区" />
							<span>保护区</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层3" id="40" value="公共港口" />
							<span>公共港口</span>
						</li>
					</ul>
				</dd>
				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seasProfession/leftico01.png" /> </span>
						<a class="easyui-linkbutton" href="#" onclick="addTab(this,'海岛动态可视化','${contextPath}/jsp/seasProfession/jsp/arcgis/map.jsp?s=hddt&index=2')">海岛动态可视化</a>
					</div>
					<ul class="menuson">
						<li>
							<input type="checkbox" name="切换图层4" id="8" value="冲积沙岛" />
							<span>冲积沙岛</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层4" id="9" value="低潮高地" />
							<span>低潮高地</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层4" id="10" value="基岩岛" />
							<span>基岩岛</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层4" id="11" value="暗礁" />
							<span>暗礁</span>
						</li>
					</ul>
				</dd>
				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seasProfession/leftico01.png" /> </span>
						<a class="easyui-linkbutton" href="#" onclick="addTab(this,'海洋功能区划可视化','${contextPath}/jsp/seasProfession/jsp/arcgis/map.jsp?s=hygn&index=3')">海洋功能区划可视化</a>
					</div>
					<ul class="menuson">
						<li>
							<input type="checkbox" name="切换图层5" id="44" value="海岸渔港" />
							<span>海岸渔港</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层5" id="45" value="海岸围垦区" />
							<span>海岸围垦区</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层5" id="47" value="近海养殖区" />
							<span>近海养殖区</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层5" id="48" value="近海捕捞区" />
							<span>近海捕捞区</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层4" id="50" value="海岸工业与城镇用海区" />
							<span>海岸工业与城镇用海区</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层4" id="52" value="可再生能源区" />
							<span>可再生能源区</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层4" id="54" value="文体休闲娱乐区" />
							<span>文体休闲娱乐区</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层4" id="56" value="近海保留区" />
							<span>近海保留区</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层4" id="57" value="海岸保留区" />
							<span>海岸保留区</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层4" id="59" value="海岸特殊利用区" />
							<span>海岸特殊利用区</span>
						</li>
						<li>
							<input type="checkbox" name="切换图层3" id="61" value="区域用海规划分区" />
							<span>区域用海规划分区</span>
						</li>
					</ul>
				</dd>
				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seasProfession/leftico01.png" /> </span>
						<a class="easyui-linkbutton" href="#" onclick="addTab(this,'海域勘界可视化','${contextPath}/jsp/seasProfession/jsp/arcgis/map.jsp?s=hykj&index=4')">海域勘界可视化</a>
					</div>
					<ul class="menuson">						
						<li>
							<input type="checkbox" name="" id="2" value="海域行政界线" />
							<span>海域行政界线</span>
						</li>						
					</ul>
				</dd>
				<dd>
					<div class="title">
						<span class="tle"><img src="${contextPath}/images/seasProfession/leftico01.png" /> </span>
						<a class="easyui-linkbutton" href="#" onclick="addTab(this,'海籍可视化','${contextPath}/jsp/seasProfession/jsp/arcgis/map.jsp?s=hj&index=5')">海籍可视化</a>
					</div>
					<ul class="menuson">
						<li>
							<input type="checkbox" name="" id="4" value="海域使用项目新增" />
							<span>海域使用项目新增</span>
						</li>
						<li>
							<input type="checkbox" name="" id="5" value="海域使用项目原有" />
							<span>海域使用项目原有</span>
						</li>
					</ul>
				</dd>
			</dl>
		</div>
		<div id="tt" class="easyui-tabs tabs-posi" style="height: 100%;">
		</div>

	</body>
</html>