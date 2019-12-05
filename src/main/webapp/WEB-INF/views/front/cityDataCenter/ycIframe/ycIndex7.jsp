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
<script type="text/javascript" src="${ctx}/static/js/dataCenter/noData.js"></script>
<style type="text/css">
.test_{
	background:url(${ctx}/static/image/cityDataCenter/yc/back-line.png) no-repeat ;
	background-size:100% 100%; 
}
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
			<input type="hidden" id="year" name="year" value="${searchInfo.year}">
			<input type="hidden" id="quarter" name="quarter" value="${searchInfo.quarter}">
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
				全市主导产业的经济指标情况 <a class="btn_set" href="javascript:void(0);" onclick="chart()">
				<img src="${ctx}/static/image/cityDataCenter/yc/cur.png" />&nbsp;<font>曲线</font></a>
			</div>
			<div class="economicData-county-content">
				<div class="economicData-county-sortField">
					指标累计排名：&nbsp; <a class="btn_set" id="set1" href="javascript:void(0);" onclick="selectByOrderType('1')"><font>按工业增加值</font></a>&nbsp;
					<a class="btn_set" id="set2" href="javascript:void(0);" onclick="selectByOrderType('2')"><font>按主营业务收入</font></a>&nbsp;
					<a class="btn_set" id="set3" href="javascript:void(0);" onclick="selectByOrderType('3')"><font>按利润</font></a>&nbsp;
					<a class="btn_set" id="set4" href="javascript:void(0);" onclick="selectByOrderType('4')" style="display: none;" id="ls"><font>按利税</font></a>&nbsp;
					<font style="float: right; color: #FFF; margin-right: 15px;">单位：亿元、百分比</font>
				</div>
				<div class="economicData-county-tableView e-c-tV7">
					<table cellspacing="0" cellpadding="0" id="econData"></table>
				</div>
			</div>
		</div>
	</div>
	
	<div class="btn_prev" onclick="window.location.href='${ctx}/front/cityDataCenter/index/4?orgId=${orgId}'"></div>
	<div class="btn_next" onclick="window.location.href='${ctx}/front/cityDataCenter/index/1?orgId=${orgId}'"></div>
	<input type="hidden" id="nextPageUrl" name="nextPageUrl" value="${ctx}/front/cityDataCenter/index/1?orgId=${orgId}">
	
