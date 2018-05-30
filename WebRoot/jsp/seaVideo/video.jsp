﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:#eee;">

	<head>
		<title>实时视频</title>
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
		<link rel="stylesheet" type="text/css" href="css/button.css" />
		<link rel="stylesheet" type="text/css" href="../../css/control.css">
		<script src="My97DatePicker/WdatePicker.js"></script>
		<link rel="stylesheet" type="text/css" href="DSSPlay.css" />
		<script src="ocxfun.js"></script>
		
		<style type="text/css">
			.fz{
				font-size:1.2em;
			}
			@media screen and (max-width: 450px){
				.fz{
					font-size:12px;
				}
				.button{1
					font-size:12px !important;
				}
			}
		</style>
		<script language="javascript" for="DPSDK_OCX" event="OnCorrectTalkParamEvent(nTalkType, nAudioType, nAudioBit, nSampleRate, nTransMode)">
			var str = ("Correct Talk Param [nTalkType=" + nTalkType + "]" + " [nAudioType=" + nAudioType + "]" + " [nAudioBit=" + nAudioBit +
				"]" + " [nSampleRate=" + nSampleRate + "]");
			document.getElementById("GlobalInfo").innerText = str;
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnMediaDataFirstFrameEvent(szCameraID, nCameraIDLen, nFactoryType, nPlayMode)">
			var str = (" Media Data First Frame [szCameraID=" + szCameraID + "]" + " [nCameraIDLen=" + nCameraIDLen + "]" + " [nFactoryType=" + nFactoryType + "]" +
				" [nPlayMode=" + nPlayMode + "]");
			document.getElementById("GlobalInfo").innerText = str;
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnCorrectTalkParamEvent(nTalkType, nAudioType, nAudioBit, nSampleRate, nTransMode)">
			var str = ("Correct Talk Param [nTalkType=]" + nTalkType + " [nAudioType=]" + nAudioType + " [nAudioBit=]" + nAudioBit +
				" [nSampleRate=]" + nSampleRate + " [nTransMode=]" + nTransMode);
			document.getElementById("GlobalInfo").innerText = str;
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnDownloadRecordProgress(szFileName,fProgress)">
			document.getElementById("textDownloadProgress").innerText = fProgress;
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnDownloadRecordComplete(szFileName)">
			document.getElementById("textDownloadProgress").innerText = 100;
			alert("下载完成!");
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnAlarmEvent(szAlarmId, szCameraId, szDeviceName, szChannelName, nAlarmType, nEventType, nLevel, nTime)">
			var str = ("OnAlarmEvent [szAlarmId=]" + szAlarmId + " [szCameraId=]" + szCameraId + "[szDeviceName=]" + szDeviceName +
				"[szChannelName=]" + szChannelName + "[nAlarmType=]" + nAlarmType + "[nEventType=]" + nEventType + "[nLevel=]" + nLevel + "[nTime=]" + nTime);
			document.getElementById("GlobalInfo").innerText = str;

			if(8 == nAlarmType) {
				//alert(szChannelName);
			} else if((300 < nAlarmType) && (nAlarmType < 1100)) {
				//alert(szChannelName);
			} else {
				//alert(szCameraId);
			}
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnDevStatusEvent(szDevId, nStatus)">
			var str = "";
			switch(nStatus) {
				case 1:
					//alert("设备上线！" + szDevId);
					str = "设备上线！" + szDevId;
					break;
				case 2:
					//alert("设备离线！" + szDevId);
					str = "设备离线！" + szDevId;
					break;
			}
			document.getElementById("GlobalInfo").innerText = str;
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnGeneralJsonCallBack(Json)">
			var str1 = "json返回结果：";
			var str = str1 + Json;
			document.getElementById("JsonResult").innerText = str;
		</script>
 
		<script language="javascript" for="DPSDK_OCX" event="OnServerStatusChangeEvent(nStatus)">
			var str = "";
			switch(nStatus) {
				case 1:
					str = "服务上线！";
					var obj = document.getElementById("DPSDK_OCX");
					ShowCallRetInfo(obj.DPSDK_LoadDGroupInfo(), "加载组织结构");
					break;
				case 2:
					str = "服务离线！";
					break;
			}
			document.getElementById("GlobalInfo").innerText = str;
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnAsyncLoadDGroupInfoComplete(nRet, nGroupLen)">
			var str = ("AsyncLoadDGroupInfoComplete [nRet=]" + nRet + " [nGroupLen=]" + nGroupLen);
			document.getElementById("RetInfo").innerText = str;
			var obj = document.getElementById("DPSDK_OCX");
			//	document.getElementById("DGroupInfo").innerText = obj.DPSDK_GetDGroupStr();
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnWndLBtnClick(nWndId, nWndNo, xPos, yPos)">
			var str = ("OnWndLBtnClick [nWndId=]" + nWndId + " [nWndNo=]" + nWndNo + " [xPos=]" + xPos + " [yPos=]" + yPos);
			document.getElementById("GlobalInfo").innerText = str;
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnWndRBtnClick(nWndId, nWndNo, xPos, yPos)">
			var str = ("OnWndRBtnClick [nWndId=]" + nWndId + " [nWndNo=]" + nWndNo + " [xPos=]" + xPos + " [yPos=]" + yPos);
			document.getElementById("GlobalInfo").innerText = str;
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnDoorStatusReportEvent(szCameraId, status, time)">
			var doorstatus = "";
			switch(status) {
				case 1:
					doorstatus = "开门！";
					break;
				case 0:
					doorstatus = "关门！";
					break;
				case 2:
					doorstatus = "离线！";
					break;
			}
			var str = ("DoorStatusReport [szCameraId=]" + szCameraId + " [status=]" + doorstatus + " [time=]" + time);
			document.getElementById("GlobalInfo").innerText = str;
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnNetAlarmHostStatusReportEvent(szDeviceId, nReportType, nOperationType, nStatus)">
			var strReportType = "";
			var strOperationType = "";
			var strStatus = "";
			switch(nReportType) {
				case 1:
					strReportType = "留守布防";
					break;
				case 2:
					strReportType = "防区旁路";
					break;
				default:
					strReportType = "未知";
					break;
					
			}
			switch(nOperationType) {
				case 1:
					strOperationType = "设备 布/撤防";
					break;
				case 2:
					strOperationType = "通道 布/撤防";
					break;
				case 3:
					strOperationType = "报警输出通道操作";
					break;
				default:
					strOperationType = "未知";
					break;
			}
			switch(nStatus) {
				case 1:
					strStatus = "布防/旁路";
					break;
				case 2:
					strStatus = "撤防/取消旁路";
					break;
				default:
					strStatus = "未知";
					break;
			}
			var str = ("网络报警主机状态上报 [szCameraId=]" + szDeviceId + " [ReportType=]" + strReportType + " [OperationType=]" + strOperationType + " [Status=]" + strStatus);
			document.getElementById("GlobalInfo").innerText = str;
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnVideoAlarmHostStatusReportEvent(szDeviceId, nChannelNO, nStatus)">
			var strStatus = "";
			switch(nStatus) {
				case 1:
					strStatus = "针对设备布防";
					break;
				case 3:
					strStatus = "针对设备撤防";
					break;
				case 4:
					strStatus = "针对通道旁路";
					break;
				case 5:
					strStatus = "针对通道取消旁路";
					break;
				case 6:
					strStatus = "针对设备在家布防";
					break;
				case 7:
					strStatus = "针对设备外出布防";
					break;
				default:
					strStatus = "未知";
					break;
			}
			var str = ("视频报警主机状态上报 [szCameraId=]" + szDeviceId + " [ChannelNO=]" + nChannelNO + " [Status=]" + strStatus);
			document.getElementById("GlobalInfo").innerText = str;
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnBayCarInfoEvent(szBayCarInfo)">
			document.getElementById("GlobalInfo").innerText = szBayCarInfo;
			alert(szBayCarInfo);
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnChannelViewInfoReportEvent(szCamearId, nDistance, nAngelH, nAzimuthH, nInclinationH)">
			var str = ("OnChannelViewInfoReportEvent [szCamearId=]" + szCamearId + " [nDistance=]" + nDistance + "[nAngelH=]" + nAngelH +
				"[nAzimuthH=]" + nAzimuthH + "[nInclinationH=]" + nInclinationH);
			document.getElementById("GlobalInfo").innerText = str;
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnAsyncLoginComplete(nRet)">
			if(nRet == 0) {
				bLogin = 1;
			}
			ShowCallRetInfo(nRet, "异步登录");
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnAsyncStartRealplayComplete(nRet, nWndId, nWndNo)">
			var str;
			if(nRet == 0) {
				str = "异步播放视频成功，nWndId = " + nWndId + "，nWndNo = " + nWndNo;
				var szCameraId = document.getElementById("textCameraID").value;
				var obj = document.getElementById("DPSDK_OCX");
				var nWndNo = obj.DPSDK_GetSelWnd(gWndId);
				insertRealplayHistory(szCameraId);
				ShowCallRetInfo(obj.DPSDK_SetIvsShowFlagByWndNo(gWndId, nWndNo, 1, bIVS), "规则线显示"); //打开规则线显示
				ShowCallRetInfo(obj.DPSDK_SetIvsShowFlagByWndNo(gWndId, nWndNo, 2, bIVS), "目标框显示"); //打开目标框显示
				ShowCallRetInfo(obj.DPSDK_SetIvsShowFlagByWndNo(gWndId, nWndNo, 3, bIVS), "轨迹线显示"); //打开轨迹线显示
			} else {
				str = "异步播放视频失败，错误码：" + nRet;
			}
			document.getElementById("GlobalInfo").innerText = str;
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnAsyncStopRealplayComplete(nRet, nWndId, nWndNo)">
			var str;
			if(nRet == 0) {
				str = "异步停止视频成功，nWndId = " + nWndId + "，nWndNo = " + nWndNo;
			} else {
				str = "异步停止视频失败，错误码：" + nRet;
			}
			document.getElementById("GlobalInfo").innerText = str;
		</script>

		<script language="javascript" for="DPSDK_OCX" event="OnAsyncPtzDirectionComplete(nRet, szCameraId)">
			var str;
			if(nRet == 0) {
				str = "异步云台方向控制成功，szCameraId = " + szCameraId;
			} else {
				str = "异步云台方向控制失败，错误码：" + nRet;
			}
			document.getElementById("GlobalInfo").innerText = str;
		</script>

		
		
	</head>

	<body onload="init()" onunload="ButtonLogout_onclick()" style="width:100%;height:100%;overflow-x:hidden;overflow-y:hidden;">
		<ul id="tab_con" style="position:absolute;width: 23%;height:95%;margin:0;padding: 0;left:0px;top:0px;">
			<li id="tab_con_1" style="width:100%;height:100%">
				<div style="color: black;overflow: hidden;position:relative;width:100%;height:100%">
					<div style="position:absolute;z-index: 100;width: 200px;height: 212px;background-color: gray;opacity:0.7;filter:alpha(opacity=70);display:none ">
						<img src="images/bg-jinzhi.png"  style="width:100px;padding: 50px 0 0 50px;"/>
					</div>
					<div class="main_control">
						<span class="suo"><a><img src="img/suo.png" style="width:100%;height:100%;"></a></span>
						<span class="shubiao"><a><img src="img/shubiao.png" style="width:100%;height:100%;" ></a></span>
						<span class="dingwei"><a><img src="img/dingwei.png" style="width:100%;height:100%;"></a></span>
						<div class="cbg">
							<table style="width:100%;height:100%;position:absolute;">
								<tr height="24%">
									<td width="24%"></td>
									<td width="14%"></td>
									<td width="24%" style="left:-2%"><a><img src="img/top.png" style="height:80%;width:100%;" onclick="return ButtonPtzDirection_onclick(1)"/></a></td>
									<td width="14%"></td>
									<td width="24%"></td>
								</tr>
								<tr height="14%">
									<td></td>
									<td style="left:-2%"><a><img src="img/topleft.png" style="height:46%;width:50%;" onclick="return ButtonPtzDirection_onclick(5)"/></a></td>
									<td></td>
									<td style="right:-5%"><a><img src="img/topright.png"  style="height:46%;width:50%;" onclick="return ButtonPtzDirection_onclick(7)"/></a></td>
									<td></td>
								</tr>
								<tr height="24%">
									<td><a><img src="img/left.png"  style="height:80%;width:100%;" onclick="return ButtonPtzDirection_onclick(3)"/></a></td>
									<td></td>
									<td style="left:-1%"><a><img src="img/rsearch.png"  style="height:80%;width:100%;" onclick="return ButtonPtzDirection_onclickStop(1)"/></a></td>
									<td></td>
									<td><a><img src="img/right.png"  style="height:80%;width:100%;" onclick="return ButtonPtzDirection_onclick(4)"/></a></td>
								</tr>
								<tr height="14%">
									<td></td>
									<td style="left:-2%"><a><img src="img/bottomleft.png"  style="height:46%;width:50%;" onclick="return ButtonPtzDirection_onclick(6)"/></a></td>
									<td></td>
									<td style="right:-5%"><a><img src="img/bottomright.png"  style="height:46%;width:50%;" onclick="return ButtonPtzDirection_onclick(8)"/></a></td>
									<td></td>
								</tr>
								<tr height="24%">
									<td></td>
									<td></td>
									<td style="left:-2%"><a><img src="img/bottom.png"  style="height:80%;width:100%;" onclick="return ButtonPtzDirection_onclick(2)"/></a></td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</div>
						<div class="down_">
							<table style="width:100%;height:100%">
								<tr>
								
									<td width="33%">
										<a><img src="img/bigger.png" style="width:50%;height:80%;"></a>
									</td>
									<td width="34%"> 
										<a><img src="img/biggest.png" style="width:50%;height:80%;" onclick="return ButtonPtzCameraOperation_onclick(0)"></a>
									</td>
									<td width="33%">
										<a><img src="img/bigger2.png" style="width:50%;height:80%;"></a>
									</td>
								</tr>
								<tr>
									<td>
										<a><img src="img/smaller.png" style="width:50%;height:80%;"></a>
									</td>
									<td>
										<a><img src="img/smallest.png" style="width:50%;height:80%;" onclick="return ButtonPtzCameraOperation_onclick(3)"></a>
									</td>
									<td>
										<a><img src="img/smaller2.png" style="width:50%;height:80%;"></a>
									</td>
								</tr>
							</table>
						</div>

					</div>
					<ul style="padding: 0;height:60%;width:100%;">
						<li style="height:10%">
							<div  class="fz" style="height:100%;">
								<span>设置窗口数量：</span>
								<!-- <input type="text" id="textWndNum" value="4" size="5"/>  -->
								<select id="textWndNum" class="button button-raised button-pill" style="width: 100%;height:100%;" onchange="return ButtonCreateWnd_onclick()">
									<option value="1" style="color: black;">1</option>
									<option value="4" style="color: black;">4</option>
									<option value="8" style="color: black;">8</option>
									<option value="9" style="color: black;">9</option>
									<option value="16" style="color: black;">16</option>
									<option value="25" style="color: black;">25</option>
								</select>
							</div>
						</li>
						<li style="overflow: hidden;margin-top: 15%;height:25%">
							<div style="float: left;height:100%;width:100%">
								<select id="selectWndStyle" class="button button-raised button-pill fz" style="width: 100%;height:45%;line-height:100%;">
									<option value="1" style="color: black;">定制风格</option>
									<option value="0" style="color: black;">默认风格</option>
								</select>
								<input type="button fz" style="width: 100%;height:45%;margin-top: 5%;line-height:100%;" id="buttonSetWndStyle" value="设置窗口风格" class="button button-raised button-pill" onclick="return ButtonSetWndStyle_onclick()" />
							</div>
						</li>
						<li style="height:25%;margin-top:5%;">
							<input class="button button-raised button-pill fz" style="width: 100%;height:49%;margin-top: 5%;line-height:100%;" type="button" id="buttonSetSmartWndFullScreen" value="一键全屏" onclick="return ButtonSetSmartWndFullScreen_onclick()" />
							<input class="button button-raised button-pill fz"  style="width: 100%;height:49%;line-height:100%;" type="button" id="buttonStopRealplayByWndNo" value="关闭视频" onclick="return ButtonStopRealplayByWndNo_onclick()" />
							<input class="button button-raised button-pill fz" style="width: 100%;height:49%;margin-top: 5%;line-height:100%;" type="button" id="buttonStopRealplayByWndNo" value="关闭全部" onclick="return ButtonStopRealplayByWndNo_all()" />

						</li>
					</ul>

				</div>
				<div style="border:1px solid white;padding:5px;display:none">
					<div style="margin-left: 10px;">
						云台操作</br>
						步长：
						<select id="selectPtzDirectionStep">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
						</select>
						</br>
						<!--<input type="button" id="" value="开始云台" onclick="return ButtonPtzDirection_onclickStop(0)" />-->
						<table>
							<tr>
								<td width="50px;" align="center"><input type="button" id="" value="左上" onclick="return ButtonPtzDirection_onclick(5)" /></td>
								<td width="50px;" align="center"><input type="button" class="button" id="" value="&nbsp;&nbsp;上&nbsp;&nbsp;" onclick="return ButtonPtzDirection_onclick(1)" /></td>
								<td width="50px;" align="center"><input type="button" id="" value="右上" onclick="return ButtonPtzDirection_onclick(7)" /></td>
							</tr>
							<tr>
								<td align="center"><input type="button" id="" value="&nbsp;&nbsp;左&nbsp;&nbsp;" onclick="return ButtonPtzDirection_onclick(3)" /></td>
								<td align="center"><input type="button" id="" value="停止" onclick="return ButtonPtzDirection_onclickStop(1)" /></td>
								<td align="center"><input type="button" id="" value="&nbsp;&nbsp;右&nbsp;&nbsp;" onclick="return ButtonPtzDirection_onclick(4)" /></td>
							</tr>
							<tr>
								<td align="center"><input type="button" id="" value="左下" onclick="return ButtonPtzDirection_onclick(6)" /></td>
								<td align="center"><input type="button" class="button" id="" value="&nbsp;&nbsp;下&nbsp;&nbsp;" onclick="return ButtonPtzDirection_onclick(2)" /></td>
								<td align="center"><input type="button" id="" value="右下" onclick="return ButtonPtzDirection_onclick(8)" /></br>
								</td>
							</tr>
						</table>
						</br>

						</br>
					</div>
					<div style="width:50%; float:left;display:none">
						登陆登出</br>
						IP： &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<input type="text" id="textIP" value="31.16.10.79" size="10" /></br>
						端口： &nbsp;&nbsp; <input type="text" id="textPort" value="9000" size="10" /></br>
						用户名：&nbsp;<input type="text" id="textUser" value="admin" size="10" /></br>
						密码： &nbsp;&nbsp;&nbsp;<input type="text" id="textPassword" value="admin" size="10" /></br>
						</br>

						<input type="button" id="buttonLogin" value="登录" class="button" onclick="return ButtonLogin_onclick()" />
						<input type="button" id="buttonLogin" value="异步登录" class="button" onclick="return ButtonAsyncLogin_onclick()" />
						<input type="button" id="buttonLogout" value="登出" class="button" onclick="return ButtonLogout_onclick()" />
						<input type="button" id="buttonLoadDGroupInfo" value="加载组织结构" class="button" onclick="return ButtonLoadDGroupInfo_onclick()" />
						<input type="button" id="buttonAsyncLoadDGroupInfo" value="异步加载组织结构" class="button" onclick="return ButtonAsyncLoadDGroupInfo_onclick()" />
						<input type="button" id="buttonGetDGroupInfo" value="获取组织结构" class="button" onclick="return ButtonGetDGroupInfo_onclick()" />
						<input type="button" id="buttonConnectDmsByChnlId" value="根据通道ID连接DMS" class="button" onclick="return ButtonConnectDmsByChnlId_onclick()" />
					</div>
					<div style="width: 50%;height: 150px;overflow: auto; float: left;display:none" id="DGroupInfo"></div>
					<div style="clear:both"></div>
				</div>
				<div style="border:1px solid white;padding:5px;display:none">
					前端摄像机抓拍</br>
					设备ID：&nbsp;<input type="text" id="DevID" value="1000726" size="8" />&nbsp;&nbsp; 通道号：&nbsp;
					<input type="text" id="ChannelNo" value="0" size="2" />&nbsp;&nbsp; 抓拍间隔(秒)：
					<input type="text" id="Interval" value="10" size="3.5" /> &nbsp;&nbsp; 请求ID号：&nbsp;
					<input type="text" id="jsonID" value="88" size="4" /> &nbsp;&nbsp;
					<input type="button" id="buttonSetSnapshotInterval" value="设置抓图间隔" class="button" onclick="return ButtonSetSnapshotInterval_onclick()" /> </br>
					设备ID：&nbsp;<input type="text" id="SnapDevID" value="1000726" size="8" />&nbsp;&nbsp; 通道号：&nbsp;
					<input type="text" id="SnapChannelNo" value="0" size="2" />&nbsp;&nbsp; 图片类型：&nbsp;
					<select id="SnapType">
						<option value="2">返回图片数据</option>
						<option value="1">返回图片地址</option>
					</select> &nbsp; 请求ID号：&nbsp;
					<input type="text" id="SnapjsonID" value="90" size="2" />&nbsp;&nbsp;
					<input type="button" id="buttonSnap" value="前端设备抓图" class="button" onclick="return ButtonSnap_onclick()" />
				</div>

				<div style="border:1px solid white;padding:5px;display:none">
					通用json发送</br>
					json字符串：&nbsp;<input type="text" id="Generaljson" size="30" /> &nbsp;&nbsp;&nbsp;&nbsp; 要发往的服务：
					<select id="selectMdl">
						<option value="0">APP模块</option>
						<option value="1">CMS模块</option>
						<option value="2">PCS模块</option>
						<option value="3">DMS模块</option>
						<option value="4">ADS模块</option>
						<option value="5">TRAN模块</option>
						<option value="6">RTSP模块</option>
						<option value="7">FTP模块</option>
						<option value="8">PEC模块</option>
						<option value="9">MGR模块</option>
						<option value="10">AREA模块</option>
						<option value="11">FORSNVD模块</option>
						<option value="12">SCS模块</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp; 传输类型：
					<select id="selectTransportType">
						<option value="0">请求</option>
						<option value="1">回复</option>
						<option value="2">通知</option>
					</select>
					</br>
					<input type="button" id="ButtonSendGeneraljson" value="发送通用json" class="button" onclick="return ButtonSendGeneraljson_onclick()" />
					</br>
					<select id="selectSubscribeAllBayCarInfo">
						<option value="1">订阅过车流量</option>
						<option value="0">取消订阅过车流量</option>
					</select>
					<input type="button" id="ButtonSubscribeAllBayCarInfo" value="过车流量" class="button" onclick="return ButtonSubscribeAllBayCarInfo_onclick()" />
					</br>
					通道名称：&nbsp;<input type="text" id="ChnlName" size="30" />
					<input type="button" id="ButtonGetChnlID" value="获取通道ID" class="button" onclick="return ButtonGetChnlID_onclick()" />
				</div>
			</li>
			<li id="tab_con_2">
				<div style="border:1px solid white;padding-top:20px;">
					<div style="margin-left: 10px;">
						实时视频</br>
						<select id="selectStreamType">
							<option value="1">主码流</option>
							<option value="2">辅码流</option>
						</select>
						<select id="selectMediaType">
							<option value="1">视频</option>
							<option value="2">音频</option>
							<option value="3">视频 + 音频</option>
						</select>
						<select id="selectTransType">
							<option value="1">TCP</option>
							<option value="0">UDP</option>
						</select>
						</br> ftp信息</br>
						ftp IP：<input type="text" id="textFtpIp" value="171.34.0.59" size="10" /> </br>
						username :<input type="text" id="textFtpName" value="dss" size="10" /> </br>
						password :<input type="text" id="textFtpPwd" value="dss" size="10" /> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" id="buttonIVSSwitchByWndNo" value="按窗口号开关智能线" onclick="return ButtonIVSSwitchByWndNo_onclick()" /> &nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" id="buttonGetExtrenUrl" value="获取外部URL" onclick="return buttonGetExtrenUrl_onclick()" />
						<div style="border:1px solid white;padding:5px;">
							按窗口号
							<input type="button" id="buttonStartRealplayByWndNo" value="播放视频" onclick="return ButtonStartRealplayByWndNo_onclick()" />
							<input type="button" id="buttonAsyncStartRealplayByWndNo" value="异步播放视频" onclick="return ButtonAsyncStartRealplayByWndNo_onclick()" />
							<input type="button" id="buttonStopRealplayByWndNo" value="关闭视频" onclick="return ButtonStopRealplayByWndNo_onclick()" />
							<input type="button" id="buttonAsyncStopRealplayByWndNo" value="异步关闭视频" onclick="return ButtonAsyncStopRealplayByWndNo_onclick()" />
							<input type="button" id="buttonCapturePictureByWndNo" value="抓图" onclick="return ButtonCapturePictureByWndNo_onclick()" />
							<input type="button" id="buttonCapturePictureByWndNoAndUpload" value="抓图并上传至ftp" onclick="return ButtonCapturePictureByWndNoAndUpload_onclick()" />
							<input type="button" id="buttonStartRealRecordByWndNo" value="开始录像" onclick="return ButtonStartRealRecordByWndNo_onclick()" />
							<input type="button" id="buttonStopRealRecordByWndNo" value="停止录像" onclick="return ButtonStopRealRecordByWndNo_onclick()" />
							<input type="button" id="buttonOpenAudioByWndNo" value="打开音频" onclick="return ButtonOpenAudioByWndNo_onclick()" />
							<input type="button" id="buttonCloseAudioByWndNo" value="关闭音频" onclick="return ButtonCloseAudioByWndNo_onclick()" />
						</div>
						<div style="border:1px solid white;padding:5px;">
							按窗口句柄
							<input type="button" id="buttonStartRealplayByHWND" value="播放视频" onclick="return ButtonStartRealplayByHWND_onclick()" />
							<input type="button" id="buttonStopRealplayByHWND" value="关闭视频" onclick="return ButtonStopRealplayByHWND_onclick()" />
							<input type="button" id="buttonCapturePictureByHWND" value="抓图" onclick="return ButtonCapturePictureByHWND_onclick()" />
							<input type="button" id="buttonCapturePictureByHWNDAndUpload" value="柄抓图并上传至ftp" onclick="return ButtonCapturePictureByHWNDAndUpload_onclick()" />
							<input type="button" id="buttonStartRealRecordByHWND" value="开始录像" onclick="return ButtonStartRealRecordByHWND_onclick()" />
							<input type="button" id="buttonStopRealRecordByHWND" value="停止录像" onclick="return ButtonStopRealRecordByHWND_onclick()" />
							<input type="button" id="buttonOpenAudioByHWND" value="打开音频" onclick="return ButtonOpenAudioByHWND_onclick()" />
							<input type="button" id="buttonCloseAudioByHWND" value="关闭音频" onclick="return ButtonCloseAudioByHWND_onclick()" />
						</div>
					</div>
					<div style="border:1px solid white;padding:5px;">
						音频通道数：<input type="text" id="textAudioNum" value="0" size="5" /> 音频通道号：
						<input type="text" id="textAudioIndex" value="0" size="5" /> 音频状态：
						<input type="text" id="textAudioState" value="0" size="5" /> </br>
						<div style="border:1px solid white;padding:5px;">
							按窗口号
							<input type="button" id="buttonGetAudioChannelsByWndNo" value="获取音频通道数量" onclick="return ButtonGetAudioChannelsByWndNo_onclick()" />
							<input type="button" id="buttonGetAudioChannelStateByWndNo" value="获取通道状态" onclick="return ButtonGetAudioChannelStateByWndNo_onclick()" />
							<input type="button" id="buttonSetAudioChannelByWndNo" value="设置通道状态" onclick="return ButtonSetAudioChannelByWndNo_onclick()" />
						</div>
						<div style="border:1px solid white;padding:5px;">
							按窗口句柄
							<input type="button" id="buttonGetAudioChannelsByHWND" value="获取音频通道数量" onclick="return ButtonGetAudioChannelsByHWND_onclick()" />
							<input type="button" id="buttonGetAudioChannelStateByHWND" value="获取通道状态" onclick="return ButtonGetAudioChannelStateByHWND_onclick()" />
							<input type="button" id="buttonSetAudioChannelByHWND" value="设置通道状态" onclick="return ButtonSetAudioChannelByHWND_onclick()" />
						</div>
					</div>
					<div style="border:1px solid white;padding:5px;">
						Osd信息：<input type="text" id="textOsd" value="渔船|2016-12-22 10:30:00|出港" size="40" /> </br>
						<div style="border:1px solid white;padding:5px;">
							按窗口号
							<input type="button" id="buttonSetOsdTxtByWndNo" value="设置本地窗口Osd信息" onclick="return ButtonSetOsdTxtByWndNo_onclick()" />
							<input type="button" id="buttonCleanUpOsdInfoByWndNo" value="清除本地窗口Osd信息" onclick="return ButtonCleanUpOsdInfoByWndNo_onclick()" />
							<input type="button" id="buttonSetOsdTxt" value="设置摄像头码流Osd信息" onclick="return ButtonSetOsdTxt_onclick()" />
							<input type="button" id="buttonCleanOsdTxt" value="清除摄像头码流Osd信息" onclick="return ButtonCleanOsdTxt_onclick()" /></br>
						</div>
						<div style="border:1px solid white;padding:5px;">
							按窗口句柄
							<input type="button" id="buttonSetOsdTxtByHWND" value="设置本地窗口Osd信息" onclick="return ButtonSetOsdTxtByHWND_onclick()" />
							<input type="button" id="buttonCleanUpOsdInfoByHWND" value="清除本地窗口Osd信息" onclick="return ButtonCleanUpOsdInfoByHWND_onclick()" /></br>
						</div>
					</div>
					<div style="border:1px solid white;padding:5px;">
						亮度：<input type="text" id="textBrightness" value="64" size="5" /> 对比度：
						<input type="text" id="textContract" value="64" size="5" /> 饱和度：
						<input type="text" id="textSaturation" value="64" size="5" /> 色调：
						<input type="text" id="textTone" value="64" size="5" /> </br>
						<div style="border:1px solid white;padding:5px;">
							按窗口号
							<input type="button" id="buttonAdjustColorByWndNo" value="屏幕颜色调整" onclick="return ButtonAdjustColorByWndNo_onclick()" />
						</div>
						<div style="border:1px solid white;padding:5px;">
							按窗口句柄
							<input type="button" id="buttonAdjustColorByHWND" value="屏幕颜色调整" onclick="return ButtonAdjustColorByHWND_onclick()" />
						</div>
					</div>
					<!-- <div style="margin-left: 10px; margin-top: 10px;">
			<input type="button" id="buttonGetAudioChannelsByHWND" value="DPSDK_GetAudioChannelsByHWND" onclick="return ButtonGetAudioChannelsByHWND_onclick()" />
			<input type="button" id="buttonGetAudioChannelStateByHWND" value="DPSDK_GetAudioChannelStateByHWND" onclick="return ButtonGetAudioChannelStateByHWND_onclick()" />
			<input type="button" id="buttonSetAudioChannelByHWND" value="DPSDK_SetAudioChannelByHWND" onclick="return ButtonSetAudioChannelByHWND_onclick()" /></br></br>
		</div> -->
					<div style="border:1px solid white;padding:5px;">
						IP:<input type="text" id="textJDIP" value="" size="8" /> 端口：
						<input type="text" id="textJDPort" value="" size="5" /> 硬盘录像机编码：
						<input type="text" id="textJDDvrCode" value="" size="5" /> 访问令牌：
						<input type="text" id="textJDToken" value="" size="5" />
						<input type="button" id="buttonCheckRealPlayAuth" value="在线视频播放鉴权" onclick="return ButtonCheckRealPlayAuth_onclick()" />
					</div>
				</div>
			</li>
			<li id="tab_con_3">

				<div style="border:1px solid white;padding-top:20px;">
					<div style="margin-left: 10px;">
						录像回放</br>
						来源：
						<select id="selectRecordSource">
							<option value="3">平台录像</option>
							<option value="2">设备录像</option>
						</select>
						类型：
						<select id="selectRecordType">
							<option value="0">全部录像</option>
							<option value="1">手动录像</option>
							<option value="2">报警录像</option>
							<option value="3">移动侦测</option>
							<option value="4">视频丢失</option>
							<option value="5">视频遮挡</option>
							<option value="6">定时录像</option>
							<option value="7">全天录像</option>
						</select>
						</br>
						开始时间：<input id="textStartTime" type="text" name="" value='2013-10-17 00:00:00' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00',maxDate:'%y-%M-%d',minDate:'1970-01-01 10:00:00'})" class="select-text" style="padding: 0 5px;" readonly/> 结束时间：
						<input id="textEndTime" type="text" name="" value='2013-10-17 23:59:59' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'1970-01-01 10:00:00'})" class="select-text" style="padding: 0 5px;" readonly/>
						<br /> FileIndex：
						<input id="textFileIndex" type="text" name="" value="0" size="5" /><br /> <br /> 回放：
						<br />
						<input type="button" id="buttonQueryRecord" value="查询录像" onclick="return ButtonQueryRecord_onclick()" />
						<div style="border:1px solid white;padding-top:5px;">
							按窗口号
							<input type="button" id="buttonStartFilePlaybackByWndNo" value="按文件回放" onclick="return ButtonStartFilePlaybackByWndNo_onclick()" />
							<input type="button" id="buttonStartTimePlaybackByWndNo" value="按时间回放" onclick="return ButtonStartTimePlaybackByWndNo_onclick()" />
							<input type="button" id="buttonPausePlaybackByWndNo" value="暂停回放" onclick="return ButtonPausePlaybackByWndNo_onclick()" />
							<input type="button" id="buttonResumePlaybackByWndNo" value="继续回放" onclick="return ButtonResumePlaybackByWndNo_onclick()" />
							<input type="button" id="buttonStopPlaybackByWndNo" value="停止回放" onclick="return ButtonStopPlaybackByWndNo_onclick()" />
							<input type="button" id="buttonPlaybackCaptureByWndNo" value="回放截图" onclick="return ButtonPlaybackCaptureByWndNo_onclick()" />
							<input type="button" id="buttonStartPlaybackByLocalByWndNo" value="本地回放" onclick="return ButtonStartPlaybackByLocalByWndNo_onclick()" />
						</div>
						<div style="border:1px solid white;padding-top:5px;">
							按窗口句柄
							<input type="button" id="buttonStartFilePlaybackByHWND" value="按文件回放" onclick="return ButtonStartFilePlaybackByHWND_onclick()" />
							<input type="button" id="buttonStartTimePlaybackByHWND" value="按时间回放" onclick="return ButtonStartTimePlaybackByHWND_onclick()" />
							<input type="button" id="buttonPausePlaybackByHWND" value="暂停回放" onclick="return ButtonPausePlaybackByHWND_onclick()" />
							<input type="button" id="buttonResumePlaybackByHWND" value="继续回放" onclick="return ButtonResumePlaybackByHWND_onclick()" />
							<input type="button" id="buttonStopPlaybackByHWND" value="停止回放" onclick="return ButtonStopPlaybackByHWND_onclick()" />
							<input type="button" id="buttonPlaybackCaptureByHWND" value="回放截图" onclick="return ButtonPlaybackCaptureByHWND_onclick()" />
							<input type="button" id="buttonStartPlaybackByLocalByHWND" value="本地回放" onclick="return ButtonStartPlaybackByLocalByHWND_onclick()" />
						</div>
						<br />速率：
						<div style="border:1px solid white;padding-top:5px;">
							按窗口号
							<input type="button" id="" value="1倍" onclick="return ButtonSetPlaybackSpeedByWndNo_onclick(8)" />
							<input type="button" id="" value="2倍" onclick="return ButtonSetPlaybackSpeedByWndNo_onclick(16)" />
							<input type="button" id="" value="4倍" onclick="return ButtonSetPlaybackSpeedByWndNo_onclick(32)" />
							<input type="button" id="" value="8倍" onclick="return ButtonSetPlaybackSpeedByWndNo_onclick(64)" />
							<input type="button" id="" value="1/2倍" onclick="return ButtonSetPlaybackSpeedByWndNo_onclick(4)" />
							<input type="button" id="" value="1/4倍" onclick="return ButtonSetPlaybackSpeedByWndNo_onclick(2)" />
							<input type="button" id="" value="1/8倍" onclick="return ButtonSetPlaybackSpeedByWndNo_onclick(1)" />
						</div>
						<div style="border:1px solid white;padding-top:5px;">
							按窗口句柄
							<input type="button" id="" value="1倍" onclick="return ButtonSetPlaybackSpeedByHWND_onclick(8)" />
							<input type="button" id="" value="2倍" onclick="return ButtonSetPlaybackSpeedByHWND_onclick(16)" />
							<input type="button" id="" value="4倍" onclick="return ButtonSetPlaybackSpeedByHWND_onclick(32)" />
							<input type="button" id="" value="8倍" onclick="return ButtonSetPlaybackSpeedByHWND_onclick(64)" />
							<input type="button" id="" value="1/2倍" onclick="return ButtonSetPlaybackSpeedByHWND_onclick(4)" />
							<input type="button" id="" value="1/4倍" onclick="return ButtonSetPlaybackSpeedByHWND_onclick(2)" />
							<input type="button" id="" value="1/8倍" onclick="return ButtonSetPlaybackSpeedByHWND_onclick(1)" />
						</div>
						<br /><br />下载：
						<br />
						<input type="button" id="buttonDownloadRecordByFile" value="按文件下载" onclick="return ButtonDownloadRecordByFile_onclick()" />
						<input type="button" id="buttonDownloadRecordByTime" value="按时间下载" onclick="return ButtonDownloadRecordByTime_onclick()" />
						<input type="button" id="buttonPauseDownloadRecord" value="暂停下载" onclick="return ButtonPauseDownloadRecord_onclick()" />
						<input type="button" id="buttonResumeDownloadRecord" value="继续下载" onclick="return ButtonResumeDownloadRecord_onclick()" />
						<input type="button" id="buttonStopDownloadRecord" value="停止下载" onclick="return ButtonStopDownloadRecord_onclick()" /><br />
						<br /><br /> 下载进度：
						<input type="text" id="textDownloadProgress" value="" size="5" />

						<br /><br />图片：
						<br /> 开始时间：
						<input id="textStartTimePicture" type="text" name="" value='2013-10-17 00:00:00' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00',maxDate:'%y-%M-%d',minDate:'1970-01-01 10:00:00'})" class="select-text" style="padding: 0 5px;" readonly/> 结束时间：
						<input id="textEndTimePicture" type="text" name="" value='2013-10-17 23:59:59' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d',minDate:'1970-01-01 10:00:00'})" class="select-text" style="padding: 0 5px;" readonly/>

						<input type="button" id="ButtonQueryPictureRecord" value="查询图片" onclick="return ButtonQueryPictureRecord_onclick()" />

						<br />删除：
						<br /> 图片路径：
						<input type="text" id="textPicturePath" value="" />
						<input type="button" id="ButtonDeletePictureRecord" value="查询图片" onclick="return ButtonDeletePictureRecord_onclick()" />
						<div style="border:1px solid white;padding:5px;">
							IP:<input type="text" id="textJDIP2" value="" size="8" /> 端口：
							<input type="text" id="textJDPort2" value="" size="5" /> 历史视频ID：
							<input type="text" id="textJDFileId" value="" size="5" /> 访问令牌：
							<input type="text" id="textJDToken2" value="" size="5" />
							<input type="button" id="buttonCheckPlaybackAuth" value="预约历史视频播放鉴权" onclick="return ButtonCheckPlaybackAuth_onclick()" />
						</div>

					</div>
				</div>
			</li>
			<li id="tab_con_4">
				<div style="border:1px solid white;padding-top:20px;">
					<div style="margin-left: 10px;">
						云台操作</br>
						步长：
						<select id="selectPtzDirectionStep">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
						</select>
						</br>
						<!--<input type="button" id="" value="开始云台" onclick="return ButtonPtzDirection_onclickStop(0)" />-->
						<table>
							<tr>
								<td width="50px;" align="center"><input type="button" id="" value="左上" onclick="return ButtonPtzDirection_onclick(5)" /></td>
								<td width="50px;" align="center"><input type="button" class="button" id="" value="&nbsp;&nbsp;上&nbsp;&nbsp;" onclick="return ButtonPtzDirection_onclick(1)" /></td>
								<td width="50px;" align="center"><input type="button" id="" value="右上" onclick="return ButtonPtzDirection_onclick(7)" /></td>
							</tr>
							<tr>
								<td align="center"><input type="button" id="" value="&nbsp;&nbsp;左&nbsp;&nbsp;" onclick="return ButtonPtzDirection_onclick(3)" /></td>
								<td align="center"><input type="button" id="" value="停止" onclick="return ButtonPtzDirection_onclickStop(1)" /></td>
								<td align="center"><input type="button" id="" value="&nbsp;&nbsp;右&nbsp;&nbsp;" onclick="return ButtonPtzDirection_onclick(4)" /></td>
							</tr>
							<tr>
								<td align="center"><input type="button" id="" value="左下" onclick="return ButtonPtzDirection_onclick(6)" /></td>
								<td align="center"><input type="button" class="button" id="" value="&nbsp;&nbsp;下&nbsp;&nbsp;" onclick="return ButtonPtzDirection_onclick(2)" /></td>
								<td align="center"><input type="button" id="" value="右下" onclick="return ButtonPtzDirection_onclick(8)" /></br>
								</td>
							</tr>
						</table>

						异步云台操作</br>
						<table>
							<tr>
								<td width="50px;" align="center"><input type="button" id="" value="左上" onclick="return ButtonAsyncPtzDirection_onclick(5)" /></td>
								<td width="50px;" align="center"><input type="button" class="button" id="" value="&nbsp;&nbsp;上&nbsp;&nbsp;" onclick="return ButtonAsyncPtzDirection_onclick(1)" /></td>
								<td width="50px;" align="center"><input type="button" id="" value="右上" onclick="return ButtonAsyncPtzDirection_onclick(7)" /></td>
							</tr>
							<tr>
								<td align="center"><input type="button" id="" value="&nbsp;&nbsp;左&nbsp;&nbsp;" onclick="return ButtonAsyncPtzDirection_onclick(3)" /></td>
								<td align="center"><input type="button" id="" value="停止" onclick="return ButtonAsyncPtzDirection_onclickStop(1)" /></td>
								<td align="center"><input type="button" id="" value="&nbsp;&nbsp;右&nbsp;&nbsp;" onclick="return ButtonAsyncPtzDirection_onclick(4)" /></td>
							</tr>
							<tr>
								<td align="center"><input type="button" id="" value="左下" onclick="return ButtonAsyncPtzDirection_onclick(6)" /></td>
								<td align="center"><input type="button" class="button" id="" value="&nbsp;&nbsp;下&nbsp;&nbsp;" onclick="return ButtonAsyncPtzDirection_onclick(2)" /></td>
								<td align="center"><input type="button" id="" value="右下" onclick="return ButtonAsyncPtzDirection_onclick(8)" /></br>
								</td>
							</tr>
						</table>

					</div>

				</div>
				<div style="border:1px solid white;padding-top:5px;m">
					<div style="margin-left: 10px;">
						镜头操作</br>
						倍速：
						<select id="selectCameraStep">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
						</select>
						</br>
						变焦：
						<input type="button" id="" value="变倍+" onclick="return ButtonPtzCameraOperation_onclick(0)" />
						<input type="button" id="" value="变焦+" onclick="return ButtonPtzCameraOperation_onclick(1)" />
						<input type="button" id="" value="光圈+" onclick="return ButtonPtzCameraOperation_onclick(2)" />
						<input type="button" id="" value="变倍-" onclick="return ButtonPtzCameraOperation_onclick(3)" />
						<input type="button" id="" value="变焦-" onclick="return ButtonPtzCameraOperation_onclick(4)" />
						<input type="button" id="" value="光圈-" onclick="return ButtonPtzCameraOperation_onclick(5)" />

						<!--<input type="button" id="" value="开始镜头控制" onclick="return ButtonPtzCameraOperation_onclickStop(0)" />-->
						<input type="button" id="" value="停止" onclick="return ButtonPtzCameraOperation_onclickStop(1)" />

						<br /></br>

					</div>
				</div>
				<div style="border:1px solid white;padding-top:5px;m">
					<div style="margin-left: 10px;">
						X:<input type="text" id="textXPosition" value="" size="3" /> Y:
						<input type="text" id="textYPosition" value="" size="3" /> 变倍:
						<select id="selectPtzSitStep">
							<option value="-4">-4</option>
							<option value="-3">-3</option>
							<option value="-2">-2</option>
							<option value="-1">-1</option>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
						<input type="button" id="buttonPtzSit" value="三维定位" onclick="return ButtonPtzSit_onclick()" />
					</div>
					<div style="margin-left: 10px;">
						X(1~128):<input type="text" id="textXPositionEX" value="25" size="3" /> Y(1~128):
						<input type="text" id="textYPositionEX" value="25" size="3" /> 变倍(1~128):
						<input type="text" id="selectPtzSitStepEX" value="3" size="3" /> Xspeed(-1~1):
						<input type="text" id="textXspeedEX" value="0.2" size="3" /> Yspeed(-1~1):
						<input type="text" id="textYspeedEX" value="0.2" size="3" /> Zspeed(-1~1):
						<input type="text" id="textZspeedEX" value="0.2" size="3" />
						<input type="button" id="buttonPtzSitEX" value="设置球机云台参数" onclick="return ButtonSitPtzParam_onclick()" /><br /><br /> 定位类型:
						<select id="selectPtzSittype">
							<option value="1">开速定位</option>
							<option value="2">准确定位</option>
						</select>
						<input type="button" id="buttonGetPtzParam" value="获取球机云台参数" onclick="return ButtonGetPtzParam_onclick()" /><br /></br>
					</div>
				</div>
				<div style="border:1px solid white;padding-top:5px;m">
					<div style="margin-left: 10px;">
						自动三维定位:
						<select id="selectAutoPtzSit">
							<option value="0">0 关闭</option>
							<option value="1">1 开启</option>
						</select>
						<input type="button" id="buttonAutoPtzSit" value="自动三维定位" onclick="return ButtonAutoPtzSit_onclick()" /><br /></br>
					</div>
				</div>
				<div style="border:1px solid white;padding:5px;m">
					预置点编号:
					<select id="selectPtzLockCamera">
						<option value="1">1 锁定当前</option>
						<option value="2">2 解锁当前</option>
						<option value="3">3 解锁所有</option>
					</select>
					<input type="button" id="buttonPtzLockCamera" value="锁定控制" onclick="return ButtonPtzLockCamera_onclick()" /><br /></br>
				</div>
				<div style="border:1px solid white;padding-top:5px;m">
					<div style="margin-left: 10px;">
						预置点编号:<input type="text" id="textPrePointNum" value="" size="5" /> 预置点名称:
						<input type="text" id="textPrePointName" value="" size="5" />
						<input type="button" id="buttonAddPrePoint" value="添加预置点" onclick="return ButtonAddPrePoint_onclick()" />
						<input type="button" id="buttonDelPrePoint" value="删除预置点" onclick="return ButtonDelPrePoint_onclick()" />
						<input type="button" id="buttonQueryPrePoint" value="查询预置点" onclick="return ButtonQueryPrePoint_onclick()" />
						<input type="button" id="buttonSeekPrePoint" value="定位预置点" onclick="return ButtonSeekPrePoint_onclick()" /></br>
						</br>
					</div>
				</div>
				<div style="border:1px solid white;padding-top:5px;m">
					球机通道ID:<input type="text" id="viewinfoCameraID" value="1000028$1$0$3" size="15" />
					<input type="button" id="buttonQueryChannelViewInfo" value="查询球机可视域" onclick="return ButtonQueryChannelViewInfo_onclick()" /> 设备ID:
					<input type="text" id="viewinfoDeviceID" value="1000028" size="10" />
					<input type="button" id="buttonQueryDeviceViewInfo" value="查询设备球机通道可视域" onclick="return ButtonQueryDeviceViewInfo_onclick()" />
				</div>
			</li>
			<li id="tab_con_5">
				<div style="border:1px solid white;padding:20px;">
					开始时间：<input id="textAlarmStartTime" type="text" name="" value='2013-10-17 00:00:00' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00',maxDate:'%y-%M-%d',minDate:'1970-01-01 10:00:00'})" class="select-text" style="padding: 0 5px;" readonly/>
					</br>
					结束时间：<input id="textAlarmEndTime" type="text" name="" value='2013-10-17 23:59:59' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d',minDate:'1970-01-01 10:00:00'})" class="select-text" style="padding: 0 5px;" readonly/>
					<br />
					<select id="selectAlarmType">
						<option value="1">1 视频丢失</option>
						<option value="2">2 外部报警</option>
						<option value="3">3 移动侦测</option>
						<option value="4">4 视频遮挡</option>
						<option value="5">5 硬盘满</option>
						<option value="6">6 硬盘故障</option>
						<option value="302">302 警戒线事件</option>
						<option value="303">303 警戒区事件</option>
						<option value="304">304 贴条事件</option>
					</select>
					</br>
					<input type="button" id="ButtonQueryAlarmInfo" value="查询报警信息" onclick="return ButtonQueryAlarmInfo_onclick()" />
				</div>
				<div style="border:1px solid white;padding:5px;m">
					设备ID:<input id="textDeviceID" type="text" value="" style="width:auto " size="10" /></br>
					视频通道:<input id="textVideoChan" type="text" value="-1" size="5" /></br>
					报警通道:<input id="textAlarmChan" type="text" value="-1" size="5" /></br>
					<select id="selectAlarmType2">
						<option value="1">1 视频丢失</option>
						<option value="2">2 外部报警</option>
						<option value="3">3 移动侦测</option>
						<option value="4">4 视频遮挡</option>
						<option value="5">5 硬盘满</option>
						<option value="6">6 硬盘故障</option>
						<option value="302">302 警戒线事件</option>
						<option value="303">303 警戒区事件</option>
						<option value="304">304 贴条事件</option>
					</select>
					</br>
					<input id="textEnableAlarm" type="button" value="布控" onclick="return ButtonEnableAlarm_onclick()" />
					<input id="textDisableAlarm" type="button" value="撤控" onclick="return ButtonDisableAlarm_onclick()" />
				</div>
			</li>
			<li id="tab_con_7">
				<div style="border:1px solid white;padding:20px;">
					开始时间：<input id="textFtpStartTime" type="text" name="" value='2013-10-17 00:00:00' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00',maxDate:'%y-%M-%d',minDate:'1970-01-01 10:00:00'})" class="select-text" style="padding: 0 5px;" readonly/>
					</br>
					结束时间：<input id="textFtpEndTime" type="text" name="" value='2013-10-17 23:59:59' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'1970-01-01 10:00:00'})" class="select-text" style="padding: 0 5px;" readonly/>
					<br />
					<input type="button" id="ButtonQueryFtpPicInfo" value="查询" onclick="return ButtonQueryFtpPicInfo_onclick()" /><br /> 需要删除的Ftp图片路径:
					<input id="textFtpPic" type="text" value="" style="width:auto " />
					<input type="button" id="ButtonDelFtpPic" value="删除" onclick="return ButtonDelFtpPic_onclick()" />
				</div>
			</li>
			<li id="tab_con_6">
				<div style="border:1px solid white;padding:20px;">
					对讲类型：
					<select id="selectDevType">
						<option value="1">1 设备</option>
						<option value="2">2 通道</option>
					</select>
					</br>
					音频格式：
					<select id="selectAudioType">
						<option value="1">1 PCM</option>
						<option value="2">2 G711a</option>
						<option value="3">3 AMR</option>
						<option value="4">4 G711u</option>
						<option value="5">5 G726</option>
						<option value="6">6 AAC</option>
						<option value="7">7 G722</option>
						<option value="8">8 G711</option>
					</select>
					</br>
					采样位数：
					<select id="selectBitType">
						<option value="8">8</option>
						<option value="16">16</option>
					</select>
					</br>
					采样频率：
					<select id="selectSampleType">
						<option value="8000">8000</option>
						<option value="16000">16000</option>
						<option value="8192">8192</option>
						<option value="48000">48000</option>
					</select>
					</br>
					传输类型：
					<select id="selectTransType">
						<option value="1">1 tcp</option>
						<option value="2">2 udp</option>
					</select>
					</br>
					<input type="button" id="ButtonStartTalk" value="打开语音对讲" onclick="return ButtonStartTalk_onclick()" />
					<input type="button" id="ButtonStopTalk" value="关闭语音对讲" onclick="return ButtonStopTalk_onclick()" />
				</div>
			</li>
			<li id="tab_con_8">
				<div style="border:1px solid white;padding:20px;">
					<input type="button" id="ButtonGetTVWallAmount" value="获取电视墙总数" onclick="return getWallCount()" />
					<input type="button" id="ButtonGetWallInfo" value="获取电视墙信息" onclick="return getWallInfo()" />
					<select id="wallid"></select>
					</br>
					<input type="button" id="ButtonGetWallLayout" value="获取电视墙布局" onclick="return getWallLayout()" /></br>
					<input type="button" id="ButtonGetOneWallLayout" value="得到一个电视墙布局" onclick="return getOneWallLayout()" />
				</div>
				<div style="border:1px solid white;padding:5px;">
					screenId(从电视墙布局xml中获取):<input type="text" id="textScreenId" value="" size="5" /></br>
					分割数：<input type="text" id="textSplitCount" value="4" size="5" /></br>
					<input type="button" id="ButtonSplitCount" value="分割" onclick="return CutWall()" />
					<input type="button" id="ButtonClearScreen" value="清屏" onclick="return WallClean()" />
				</div>
				<div style="border:1px solid white;padding:5px;">
					screenId(从电视墙布局xml中获取):<input type="text" id="textScreenId2" value="" size="5" /></br>
					通道ID:<input type="text" id="textCamId" value="" size="5" /></br>
					窗口号：<input type="text" id="textWndNo" value="4" size="5" /></br>
					<input type="button" id="ButtonWallSet" value="设置视频源" onclick="return wallset()" />
					<input type="button" id="ButtonWallClose" value="关闭视频源" onclick="return wallclose()" />
				</div>
				<div style="border:1px solid white;padding:5px;">
					<div style="width: 90%;overflow: auto;" id="wallinfoxml">

					</div>
				</div>
			</li>
			<li id="tab_con_9">
				<div style="border:1px solid white;padding:20px;">
					刻录控制</br>
					设备ID:<input type="text" id="Devceid" value="1000004" size="5" /></br>
					控制命令：
					<select id="selectcmd">
						<option value="1">开始</option>
						<option value="2">暂停</option>
						<option value="3">继续</option>
						<option value="4">停止</option>
						<option value="5">手动换盘</option>
					</select>
					</br>
					通道号：<input type="text" id="Channelid" value="0" size="1" /></br>
					刻录机掩码：
					<select id="selectmask">
						<option value="1">光驱1</option>
						<option value="2">光驱2</option>
						<option value="3">双光驱</option>
					</select>
					</br>
					刻录模式：
					<select id="selectmode">
						<option value="0">BURN_MODE_SYNC</option>
						<option value="1">BURN_MODE_TURN</option>
						<option value="2">BURN_MODE_CYCLE</option>
					</select>
					</br>
					刻录流模式：
					<select id="selectpack">
						<option value="0">DHAV</option>
						<option value="1">BURN_PACK_PS</option>
					</select>
					</br>
					<input type="button" id="ButtonControlDevBurner" value="刻录控制" onclick="return ButtonControlDevBurner_onclick()" />
				</div>
				<div style="border:1px solid white;padding:20px;">
					刻录查询</br>
					设备ID:<input type="text" id="Devceid_query" value="1000004" size="5" /></br>
					刻录机ID：<input type="text" id="burnerId" value="0" size="1" /></br>
					<input type="button" id="ButtonGetDevBurnerCDState" value="刻录状态查询" onclick="return ButtonGetDevBurnerCDState_onclick()" />
				</div>
			</li>
			<li id="tab_con_10">
				<div style="border:1px solid white;padding:20px;">
					</br>远程开门</br>
					通道ID:<input type="text" id="DoorChannelid" value="1000000$7$0$0" size="20" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" id="ButtonOpenDoor" value="开门" onclick="return ButtonOpenDoor_onclick()" />
				</div>
				<div style="border:1px solid white;padding:20px;">
					查询网络报警主机状态</br>
					设备ID:<input type="text" id="NetHostStatusDevceid" value="1000002" size="10" /></br>
					<input type="button" id="ButtonQueryNetAlarmHostStatus" value="查询网络报警主机状态" onclick="return ButtonQueryNetAlarmHostStatus_onclick()" />
				</div>
				<div style="border:1px solid white;padding:20px;">
					网络报警主机操作</br>
					设备/通道ID:<input type="text" id="NetHostDevceid" value="1000004" size="10" /></br>
					操作类型:
					<select id="operationtype">
						<option value="1">设备布/撤防</option>
						<option value="2">通道布/撤防</option>
						<option value="3">报警输出通道操作</option>
					</select>
					</br>
					控制命令:
					<select id="NetHostcmd">
						<option value="1">报警主机布防</option>
						<option value="2">报警主机撤防</option>
						<option value="3">报警主机旁路</option>
						<option value="4">取消键盘指示灯显示</option>
						<option value="5">设置报警主机取消报警是自动的还是客户端手动取消</option>
						<option value="6">取消报警上报</option>
						<option value="7">报警主机输出通道打开</option>
						<option value="8">报警主机输出通道关闭</option>
						<option value="9">门禁通道开启</option>
						<option value="10">门禁通道关闭</option>
						<option value="11">门禁通道自动</option>
						<option value="12">门禁通道常开</option>
						<option value="13">门禁通道常关</option>
					</select>
					</br>
					开始时间：<input type="text" id="NetHostStartTime" value="0" size="1" />&nbsp;&nbsp;&nbsp;&nbsp;结束时间：<input type="text" id="NetHostEndTime" value="0" size="1" /></br>
					<input type="button" id="ButtonControlNetAlarmHostCmd" value="控制网络报警主机" onclick="return ButtonControlNetAlarmHostCmd_onclick()" />
				</div>
				<div style="border:1px solid white;padding:20px;">
					视频报警主机操作</br>
					设备ID:<input type="text" id="VideoHostDevceid" value="1000002" size="5" /></br>
					通道号:<input type="text" id="VideoHostChannelNO" value="-1" size="3" /></br>
					控制命令:
					<select id="VideoHostcontrolType">
						<option value="1">针对设备布防</option>
						<option value="2">针对设备撤防</option>
						<option value="3">在家布防</option>
						<option value="4">外出布防</option>
						<option value="5">针对通道旁路</option>
						<option value="6">针对通道取消旁路</option>
						<option value="7">针对通道消警</option>
					</select>
					</br>
					<input type="button" id="ButtonControlVideoAlarmHost" value="控制视频报警主机" onclick="return ButtonControlVideoAlarmHost_onclick()" />
				</div>
			</li>
		</ul>
		<div style="position:absolute;left:23%;top:0px;width:77%;height:100%;display:none;">
			<div style="width: 90%;height: 30px;overflow: auto;display:;" id="RetInfo">
				 </div>
			<div style="width: 90%;height: 30px;overflow: auto;display:none;" id="GlobalInfo">

			</div>

			<div class="box_top"></div>
			<div id="mviewl">
				<object id="DPSDK_OCX" name="DPSDK_OCX" classid="CLSID:D3E383B6-765D-448D-9476-DFD8B499926D" style="width: 100%; height: 100%" codebase="DpsdkOcx.cab#version=1.0.0.0"></object>
			</div>
			<!--<div class="box_bottom">
          <div class="box_bottom_btn">
           		<ul>
           			<li id="back_btn_li"><a class="back_btn"  href="javascript:back();" onmousedown="mousedown(this)" onmouseup="mouseup(this)" ></a></li>
           			<li><a class="play_btn" href="javascript:stop();" onmousedown="mousedown(this)" onmouseup="mouseup(this)"></a></li>
           			<li><a class="stop_btn" href="javascript:play();" onmousedown="mousedown(this)" onmouseup="mouseup(this)"></a></li>
           			<li><a class="go_btn" href="javascript:go();" onmousedown="mousedown(this)" onmouseup="mouseup(this)"></a></li>
           			<li><a class="photo_btn" href="javascript:photo();" onmousedown="mousedown(this)" onmouseup="mouseup(this)"></a></li>
           		</ul>
           </div>

	
	
	<div class="box_bottom_a"><a href='DSSClientOCX.exe'>点击这里手动下载最新的控件</a></div>
