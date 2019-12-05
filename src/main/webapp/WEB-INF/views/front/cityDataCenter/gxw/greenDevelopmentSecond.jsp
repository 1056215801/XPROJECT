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
<style>
	.content2.p15 {
		position: relative;
		height: -webkit-calc(100% - 160px);
		height: calc(100% - 160px);
		overflow: hidden;
	}
</style>
</head>
<body class="gray-bg bgsz">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="360000">
		<input type="hidden" id="year" name="year" value="">
		<input type="hidden" id="month" name="month" value="">
		<input type="hidden" id="region" name="region" value="江西省">
	</form>
	<%@ include file="header.jsp"%>
	<div class="nav-tittle">
		<div class="nav">	
			<div class="nav-text">
				<div class="eightIndustry dib" style="padding: 5px 0px 5px 35px;">
					<img src="${ctx}/static/image/cityDataCenter/jxNew/lsfz.png">
					<font style="margin: 0 15px 0 5px;">绿色发展</font>
				</div>
				<font class="title">全省2020年目标：国家级绿色工厂<span class="yf50">30</span><span class="yf50" style="font-size: 30px;vertical-align: top;">+</span>家，目前已达到<span class="yf50">13</span>家</font>
				<div class="fr selects">
					<div class="select">
						<p><font id="">2018</font><i class="fa fa-caret-down"></i></p>
						<!-- <div class="select-items">
							<ul id=""></ul>
						</div> -->
					</div>
				</div>
			</div>
		</div> 
	</div>
	<div class="content2 p15 fz0">
		<div class="spanStyle" style="width: 200px;margin-right: 10px">
			<div class="blockStyle" style="height: calc(100% - 10px);">
				<div class="pro-left" style="margin-top:0">
					<ul class="production">
						<li class="first-li " id="">
							<div class="product-type" id="gyjn">工业节能</div>
						</li>
						<li class="first-li" id=""> 
							<div class="product-type" id="lsyq">绿色园区</div>
						</li>
						<li class="first-li on" id=""> 
							<div class="product-type" id="lsgc">绿色工厂</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="spanStyle" style="width: calc(32% - 120px);">
			<div class="blockStyle" style="height:calc(62% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">绿色工厂名单</span>
					</div>
					<div class="tabContBar">
						<div class="orders" style="margin-top:15px;margin-left:10px;">
							<span id="gjj" class="on">国家级(13家)</span>
							<span id="sj">省级(23家)</span>
						</div>
						<div class="tabCont cpjg-table respondControl" id="">
							<div class="table-body">
								<table id="plantNameList1" class="plantNameLists">
								</table>
								<table id="plantNameList2"  class="plantNameLists" style="display: none">
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height:calc(38% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">级别分布情况</span>
					</div>
					<div id="pie" style="width: 100%;height: calc(100% - 40px);"></div>
				</div>
			</div>
		</div>
		<div class="spanStyle" style="width: calc(68% - 110px);">
			<div class="blockStyle" style="height: calc(100% - 10px)">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">各地市分布情况</span>
					</div>
					<div id="echart1" style="height: calc(45% - 10px);margin-bottom: 10px"></div>
					<div class="tabCaptionBar">
						<span class="tabCaption">行业分布情况</span>
					</div>
					<div id="echart2" style="height: calc(45% - 10px)"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/dataCenter/gxwData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/highcharts.js"></script>
<script src="${ctx}/static/js/dataCenter/highcharts-3d.js"></script>
<script type="text/javascript">
	var list1=[
		'江西于都南方万年青水泥有限公司',
		'中国石油化工股份有限公司九江分公司',
		'江西合力泰科技有限公司',
		'江西博雅生物制药有限公司',
		'江西赣锋锂业股份有限公司',
		'赣州市豪鹏科技有限公司',
		'江西恒泰铝材有限公司',
		'巨石集团九江有限公司',
		'江西格林美资源循环有限公司',
		'晶科能源有限公司',
		'江西金利达钾业有限责任公司',
		'崇义章源钨业股份有限公司',
		'江西新威动力能源科技有限公司',
	]
	var list2=[
		'南昌海立电器有限公司',
		'江西晶安高科技股份有限公司',
		'江西宏成铝业有限公司',
		'江中药业股份有限公司',
		'吉安市木林森光电有限公司',
		'江西江特电机有限公司',
		'贵溪鑫发实业有限公司',
		'江西兄弟医药有限公司',
		'虔东稀土集团股份有限公司',
		'汉腾汽车有限公司',
		'江西明正变电设备有限公司',
		'上犹万年青新型材料有限公司',
		'江西江铃底盘股份有限公司',
		'江西煌上煌集团食品股份有限公司',
		'江西昌河汽车有限责任公司',
		'江西博能上饶客车有限公司',
		'江西永丰南方水泥有限公司',
		'中盐江西兰太化工有限公司',
		'江西省江铜台意特种电工材料有限公司',
		'江西省江铜耶兹铜箔有限公司',
		'九江富达实业有限公司',
		'新余钢铁股份有限公司',
		'江西保太有色金属集团有限公司',
	]
	var bardata1=[6,1,0,4,2,2,5,4,6,3,3];
	var bardata2=[6,1,4,4,2,1,2,7,1,8,0,0,0];
	var xdata1=['南昌市','景德镇市','萍乡市','九江市','新余市','鹰潭市','赣州市','吉安市','宜春市','抚州市','上饶市'];
	var xdata2=['电子','钢铁','化工','建材','石化','食品','医药','有色','制药','装备','光伏','航空','锂电'];
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
		$(".orders span").on("click",function(){
			var index=$(this).index()+1;
			$(this).addClass("on").siblings().removeClass("on");
			$(".plantNameLists").fadeOut("fast");
			setTimeout(function(){$("#plantNameList"+index).fadeIn("fast");},400);
			
		})
		getselectYear();
		getTab();
		getPie();
		getchart(1);
		getchart(2);
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
	function getTab(){
		var div1='';
		var div2='';
		
		for(var i=0;i<list1.length;i++){
			div1+='<tr><td><span class="yellowPoint"></span>'+list1[i]+'</td></tr>'
		}
		$("#plantNameList1").append(div1);
		if($("#plantNameList1").height() > $("#demonstrateTable").parent().height()){
			$("#plantNameList1").append(div1);
			$("#plantNameList1").addClass('roll');
			$("#plantNameList1").css("animation-duration",list1.length*2+"s");
		}else{
			$("#plantNameList1").removeClass('roll');
		}

		for(var i=0;i<list2.length;i++){
			div2+='<tr><td><span class="yellowPoint"></span>'+list2[i]+'</td></tr>'
		}
		$("#plantNameList2").append(div2);
		if($("#plantNameList2").height() > $("#demonstrateTable").parent().height()){
			$("#plantNameList2").append(div1);
			$("#plantNameList2").addClass('roll');
			$("#plantNameList2").css("animation-duration",list2.length*2+"s");
		}else{
			$("#plantNameList2").removeClass('roll');
		}
	}
	function getPie(){
		console.log(width)
		var pieSize=120;
		var fz=14;
		if(width<=1660 && width>1440){
			pieSize=70;
		}else if(width<1440){
			pieSize=62;
			fz=12;
		}
		var highchartOptions={
			chart: {
				//renderTo: 'container',    //指定div放置图 
				type: 'pie',    
				backgroundColor: 'rgba(0,0,0,0)', 
				options3d: {
					enabled: true,	//显示图表是否设置为3D， 我们将其设置为 true
					alpha: 50, 		//图表视图旋转角度
					beta: 0,		//图表视图旋转角度
					// depth: 10,         //图表的合计深度，默认为100
					// viewDistance: 125   //定义图表的浏览长度
				},
			},
			title : {
				text:null
			},
			credits: {
				enabled:false
			},
			tooltip : {
				headerFormat:'',
				pointFormat: '<span style="color:{point.color}">\u25CF</span>{point.name}: <b>{point.y}</b>'
			},
			colors:['#FFDA3E','#4069FF'],
			legend: {
				enabled: false,
				width:'100%',
				itemStyle : {
					fontSize:14,
					color:'#03E0C2',
					fontWeight:'normal'
				},
				itemHoverStyle : {
					color:'#03E0C2'
				},
				symbolRadius: 4,
				symbolPadding: 0,
				itemDistance: 10,
				padding: 0,
				margin: 0,
				itemMarginBottom: -10,
			},
			plotOptions : {
				pie: {
					allowPointSelect: false,
					cursor: 'pointer',
					depth: 15, //饼图厚度
					dataLabels: {
						enabled: true,
						cursor: 'pointer',
						format: '{point.name}<br/><b>{point.percentage:.1f}%({point.y})</b>',//'<b>{point.percentage:.1f}%</b>',
						distance: 0,//调整标签圆心得距离
						style:{
							color:'#fff',
							fontSize: fz+"px",
							fontWeight:'normal'
						}
					},
					showInLegend: true
				}
			},  
			series: [{
				type: 'pie',
				name: '占比',
				center: ['50%', '50%'],
				size:pieSize+'%',//饼图大小
				startAngle: 30,//开始角度
				data:[{'name':'国家级',y:13,"sliced":'true',"selected":'true'},{'name':'省级',y:23,"sliced":'true',"selected":'true'}]
			}]
		};
		$("#pie").highcharts(highchartOptions);
	}
	function getchart(type){
		var bardata=[];
		var color1='',color2='';
		var x='';
		if(type==1){
			var bardata=bardata1;
			color1='#FFD154',color2='#FF903E';
			x=xdata1;
		}else{
			var bardata=bardata2;
			color1='#67F8B3',color2='#05A6FC';
			x=xdata2;
		}
		var chart1 = echarts.init(document.getElementById("echart"+type));
			var option1 = {
				tooltip: {
						trigger: "axis", //触发为坐标轴内
						axisPointer: {
							type: "shadow",
							label: {
								show: false
							},
							crossStyle: {
								color: "#384757"
							}
						}
				},
				legend: {
					show:false
				},
				grid: {
						left: '50',
						right: '40',
						top:'36',
						bottom:'22'
				},
				xAxis: [{
						type: 'category',
						data: x,
						splitLine: { //显示分割线 
							show: false
						},
						axisLabel: {
							color: '#83ADBA'
						},
						axisLine: {
							lineStyle: {
								color: 'rgba(238,238,238,0.2)'
							}
						},
						axisTick: {
							show: false
						},
						"splitLine": {
							"show": false
						},
						"axisTick": {
							"show": false
						},
						"splitArea": {
							"show": false
						},
						axisPointer: {
							type: 'shadow',
						}
				}],
				yAxis: [{
					type: 'value',
					splitLine: {
						show: true,
						lineStyle: {
							type: 'solid',
							color: 'rgba(238,238,238,0.2)'
						}
					},
					axisLabel: {
						color: '#83ADBA'
					},
					axisLine: {
						lineStyle: {
							color: 'rgba(238,238,238,0.2)'
						}
					},
					axisTick: {
						show: false
					},
					
				}],
				series: [{
					name: '',
					type: 'bar',
					barMaxWidth:'30%',
					label: {
						normal: {
							show: true,
							position: 'top',
							color:'#fff'
						}
					},
					itemStyle: {
						normal: {
							color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
								offset: 0,
								color: color1
							},{
								offset: 1,
								color: color2
							}]),
						}
					},
					data: bardata
				}],
			};
			chart1.setOption(option1);
	}
</script>
</html>