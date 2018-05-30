<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>素材库展示--素材库查询</title>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/editor/kindeditor.js"></script>

<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
<style>
.search{
  width:100px;height:28px;
  background-image:url(${contextPath}/images/search01.png);
}
</style>
</head>

<body>

	<div class="place">
    <span><img src="${contextPath}/images/ico01.png" width="20" height="20" />位置：</span>
    <ul class="placeul">
	<li><a href="#">管理</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab2" class="selected">案件</a></li> 
    <li><a href="#tab1">视频</a></li> 
	<li><a href="#tab1">图片</a></li>
	<li><a href="#tab1">文字</a></li>
	<li><a href="#tab1">人像</a></li>
	<li><a href="#tab1">档案</a></li>
	<li><a href="#tab1">绘图</a></li>
	<li><a href="#tab1">话单</a></li>
	<li><a href="#tab1">音频</a></li>
	<li><a href="#tab1">现场勘查</a></li>
	<li><a href="#tab1">警务通</a></li>
	<li><a href="#tab1">互联网</a></li>
	<li><a href="#tab1">日志</a></li>
	<li><a href="#tab1">研判报告</a></li>
	 
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
    
    <!--<div class="formtext">Hi，<b>admin</b>，欢迎您试用信息发布功能！</div>-->
    
    <ul class="toolbar">
	 <li><input name="" type="text" class="dfinput" value="请填写查询内容"  style="width:300px;"/></li>
	 <li class="click"><span><img src="${contextPath}/images/search.png" /></span>查询</li>
        <li class="click"><span><img src="${contextPath}/images/t02.png" /></span>保存</li>
        <li class="click"><span><img src="${contextPath}/images/t03.png" /></span>导出</li>
	</ul>
	<ul class="toolbar2">
	<span>全选</span>
	</ul>
	  </div> 
	

	
  
    
    
  	<div id="tab2" class="tabson">
    
    
    <ul class="seachform">
    
    <li><input name="" type="text" value="请输入查询内容" class="scinput" /></li>
   
    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询"/></li>
	<li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="保存"/></li>
	<li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="导出"/></li>
    
    </ul>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>编号<i class="sort"><img src="${contextPath}/images/px.gif" /></i></th>
        <th>案件名称</th>
        <th>案件ID</th>
        <th>案发地点</th>
        <th>发案时间</th>
       
		<th>案件审核状态</th>
		<th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>“12.30”盗窃案</td>
        <td>SH20111230</td>
        <td>普陀区铜川路120号</td>
        <td>2011-12-30 15:05</td>
        <td>未审核</td>
        <td><a href="#" class="tablelink">详情</a>  <a href="#" class="tablelink"> 修改</a> <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>2</td>
        <td>“9.25”恐怖袭击事件</td>
        <td>X01220130925</td>
        <td>浦东新区耀华路</td>
        <td>2013-09-25 14:02</td>
        <td>已审核</td>
       <td><a href="#" class="tablelink">详情</a>  <a href="#" class="tablelink"> 修改</a> <a href="#" class="tablelink"> 删除</a></td>
        </tr>
        
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>3</td>
        <td>“3.18”谋杀案</td>
        <td>SH20130318</td>
        <td>松江区**路</td>
        <td>2013-03-18 13:16</td>
        <td>未审核</td>
       <td><a href="#" class="tablelink">详情</a>  <a href="#" class="tablelink"> 修改</a>  <a href="#" class="tablelink"> 删除</a></td>
        </tr>
        
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>4</td>
        <td>“6.27”诈骗案</td>
        <td>青浦区**路</td>
        <td>SH20130627</td>
        <td>2013-06-27 10:36</td>
        <td>已审核</td>
       <td><a href="#" class="tablelink">详情</a>  <a href="#" class="tablelink"> 修改</a> <a href="#" class="tablelink"> 删除</a></td>
        </tr>
        
        
        </tbody>
    </table>
    
   
  
    
    </div>  
       
	</div> 
 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    
    
    
    
    </div>


</body>

</html>