</div>-->

			<div style="border:1px solid white;padding-top:5px;display:none">
				通道ID：<input type="text" id="textCameraID" value="1000001$1$0$0" />
			</div>

			<div style="display:none">
				<ul id="tab">
					<li class="on" id="tab_1" onclick="switchTab(1)">登录</li>
					<li class="on" id="tab_2" onclick="switchTab(2)">实时</li>
					<li class="on" id="tab_3" onclick="switchTab(3)">回放与下载</li>
					<li class="on" id="tab_4" onclick="switchTab(4)">云台</li>
					<li class="on" id="tab_5" onclick="switchTab(5)">报警</li>
					<li class="on" id="tab_6" onclick="switchTab(6)">语音对讲</li>
					<li class="on" id="tab_7" onclick="switchTab(7)">Ftp图片</li>
					<li class="on" id="tab_8" onclick="switchTab(8)">电视墙</li>
					<li class="on" id="tab_9" onclick="switchTab(9)">刻录</li>
					<li class="on" id="tab_10" onclick="switchTab(10)">门禁</li>
				</ul>
			</div>
		</div>
		
		<div style="width: 90%;height: 60px;overflow: auto;display:none" id="JsonResult">
		</div>

	</body>
	<script language="javascript">
		setTimeout(function() {
			if(document.all) {
				document.getElementById("buttonLogin").click();
			} else {
				var e = document.createEvent("MouseEvents");
				e.initEvent("click", true, true);
				document.getElementById("buttonLogin").dispatchEvent(e);
				ButtonAsyncLoadDGroupInfo_onclick();
			}
		}, 1000);

		function townsaber() {
			if(document.all) {
				document.getElementById("buttonStartRealplayByWndNo").click();
			} else {
				var e = document.createEvent("MouseEvents");
				e.initEvent("click", true, true);
				document.getElementById("buttonStartRealplayByWndNo").click();
				ButtonLoadDGroupInfo_onclick();
			}
		}
	</script>

</html>