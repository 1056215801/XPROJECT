<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/organizationCountConfig.js"></script>
<title>test</title>
</head>
<body class="gray-bg">
<%@ include file="header.jsp"%> 
<div id="ten-test" style="width:100%; height:calc(100% - 70px);">   
    <div class="nav-title">
    	<form action="" method="post" id="form">
			<input type="hidden" id="orgId" name="orgId" :value="orgId">
			<input type="hidden" id="year" name="year">
			<input type="hidden" id="month" name="month">
			<input type="hidden" id="lastYear" name="lastYear">
			<input type="hidden" id="lastMonth" name="lastMonth">
			<input type="hidden" id="typeName" name="typeName" :value="typename">
			<input type="hidden" id="spanName" name="spanName" :vlaue="spanname">
		</form>
    	<div class="nav" id="test-nav">	
			<div class="nav-text">
				<div class="eightIndustry" @click="changeDiv(1)">
					<img width="25" src="${ctx}/static/image/cityDataCenter/ycNew/icons_08.png">
					<font>十大基地</font>
				</div>
			    <div class="tab-eightIndustry" id="index" @click="changeDiv(2)">
				   	<span name="title"  data="zyywsr"  :class="{'on': change == 2}">主营业务收入</span>
			    </div>		   
			   	<div class="selects" id="forthTab00" style="display: inline-block;">
					<div class="select select1">
						<p @click="sToggle"><font id="font1">{{ ksyear }}</font><i class="fa fa-caret-down"></i></p>
						<div class="select-items" style="display:block;" v-if="togshow">
							<ul id="ul1">
								<li v-for="year in yearList" @click="selectYear(year,1)">{{ year }}</li>
							</ul>
						</div>
					</div>
					<div class="select select2">
						<p @click="sToggle2"><font id="font2">{{ ksmonth }}月</font><i class="fa fa-caret-down"></i></p>
						<div class="select-items" style="display:block;" v-if="tog2show">
							<ul id="ul2">
								<li v-for="m in 12" @click="selectYear(m,2)">{{ m++ }}月</li>
							</ul>
						</div>
					</div>
				</div>
					
			</div>
		    <%-- <div class="return" onclick="location.href='${ctx}/front/cityDataCenter/ycIndex/1?orgId=3609009'"><img src="${ctx}/static/image/liData/back.png"><font>返回首页</font></div> --%>
		</div> 
    </div>
    <div class="container-fluid eight-content" id="div1" v-if="change==1">
       <div class="floor">
         <div class="part">
         	<div class="part-content" style="position: relative; padding: 5px 5% 5px 8%; background: rgba(0,0,0,0.1);">
         		<div class="tab" id="thirdTab0" style="overflow: hidden;height: 100%">
					<div class="orders" style="display: inline-block;">
						<b>按指标排名：</b>
						<span :class="{'on': orindex == k}" v-for="(ord,k) in orders" @click="ordersPx(ord.value,k)">
							{{ ord.text }}
							<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_06.png">
							<img src="${ctx}/static/image/cityDataCenter/ycNew/icons_03.png">
						</span>
					</div>				
					<div class="industry-list" id="industryList">
						<div class="industry-item" :class="{'on': acindex == k}" v-for="(list,k) in getlist" @click="changeMap(k,list.BASE_NAME)" v-if="orderby=='ZYYWSR_VALUE DESC' && zyywsrValue != '0'">
							<span>{{ k+1 }}</span>
							<font>{{ list.BASE_NAME }}</font>							
							<font class="percentBox"><div :style="{width:(((list.ZYYWSR_VALUE?list.ZYYWSR_VALUE:'0')/zyywsrValue)*100*0.9).toFixed(2)+'%'}"></div></font>
							<font class="yellowT"><b>{{ (list.ZYYWSR_VALUE/10000).toFixed(2) }}</b>亿元</font>
						</div>
						<div class="industry-item" :class="{'on': acindex == k}" @click="changeMap(k,list.BASE_NAME)" v-else-if="orderby=='LR_VALUE DESC' && lrValue != '0'">
							<span>{{ k+1 }}</span>
							<font>{{ list.BASE_NAME }}</font>							
							<font class="percentBox"><div :style="{width:(((list.LR_VALUE?list.LR_VALUE:'0')/lrValue)*100*0.9).toFixed(2)+'%'}"></div></font>
							<font class="yellowT"><b>{{ (list.LR_VALUE/10000).toFixed(2) }}</b>亿元</font>
						</div>
						<div class="industry-item" :class="{'on': acindex == k}" @click="changeMap(k,list.BASE_NAME)" v-else>
							<span>{{ k+1 }}</span>
							<font>{{ list.BASE_NAME }}</font>							
							<font class="percentBox"><div :style="{width:list.LR_RATE+'%'}"></div></font>
							<font class="yellowT"><b>{{ list.LR_RATE?list.LR_RATE:'0' }}</b>%</font>
						</div>
					</div>
				</div>
         	</div>
         </div>
         <div class="part">
         	<div class="part-content" style="background: rgba(0,0,0,0.1);">
         		<div class="eight-map">
         			<div class="mapContent" id="ten-map2">
         				
         			</div>
         		</div> 
         	</div>
         </div>
       </div>
     	<div class="floor">
     		<div class="part">
         		<div class="part-content" style="background: rgba(0,0,0,0.1);">
         			<div class="eight-map">
         				<div  class="mapContent" id="ten-map3">
         			
         				</div>
         			</div>
         		</div>
         	</div>
         	<div class="part">
	         	<div class="part-content" style="background: rgba(0,0,0,0.1);">
	         		<div class="eight-map">
         				<div  class="mapContent" id="ten-map4">
         			
         				</div>
         			</div>
	         	</div>
         	</div>
       </div>
    </div>
    <div class="container-fluid eight-content" id="div2" v-else>
    	<div class="floor">
            <div class="part">
	         	<div class="part-content" style="position: relative; padding: 5px 5% 5px 8%; background: rgba(0,0,0,0.1);">
	   				<div class="tab" style="overflow: hidden;height: 100%">
						<div class="orders" style="display: inline-block;">
							<b>按指标排名：</b>
						</div>
						<div class="industry-list" id="rateList">
							<div class="industry-item" v-for="(sec,k) in seclist">
								<span>{{ k+1 }}</span>
								<font>{{ sec.BASENAME }}</font>							
								<font class="percentBox"><div :style="{width:sec.PROFITMARGIN+'%'}"></div></font>
								<font class="yellowT"><b>{{ sec.PROFITMARGIN }}</b>%</font>
							</div>
						</div>	
					</div>
	         	</div>
	         </div>
	        <div class="part">
	         	 <div class="part-content" style="background: rgba(0,0,0,0.1);">
	         		 <div class="eight-map" id="ten-table">
	         			 <table class="ten-table">
         					<tr v-for="(tr,k) in trs" v-if="k==0">
         						<td>{{ tr.text }}</td>
         						<td v-for="td in tds">{{ td.text }}</td>
         					</tr>
         					<tr v-else>
         						<td>{{ tr.text }}</td>
         						<td v-for="(td,k) in tds">{{ td.id }}</td>
         					</tr>
         				</table>
	         		 </div> 
	         	 </div>
	         </div>
        </div>
     	<div class="floor">
     	
     		<div class="part" v-for="(pie,k1) in pies">
         		<div class="part-content" style="background: rgba(0,0,0,0.1);">
         			<div class="eight-map">
         				<div  class="mapContent" :id="pie.id"></div>
         				<div class="changeChart">
         					<span :class="{'on' : pindex==k2}" v-for="(p,k2) in pie.text" @click='changeChart(k1,k2)'>{{ p.text1 }}</span>
         				</div>
         			</div>
         		</div>
         	</div>
         	
        </div>
	</div>
 </div>   

   	 
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/ycData.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/vue/vue.js"></script>

