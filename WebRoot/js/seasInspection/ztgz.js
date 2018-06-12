var host = window.location.host;// 获取当前页面域名
var pageurl = 'http://'+ host;
var isFirst = true;
init = function(jsonArr){
	var datas = jsonArr;//查询得到结果
	require([
	         "esri/map",
		     "esri/layers/ArcGISTiledMapServiceLayer",
		     "esri/layers/ArcGISDynamicMapServiceLayer",
		     "esri/layers/GraphicsLayer",
		     "esri/graphic","esri/Color",
			 "esri/geometry/Point","esri/symbols/SimpleMarkerSymbol",
			 "esri/symbols/SimpleLineSymbol",
			 "esri/InfoTemplate","esri/dijit/InfoWindowLite",
			 "dojo/dom","dojo/on","dojo/domReady!"
		   ],function(
				   Map,Tiled,ArcGISDynamicMapServiceLayer,GraphicsLayer,
				   Graphic,Color,
				   Point, SimpleMarkerSymbol,SimpleLineSymbol,
				   InfoTemplate,InfoWindowLite,
				   dom, on
		   ){
				// tiled = new Tiled("http://31.16.1.101/arcgis/rest/services/shsw_JCDXT/MapServer");
				tiled = new Tiled("http://31.16.1.101/arcgis/rest/services/shsw_JCDXT2016/MapServer");
		     	graLayer = new GraphicsLayer();
		     	//用海方式地图
		     	map = new Map("map", {
		     		logo: false,
		     		minzoom: 4,
		     		maxZoom:8,
		     		slider: false
		     	});
		     	map.addLayer(tiled); //底图
		     	map.addLayer(graLayer);
		     	map.on("load",function(){
		     		if(datas != null){
		     			var datas2 = datas.replace(/[\r\n]/g, "");//去除换行符
				    	var pointData = eval(datas2);
//				    	console.log(pointData);
				    	showPoint(pointData);
				    }
		       });
		       function showPoint(pointData){
		    	   for(var i = 0;i<pointData.length;i++){
						var data = pointData[i];
						var pos = new Point(data.nm_posx, data.nm_posy, map.spatialReference);
						switch(data.nm_state){
							case "1":
								var color = new Color([255,255,255,0.8]);//黑色
								var state = "发现";
								break;
							case "2":
								var color = new Color([255,255,0,0.8]);//黄
								var state = "立案";
								break;
							case "3":
								var color = new Color([255,100,100,0.8]);//玫红色
								var state = "派发";
								break;
							case "4":
								var color = new Color([0,0,255,0.8]);//蓝色
								var state = "处理";
								break;
							case "5":
								var color = new Color([0,255,0,0.8]);//绿色
								var state = "结案";
								break;
						}
						if(data.nm_dhtype == "1"){
							var dhtype = "堤防";
						}else{
							var dhtype = "海塘";
						}
						var symbol = new SimpleMarkerSymbol(
										SimpleMarkerSymbol.STYLE_DIAMOND,15, 
										new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID,
											    new Color([255,0,0]), 1),
							    	    color);
						var attr = {eventsn:data.st_eventsn,//任务号
								dhtype:dhtype,//事件类型1、堤防；2、海塘
								state:state,
								discovertime:data.dt_discovertime,//发现时间
								createtime:data.dt_createtime,//立案时间
								createnote:data.st_createnote,//立案备注
								claimsource:data.st_claimsource,//反映来源
								claimperson:data.st_claimperson,//反映人
								phoneno:data.st_phoneno,//联系电话
								name:data.st_name,//范围
								ebclass:data.st_ebclass,//问题类别(大类)
								esclass:data.st_esclass,//问题内容(小类)
								address:data.st_address,//发生地址
								description:data.st_description,//问题描述
								eventsource:data.st_eventsource,//问题来源
						};
						var graphic = new Graphic(pos,symbol);
						graphic.setAttributes(attr);
//						graphic.setInfoTemplate();
						graLayer.add(graphic);
					}
		       }
		     //显示案件信息
		       graLayer.on("mouse-over",function(event){
		    	   if(map.infoWindow.count != 0){
		    		   map.infoWindow.hide();
		    		   console.log(0);
		    	   }
		    	   var graphic = event.graphic;
		    	   showInfo(graphic);
		       });

		       graLayer.on("mouse-out", function(event){
		    	   var graphic = event.graphic;
//		    	   hideInfo(graphic);
		       });
		       graLayer.on("click",function(event){
		    	   var graphic = event.graphic;
		    	   showDetial(graphic);
		       });
		       function showInfo(graphic) {
//		    	   var eventsn = graphic.attributes.eventsn;
		       	    map.infoWindow.setTitle("案件信息");
		       	    map.infoWindow.setContent("任务号:"+ graphic.attributes.eventsn
		       	                          + "<br>事件类型: " + graphic.attributes.dhtype
		       	                          + "<br>案件状态: " + graphic.attributes.state
		       	                          + "<br>发现时间: " + graphic.attributes.discovertime
		       	                          + "<br>立案时间: " + graphic.attributes.createtime
		       	                          + "<br>立案备注: " + graphic.attributes.createnote
		       	                          + "<br>反映人: " + graphic.attributes.claimperson
		       	                          + "<br>联系电话: " + graphic.attributes.phoneno
		       	                          + "<br>范围: " + graphic.attributes.name
		       	                          + "<br>问题类别(大类): " + graphic.attributes.ebclass
		       	                          + "<br>问题内容(小类): " + graphic.attributes.esclass
		       	                          + "<br>发生地址: " + graphic.attributes.address
		       	                          + "<br>问题描述: " + graphic.attributes.description
		       	                          + "<br>问题来源: " + graphic.attributes.eventsource
		       	                          +"<br><button value="+graphic.attributes.eventsn+" state="+graphic.attributes.state+" onclick='showSpfw(this)'>流程信息</button>"
		       	                          );
		       	   map.infoWindow.resize(290, 300);
		       	   map.infoWindow.show(event.mapPoint, map.getInfoWindowAnchor(graphic.geometry));
		       }
		       function hideInfo(){
		    	   map.infoWindow.hide();
		       }
		       showSpfw = function(btn){
		    	   hideInfo();
		    	   var eventsn =  btn.value;
		    	   var state = $(btn).attr("state");
		    	   var data = {"spfw.st_eventsn" : eventsn};
		    	   $.ajax({
		               async: false,
		               type: 'post',
		               data: data,
		               url: pageurl+"/hydg/status/status_loadPatrolFlowsByEventsn.do",
		               datatype: "json",
		               cache: false,
		               success: function(json) {		    		   		
		    		       var data = JSON.parse(json);//流程信息弹框	    		   	   
		    		   	   //判断事件流程
		    		   	   var index = 0;//记录流程进度
		    		   	   //console.log(state)
		    		   	   var arrJudge = [];
		    		   	   //按流程排序内容
		    		   	   function sortContent (data,s){
		    		   		   $.each(data,function(key,value){
		    		   			   if(key == s){
		    		   				   arrJudge.push(value);
		    		   				   return;
		    		   			   }
		    		   		   })		    		   		   
		    		   	   }
		    		   	   //处理json数据
		    		   	   var changeKey = {  //替换映射
		    		   			"QX" : "区县",
		    		   			"FYR" : "反映人",
		    		   			"WTLB" : "问题类别",
		    		   			"AJLX" : "案件类型",
		    		   			"FSDZ" : "发生地址",
		    		   			"FX_TIME" : "发现时间",
		    		   			"WTMS" : "问题描述",
		    		   			"LXDH" : "联系电话",
		    		   			"AJLB" : "案件类别",
		    		   			"JGY" : "监管员",
		    		   			"FYLY" : "反映来源",
		    		   			"BJDM" : "部件代码",
		    		   			"DBAJ" : "是否督办案件",
		    		   			"RY" : "立案人",
		    		   			"LA_TIME" : "立案时间",
		    		   			"LABZ" : "立案备注",
		    		   			"CQAJ" : "是否超期案件",
		    		   			"AJBH" : "案卷编号",
		    		   			"PQRY" : "派遣人员",
		    		   			"CLBM" : "处理部门",
		    		   			"PQ_TIME" : "派遣时间",
		    		   			"PQBZ" : "派遣备注",
		    		   			"SJYQ" : "时间要求",
		    		   			"CL_TIME" : "处理时间",
		    		   			"CLYJ" : "处理意见",
		    		   			"CLRY" : "处理人员",
		    		   			"HCRY" : "核查人员",
		    		   			"HCYJ" : "核查意见",
		    		   			"JA_TIME" : "结案时间",
		    		   			"FJ" : "附件",
		    		   	   }
		    		   	   //替换英文
		    		   	   function replace(target,change){
		    		   		   for( var key in target ){
		    		   		        target[change[key]] = target[key];
		    		   		        delete target[key];
		    		   		   }
		    		   	   }		    		   	   
		    		   	   sortContent(data,"FX");
		    		   	   sortContent(data,"LA");
		    		   	   sortContent(data,"PQ");
		    		   	   sortContent(data,"CL");
		    		   	   sortContent(data,"JA");
		    		   	   for(var i = 0;i < arrJudge.length;i++){
		    		   		   replace(arrJudge[i],changeKey);
		    		   	   }
		    		   	   //console.log(arrJudge);		    		   	   
		    		   	   //判断流程进度
		    		   	   function judgeProcess (state){
		    		   		   switch(state){
		    		   		   case "发现":
		    		   			   index = 0;
		    		   			   break;
		    		   		   case "立案":
		    		   			   index = 1;
		    		   			   break;
		    		   		   case "派发":
		    		   			   index = 2;
		    		   			   break;
		    		   		   case "处理":
		    		   			   index = 3;
		    		   			   break;
		    		   		   case "结案":
		    		   			   index = 4;
		    		   			   break;
		    		   		   }
		    		   	   }
		    		   	   judgeProcess(state);
		    		   	   //console.log(index);
		    		   	   //清楚流程缓存
		    		   	   if(!isFirst){
		    		   		   $("#ystep .stepCont").remove();
		    		   		   $("#ystep .step-option").remove();
		    		   	   }else{
		    		   		   isFirst = false;
		    		   	   }
		    		   	   //生成表格
		    		   	   function produceTable(object){
		    		   		   var ystep = '<div class="stepCont stepCont1">' + 
					   		   			       '<div class="ystep-container ystep-lg ystep-blue"></div>' +
					   		   			   '</div>'+
					   		   			   '<div class="step-option">' +
					   		   			   		'<table></table>' +
					   		   			   '</div>';
					   		   $("#ystep .option-body").append(ystep);
					   		   $.each(object,function(key,value){
					   			   var tr = '<tr>' + 
					   			   				'<td class="right">'+ key +'</td>' +
					   			   				'<td class="left">'+ value +'</td>' +
					   			   			'</tr>';		    		   			   
					   			   $("#ystep table").append(tr);
					   		   })
		    		   	   }
		    		   	   //生成流程页面
		    		   	   function produceProcess(index,arr){
		    		   		   var node_index = index + 1;//流程节点
		    		   		   var table_index = index;//表格流程编号		    		   		   
		    		   		   produceTable(arr[table_index]);
		    		   		   var step1=new SetStep({
		    		   	           content:'.stepCont1',
		    		   	           curStep:node_index,
		    		   	           pageCont:"",
		    		   	           arr:arr,
		    		   	           index:index,
		    		   	       }) 
		    		   	   }
		    		   	   produceProcess(index,arrJudge);
		    		   	   $("#ystep").show();
		    	   	   }
		    	   })
		       }		       
	})
}

focusGra = function(num){
	var number = num;
	require([
	         "esri/map","esri/graphic","esri/layers/GraphicsLayer"
	],function(
			Map,Graphic,GraphicsLayer
	){
		var graphics = graLayer.graphics;
		for(var i = 0;i<graphics.length;i++){
			if(number == graphics[i].attributes.eventsn){
				var center = graphics[i].geometry;
				center.spatialReference = map.spatialReference;
				map.setZoom(7);
				map.centerAt(center);
			}
		}
	})
}

