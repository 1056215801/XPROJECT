<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>吉安智慧园区大数据决策平台</title>
<link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<style>
.demo-class {
    background-color: transparent;
    text-align: center;
}
</style>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
    <div class="content fz0" id="content">
    	<div class="spanStyle" style="width: 25%;">
    		<div class="blockStyle" style="height: calc(50% - 10px);">
				<div class="spanStyle">
					<div class="outsideBox">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
						<div class="tabCaptionBar">
							<span class="tabCaption">园区概况</span>
						</div>
						<div class="tabTitleBar">
							<div class="yqgk">
								<div class="title-bar">吉安国家高新技术产业开发区</div>
								<div class="circle-box">
									<div class="circle-item">
										<div class="dib tac">
											<img src="${ctx}/static/image/cityDataCenter/jian/circle.png">
											<div class="circle-infor">
												<h2><b id="ghmj1"></b><em id="ghmj2"></em></h2>
												<p>(平方公里)</p>
											</div>
											<p class="circle-name">规划面积</p>
										</div>
									</div>
									<div class="circle-item tac">
										<div class="dib tac">
											<img src="${ctx}/static/image/cityDataCenter/jian/circle.png">
											<div class="circle-infor">
												<h2><b id="qyzs"></b></h2>
												<p>(户)</p>
											</div>
											<p class="circle-name">企业总数</p>
										</div>
									</div>
									<div class="circle-item tar">
										<div class="dib tac">
											<img src="${ctx}/static/image/cityDataCenter/jian/circle.png">
											<div class="circle-infor">
												<h2><b id="zczj1">100</b><em id="zczj2"></em></h2>
												<p>(亿元)</p>
											</div>
											<p class="circle-name">资产总计</p>
										</div>
									</div>
									<div class="circle-item">
										<div class="dib tac">
											<img src="${ctx}/static/image/cityDataCenter/jian/circle.png">
											<div class="circle-infor">
												<h2><b id="xscz1">100</b><em id="xscz2"></em></h2>
												<p>(亿元)</p>
											</div>
											<p class="circle-name">工业销售产值</p>
										</div>
									</div>
									<div class="circle-item tac">
										<div class="dib tac">
											<img src="${ctx}/static/image/cityDataCenter/jian/circle.png">
											<div class="circle-infor">
												<h2><b id="zyywsr1">100</b><em id="zyywsr2"></em></h2>
												<p>(亿元)</p>
											</div>
											<p class="circle-name">主营业务收入</p>
										</div>
									</div>
									<div class="circle-item tar">
										<div class="dib tac">
											<img src="${ctx}/static/image/cityDataCenter/jian/circle.png">
											<div class="circle-infor">
												<h2><b id="lr1">100</b><em id="lr2"></em></h2>
												<p>(亿元)</p>
											</div>
											<p class="circle-name">利润总额</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
            </div>
    		<div class="blockStyle" style="height: calc(50% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">产业主营收入（单位：亿元）</span>
					</div>
					<div id="income" class="tabTitleBar"></div>
				</div>
    		</div>
        </div>
        <div class="spanStyle" style="width: calc(50% - 10px);">
    		<div class="blockStyle" style="height: calc(75% - 10px);">
    			<div class="blockStyle" style="height: calc(70% - 10px);">
					<div class="outsideBox videoBar">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
						<video id="video" src="${ctx}/static/image/cityDataCenter/jian/video.mp4" 
						poster="${ctx}/static/image/cityDataCenter/jian/video.png" 
						height="100%" width="100%" controls="controls"></video>
						<div class="videoIcoBg" style="display: block;">
							<img class="videoIco2" alt="" src="${ctx}/static/image/cityDataCenter/jian/video.png">
							<img class="videoIco" alt="" src="${ctx}/static/image/cityDataCenter/jian/play.png">
						</div>
					</div>
				</div>
    			<div class="blockStyle" style="height: calc(30% - 10px);">
					<div class="outsideBox">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
						<div class="introduction">
							<p class="introductionText" id="introductionText" onclick="getMoreDetail()"></p>
						</div>
					</div>
				</div>
            </div>
			<div class="blockStyle" style="height: calc(25% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
					<div class="tabCont index-swiper">
						<div class="swiper-container" id="indexSwiper">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<img src="${ctx}/static/image/cityDataCenter/jian/video.png">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
        </div>
    	<div class="spanStyle" style="width: calc(25% - 10px);">
    		<div class="blockStyle" style="height: calc(50% - 10px);">
				<div class="spanStyle">
					<div class="outsideBox">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
						<div class="tabCaptionBar">
							<span class="tabCaption">企业统计</span>
						</div>
						<div id="business-statistics" class="tabTitleBar"></div>
					</div>
				</div>
            </div>
    		<div class="blockStyle" style="height: calc(50% - 10px);">
				<div class="spanStyle">
					<div class="outsideBox">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
						<div class="tabCaptionBar">
							<span class="tabCaption">企业分布（单位：户）</span>
						</div>
						<div id="distribute" class="tabTitleBar"></div>
						
					</div>
				</div>
    		</div>
        </div>
	</div>
	<div id="Moredetail" class="infoBox"></div>
	<div id="largeImage" class="imageBox"><img src="http://rh.inpark.com.cn:8888/resources/2019/08/06/90020190806094051980002000000404.jpg"></div>