<script type="text/javascript">
new Vue({
	el: '#ten-test',
	data: {
		typename : '',
		spanname : '主营业务收入',
		orgId : '${orgId}',
		orders : [
			{text:'主营业务收入',value: 'ZYYWSR_VALUE DESC'},
			{text:'利润总额',value: 'LR_VALUE DESC'},
			{text:'利润率',value: 'LR_RATE DESC'}
		],
		orderby : 'ZYYWSR_VALUE DESC',
		orindex : 0,
		toggle : 0,
		togshow : false,
		tog2show : false,
		yearList : [],
		selectyear : ' ',
		ksyear : ' ',
		acindex : 0,
		selectmonth : ' ',
		ksmonth : ' ',
		zyywsrValue : ' ',
		lrValue : ' ',
		getlist : [],
		change : 1,
		econData : '',
		seclist : [],
		pindex : 0,
		trs : [
			{text:''},
			{text:'产业名称'},
			{text:'当前数据'},
			{text:'上年同期'},
			{text:'同比'}
		],
		tds : [
			{text:'利润率最高',id:'lr'},
			{text:'销售收入最高',id:'lr'},
			{text:'产品利润最高',id:'lr'}
		],
		pies : [
			{text:[{text1:'总量对比'},{text1:'同比对比'}],id:'bar2'},
			{text:[{text1:'总量对比'},{text1:'同比对比'}],id:'bar3'},
		],
	},
	mounted: function(){
		this.getselectYear();
		this.getList(1);
		this.getMap();
	},
	methods : {
		ordersPx : function(e,f){
			this.orderby=e;
			this.orindex=f;
			this.getlist=[];
			this.getList(); 
		},
		getselectYear : function(){
			var date = new Date();
			var y = date.getFullYear();
		    for(var i=y; i>2014;i--){
		    	this.yearList.push(i);
		    }
		},
		sToggle : function(){
			this.togshow = !this.togshow;
		},
		sToggle2 : function(){
			this.tog2show = !this.tog2show;	
		},
		selectYear : function(msg,type){
			if(type==1){
				this.ksyear=msg;
			} else {
				this.ksmonth=msg-1;	
			}		
			this.getList();
 			//loadData();
		},	
		getList : function(typelist){
			var self = this;
			var getlistdata = self.ksyear+'-'+self.ksmonth;
			if(typelist==1){
				getlistdata = "";
			}
			$.ajax({
		  		url : "${OfficeUrl}XOffice/interface/json/dataIndustryBaseLog/dataCenterList",
				type : "post", 
				data : {
					"date": getlistdata,
					"orderby": self.orderby,
		 		},
				dataType : "json",
				success : function(result) {
					console.log(result);
					if(typelist==1){
						self.ksyear=result.yearCaliber;
						self.ksmonth=result.monthCaliber;
					}		
					var list = result.value;
					if(list.length>0){
						self.selectyear=result.yearCaliber;
						self.selectmonth=result.monthCaliber;
						self.getlist=list;
						self.zyywsrValue = list[0].ZYYWSR_VALUE;
						self.lrValue = list[0].LR_VALUE;
						self.getMap();
						for(var i=0;i<list.length;i++){
							if(i==0){
						    	self.typename=list[i].BASE_NAME;
						    }
						}
					}else{
						alert(self.ksyear+'年'+self.ksmonth+"未公布数据");
						self.ksyear=self.selectyear;
						self.ksmonth=self.selectmonth;
					}
					
				},	
				error : function() {
					//tips("请求超时，请稍后重试");
				},
			});
		},
		getMap : function(){
			var self = this;
			$.ajax({
				url : "${OfficeUrl}XOffice/interface/json/dataIndustryBaseLog/listForEchart",
				type : "post",
				data : {
					"yearCaliber": self.ksyear,
					"monthCaliber": self.ksmonth,
					"baseName": self.typename,
					"dateType": 0
			 	},
				dataType : "json",
				success : function(result) {
					if(result.success){
						var echartData = result.echartData;
						chart5(echartData.bar4,self.typename,self.ksyear,self.ksmonth);
						chart6(echartData.bar1,self.ksyear,self.typename,self.spanname);
						chart7(echartData.bar3,self.ksyear,self.ksmonth,self.typename);
					}
				},
				error : function() {
					//tips("请求超时，请稍后重试");
				},
			});	
		},
		changeMap : function(e,name){
			this.acindex = e;
			this.getMap();
			this.typename=name
		},
		
		changeDiv : function(type){		
			this.change=type;
			if(type==1){
				this.getMap();
			}else{
				this.loadData();
			}
		},
		loadData : function(){
			var self=this;
			$.ajax({
				url : "${OfficeUrl}XOffice/interface/json/dataIndustryBaseLog/indexData",					  
				type : "post",
				data : {
					"orgId" : self.orgId!=''?self.orgId:'360900',
					"yearCaliber" :  self.ksyear,
					"monthCaliber" : self.ksmonth	
				},
				success : function(result) {
					console.log(self.econData,'111');
					var data = result;
					self.econData = data;
					if(data.profitMargin.length>0){
						self.seclist=data.profitMargin;
					}	
					//loadTable(data.data);
					self.loadBar(data.lrData.lrValue,data.lrData.lrName,'bar2','各产业利润对比（亿元）');
					self.loadBar(data.zyywsrData.zyywsrValue,data.zyywsrData.zyywsrName,'bar3','各产业主营业务对比（亿元）');
				},
				error : function() {
					layer.msg("数据获取异常！");
				}

			})
		},
		changeChart : function(ptype1,ptype2){
			var self = this;
			console.log(self.pindex);
			if(ptype1 == 0) {
				self.pindex = ptype2;
				
				if(ptype2 == 0) {
					self.loadBar(self.econData.lrData.lrValue,self.econData.lrData.lrName,'bar2','各产业利润对比（亿元）');
				} else {
					self.loadBar2(self.econData.lrData.lrPercent,self.econData.lrData.lrName,'bar2','各产业利润对比（亿元）');
				}
			} else {
				if(ptype2 == 0) {
					self.loadBar(self.econData.zyywsrData.zyywsrValue,self.econData.zyywsrData.zyywsrName,'bar3','各产业主营业务对比（亿元）');
				} else {
					self.loadBar2(self.econData.zyywsrData.zyywsrPercent,self.econData.zyywsrData.zyywsrName,'bar3','各产业主营业务对比（亿元）');
				}
			}		
		}, 
		loadBar : function(d1,d2,id,t){
			$("#"+id).removeAttr("_echarts_instance_");
			var chart = echarts.init(document.getElementById(id));
			var d3 = [];
			for(var i=0;i<d1.length;i++){
				var temp = { name: d2[i], value: d1[i]}
				d3.push(temp)
			}
			var option = {
				title: {
					text: t,
			        x: "0",
			        textStyle: {
			            color: '#fff',
			            fontSize: '16'
			        },
				},
				tooltip: {
					trigger: 'item'
				},
			    legend: {
			    	show: true,
					data: d2,
			        top: 'center',
			        right: '0',
			        orient: 'vertical',
			        padding:[10,10],
			        itemWidth:20,
			        itemHeight:10,
			        itemGap:6,
			        textStyle: {
			            fontSize: 14,
			            color: '#fff'
			        }
			    },
			   	grid: {
			    	top: 60,
			    	bottom: 0,
			    	left: 0,
			    	rigth: 0,
			        containLabel: true
			    },
				textStyle: {
				    color: '#fff'
				 },
			    color:['#FF43CC','#FFA360','#0060B1','#E60012','#FFFF60',
			           '#8957A1','#2199FF','#FF4571','#4EC971','#16ffaf',
			           '#f06500','#ffbb18','#009812','#b40040','#49d000',
			           '#ff2333'],
			    series: {
			        type: 'pie',
			        radius : ['55%', '70%'],
			        center: ['45%', '52%'],
			        label: {
			        	formatter: function(params){
			            	return params.name + "\n" + params.value + "亿元（" + (params.percent).toFixed(0)+"%）";
			            },
			            fontSize: 14,
			            color: '#fff'
			        },
			        labelLine: {
			        	length: 10,
			        	length2: 10,
			        	lineStyle: {
							color: '#fff'
						}
					},
					data: d3
			    }
			};
			if(d1&&d1.length>0){
				chart.setOption(option);
			}else{
				$("#"+id).html("<div id='noData'>暂无数据</div>");
			}
		},
		loadBar2 : function(d1,d2,id,t) {
			$("#"+id).removeAttr("_echarts_instance_");
			var chart = echarts.init(document.getElementById(id));
			var option = {
				title: {
					text: t,
			        x: "0",
			        textStyle: {
			            color: '#fff',
			            fontSize: '16'
			        },
				},
				tooltip: {
			        trigger: 'axis',
			        axisPointer : {           
			            type : 'shadow'    
			        },
					formatter: function(params){
		            	return params[0].name + ":" + params[0].value + "亿元";
		            }
			    },
			    grid: {
			    	top: 60,
			    	bottom: 0,
			    	left: 0,
			    	rigth: 0,
			        containLabel: true
			    },
			    xAxis: [{
		            type: 'category',
		            axisLine:{
		            	lineStyle: {
			                color: '#57617B'
			            }
		        	},
		        	axisLabel :{  
		        	    interval:0,
		        	    rotate:15,
		        	    textStyle: {
			                color: '#83adba',
		            	}
		        	},
		        	data: d2
		        }],
			    yAxis: [{
		            type: 'value',
		            nameTextStyle:{
		            	color: '#5EC9F4'
		            },
		            axisLabel: {
		                formatter: '{value} ',
		                textStyle: {
			                color: '#83adba',
		            	},
		            },
		            axisLine:{
		            	  lineStyle: {
		 	            	 color: '#83adba'
		 	            }
		        	},
		        	splitLine:{
		        		lineStyle:{
		        			opacity:0.2
		        		}
		        	}
		        }],
			    series: {
		            name:'总量',
		            type:'bar',
		            barWidth: 25,
		            itemStyle: {
			        	normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: '#2FA7E1'
			                }, {
			                    offset: 1,
			                    color: '#70E4F0'
			                }]),
			                opacity: 1
			            }
			        },
			        data: d1
		        }
			}
			if(d1&&d1.length>0){
				chart.setOption(option);
			}else{
				$("#"+id).html("<div id='noData'>暂无数据</div>");
		 	} 
		},


		
	}
})



