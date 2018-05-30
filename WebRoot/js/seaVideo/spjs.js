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
	
	var points = [
			{name:"浦东新区",x:41819.77660280045,y:-41762.4951258649,num:'1000020$1$0$0'},
			{name:"崇明区",x:34825.003699416426,y:39941.54079457016,num:'1000021$1$0$0'},
			{name:"奉贤区",x:25020.68319790411,y:-42345.53784628553,num:'1000023$1$0$0'},
			{name:"金山区",x:-9525.293485281327,y:-56040.9013779664,num:'1000024$1$0$0'}
	];
	var graLayer = new GraphicsLayer();
	map.addLayer(graLayer);
	loadPoint();
	function loadPoint(){
		var symbol = new PictureMarkerSymbol('../../../../images/video.png', 50, 50);
		for (var i = 0;i<points.length;i++){
			var pos = new Point(points[i].x,points[i].y,map.spatialReference);
			var attr = {name:points[i].name,num:points[i].num};
			var graphic = new Graphic(pos,symbol,attr,null);
			graLayer.add(graphic);
		}
	}
	graLayer.on("click",function(evt){
		var stat = evt.graphic.attributes.num;
		video(stat);
	})
})