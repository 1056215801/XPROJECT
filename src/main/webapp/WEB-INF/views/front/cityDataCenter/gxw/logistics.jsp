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
<link href="${ctx}/static/css/cityDataCenter/site.css" rel="stylesheet">
<title>江西省工业大数据工业物流</title>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
    <div class="mainpage clear-box">
		<input type="hidden" id="orgKind" value="0" name="orgKind">
		<input type="hidden" id="orgType" value="1" name="orgType">
      <div class="logis-main mainfl">
        <div class="countBox clear-box boxStyle">
		<div class="outsideBox">
			<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
			<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
			<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
			<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
			<div class="tabCaptionBar">
				<span class="tabCaption">实时数据中心</span>
			</div>
            <div class="tabContBar" style="padding-top: 10px;">
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
        <div class="boxStyle memberTrendBox">
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
        <div class="boxStyle orderTableBox">
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
      <div class="logis-main maincenter">
        <div class="mapmain boxStyle">
          <div class="outsideBox" style="padding: 0;">
			<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
			<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
			<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
			<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
            <div class="mapmenu flex-1 flex-r-a flex-r-j">
              <a href="javascript:;" class="goodsMapMenu on">省级货源分布</a>
              <a href="javascript:;" class="carsMapMenu">市级货源分布</a>
            </div>
            <div class="mainmap">
              <div id="goodsMap" class="mainmapbox goodsMapBox" style="height: 100%;"></div>
            </div>
            <div class="cityGoodsLine flex-r-a flex-r-j">
              <a href="javascript:;" id="jaLine" class="on">
                <span class="formattercirle"></span>江西省发货</a>
              <a href="javascript:;" id="gzLine">
                <span class="formattercirle"></span>江西省收货</a>
            </div>
          </div>
        </div>
      </div>
      <div class="logis-main mainfr">
        <div class="boxStyle carTopBox">
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
        <div class="boxStyle carStatusBox">
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
        <div class="boxStyle">
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
</body>
<script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/underscore.js/1.8.3/underscore-min.js"></script>
<script src="https://cdn.bootcss.com/echarts/4.1.0.rc2/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/map/china.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script type="text/javascript">
  //实时时间
  	$(function () {
	  	$(".head>a:eq(5)").addClass("on");
		$(".mapmenu a").on("click",function(){
			var ind = $(this).index();
		    $(this).addClass('on').siblings().removeClass("on");
		    $("#orgKind").val(ind);
		    getMapData();
		});
		$(".select p").on("click",function(){
			$(this).next().slideToggle();
		});
		$(".cityGoodsLine a").on("click",function(){
			var ind = $(this).index()+1;
		    $(this).addClass('on').siblings().removeClass("on");
		    $("#orgType").val(ind);
		    CreateGoodsDstribution();
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
	    getMapData();
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
			orgId: '360000'
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
			}
		})
  	}
  	function getMapData() {
		var param = {
			orgId: '360000',
			orgKind: $("#orgKind").val()
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/xzLogistics/logisticsMapData",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				mData = result.data;
			    //初始化地图
			    CreateGoodsDstribution();
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
function CreateGoodsDstribution() {
	var type = $("#orgType").val();
	var option = {
	    backgroundColor: '#031528',
	    title : {
	        text: '江西省物流中心',
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
	    series: [{
	        type: 'lines',
	        zlevel: 2,
	        large: true,
	        tooltip: {
	        	show: true
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
	        data: type == 1 ? JSON.parse(mData.deliveryPoint) : JSON.parse(mData.receivePoint)
	    }]
	};
	if(type == 1) { option.geo.zoom = 2.5; option.geo.center = [108.0,29.0]}
	else { option.geo.zoom = 2.5; option.geo.center = [110.0,29.0]}
    goodsMap.setOption(option)
}
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
        "top": 20,
        "left": 30,
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
</script>
</html>
