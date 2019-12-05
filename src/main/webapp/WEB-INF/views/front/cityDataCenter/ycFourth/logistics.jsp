<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${ctx}/static/css/cityDataCenter/lowindy.min.css" rel="stylesheet">
<link href="${ctx}/static/css/cityDataCenter/fourthSite.css" rel="stylesheet">
<title>宜春工业大数据工业物流</title>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="content fz0">
		<div class="pro-left">
			<ul class="production">
				<li class="first-li on" val1="6" val2="index4_code2" val3="物流服务">
					<div class="product-type" >物流服务</div>
				</li>
				<li class="first-li" val1="18" val2="index4_code3" val3="用工分析">
					<div class="product-type">用工分析</div>
				</li>
				<li class="first-li" val1="10" val2="index4_code4" val3="企业帮扶"> 
					<div class="product-type">企业帮扶</div>
				</li>
				<li class="first-li" val1=""> 
					<div class="product-type">标准厂房</div>
				</li>
			</ul>
		</div>
		<div class="pro-right">
			<div class="" style="height: calc(100% - 10px); margin-top: 10px;">
				<div class="spanStyle" style="width: 25%;">
					<div class="blockStyle" style="height: 33.33%;">
						<div class="outsideBox">
							<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar">
								<span class="tabCaption">实时数据中心</span>
							</div>
							<div class="tabContBar rt">
								<div class="grid-content grid-content1">
									<p>用户数量(人)</p>
									<h2 id="membersCount"></h2>
								</div>
								<div class="grid-content grid-content2">
									<p>平台车辆(辆)</p>
									<h2 id="carsCount"></h2>
								</div>
								<div class="grid-content grid-content3">
									<p>订单交易量(单)</p>
									<h2 id="ordersCount"></h2>
								</div>
								<div class="grid-content grid-content4">
									<p>订单交易额(万元)</p>
									<h2 id="ordersAmountCount"></h2>
								</div>
							</div>
						</div>
					</div>
					<div class="blockStyle" style="height: calc(33.33% - 10px);">
						<div class="outsideBox">
							<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar">
								<span class="tabCaption">订单日交易额</span>
							</div>
							<div class="tabContBar">
								<div id="truckOrder" class="logis-chart"></div>
							</div>
						</div>
					</div>
					<div class="blockStyle" style="height: calc(33.33% - 10px);">
						<div class="outsideBox">
							<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar">
								<span class="tabCaption">最近交易订单</span>
							</div>
							<div class="tabContBar">
								<div class="h-20"></div>
								<div id="ordertable" class="table">
									<li class="tit">
									    <p>承运人</p>
									    <p>交易金额</p>
									    <p>交易时间</p>
									</li>
									<div class="list_lh">
										<ul id="orders"></ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="spanStyle" style="width: calc(50% - 10px);">
					<div class="blockStyle" style="height: 100%;">
						<div class="outsideBox" style="padding: 0;">
							<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="mapmenu flex-1 flex-r-a flex-r-j">
								<a href="javascript:;" id="showGoodsMap" class="goodsMapMenu on">货源分布</a>
								<!-- <a href="javascript:;" id="showCarsMap" class="carsMapMenu">车源分布</a> --> 
							</div>
							<div class="mainmap">
								<div id="goodsMap" class="mainmapbox goodsMapBox" style="height: 100%;"></div>
								<div id="carsMap" class="mainmapbox carsMapBox" style="height: 100%;"></div>
							</div>
							<div class="cityGoodsLine flex-r-a flex-r-j">
								<a href="javascript:;" id="jaLine" class="on"><span class="formattercirle"></span>宜春发货</a>
								<a href="javascript:;" id="gzLine"><span class="formattercirle"></span>宜春收货</a>
							</div>
						</div>
					</div>
				</div>
				<div class="spanStyle" style="width: calc(25% - 10px);">
					<div class="blockStyle" style="height: 33.33%;">
						<div class="outsideBox">
							<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar">
								<span class="tabCaption">货物类型</span>
							</div>
							<div class="tabContBar">
								<div id="carTop" class="logis-chart"></div>
							</div>
						</div>
					</div>
					<div class="blockStyle" style="height: calc(33.33% - 10px);">
						<div class="outsideBox">
							<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar">
								<span class="tabCaption">出车次数</span>
							</div>
							<div class="tabContBar">
								<div id="carStatus" class="logis-chart"></div>
							</div>
						</div>
					</div>
					<div class="blockStyle" style="height: calc(33.33% - 10px);">
						<div class="outsideBox">
							<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar">
								<span class="tabCaption">车型比例</span>
							</div>
							<div class="tabContBar">
								<div id="carsType" class="logis-chart"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/underscore.js/1.8.3/underscore-min.js"></script>
