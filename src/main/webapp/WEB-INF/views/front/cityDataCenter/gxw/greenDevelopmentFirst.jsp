<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit"/>
<meta http-equiv="Cache-Control" content="no-siteapp"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/gxwHomePage.css"/>
<title>江西省工业大数据绿色发展</title>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="360000">
		<input type="hidden" id="year" name="year" value="">
		<input type="hidden" id="month" name="month" value="">
		<input type="hidden" id="region" name="region" value="江西省">
	</form>
	<%@ include file="header.jsp"%>
	<div class="content2 p15 fz0">
		<div class="spanStyle" style="width: 200px;">
			<div class="blockStyle" style="height: calc(100% - 10px);">
				<div class="nav">	
					<div class="nav-text">
						<div class="eightIndustry dib" style="padding: 5px 0px 5px 35px;">
							<img src="${ctx}/static/image/cityDataCenter/jxNew/lsfz.png">
							<font style="margin: 0 15px 0 5px;">绿色发展</font>
						</div>
					</div>
				</div> 
				<div class="pro-left">
					<ul class="production">
						<li class="first-li on" id="">
							<div class="product-type" id="gyjn">工业节能</div>
						</li>
						<li class="first-li" id=""> 
							<div class="product-type" id="lsyq">绿色园区</div>
						</li>
						<li class="first-li" id=""> 
							<div class="product-type" id="lsgc">绿色工厂</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="spanStyle" style="width: calc(52% - 110px);">
			<div class="blockStyle" style="height:calc(100% - 10px);">
				<!-- <div class="otherOutsideBox"> -->
					<div class="tbzz-box">
						<h1>全省工业单位增加值能耗同比增长:</h1>
						<div class="gytz-total">
							<div class="value-box" id="chart0"></div>
							<img class="dib" src="${ctx}/static/image/cityDataCenter/jxNew/big-green-down.png">
						</div>
					</div>
					<div id="ycMap" style="width: 100%; height: 100%;padding: 13% 0 0 15%;"></div>
				<!-- </div> -->
			</div>
		</div>
		<div class="spanStyle" style="width: calc(48% - 110px);">
			<div class="blockStyle" style="height: calc(100% - 10px)">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">各地市单位增加值能耗同比增长</span>
						<div class="fr selects">
							<div class="select">
								<p><font id="">2017</font><i class="fa fa-caret-down"></i></p>
								<!-- <div class="select-items">
									<ul id=""></ul>
								</div> -->
							</div>
						</div>
					</div>
					<div id="echart"  class="tbzz-echart"></div>
					<div class="tbzz-table">
							<table id="table" ></table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-liquidfill.min.js"></script>
