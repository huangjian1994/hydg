$(function() {
    //显示菜单
    //console.log($("input").length);
    function showmenu(class1, class2, class3) {
        for (var i = 0; i < $(class1).length; i++) {
            (function(indexI) {
                $(class1).eq(indexI).on("click", function() {
                    if ($(class2).eq(indexI).find($(class3)).css("display") == "none") {
                        $(class2).eq(indexI).find($(class3)).css("display", "block");
                        $(this).find(".unfold").attr("src", "../../../images/seasProfession/jian.png");
                    } else {
                        $(class2).eq(indexI).find($(class3)).css("display", "none");
                        $(this).find(".unfold").attr("src", "../../../images/seasProfession/jia.png");
                    }

                })
            })(i)
        }
    }
    $("input").click(function(event) {
        event.stopPropagation(); //阻止事件冒泡即可
    });
    showmenu(".leftmenu .first-menu", ".leftmenu .layer", ".second-menu"); //显示二级菜单
    showmenu(".leftmenu .two", ".leftmenu .list-two", ".third-menu"); //显示三级菜单
    showmenu(".leftmenu .three", ".leftmenu .list-three", ".fourth-menu"); //显示四级菜单	
    showmenu(".leftmenu .four", ".leftmenu .list-four", ".fifth-menu"); //显示五级菜单
    //2,3,4级菜单不可选
    for (var i = 0; i < $("input").length; i++) {
        $("input").eq(i).prop("checked", "true");

    }

    function layer(class1, class2, class3) {
        for (var i = 0; i < $(class1).length; i++) {
            (function(indexI) {
                $(class1).eq(indexI).on("click", function() {
                    if ($(class1).eq(indexI).prop("checked")) {
                        $(class2).eq(indexI).find($(class3)).removeClass("layer-invisible");
                    } else {
                        $(class2).eq(indexI).find($(class3)).addClass("layer-invisible");
                    }
                })
            })(i)

        }
    }
    layer('input[name="切换图层1"]', ".layer", ".second-menu ul li");
    layer('input[name="切换图层2"]', ".list-two", ".third-menu ul li");
    layer('input[name="切换图层3"]', ".list-three", ".fourth-menu ul li");
    layer('input[name="切换图层4"]', ".list-four", ".fifth-menu ul li");
    //点击隐藏菜单
    $(".control-visible a").on("click", function() {
        if ($(".contain").css("display") == "block") {
            $(".control-visible a img").css({ "transform": "", "padding-top": "6px", "padding-bottom": "0px" });
            $(".contain").hide();
            $(".control-visible").css("left", "0");
            $("#map").css("left", "0");
        } else {
            $(".control-visible a img").css({ "transform": "rotate(180deg)", "padding-top": "0", "padding-bottom": "6px" });
            $(".contain").show();
            $(".control-visible").css("left", "300px");
            $("#map").css("left", "300px");
        }
    })
    //显示图层
    function showmap() {
        for (var i = 0; i < $('input[type="checkbox"]').length; i++) {
            (function(indexI) {
                $('input[type="checkbox"]').eq(indexI).on("click", function() {
                    //mapIndex = indexI; 
                    //console.log(mapIndex);
                    controlLayer();
                })
            })(i)
        }
    }
    showmap();
    //显示图层列表操作
    function optionMenu(class1, class2) {
        $(class1).on("click", function() {
            if ($(class2).css("display") == "none") {
                $(class2).css("display", "block");
            } else {
                $(class2).css("display", "none");
            }
        })
    }

    function showLayer() {
        $(".opmenu button").on("click", function() {
            if ($("#scroll").css("display") == "block") {
                $(".leftmenu .layer-icon").css("display", "block");
                $("#scroll,.opmenu").css("display", "none");
                $(".layer-contrpl span").text("图例");
            } else {
                $(".leftmenu .layer-icon,.opmenu").css("display", "none");
                $("#scroll").css("display", "block");
                $(".layer-control span").text("图层控制");
            }
        })
    }
    // optionMenu(".layer-control .option", ".opmenu");
    showLayer();
    //地图工具栏显示
    function maptools() {
        $(".maptools").on("click", function() {
            if ($(".toolsmenu").css("display") == "none") {
                $(".toolsmenu").css("display", "block");
                $(".control-visible,.contain,#map,.maptools").css("top", "110px");
            } else {
                $(".toolsmenu").css("display", "none");
                $(".control-visible,.contain,#map,.maptools").css("top", "0px");
            }
        })
    }
    maptools();
    //地图工具栏
    $("#tabsbox .top").idTabs();
    //单个图例的放大缩小
    // function scale() {
    //     for (var i = 0; i < $(".jt").length; i++) {
    //         (function(indexI) {
    //             $(".jt").eq(indexI).on("click", function() {
    //                 $(".layer-info,.layer-infobody").css("display", "block");
    //                 $(".layer-control,.title").css("display", "none");
    //                 $(".layer-info span").text($(this).prev().find("span").text());
    //             })
    //         })(i)
    //     }
    //     //关闭
    //     $(".layer-info img").on("click", function() {
    //         $(".layer-info,.layer-infobody").css("display", "none");
    //         $(".layer-control,.title").css("display", "block");
    //     })
    // }
    //scale();
    //滑块控制条
    for (var i = 0; i < $(".slider").length; i++) {
        (function(indexI) {
            $(".slider").eq(indexI).slider({
                min: 0,
                max: 10,
                value: 10,
                slide: function(event, ui) {
                    //console.log(ui.value/10);
                    //改变地图和图层的透明度
                    getOpa(indexI, ui.value / 10);
                }
            });
        })(i)
    }
    //识别结果
    //窗口改变
    $(window).resize(function() {
        console.log(1);
        if ($("#demoContent li")) {
            $("#page").css("top", $("#demoContent").css("height"));
        }
        if ($("#demoContent1 li")) {
            $("#page1").css("top", $("#demoContent1").css("height"));
        }
    });
    //查询结果关闭
    $(".layer-search .close").on("click", function() {
        $(".layer-control,#scroll").show();
        $(".layer-search,.search-results").hide();
    });
    //插叙结果详细信息关闭
    $(".search-location .close").on("click", function() {
        $(".layer-search,.search-results").show();
        $(".search-location,.search-info").hide();
    });
    //查询搜索框	
    var setPositon = function setPosition() {
        var left = Number($("#result").offset().left) + "px";
        var top = Number($("#result").offset().top) - 118 + "px";
        $("#result_contain").css({ "display": "block", "left": left, "top": top });
        $("#result_contain").css("width", $("#result").width() + "px");
    }
    $("#result").focus(setPositon);
    $("#result").blur(function() {
        $("#result_contain").css("display", "none");
    });

    //添加查询条件
    $("#select_layer").change(function() {
        $("#term").empty();
    });
    $("#filter").change(function() {
        $("#result_contain").empty();
    });
    $(".add_query input[value='添加另一个条件'],.add_query input[value='确定']").on("click", function() {
        var list = document.createElement("div");
        var img = document.createElement("img");
        img.src = "../../../images/seasProfession/arcgis/close.png";
        img.className = "fr";
        img.onclick = function() {
            $(this).parents(".list").remove();
        }
        list.className = "list";
        for (var i = 1; i < 4; i++) {
            var a = document.createElement("a");
            a.href = "#";
            a.style.display = "inline-block";
            a.style.overflow = "hidden";
            if (i == 3) {
                a.style.width = "100px";
                a.style.whiteSpace = "nowrap";
                a.style.textOverflow = "ellipsis";
                if ($("#result").val() == null || $("#result").val() == "") {
                    a.innerText = "任意值";
                } else {
                    a.innerText = $("#result").val();
                }
            } else {
                a.innerText = $(".select-box select").eq(i).find("option:selected").text();
            }
            if (i != 1) {
                a.style.marginLeft = "10px";
            }
            list.appendChild(a);
        }
        list.appendChild(img);
        $("#term").append(list);
        $("#result").val("");
    });
    //查询结果	

    $(".add_query input[value='搜索']").on("click", function() {
        arrResult = [];
        var chooseName = $("#select_layer").find("option:selected").text();
        for (var i = 0; i < arrChoose.length; i++) {
            if (chooseName == arrChoose[i][0]) {
                chooseId = arrChoose[i][1];
            }
        }
        for (var i = 0; i < $("#term .list").length; i++) {
            var tj = [];
            for (var j = 0; j < $($("#term .list").eq(i).find("a")).length; j++) {
                var chooseResult = $($("#term .list").eq(i).find("a")).eq(j).text();
                tj.push(chooseResult);
            }
            if (tj[2] != null) {
                if (tj[1] == "包含") {
                    var singletj = tj[0] + " LIKE '%" + tj[2] + "%'";
                } else {
                    var singletj = tj[0] + tj[1] + tj[2];
                }
                arrResult.push(singletj);
            }
        }
        console.log(arrResult);
        doSearch(chooseId, arrResult);
    })
    //查询下拉框
    //关闭
    $(".inquiry-info img").on("click", function() {
        $(".inquiry-info,.inquiry-results").hide();
    })
    $(".inquiry-location img").on("click", function() {
        $(".inquiry-info,.inquiry-results").show();
        $(".inquiryResult-info,.inquiry-location").hide();
    })
    var arrChoose = [];
    $("#search").on("click", function() {
        //console.log(choose);		
        $(".inquiry-menu").show();
        $(".inquiry").show(0, function() {
            //console.log(choose);			
            function objInit(obj) {
                return $(obj).html('<option>请选择</option>');
            }
            $.each(choose, function(pF) {
                var pf = pF.split(",")[0];
                $('#select_layer').append('<option>' + pf + '</option>');
                arrChoose.push(pF.split(","));
            });
            $('#select_layer').change(function() {
                objInit('#filter');
                objInit('#operator');
                $.each(choose, function(pF, pS) {
                    if ($('#select_layer option:selected').text() == pF.split(",")[0]) {
                        $.each(pS, function(pT, pC) {
                            $('#filter').append('<option>' + pT + '</option>');
                        });
                        $('#filter').change(function() {
                            objInit('#operator');
                            $.each(pS, function(pT, pC) {
                                if ($('#filter option:selected').text() == pT) {
                                    $.each(pC.split("||")[0].split(","), function() {
                                        $('#operator').append('<option>' + this + '</option>');
                                    });
                                    var arrPc = pC.split("||")[1].split(",");
                                    arrPc.pop();
                                    var result = document.getElementById("result");
                                    for (var i = 0; i < arrPc.length; i++) {
                                        var p = document.createElement("p");
                                        p.innerHTML = arrPc[i];
                                        p.onmousedown = function(e) {
                                            result.value = this.innerHTML;
                                        };
                                        $("#result_contain").append(p);
                                        if (i > 8) {
                                            break;
                                        }
                                    }
                                };
                            });
                        });
                    };
                });
            });

        });
    });
});