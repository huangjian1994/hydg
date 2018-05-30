if (mapId.index == 0) {
    console.log(mapId.index);
    require([
        "dojo/parser",
        "esri/map",
        "esri/layers/ArcGISTiledMapServiceLayer",
        "esri/layers/ArcGISDynamicMapServiceLayer",
        "esri/geometry/Extent",

    ], function(
        parser, Map, Tiled,
        ArcGISDynamicMapServiceLayer, Extent

    ) {
        var tiled = new Tiled("http://31.16.1.101/arcgis/rest/services/shsw_JCDXT2016/MapServer");
        var map = new Map("map1", {
            logo: false,
            zoom: 3,
            maxZoom: 7,
            slider: false
        });
        map.addLayer(tiled); //底图

        map.on("load", function() {
            $('body').addClass('loaded');
            $('#loader-wrapper .load_title').remove();
        })
    });
}