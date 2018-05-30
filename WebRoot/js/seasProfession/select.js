$(function() {
	var addressInit = function(select_layer,filter, operator, result,result_contain,defaultarea1, defaultProvince, defaultCity, defaultArea)  
	{  
	    var area=document.getElementById(select_layer);  
	    var cmbProvince = document.getElementById(filter);  
	    var cmbCity = document.getElementById(operator);  
	    var cmbArea = document.getElementById(result);  
	    var cmbContain = document.getElementById(result_contain); 
	    function cmbSelect(cmb, str)  
	    {  
	        for(var i=0; i<cmb.options.length; i++)  
	        {  
	            if(cmb.options[i].value == str)  
	            {  
	                cmb.selectedIndex = i;  
	                return;  
	            }  
	        }  
	    }  
	    function cmbP(cmb, str)  
	    {  
	        for(var i=0; i<cmb.childNodes.length; i++)  
	        {  
	            if(cmb.childNodes[i].value == str)  
	            {  
	                cmb.selectedIndex = i;  
	                return;  
	            }  
	        }  
	    }  
	    function cmbAddOption(cmb, str, obj)  
	    {  
	        var option = document.createElement("OPTION");  
	        option.innerHTML = str;  
	        option.value = str;  
	        option.obj = obj;  
	        cmb.options.add(option);  
	    }  
	    function cmbAddp(cmb, str)  {  	    	
	        var p = document.createElement("p");  	       
	        p.innerHTML = str;  	
	        p.value = str;  
	        cmb.appendChild(p);  
	    }   
	    function changeCity()  {  
	    	console.log(2);
	        //noinspection JSAnnotator
            cmbArea.childNodes.length = 0;
	        if(cmbCity.selectedIndex == -1)return;  
	        var item = cmbCity.options[cmbCity.selectedIndex].obj;  
	        $(cmbContain).empty();
	        for(var i=0; i<item.areaList.length; i++)  
	        {  
	            cmbAddp(cmbContain, item.areaList[i]);  
	        }  
	        cmbP(cmbArea, defaultArea);  
	    }  
	    function changeProvince()  
	    {  
	        cmbCity.options.length = 0;  
	        cmbCity.onchange = null;  
	        if(cmbProvince.selectedIndex == -1)return;  
	          
	        var item = cmbProvince.options[cmbProvince.selectedIndex].obj;  
	        for(var i=0; i<item[cmbProvince.selectedIndex].cityList.length; i++)  
	        {  
	            cmbAddOption(cmbCity, item[cmbProvince.selectedIndex].cityList[i].name, item[cmbProvince.selectedIndex].cityList[i]);  
	        }  
	        cmbSelect(cmbCity, defaultCity);  
	        changeCity();  
	        cmbCity.onchange = changeCity;  
	    }  
	    function changeArea()  
	    {  
	        cmbProvince.options.length = 0;  
	        cmbProvince.onchange = null;  
	        if(area.selectedIndex == -1)return;  
	        var item=area.options[area.selectedIndex].obj;  
	        for(var i=0;i<item.Allcity.length;i++)  
	        {  
	            cmbAddOption(cmbProvince,item.Allcity[i].name,item.Allcity);  
	        }  
	        cmbSelect(cmbProvince,defaultProvince);  
	        changeProvince();  
	        cmbProvince.onchange=changeProvince;  
	    }  
	          
	          
	          
	          
	    for(var i=0; i<provinceList.length; i++)  
	    {  
	    //alert(provinceList[i].Allcity[0].name);  
	    //var mess=provinceList[i].Allcity.join('--');  
	    //alert(mess);  
	        cmbAddOption(area, provinceList[i]._area, provinceList[i]);  
	    }  
	      
	    cmbSelect(area, defaultarea1);  
	    changeArea();  
	    area.onchange = changeArea;  
	}
	/*var provinceList = [  
		{_area:"领海基线外12海里",Allcity:[  		  
			{name:'object', cityList:[           
				{name:'=', areaList:['1','2']},          
				{name:'!=', areaList:['1','2']},          
				{name:'<', areaList:['1','2']},          
				{name:'<=', areaList:['1','2']},             
				{name:'>', areaList:['1','2']},            
				{name:'>=', areaList:['1','2']},  			  
			]}
		],
		_area:"领海基线外13海里",Allcity:[  		  
		     {name:'object', cityList:[           
		        {name:'=', areaList:['1','2']},          
		        {name:'!=', areaList:['1','2']},          
		        {name:'<', areaList:['1','2']},          
		        {name:'<=', areaList:['1','2']},             
		        {name:'>', areaList:['1','2']},            
		        {name:'>=', areaList:['1','2']},  			  
		      ]}
		 ],
		_area:"领海基线外14海里",Allcity:[  		  
		        {name:'object', cityList:[           
			    {name:'=', areaList:['1','2']},          
			    {name:'!=', areaList:['1','2']},          
			    {name:'<', areaList:['1','2']},          
			    {name:'<=', areaList:['1','2']},             
			    {name:'>', areaList:['1','2']},            
			    {name:'>=', areaList:['1','2']},  			  
			]}
		]}		
	]*/
	var provinceList = [  
	    {_area:"领海基线12海里",Allcity:[    
			{name:'Id', cityList:[           
				{name:'=', areaList:['1','2']},          
				{name:'!=', areaList:['1','2']},          
				{name:'<', areaList:['1','2']},          
				{name:'<=', areaList:['1','2']},             
				{name:'>', areaList:['1','2']},            
				{name:'>=', areaList:['1','2']},  				  
			]},    
			{name:'Object', cityList:[           
				{name:'=', areaList:['1','2','3']},          
				{name:'!=', areaList:['1','2','3']},          
				{name:'<', areaList:['1','2','3']},          
				{name:'<=', areaList:['1','2','3']},             
				{name:'>', areaList:['1','2','3']},            
				{name:'>=', areaList:['1','2','3']},  
			]}		
		]},
		{_area:"水闸",Allcity:[    
			{name:'Id', cityList:[           
				{name:'=', areaList:['1','2']},          
				{name:'!=', areaList:['1','2']},          
				{name:'<', areaList:['1','2']},          
				{name:'<=', areaList:['1','2']},             
				{name:'>', areaList:['1','2']},            
				{name:'>=', areaList:['1','2']},  				  
			]},    
			{name:'Object', cityList:[           
				{name:'=', areaList:['1','2','3']},          
				{name:'!=', areaList:['1','2','3']},          
				{name:'<', areaList:['1','2','3']},          
				{name:'<=', areaList:['1','2','3']},             
				{name:'>', areaList:['1','2','3']},            
				{name:'>=', areaList:['1','2','3']},  
			]}		
		]}
	];  
	addressInit('select_layer','filter','operator','result','result_contain','领海基线外12海里','Object','=','');
})