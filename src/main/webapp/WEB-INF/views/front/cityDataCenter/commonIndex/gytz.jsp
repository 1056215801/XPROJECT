<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>大数据中心</title>
    <link rel="stylesheet" href="${ctx}/static/css/cityDataCenter/index.css">
</head>
<body class="gray-bg gytz">
	<div class="head">
        <div class="logo-box" onclick="location.href='${ctx}/front/cityDataCenter/commonIndex/${entranceId}'">
            <img id="logo" src="${ctx}/static/image/cityDataCenter/common/logo.png" alt="">
            <p id="now">2019年02月12日 星期二</p>
        </div>
        <div class="tab">
            <a href="${ctx}/front/commonDataCenter/index/${entranceId}" class="head-a">首页</a>
            <a href="${ctx}/front/commonDataCenter/qyhx/${entranceId}" class="head-a">企业画像</a>
            <a href="${ctx}/front/commonDataCenter/yygl/${entranceId}" class="head-a">运营管理</a>
            <a href="${ctx}/front/commonDataCenter/gytz/${entranceId}" class="head-a on">工业投资</a>
            <a href="${ctx}/front/commonDataCenter/scjc/${entranceId}" class="head-a">生产监测</a>
            <a href="${ctx}/front/commonDataCenter/jcss/${entranceId}" class="head-a">基础设施</a>
            <a href="${ctx}/front/commonDataCenter/yjzh/${entranceId}" class="head-a">应急指挥</a>
        </div>
        <a href="javascript:;" class="currentTime"><em id="time"></em></a>
        <div class="time">
            <a href="javascript:;" id="nologin"><img src="${ctx}/static/image/cityDataCenter/common/peo.png"><em>登录</em></a>
            <a href="javascript:;" style="display:none;" id="login"><img src="${ctx}/static/image/cityDataCenter/common/peo.png"><em class="accountName">${accountName}</em><img width="18" src="${ctx}/static/image/cityDataCenter/common/logout Data.png"><font onclick="logout()">退出</font></a>
        </div>
    </div>
    <div class="content fz0" id="content">
    	<div class="spanStyle" style="width: 75%;">
    		<div class="blockStyle" style="height: 65%;">
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                    <div class="map-bg"></div>
                </div>
            </div>
    		<div class="blockStyle" style="height: calc(35% - 20px);">
				<div class="spanStyle" style="width: 60%;">
					<div class="outsideBox">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                        <div class="spanStyle" style="width: 35%;">
                            <div class="tabCaptionBar">
                                <span class="tabCaption">投资总额</span>
                            </div>
                            <div id="indexMap1" class="tabTitleBar"></div>
                        </div>
                        <div class="spanStyle" style="width: calc(65% - 10px);">
                            <div class="tabCaptionBar">
                                <span class="tabCaption">投资占比</span>
                            </div>
                            <div id="indexMap2" class="tabTitleBar"></div>
                        </div>
					</div>
				</div>
				<div class="spanStyle" style="width: calc(40% - 10px);">
					<div class="outsideBox">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                        <div class="tabCaptionBar">
                            <span class="tabCaption">各行业项目数量对比</span>
                        </div>
						<div id="indexMap3" class="tabTitleBar"></div>
					</div>
				</div>
    		</div>
        </div>
    	<div class="spanStyle" style="width: calc(25% - 10px);">
    		<div class="blockStyle" style="height: 32%;">
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                    <div class="tabCaptionBar">
                        <span class="tabCaption">项目进度</span>
                    </div>
                    <div id="indexMap4" class="tabTitleBar"></div>
                </div>
            </div>
    		<div class="blockStyle" style="height: calc(34% - 20px);">
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                    <div class="tabCaptionBar">
                        <span class="tabCaption">项目预警</span>
                    </div>
                    <div class="tabTitleBar listBar">
						<div class="projectRealDataBar">
							<div class="projectRealDataBox">
                                <div class="projectRealData df ac" v-for="item in xmyjList">
                                    <div class="projectName fx1" v-cloak>{{ item.name }}</div>
                                    <div class="projectStatus" :style="{color: item.color}" v-cloak>{{ item.status }}</div>
                                </div>
                                <div class="projectRealData df ac" v-for="item in xmyjList">
                                    <div class="projectName fx1" v-cloak>{{ item.name }}</div>
                                    <div class="projectStatus" :style="{color: item.color}" v-cloak>{{ item.status }}</div>
                                </div>
							</div>
						</div>
                    </div>
                </div>
    		</div>
    		<div class="blockStyle" style="height: calc(34% - 20px);">
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                    <div class="tabCaptionBar">
                        <span class="tabCaption">工程项目实时动态</span>
                    </div>
                    <div class="tabTitleBar listBar">
                        <div class="projectRealDataBar">
                            <div class="projectRealDataBox">
                                <div class="projectRealData" v-for="item in ssdtList">
                                    <div class="projectRealDataTime" v-cloak>{{ item.time }}</div>
                                    <div class="projectRealDataName" v-cloak>{{ item.name }}</div>
                                </div>
                                <div class="projectRealData" v-for="item in ssdtList">
                                    <div class="projectRealDataTime" v-cloak>{{ item.time }}</div>
                                    <div class="projectRealDataName" v-cloak>{{ item.name }}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    		</div>
        </div>
    </div>
