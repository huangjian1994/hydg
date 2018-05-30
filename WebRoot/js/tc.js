var url = window.location.href;
console.log(url);
function find(str, cha, num) {
	var x = str.indexOf(cha);
	for (var i = 0; i < num; i++) {
		x = str.indexOf(cha, x + 1);
	}
	return x;
}
var index = find(url,"/",3);
var luj = url.substring(0,index);
var imgLd = luj + "/images/tc-ld.png";
var imgTop = luj + "/images/tc-top.png";    
var imgClose1 = luj + "/images/tc-close1.png";
var imgClose2 = luj + "/images/tc-close2.png";
var imgDl = luj + "/images/tc-dl.png";
function pop_init(title,content,i) {	
    //取当前浏览器窗口大小  
    var windowWidth=$(document).width();  
    var windowHeight=$(document).height();  
    //弹窗的大小  
    var weight=320;  
    var height=240;    
    $("body").append(  
    "<div class='tc' style='z-index:"+i+";width:"+weight+"px;height:"+height+"px;bottom:0px;right:0px'>"+  
    	"<div style='background: url("+imgTop+");overflow: hidden;height:30px;width:100%;'>"+
    		"<img src="+imgLd+" alt='' class='icon'>" +
    		"<span class='info'>"+title+"</span>" +
    		"<img class='close' src="+imgClose1+" alt='' onclick='closeTc(this)'>"+
    	"</div>"+
    	"<div class='tc-main'>"+
	    	"<ul>" +
	    		content +
	        "</ul>"+
	    "</div>"+
    "</div>"  
    );  
    $('.tc').fadeIn(400);
}  
function pop_close(obj){  
    obj.remove();  
}
function closeTc(obj){
	$(obj).src = imgClose2;
	var tc = $(obj).parent().parent(".tc");
	pop_close(tc);
}  