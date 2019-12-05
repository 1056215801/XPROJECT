<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/ytHomePage.css"/>
<title>鹰潭市铜产业大数据中心-产业规模</title>
</head>
<body class="gray-bg cygm">
	<div class="index">
		<div class="china-map" id="map"></div>
		<div class="lay">
			<p>累计引入中国500强金属企业：<b>54家</b></p>
			<p>累计引入世界500强企业：<b>54家</b></p>
		</div>
	</div>
    <div class="foot">
    	<div class="links">
	    	<a href="${ctx}/front/cityDataCenter/ytIndex/2" class="link">
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light2.png">
		    	<img class="font" alt="" src="${ctx}/static/image/cityDataCenter/yt/index1.png">
	    	</a>
	    	<a href="${ctx}/front/cityDataCenter/ytIndex/3" class="link link2">
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light1.png">
		    	<img class="font" alt="" src="${ctx}/static/image/cityDataCenter/yt/index2.png">
	    	</a>
	    	<a href="${ctx}/front/cityDataCenter/ytIndex/4" class="link">
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light1.png">
		    	<img class="font" alt="" src="${ctx}/static/image/cityDataCenter/yt/index3.png">
	    	</a>
	    	<a href="${ctx}/front/cityDataCenter/ytIndex/5" class="link link2">
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light1.png">
		    	<img class="font" alt="" src="${ctx}/static/image/cityDataCenter/yt/index4.png">
	    	</a>
	    	<a href="${ctx}/front/cityDataCenter/ytIndex/6" class="link">
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light1.png">
		    	<img class="font" alt="" src="${ctx}/static/image/cityDataCenter/yt/index5.png">
	    	</a>
    	</div>
    	<a href="${ctx}/front/cityDataCenter/ytIndex/1" class="back-btn"><img alt="" src="${ctx}/static/image/cityDataCenter/yt/back.png"></a>
    </div>