<script src="${ctx}/static/js/dataCenter/gxwData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script type="text/javascript">
	var data1=[
		{'name':'南昌市',value:-4.97},
		{'name':'景德镇市',value:-7.10},
		{'name':'萍乡市',value:-9.27},
		{'name':'九江市',value:-7.04},
		{'name':'新余市',value:-8.21},
		{'name':'鹰潭市',value:-1.75},
		{'name':'赣州市',value:-5.83},
		{'name':'吉安市',value:-4.79},
		{'name':'宜春市',value:-8.10},
		{'name':'抚州市',value:6.46},
		{'name':'上饶市',value:-2.26}
	]
	$(function(){
		$(".head>a:eq(4)").addClass("on");
		$(".select p").on("click",function(){
			$(this).next().slideToggle();
		});
		//左侧菜单栏点击事件
		$(".product-type").on("click",function(){
			$(this).parent().addClass("on").siblings().removeClass("on");
			$(this).parent().siblings().find(".product-item").slideUp();
			$(this).siblings(".product-item").slideDown();
			if($(this).attr("id") == "lsyq"){
				layer.msg("正在建设中！");
			}else if($(this).attr("id") == "gyjn"){
				window.location.href = "${ctx}/front/cityDataCenter/gxwIndex/20";
			}else if($(this).attr("id") == "lsgc"){
				window.location.href = "${ctx}/front/cityDataCenter/gxwIndex/21";
			}else{}
		})
		getJxMap(data1);
		getbar(data1);
		getselectYear();
		gettable(data1);
		chart0(-5.5)
	});
	function getselectYear(){
		var date = new Date();
		var y = date.getFullYear();
	    for(var i=y; i>y-4;i--){
	    	//$('#sy').append('<li>'+i+'</li>');
	    }
		$(".select li").on("click",function(){
			$(this).parents('.select-items').slideToggle();
			/* if($(this).parent().attr('id')=='sy'){
				
			} */
		})
	}
	function getJxMap(data){
	    var data = data;
		$.get('${ctx}/static/map/360000.json', function (chinaJson) {
		    echarts.registerMap('jiangxi', chinaJson);
			jxHotMap_new(data);
		});
	}
	function jxHotMap_new(d1) {
		var myChart = echarts.init(document.getElementById('ycMap'));
		var option = {
			tooltip: {
				trigger: 'item',
				showDelay: 0,
				transitionDuration: 0.2,
				formatter: function (params) {
					//var value = (params.value + '').split('.');
					//value = value[0].replace(/(\d{1,3})(?=(?:\d{3})+(?!\d))/g, '$1,');
					return params.name + '工业单位增加值能耗同比增长: ' + params.value + '<br/>';
				}
			},
			visualMap: {
				bottom: 0,
				right: 50,
				min: -10,
				max: 10,
				itemWidth:50,
				itemHeight:230,
				inverse:true,
				inRange: {
					color: ['#0DFF29', '#FFCE00']
				},
				textStyle: {
					color: '#fff'
				},
				text:['低', '高'],           // 文本，默认为数值文本
				calculable: false
			},
			toolbox: {
				show: false
			},
			series: [
				{
					name: '工业单位增加值能耗同比增长',
					type: 'map',
					roam: false,
					zoom: 1.2,
					map: 'jiangxi',
					aspectScale : 1,
					itemStyle:{
						normal:{
							
							label:{
								show:true,
								position: 'inside',
								fontSize:13,
								rich: {
									a: {
										'color':'#FF1A1A',
										'fontSize':15
									},
									b:{
										'fontSize':15
									}
								},
								formatter:function(params){
									var label='';
									if(params.name=='九江市'){
										label='\n\n\n'
									}
									if(params.value>0){
										label+=params.name+'\n'+'{a|'+params.value+'}'
									}else{
										label+=params.name+'\n'+'{b|'+params.value+'}'
									}
									return label;
								}
							},
							borderWidth:2
						},
						emphasis:{
							label:{
								show:true,
							},
							borderWidth:0
						}
					},
					// 文本位置修正
					textFixed: {
						Alaska: [20, -20]
					},
					data: d1
				}
			]
		};
		myChart.setOption(option);
	};
	function getbar(data){
		var myChart = echarts.init(document.getElementById('echart'));
		var labelRight = {
			normal: {
				position: 'right'
			}
		};
		var labelLeft = {
			normal: {
				position: 'left'
			}
		};
		for(var i=0;i<data.length;i++){
			if(data[i].value<0){
				data[i]['label']=labelLeft
			}else{
				data[i]['label']=labelRight
			}
		}
		var option = {
			tooltip : {
				trigger: 'axis',
				axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				},
				show:true
			},
			grid: {
				top: 30,
				bottom: 30
			},
			xAxis: {
				type : 'value',
				splitLine: {
					lineStyle:{
						type:'solid',
						color:'rgba(255,255,255,0.2)',
					},
					textStyle: {
						color:'#fff'
					}
				},
				axisLine: {show: false},
				axisLabel:{
					show:true,
					color: '#fff',
				},
			},
			yAxis: {
				inverse:true,
				type : 'category',
				axisLine: {show: false},
				axisLabel: {show: false},
				axisTick: {show: false},
				splitLine: {show: false},
				data:['南昌市','景德镇市','萍乡市','九江市','新余市','鹰潭市','赣州市','吉安市','宜春市','抚州市','上饶市']
			},
			series : [
				{
					name:'',
					type:'bar',
					stack: '总量',
					barWidth:'30',
					label: {
						normal: {
							show: true,
							color:'#fff',
							formatter:'{b}\t\t\t{c}'
						}
					},
					itemStyle: {
						color: function(params){
							if(params.value<0){
								color=new echarts.graphic.LinearGradient(0, 0, 1, 0,[{offset: 0, color: '#67F8B3'},{offset: 1, color: '#05A6FC'}]);
							}else{
								color=new echarts.graphic.LinearGradient(0, 0, 1, 0,[{offset: 0, color: '#FFD154'},{offset: 1, color: '#FF903E'}]);
							}
							return color
						}
					},
					data:data
				}
			]
		};
		myChart.setOption(option);
	}
	function gettable(data){
		// $("#table")
		var div1='';
		var div2='';
		var color=''
		div1+='<tr>';
		div2+='<tr>';
		for(var i=0;i<data.length;i++){
			div1+='<td>'+data[i].name+'</td>'
		}
		div1+='</tr>'
		for(var j=0;j<data.length;j++){
			if(data[j].value>0){
				color='#FF1A1A'
			}else{
				color='#FFE42D'
			}
			div2+='<td style="color:'+color+'">'+data[j].value+'</td>'
		}
		div2+='</tr>';
		$("#table").append(div1);
		$("#table").append(div2);
	}
	//水球
	function chart0(d1){
		var chart = echarts.init(document.getElementById('chart0'));
		var option = {
			    series:[{
			        type: 'liquidFill',
			        data: [{
			        	value: 0.5,
			        	name: '增加值',
			        	phase: Math.PI,
			        	val: d1
			        }, 0.5],
			        color: [{
	            		type: 'linear',
	            	    x: 0,
	            	    y: 0,
	            	    x2: 0,
	            	    y2: 1,
	            	    colorStops: [{
	            	        offset: 0, color: '#0539AA' // 0% 处的颜色
	            	    }, {
	            	        offset: 1, color: '#3DABFF' // 100% 处的颜色
	            	    }],
	            	    globalCoord: false // 缺省为 false
		            },{
	            		type: 'linear',
	            	    x: 0,
	            	    y: 0,
	            	    x2: 0,
	            	    y2: 1,
	            	    colorStops: [{
	            	        offset: 0, color: '#3DABFF' // 0% 处的颜色
	            	    }, {
	            	        offset: 1, color: '#0539AA' // 100% 处的颜色
	            	    }],
	            	    globalCoord: false // 缺省为 false
		            }], //颜色
			        center: ['50%','50%'], //位置
			        outline: {  //边框
			            show: true,
			            borderDistance: 5,
			            itemStyle: {
			                color: '#051442',
			                borderColor: '#044CDE',
			                borderWidth: 3
			            }
			        },
			        phase: 0,
			        period: 3000,
			        waveLength: '100%',
			        animationDurationUpdate: 2000,
			        radius: '85%', //半径
			        backgroundStyle: {
			            color: '#051442'
			        },
			        label: {
			            color: '#f1c851',
			            insideColor: '#f1c851',
			            fontSize: 26,
		            	formatter: function(params){
		            		return params.data.val + "%";
		            	}
			        }
			    }]
			};
		chart.setOption(option);
	}
</script>
</html>