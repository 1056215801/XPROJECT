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
<style>
/*去除百度地图版权*/
.anchorBL{
    display:none;
}
.BMap_cpyCtrl{
    display:none;
}
.mapDataName {
	font-size:16px;
	font-weight:bold;
	color: #333;
}
.mapDataCont {margin-top: 10px;}
.mapData {}
.mapAttr {
	display:inline-block;
	vertical-align: middle;
	font-size:14px;
	color: #999;
}
.mapValue {
	display:inline-block;
	vertical-align: middle;
	font-size:14px;
	color: #333;
	font-weight: bold;
}
#indexMap1 img {max-width: inherit;}
</style>
</head>
<body class="gray-bg" >
<%@ include file="header.jsp"%>
<div class="content fz0" id="content">
    <div class="blockStyle" style="height: calc(60% - 10px);">
		<div class="outsideBox">
			<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
			<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
			<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
			<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
			<div id="indexMap1" class="tabTitleBar" style="height: 100%;"></div>
		</div>
	</div>
    <div class="blockStyle df" style="height: calc(40% - 10px);">
		<div class="outsideBox" style="margin-right:20px">
			<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
			<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
			<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
			<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
			<div class="tabCaptionBar">
				<span class="tabCaption">项目投资动态</span>
			</div>
			<div class="tabTitleBar">
				<div class="table-title">
   					<span class="dib">名称</span>
   					<span class="dib">投资额(万元)</span>
   					<span class="dib">所在区域</span>
				</div>
				<div class="table-content">
					<table id="companyList" onmouseenter="loopPause()" onmouseleave="loopStart()">
					</table>
				</div>
			</div>
		</div>
		<div class="outsideBox" style="margin-right:20px">
			<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
			<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
			<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
			<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
			<div class="tabCaptionBar">
				<span class="tabCaption">产业项目推进</span>
			</div>
			<div id="indexMap3" class="tabTitleBar"></div>
		</div>
		<div class="outsideBox">
			<img class="corner lt" src="${ctx}/static/image/cityDataCenter/common/lt.png">
			<img class="corner rt" src="${ctx}/static/image/cityDataCenter/common/rt.png">
			<img class="corner lb" src="${ctx}/static/image/cityDataCenter/common/lb.png">
			<img class="corner rb" src="${ctx}/static/image/cityDataCenter/common/rb.png">
			<div class="tabCaptionBar">
				<span class="tabCaption">基础设施及配套项目推进</span>
			</div>
			<div id="indexMap4" class="tabTitleBar"></div>
		</div>
	</div>
	<div id="lay1" class="layer">
		<h1>吉安高新区2019年产业项目攻坚推进情况一览表</h1>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th rowspan="3">序号</th>
					<th rowspan="3">项目名称</th>
					<th rowspan="3">年度目标</th>
					<th id="t1" colspan="26">项目推进进展</th>
				</tr>
				<tr>
					<th id="t2" colspan="16">项目开工前工作</th>
					<th id="t3" colspan="10">项目开工后工作</th>
				</tr>
				<tr id="tr"></tr>
			</thead>
			<tbody id="tbody"></tbody>
		</table>
	</div>
	<div id="lay2" class="layer layer2">
		<h1>吉安高新区2019年基础设施及配套项目攻坚推进情况图表</h1>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th id="tt1" colspan="29" style="text-align: left;">【  道路工程  】</th>
				</tr>
				<tr>
					<th rowspan="2">序号</th>
					<th rowspan="2">项目名称</th>
					<th rowspan="2">项目性质</th>
					<th rowspan="2">项目内容</th>
					<th id="tt2" colspan="25">项目推进进展</th>
				</tr>
				<tr id="ttr"></tr>
			</thead>
			<tbody id="ttbody"></tbody>
		</table>
	</div>
</div>
<script src="${ctx}/static/js/vue.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.mousewheel.min.js"></script>

