	
	/*园区折线图legend配置*/
	var parkLineName = ["全部", "国家级", "重点省级", "省级", "筹建"];
	var parkLineLegend = {
    	top:5,
		right:'2%',
		selected:{'全部':true,'国家级':false,'重点省级':false,'省级':false,'筹建':false},
		inactiveColor:'#FFF',
        data:[
			{name:'全部',textStyle:{color:"#FCFF00"}},
			{name:'国家级',textStyle:{color:"#FCFF00"}},
			{name:'重点省级',textStyle:{color:"#FCFF00"}},
			{name:'省级',textStyle:{color:"#FCFF00"}},
			{name:'筹建',textStyle:{color:"#FCFF00"}}
		]
    }
	
	/*echart公用配置*/
	var lineStyle = [
		{
			normal:{
        		color:"#799C0E"
        	}
		},
		{
			normal:{
        		color:'#FCFF00'
        	}
		},
		{ }, { }, { }
	];
	
	
	var markPoint = [
			{
            	symbolSize:40,
            	itemStyle:{
            		normal:{
            			color:"#CD0567"
            		}
            	},
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'} 
                ]
            },
            {
            	symbolSize:40,
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ],
                label:{
                	normal:{
                		textStyle:{
	            			color:"#FCFF00"
            			}
                	}
                },
                itemStyle:{
                	normal:{
	            		color:'#799c0c'
	            	}
                }
            },
            {
            	symbolSize:40,
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            },
            {
            	symbolSize:40,
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            },
            {
            	symbolSize:40,
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            },
    ];
	
    var markLine = [
    		{
            	lineStyle:{
	            	normal:{
	            		color:"#799C0E"
	            	},
	            	emphasis:{
	            		color:'#5EC9F4'
	            	}
	            },
                data : [
                    {type : 'average', name: '平均值'}
                ]
            },
            {
                data : [
                    {type : 'average', name: '平均值'}
                ],
                lineStyle:{
	            	normal:{
	            		color:'#FCFF00'
	            	},
	            	emphasis:{
	            		color:'#5EC9F4'
	            	}
	            }
            },
            {
                data : [
                    {type : 'average', name: '平均值'}
                ],
                lineStyle:{
	            	emphasis:{
	            		color:'#5EC9F4'
	            	}
	            }
            },
            {
                data : [
                    {type : 'average', name: '平均值'}
                ],
                lineStyle:{
	            	emphasis:{
	            		color:'#5EC9F4'
	            	}
	            }
            },
            {
                data : [
                    {type : 'average', name: '平均值'}
                ],
                lineStyle:{
	            	emphasis:{
	            		color:'#5EC9F4'
	            	}
	            }
            }
    ];
   
	
    /*企业折线图legend配置*/
	var compLineName = ["投产", "非工企业数"];
	var compLineLegend = {
    	top:5,
		right:'2%',
		selected:{'投产':true, '非工企业数':false},
        data:[
			{name:'投产',textStyle:{color:"#FCFF00"}},
			{name:'非工企业数',textStyle:{color:"#FCFF00"}}
		]
    };
    
    