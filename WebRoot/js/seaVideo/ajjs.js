require([
	"esri/map",
	"esri/layers/ArcGISTiledMapServiceLayer",
	"esri/layers/ArcGISDynamicMapServiceLayer",
	"esri/geometry/Point","esri/graphic","esri/layers/GraphicsLayer",
	"esri/symbols/SimpleMarkerSymbol",
	"esri/Color","esri/symbols/PictureMarkerSymbol"
],function(
	Map,Tiled,ArcGISDynamicMapServiceLayer,
	Point,Graphic,GraphicsLayer,
	SimpleMarkerSymbol,Color,PictureMarkerSymbol
){
	var tiled = new Tiled("http://31.16.1.101/arcgis/rest/services/shsw_JCDXT2016/MapServer");
	var	map = new Map("map", {
		logo: false,
		zoom: 4,
		maxZoom:7,
		slider: false
	});
	map.addLayer(tiled); //底图
	map.on("load",function(){		
//		$('body').addClass('loaded');
//        $('#loader-wrapper .load_title').remove();
		
	});
	var graLayer = new GraphicsLayer();
	map.addLayer(graLayer);
	loadPoint();
	function loadPoint(){
		var symbol = new PictureMarkerSymbol('../../../../images/video.png', 50, 50);
		//大金山岛1
		var point1 = new Point(-4447.367940562527,-60446.668133655985,map.spatialReference);
		var attr1 = {num:'1000056$1$0$0'};
		var graphic1 = new Graphic(point1,symbol,attr1,null);
		graLayer.add(graphic1);
		//大金山岛2
		var point2 = new Point(-4518.805583437813,-60269.39694578027,map.spatialReference);
		var attr2 = {num:'1000055$1$0$0'};
		var graphic2 = new Graphic(point2,symbol,attr2,null);
		graLayer.add(graphic2);
	}
	graLayer.on("click",function(evt){
		var stat = evt.graphic.attributes.num;
		video(stat);
	})
})