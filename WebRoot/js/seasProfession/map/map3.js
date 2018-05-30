if (mapId.index == 2) {
    console.log(mapId.index);
    require([
        "dojo/parser",
        "esri/map",
        "esri/layers/ArcGISTiledMapServiceLayer",
        "esri/layers/ArcGISDynamicMapServiceLayer",
        "esri/geometry/Extent",
    ], function(
        parser,
        Map, Tiled,
        ArcGISDynamicMapServiceLayer, Extent
    ) {
        var tiled = new Tiled("http://31.16.1.101/arcgis/rest/services/shsw_JCDXT2016/MapServer");
        var yewuUrl = "http://31.16.1.101/arcgis/rest/services/shsw_HYJCXX/MapServer";
        var yewuLayers = new ArcGISDynamicMapServiceLayer(yewuUrl);
        var map = new Map("map3", {
            logo: false,
            zoom: 2,
            maxZoom: 7,
            slider: false
        });
        map.addLayer(tiled); //底图
        map.addLayer(yewuLayers);

        map.on("load", function() {
            $('body').addClass('loaded');
            $('#loader-wrapper .load_title').remove();
            visibleInit = [8, 9, 10, 11];
            yewuLayers.setVisibleLayers(visibleInit);
        })

        controlLayer = function() {
            var visibleId = [];
            for (var i = 0; i < visibleInit.length; i++) {
                var lid = visibleInit[i];
                var checkid = window.parent.document.getElementById(lid);
                if (checkid.checked) {
                    visibleId.push(lid);
                }
            }
            yewuLayers.setVisibleLayers(visibleId);
        }
    })
}