<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=2b82bdceb647d5f7819514f45c752413"></script>
<script type="text/javascript">
var loop = '';
var num = 0;
var length = 0;
var h1 = 0;
$(function(){
	$(".head .tab>a:eq(3)").addClass("on");
	getCompanyList();
	getXmtj();
	getJcss();
	getMap();
})
function getTable1(id){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/propomCompanyPreviewList",
		type : "post",
		data : {
			id: id
		},
		success : function(result) {
			console.log(result)
			if (result.success) {
				var t1 = result.mapNode["项目开工前工作"].length
				var t2 = result.mapNode["项目开工后工作"].length
				$("#t1").attr("colspan",t1+t2)
				$("#t2").attr("colspan",t1)
				$("#t3").attr("colspan",t2)
				var th = ""
				var items = result.mapNode["项目开工前工作"].concat(result.mapNode["项目开工后工作"])
				for(var i=0;i<items.length;i++){
					th += "<th>"+items[i]+"</th>"
				}
				$("#tr").html(th)
				
				var tds = ''
				for(var x=0;x<result.endList.length;x++){
					var info3 = result.endList[x]
					var td = ""
					for(var y=0;y<items.length;y++){
						var content = info3[items[y]] === "0" ? "▲" : info3[items[y]] === "1" ? "√" : info3[items[y]] ? info3[items[y]] : ''
						td += "<td>"+content+"</td>"
					}
					tds += "<tr>"
					tds += "<td>"+(x+1)+"</td>"
					tds += "<td>"+(info3["项目名称"] ? info3["项目名称"] : "")+"</td>"
					tds += "<td>"+(info3["年度目标"] ? info3["年度目标"] : "")+"</td>"
					tds += td
					tds += "</tr>"
				}
				if(result.endList.length == 0) {
					tds = "<tr><td colspan="+(t1+t2+3)+" style='text-align: center;'>暂无数据！</td></tr>"
				}
				$("#tbody").html(tds)
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
function getTable2(name){
	$("#tt1").text('【  '+name+'  】')
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/propomCompanyPreviewBasicsList",
		type : "post",
		data : { },
		success : function(result) {
			if (result.success) {
				var items = result.bassicName[name]
				if(items){
					var leng = items.length == 0 ? 1 : items.length
					$("#tt1").attr("colspan",leng + 4)
					$("#tt2").attr("colspan",leng)
					var th = ""
					for(var i=0;i<items.length;i++){
						th += "<th>"+items[i]+"</th>"
					}
					$("#ttr").html(th)
					
					var tds = ''
					for(var x=0;x<result.bassicInfo[name].length;x++){
						var info3 = result.bassicInfo[name][x]
						var td = ""
						for(var y=0;y<items.length;y++){
							var content = info3[items[y]] === "0" ? "▲" : info3[items[y]] === "1" ? "√" : info3[items[y]] ? info3[items[y]] : ""
							td += "<td>"+content+"</td>"
						}
						tds += "<tr>"
						tds += "<td>"+(x+1)+"</td>"
						tds += "<td>"+(info3["项目名称"] ? info3["项目名称"] : "")+"</td>"
						tds += "<td>"+(info3["项目性质"] ? info3["项目性质"] : "")+"</td>"
						tds += "<td>"+(info3["项目内容"] ? info3["项目内容"] : "")+"</td>"
						tds += td
						tds += "</tr>"
					}
					if(result.bassicInfo[name].length == 0) {
						tds = "<tr><td colspan="+(items.length + 4)+" style='text-align: center;'>暂无数据！</td></tr>"
					}
				} else { tds = "<tr><td colspan="+(items.length + 4)+" style='text-align: center;'>未配置模板！</td></tr>"}
				$("#ttbody").html(tds)
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
function getCompanyList(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/propomCompanyNewestMaxList",
		type : "post",
		data : { },
		success : function(result) {
			if (result.success) {
				$('#companyList').empty();
			    var div = "";
			    if(result.lists.length > 8){
			    	for (var j=0;j<2;j++){
			    		for (var i=0;i<result.lists.length;i++){
							var info = result.lists[i];
			    			if(JSON.stringify(info) != "{}") {
							    div += '<tr onclick="loopChoose(this)">';
							    div += '<td>'+(info["项目名称"] ? info["项目名称"] : '')+'</td>';
							    div += '<td>'+(info["投资规模"] ? info["投资规模"] : '')+'</td>';
							    div += '<td>'+(info["详细地址"] ? info["详细地址"] : '')+'</td>';
							    div += '</tr>';
			    			}
						}
				    }
			    }else{
			    	for (var i=0;i<result.lists.length;i++){
						var info = result.lists[i];
		    			if(JSON.stringify(info) != "{}") {
						    div += '<tr onclick="loopChoose(this)">';
						    div += '<td>'+(info["项目名称"] ? info["项目名称"] : '')+'</td>';
						    div += '<td>'+(info["投资规模"] ? info["投资规模"] : '')+'</td>';
						    div += '<td>'+(info["详细地址"] ? info["详细地址"] : '')+'</td>';
						    div += '</tr>';
		    			}
					}
			    }
				$('#companyList').html(div);
				$('#companyList tr:eq(0)').addClass("on");

			    if(result.lists.length > 8){
					h1 = $("#companyList tr").height();
					num = 0;
					length = result.lists.length;
					if(loop != ''){
						loopPause();
						$("#companyList").animate({top: "-"+h1*num+"px"});
						$("#companyList tr:eq("+num+")").addClass("on").siblings().removeClass("on");
					}
					loopStart();
					//前10企业鼠标滚轮事件
					$("#companyList").on('mousewheel',function(event, delta){
						var dir = delta > 0 ? 'Up' : 'Down';
						if (dir == 'Up') {
							if(num > 0){
								num--;
								$("#companyList").stop().animate({top: "-"+h1*num+"px"});
								$("#companyList tr:eq("+num+")").addClass("on").siblings().removeClass("on");
							}
						} else {
							if(num < length){
								num++;
							} else {
								num = 1;
								$("#companyList").css({top: "0px"})
							}
							$("#companyList").stop().animate({top: "-"+h1*num+"px"});
							$("#companyList tr:eq("+num+")").addClass("on").siblings().removeClass("on");
						}
					})
			    }
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
function getXmtj() {
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/propomCompanyIndustryList",
		type : "post",
		data : { },
		success : function(result) {
			if (result.success) {
				var arr = [];
				var total = result.total
				for(key in result.map) {
					var temp = { value: result.map[key], name: key}
					arr.push(temp)
				}
				chart1(arr,total)
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
function getJcss() {

	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/propomCompanyBasicsList",
		type : "post",
		data : { },
		success : function(result) {
			console.log(result)
			if (result.success) {
				var arr = [];
				var total = result.total
				for(key in result.map) {
					var temp = { value: result.map[key], name: key}
					arr.push(temp)
				}
				chart2(arr)
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
function chart1(d, t) {
	var myChart = echarts.init(document.getElementById('indexMap3'));
	var option = {
	    backgroundColor:'rgb(0,0,0,0)',
	    title: {
	        text: t ? t : '0',
	        subtext: '项目总数（个）',
	        textStyle: {
	            color: 'rgba(255,229,87,1)',
	            fontSize: 30,
	        },
	        subtextStyle: {
	            fontSize: 14,
	            color: ['#009FF1FF'],

	        },
	        itemGap:10,
	        x: 'center',
	        y: '40%',
	    },
	    tooltip: {},
	    series: [{
	        name: '产业项目推进',
	        type: 'pie',
	        selectedMode: 'single',
	        radius: ['50%', '70%'],
	        color: ['#F5D345FF', '#8C539EFF', '#3CB360FF'], 
	        selectedOffset: 30,
	        clockwise: true,
	        label: {
	            normal: {
	                formatter: ['{b}', '{d}%({c}个)'].join('\n'),
	                textStyle: {
	                    fontSize: 13,
	                    color: '#fff'
	                }
	            }
	        },
	        labelLine: {
	            normal: {
	                lineStyle: {
	                    color: '#fff'
	                }
	            }
	        },
	        data: d,
	        itemStyle: {
	        	normal: {
	    	        opacity: 1,
	    	        borderWidth: 2,
	    	        borderColor: '#001D52FF',
	    	    }
	        }
	    }]
	};
	myChart.setOption(option);
	myChart.on("click",function(p){
		var id = p.name == "竣工投产" ? 1 : p.name == "主体封顶" ? 2 : p.name == "开工建设" ? 3 : 0
		getTable1(id);
		layer.open({
		  type: 1,
		  title: false,
		  closeBtn: 0,
		  area: ['100%' , '100%'],
		  content: $('#lay1'),
		  btn: ["关闭"]
		});
	})
}
function chart2(data) {
	var myChart = echarts.init(document.getElementById('indexMap4'));
	var arrName = getArrayValue(data, "name");
	var arrValue = getArrayValue(data, "value");
	var sumValue = eval(arrValue.join('+'));
	var objData = array2obj(data, "name");
	var optionData = getData(data, sumValue);
	var option = {
	    backgroundColor:'rgba(0,0,0,0)',
	    legend: {
	        show: true,
	        top: "center",
	        left: '70%',
	        data: arrName,
	        itemWidth: 30,
	        itemHeight: 20,
	        width:50,
	        padding: [0, 5],
	        itemGap: 25,
	        formatter: function(name) {
	            return "{title|" + name + "}{value|（" + (objData[name].value) + "个)}"
	        },
	        textStyle: {
	            rich: {
	                title: {
	                    fontSize: 13,
	                    lineHeight: 10,
	                    color: "rgba(255,255,255,1)"
	                },
	                value: {
	                    fontSize: 13,
	                    color: "rgba(255,255,255,1)"
	                }
	            }
	        },
	    },
	    tooltip: {
	        show: true,
	        trigger: "item",
	        formatter: "{a}<br>{b}:{c}({d}%)"
	    },
	    color: [ '#0CAAFCFF', '#FFC200FF', '#00E472FF'],
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
	           padding: [-20, 4, 5, 6],
	            inside: true,
	            color: "rgba(255,255,255,1)",
	            fontSize: 12,
	            show: true
	        },
	        data: optionData.yAxis
	    }],
	    xAxis: [{
	        show: false
	    }],
	    series: optionData.series
	};
	myChart.setOption(option);
	myChart.on("click",function(p){
		if(p.name == "") { return alert("暂无数据！")}
		getTable2(p.name);
		layer.open({
		  type: 1,
		  title: false,
		  closeBtn: 0,
		  area: ['100%' , '100%'],
		  content: $('#lay2'),
		  btn: ["关闭"]
		});
	})
}
function loopStart(){
	if(length > 8){
		loop = setInterval(function(){
			if(num < length){
				num++;
			} else {
				num = 1;
				$("#companyList").css({top: "0px"})
			}
			$("#companyList").animate({top: "-"+h1*num+"px"});
			$("#companyList tr:eq("+num+")").addClass("on").siblings().removeClass("on");
		},10000)
	}
}
function loopPause(){
	clearInterval(loop);
}
function loopChoose(e){
	num = $(e).index();
	if(length > 8){
		if(num >= length){
			num = num - length;
			$("#companyList").css({top: "0px"});
		}
		$("#companyList").animate({top: "-"+h1*num+"px"});
	}
	$("#companyList tr:eq("+num+")").addClass("on").siblings().removeClass("on");
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

function getData(data, sumValue) {
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
            radius: [65 - i * 15 + '%', 57 - i * 15 + '%'],
            center: ["30%", "55%"],
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
            radius: [65 - i * 15 + '%', 57 - i * 15 + '%'],
            center: ["30%", "55%"],
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
                    color: "#021974FF",
                    borderWidth: 0
                },
                tooltip: {
                    show: false
                },
                hoverAnimation: false
            }, {
                value: 2.5,
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
        res.yAxis.push((data[i].value / sumValue * 100).toFixed(2) + "%");
    }
    return res;
}
var isFirst = true;
function getMap(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/propomCompanyMapDisplayList",
		type : "post",
		data : {},
		dataType : "json",
		success : function(result){
			if(result.success){
				if(!self.isFirst){
					//清除所有标注
					map.clearOverlays();
				}
				for(var i=0;i<result.lists.length;i++){
					var list = result.lists[i];
					
					if(list.地图经度 == undefined){list.地图经度 = "";}
					if(list.地图纬度 == undefined){list.地图纬度 = "";}
					
					var marker = new BMap.Marker(new BMap.Point(list.地图经度,list.地图纬度));  // 创建标注
					marker.id = 'marker'+i;//添加marker时附加一个id属性
					
					addClickHandler(marker,marker.id);
					
					map.addOverlay(marker);
				}
				//删除样式文件，还原自定义覆盖物label下的before颜色
				$("#indexMap1").removeClass("prov");
				
				/* var markers = map.getOverlays();//获取所有marker进行遍历
				console.log(markers)
				markers[2].dispatchEvent("click"); */
			}else{
				layer.msg(result.errorMsg);
			}
		},
		error : function() {
			layer.msg("系统异常");
		}
	});	
}
</script>
<script type="text/javascript">
	var map;
	var markers = [];
	var markerClusterer;
	
	map = new BMap.Map("indexMap1");
	var point = new BMap.Point(114.93015,27.010751);
	map.centerAndZoom(point,12); 
	map.enableScrollWheelZoom();                            //启用滚轮放大缩小
	map.addControl(new BMap.NavigationControl());               // 添加平移缩放控件
	map.addControl(new BMap.ScaleControl());                    // 添加比例尺控件
	map.addControl(new BMap.OverviewMapControl());              //添加缩略地图控件
	
	//底层地图替换主题. 模板页可以查看http://lbsyun.baidu.com/custom/list.htm      
	map.setMapStyle({style:'bluish'});
	
	var opts = {
		width : 200,     // 信息窗口宽度
		height: 200,     // 信息窗口高度
		title : false, // 信息窗口标题
		offset: new BMap.Size(0, -20)
	};
	function addClickHandler(marker,markerId){
		marker.addEventListener("click",function(e){
			openInfo(e,markerId)
		});
	}
	function openInfo(e,markerId){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/propomCompanyMapDisplayList",
			type : "post",
			data : {},
			dataType : "json",
			success : function(result) {
				if(result.success){
					var id = markerId.substring(6);
					var info = result.lists[id];
					var content = "";
						content+= "<div class=\"mapDataBar\">";
						if(info.单位名称 != "" && info.单位名称 != undefined){
							content+= "	<div class=\"mapDataName\">"+info.单位名称+"</div>";
						}else{
							content+= "	<div class=\"mapDataName\"></div>";
						}
						content+= "	<div class=\"mapDataCont\">";
						if(info.项目名称 != "" && info.项目名称 != undefined){
							content+= "		<div class=\"mapData\"><span class=\"mapAttr\">项目名称：<span><span class=\"mapValue\">"+info.项目名称+"<span></div>";
						}else{
							content+= "		<div class=\"mapData\"><span class=\"mapAttr\">项目名称：<span><span class=\"mapValue\"><span></div>";
						}
						if(info.年度目标 != "" && info.年度目标 != undefined){
							content+= "		<div class=\"mapData\"><span class=\"mapAttr\">年度目标：<span><span class=\"mapValue\">"+info.年度目标+"<span></div>";
						}else{
							content+= "		<div class=\"mapData\"><span class=\"mapAttr\">年度目标：<span><span class=\"mapValue\"><span></div>";
						}
						/* if(info.项目进度 != "" && info.项目进度 != undefined){
							content+= "		<div class=\"mapData\"><span class=\"mapAttr\">项目进度：<span><span class=\"mapValue\">"+info.项目进度+"%<span></div>";
						}else{
							content+= "		<div class=\"mapData\"><span class=\"mapAttr\">项目进度：<span><span class=\"mapValue\"><span></div>";
						} */
						if(info.开工时间 != "" && info.开工时间 != undefined){
							content+= "		<div class=\"mapData\"><span class=\"mapAttr\">开工时间：<span><span class=\"mapValue\">"+info.开工时间+"<span></div>";
						}else{
							content+= "		<div class=\"mapData\"><span class=\"mapAttr\">开工时间：<span><span class=\"mapValue\"><span></div>";
						}
						if(info.投资规模 != "" && info.投资规模 != undefined){
							content+= "		<div class=\"mapData\"><span class=\"mapAttr\">投资规模：<span><span class=\"mapValue\">"+info.投资规模+"万元<span></div>";
						}else{
							content+= "		<div class=\"mapData\"><span class=\"mapAttr\">投资规模：<span><span class=\"mapValue\"><span></div>";
						}
						content+= "	</div>";
						content+= "</div>";
					
					var p = e.target;
					var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
					var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
					map.openInfoWindow(infoWindow,point); //开启信息窗口
				}else{
					layer.msg("系统异常");
				}
			},
			error : function() {
				layer.msg("系统异常");
			}
		});
		
	}
</script>
</body>
</html>
