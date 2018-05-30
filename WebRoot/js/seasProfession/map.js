var map, mapCenter, mapIndex;
var visibleId = [],
    visible = [],
    drawcg = 0,
    controlLayer,
    setLayerVisibility,
    promises,
    geoquery;
require([
    "dojo/parser",
    "esri/map",
    "esri/dijit/HomeButton",
    "esri/dijit/Bookmarks",
    "esri/layers/ArcGISTiledMapServiceLayer",
    "esri/layers/ArcGISDynamicMapServiceLayer",
    "esri/layers/FeatureLayer",
    "esri/layers/GraphicsLayer",
    "esri/geometry/Point",
    "dojo/dom-construct",
    "esri/geometry/Extent",

    //      查询功能 
    "esri/tasks/query", "esri/tasks/QueryTask",
    "esri/dijit/InfoWindowLite",
    "esri/InfoTemplate",
    "dojo/_base/array",
    "esri/tasks/IdentifyTask", "esri/tasks/IdentifyParameters",

    //      画图用文件
    "esri/layers/GraphicsLayer", "esri/graphic",
    "esri/toolbars/draw", "esri/symbols/TextSymbol",
    "esri/symbols/Font",
    "esri/Color", "esri/symbols/SimpleLineSymbol", "esri/symbols/SimpleMarkerSymbol",
    "esri/symbols/SimpleFillSymbol",

    "esri/geometry/geometryEngine",

    //		自建方法文件
    "dojo/domReady!"

], function(
    parser,
    Map,
    HomeButton,
    Bookmarks,
    Tiled,
    ArcGISDynamicMapServiceLayer,
    FeatureLayer,
    GraphicsLayer,
    Point,
    domConstruct,
    Extent,

    Query, QueryTask,
    InfoWindowLite, InfoTemplate,
    arrayUtils, IdentifyTask, IdentifyParameters,

    GraphicsLayer, Graphic, Draw,
    TextSymbol, Font, Color, SimpleLineSymbol, SimpleMarkerSymbol, SimpleFillSymbol,

    geometryEngine

) {
    var tiled = new Tiled("http://31.16.1.101/arcgis/rest/services/shsw_JCDXT2016/MapServer");
    var yewuUrl = "http://31.16.1.101/arcgis/rest/services/shsw_HYJCXX/MapServer";
    var yewuLayers = new ArcGISDynamicMapServiceLayer(yewuUrl);
    var drawLayer = new GraphicsLayer();
    var map = new Map("map", {
        logo: false,
        zoom: 3,
        maxZoom: 7,
        extent: new Extent(yewuLayers.initialExtent),
        slider: false
    });
    map.addLayer(tiled); //底图
    map.addLayer(yewuLayers);
    map.addLayer(drawLayer);

    dojo.connect(yewuLayers, "onLoad", loadintLayer);
    map.on("load", function() {
        $('body').addClass('loaded');
        $('#loader-wrapper .load_title').remove();
    });

    function loadintLayer(layers) { //初始显示图层
        var infos = layers.layerInfos;
        for (var i = 0, length = infos.length; i < length; i++) {
            var info = infos[i];
            visible.push(info.id);
        }
        yewuLayers.setVisibleLayers(visible);

        mapCenter = new esri.geometry.Point(48000, -250, map.spatialReference);
        map.centerAt(mapCenter);
        setTimeout(function() {
            getSelectInfo();
        }, 500);

    }

    controlLayer = function() { //层级顺序和div相反,判断对应id的checkbox的值
        //			var firinput = dojo.query(".first-menu").query("input[type=checkbox]:checked");
        var inputs = yewuLayers.layerInfos; //所有层
        visible = []; //显示层id数组
        for (var i = 0; i < inputs.length; i++) {
            var layerOne = inputs[i]; //第一层layerOne
            if (layerOne.subLayerIds == null) { //无下层
                var inputOne = document.getElementById(+i); //第一层标签inputOne
                if (inputOne.checked) { //第一层选中，检查是否有上层
                    if (layerOne.parentLayerId == -1) { //没有第二层，加入visible
                        visible.push(i);
                    } else { //有上一层，得到两层
                        var parIdTwo = layerOne.parentLayerId; //第二层id
                        var layerTwo = inputs[parIdTwo]; //第二层layerTwo
                        var inputTwo = document.getElementById(+parIdTwo); //第二层标签parIdTwo
                        if (inputTwo.checked) { //第二层选中，检查是否有上层
                            if (layerTwo.parentLayerId == -1) { //没有上层，加入visible
                                visible.push(i);
                            } else { //有上一层，得到三层
                                var parIdThird = layerTwo.parentLayerId; //第三层id
                                var layerThird = inputs[parIdThird]; //第三层layerThird
                                var inputThird = document.getElementById(+parIdThird); //第三层标签inputThird
                                if (inputThird.checked) { //第三层选中，检查是否有上层
                                    if (layerThird.parentLayerId == -1) { //没有上层，加入visible
                                        visible.push(i);
                                    } else {
                                        var parIdFour = layerThird.parentLayerId; //第四层id
                                        var layerFour = inputs[parIdFour]; //第三层layerFour
                                        var inputFour = document.getElementById(+parIdFour);
                                        if (inputFour.checked) { //第四层选中，加入visible
                                            visible.push(i);
                                        }
                                    } //第四层
                                }
                            } //第三层
                        }
                    } //第二层
                }
            } //第一层
        }
        yewuLayers.setVisibleLayers(visible); //设为可见
    }

    //获取属性查询条件
    function getSelectInfo() {
        choose = new Object(); //最终结果
        var inputs = yewuLayers.layerInfos;
        var buildings = new Array(); //查询数据
        var noFiled = [3, 6, 7, 17, 33, 41, 42, 43, 46, 49, 51, 53, 55, 58, 60];
        for (var id = 0; id < inputs.length; id++) {
            if (noFiled.indexOf(id) == -1) {
                var queryTask = new QueryTask(yewuUrl + '/' + id);
                var query = new Query();
                query.where = "OBJECTID >= 0";
                query.outFields = ["*"];
                query.returnGeometry = true;
                var temp = queryTask.execute(query);
                buildings.push(temp);
            }
        }
        getAttr(buildings);

        function getAttr(buildings) {
            for (var i = 0; i < buildings.length; i++) {
                var der = 0; //图层id变量
                //有数据
                function inData(results) {
                    if (results.features.length > 0) {
                        var attr = new Object(); //该图层对象
                        var features = results.features; //查询结果要素
                        var dblcheck = new Array(); //去重数组
                        //取字段
                        feaa = features[0].attributes;
                        for (var k in feaa) {
                            if (isNaN(feaa[k])) {
                                attr[k] = '包含||';
                            } else {
                                attr[k] = '=,!=,<,>||';
                            }
                            dblcheck[k] = [];
                        }
                        //按字段加入值
                        for (var j = 0; j < features.length; j++) {
                            var fea = features[j].attributes;
                            for (var key in fea) {
                                if (dblcheck[key].indexOf(fea[key]) == -1) {
                                    dblcheck[key].push(fea[key]);
                                    attr[key] = attr[key] + fea[key] + ','
                                }
                            }
                        }
                        var attrname = inputs[der].name + ',' + der;
                        choose[attrname] = attr;
                    }
                    der = der + 1;
                }
                //无数据
                function outData(msg) {
                    //						console.log(msg);
                    der = der + 1;
                }
                var build = buildings[i];
                build.then(inData, outData);
            }
            console.log(choose);
        }
    }

    //业务图开关
    $("#71").click(function() {
        if ($(this).prop('checked')) {
            yewuLayers.show();
        } else {
            yewuLayers.hide();
        }
    });
    $("#70").click(function() {
        var jcvisible = [0, 1, 2, 12, 13, 14, 15, 16];
        if (!$(this).prop('checked')) {
            var temp = [];
            for (var i = 0; i < visible.length; i++) {
                if (jcvisible.indexOf(visible[i]) == -1) {
                    temp.push(visible[i]);
                }
            }
            visible = temp;
            yewuLayers.setVisibleLaQyers(visible);
        }
    });

    //底图开关
    $("#72").click(function() {
        if ($(this).prop('checked')) {
            tiled.show();
        } else {
            tiled.hide();
        }
    });
    $("#74").click(function() {
        if ($(this).prop('checked')) {
            tiled.show();
        } else {
            tiled.hide();
        }
    });

    //设置透明度
    getOpa = function(i, num) {
        if (i == 0) {
            yewuLayers.setOpacity(num);
        } else if (i == 1) {
            tiled.setOpacity(num);
        } else {
            alert("meiyou");
        }
    }

    //点击工具栏createToolbar
    $('.top li a').click(function() {
        if (this.innerText == "查询") {
            createToolbar2();
        } else if (this.innerText == "测量") {
            createToolbar3();
        } else if (this.innerText == "标注") {
            createToolbar4();
        }
    });
    /*
     * 
     * 工具
     * 
     * */
    //工具功能
    $('#tab1 li').click(function() {
        var toolnum = $(this).index();
        mapTool(toolnum);
    });
    var initextent = yewuLayers.initialExtent;
    mapTool = function(toolnum) {
        switch (toolnum) {
            case 0:
                map.setExtent(initextent);
                break;
            case 1:

                break;
        }
    }

    /*
     * 
     * 查询功能
     * 
     */
    //鼠标经过显示信息		
    var mapinfo = map.on("click", function(evt) {
        shownum = 'showwindow';
        queryToMap(evt.mapPoint, shownum);
    });

    $('#tab2 li').click(function() {
        clearDrawLayer();
        var toolclass = $(this).attr("data");
        activateTool(toolclass);
    });
    createToolbar2 = function() {
        toolbar = new Draw(map);
        toolbar.on("draw-end", function(evt) {
            shownum = 'showpage';
            addToMap(evt);
            queryToMap(evt.geometry, shownum);
        });
    }
    queryToMap = function(querygeo, shownum) {
        var identifyTask = new IdentifyTask(yewuUrl);
        var params = new IdentifyParameters();
        params.tolerance = 3;
        params.returnGeometry = true;
        params.layerIds = visible;
        params.layerOption = IdentifyParameters.LAYER_OPTION_ALL;
        params.width = map.width;
        params.height = map.height;
        params.geometry = querygeo;
        params.mapExtent = map.extent;
        identifyTask.execute(params, function(results) {
            showQueryResult(results, querygeo, shownum);
        });
    }
    showQueryResult = function(res, querygeo, shownum) {
        var allResult = new Array(); //总结果
        resgeo = new Array();
        for (i = 0; i < res.length; i++) {
            var fieldName = res[i].displayFieldName;
            var value = res[i].value;
            var layerName = res[i].layerName;
            var attr = res[i].feature.attributes;
            for (var key in attr) {
                if (key == "名称") {
                    attr.value = attr[key];
                } else if (key == "标准化名称") {
                    attr.value = attr[key];
                } else if (value == "0") {
                    attr.value = layerName;
                } else if (value == " ") {
                    attr.value = layerName;
                } else {
                    attr.value = value;
                }
            }
            attr.fname = fieldName;
            attr.lname = layerName;
            allResult.push(attr);
        }
        // 去除重复方法
        function removeDuplicate() {
            var h = {}; // 定义一个hash表
            var arr = []; // 定义一个临时数组
            for (var i = 0; i < allResult.length; i++) { // 循环遍历当前数组
                // 对元素进行判断，看是否已经存在表中，如果存在则跳过，否则存入临时数组
                if (!h[allResult[i].OBJECTID]) {
                    // 存入hash表
                    h[allResult[i].OBJECTID] = true;
                    // 把当前数组元素存入到临时数组中
                    arr.push(allResult[i]);
                    resgeo.push(res[i].feature.geometry); //对应的地理信息
                }
            }
            return arr;
        }
        regeoquery = removeDuplicate(); //去重后结果
        if (shownum == 'showwindow') {
            showWin(regeoquery, querygeo);
        }
        if (shownum == 'showpage') {
            pages();
        }
    }

    function showWin(res, querygeo) {
        console.log(res);
        if (res.length > 0) {
            var names;
            for (var i = 0; i < res.length; i++) {
                var names = res[0].value;
                if (i == 0) {
                    continue;
                }
                names = names + '<br>' + res[i].value;
            }
            console.log(names);
            map.infoWindow.setTitle("匹配地理信息");
            map.infoWindow._title.style.backgroundColor = "#100e0e";
            map.infoWindow.setContent(names);
            map.infoWindow.show(querygeo);
        }
    }

    function pages() {
        $(".layer-control").hide();
        $("#scroll").hide();
        $(".layer-search").show();
        $(".search-results").show();
        options = {
            "id": "page", //显示页码的元素
            "data": regeoquery, //显示数据
            "maxshowpageitem": 3, //最多显示的页码个数
            "pagelistcount": 10, //每页显示数据个数
            "callBack": function(result) {
                $("#demoContent").empty();
                for (var i = 0; i < result.length; i++) {
                    var li = document.createElement("li");
                    var img = document.createElement("img");
                    var span = document.createElement("span");
                    (function(i) {
                        li.onclick = function() {
                            showResGeo(resgeo[i]);
                            $(".search-info ul").empty();
                            $.each(result[i], function(j, val) {
                                var li = document.createElement("li");
                                var h5 = document.createElement("h5");
                                var p = document.createElement("p");
                                li.style.marginBottom = "20px";
                                li.style.paddingLeft = "10px";
                                p.style.marginTop = "5px";
                                h5.innerHTML = j;
                                h5.style.color = "gray";
                                if (val == "Null" || val == "" || val == " ") {
                                    p.innerHTML = "N/A";
                                } else {
                                    p.innerHTML = val;
                                }
                                li.appendChild(h5);
                                li.appendChild(p);
                                $(".search-info ul").append(li);
                            });
                            $(".layer-search,.search-results").hide();
                            $(".search-location span").text($(this).find("span").text());
                            $(".search-location,.search-info").show();
                        };
                    })(i);
                    img.src = "../../../images/seasProfession/arcgis/icon-map.png";
                    if (result[i].名称) {
                        span.innerHTML = result[i].名称;
                    } else if (result[i].标准化名称) {
                        span.innerHTML = result[i].标准化名称;
                    } else if (result[i].公共用海名称) {
                        span.innerHTML = result[i].公共用海名称;
                    } else if (result[i].项目名称) {
                        span.innerHTML = result[i].项目名称;
                    } else {
                        span.innerHTML = result[i].value;
                    }
                    li.appendChild(img);
                    li.appendChild(span);
                    $("#demoContent").append(li);
                }
            }
        };
        page.init(regeoquery.length, 1, options);
        console.log(regeoquery);
    }
    //属性查询
    doSearch = function(id, tjs) {
        console.log(tjs);
        for (var i = 0; i < tjs.length; i++) {
            var fintj = tjs[0];
            if (i == 0) {
                continue;
            }
            fintj = fintj + " and " + tjs[i];
        }
        var queryTask = new QueryTask(yewuUrl + '/' + chooseId);
        var query = new Query();
        query.where = fintj;
        query.outFields = ["*"];
        query.returnGeometry = true;
        queryTask.execute(query, function(results) {
            geoquery = new Array();
            resgeo = new Array();
            var fea = results.features;
            for (i = 0; i < fea.length; i++) {
                resgeo.push(fea[i].geometry);
                var attr = fea[i].attributes;
                geoquery.push(attr);
            }
        });
    }
    /*
     * 
     * 测量功能
     * 
     * */
    $('#tab3 li').click(function() {
        clearDrawLayer();
        var toolclass = $(this).attr("data");
        activateTool(toolclass);
        if (toolclass = "polyline" || "polygon") {
            linepoints = new Array(); //每个点
            linedistance = new Array(); //每段长度
            distancecount = 0; //总长度
            getPaths = map.on("click", function(evt) {
                var knee = evt.mapPoint; //折点
                var distance = 0;
                if (linepoints.length > 0) {
                    var prepoint = linepoints[linepoints.length - 1]; //前一个点
                    distance = disTance(prepoint, knee); //本段距离or另写一个方法
                    distancecount += distance;
                    linedistance.push(distance);
                }
                linepoints.push(knee);
                var kneetext = creatText(distancecount);
                var textsymbol = creatTextSymbol(kneetext);
                var textgra = new Graphic(knee, textsymbol);
                drawLayer.add(textgra);
            });
        }
    });
    createToolbar3 = function() {
        toolbar = new Draw(map);
        toolbar.on("draw-complete", mearsureToMap);
    }
    //两点距离
    disTance = function(point1, point2) {
        var dist = geometryEngine.distance(point1, point2, "meters");
        return dist;
    }
    //标注样式
    creatTextSymbol = function(text) {
        var fontColor = new Color("#696969");
        var holoColor = new Color("#fff");
        var font = new Font("10pt", Font.STYLE_ITALIC, Font.VARIANT_NORMAL, Font.WEIGHT_BOLD, "Courier");
        var textsymbol = new TextSymbol(text, font, fontColor);
        textsymbol.setOffset(10, 10).setHaloColor(holoColor).setHaloSize(2);
        textsymbol.setAlign(TextSymbol.ALIGN_MIDDLE);
        return textsymbol;
    }
    //标注内容
    creatText = function(result) {
        if (result == 0) {
            kneetext = "起点";
        } else if (result > 0 && result >= 1000) {
            kneetext = (result / 1000).toFixed(2) + "km";
        } else if (result > 0 && result < 1000) {
            kneetext = result.toFixed() + "m";
        }
        return kneetext;
    }
    mearsureToMap = function(evt) {
        getPaths.remove();
        addToMap(evt);
        console.log(evt.geometry);
        switch (evt.geometry.type) {
            case "polyline":
                var cellength = geometryEngine.planarLength(evt.geometry, "meters");
                console.log(cellength);
                break;
            case "polygon":
                var cellength = geometryEngine.planarLength(evt.geometry, "meters");
                var celarea = geometryEngine.planarArea(evt.geometry, "square-meters");
                console.log([cellength, celarea]);
                break;
            case "extent":
                var cellength = geometryEngine.planarLength(evt.geometry, "meters");
                var celarea = geometryEngine.planarArea(evt.geometry, "square-meters");
                console.log([cellength, celarea]);
                break;
        }
    }

    /*
     * 
     * 标注功能 
     * 
     */
    $('#tab4 li').click(function() {
        clearDrawLayer();
        var toolnum = $(this).index();
        var toolclass = $(this).attr("data");
        activateTool(toolclass);
    });

    //创建toolbar
    createToolbar4 = function() {
        toolbar = new Draw(map);
        toolbar.on("draw-end", addToMap);
    }
    //激活toolbar画图
    activateTool = function(toolclass) {
        toolbar.activate(Draw[toolclass]);
        map.hideZoomSlider();
        switch (toolclass) {
            case "POINT":
                symbol = new SimpleMarkerSymbol(
                    SimpleMarkerSymbol.STYLE_SQUARE,
                    10,
                    new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID,
                        new Color([255, 0, 0]), 1),
                    new Color([0, 255, 0, 0.25])
                );
                break;
            case "TEXT":
                break;
            case "POLYLINE":
                symbol = new SimpleLineSymbol(
                    esri.symbol.SimpleLineSymbol.STYLE_SOLID, // 样式,STYLE_DASH(破折号),STYLE_DASHDOT(点划线),STYLE_DASHDOTDOT,STYLE_DOT(点),STYLE_NULL,STYLE_SOLID(实线)
                    new dojo.Color([255, 0, 0]), // 颜色  
                    3 // 像素  
                );
                break;
            case "FREEHAND_POLYLINE":
                symbol = new SimpleLineSymbol(
                    esri.symbol.SimpleLineSymbol.STYLE_SOLID,
                    new dojo.Color([255, 100, 0]),
                    3
                );
                break;
            case "FREEHAND_POLYGON":
                symbol = new SimpleFillSymbol(
                    SimpleLineSymbol.STYLE_SOLID,
                    new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID,
                        new Color([0, 0, 0, 1]), 1),
                    new Color([255, 0, 0, 0.2]));
                break;
            case "ELLIPSE":
                symbol = new SimpleLineSymbol(
                    esri.symbol.SimpleLineSymbol.STYLE_DASH,
                    new dojo.Color([0, 255, 0]),
                    3
                );
                break;
            case "CIRCLE":
                symbol = new SimpleLineSymbol(
                    esri.symbol.SimpleLineSymbol.STYLE_DASH,
                    new dojo.Color([0, 255, 0]),
                    3
                );
                break;
            case "POLYGON":
                symbol = new SimpleFillSymbol(
                    SimpleLineSymbol.STYLE_SOLID,
                    new SimpleLineSymbol(
                        SimpleLineSymbol.STYLE_SOLID,
                        new Color([0, 0, 0, 1]),
                        1),
                    new Color([255, 0, 0, 0.2])
                );
                break;
            case "EXTENT":
                symbol = new SimpleFillSymbol(
                    SimpleLineSymbol.STYLE_SOLID,
                    new SimpleLineSymbol(
                        SimpleLineSymbol.STYLE_SOLID,
                        new Color([0, 255, 0, 1]),
                        1),
                    new Color([255, 0, 0, 0.4])
                );
                break;
        }
    }

    //画图结束显示
    addToMap = function(evt) {
        toolbar.deactivate();
        map.showZoomSlider();
        drawcg = 1;

        var geometry = evt.geometry;
        var grap = new Graphic(geometry, symbol);

        drawLayer.add(grap);
    }
    //点击放大查询结果
    showResGeo = function(geo) {
        clearDrawLayer();
        console.log(geo.type);
        var symbolp = new SimpleMarkerSymbol(
            SimpleMarkerSymbol.STYLE_DIAMOND,
            10,
            new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID,
                new Color([200, 200, 0]), 1),
            new Color([200, 200, 0, 1])
        );
        var symboll = new SimpleLineSymbol(
            esri.symbol.SimpleLineSymbol.STYLE_SOLID,
            new dojo.Color([200, 200, 0]),
            5
        );
        var symbolg = new SimpleFillSymbol(SimpleFillSymbol.STYLE_SOLID,   new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID,   new Color([200, 200, 0]), 2), new Color([200, 200, 0, 0.7]) );
        switch (geo.type) {
            case "point":
                map.centerAndZoom(geo, map.maxZoom);
                symbol = symbolp;
                break;
            case "polyline":
                var line = geo.getExtent();
                symbol = symboll;
                map.setExtent(line.expand(1), map.maxZoom);
                break;
            case "polygon":
                var ext = geo.getExtent();
                symbol = symbolg;
                map.setExtent(ext.expand(1));
                break;
        }
        var selectgra = new Graphic();
        selectgra.setGeometry(geo);
        selectgra.setSymbol(symbol);
        drawLayer.add(selectgra);

    }
    //清除画图图层
    clearDrawLayer = function() {
        drawLayer.clear();
        drawcg = 0;
    }

    //清除所选图形
    deleGraphic = function() {

    }
    //编辑所选图形
    editGraphic = function() {

    }
    asd = function() {
        alert(123);
    }

});