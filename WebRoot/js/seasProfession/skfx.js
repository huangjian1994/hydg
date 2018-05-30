$(function() {
    //菜单控制
    $(".option-icon").on("click", function() {
        $(".option-icon").hide("10", function() {
            $(".option-contain").slideDown();
        });
    })
    $(".option-contain .close").on("click", function() {
        $(".option-contain").slideUp("10", function() {
            $(".option-icon").show();
        });
    });
    //加载菜单    
   searchMenu =  function searchMenu() {
	   	var host = window.location.host;// 获取当前页面域名
		var pageurl = 'http://'+ host;
        url = pageurl+'/hydg/coastline/cl_loadAllAnalyze.do';
        $.ajax({
            async: false,
            type: 'post',
            url: url,
            datatype: "json",
            cache: false,
            success: function(json) {
                result = JSON.parse(json);
                lines = result.coastlines;
                //console.log(lines);
                $("option-contain ul .result").remove();
                $.each(lines, function() {         
                	var length = parseInt(this.lineLength);
                    var li = document.createElement("li");
                    li.className = "result";
                    //li.style.padding = "5px";
                    li.style.borderBottom = "1px solid #efefef";
                    $(li).attr("lineId", this.id);
                    var dropdownTaggle = '<div class="menu-list">'+
											'<input type="checkbox" name="时空分析" />'+
											'<span>' + this.lineName + "(长度："+length+"米)"+ '</span>' +
										'</div>'                  
                    $(li).html(dropdownTaggle);
                    $(".option-contain ul").append(li);
                })
            }
        });
    }
    searchMenu();
    //checkbox（需要修改）
    function showLine() {
        for (var i = 0; i < $('input[type="checkbox"]').length; i++) {
            (function(indexI) {
                $('input[type="checkbox"]').eq(indexI).on("click", function() {
                	var num;
                	if(this.checked){
                		num = 1;//显示
                	}else{
                		num = 0;//不显示
                	}
                	var lineid = this.parentElement.parentElement.attributes["lineid"].value;
                    showSingleLine(num,lineid);
                })
            })(i)
        }
    }
    showLine();
})