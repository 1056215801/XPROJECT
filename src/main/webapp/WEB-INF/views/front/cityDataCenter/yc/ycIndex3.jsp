<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../common/commonPage_front.jsp"%>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>宜春市工业大数据中心</title>
<link href="${ctx}/static/css/cityDataCenter/yc_bigDataCenter.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<style type="text/css">
.statusTip {
    position: absolute;
    top: 0px;
    left: 0px;
    z-index: 10;
}
</style>
</head>
<body>
	<div class="data_main">
		<form action="" method="post" id="form">
			<input type="hidden" id="orgId" name="orgId" value="${orgId}">
			<input type="hidden" id="areaId" name="areaId" value="${areaId}">
			<input type="hidden" id="year" name="year" value="${searchInfo.year}">
			<input type="hidden" id="month" name="month" value="${searchInfo.month}">
			<input type="hidden" id="orderType" name="orderType" value="">
		</form>
		<div class="data_header">
			<img alt="" height="42px" src="${ctx}/static/image/cityDataCenter/yc/ycs-logo.png">
			<div class="local-date">
				<p>2018年1月1号</p>
				<h1>00:00:00</h1>
			</div>
			<div class="btnSelect">
				<button id="btnYear" class="dropdownButton" type="button">
					<span id="yearText">${searchInfo.year}年</span><span class="caret"></span>
				</button>
				<ul id="yearMenu" class="dropdownMenu">
					<c:if test="${! empty searchList.yearList}">
						<c:forEach items="${searchList.yearList}" var="info">
							<li><a href="javascript:;" onclick="selectByYear('${info.year}')">${info.year}年</a></li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			<div class="btnSelect" style="margin-right: 0%;">
				<button id="btnmonth" class="dropdownButton" type="button">
					<span id="monthText">${searchInfo.month}月</span>
					<span class="caret"></span>
				</button>
				<ul id="monthMenu" class="dropdownMenu">
					<c:if test="${! empty searchList.monthList}">
						<c:forEach items="${searchList.monthList}" var="info">
							<li><a href="javascript:;" onclick="selectByMonth('${info.month}')">${info.month}月</a></li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			<img class="statusTip" src="${ctx}/static/image/cityDataCenter/yc/jx.png" style="width:55px; cursor: pointer;" onclick="window.location.href='https://test.inpark.com.cn/XProject/front/dataCenter/organizationCount?orgId=3600009&linkId=3609009'">
		</div>
		<div class="data_content">
			<div class="economicData-county-title">
				各县（市、区）主要经济指标 <a class="btn_set" href="javascript:void(0);" onclick="chart()">
				<img src="${ctx}/static/image/cityDataCenter/yc/cur.png" />&nbsp;<font>曲线</font></a>
			</div>
			<div class="economicData-county-content">
				<div class="economicData-county-sortField">
					指标排位排名：&nbsp; <a class="btn_set" id="set1" href="javascript:void(0);" onclick="selectByOrderType('1')"><font>按工业增加值</font></a>&nbsp;
					<a class="btn_set" id="set2" href="javascript:void(0);" onclick="selectByOrderType('2')"><font>按主营业务收入</font></a>&nbsp;
					<a class="btn_set" id="set3" href="javascript:void(0);" onclick="selectByOrderType('3')"><font>按利润总额</font></a>&nbsp;
					<a class="btn_set" id="set4" href="javascript:void(0);" onclick="selectByOrderType('4')"><font>按工业投资</font></a>&nbsp;
					<a class="btn_set" id="set5" href="javascript:void(0);" onclick="selectByOrderType('5')"><font>按工业用电</font></a>
					<font style="float: right; color: #FFF; margin-right: 15px;">单位：亿元、百分比、万千瓦时</font>
				</div>
				<div class="economicData-county-tableView">
					<table cellspacing="0" cellpadding="0" id="econData"></table>
				</div>
			</div>
		</div>
	</div>
	<div class="btn_prev" onclick="window.location.href='${ctx}/front/cityDataCenter/index/1?orgId=${orgId}'"></div>
	<div class="btn_next" onclick="window.location.href='${ctx}/front/cityDataCenter/index/4?orgId=${orgId}'"></div>
	<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/cityDataCenter/index/4?orgId=${orgId}">
	
