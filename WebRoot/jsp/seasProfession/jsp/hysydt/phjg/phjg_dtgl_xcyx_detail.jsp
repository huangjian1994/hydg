<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title></title>
	<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />
	<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<script type="text/javascript">

</script>

</head>
<body style="background-color: white">
   <form name="myForm" method="post" >

	<div align="center" >
	<div class="mainbox">
	
	<div class="leftinfo1">
	<div class="listtitle3"><img src="${contextPath}/images/i02.png" width="25" height="25" />用海项目动态管理：监测影像</div>
	
	
	
		<div id="content" style="margin-top: 10px;height:800px;" align="center">
		   	 <!-- 只支持MP4 webm ogg格式 -->
		   	 <c:if test="${hysyywHysydtYhxmphjgDtfj.wjlx == 'video/mp4' || hysyywHysydtYhxmphjgDtfj.wjlx == 'audio/ogg' }">
		   	 <video id="my_video_1" controls="controls" preload="auto" width="900px" height="600px" >
				<source src="/hydg/files/video/${hysyywHysydtYhxmphjgDtfj.xcyxmc}" type='video/mp4'/>
				<source src="/hydg/files/video/${hysyywHysydtYhxmphjgDtfj.xcyxmc}" type='video/webm'/>
				<source src="/hydg/files/video/${hysyywHysydtYhxmphjgDtfj.xcyxmc}" type='video/ogg'/>
				<!-- 
				<source src="/shswpt/video/111.mp4" type='video/mp4'/>
				<source src="/shswpt/video/111.mp4" type='video/webm'/>
				<source src="/shswpt/video/111.mp4" type='video/ogg'/>
				 -->
			</video>
		   	</c:if>

			<!-- 
			谷歌不支持，播放文件路径使用虚拟路径
			 -->
			 <c:if test="${hysyywHysydtYhxmphjgDtfj.wjlx != 'video/mp4' && hysyywHysydtYhxmphjgDtfj.wjlx != 'audio/ogg' }">
		   	 <OBJECT id=WMP height=600 standby=Loading... width=900 classid=clsid:6BF52A52-394A-11D3-B153-00C04F79FAA6>
				<PARAM NAME="URL" VALUE="/hydg/files/video/${hysyywHysydtYhxmphjgDtfj.xcyxmc}">
				<PARAM NAME="rate" VALUE="1">
				<PARAM NAME="balance" VALUE="0">
				<PARAM NAME="currentPosition" VALUE="0"><PARAM NAME="playCount" VALUE="1">
				<PARAM NAME="autoStart" VALUE="1">
				<PARAM NAME="currentMarker" VALUE="0">
				<PARAM NAME="invokeURLs" VALUE="-1">
				<PARAM NAME="baseURL" VALUE="">
				<PARAM NAME="volume" VALUE="50">
				<PARAM NAME="defaultFrame" VALUE="">
				<PARAM NAME="mute" VALUE="0">
				<PARAM NAME="uiMode" VALUE="full">
				<PARAM NAME="stretchToFit" VALUE="0">
				<PARAM NAME="windowlessVideo" VALUE="0">
				<PARAM NAME="enabled" VALUE="-1">
				<PARAM NAME="enableContextMenu" VALUE="-1">
				<PARAM NAME="fullScreen" VALUE="0">
				<PARAM NAME="SAMIStyle" VALUE="">
				<PARAM NAME="SAMILang" VALUE="">
				<PARAM NAME="SAMIFilename" VALUE="">
				<PARAM NAME="captioningID" VALUE="">
			</OBJECT>
			</c:if>
		<br />
		<font color="red" >注意：谷歌浏览器只支持：MP4、webm、ogg格式的视频文件播放。</font>
		
		</div>
	</div><br />
	
	
	
	</div>
	</div>
	</form>

</body>
</html>
