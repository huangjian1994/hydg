/**
 * canvas
 */

//关闭网页
$(window).unload(function(){
    //响应事件
	$.ajax({
        url: pageurl + '/hydg/seaRecord/seaRecord_exitznspfx.do',
        type: "post",
        async: false,
        success: function() {
			
        }        
    })
}); 
window.onbeforeunload = function(event) {
	$.ajax({
        url: pageurl + '/hydg/seaRecord/seaRecord_exitznspfx.do',
        type: "post",
        async: false,
        success: function() {
			
        }        
    })
};
var host = window.location.host; // 获取当前页面域名
var pageurl = 'http://' + host;
var isOne = true;//是否是第一个摄像头

//切换摄像头
function ctrol_button(){
    if (isOne) {
        $(".left .dt").hide();
        $(".left .pt").show();
        $(".ctrol_button input:button").val("切换摄像头：当前为摄像头B");        
        isOne = false;
    }else{
        $(".left .pt").hide();
        $(".left .dt").show();
        $(".ctrol_button input:button").val("切换摄像头：当前为摄像头A");
        isOne = true;
    }
}
//获取全景图
function qjt(obj,index) {	
    $.ajax({
        url: pageurl + '/hydg/seaRecord/seaRecord_getFullImage.do',
        data:{"cam":index},
        type: "post",
        async: false,
        success: function() {
    		var r = Math.random()//生成随机数
    		clearInterval(timer);
	    	$(".bottom").empty();
	        if(index == "A"){
	        	$(".bottom").append('<img src="'+pageurl+'/hydg/files/A_Panorama.png?r='+ r +'" alt="" />');
	        }
	        if(index == "B"){
	        	$(".bottom").append('<img src="'+pageurl+'/hydg/files/B_Panorama.png?r='+ r +'" alt="" />')
	        }
	        $(".bottom").show();
	        $(".bottom").on("click",function(){	           	
	        	clearInterval(timer);
	        	getShip();
	        	$(".bottom").hide();
	        })
        }        
    })
    
}
//停止追踪
function tzzz(obj,index) {
	$(obj).hide();
    $(obj).parent().find(".qjt").show();
    if(index == "A"){
    	$.ajax({
            url: pageurl + '/hydg/seaRecord/seaRecord_stop_track.do',
            data:{"camera":"A"},
            type: "post",
            async: false,
            success: function() {}
        })
    }else if(index == "B"){
    	$.ajax({
            url: pageurl + '/hydg/seaRecord/seaRecord_stop_track.do',
            data:{"camera":"B"},
            type: "post",
            async: false,
            success: function() {}
        })
    }
    
}
$(document).ready(function() {
    var myCanvas1 = document.getElementById("myCanvas1");
    var myCanvas2 = document.getElementById("myCanvas2");
    var ctx1 = myCanvas1.getContext("2d");
    var ctx2 = myCanvas2.getContext("2d");
    var x = myCanvas1.width / 2;
    var y = myCanvas1.height / 2;
    var w = $("#myCanvas1").width();
    var h = $("#myCanvas1").height();
    var clickXY = []; //定义点击范围     
    //获取船的数据
    getShip = function(){ 
    	timer = setInterval(function() {
            $.ajax({
                url: pageurl + '/hydg/seaRecord/seaRecord_getShip.do',
                async: true,
                datatype: "json",
                cache: false,
                success: function(json) {
                    var data = eval(json);
                    console.log(data);
                    for (var i = 0; i < data.length; i++) {
                        console.log(data[i].camera_num);
                        if (data[i].camera_num == "A") {
                            drawShipA(data[i], i);
                        } else if (data[i].camera_num == "B") {
                            drawShipB(data[i], i);
                        } else {
                            //alert("摄像头编号不存在")
                        }
                    }
                }
            })
        }, 20000)
    }
    getShip();
    //画船
    function drawShipA(data, i) {
        if (!(data.ship_world_x == 0 && data.ship_world_y == 0)) {
            ctx1.clearRect(0, 0, myCanvas1.width, myCanvas2.height);
            var ship = new Image();
            ship.src = pageurl + "/hydg/images/ship.png";
            //console.log(ship);
            var _x = (data.ship_world_x / 8000) * x + x;
            var _y = y - (data.ship_world_y / 8000) * y;
            ship.onload = function() {
                //console.log(_x, _y);
                ctx1.drawImage(ship, _x, _y, 10, 10);
                clickXY.push({ x: _x, y: _y, r: 10, i: data.ship_num, camera_num: data.camera_num });
            }
        } else {
            //alert("未发现船只");
        }

    }
    function drawShipB(data, i) {
        if (!(data.ship_world_x == 0 && data.ship_world_y == 0)) {
            ctx2.clearRect(0, 0, myCanvas2.width, myCanvas2.height);
            var ship = new Image();
            ship.src = pageurl + "/hydg/images/ship.png";
            //console.log(ship);
            var _x = (data.ship_world_x / 8000) * x + x;
            var _y = y - (data.ship_world_y / 8000) * y;
            ship.onload = function() {
                //console.log(_x, _y);
                ctx2.drawImage(ship, _x, _y, 10, 10);
                clickXY.push({ x: _x, y: _y, r: 10, i: data.ship_num, camera_num: data.camera_num });
            }
        } else {
            //alert("未发现船只");
        }

    }
    //船的点击事件    
    function shipClick(canvas) {
        canvas.addEventListener("click", function(e) {        	
            var xx = (event.pageX - canvas.getBoundingClientRect().left) * (2 * x / w);
            var yy = (event.pageY - canvas.getBoundingClientRect().top) * (2 * y / h);
            for (var i in clickXY) {
                if (xx > clickXY[i].x && xx < (clickXY[i].x + clickXY[i].r) && yy > clickXY[i].y && yy < (clickXY[i].y + clickXY[i].r)) {
                    //console.log(clickXY[i].camera_num);
                    if(clickXY[i].camera_num == "A"){
                		$(".dt .qjt").hide();
                		$(".dt .tzzz").show();
                	}
                	if(clickXY[i].camera_num == "B"){
                		$(".pt .qjt").hide();
                		$(".pt .tzzz").show();
                	}
                    //传递船的编号
                    $.ajax({
                        url: pageurl + '/hydg/seaRecord/seaRecord_start_track.do',
                        data: { "camera_num": clickXY[i].camera_num, "number": clickXY[i].i },
                        dataType: "json",
                        type: "post",
                        async: false,
                        success: function() {

                        }
                    })
                    break;
                }else{
                	console.log("船");
                }
            }
        }, false)
    }
    shipClick(myCanvas1);
    shipClick(myCanvas2);
});