</body>
<script type="text/javascript">
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
		$("#btnQuarter").click(function() {
			var div = $("#quarterMenu");
			if (div.css("display") == "none") {
				div.slideDown("fast");
			} else {
				div.slideUp("fast");
			}
		});
		$("div[name='title']").click(function() {
			$("div[name='title']").each(function(a, item) {
				if (item.className == 'echarts-title1') {
					item.className = 'echarts-title';
				}
			});
			$(this).removeClass('echarts-title');
			$(this).addClass('echarts-title1');
			$("div[name='title']").each(function(b, item) {
				if (item.className == 'echarts-title1') {
					$("div[name='echarts-map']").each(function(a, item) {
						if (a == b) {
							item.className = 'echarts-map';
						} else {
							item.className = 'echarts-map1';
						}
					});
				}
			});
		});
		
		loadData();
		/*页面定时跳转事件*/
		initScreenSaver();
	})
	
	/*按年份搜索*/
	function selectByYear(year) {
		$("#yearMenu").slideUp("fast");
		$("#yearText").text(year + "年");
		$("#year").val(year);
		loadData();
	}
	
	/*按季度搜索*/
	function selectByQuarter(quarter) {
		$("#quarterMenu").slideUp("fast");
		$("#quarterText").text("第" + (quarter == 4 ? '四' : quarter == 3 ? '三' : quarter == 2 ? '二' : '一') + "季度");
		$("#quarter").val(quarter);
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
		window.location.href="${ctx}/front/cityDataCenter/index/6?orgId=${orgId}&areaId=${areaId}";
	}
	
	function loadData(){
		var orgId = $("#orgId").val();
		var year = $("#year").val();
		var quarter = $("#quarter").val();
		var orderType = $("#orderType").val();
		$.ajax({
			url : "${ctx}/interface/json/cityDataCenter/yc/seventhPageData",
			type : "post",
			data : {
				"orgId" : orgId,
				"year" : year,
				"quarter" : quarter,
				"orderType" : orderType
			},
			success : function(result) {
				if (result.success) {
					$("#econData").empty();
					
					var tr1 = '';
					var tr2 = '';
					var index = null;
					
					if(year==2017){
						tr1 = '<tr><td rowspan="2" style="width: 3%; font-size: 14px;">序<br />号 </td><td class="test_" rowspan="2" style="text-align: right; border-bottom: none; font-size: 14px; padding-right: 10px;width: 10%;"><div style="text-align: right;">项目</div><div style="text-align: left;padding-left: 10px;">行业</div></td><td colspan="3">工业增加值</td> <td colspan="3">主营业务收入</td> <td colspan="3">利润</td> </tr>';
						tr2 = '<tr><td style="width: 10%;">本年累计</td><td style="width: 9%;">增幅</td><td style="width: 10%;">占全部比重</td><td style="width: 10%;">本年累计</td><td style="width: 9%;">增幅</td><td style="width: 10%;">占全部比重</td><td style="width: 10%;">本年累计</td><td style="width: 9%;">增幅</td><td style="width: 10%;">占全部比重</td></tr>';
						index = ["gyzjz", "zyywsr", "lr"];
						$("#ls").hide();
					}else{
						tr1 = '<tr><td rowspan="2" style="width: 3%; font-size: 14px;">序<br />号 </td><td class="test_" rowspan="2" style="text-align: right; border-bottom: none; font-size: 14px; padding-right: 10px;width: 10%;"><div style="text-align: right;">项目</div><div style="text-align: left;padding-left: 10px;">行业</div></td><td colspan="3">工业增加值</td> <td colspan="3">主营业务收入</td> <td colspan="3">利润</td> <td colspan="3">利税</td></tr>';
						tr2 = '<tr><td style="width: 8%;">本年累计</td><td style="width: 6%;">增幅</td><td style="width: 8%;">占全部比重</td><td style="width: 8%;">本年累计</td><td style="width: 6%;">增幅</td><td style="width: 8%;">占全部比重</td><td style="width: 8%;">本年累计</td><td style="width: 6%;">增幅</td><td style="width: 8%;">占全部比重</td><td style="width: 8%;">本年累计</td><td style="width: 6%;">增幅</td><td style="width: 8%;">占全部比重</td></tr>';
						index = ["gyzjz", "zyywsr", "lr", "ls"];
						$("#ls").show();
					}
					
					$("#econData").append(tr1).append(tr2);
					
					var econList = result.seventhPageData;
					for(var i=0;i<econList.length;i++){
						var info = econList[i];
						var tr = '';
						if(i==0||i==(econList.length-1)){
							tr += '<tr><td style="border-right: none;"></td>';
							tr += '<td style="border-left: none;">'+info.name+'</td>';
						}else{
							tr += '<tr><td>'+i+'</td>';
							tr += '<td>'+info.name+'</td>';
						}
						
						for(var j=0;j<index.length;j++){
							if(info[index[j]+"_value"]==null){
								tr += '<td></td>';
							}else if(info[index[j]+"_value"]>=0){
								tr += '<td>'+info[index[j]+"_value"]+'</td>';
							}else{
								tr += '<td><font class="redFont"></font></td>';
							}
							
							if(info[index[j]+"_percent"]==null){
								tr += '<td></td>';
							}else if(info[index[j]+"_percent"]>=0){
								tr += '<td>'+info[index[j]+"_percent"]+'</td>';
							}else{								
								tr += '<td><font class="redFont"></font></td>';
							}
							
							if(info[index[j]+"_proportion"]==null){
								tr += '<td></td>';
							}else{
								tr += '<td>'+info[index[j]+"_proportion"]+'</td>';
							}
							
						}
						tr += '</tr>';
						$("#econData").append(tr);
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
	        	window.location.href="${ctx}/front/cityDataCenter/index/4?orgId=${orgId}";
	        }else{ //向下滚动事件 
	        	window.location.href="${ctx}/front/cityDataCenter/index/1?orgId=${orgId}";
	        }  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) { //向上滚动事件  
	        	 window.location.href="${ctx}/front/cityDataCenter/index/4?orgId=${orgId}";
	         }else{ //向下滚动事件 
	        	 window.location.href="${ctx}/front/cityDataCenter/index/1?orgId=${orgId}";
	         }  
	    }  
	}   
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome 
</script>
</html>
