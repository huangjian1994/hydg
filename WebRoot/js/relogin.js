//加载函数
function loading(imgArr, attr) {
    var len = 0; //存放一共多少条数据
    var loadingArr = []; //
    //知道有多少数据
    len = imgArr.length;
    var num = 0; //记录加载的数量
    for(var i = 0; i < len; i++) {
        var img = new Image();
        img.src = imgArr[i];
        img.onload = (function(i) {
            return function() {
                num++;
                loadingArr[i] = this; //this指向当前加载的数据
                //                      console.log(loadingArr[i]);
                if(num >= len) {
                    attr.complete();                    
                    $("#loading").css({
                        "display": "none"
                    });
                  
                }else{
                	
                }
            }
        })(i)
    }
}