</body>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script type="text/javascript">
var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	$(function () {
		$(".head .tab>a:eq(0)").addClass("on");
		getIncomeData();
		getDetailParkData();
		getBusinessStatistics();
		getenterData();
		videPlay();
		getParkImage();
	});
	//园区介绍
	function videPlay(){
		$(".videoBar .videoIco").on('click',function(){
			$(this).parent().css({"display":"none"});
			$("#video")[0].play();
		})
	};
	function getParkImage(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/organizationImage/list",
			type : "get",
		 	async: false,
			data : {
				"organizationId": '1245',
			},
			dataType : "json",
			success : function(result){
				if(result.success){
					var _div=''
					for(var i=0;i<result.list.length;i++){
						_div += '<div class="swiper-slide" onclick="openImg(\''+result.list[i].imageUrl+'\')">'
						_div += '<img src="'+result.list[i].imageUrl+'">'
						_div += '</div>'
					}
					$("#indexSwiper .swiper-wrapper").html(_div)
					// 上面的轮播图
					var mySwiper = new Swiper('#indexSwiper', {
						autoplay: true,//可选选项，自动滑动
						slidesPerView : 3,
						slidesPerGroup : 1,
						spaceBetween : 15
					})
				}
			},
			error : function(e) {
				alert(e)
			}
		});	
	}
	function openImg(img) {
		$('#largeImage img').attr('src', img)
		closeLayer()
		layer.open({
			type: 1,
			title: false,
		  	skin: 'demo-class',
			area: '60%',
			offset: 'auto',
			closeBtn: 0,
			shadeClose: true,
			content: $('#largeImage')
		});
	}
	function getDetailParkData(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/parkIndicator/detailParkData",
			type : "get",
		 	async: false,
			data : {
				"parkId": '1245',
			},
			dataType : "json",
			success : function(result){
				if(result.success){
					var _div=''
					// _div+=result.dateBean.parkDescription.replace(/<[^>]+>/g,"");
					_div+=result.dateBean.parkDescription;
					$("#introductionText").html(_div);
					$('#Moredetail').append(_div)
					var data = result.dateBean;
					data.landSquare ? $("#ghmj1").text(data.landSquare.split(".")[0]) : $("#ghmj1").text(0);
					data.landSquare&&data.landSquare.split(".")[1] ? $("#ghmj2").text("."+data.landSquare.split(".")[1]) : "";
					// data.companyTotal ? $("#qyzs").text(data.companyTotal) : $("#qyzs").text(0);
					$("#qyzs").text('268')
				}
			},
			error : function(e) {
				alert(e)
			}
		});	
	};
	//弹窗
	function getMoreDetail(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/parkIndicator/detailParkData",
			type : "get",
		 	async: false,
			data : {
				"parkId": '1245',
			},
			dataType : "json",
			success : function(result){
				if(result.success){
					var _div=''
					_div+='<div><h2>吉安国家高新技术开发区简介</h2>'
						+ '<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">'
						+'<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">'
						+'<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">'
						+'<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">'
					_div+=result.dateBean.parkDescription;
					_div+='</div>'
					$('#Moredetail').html(_div);
					closeLayer()
					layer.open({
						type: 1,
						area: '900px',
						offset: '146px',
						title: false,
						closeBtn: 0,
						content: $('#Moredetail')
					});
					
					//添加自定义关闭按钮
					var $div = '<img src=\"${ctx}/static/image/cityDataCenter/close.png\" width=\"30\" class=\"closeBtn\" onclick="closeLayer()">';
					$('.layui-layer').prepend($div); //将新创建的div节点插入到nav容器的内容顶部
				}
			},
			error : function(e) {
				alert(e)
			}
		});	
	}
	function closeLayer(){
		layer.closeAll();
	}
	//产业主营收入
	function getIncomeData(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/parkIndicator/industrialData",
			type : "get",
		 	async: false,
			data : {
				"organizationId": '1245',
				"yearCaliber":'2018'
			},
			dataType : "json",
			success : function(result){
				if(result.success){
					var total='';
					var data=[];
					for(var i = result.json.zyywsr.length-1;i>0;i--){
						if(result.json.zyywsr[i]!= null && result.json.zyywsr[i]!= undefined && result.json.zyywsr[i]!= ''){
							total=result.json.zyywsr[i];
							$("#zyywsr1").text(result.json.zyywsr[i].toString().split(".")[0]);
							$("#zyywsr2").text("."+result.json.zyywsr[i].toString().split(".")[1]);
							break;
						}
					}
					for(var i = result.json.zczj.length-1;i>0;i--){
						if(result.json.zczj[i]!= null && result.json.zczj[i]!= undefined && result.json.zczj[i]!= ''){
							$("#zczj1").text(result.json.zczj[i].toString().split(".")[0]);
							$("#zczj2").text("."+result.json.zczj[i].toString().split(".")[1]);
							break;
						}
					}
					for(var i = result.json.gyxscz.length-1;i>0;i--){
						if(result.json.gyxscz[i]!= null && result.json.gyxscz[i]!= undefined && result.json.gyxscz[i]!= ''){
							$("#xscz1").text(result.json.gyxscz[i].toString().split(".")[0]);
							$("#xscz2").text("."+result.json.gyxscz[i].toString().split(".")[1]);
							break;
						}
					}
					for(var i = result.json.lr.length-1;i>0;i--){
						if(result.json.lr[i]!= null && result.json.lr[i]!= undefined && result.json.lr[i]!= ''){
							$("#lr1").text(result.json.lr[i].toString().split(".")[0]);
							$("#lr2").text("."+result.json.lr[i].toString().split(".")[1]);
							break;
						}
					}
					// console.log(total);
					if(total !=''){
						/* data = [
							{value:(total*0.16).toFixed(2),name:'大健康食品产业'},
							{value:(total*0.06).toFixed(2),name:'新能源新材料'},
							{value:(total*0.04).toFixed(2),name:'智能制造'},
							{value:(total*0.04).toFixed(2),name:'其他产业'},
							{value:(total*0.7).toFixed(2),name:'电子信息产业'},
						]; */
						data = [
							{value: 71.3,name:'大健康食品产业'},
							{value: 25.49,name:'新能源新材料'},
							{value: 61.31,name:'其他产业'},
							{value: 265.8,name:'电子信息产业'}
						];
						var myChart = echarts.init(document.getElementById('income'));
						var fz=16;
						var length1=10;
						var length2=15;
						var radius1='60%';
						var radius2='70%';
						if(width<=1600){
							fz=14;
							radius1='50%';
							radius2='60%';
						}
						if(width<=1440){
							// fz=12
							radius1='45%';
							radius2='55%';
							length1=7;
							length2=10;
						}
						option = {
							backgroundColor:'rgba(0, 0, 0, 0)',
							color: ["#EAEA26", "#906BF9", "#FE5656", "#01E17E", "#3DD1F9", "#FFAD05"],
							grid: {
								left: -100,
								top: 50,
								bottom: 10,
								right: 10,
								containLabel: true
							},
							tooltip: {
								trigger: 'item',
								formatter: "{b} : {c} ({d}%)"
							},
							polar: {},
							angleAxis: {
								interval: 1,
								type: 'category',
								data: [],
								z: 10,
								color: 'rgba(0, 0, 0, 0)',
								axisLine: {
									show: false,
									lineStyle: {
										color: 'rgba(0, 0, 0, 0)',
										width: 1,
										type: "solid"
									},
								},
								axisLabel: {
									interval: 0,
									show: true,
									color: 'rgba(0, 0, 0, 0)',
									margin: 8,
									fontSize: 16
								},
							},
							radiusAxis: {
								min: 40,
								max: 120,
								interval: 20,
								axisLine: {
									show: false,
									lineStyle: {
										color: 'rgba(0, 0, 0, 0)',
										width: 1,
										type: "solid"
									},
								},
								axisLabel: {
									formatter: '{value} %',
									show: false,
									padding: [0, 0, 20, 0],
									color: "#0B3E5E",
									fontSize: 16
								},
								splitLine: {
									lineStyle: {
										color: 'rgba(0, 0, 0, 0)',
										width: 2,
										type: "solid"
									}
								}
							},
							calculable: true,
							series: [{
								type: 'pie',
								radius: ["10%", radius1],
								hoverAnimation: false,
								zlevel:5,
								labelLine: {
									normal: {
										show: false,
										length: 30,
										length2: 55
									},
									emphasis: {
										show: false
									}
								},
								data: [{
									name: '',
									value: 0,
									itemStyle: {
										normal: {
											color: "#2C77DEFF",
											opacity:0.2,
										}
									}
								}]
							}, {
								type: 'pie',
								radius: ["10%", radius2],
								hoverAnimation: false,
								labelLine: {
									normal: {
										show: false,
										length: 30,
										length2: 55
									},
									emphasis: {
										show: false
									}
								},
								name: "",
								data: [{
									name: '',
									value: 0,
									itemStyle: {
										normal: {
											color: "#2C77DEFF",
											opacity:0.2,
										}
									}
								}]
							},{
								stack: 'a',
								type: 'pie',
								radius: ['10%', radius1],
								roseType: 'area',
								zlevel:10,
								label: {
									normal: {
									show: true,
									formatter:'{a|{b}} \n{e|{c} ({d}%)}',
										rich: {
											a: {
												color: 'rgba(255,255,255,1)',
												fontSize: fz,
											},
											e: {
												color: '#00DEFFFF',
												fontSize: fz,
											}, 
										},
										position: 'outside'
									},
									emphasis: {
										show: true
									}
								},
								labelLine: {
									normal: {
										show: true,
										length: length1,
										length2: length2
									},
									emphasis: {
										show: false
									}
								},
								data: data
							}, ]
						}
						myChart.setOption(option);
					}else{
						$("#income").html("<font class=\"unPublish\">未公布</font>");
					}
					
					
				}
			},
			error : function(e) {
				alert(e)
			}
		});
	}
	//企业统计
	function getBusinessStatistics(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/parkIndicator/businessStatistics",
			type : "get",
		 	async: false,
			data : {
				"parkId": '1245',
			},
			dataType : "json",
			success : function(result){
				if(result.success){
					// console.log(result);
					if(result.map!='' &&result.map!=null && result.map!=undefined ){
						var map=result.map;
						var data=[];
						var total=map.companyTotal
						var myChart = echarts.init(document.getElementById('business-statistics'));
						if(map.standardTotal!='' && map.standardTotal!=null && map.standardTotal!=undefined ){
							data.push({
								name: "规上企业",
								value: map.standardTotal
							})
						}else if(map.standardTotal==0){
							data.push({
								name: "规上企业",
								value: 0
							})
						}
						if(map.state1Total!='' && map.state1Total!=null && map.state1Total!=undefined ){
							data.push({
								name: "在建企业",
								value: map.state1Total
							})
						}else if(map.state1Total==0){
							data.push({
								name: "在建企业",
								value: 0
							})
						}
						if(map.state2Total!='' && map.state2Total!=null && map.state2Total!=undefined ){
							data.push({
								name: "投产企业",
								value: map.state2Total
							})
						}else if(map.state2Total==0){
							data.push({
								name: "投产企业",
								value: 0
							})
						}
						if(map.quotedTotal!='' && map.quotedTotal!=null && map.quotedTotal!=undefined ){
							data.push({
								name: "上市企业",
								value: map.quotedTotal
							})
						}else if(map.quotedTotal==0){
							data.push({
								name: "上市企业",
								value: 0
							})
						}
						total = 268
						data = [ // 写死数据
							{ name: '规上企业', value: 117 },
							{ name: '在建企业', value: 27 },
							{ name: '投产企业', value: 139 },
							{ name: '上市企业', value: 12 }
						]
						arrName = getArrayValue(data, "name");
						arrValue = getArrayValue(data, "value");
						sumValue = eval(arrValue.join('+'));
						objData = array2obj(data, "name");
						optionData = getData(data);
						option = {
							backgroundColor:'rgba(0,0,0,0)',
							title: {
								text: '企业总数',
								x: 'center',
								y: '30%',
								subtext:total+'{a|户}',
								subtextStyle: {
									color: '#20FDFAFF',
									fontSize: 40,
									rich:{
										a:{
											color:'000',
											fontSize:15,
										}
									}
								},
								textStyle: {
									fontWeight: 'normal',
									fontSize: 18,
									color: "#fff",
									
								},
								
							},
							legend: {
								show: true,
								orient: 'horizontal',
							// icon: 'circle',\
								bottom:'10',
								itemWidth:13,
								data: arrName,
								itemHeight: 13,
							//width:16,
							// padding: [0, 5],
								itemGap:15,
								formatter: function(name) {
									return "{title|" + name + "  }   {value|" + (objData[name].value) + "户    }   "
								},
								textStyle: {
									rich: {
										title: {
											fontSize: 16,
											lineHeight: 16,
											color: "rgba(255,255,255,1)"
										},
										value: {
											fontSize: 16,
											lineHeight: 16,
											color: "#00DEFFFF"
										}
									}
								},
							},
							tooltip: {
								show: true,
								trigger: "item",
								formatter: "{b}:{c}({d}%)"
							},
							color: ['#0E6DE9FF', '#00AF6DFF', '#E6AF08FF', '#AC4ED3FF'],
							grid: {
								top: '20%',
								bottom: '48%',
								left: "30%",
								containLabel: false
							},
							yAxis: [{
								type: 'category',
								inverse: true,
								axisLine: {
									show: false
								},
								axisTick: {
									show: false
								},
								axisLabel: {
									interval: 0,
									inside: true,
									textStyle: {
										color: "#000",
										fontSize: 10,
									},
									show: false
								},
								data: optionData.yAxis
							}],
							xAxis: [{
								show: false
							}],
							series: optionData.series
						};
						myChart.setOption(option);
					}else{
						$("#business-statistics").html("<font class=\"unPublish\">未公布</font>");
					}
				}
			},
			error : function(e) {
				alert(e)
			}
		});	
		
	}
	function getArrayValue(array, key) {
		var key = key || "value";
		var res = [];
		if (array) {
			array.forEach(function(t) {
				res.push(t[key]);
			});
		}
		return res;
		}

		function array2obj(array,key) {
		var resObj = {};
		for(var i=0;i<array.length;i++){
			resObj[array[i][key]] = array[i];
		}
		return resObj;
	}
	function getData(data) {
		var res = {
			series: [],
			yAxis: []
		};
		for (let i = 0; i < data.length; i++) {
			res.series.push({
				name: '',
				type: 'pie',
				clockWise: false, //顺时加载
				hoverAnimation: false, //鼠标移入变大
				radius: [65 - i * 6 + '%', 68 - i * 6 + '%'],
				center: ["50%", "40%"],
				label: {
					show: false
				},
				itemStyle: {
					label: {
						show: false,
					},
					labelLine: {
						show: false
					},
					borderWidth: 5,
				},
				data: [{
					value: data[i].value,
					name: data[i].name
				}, {
					value: sumValue - data[i].value,
					name: '',
					itemStyle: {
						color: "rgba(0,0,0,0)",
						borderWidth: 0
					},
					tooltip: {
						show: false
					},
					hoverAnimation: false
				}]
			});
			res.series.push({
				name: '',
				type: 'pie',
				silent: true,
				z: 1,
				clockWise: false, //顺时加载
				hoverAnimation: false, //鼠标移入变大
				radius: [65 - i * 6 + '%', 68 - i * 6 + '%'],
				center: ["50%", "40%"],
				label: {
					show: false
				},
				itemStyle: {
					label: {
						show: false,
					},
					labelLine: {
						show: false
					},
					borderWidth: 5,
				},
				data: [{
					value: 7.5,
					itemStyle: {
						color: '#004ad8FF',
						opacity:0.2,
						borderWidth: 0
					},
					tooltip: {
						show: false
					},
					hoverAnimation: false
				}]
			});
			res.yAxis.push((data[i].value / sumValue * 100).toFixed(2) + "%");
		}
		return res;
	}
	//企业发布
	function getenterData(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/parkIndicator/enterpriseDistribution",
			type : "get",
		 	async: false,
			data : {
				"parkId": '1245',
			},
			dataType : "json",
			success : function(result){
				if(result.success){
					console.log(result.array);
					if(result.array!='' && result.array!=null && result.array!=undefined){
						var data = result.array
						data = [
							{value: 32,name:'大健康食品'},
							{value: 7,name:'新能源新材料'},
							{value: 56,name:'其他产业'},
							{value: 15,name:'文化'},
							{value: 158,name:'电子信息'}
						]
						var fz=16;
						var radius1='30%';
						var radius2='50%';
						if(width<=1600){
							fz=14;
							// radius1='30%';
							// radius2='50%';
						}
						if(width<=1440){
							// fz=12
							// radius1='30%';
							// radius2='50%';
						}
						var myChart = echarts.init(document.getElementById('distribute'));
						var colorList= ['#fb734e', '#e32f46','#94d96c', '#0bbcb7','#1a9bfc','#7049f0'];
						option = {
								title : {
								},
								tooltip : {
									trigger: 'item',
									formatter: '{a} <br/>\n{b} : {c} ({d}%)'
								},

								series : [
									{
										radius: [radius1, radius2],
										name: '企业分布',
										type: 'pie',
										center: ['50%', '50%'],
										label:{
											show:true,
											formatter:'{a|{b}} \n{e|{c} ({d}%)}',
											rich: {
												a: {
													color: 'rgba(255,255,255,1)',
													fontSize: fz,
												},
												e: {
													color: '#00DEFFFF',
													fontSize: fz,
												},
											
											}
										},
										color: ['#E73F60FF', '#9600E2FF','#F2B71DFF', '#65C233FF', '#49A1FEFF', '#00ffb4'],
										data:data,
										itemStyle: {
											emphasis: {
												shadowBlur: 10,
												shadowOffsetX: 0,
												shadowColor: 'rgba(0, 0, 0, 0.5)'
											}
										}
									}
								]
							};
						myChart.setOption(option);
					}else{
						$("#distribute").html("<font class=\"unPublish\">未公布</font>");
					}
				}
			},
			error : function(e) {
				alert(e)
			}
		});	
	}
</script>
</html>
