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
<body class="gray-bg">
	<div class="head">
        <div class="logo-box" onclick="location.href='${ctx}/front/cityDataCenter/commonIndex/${entranceId}'">
            <img id="logo" src="" alt="">
            <p id="now">2019年02月12日 星期二</p>
        </div>
        <div class="tab">
            <a href="${ctx}/front/commonDataCenter/index/${entranceId}" class="head-a on">首页</a>
            <a href="${ctx}/front/commonDataCenter/qyhx/${entranceId}" class="head-a">企业画像</a>
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
    	<div class="spanStyle" style="width: 25%;">
    		<div class="blockStyle" style="height: 55%;">
    			<div class="tabHeadlineBar">
					<span class="tabHeadline"><i></i><span>园区统计信息</span></span>
					<img src="${ctx}/static/image/cityDataCenter/common/decorate.png">
				</div>
				<div class="tabContBar">
					<div class="blockStyle" style="height: 25%;">
						<div class="spanStyle">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">工业园名称</span>
								</div>
								<div class="tabTitleBar">
									<i></i>
									<span class="tabDataName" v-cloak>{{ infor.parkName }}</span>
								</div>
							</div>
						</div>
                    </div>
                    <div class="blockStyle" style="height: calc(25% - 10px);">
                        <div class="spanStyle" style="width: 50%;">
                            <div class="outsideBox">
                                <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                                <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                                <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                                <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                                <div class="tabCaptionBar">
                                    <span class="tabCaption">规划面积</span>
                                </div>
                                <div class="tabTitleBar" >
                                    <i></i>
                                     <span class="tabDataName contBar" id="contBar1">
                                        <span class="tabDataValue" style="font-size:30px;" v-cloak>{{ infor.ghmj }}</span>
                                        <span class="tabDataUnit" style="top: 5px;">亩</span>
                                     </span>
                                </div>
                            </div>
                        </div>
                        <div class="spanStyle" style="width: calc(50% - 10px);">
                            <div class="outsideBox">
                                <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                                <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                                <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                                <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                                <div class="tabCaptionBar">
                                    <span class="tabCaption">企业总数</span>
                                </div>
                               <div class="tabTitleBar" >
                                    <i></i>
                                     <span class="tabDataName contBar" id="contBar2">
                                        <span class="tabDataValue" style="font-size:30px;" v-cloak>{{ infor.qyzs }}</span>
                                        <span class="tabDataUnit" style="top: 5px;">家</span>
                                     </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="blockStyle" style="height: calc(25% - 10px);">
                        <div class="spanStyle" style="width: 50%;">
                            <div class="outsideBox">
                                <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                                <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                                <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                                <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                                <div class="tabCaptionBar">
                                    <span class="tabCaption">资产总计</span>
                                </div>
                                <div class="tabTitleBar" >
                                    <i></i>
                                     <span class="tabDataName contBar" id="contBar1">
                                        <span class="tabDataValue" style="font-size:30px;" v-cloak>{{ infor.zczj }}</span>
                                        <span class="tabDataUnit" style="top: 5px;">亿元</span>
                                     </span>
                                </div>
                            </div>
                        </div>
                        <div class="spanStyle" style="width: calc(50% - 10px);">
                            <div class="outsideBox">
                                <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                                <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                                <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                                <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                                <div class="tabCaptionBar">
                                    <span class="tabCaption">工业销售产值</span>
                                </div>
                               <div class="tabTitleBar" >
                                    <i></i>
                                     <span class="tabDataName contBar" id="contBar2">
                                        <span class="tabDataValue" style="font-size:30px;" v-cloak>{{ infor.gyxscz }}</span>
                                        <span class="tabDataUnit" style="top: 5px;">亿元</span>
                                     </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="blockStyle" style="height: calc(25% - 10px);">
                        <div class="spanStyle" style="width: 50%;">
                            <div class="outsideBox">
                                <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                                <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                                <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                                <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                                <div class="tabCaptionBar">
                                    <span class="tabCaption">主营业务收入</span>
                                </div>
                                <div class="tabTitleBar" >
                                    <i></i>
                                     <span class="tabDataName contBar" id="contBar1">
                                        <span class="tabDataValue" style="font-size:30px;" v-cloak>{{ infor.zyywsr }}</span>
                                        <span class="tabDataUnit" style="top: 5px;">亿元</span>
                                     </span>
                                </div>
                            </div>
                        </div>
                        <div class="spanStyle" style="width: calc(50% - 10px);">
                            <div class="outsideBox">
                                <img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
                                <img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
                                <img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
                                <img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
                                <div class="tabCaptionBar">
                                    <span class="tabCaption">利润总额</span>
                                </div>
                               <div class="tabTitleBar" >
                                    <i></i>
                                     <span class="tabDataName contBar" id="contBar2">
                                        <span class="tabDataValue" style="font-size:30px;" v-cloak>{{ infor.lrze }}</span>
                                        <span class="tabDataUnit" style="top: 5px;">亿元</span>
                                     </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    		<div class="blockStyle" style="height: calc(45% - 20px);">
    			<div class="tabHeadlineBar">
					<span class="tabHeadline"><i></i><span>产业主营收入</span></span>
					<img src="${ctx}/static/image/cityDataCenter/common/decorate.png">
				</div>
				<div class="tabContBar">
					<div class="outsideBox">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
						<div id="indexMap1" class="mapContent"></div>
					</div>
				</div>
    		</div>
        </div>
        <div class="spanStyle" style="width: calc(50% - 10px);"></div>
    	<div class="spanStyle" style="width: calc(25% - 10px);">
    		<div class="blockStyle" style="height: 55%;">
    			<div class="tabHeadlineBar">
					<span class="tabHeadline"><i></i><span>规上企业</span></span>
					<img src="${ctx}/static/image/cityDataCenter/common/decorate.png">
				</div>
				<div class="tabContBar">
					<div class="blockStyle" style="height: 25%;">
						<div class="spanStyle">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">企业名称</span>
								</div>
								<div class="tabTitleBar" style="cursor: pointer;" @click="show = !show">
									<i></i>
									<span class="tabDataName" v-cloak>{{ companyInfor.qymc }}</span>
									<span class="eject_caret"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="blockStyle" style="height: calc(25% - 10px);">
						<div class="spanStyle">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">所属行业</span>
								</div>
								<div class="tabTitleBar">
									<i></i>
									<span class="tabDataName" v-cloak>{{ companyInfor.sshy }}</span>
								</div>
							</div>
						</div>
					</div>
					<div class="blockStyle" style="height: calc(25% - 10px);">
						<div class="spanStyle">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">企业性质</span>
								</div>
								 <div class="tabTitleBar" >
									<i></i>
                                    <span class="tabDataName" v-cloak>{{ companyInfor.qyxz }}</span>
								</div>
							</div>
						</div>
					</div>
					<div class="blockStyle" style="height: calc(25% - 10px);">
						<div class="spanStyle">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">注册资本</span>
								</div>
							    <div class="tabTitleBar" >
									<i></i>
									 <span class="tabDataName contBar">
										<span class="tabDataValue" style="font-size:30px;" v-cloak>{{ companyInfor.zczb }}</span>
										<span class="tabDataUnit" style="top: 5px;">万元</span>
									 </span>
								</div>
							</div>
						</div>
                    </div>
                    <div class="company-box" v-show="show">
                        <div class="company-item" v-for="item in companyList" @click="handelClick(item)" v-cloak>{{ item.qymc }}</div>
                    </div>
				</div>
            </div>
    		<div class="blockStyle" style="height: calc(45% - 20px);">
    			<div class="tabHeadlineBar">
					<span class="tabHeadline"><i></i><span>产业体系</span></span>
					<img src="${ctx}/static/image/cityDataCenter/common/decorate.png">
				</div>
				<div class="tabContBar">
					<div class="outsideBox">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
						<div id="products" class="mapContent tagcloud">
                            <a :class="item.size + ' ' + item.color" href="javascript:;" v-for="item in indexList">
                                <div class="middle-box">
                                    <img :src="item.image">
                                    <p v-cloak>{{ item.name }}</p>
                                </div>
                            </a>
                        </div>
					</div>
				</div>
    		</div>
        </div>
    </div>
</body>
<script src="${ctx}/static/js/vue.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/dataCenter/ycAnimate.js"></script>
<script src="${ctx}/static/js/dataCenter/${entranceId}.js"></script>
<script>
var app = new Vue({
    el: '#content',
    data: {
        width: 1920,
        infor: "",
        companyList: [],
        indexList: [],
        companyInfor: "",
        show: false
    },
    mounted: function() {
        this.getInfor()
        this.getTime()
    },
    methods: {
        getInfor: function() {
            this.width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
            this.infor = indexData.infor
            this.companyList = indexData.companyList
            this.indexList = indexData.list
            this.companyInfor = this.companyList[0]
            $("title").text(indexData.title)
            $("#logo").attr("src",indexData.logo)
            setTimeout(function(){
                animat()
            }, 100)

            this.chart1(indexData.chart1.list, indexData.chart1.total, '亿元', 'indexMap1', '总投资（亿元）')
            console.log(indexData)
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
        },
        handelClick: function(item){
            this.show = !this.show;
            this.companyInfor = item
        },
        chart1: function(d1, t, unit, id, subTitle) {
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
                        radius: ['33%', '61%'],
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
                        radius: ['45%', '33%'],
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
        }
    }
})
</script>
</html>