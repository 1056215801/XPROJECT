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
            <img id="logo" src="" alt="">
            <p id="now">2019年02月12日 星期二</p>
        </div>
        <div class="tab">
            <a href="${ctx}/front/commonDataCenter/index/${entranceId}" class="head-a">首页</a>
            <a href="${ctx}/front/commonDataCenter/qyhx/${entranceId}" class="head-a">企业画像</a>
            <a href="${ctx}/front/commonDataCenter/yygl/${entranceId}" class="head-a on">运营管理</a>
            <a href="${ctx}/front/commonDataCenter/gytz/${entranceId}" class="head-a">工业投资</a>
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
    	<div class="spanStyle" style="width: 25%;">
            <div class="blockStyle" style="height: 32%;">
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                    <div class="tabCaptionBar">
                        <span class="tabCaption">工业销售产值（单位：亿元）</span>
                    </div>
                    <div id="indexMap1" class="tabTitleBar"></div>
                </div>
            </div>
            <div class="blockStyle" style="height: calc(34% - 20px);">
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                    <div class="tabCaptionBar">
                        <span class="tabCaption">主营业务收入（单位：亿元）</span>
                    </div>
                    <div id="indexMap2" class="tabTitleBar"></div>
                </div>
            </div>
            <div class="blockStyle" style="height: calc(34% - 20px);">
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                    <div class="tabCaptionBar">
                        <span class="tabCaption">利润总额（单位：亿元）</span>
                    </div>
                    <div id="indexMap3" class="tabTitleBar"></div>
                </div>
            </div>
        </div>
        <div class="spanStyle" style="width: calc(50% - 10px);">
            <div class="price-num" style="margin-top: 0px;">
                <span v-for="(item, index) in ecoList">
                    <div class="middle-box">
                        <p v-cloak>{{ item.title }}</p>
                        <h1>
                            <em style="margin-right: -5px;" :id="'gyzjz1'+index">123</em>
                            <em style="margin-right: -5px;" v-if="item.decimal">
                                <ul class="dataNums inrow">
                                    <li class="dataOne ">
                                        <div class="dataBoc">
                                            <div class="tt" t="38">
                                                <span class="">.</span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </em>
                            <em :id="'gyzjz2'+index" v-if="item.decimal">45</em><small v-cloak>{{ item.unit }}</small>
                        </h1>
                    </div>
                </span>
            </div>
            <div class="blockStyle" style="height: calc(60% - 90px);">
                <div class="center-box">
                    <img src="${ctx}/static/image/cityDataCenter/common/center.png">
                    <h3 v-cloak>{{ infor.park }}</h3>
                </div>
                <div class="lt-box center-box">
                    <img src="${ctx}/static/image/cityDataCenter/common/orange.png">
                    <p v-cloak>{{ infor.industry1 }}</p>
                </div>
                <div class="lb-box center-box">
                    <img src="${ctx}/static/image/cityDataCenter/common/blue.png">
                    <p v-cloak>{{ infor.industry2 }}</p>
                </div>
                <div class="rt-box center-box">
                    <img src="${ctx}/static/image/cityDataCenter/common/green.png">
                    <p v-cloak>{{ infor.industry3 }}</p>
                </div>
                <div class="rb-box center-box">
                    <img src="${ctx}/static/image/cityDataCenter/common/purple.png">
                    <p v-cloak>{{ infor.industry4 }}</p>
                </div>
            </div>
            <div class="blockStyle" style="height: calc(40% - 20px);">
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                    <div class="tabCaptionBar">
                        <span class="tabCaption">企业用电负荷实时曲线（单位：万kw）</span>
                    </div>
                    <div class="tabTitleBar">
                        <div class="blockStyle" id="indexMap4"></div>
                        <div class="electric-infor" style="right:1%">
                            <div class="electric-infor-box">
                                <p id="today">今日最大负荷(<b class="yellowT2" v-cloak>{{ max.todayTime }}</b>)</p>
                                <h3 class="bgT"><em class="yellowT2" v-cloak>{{ max.today }}</em> <small>万 kw</small>
                            </h3>
                            </div>
                            <div class="electric-infor-box">
                                <p id="yesterday">昨日最大负荷(<b class="yellowT2" v-cloak>{{ max.yesterdayTime }}</b>)</p>
                                <h3 class="bgT" id="zrfh">
                                    <em class="greenT" v-cloak>{{ max.yesterday }}</em><small>万 kw</small>
                                </h3>
                            </div>
                        </div>
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
                        <span class="tabCaption">企业分布</span>
                    </div>
                    <div id="indexMap5" class="tabTitleBar"></div>
                </div>
            </div>
    		<div class="blockStyle" style="height: calc(30% - 20px);">
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                    <div class="tabCaptionBar">
                        <span class="tabCaption">企业统计</span>
                    </div>
                    <div class="tabTitleBar">
                        <div class="price-num qytj-items">
                            <span v-for="(item, index) in qytjList">
                                <div class="middle-box">
                                    <p v-cloak>{{ item.title }}</p>
                                    <h1 :id="'qytj'+index"></h1>
                                </div>
                            </span>
                        </div>
                    </div>
                </div>
    		</div>
    		<div class="blockStyle" style="height: calc(38% - 20px);">
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                    <div class="blockStyle" style="height: 50%;">
                        <div class="tabCaptionBar">
                            <span class="tabCaption">项目申报-累计历年</span>
                        </div>
                        <div class="tabTitleBar">
							<div class="companybox-list" style="margin-left: 5px;">
                                <span v-for="item in xmsbList">
                                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                                    <div class="middle-box">
                                        <img src="${ctx}/static/image/cityDataCenter/common/electric-bg1.png">
                                        <p v-cloak>{{ item.title }}</p>
                                        <h3 class="absolute-font">
                                            <em v-cloak>{{ item.num }}</em>
                                        </h3>
                                        <div class="clearfix"></div>
                                    </div>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="blockStyle" style="margin:0;height: 50%;">
                        <div class="tabCaptionBar">
                            <span class="tabCaption">标准厂房-2018（单位：万m^2)</span>
                        </div>
                        <div class="tabTitleBar">
                            <div class="companybox-list" style="margin-left: 5px;">
                                <span v-for="item in bzcfList">
                                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                                    <div class="middle-box">
                                        <img src="${ctx}/static/image/cityDataCenter/common/electric-bg2.png">
                                        <p v-cloak>{{ item.title }}</p>
                                        <h3 class="absolute-font">
                                            <em v-cloak>{{ item.num }}</em>
                                        </h3>
                                        <div class="clearfix"></div>
                                    </div>
                                </span>
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
<script src="${ctx}/static/js/dataCenter/${entranceId}.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script>
var app = new Vue({
    el: '#content',
    data: {
        width: 1920,
        ecoList: [],
        qytjList: [],
        xmsbList: [],
        bzcfList: [],
        infor: {},
        max: {}
    },
    mounted: function() {
        this.getInfor()
        this.getTime()
    },
    methods: {
        getInfor: function() {
            var self = this;
            this.width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
            $("title").text(indexData.title)
            $("#logo").attr("src",indexData.logo)

            this.ecoList = yyglData.economic;
            this.qytjList = yyglData.qytjData;
            this.xmsbList = yyglData.xmsbData;
            this.bzcfList = yyglData.bzcfData;
            this.infor = yyglData.circleData;
            this.max = yyglData.electricData.maxData;
            setTimeout(function(){
                self.numberData()
            }, 100)
            this.chartLine(yyglData.xsczData);
            this.charPie(yyglData.qyfbData.list, yyglData.qyfbData.total, '家', 'indexMap5', '总数（家）');
            this.chartBar(yyglData.zyywsrData, 'indexMap2', 0, '主营业务收入')
            this.chartBar(yyglData.lrData, 'indexMap3', 1, '利润总额')
            this.chartElectric(yyglData.electricData.charData)
        },
        numberData: function(){
            var data = this.ecoList;
            var data2 = this.qytjList;
            for(var i=0;i<data.length;i++){
                $("#gyzjz1"+i).rollNum({
                    deVal: data[i].num.toString().split('.')[0],
                    digit: data[i].num.toString().split('.')[0].length
                });
                if(data[i].decimal){
                    $("#gyzjz2"+i).rollNum({
                        deVal: data[i].num.toString().split('.')[1],
                        digit: data[i].num.toString().split('.')[1].length
                    });
                }
            }
            for(var j=0;j<data2.length;j++){
                $("#qytj"+j).rollNum({
                    deVal: data2[j].num,
                    digit: data2[j].num.toString().length
                });
            }
        },
        chartLine: function(data){
            var myChart = echarts.init(document.getElementById("indexMap1"));
            //蓝色线型配置
            var option = {
                grid: {
                    right: 10,
                    left: 40,
                    bottom: 35,
                    top: 35
                },
                tooltip: {
                    show:true,
                    trigger: 'axis',
                },
                xAxis: {
                    data: data.xData,
                    boundaryGap: true,
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: 'rgba(255,255,255,0.1)'
                        }
                    },
                    axisLine: {
                        show: true,
                        lineStyle:{
                            color: 'rgba(255,255,255,0.1)'
                        }
                    },
                    axisLabel: {
                        color: '#009FF1',
                        fontSize: 12
                    }
                },
                yAxis: {
                    splitLine: {
                        lineStyle: {
                            color: 'rgba(255,255,255,0.1)'
                        }
                    },
                    axisLine: {
                        show: true,
                        lineStyle:{
                            color: 'rgba(255,255,255,0.1)'
                        }
                    },
                    axisLabel: {
                        color: '#009FF1',
                        fontSize: 12
                    }
                },
                series: [{
                    name: '亿元',
                    type: 'line',
                    data: data.data,
                    symbolSize: 0,
                    smooth: true,
                    color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
                        offset: 0,
                        color: '#67F8B3'
                    }, {
                        offset: 1,
                        color: '#05A6FC'
                    }]),
                    areaStyle: {
                        color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
                            offset: 0,
                            color: '#67F8B3'
                        }, {
                            offset: 1,
                            color: '#05A6FC'
                        }]),
                        opacity: 0.2,
                    }
                }]
            };
		    myChart.setOption(option);
        },
        charPie: function(d1, t, unit, id, subTitle) {
            var fz1 = 28;
            var fz2 = 13;
            if(this.width<=1600){
                fz1 = 25;
                fz2 = 12;
            }
            if(this.width<=1366){
                fz2 = 10;
            }
            var myChart = echarts.init(document.getElementById(id));
            var option = {
                color: ['#F16279', '#FCD434', '#4EC973', '#34C9C9', '#965DE4', '#399EFF',"#849CD1","#B1B3B6", "rgba(0,0,0,0.2)"],
                title: {
                    text: t,
                    subtext: subTitle,
                    textStyle: {
                        color: '#FFEE2D',
                        fontSize: fz1,
                        lineHeight: 10,
                    },
                    subtextStyle: {
                        fontSize: fz2,
                        color: '#fff',
                        lineHeight: 10,
                        align: 'center'
                    },
                    x: 'center',
                    y: '40%',
                    itemGap:0,
                },
                grid: {
                    top:10,
                    bottom: 10,
                    left: 20,
                    right: 20,
                    containLabel:true
                },
                series: [
                    {
                        radius: ['45%', '70%'],
                        center: ['50%', '50%'],
                        type: 'pie',
                        label: {
                            show: true,
                            formatter: function(param){
                                return param.name+'\n'+ param.value+ unit +'('+param.percent+'%)'; 
                            },
                            fontSize: fz2,
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
                        data: d1,
                    },
                    {
                        radius: ['55%', '45%'],
                        center: ['50%', '50%'],
                        type: 'pie',
                        label: {
                            show: false
                        },
                        labelLine: {
                            show: false
                        },
                        animation: false,
                        tooltip: {
                            show: false
                        },
                        data: [{
                            value: 1,
                            itemStyle: {
                                color: "rgba(0,0,0,0.2)",
                            },
                        }],
                    }
                ]
            }
		    myChart.setOption(option);
        },
        chartBar: function(datas,id,type, name) {
            var myChart = echarts.init(document.getElementById(id));
            var color = [
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
            ];
            var option = {
                tooltip: {
                    trigger: "axis",
                    axisPointer: {
                        type: "shadow",
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
                    data: datas.xData,
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
                        color: '#009FF1'
                    }
                },
                yAxis: {
                    type : 'value',
                    axisLine : {
                        show : false,
                        lineStyle: {
                            color: '#009FF1',
                            opacity: .2
                        }
                    },
                    axisTick : {
                        show : false
                    },
                    splitLine: {
                        lineStyle: {
                            color: '#57617B',
                            opacity: .2
                        }
                    },
                    splitArea: {
                        show: false
                    },
                },
                series: {
                    name: name,
                    type: "bar",
                    barWidth: 20,
                    data: datas.data,
                    itemStyle: {
                        color: color[type]
                    }
                }
            }
            myChart.setOption(option);
        },
        chartElectric: function(d1){
            var myChart = echarts.init(document.getElementById("indexMap4"));
            var dataSource = [];
            var dataSource2 = [];
            var xAxisFlag = "";
            var m = new Date().getMonth()+1;
            var d = new Date().getDate();
            var today = '今日('+m+'-'+d+')';
            var yesteday = '昨日('+m+'-'+(d-1)+')';
            var led = [
                { name: today, icon: 'roundRect'},
                { name: yesteday, icon: 'roundRect'}
                ]
            for(var m=0;m<d1.today.length;m++){
                d1.today[m].value = d1.today[m].logPowAt;
            }
            for(var n=0;n<d1.yesterday.length;n++){
                d1.yesterday[n].value = d1.yesterday[n].logPowAt;
            }
            var fz = 18;
            if(this.width <= 1440){
                fz = 16;
            }
            if(this.width <= 1366){
                fz = 14;
            }
            var index = 0;
            var option = {
                title: {
                    show: false,
                    text: '企业用电负荷实时曲线（单位：万kw）',
                    textStyle:{
                        color: '#fff',
                        fontSize: fz
                    }
                },
                grid: {
                    right: 200,
                    left: 50,
                    bottom: 38,
                    top: 15
                },
                color: ['#3EB5E2','#C12424'],
                tooltip: {
                    show:true,
                    trigger: 'axis',
                    backgroundColor: '#fff',
                    textStyle:{
                        color:['#000']
                    },
                    formatter: function(params){
                        var d1 = params[0].axisValue + '<br>' + params[0].marker + params[0].seriesName + ':' + params[0].value + '万kw'; 
                        if(params[0].data.compNum) { d1 += '<br>&nbsp; &nbsp; 监测企业数量：' +  params[0].data.compNum};
                        var d2 = ''; 
                        if(params[1]){
                            d2 = '<br>' + params[1].marker + params[1].seriesName + ':' + params[1].value + '万kw'; 
                            if(params[1].data.compNum) { d2 += '<br>&nbsp; &nbsp; 监测企业数量：' +  params[1].data.compNum};
                        }
                        return d1 + d2
                    }
                },
                legend: {
                    show: true,
                    right: 0,
                    top: 15,
                    data: led,
                    textStyle: {
                        color: '#fff'
                    }
                },
                dataZoom: {
                    type: 'inside',
                    realtime: true,
                    start: 0,
                    end: 50
                },
                xAxis: {
                    data: d1.xAxis,
                    boundaryGap: true,
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: 'rgba(255,255,255,0.1)'
                        }
                    },
                    axisLabel: {
                        color: '#83ADBA'
                    }
                },
                yAxis: {
                    scale: true,
                    splitLine: {
                        lineStyle: {
                            color: 'rgba(255,255,255,0.1)'
                        }
                    },
                    axisLabel: {
                        color: '#83ADBA'
                    }
                },
                series: [
                    {
                        name: today,
                        type: 'line',
                        data: d1.today,
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                    offset: 0,
                                    color: '#FFD154'
                                }, {
                                    offset: 1,
                                    color: '#FF903E'
                                }], false),
                        symbolSize: 10,
                        smooth: true
                    },
                    {
                        name: yesteday,
                        type: 'line',
                        data: d1.yesterday,
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                    offset: 0,
                                    color: '#67F8B3'
                                }, {
                                    offset: 1,
                                    color: '#05A6FC'
                                }], false),
                        symbolSize: 10,
                        smooth: true
                    }
                ]
            };
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