function loadTable(d){
	$("#lrl1").html(d.lrName);
	$("#lrl2").html(tongBi(d.lrMax,2));
	$("#lrl3").html(tongBi(d.lrLast,2));
	$("#lrl4").html(tongBi(d.lrContrast,3));
	
	$("#sr1").html(d.profitMarginName);
	$("#sr2").html(tongBi(d.profitMarginMax,1));
	$("#sr3").html(tongBi(d.profitMarginLast,1));
	$("#sr4").html(tongBi(d.profitMarginContrast,3));
	
	$("#lr1").html(d.zyywsrName);
	$("#lr2").html(tongBi(d.zyywsrMax,1));
	$("#lr3").html(tongBi(d.zyywsrLast,1));
	$("#lr4").html(tongBi(d.zyywsrContrast,3));
	
}
function tongBi(d,t){           //根据不同类型返回不同数据，1是亿元，2是%，3是带箭头%
	if(t == 3){
		var d = Number(d);
		if(d > 0) { return d + '%<img src="${ctx}/static/image/cityDataCenter/yc/up.png" />'}
		else if( d == 0) { return '-'}
		else { return d + '%<img src="${ctx}/static/image/cityDataCenter/yc/down.png" />'}
	} else if(t == 2){
		if(d == '') { return '未公布';}
		else { return d + '%';}
	} else {
		if(d == '') { return '未公布';}
		else { return d + '<i>亿元</i>';}
	}
}


</script>
</html>