</body>
<script src="${ctx}/static/js/vue.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts-liquidfill.min.js"></script>
<script src="${ctx}/static/js/dataCenter/${entranceId}.js"></script>
<script>
var app = new Vue({
    el: '#content',
    data: {
        width: 1920,
        xmyjList: [],
        ssdtList: []
    },
    mounted: function() {
        this.getInfor()
        this.getTime()
    },
    methods: {
        getInfor: function() {
            this.width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
            $("title").text(indexData.title)
            $("#logo").attr("src",indexData.logo)

            this.xmyjList = gytzData.xmyjList;
            this.ssdtList = gytzData.ssdtList;
            this.chartWater(gytzData.waterData);
            this.charPie(gytzData.pieData);
            this.chartBar(gytzData.barData.legend, gytzData.barData.label, gytzData.barData.data)
            this.chartRing(gytzData.ringData)
        },
        chartWater: function(data){
            var myChart = echarts.init(document.getElementById("indexMap1"));
		    var fz2 = 32;
		    var fz3 = 14;
            var option = {
                series: [{
                    type: 'liquidFill',
                    data: [data, 0.4, 0.3],
                    color: ['#00B9F5'], //颜色
                    center: ["50%","50%"], //位置
                    outline: {  //边框
                        show: true,
                        borderDistance: 1,
                        itemStyle: {
                            color: '#FFF',
                            borderColor: '#F3CF76',
                            borderWidth: 1
                        }
                    },
                    radius: '70%', //半径
                    backgroundStyle: {
                        color: '#0E5876'
                    },
                    label: {
                        color: '#f1c851',
                        insideColor: '#fff',
                        fontSize: fz2,
                        fontFamily: 'DIN-Medium',
                        fontWeight: 'normal',
                        formatter: function(params){
                            return params.data.val + "\n{a|" + params.name + '}';
                        },
                        rich: {
                            a: {
                                fontSize: fz3
                            }
                        }
                    }
                }]
            }
		    myChart.setOption(option);
        },
        charPie: function(datas) {
            var myChart = echarts.init(document.getElementById("indexMap2"));
            var option = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{b}: {c} ({d}%)"
                },
                color:['#407CC9','#F5D345','#ad46f3','#5045f6','#4777f5'],
                series : [
                    {
                        type: 'pie',
                        radius : '75%',
                        center: ['50%', '50%'],
                        data: datas,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            },
                            normal : {
                                label:{
                                    textStyle:{
                                        fontSize: 13,
                                        color: "#fff"
                                    },
                                    formatter: function(params) {
                                        return params.name + '\n' + params.value + params.data.unit + " (" + params.percent + '%)';
                                    },
                                },
                                borderWidth:3,
                                borderColor:'#000f30',
                            }
                        }
                    }
                ]
            };
		    myChart.setOption(option);
        },
        chartBar: function(legend,xData,datas) {
            var myChart = echarts.init(document.getElementById("indexMap3"));
            var ser = [];
            for(var i=0;i<legend.length;i++){
                var temp = {
                    name: legend[i],
                    type: "bar",
                    barWidth: 20,
                    barGap: 1,
                    data: datas[i]
                }
                ser.push(temp)
            }
            var option = {
                tooltip: {
                    trigger: "axis",
                    axisPointer: {
                        type: "shadow",
                    }
                },
                color: [
                    new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 0,
                        color: '#12AABB'
                    }, {
                        offset: 1,
                        color: '#3451B9'
                    }]),
                    new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 0,
                        color: '#FFD154'
                    }, {
                        offset: 1,
                        color: '#FF903E'
                    }])
                ],
                legend: {
                    data: legend,
                    align: 'right',
                    right: 10,
                    itemWidth: 10,
                    itemHeight: 10,
                    itemGap: 35,
                    textStyle: {
                        color: "#fff"
                    }
                },
                grid: {
                    top: '20%',
                    left: '2%',
                    right: '2%',
                    bottom: '5%',
                    containLabel: true
                },
                xAxis: {
                    type: 'category',
                    data: xData,
                    axisLine: {
                        lineStyle: {
                            color: '#57617B'
                        }
                    },
                    splitLine: {
                        lineStyle: {
                            color: '#57617B'
                        }
                    },
                    axisTick: {
                        show: false
                    },
                    splitArea: {
                        show: false
                    },
                    axisLabel: {
                        interval: 0,
                        color: '#83ADBA'
                    }
                },
                yAxis: [{
                    type : 'value',
                    axisLabel : {
                        formatter : '{value}'
                    },
                    axisLine : {
                        show : false,
                        lineStyle: {
                            color: '#83adba'
                        }
                    },
                    axisTick : {
                        show : false
                    },
                    splitLine: {
                        lineStyle: {
                            color: '#57617B'
                        }
                    },
                    splitArea: {
                        show: false
                    },
                }],
                series: ser
            }
            myChart.setOption(option);
        },
        chartRing: function(datas){
            var fz1 = 25;
            var fz2 = 14;
            if(this.width<=1600){
                fz1 =20;
                fz2 = 12;
            }
            if(this.width<=1440){
                fz1 = 18;
                fz2 = 10;
            }
            var myChart = echarts.init(document.getElementById('indexMap4'));	 
            var option = {
                color: ['#F16279', '#FCD434', '#4EC973', '#34C9C9', '#965DE4', '#399EFF', "rgba(0,0,0,0.2)"],
                title: {
                    text: datas.total,
                    subtext: datas.title,
                    textStyle: {
                        color: '#FFEE2D',
                        fontSize: fz1,
                        lineHeight: 10,
                    },
                    subtextStyle: {
                        fontSize: fz2,
                        color: '#00DEFF',
                        lineHeight: 10,
                    },
                    x: 'center',
                    y: '38%',
                    itemGap: 5, 
                },
                grid: {
                    top:10,
                    bottom: 0,
                    containLabel:true
                },
                series: [
                    {
                        radius: ['55%', '75%'],
                        center: ['50%', '50%'],
                        type: 'pie',
                        startAngle: 200,
                        itemStyle: {
                            borderWidth:3,
                            borderColor:'#000f30'
                        },
                        label: {
                            show: true,
                            formatter: function(param){
                                return param.name+'\n'+param.percent+'%（'+param.value+param.data.unit+'）';
                            },
                            fontSize: 13,
                            position: 'outside',
                            color: '#fff',
                            algin: 'center',
                        },
                        labelLine: {
                            show: true,
                            length: 10,
                            length2: 8,
                            lineStyle: {
                                color: '#fff' 
                            }
                        },
                        data: datas.data,
                    }
                ]
            }
            myChart.setOption(option);
        },
        getTime: function(){
			var date = new Date();
			var localDate = date.getFullYear() + "年" + (date.getMonth()+1) + "月" + date.getDate() + "日";
            var localSec = date.getDay();
            switch(localSec) {
                case 1: localSec = '一'
                    break;
                case 2: localSec = '二'
                    break;
                case 3: localSec = '三'
                    break;
                case 4: localSec = '四'
                    break;
                case 5: localSec = '五'
                    break;
                case 6: localSec = '六'
                    break;
                default: localSec = '天'
            }
			$("#now").text(localDate+' 星期'+localSec);
        }
    }
})
</script>
</html>