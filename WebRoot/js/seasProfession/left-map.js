$(function() {
    //显示菜单页面
    var url = window.location.href; //获取当前页面url
    //console.log(url);
    function parseURL(url) { //获取url中传递的参数
        var url = url.split("?")[1];
        var para = url.split("&");
        var len = para.length;
        var res = {};
        var arr = [];
        for (var i = 0; i < len; i++) {
            arr = para[i].split("=");
            res[arr[0]] = arr[1];
        }
        return res;
    }
    var res = parseURL(url);
    console.log(res);
    //打开地图	
    if (res.s == "gjzy") {
        $(".map").eq(res.index).show();
    } else if (res.s == "hydt") {
        $(".map").eq(res.index).show();
    } else if (res.s == "hddt") {
        $(".map").eq(res.index).show();
    } else if (res.s == "hygn") {
        $(".map").eq(res.index).show();
    } else if (res.s == "hykj") {
        $(".map").eq(res.index).show();
    } else if (res.s == "hj") {
        $(".map").eq(res.index).show();
    }
})