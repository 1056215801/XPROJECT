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
    <link rel="stylesheet" href="${ctx}/static/plugins/swiper/swiper.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/cityDataCenter/index.css">
</head>
<body class="gray-bg gytz">
	<div class="head">
        <div class="logo-box" onclick="location.href='${ctx}/front/cityDataCenter/commonIndex/${entranceId}'">
            <img id="logo" alt="">
            <p id="now">2019年02月12日 星期二</p>
        </div>
        <div class="tab">
            <a href="${ctx}/front/commonDataCenter/index/${entranceId}" class="head-a">首页</a>
            <a href="${ctx}/front/commonDataCenter/qyhx/${entranceId}" class="head-a on">企业画像</a>
            <a href="${ctx}/front/commonDataCenter/yygl/${entranceId}" class="head-a">运营管理</a>
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
        <div class="spanStyle" style="width: 27.5%;">
            <div class="blockStyle" style="height: 30%;">
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                    <div class="tabCaptionBar">
                        <span class="tabCaption">经济运行总览</span>
                    </div>
                    <div class="tabContBar">
                        <div class="tabCont">
                            <i></i>
                            <div class="verCenter">
                                <div class="ringItem" v-for="item in yxzlList">
                                    <img src="${ctx}/static/image/cityDataCenter/common/ringOrange.png">
                                    <div class="ringMiddle">
                                        <div class="ringValue" id="zyywsr-value" v-cloak>{{ item.value }}</div>
                                        <div class="ringUnit" id="zyywsr-unit" v-cloak>{{ item.unit }}</div>
                                    </div>
                                    <p id="zyywsr-name" v-cloak>{{ item.title }}</p>
                                </div>
                            </div>
                        </div>
                            
                    </div>
                </div>
            </div>
            <div class="blockStyle" style="height: calc(35% - 20px);">
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                    <div class="tabCaptionBar">
                        <span class="tabCaption">企业单位生产总值能耗情况</span>
                    </div>
                    <div class="tabContBar">
                        <div id="chart1" style="height: 100%;"></div>
                        <div class="chartUnit">单位：万度/万元</div>
                    </div>
                </div>
            </div>
            <div class="blockStyle" style="height: calc(35% - 20px);">
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                    <div class="tabCaptionBar">
                        <span class="tabCaption">全员劳动生产率</span>
                    </div>
                    <div class="tabContBar">
                        <div id="chart2" style="height: 100%;"></div>
                        <div class="chartUnit">单位：万元/人</div>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="spanStyle" style="width: calc(45% - 10px);">
            <div class="blockStyle" style="height: 70%;">
                <div class="tabCaptionBar">
                    <span class="tabCaption" style="width: calc(100% - 147px); cursor: pointer;">
                        <div id="companyTitleName" style="display: inline-block; vertical-align: middle;" v-cloak>{{ company.companyName }}</div>
                        <!-- <i class="fa fa-caret-down"></i> -->
                    </span>
                    <div class="fr selects" style="cursor: pointer;">
                        <div class="select">
                            <img src="${ctx}/static/image/cityDataCenter/common/xyjc.png" width="16">
                            <span>企业信用决策报告</span>
                        </div>
                    </div>
                </div>
                <div class="tabContBar">
                    <div style="padding: 10px 30px;">
                        <div class="inlineBox" style="height: 200px;">
                            <div class="outsideBox" onclick="companyGSInfo()" style="cursor: pointer;">
                                <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                                <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                                <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                                <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                                <div class="companyLogo">
                                    <i></i>
                                    <img id="logoUrl" src="${ctx}/static/image/cityDataCenter/common/default.png">
                                </div>
                                <div class="gsSign"><img src="${ctx}/static/image/cityDataCenter/common/gsxx.png"></div>
                            </div>
                        </div>
                        <div class="inlineBox" style="height: 200px;">
                            <div id="mapChart" style="height: 100%;"></div>
                        </div>
                    </div>
                    <div class="indexDataBar">
                        <i></i>
                        <div class="verCenter">
                            <div class="ringItem" style="width: 25%;">
                                <img id="ssqy" src="${ctx}/static/image/cityDataCenter/common/ssqy.png" width="120" :class="{'op3': !company.ssqy}">
                            </div>
                            <div class="ringItem" style="width: 25%;">
                                <img id="lhrh" src="${ctx}/static/image/cityDataCenter/common/lhrh.png" width="120" :class="{'op3': !company.ssqy}">
                            </div>
                            <div class="ringItem" style="width: 25%;">
                                <img id="gxjs" src="${ctx}/static/image/cityDataCenter/common/gxjs.png" width="120" :class="{'op3': !company.ssqy}">
                            </div>
                            <div class="ringItem" style="width: 25%;">
                                <img id="zjtx" src="${ctx}/static/image/cityDataCenter/common/zjtx.png" width="120" :class="{'op3': !company.ssqy}">
                            </div>
                        </div>
                    </div>
                    <div class="businessInfoBar">
                        <div class="businessInfo" v-for="item in company.list">
                            <div class="outsideBox">
                                <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                                <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                                <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                                <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                                <div class="businessBox">
                                    <i></i>
                                    <div class="verCenter">
                                        <div class="businessName" v-cloak>{{ item.name }}</div>
                                        <div class="businessValue" v-cloak>{{ item.value }}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="blockStyle" style="height: calc(30% - 20px);">
                <div class="inlineBox">
                    <!-- <div id="switchVideo" class="switchVideo">非实时</div> -->
                    <div class="videoBar" id="video">
                        <!-- <iframe id="videoIframe" src="https://testfile.inpark.com.cn/AttachmentPortal/hls3.jsp?cameraUuid=e39f4270900345d8a930cac6e99342b4" frameborder="0" scrolling="auto" style="width:92%; height:100%; overflow:hidden;"></iframe> -->
                        <iframe id="videoIframe" src="https://testfile.inpark.com.cn/AttachmentPortal/hls3.jsp?cameraUuid=ceb5e7d49e3846639a6bc6864e6c444e" frameborder="0" scrolling="auto" style="width:92%; height:100%; overflow:hidden; display: none;"></iframe>
                        <img id="noRealTime" src="${ctx}/static/image/cityDataCenter/common/comVideo1.gif" width="92%;" style="padding: 8px;">
                    </div>
                </div>
                <div class="inlineBox">
                    <div class="outsideBox">
                        <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                        <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                        <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                        <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                        <div class="tabCaptionBar">
                            <span class="tabCaption">企业关联图谱</span>
                        </div>
                        <div class="tabContBar">
                            <div id="graphChart" style="height: 100%;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="spanStyle" style="width: calc(27.5% - 10px);">
            <div class="blockStyle" style="height: 35%;">
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                    <div class="tabCaptionBar">
                        <span class="tabCaption">企业风险</span>
                        <span class="creditGrade" title="">A 级 (守信企业)</span>
                    </div>
                    <div class="tabContBar">
                        <div id="radarChart" style="height: 100%;"></div>
                    </div>
                </div>
            </div>
            <div class="blockStyle" style="height: calc(30% - 20px);">	
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                    <div class="tabCaptionBar">
                        <span class="tabCaption unScreen" data="3">
                            <span :class="{'on': showIndex == 0}" @click="showIndex = 0">企业产品</span>
                            <span :class="{'on': showIndex == 1}" @click="showIndex = 1">用工招聘</span>
                        </span>
                    </div>
                    <div class="tabContBar">
                        <div class="tabCont" v-show="showIndex == 0">
                            <div class="swiper-container loop-swiper" id="swiper" style="height: 100%;">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide" v-for="item in qycpList">
                                        <i></i>
                                        <img :src="item.url != '' ? item.url : '${ctx}/static/image/cityDataCenter/common/default.png'" :title="item.title">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tabCont" v-show="showIndex == 1">
							<div class="recruit">
								<div class="recruit-box">
									<ul id="recruit" class="roll">
                                        <li v-for="item in ygzpList">
                                            <p>
                                                <span class="recruit-title" v-cloak>{{ item.title }}（共{{ item.num }}人）</span>
                                                <span v-cloak>{{ item.time }}</span>
                                                <div class="clearfix"></div>
                                            </p>
                                            <span class="recruit-content" v-cloak>{{ item.desc }}</span>
                                        </li>
                                        <li v-for="item in ygzpList">
                                            <p>
                                                <span class="recruit-title" v-cloak>{{ item.title }}（共{{ item.num }}人）</span>
                                                <span v-cloak>{{ item.time }}</span>
                                                <div class="clearfix"></div>
                                            </p>
                                            <span class="recruit-content" v-cloak>{{ item.desc }}</span>
                                        </li>
									</ul>
								</div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="blockStyle" style="height: calc(35% - 20px);">
                <div class="outsideBox">
                    <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                    <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                    <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                    <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                        <div class="tabCaptionBar">
                        <span class="tabCaption">企业知识产权</span>
                    </div> 
                    <div class="tabContBar">
                        <div class="comPowerBar">
                            <div class="comPower" v-for="item in zscqList">
                                <i></i>
                                <span class="comPowerName" v-cloak>{{ item.title }}</span>
                                <div class="comPowerProcess">
                                    <div :style="{width: item.value/100*100+'%'}"></div>
                                </div>
                                <span class="comPowerValue" v-cloak>{{ item.value }}</span>
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
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script src="https://api.map.baidu.com/api?v=2.0&ak=2b82bdceb647d5f7819514f45c752413"></script>
<script>
var app = new Vue({
    el: '#content',
    data: {
        width: 1920,
        zscqList: [],
        yxzlList: [],
        qycpList: [],
        ygzpList: [],
        company: "",
        showIndex: 0
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

            this.zscqList = qyhxData.zscqList;
            this.yxzlList = qyhxData.yxzlList;
            this.company = qyhxData.company;
            this.qycpList = qyhxData.qycpList;
            this.ygzpList = qyhxData.ygzpList;
            this.chartLine(qyhxData.nhData, 'chart1', 1, '企业单位生产总值能耗情况');
            this.chartLine(qyhxData.sclData, 'chart2', 0, '全员劳动生产率');
            this.chartGraph(qyhxData.qyglData);
            this.chartBar(qyhxData.qyfxData)

            var swiper = new Swiper('#swiper', {
                autoplay:true,
                slidesPerView :3,
                slidesPerGroup : 1,
                spaceBetween : 10,
                observer:true
            });
            this.baiduMap()
        },
        chartLine: function(data,id,type, name){
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
                    name: name,
                    type: 'line',
                    data: data.data,
                    symbolSize: 0,
                    smooth: true,
                    color: color[type],
                    areaStyle: {
                        color: color[type],
                        opacity: 0.2,
                    }
                }]
            };
		    myChart.setOption(option);
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
        chartGraph: function(datas) {
            var myChart = echarts.init(document.getElementById("graphChart"));
            var option = {
                tooltip: {
                    show: false
                },
                animationDurationUpdate: 1500,
                animationEasingUpdate: 'quinticInOut',
                series : [{
                    type: 'graph',
                    layout: 'none',
                    symbolSize: 50,
                    roam: true,
                    label: {
                        normal: {
                            show: true
                        }
                    },
                    edgeSymbol: ['circle', 'arrow'],
                    edgeSymbolSize: [4, 10],
                    edgeLabel: {
                        normal: {
                            textStyle: {
                                fontSize: 20
                            }
                        }
                    },
                    data: [{
                        name: datas.point[0].title,
                        x: 300,
                        y: 300,
                        itemStyle: {
                            color: "#FD485E",
                        },
                        label: {
                            show: true,
                            formatter:function(params){
                                return datas.point[0].value;
                            }
                        },
                        symbolSize: [76,76],
                    },{
                        name: datas.point[1].title,
                        x: 200,
                        y: 100,
                        itemStyle: {
                            color: "#3E63FC",
                        },
                        label: {
                            show: true,
                            formatter:function(params){
                                return datas.point[1].value;
                            },
                        },
                        symbolSize: [49,49],
                    },{
                        name: datas.point[2].title,
                        x: 0,
                        y: 200,
                        itemStyle: {
                            color: "#3E63FC",
                        },
                        symbolSize: [49,49],
                    },{
                        name: datas.point[3].title,
                        x: 20,
                        y: 390,
                        itemStyle: {
                            color: "#3E63FC",
                        },
                        symbolSize: [49,49],
                    },{
                        name: datas.point[4].title,
                        x: 600,
                        y: 180,
                        itemStyle: {
                            color: "#3E63FC",
                        },
                        symbolSize: [49,49],
                    }],
                    links: [{
                        source: datas.line[0].from,
                        target: datas.line[0].to,
                        label: {
                            show: true,
                            formatter: datas.line[0].label,
                            fontSize: 10,
                        },
                        lineStyle: {
                            color: '#3E63FC'
                        },
                    },{
                        source: datas.line[1].from,
                        target: datas.line[1].to,
                        label: {
                            show: true,
                            formatter: datas.line[1].label,
                            fontSize: 10,
                        },
                        lineStyle: {
                            color: '#3E63FC'
                        },
                    },{
                        source: datas.line[2].from,
                        target: datas.line[2].to,
                        label: {
                            show: true,
                            formatter: datas.line[2].label,
                            fontSize: 10,
                        },
                        lineStyle: {
                            color: '#3E63FC'
                        },
                    },{
                        source: datas.line[3].from,
                        target: datas.line[3].to,
                        label: {
                            show: true,
                            formatter: datas.line[3].label,
                            fontSize: 10,
                        },
                        lineStyle: {
                            color: '#3E63FC'
                        },
                    }],
                    lineStyle: {
                        normal: {
                            opacity: 0.9,
                            width: 2,
                            curveness: 0
                        }
                    }
                }]
            };
		    myChart.setOption(option);
        },
        chartBar: function(datas) {
            var myChart = echarts.init(document.getElementById("radarChart"));
            var option = {
                tooltip: {
                    confine: true,
                    textStyle: {
                        fontSize: 12,
                    }
                },
                radar: {
                    triggerEvent: true,
                    name: {
                        textStyle: {
                            color: '#fff',
                            backgroundColor: '#999',
                            borderRadius: 3,
                            padding: [3, 5]
                    }
                    },
                    axisLine: {
                        lineStyle: {
                            color: ['#FFF'],
                            width: 2,
                            opacity: 0.2,
                        },
                    },
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: ['#03E0C2'],
                            width: 2,
                            opacity: 0.2,
                        },
                    },
                    splitArea: {
                        show: true,
                        areaStyle: {
                            color: ['#989CB8'],
                            opacity: 0.2,
                        },
                    },
                    indicator: datas.xData
                },
                series: [{
                    name: '企业风险',
                    type: 'radar',
                    lineStyle: {
                        color: '#FFC14A',
                    },
                    areaStyle: {
                        color: '#FF9853',
                        opacity: 0.4,
                    },
                    data : datas.data
                }]
            };
            myChart.setOption(option);
        },
        baiduMap: function(datas){
            var long = this.company.addressLongitude
            var lati = this.company.addressLatitude
            var map = new BMap.Map("mapChart");
            var point = new BMap.Point(long,lati);
            map.centerAndZoom(point, 15); 
            
            //底层地图替换主题. 模板页可以查看http://lbsyun.baidu.com/custom/list.htm      
            map.setMapStyle({style:'midnight'});
            
            var ringIcon = new BMap.Icon("${ctx}/static/image/cityDataCenter/common/redRing.png", new BMap.Size(110,110));
            var marker3 = new BMap.Marker(point,{icon:ringIcon}); 
            map.addOverlay(marker3);
            
            var pointIcon = new BMap.Icon("${ctx}/static/image/cityDataCenter/common/point.png", new BMap.Size(27,37),{anchor: new BMap.Size(13.5, 37)});
            var marker1 = new BMap.Marker(point,{icon:pointIcon}); 
            map.addOverlay(marker1); 
            var n = -(this.company.companyName.length*10-8)/2;//计算label水平位移距离
            var label = new BMap.Label("<div style='text-align:center;'>"+this.company.companyName+"</div>",{offset:new BMap.Size(n,35)});
            marker1.setLabel(label);
            label.setStyle({
                color : "#FFF",
                backgroundColor: "rgba(0,0,0,0)",//文本背景色
                //borderColor:'#0F90D2',//文本框边框色
                fontSize : "12px",
                width : "0px",
                height : "0px",
                border : "none",
                lineHeight : "20px",
                cursor: "pointer"
            });
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