</body>
<script>
	function setTime() {
		var date = new Date();
		var localDate = date.getFullYear() + "年" + (date.getMonth() + 1) + "月" + date.getDate() + "日";
		var localSec = date.getSeconds();
		if (localSec < 10) {
			localSec = "0" + localSec;
		} else {
			localSec = date.getSeconds();
		}
		
		var localTime = date.getHours() + ":" + date.getMinutes() + ':' + localSec;
		$(".local-date p").text(localDate);
		$(".local-date h1").text(localTime);
	};

	$(function() {
		setTime();
		setInterval(setTime, 1000);
		$("#btnYear").click(function() {
			var div = $("#yearMenu");
			if (div.css("display") == "none") {
				div.slideDown("fast");
			} else {
				div.slideUp("fast");
			}
		});
		$("#btnmonth").click(function() {
			var div = $("#monthMenu");
			if (div.css("display") == "none") {
				div.slideDown("fast");
			} else {
				div.slideUp("fast");
			}
		});
		
		loadData();
		/*页面定时跳转事件*/
		initScreenSaver();
	});
	
	/*按年份搜索*/
	function selectByYear(year) {
		$("#yearMenu").slideUp("fast");
		$("#yearText").text(year + "年");
		$("#year").val(year);
		loadData();
	}

	/*按月搜索*/
	function selectByMonth(month) {
		$("#monthMenu").slideUp("fast");
		$("#monthText").text(month + "月");
		$("#month").val(month);
		loadData();
	}
	
	/*按排序搜索*/
	function selectByOrderType(orderType) {
		$("#orderType").val(orderType);
		loadData();
		$(".economicData-county-sortField a").each(function(){
			$(this).removeClass("btn_set1");
		})
		$("#set"+orderType).addClass("btn_set1");
	}
	
	function chart(){
		var year = $("#year").val();
		var month = $("#month").val();
		window.location.href="${ctx}/front/cityDataCenter/index/1?orgId=${orgId}&areaId=${areaId}&year="+year+"&month="+month;
	}
	
	function loadData(){
		var orgId = $("#orgId").val();
		var year = $("#year").val();
		var month = $("#month").val();
		var orderType = $("#orderType").val();
		$.ajax({
			url : "${ctx}/interface/json/cityDataCenter/yc/thirdPageData",
			type : "post",
			data : {
				"orgId" : orgId,
				"year" : year,
				"month" : month,
				"orderType" : orderType
			},
			success : function(result) {
				if (result.success) {
					$("#econData").empty();
					
					var tr1 = '<tr><td></td><td colspan="3">工业增加值</td><td colspan="3">主营业务收入</td><td colspan="3">利润总额</td><td colspan="3">工业投资</td><td colspan="3">工业用电</td></tr>';
					var tr2 = '<tr><td style="width: 12.5%;"></td><td style="width: 7.5%;">本月止累计</td><td style="width: 5%;">同比</td><td style="width: 5%;">排位</td><td style="width: 7.5%;">本月止累计</td><td style="width: 5%;">同比</td><td style="width: 5%;">排位</td><td style="width: 7.5%;">本月止累计</td><td style="width: 5%;">同比</td><td style="width: 5%;">排位</td><td style="width: 7.5%;">本月止累计</td><td style="width: 5%;">同比</td><td style="width: 5%;">排位</td><td style="width: 7.5%;">本月止累计</td><td style="width: 5%;">同比</td><td style="width: 5%;">排位</td></tr>';
					$("#econData").append(tr1).append(tr2);
					var econList = result.thirdPageData;
					if(econList.length == 0){
						var msg = '';
						if(month==1){
							msg = '1月份暂未纳入统计';
						}else{
							msg = month+'月份数据暂未公布';
						}
						var tr = '<tr><td colspan="16">'+msg+'</td></tr>';
						$("#econData").append(tr);
						$(".economicData-county-tableView table").css("height","120px");
					}else{
						for(var i=0;i<econList.length;i++){
							var info = econList[i];
							var index = ["gyzjz", "zyywsr", "lr", "gytz", "gyydl"];
							var tr = '<tr><td>'+info.orgName+'</td>';
							for(var j=0;j<index.length;j++){
								if(info[index[j]+"_value"]!=undefined){
									tr += '<td>'+info[index[j]+"_value"]+'</td>';
								}else{
									tr += '<td><font class="redFont"></font></td>';
								}
								
								
								if(info[index[j]+"_percent"]!=undefined){
									var percent = info[index[j]+"_percent"];
									if(percent==999999){
										percent = '增亏';
									}else if(percent==-999999){
										percent = '亏损';
									}else if(percent==-999998){
										percent = '扭亏';
									}else if(percent==-999997){
										percent = '减亏';
									}
									tr += '<td>'+percent+'</td>';
								}else{								
									tr += '<td><font class="redFont"></font></td>';
								}
								
								tr += '<td>'+(info[index[j]+"_order"]==undefined?'':info[index[j]+"_order"]);
								if(info[index[j]+"_orderType"]==1){
									tr += '<img src="${ctx}/static/image/cityDataCenter/yc/up.png" /></td>';
								}else if(info[index[j]+"_orderType"]==0){
									tr += '<img src="${ctx}/static/image/cityDataCenter/yc/down.png" /></td>';
								}else{
									tr += '</td>';
								}
							}
							tr += '</tr>';
							$("#econData").append(tr);
							$(".economicData-county-tableView table").css("height","100%");
						}
					}
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}

		});
		
	}
	
	/*鼠标滚轮滚动事件*/
	var scrollFunc=function(e){     
	    e=e || window.event; 
	    if(e.wheelDelta){//IE/Opera/Chrome     
	        if(e.wheelDelta>0){
	        	window.location.href="${ctx}/front/cityDataCenter/index/6?orgId=${orgId}";
	        }else{ //向下滚动事件 
	        	window.location.href="${ctx}/front/cityDataCenter/index/4?orgId=${orgId}";
	        }  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) { //向上滚动事件  
	        	 window.location.href="${ctx}/front/cityDataCenter/index/6?orgId=${orgId}";
	         }else{ //向下滚动事件 
	        	 window.location.href="${ctx}/front/cityDataCenter/index/4?orgId=${orgId}";
	         }  
	    }  
	}   
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome 
</script>
</html>