<script src="https://cdn.bootcss.com/echarts/4.1.0.rc2/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/map/china.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script type="text/javascript">
var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;

  //实时时间
  	$(function () {
	  	$("#showGoodsMap").click(function () {
		    $('.goodsMapMenu').addClass('on')
		    $('.carsMapMenu').removeClass('on')
		    $('.goodsMapBox, .cityGoodsLine').show()
		    // $('.carsMapBox').hide()
		});
		$("#showCarsMap").click(function () {
		    $('.carsMapMenu').addClass('on')
		    $('.goodsMapMenu').removeClass('on')
		    $('.carsMapBox').show()
		    $('.goodsMapBox, .cityGoodsLine').hide()
		});
	  	$(".head>a:eq(4)").addClass("on");
	 	//左侧菜单栏点击事件
		$(".first-li").on("click",function(){
			var v1 = $(this).attr("val1");
			var v2 = $(this).attr("val2");
			var v3 = $(this).attr("val3");
			if(v1!=''){
				checkRight(v1,'',v2,v3);
			} else { alert("建设中!")}
		});
	    setInterval(getTotelNumber, 1000)
		//右上角时间控制器
	    function getTotelNumber() {
	      var date = new Date()
	      this.year = date.getFullYear()
	      this.month = date.getMonth() + 1
	      this.date = date.getDate()
	      var week = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六']
	      this.day = week[date.getDay()]
	      this.hour = date.getHours() < 10 ? '0' + date.getHours() : date.getHours()
	      this.minute = date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()
	      this.second = date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds()
	      var nowtime = this.year + '年' + this.month + '月' + this.date + '日 ' + this.day + ' ' + this.hour + ':' +
	        this.minute + ':' + this.second
	      $('#time').text(nowtime);
	    }
	    getTotelNumber();
	    getData();
	});

    var carTop = echarts.init(document.getElementById('carTop'));
	var carTopCount = 0;
	var carTopOption = {};
	var goodsMap = echarts.init(document.getElementById('goodsMap'));
	var goodsMapOptions = {};
	var truckOrder = echarts.init(document.getElementById('truckOrder'));
	var truckOrderOption = {};
	var truckOrderdataZoom = {};
	var carStatus = echarts.init(document.getElementById('carStatus'));
	var carStatusCount = 0;
	var carsType = echarts.init(document.getElementById('carsType'));
	var carsTypeCount = 0;
	var carsTypeoption = {};

  	function getData() {
		var param = {
			orgId: '360900'
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/xzLogistics/logisticsData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				var d = result.data;
				countdown(d.data1.peopleNum,d.data1.carNum,d.data1.tradeNum,d.data1.turnoverNum);
				//日交易额
				truckData = d.data2;
				CreateOrderDayView();
				//最近交易订单
		      	CreateTableScroll(d.data3);
				//货物类型
		        CarTop = d.data4.series;
		        CreateCarTop();
		        carTopAnimation();
				//出车次数
		        CarWorkState = d.data5;
		        CreateCarState();
		        carStatusAnimation();
				//车型比例
		        PlatCarType = d.data6.series;
		        CreateCarType();
		        carsTypeAnimation();
			    //初始化地图
			    mData = d.data7;
			    CreateGoodsDstribution(1);
			}
		})
  }

    // 定时器
    setInterval(function () {
      refreshData();
    }, 5000);

  function refreshData() {
    truckOrderAnimation();
    carTopAnimation();
    carStatusAnimation();
    carsTypeAnimation();
  }
  	setTimeout(function () {
	    //初始化滚动器
	    $('div.list_lh').myScroll({
	      speed: 40,
	      rowHeight: 26
	    })
	}, 500);


  // 翻牌器
  function countdown(members, cars, orderCounter, orderTradAmount) {
    $("#membersCount").rollNum({
      deVal: members,
      digit: members.toString().length
    });
    $("#carsCount").rollNum({
      deVal: cars,
      digit: cars.toString().length
    });
    $("#ordersCount").rollNum({
      deVal: orderCounter,
      digit: orderCounter.toString().length
    });
    $("#ordersAmountCount").rollNum({
      deVal: orderTradAmount,
      digit: orderTradAmount.toString().length
    });
  }
  // 货源分布
  function CreateGoodsDstribution(type) {
	  var geoCoordMap = {
			  '湘潭县' : [112.952829,27.778601],
			  '菏泽市曹县' : [115.549482,34.823253],
			  '湖南常德' : [111.691347,29.040225],
			  '寻乌县' : [115.651399,24.954136],
			  '江苏常州钟楼区' : [119.948388,31.78096],
			  '上海市区' : [121.472644,31.231706],
			  '河南驻马店' : [114.024736,32.980169],
			  '江苏盐城' : [120.139998,33.377631],
			  '崇仁县' : [116.059109,27.760907],
			  '福建漳州' : [117.661801,24.510897],
			  '安徽蚌埠' : [117.363228,32.939667],
			  '广东广州白云区' : [113.262831,23.162281],
			  '吉林四平铁东区' : [124.388464,43.16726],
			  '英德市' : [113.405404,24.18612],
			  '南安市' : [118.387031,24.959494],
			  '湘乡市' : [112.525217,27.734918],
			  '广东深圳龙岗区' : [114.251372,22.721511],
			  '广西梧州' : [111.297604,23.474803],
			  '广东佛山' : [113.122717,23.028762],
			  '普宁市' : [116.165082,23.29788],
			  '大田县' : [117.849355,25.690803],
			  '三亚市' : [109.508268,18.247872],
			  '义乌市' : [120.074911,29.306863],
			  '庐江县' : [117.289844,31.251488],
			  '广东佛山' : [113.122717,23.028762],
			  '南昌县' : [115.942465,28.543781],
			  '广东东莞' : [113.746262,23.046237],
			  '兰溪市' : [119.460521,29.210065],
			  '江西南昌' : [115.892151,28.676493],
			  '高县' : [104.519187,28.435676],
			  '湖南株洲' : [113.151737,27.835806],
			  '广东东莞' : [113.746262,23.046237],
			  '南昌县' : [115.942465,28.543781],
			  '湖南常德' : [111.691347,29.040225],
			  '安徽芜湖' : [118.376451,31.326319],
			  '晋江市' : [118.577338,24.807322],
			  '监利县' : [112.904344,29.820079],
			  
			  '湖南怀化' : [109.97824,27.550082],
			  '江西南昌' : [115.892151,28.676493],
			  '晋江市' : [118.577338,24.807322],
			  '南昌县' : [115.942465,28.543781],
			  '湖南益阳资阳区' : [112.33084,28.592771],
			  '湖南益阳' : [112.355042,28.570066],
			  '芦溪县' : [114.041206,27.633633],
			  '赣州市南康区' : [114.756933,25.661721],
			  '寻乌县' : [115.651399,24.954136],
			  '佛山市顺德区' : [113.281826,22.75851],
			  '南昌市湾里区' : [115.731324,28.714803],
			  '龙南县' : [114.792657,24.90476],
			  '寻乌县' : [115.651399,24.954136],
			  '都昌县' : [116.205114,29.275105],
			  '景德镇珠山区' : [117.214814,29.292812],
			  '南昌市湾里区' : [115.731324,28.714803],
			  '广东广州' : [113.280637,23.125178],
			  '芦溪县' : [114.041206,27.633633],
			  '江西赣州' : [114.940278,25.85097],
			  '湖南湘潭' : [112.944052,27.82973],
			  '吉安县' : [114.905117,27.040042],
			  
			  '宜春': [114.400262,27.811053]
	};

	var BJData = [
		[{name:'宜春'},{name:'湘潭县',value:1}],
		[{name:'宜春'},{name:'菏泽市曹县',value:14}],
		[{name:'宜春'},{name:'湖南常德',value:12}],
		[{name:'宜春'},{name:'寻乌县',value:1}],
		[{name:'宜春'},{name:'江苏常州钟楼区',value:13}],
		[{name:'宜春'},{name:'上海市区',value:1}],
		[{name:'宜春'},{name:'河南驻马店',value:1}],
		[{name:'宜春'},{name:'江苏盐城',value:2}],
		[{name:'宜春'},{name:'崇仁县',value:1}],
		[{name:'宜春'},{name:'福建漳州',value:39}],
		[{name:'宜春'},{name:'安徽蚌埠',value:4}],
		[{name:'宜春'},{name:'广东广州白云区',value:4}],
		[{name:'宜春'},{name:'吉林四平铁东区',value:1}],
		[{name:'宜春'},{name:'英德市',value:1}],
		[{name:'宜春'},{name:'南安市',value:1}],
		[{name:'宜春'},{name:'湘乡市',value:7}],
		[{name:'宜春'},{name:'广东深圳龙岗区',value:3}],
		[{name:'宜春'},{name:'广西梧州',value:1}],
		[{name:'宜春'},{name:'广东佛山',value:1}],
		[{name:'宜春'},{name:'普宁市',value:2}],
		[{name:'宜春'},{name:'大田县',value:1}],
		[{name:'宜春'},{name:'三亚市',value:1}],
		[{name:'宜春'},{name:'义乌市',value:1}],
		[{name:'宜春'},{name:'庐江县',value:1}],
		[{name:'宜春'},{name:'广东佛山',value:1}],
		[{name:'宜春'},{name:'南昌县',value:1}],
		[{name:'宜春'},{name:'广东东莞',value:1}],
		[{name:'宜春'},{name:'兰溪市',value:1}],
		[{name:'宜春'},{name:'江西南昌',value:2}],
		[{name:'宜春'},{name:'高县',value:1}],
		[{name:'宜春'},{name:'湖南株洲',value:1}],
		[{name:'宜春'},{name:'广东东莞',value:1}],
		[{name:'宜春'},{name:'南昌县',value:2}],
		[{name:'宜春'},{name:'湖南常德',value:1}],
		[{name:'宜春'},{name:'安徽芜湖',value:1}],
		[{name:'宜春'},{name:'晋江市',value:1}],
		[{name:'宜春'},{name:'监利县',value:1}]
	];
	
	var YCData = [
		[{name:'宜春'},{name:'湖南怀化',value:3}],
		[{name:'宜春'},{name:'江西南昌',value:234}],
		[{name:'宜春'},{name:'晋江市',value:2}],
		[{name:'宜春'},{name:'南昌县',value:71}],
		[{name:'宜春'},{name:'湖南益阳',value:1}],
		[{name:'宜春'},{name:'芦溪县',value:1}],
		[{name:'宜春'},{name:'赣州市南康区',value:1}],
		[{name:'宜春'},{name:'寻乌县',value:2}],
		[{name:'宜春'},{name:'佛山市顺德区',value:4}],
		[{name:'宜春'},{name:'南昌市湾里区',value:4}],
		[{name:'宜春'},{name:'龙南县',value:1}],
		[{name:'宜春'},{name:'都昌县',value:1}],
		[{name:'宜春'},{name:'景德镇珠山区',value:1}],
		[{name:'宜春'},{name:'广东广州',value:2}],
		[{name:'宜春'},{name:'芦溪县',value:1}],
		[{name:'宜春'},{name:'江西赣州',value:3}],
		[{name:'宜春'},{name:'湖南湘潭',value:1}],
		[{name:'宜春'},{name:'吉安县',value:13}]
	];

	var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';
	console.log(mData)
    var yc = { name:'宜春', coord: [114.400262,27.811053]}
    var ycPoint = { name:'宜春市', value: [114.400262,27.811053]};
	var convertData = function (data) {
	    var res = [];
	    for (var i = 0; i < data.length; i++) {
	        var dataItem = data[i];
	        var fromCoord = yc.coord;
	        var toCoord = geoCoordMap[dataItem[1].name];
	        if (fromCoord && toCoord) {
	            res.push({
	                fromName: yc.name,
	                toName: dataItem[1].name,
	                coords: [fromCoord, toCoord],
	                value: dataItem[1].value
	            });
	        }
	    }
	    return res;
	};
	var convertData2 = function (data) {
	    var res = [];
	    for (var i = 0; i < data.length; i++) {
	        var dataItem = data[i];
	        var fromCoord = geoCoordMap[dataItem[1].name];
	        var toCoord = yc.coord;
	        if (fromCoord && toCoord) {
	            res.push({
	                fromName: dataItem[1].name,
	                toName: yc.name,
	                coords: [fromCoord, toCoord],
	                value: dataItem[1].value
	            });
	        }
	    }
	    return res;
	};

	var color = ['#a6c84c', '#ffa022', '#46bee9'];
	var series = [];
	[['宜春', type==1 ? BJData : YCData]].forEach(function (item, i) {
	    series.push(
	    {
	        type: 'lines',
	        zlevel: 2,
	        large: true,
	        effect: {
	            show: true,
	            constantSpeed: 30,
	            symbol: 'pin',
	            symbolSize: 5,
	            trailLength: 0,
	        },
	        lineStyle: {
	            normal: {
	                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                        offset: 0, color: '#58B3CC'
	                    }, {
	                        offset: 1, color: '#F58158'
	                    }], false),
	                width: 2,
	                opacity: 0.4,
	                curveness: 0.2
	            }
	        },
	        data: type == 1 ? convertData(item[1]) : convertData2(item[1])
	    },
	    {
	        type: 'effectScatter',
	        coordinateSystem: 'geo',
	        zlevel: 2,
	        rippleEffect: {
	            brushType: 'stroke'
	        },
	        label: {
	            normal: {
	                show: true,
	                position: 'right',
	                formatter: '{b}'
	            }
	        },
	        symbolSize: function (val) {
	            return val[2] / 8;
	        },
	        itemStyle: {
	            normal: {
	                color: color[i]
	            }
	        },
	        data: item[1].map(function (dataItem) {
	            return {
	                name: dataItem[1].name,
	                value: geoCoordMap[dataItem[1].name].concat([dataItem[1].value])
	            };
	        })
	    });
	});
	var option = {
	    backgroundColor: '#031528',
	    title : {
	        text: '宜春物流',
	        left: 'center',
	        textStyle : {
	            color: '#fff'
	        }
	    },
	    tooltip : {
	        trigger: 'item',
	        formatter:function(params){
	            if(params.seriesType=="lines"){
	                return params.data.fromName+">"+params.data.toName+"<br />车次："+params.data.value+'次';
	            }else{
	                return params.name;
	            }
	        }
	    },
	    geo: {
	        map: 'china',
	        label: {
	            emphasis: {
	                show: true,
	                color:'#fff'
	            }
	        },
	        roam: true,
	        center: [114.400262,27.811053],
	        zoom : 2.5,
	        itemStyle: {
	            normal: {
	                areaColor: '#112C4F',
	                borderColor: '#465A6B'
	            },
	            emphasis: {
	                areaColor: '#112C4F'
	            }
	        }
	    },
	    /* series: series */
	    series: [{
	        type: 'lines',
	        zlevel: 2,
	        large: true,
	        tooltip: {
	        	show: true,
	        	/* formatter: function(params){
	        		console.log(params)
	        	} */
	        },
	        effect: {
	            show: true,
	            constantSpeed: 30,
	            symbol: 'pin',
	            symbolSize: 5,
	            trailLength: 0,
	        },
	        lineStyle: {
	            normal: {
	                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                        offset: 0, color: '#58B3CC'
	                    }, {
	                        offset: 1, color: '#F58158'
	                    }], false),
	                width: 2,
	                opacity: 0.4,
	                curveness: 0.2
	            }
	        },
	        data: type == 1 ? JSON.parse(mData.delivery) : JSON.parse(mData.receive)
	    },
	    {
	        type: 'effectScatter',
	        coordinateSystem: 'geo',
	        zlevel: 2,
	        tooltip: {
	        	show: false
	        },
	        rippleEffect: {
	        	scale: 3,
	            brushType: 'fill'
	        },
	        label: {
	            normal: {
	                show: true,
	                position: 'right',
	                formatter: '{b}'
	            }
	        },
	        symbolSize: function (val) {
	            return 5;
	        },
	        itemStyle: {
	            normal: {
	                color: type == 1 ? '#a6c84c' : '#ffa022'
	            }
	        },
	        data: type == 1 ? mData.deliveryPoint : mData.receivePoint
	    }]
	};
	if(type == 1) { 
		option.geo.zoom = 2.5;
	    option.geo.center = [108.0,29.0]
		if(width<=1600){
		    option.geo.center = [108.0,31.0]
		}
	}else { 
		option.geo.zoom = 2.5; option.geo.center = [110.0,29.0]
	}
    goodsMap.setOption(option)
  }
  $('#jaLine').click(function () {
    $(this).siblings('a').removeClass('on');
    $(this).addClass('on');
    CreateGoodsDstribution(1);
  })

  $('#gzLine').click(function () {
    $(this).siblings('a').removeClass('on');
    $(this).addClass('on');
    CreateGoodsDstribution(2);
  })
  // 订单日交易额
  function CreateOrderDayView() {
    if (!truckData.legend || truckData.legend.length < 1) {
      return
    }
    var dates = truckData.legend;
    var truckOrderAmount = truckData.series;
    truckOrderOption = {
      tooltip: {
        "trigger": "axis",
        "axisPointer": {
          "type": "shadow",
          textStyle: {
            color: "#fff"
          }
        },
        formatter: function(params){
        	var d1 = params[0].axisValue + '<br>' + params[0].marker + params[0].seriesName + ':' + params[0].value + '万元'; 
        	return d1
        }
      },
      grid: {
        "borderWidth": 0,
        "top": 15,
        "left": 60,
        "right": 15,
        "bottom": 20,
        textStyle: {
          color: "#fff"
        }
      },
      calculable: true,
      xAxis: [{
        "type": "category",
        "axisLine": {
          lineStyle: {
            color: '#6CBCE5'
          }
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
        "axisLabel": {
          "interval": 0,
          textStyle: {
            color: "#6CBCE5",
            fontSize: 10,
          }
        },
        "data": dates,
      }],
      yAxis: [{
        "type": "value",
        "splitLine": {
          "show": false
        },
        "axisLine": {
          lineStyle: {
            color: '#6CBCE5'
          }
        },
        "axisTick": {
          "show": false
        },
        "axisLabel": {
          "interval": 0,
          textStyle: {
            color: "#6CBCE5",
            fontSize: 10,
          }

        },
        "splitArea": {
          "show": false
        },

      }],
      dataZoom: [{
        "type": "inside",
        "show": true,
        "moveOnMouseMove": true,
        "zoomOnMouseWheel": true,
        "height": 15,
        "start": 0,
        "end": 10
      }],
      series: [{
        "name": "订单交易额",
        "type": "bar",
        "barMaxWidth": 15,
        "barGap": "50%",
        "itemStyle": {
          "normal": {
            color: '#38DC98',
            "label": {
              "show": false,
              "textStyle": {
                "color": "#fff"
              },
              "position": "insideTop",
              formatter: function (p) {
                return p.value > 0 ? (p.value) : '';
              }
            }
          }
        },
        data: truckOrderAmount
      }]
    }
    truckOrder.setOption(truckOrderOption);
    truckOrderdataZoom = truckOrderOption.dataZoom[0];
  }

  function truckOrderAnimation() {
    truckOrderdataZoom.end = truckOrderdataZoom.end + 4;
    truckOrderdataZoom.start = truckOrderdataZoom.start + 4;
    truckOrder.setOption(truckOrderOption);
    if (truckOrderdataZoom.end > 100) {
      truckOrderdataZoom.end = 6;
      truckOrderdataZoom.start = -4;
    }
  }
  // 车辆排行
  	function CreateCarTop() {
    	carTopOption = {
		tooltip: {
	        trigger: "item",
	        formatter: "{b}: {d}%"
		},
	    series: [{
	        type: "pie",
	        radius: ['34%', '72%'],
	        avoidLabelOverlap: false,
	        startAngle: 0,
	        center: ["50%", "50%"],
	        roseType: "area",
	        selectedMode: "single",
	        color: ['#4CC76C', '#F2A440', '#3F95F6', '#D8CC4B', '#B95FF9', '#FF5A5A'],
	        label: {
	            normal: {
	                show: true,
	                formatter: "{b}"
	            },
	            emphasis: {
	                show: true
	            }
	        },
	        labelLine: {
	            normal: {
	                show: true,
	                smooth: false,
	                length: 2,
	                length2: 10
	            },
	            emphasis: {
	                show: true
	            }
	        },
	        data: CarTop
	    }]
    }
    carTop.setOption(carTopOption);
  }
  function carTopAnimation() {
	  carTop.dispatchAction({
	      type: 'downplay',
	      seriesIndex: 0
	    });
	  carTop.dispatchAction({
	      type: 'highlight',
	      seriesIndex: 0,
	      dataIndex: (carTopCount++) % CarTop.length
	    });
	  }
  // 车辆状态
  function CreateCarState() {
	  var d = [];
	  for(var i=0;i<CarWorkState.legend.length;i++){
		  var temp = { name: CarWorkState.legend[i], value: CarWorkState.series[i]}
		  d.push(temp)
	  }
    carStatusOption = {
   		tooltip: {
   	        trigger: "item",
   	        formatter: "{b}: {d}%"
   		},
      series: [{
        name: '出车次数',
        animationDuration: 2000,
        type: 'pie',
        startAngle: 10,
        center: ['45%', '58%'],
        radius: ['54%', '72%'],
        hoverOffset: 3,
        itemStyle: {
          normal: {
            shadowBlur: 40,
            shadowColor: 'rgba(40, 40, 40,0.5)',
          }
        },
        color: ['#4CC76C', '#F2A440', '#3F95F6', '#D8CC4B', '#B95FF9', '#FF5A5A'],
        label: {
          normal: {
            //position: 'inner',
            formatter: '{b}\n{c}次',
          }
        },
        normal: {
          label: {
            show: false
          },
          labelLine: {
            show: false
          },
          shadowBlur: 40,
          shadowColor: 'rgba(40, 40, 40,1)',
        },
        data: d
      }]
    };
    carStatus.setOption(carStatusOption);
  }

  function carStatusAnimation() {
    carStatus.dispatchAction({
      type: 'downplay',
      seriesIndex: 0
    });
    carStatus.dispatchAction({
      type: 'highlight',
      seriesIndex: 0,
      dataIndex: (carStatusCount++) % CarWorkState.legend.length
    });
  }
  // 车辆类型
  function CreateCarType() {
    carsTypeoption = {
      tooltip: {
        trigger: 'item',
        formatter: '{b}:{d}%',
        padding: 10,
        backgroundColor: 'rgba(0, 0, 0, 0.3)',
        textStyle: {
          fontSize: 11,
        }
      },
      series: [{
        color: ['#4CC76C', '#F2A440', '#3F95F6', '#D8CC4B', '#B95FF9', '#FF5A5A'],
        animationDuration: 2000,
        labelLine: {
          normal: {
            smooth: 0.2,
            length: 5,
            length2: 10
          }
        },
        name: '车辆类型',
        type: 'pie',
        center: ['45%', '58%'],
        // radius: ['45%', '70%'],
        data: PlatCarType
      }]
    }
    carsType.setOption(carsTypeoption);
  }

  function carsTypeAnimation() {
    carsType.dispatchAction({
      type: 'downplay',
      seriesIndex: 0
    });
    carsType.dispatchAction({
      type: 'highlight',
      seriesIndex: 0,
      dataIndex: (carsTypeCount++) % PlatCarType.length
    });
  }
  // 表格 最近上线司机  最近交易订单
  function CreateTableScroll(orders) {
    if (orders.length > 0) {
      var template = "";
      orders.forEach((item) => {
        template += "<li><p>" + item.plateNumber + "</p><p>" + item.orderAccount + "元</p><p>" + item.orderTime +
          "</p></li>";
      });
      $("#orders").html(template);
    }
  }
  // 地图  车辆位置
  function CreateCarDstribution() {
    var carsJson = "js/carsLocaltion.json";
    var carsMap = echarts.init(document.getElementById('carsMap'))
    $.getJSON(carsJson, function (carsData) {
      carsLocation = carsData.map(function (serieData, idx) {
        var res = []
        for (var i = 0; i < serieData.length; i += 2) {
          var dx = serieData[i]
          var dy = serieData[i + 1]
          var x = dx
          var y = dy
          res.push([x, y, 1])
        }
        return res
      })
      var carsMapOptions = {
        bmap: {
          center: [107.93, 34.33],
          zoom: 5,
          roam: true,
          mapStyle: {
            styleJson: [{
              featureType: 'water',
              elementType: 'all',
              stylers: {
                color: '#0b1934'
              }
            },
            {
              featureType: 'land',
              elementType: 'geometry',
              stylers: {
                color: '#112d50'
              }
            },
            {
              featureType: 'highway',
              elementType: 'all',
              stylers: {
                visibility: 'off'
              }
            },
            {
              featureType: 'arterial',
              elementType: 'geometry.fill',
              stylers: {
                color: '#000000'
              }
            },
            {
              featureType: 'arterial',
              elementType: 'geometry.stroke',
              stylers: {
                color: '#0b3d51'
              }
            },
            {
              featureType: 'local',
              elementType: 'geometry',
              stylers: {
                color: '#000000'
              }
            },
            {
              featureType: 'railway',
              elementType: 'geometry.fill',
              stylers: {
                color: '#000000'
              }
            },
            {
              featureType: 'railway',
              elementType: 'geometry.stroke',
              stylers: {
                color: '#08304b'
              }
            },
            {
              featureType: 'subway',
              elementType: 'geometry',
              stylers: {
                lightness: -70
              }
            },
            {
              featureType: 'building',
              elementType: 'geometry.fill',
              stylers: {
                color: '#000000'
              }
            },
            {
              featureType: 'all',
              elementType: 'labels.text.fill',
              stylers: {
                color: '#857f7f'
              }
            },
            {
              featureType: 'all',
              elementType: 'labels.text.stroke',
              stylers: {
                color: '#000000'
              }
            },
            {
              featureType: 'building',
              elementType: 'geometry',
              stylers: {
                color: '#022338'
              }
            },
            {
              featureType: 'green',
              elementType: 'geometry',
              stylers: {
                color: '#062032'
              }
            },
            {
              featureType: 'boundary',
              elementType: 'all',
              stylers: {
                color: '#465b6c'
              }
            },
            {
              featureType: 'manmade',
              elementType: 'all',
              stylers: {
                color: '#022338'
              }
            },
            {
              featureType: 'label',
              elementType: 'all',
              stylers: {
                visibility: 'off'
              }
            }
            ]
          }
        },
        series: [{
          name: '空闲',
          type: 'scatter',
          coordinateSystem: 'bmap',
          symbolSize: 1,
          large: true,
          itemStyle: {
            normal: {
              shadowBlur: 2,
              shadowColor: 'rgba(37, 140, 249, 0.8)',
              color: 'rgba(37, 140, 249, 0.8)'
            }
          },
          data: carsLocation[0]
        }, {
          name: '忙碌',
          type: 'scatter',
          coordinateSystem: 'bmap',
          symbolSize: 1,
          large: true,
          itemStyle: {
            normal: {
              shadowBlur: 2,
              shadowColor: 'rgba(14, 241, 242, 0.8)',
              color: 'rgba(14, 241, 242, 0.8)'
            }
          },
          data: carsLocation[1]
        }]
      }
      carsMap.setOption(carsMapOptions);
    });
    // $("#showCarsMap").click(function () {
    //   if (countIndex === 1) {
    //     var GetmapDataInterval = setInterval(function () {
    //       countIndex++
    //       GetmapDataRepeat(countIndex)
    //       carsMap.setOption(carsMapOptions)
    //       if (countIndex > 399) {
    //         clearInterval(GetmapDataInterval);
    //       }
    //     }, 5000);
    //   }
    // });

    // function mapDataInterval() {
    //   GetmapDataRepeat(1)
    //   carsMap.setOption(carsMapOptions)
    // }
    // mapDataInterval()
    // $('.carsMapBox').hide();
  }
</script>
</html>