</body>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/map/china.js"></script>
<script type="text/javascript">
	$(function(){
		map();
		$(".links .link").on("mouseenter",function(){
			var $ind = $(this).index();
			if($ind!=0){
				$(this).find('.light').attr("src","${ctx}/static/image/cityDataCenter/yt/light2.png");
			}
		});
		$(".links .link").on("mouseleave",function(){
			var $ind = $(this).index();
			if($ind!=0){
				$(this).find('.light').attr("src","${ctx}/static/image/cityDataCenter/yt/light1.png");
			}
		});
	})
	function map(){
		var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
		var chart = echarts.init(document.getElementById('map'));
		var chinaGeoCoordMap = {
			'鹰潭': [115.5,27.8],
			'江铜': [115.3,26.8],
			"宁波兴业": [113.6,23.3],
			'红旗集团': [112.5,21.5],
			"金田集团": [115,21.8],
			"洪磊铜业": [116,23.0],
			"亚鼎金属": [120.5,22.5],
			"连展科技": [121.6,23.6],
			"光宝集团": [120.8,24.0],
			"万宝至": [127.4,35.1]
		};
		var symbolSize=6;
		if(width<=1600){
			chinaGeoCoordMap = {
				'鹰潭': [115.5,25.8],
				'江铜': [115.3,24.8],
				"宁波兴业": [113.1,20.3],
				'红旗集团': [112.0,18.5],
				"金田集团": [114.5,18.8],
				"洪磊铜业": [115.9,20.0],
				"亚鼎金属": [120.5,19.5],
				"连展科技": [121.6,20.6],
				"光宝集团": [120.8,21.0],
				"万宝至": [127.4,34.5]
			};
			symbolSize=5;
		}
		if(width<=1440){
			chinaGeoCoordMap = {
				'鹰潭': [115.5,23.8],
				'江铜': [115.3,22.8],
				"宁波兴业": [113.1,18.3],
				'红旗集团': [112.0,16.5],
				"金田集团": [114.5,16.8],
				"洪磊铜业": [115.9,18.0],
				"亚鼎金属": [120.5,17.5],
				"连展科技": [121.6,18.6],
				"光宝集团": [120.8,19.0],
				"万宝至": [127.4,33.5]
			};
			symbolSize=5;
		}
		var chinaDatas = [
			[{
				name: '鹰潭',
				value: 0
			}],	[{
				name: '江铜',
				value: 0
			}],	[{
				name: '宁波兴业',
				value: 0
			}],	[{
				name: '红旗集团',
				value: 0
			}],	[{
				name: '金田集团',
				value: 0
			}],	[{
				name: '洪磊铜业',
				value: 0
			}],	[{
				name: '亚鼎金属',
				value: 0
			}],	[{
				name: '连展科技',
				value: 0
			}],	[{
				name: '光宝集团',
				value: 0
			}],	[{
				name: '万宝至',
				value: 0
			}]
		];

		var convertData = function(data) {
			var res = [];
			for(var i = 0; i < data.length; i++) {
				var dataItem = data[i];
				var fromCoord = chinaGeoCoordMap[dataItem[0].name];
				var toCoord = [115.5,26.8];
				if(fromCoord && toCoord) {
					res.push([{
						coord: fromCoord,
						value: dataItem[0].value
					}, {
						coord: toCoord,
					}]);
				}
			}
			return res;
		};
		var series = [];
		[['鹰潭', chinaDatas]].forEach(function(item, i) {
		    console.log(item)
			series.push({
				type: 'lines',
				zlevel: 2,
				effect: {
					show: true,
					period: 4, //箭头指向速度，值越小速度越快
					trailLength: 0.02, //特效尾迹长度[0,1]值越大，尾迹越长重
					symbol: 'arrow', //箭头图标
					symbolSize: 5, //图标大小
				},
				lineStyle: {
					normal: {
						width: 1, //尾迹线条宽度
						opacity: 1, //尾迹线条透明度
						curveness: -0.3, //尾迹线条曲直度
						color: '#00FF2A'
					}
				},
				data: convertData(item[1])
			}, {
                name: 'effectScatter',
                type: "effectScatter",
                coordinateSystem: 'geo',
                symbolSize: symbolSize, 
                opacity: 1,
                zlevel: 2,
		        rippleEffect: {
		            brushType: 'fill',
		            scale : 5
		        },
                itemStyle : {
                       color : '#F4E925',
                },
                   label: {
                       show: false,
                   },
				data: item[1].map(function(dataItem) {
					return {
						name: dataItem[0].name,
						value: chinaGeoCoordMap[dataItem[0].name].concat([dataItem[0].value])
					};
				}),
			},
			//被攻击点
			{
				type: 'scatter',
				coordinateSystem: 'geo',
				zlevel: 2,
                symbolSize: 0, 
				rippleEffect: {
					period: 4,
					brushType: 'stroke',
					scale: 4
				},
				label: {
					normal: {
						show: true,
						position: 'right',
						//offset:[5, 0],
						color: '#0f0',
						formatter: '{b}',
						textStyle: {
							color: "#0f0"
						}
					},
					emphasis: {
						show: true,
						color: "#f60"
					}
				},
				data: [{
					name: item[0],
					value: chinaGeoCoordMap[item[0]].concat([10]),
				}],
			});
		});
		chart.setOption({
			geo: {
		        type: 'map',
		        map: 'china',
		        aspectScale: 1,
		        zoom: 1.2,
		        center: [105.1, 38.71],
		        label: {
		        	normal: {
		                show: false,
		                color:'#B6EEFF'
		        	},
		            emphasis: {
		                show: false,
		                color:'#B6EEFF'
		            }
		        },
		        itemStyle: {
		            normal: {
		                areaColor: 'transparent',
		                borderColor: 'transparent',
		            },
		            emphasis: {
		                areaColor: 'transparent',
		                borderColor: 'transparent'
		            }
		        },
		        regions : [{
	                name : '南海诸岛',
	                itemStyle : {
	                    opacity : 0
	                },
	                label : {
	                    show : false
	                },
	                emphasis : {
	                    label : {
	                        show : false
	                    }
	                },
	            }]
			},
		    series: series
		});
	}
</script>
</html>
