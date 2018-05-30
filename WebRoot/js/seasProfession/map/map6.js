if (mapId.index == 5) {
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
        var map = new Map("map6", {
            logo: false,
            zoom: 3,
            maxZoom: 7,
            slider: false
        });
        map.addLayer(tiled); //底图
        map.addLayer(yewuLayers);
        map.on("load", function() {
            $('body').addClass('loaded');
            $('#loader-wrapper .load_title').remove();
            visible = [4, 5];
            yewuLayers.setVisibleLayers(visible);
        });
        
        var visibleInit = [4,5];
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