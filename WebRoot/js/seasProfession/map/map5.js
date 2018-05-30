if (mapId.index == 4) {
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
        var map = new Map("map5", {
            logo: false,
            zoom: 2,
            maxZoom: 7,
            extent: new Extent(yewuLayers.initialExtent),
            slider: false
        });
        map.addLayer(tiled); //底图
        map.addLayer(yewuLayers);
        map.on("load", function() {
            $('body').addClass('loaded');
            $('#loader-wrapper .load_title').remove();
            visible = [0,1,2,12,13,14,15,16];
            yewuLayers.setVisibleLayers(visible);
        });

        var visibleInit = [2];
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