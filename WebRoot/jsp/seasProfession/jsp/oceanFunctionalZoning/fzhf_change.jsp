<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />

		<link href="${contextPath}/css/yy.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/select-ui.min.js"></script>
		<script type="text/javascript" src="${contextPath}/js/editor/kindeditor.js"></script>

		<script type="text/javascript">
			function checkAll() {
				var cb = document.getElementById("cb");
				var chks = document.getElementsByName("chk");
				if(cb.checked == true) {
					for(var i = 0; i < chks.length; i++) {
						chks[i].checked = true;
					}
				} else {
					for(var i = 0; i < chks.length; i++) {
						chks[i].checked = false;
					}
				}
			}

			<!--使用onchange="jumpMenu()"触发jumpMenu()方法-->
			function jumpMenu(e) {
				window.location.href = e.value;
			}
		</script>
		<script type="text/javascript">
            $(document).ready(function(){
                var mc = $("#");
                getMc();
            });
            //获取功能区划名称和ID
            function getMc() {
                $.ajax({
                    type:"post",
                    dataType:"json",
                    url:"${contextPath}/zon/zon_fetchGnqhMc.do",
                    success: function(d){
                        for(var i=0;i<d.length;i++){
                            // alert(d);
                            $("<option value= '"+d[i][0]+","+d[i][1]+"'>"+d[i][1]+"</option>").appendTo("#gnqhmc");
                        }
                    }
                });
            }

            //保存
            $(document).ready(function(){
                $("#updatefzhf").click(function(){
                    document.myForm.action="<%=basePath%>/zon/zon_updateFzqh.do";
                    document.myForm.target="_self";
                    document.myForm.submit();
                });

                $("#goback").click(function () {
                    document.myForm.action="<%=basePath%>/zon/zon_gobackFzhf.do";
                    document.myForm.target="_self";
                    document.myForm.submit();
                })

            });

		</script>
	</head>

	<body>
	<form name="myForm" method="post" >
		<div class="place">
			<span><img src="${contextPath}/images/seasProfession/ico01.png" width="22" height="22" />位置：</span>
			<ul class="placeul">
				<li><a href="#">海洋功能区划管理</a></li>
				<li><a href="#">辅助划分</a></li>
				<li><a href="#">修改</a></li>
			</ul>
		</div>

		<div class="formbody">
			<div class="leftinfo" >
				<div class="listtitle"><img src="${contextPath}/images/f03.png" width="20" height="20" />修改</div>
			<table width="100%" align="center" style="text-align:left;" class="tablelist2">
				<tr>
					<td >功能区名称：</td>
					<td colspan="6">
						<input name="hysyywHygnqhFzhf.gnqhmc" id="hysyywHygnqhFzhf.gnqhmc" type="text" class="scinput" value="${hysyywHygnqhFzhf.gnqhmc}" style=" width:250px;height:20px;" />
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">辅助划分名称：</td>
					<td>
						<input name="hysyywHygnqhFzhf.fzhfmc" id="hysyywHygnqhFzhf.fzhfmc" type="text" class="scinput" value="${hysyywHygnqhFzhf.fzhfmc}" style="width:250px;height:20px;" />
					</td>
					<td style="background-color:#f5f8fa;">编制：</td>
					<td>
						<select name="hysyywHygnqhFzhf.bz" id="bz" style="width:250px;height:25px;">
							<option ${hysyywHygnqhFzhf.bz==""?"selected=selected":""} value="">-请选择-</option>
							<option ${hysyywHygnqhFzhf.bz=="定期"?"selected=selected":""} value="定期">定期</option>
							<option ${hysyywHygnqhFzhf.bz=="不定期"?"selected=selected":""} value="不定期">不定期</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">是否允许建立设施：</td>
					<td>
						<select name="hysyywHygnqhFzhf.sfyxjlss" id="hysyywHygnqhFzhf.sfyxjlss" style="width:250px;height:25px;">
							<option ${hysyywHygnqhFzhf.sfyxjlss==""?"selected=selected":""} value="">-请选择-</option>
							<option ${hysyywHygnqhFzhf.sfyxjlss=="是"?"selected=selected":""} value="是">是</option>
							<option ${hysyywHygnqhFzhf.sfyxjlss=="否"?"selected=selected":""} value="否">否</option>
						</select>
					</td>
					<td style="background-color:#f5f8fa;">设施包括：</td>
					<td><textarea name="hysyywHygnqhFzhf.ssnr" id="hysyywHygnqhFzhf.ssnr" style="width:250px;height:40px; overflow:auto;" /></textarea>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">是否允许人员作业：</td>
					<td>
						<select name="hysyywHygnqhFzhf.sfyxryzy" id="hysyywHygnqhFzhf.sfyxryzy" style="width:250px;height:25px;">
							<option ${hysyywHygnqhFzhf.sfyxryzy==""?"selected=selected":""} value="">-请选择-</option>
							<option ${hysyywHygnqhFzhf.sfyxryzy=="是"?"selected=selected":""} value="是">是</option>
							<option ${hysyywHygnqhFzhf.sfyxryzy=="否"?"selected=selected":""} value="否">否</option>
						</select>
					</td>
					<td style="background-color:#f5f8fa;">作业内容：</td>
					<td><textarea name="hysyywHygnqhFzhf.zynr" id="hysyywHygnqhFzhf.zynr" style="width:250px;height:30px; overflow:auto;" >${hysyywHygnqhFzhf.zynr }</textarea>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">规划简介：</td>
					<td><textarea name="hysyywHygnqhFzhf.ghjj" id="hysyywHygnqhFzhf.ghjj" style="width:250px;height:30px; overflow:auto;" >${hysyywHygnqhFzhf.ghjj }</textarea>
					</td>
					<td style="background-color:#f5f8fa;">规划用海功能定位：</td>
					<td><textarea name="hysyywHygnqhFzhf.ghyhgndw" id="hysyywHygnqhFzhf.ghyhgndw" style="width:250px;height:30px; overflow:auto;" >${hysyywHygnqhFzhf.ghyhgndw }</textarea>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">规划填海面积：</td>
					<td>
						<input name="hysyywHygnqhFzhf.ghthmj" value="${hysyywHygnqhFzhf.ghthmj}" type="text" style="width:250px;height:30px; overflow:auto;" ></input>公顷
					</td>
					<td style="background-color:#f5f8fa;">规划用海面积：</td>
					<td>
						<input name="hysyywHygnqhFzhf.ghyhmj" id="hysyywHygnqhFzhf.ghyhmj"  value="${hysyywHygnqhFzhf.ghyhmj}" type="text" style="width:250px;height:30px; overflow:auto;" >公顷
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">规划类型：</td>
					<td><textarea name="hysyywHygnqhFzhf.ghlx" id="hysyywHygnqhFzhf.ghlx" style="width:250px;height:30px; overflow:auto;" >${hysyywHygnqhFzhf.ghlx}</textarea>
					</td>
					<td style="background-color:#f5f8fa;">规划期限：</td>
					<td><textarea name="hysyywHygnqhFzhf.ghqx" id="hysyywHygnqhFzhf.ghqx" style="width:250px;height:30px; overflow:auto;" >${hysyywHygnqhFzhf.ghqx}</textarea>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f5f8fa;">禁止项：</td>
					<td><textarea name="hysyywHygnqhFzhf.jzx" id="hysyywHygnqhFzhf.jzx" style="width:250px;height:30px; overflow:auto;" >${hysyywHygnqhFzhf.jzx}</textarea>
					</td>
					<td style="background-color:#f5f8fa;">适宜项：</td>
					<td><textarea name="hysyywHygnqhFzhf.syx" id="hysyywHygnqhFzhf.syx" style="width:250px;height:30px; overflow:auto;" >${hysyywHygnqhFzhf.syx}</textarea>
					</td>
				</tr>

				<tr>
					<td style="background-color:#f5f8fa;">不适宜项：</td>
					<td><textarea name="hysyywHygnqhFzhf.bsyx" id="hysyywHygnqhFzhf.bsyx" style="width:250px;height:30px; overflow:auto;" >${hysyywHygnqhFzhf.bsyx}</textarea>
					</td>
					<td style="background-color:#f5f8fa;">描述：</td>
					<td><textarea name="hysyywHygnqhFzhf.ms" id="hysyywHygnqhFzhf.ms" style="width:250px;height:30px; overflow:auto;" >${hysyywHygnqhFzhf.ms}</textarea>
					</td>
				</tr>

				<tr>
					<td colspan="4" style="text-align:center;">
						<input type="button" class="scbtn1" id="updatefzhf" name="btn"  value="保存">
						<input name="fh" id="goback" type="button" value="返回" class="scbtn1"  />
					</td>
				</tr>
			</table>
		</div>

		<input name="hysyywHygnqhFzhf.id" id="hysyywHygnqhFzhf.id" value="${hysyywHygnqhFzhf.id }" type="hidden" />
		<input name="hysyywHygnqhFzhf.addtime" id="hysyywHygnqhFzhf.addtime" value="${hysyywHygnqhFzhf.addtime }" type="hidden" />
		<input name="hysyywHygnqhFzhf.addusername" id="hysyywHygnqhFzhf.addusername" value="${hysyywHygnqhFzhf.addusername }" type="hidden" />
		<input name="hysyywHygnqhFzhf.adduserid" id="hysyywHygnqhFzhf.adduserid" value="${hysyywHygnqhFzhf.adduserid }" type="hidden" />

		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>

		</div>
	</form>
	</body>

</html>