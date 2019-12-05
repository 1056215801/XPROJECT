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
<body class="gray-bg bg7">
	<div class="head">
        <div class="logo-box" onclick="location.href='${ctx}/front/cityDataCenter/commonIndex/${entranceId}'">
            <img id="logo" src="${ctx}/static/image/cityDataCenter/common/logo.png" alt="">
            <p id="now">2019年02月12日 星期二</p>
        </div>
        <div class="tab">
            <a href="${ctx}/front/commonDataCenter/index/${entranceId}" class="head-a">首页</a>
            <a href="${ctx}/front/commonDataCenter/qyhx/${entranceId}" class="head-a">企业画像</a>
            <a href="${ctx}/front/commonDataCenter/yygl/${entranceId}" class="head-a">运营管理</a>
            <a href="${ctx}/front/commonDataCenter/gytz/${entranceId}" class="head-a">工业投资</a>
            <a href="${ctx}/front/commonDataCenter/scjc/${entranceId}" class="head-a">生产监测</a>
            <a href="${ctx}/front/commonDataCenter/jcss/${entranceId}" class="head-a">基础设施</a>
            <a href="${ctx}/front/commonDataCenter/yjzh/${entranceId}" class="head-a on">应急指挥</a>
        </div>
        <a href="javascript:;" class="currentTime"><em id="time"></em></a>
        <div class="time">
            <a href="javascript:;" id="nologin"><img src="${ctx}/static/image/cityDataCenter/common/peo.png"><em>登录</em></a>
            <a href="javascript:;" style="display:none;" id="login"><img src="${ctx}/static/image/cityDataCenter/common/peo.png"><em class="accountName">${accountName}</em><img width="18" src="${ctx}/static/image/cityDataCenter/common/logout Data.png"><font onclick="logout()">退出</font></a>
        </div>
    </div>
    <div class="content yjzh" id="content">
    </div>
</body>
<script src="${ctx}/static/js/vue.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/dataCenter/${entranceId}.js"></script>
<script>
var app = new Vue({
    el: '#content',
    data: {
        width: 1920
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