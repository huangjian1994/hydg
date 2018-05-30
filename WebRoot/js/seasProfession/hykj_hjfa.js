var host = window.location.host;// 获取当前页面域名
var pageurl = 'http://'+ host;
$(function() {
	//加载菜单栏
	searchMenu = function searchMenu() {
        url = pageurl+'/hydg/coastline/cl_loadAllDefine.do';
        $.ajax({
            async: false,
            type: 'post',
            url: url,
            datatype: "json",
            cache: false,
            success: function(json) {
                result = JSON.parse(json);
                lines = result.coastlines;
                console.log(lines);
                $(".option-contain .result").remove();
                $.each(lines, function() {
                    var li = document.createElement("li");
                    li.className = "result";
                    $(li).attr("lineId", this.id);
                    var jwd= this.lineGeo;
                    //alert(jwd);
                    var hs= null;
                    var strarray = new Array();
                    strarray = jwd.split(";");//按分号和逗号分割
                    var jwdInput="";
                    for (var k = 0; k < strarray.length; k++){ 
                    	hs = strarray[k];
            		    var ss = new Array();      
            		    ss = hs.split(",");
            		    //alert("序号="+ss[0]+"北纬="+ss[1]+"东经="+ss[2]);
            		    if(ss[0]!="" && ss[1] && ss[2]){
            		    jwdInput +='<input name="xh" id="xh'+k+'" type="text" value="' + ss[0] + '" style="width:15px">&nbsp;'+
            		    			'<input name="bw" id="bw'+k+'" type="text" value="' + ss[1] + '" style="width:85px">&nbsp;'+
            		    			'<input name="dj" id="dj'+k+'" type="text" value="' + ss[2] + '" style="width:85px">'+
            		    		//	'<a href="###" onclick="deleteJzd('+k+')">删除</a>'+
            		    			'<br/>';
            		    }
                    }                                       
                    var operate = '<div class="operate"><a href="#" class="change" onclick="change(this);">修改</a>&nbsp<a href="#" class="delete" onclick="remove(this);">删除</a></div>';
                    var menu_list = '<div class="dropdown-taggle">'+
                						'<div class="menu-list">'+
                							'<input type="checkbox" name="海域勘界">'+
                							'<span>' + this.lineName + '</span>' + operate + 
                						'</div>'+
                						'<div class="dropdown-menu">'+
                							'<table>'+
                								'<tr>'+
                									'<td class="line">名称:</td><td><input id="name" type="text" value="' + this.lineName + '" class="name"></td>'+
                								'</tr>'+
                								'<tr>'+
                									'<td class="line">时间:</td><td><input id="time" type="text" value="' + this.lineUpdateTime + '" class="time"></td>'+
                								'</tr>'+
                								'<tr>'+
            										'<td colspan="2" style="text-align:center">序号&nbsp;&nbsp;&nbsp;北纬&nbsp;&nbsp;&nbsp;东经&nbsp;&nbsp;&nbsp;</td>'+
            									'</tr>'+
            									'<tr>'+
        											'<td colspan="2" style="text-align:center">' + jwdInput + '</td>'+
        										'</tr>'+
                								'<tr>'+
                									'<td class="line">备注:</td><td><input id="info" type="text" value="' + this.lineUpdateReason + '" class="info"></td>'+
                								'</tr>'+
                								'<tr>'+
                									'<td class="line-button" colspan="2">'+
                										'<button class="save button button-pill button-primary">确定</button>&nbsp'+
                										'<button class="back button button-pill button-primary">取消</button>'+
                									'</td>'+
                								'</tr>'+
                							'</table>'+
                						'</div>'+
                    				'</div>';                  
                    $(li).html(menu_list);
                    $(".option-contain ul").append(li);
                })
                showLine();
            }
        });
    }
    searchMenu();
    close();
    function close() {
        $("#submit img").on("click", function() {
            $("#submit").slideUp();
        })
    }
    //checkbox （显示方法需要修改）
    function showLine() {
        for (var i = 0; i < $('input[type="checkbox"]').length; i++) {
            (function(indexI) {
                $('input[type="checkbox"]').eq(indexI).on("click", function() {
                    var num;
                    if (this.checked) {
                        num = 1; //显示
                    } else {
                        num = 0; //不显示
                    }
                    var lineid = this.parentElement.parentElement.parentElement.attributes["lineid"].value;
                    showSingleLine(num, lineid);
                })
            })(i)
        }
    }
    // 菜单控制
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
    close();
})
//修改（按钮点击会刷新页面，需要调整）
function change(obj) {
	var li_result = $(obj).parent().parent().parent().parent(".result");
	li_result.find(".dropdown-menu").slideDown();			    		
	li_result.find(".dropdown-menu .save").on("click", function() {
		var id = li_result.attr("lineId");
		editInfo(id,2);
		li_result.find(".dropdown-menu").slideUp();

	});
	li_result.find(".dropdown-menu .back").on("click", function() {		
		li_result.find(".dropdown-menu").slideUp();
	});
};

//刪除			
function remove(obj) {	
    $.dialog.confirm({
        content: "你确定要删除吗",
        callback: 'callback();'
    });
    del = obj;
}
//回调函数
function callback() {
	var li_result = $(del).parent().parent().parent().parent(".result");
    var lineid = li_result.attr("lineId");
    removeLine(lineid);
    li_result.remove();
}
//上传
function showUp() {
    //console.log(1);
    //getLineData();
    $("#submit").slideDown();
}

function close() {
    $("#submit img").on("click", function() {
        $("#submit").slideUp();
    })
}

//function upLoad() {
//    upLoadLine();
//    $("#submit").slideUp();
//}
//此方法可能需要修改
function editInfo(lineId, type){
	var data = "{\"coastlineU.id\":\"" + lineId + "\",\"coastlineU.type\":\"" + type + "\"";
	var inputs  = $("[lineId="+lineId+"]").find("input");
	var jwd="";
	$.each(inputs, function() {
		if($(this).attr("name")=="xh"){
			if($(this).val() !=""){
				jwd+=$(this).val()+",";
			}else{
				alert("序号不允许为空！");
				return false;
			}
		}
		if($(this).attr("name")=="bw"){
			if($(this).val() !=""){
			jwd+=$(this).val()+",";
			}else{
				alert("北纬不允许为空！");
				return false;
			}
		}
		if($(this).attr("name")=="dj"){
			if($(this).val() !=""){
			jwd+=$(this).val()+";";
			}else{
				alert("东经不允许为空！");
				return false;
			}
		}
	})
	
	if(jwd != ""){
	//alert(jwd);
	
	data += ",\"coastlineU.lineGeo\":\"" + jwd + "\"";
	$.each(inputs, function() {
		data += ",\"" + $(this).attr("name") + "\":\"" + $(this).val() + "\"";
		//$.extend(data,data_temp)
    })
    data += "}";
	//alert("data="+data);
	var json = JSON.parse(data);
	$.ajax({
        async: false,
        type: 'post',
        data: json,
        url: pageurl+'/hydg/coastline/cl_editAnalyze.do',
        datatype: "json",
        cache: false,
        success: searchMenu
    });
	}
}


function deleteJzd(kk){
	alert(kk);
	alert($("#xh"+kk).val());
	$("#xh"+kk).val("");
	alert($("#xh"+kk).val());
	//$("#bw"+kk).val()="";
	//$("#dj"+kk).val()="";
	$("#xh"+kk).type="hidden";
}
