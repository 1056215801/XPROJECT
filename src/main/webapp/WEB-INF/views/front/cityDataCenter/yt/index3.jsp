<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/ytHomePage.css"/>
<title>鹰潭市铜产业大数据中心-产业在线</title>
</head>
<style>
.gray-bg {
    background: url(/XProject/static/image/cityDataCenter/yt/bg3.jpg) no-repeat center;
    background-size: 100% 100%;
} 
</style>
<body class="gray-bg sctx">
	<div class="index">
		<div class="china-map" id="map"></div>
	</div>
    <div class="foot">
    	<div class="links">
	    	<a href="${ctx}/front/cityDataCenter/ytIndex/2" class="link">
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light1.png">
		    	<img class="font" alt="" src="${ctx}/static/image/cityDataCenter/yt/index1.png">
	    	</a>
	    	<a href="${ctx}/front/cityDataCenter/ytIndex/3" class="link link2">
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light1.png">
		    	<img class="font" alt="" src="${ctx}/static/image/cityDataCenter/yt/index2.png">
	    	</a>
	    	<a href="${ctx}/front/cityDataCenter/ytIndex/4" class="link">
		    	<img class="light" alt="" src="${ctx}/static/image/cityDataCenter/yt/light2.png">
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
			if($ind!=2){
				$(this).find('.light').attr("src","${ctx}/static/image/cityDataCenter/yt/light2.png");
			}
		});
		$(".links .link").on("mouseleave",function(){
			var $ind = $(this).index();
			if($ind!=2){
				$(this).find('.light').attr("src","${ctx}/static/image/cityDataCenter/yt/light1.png");
			}
		});
	})
	function map(){
		var chart = echarts.init(document.getElementById('map'));
		var chinaGeoCoordMap = {
				'鹰潭市': [117.07, 40.2539],   
				'黑龙江': [127.9688, 45.368],
				'内蒙古': [110.3467, 41.4899],
				"吉林": [125.8154, 44.2584],
				'北京市': [116.4551, 40.2539], 
				"辽宁": [123.1238, 42.1216],
				"河北": [114.4995, 38.1006],
				"天津": [117.4219, 39.4189],
				"山西": [112.3352, 37.9413],
				"陕西": [109.1162, 34.2004],
				"甘肃": [103.5901, 36.3043],
				"宁夏": [106.3586, 38.1775],
				"青海": [101.4038, 36.8207],
				"新疆": [87.9236, 43.5883],
				"西藏": [91.11, 29.97],
				"四川": [103.9526, 30.7617],
				"重庆": [108.384366, 30.439702],
				"山东": [117.1582, 36.8701],
				"河南": [113.4668, 34.6234],
				"江苏": [118.8062, 31.9208],
				"安徽": [117.29, 32.0581],
				"湖北": [114.3896, 30.6628],
				"浙江": [119.5313, 29.8773],
				"福建": [119.4543, 25.9222],
				"江西": [116.0046, 28.6633],
				"湖南": [113.0823, 28.2568],
				"贵州": [106.6992, 26.7682],
				"云南": [102.9199, 25.4663],
				"广东": [113.12244, 23.009505],
				"广西": [108.479, 23.1152],
				"海南": [110.3893, 19.8516],
				'上海': [121.4648, 31.2891]
			};
		var chinaDatas = [
			[{
				name: '黑龙江',
				value: 0
			}],	[{
				name: '内蒙古',
				value: 0
			}],	[{
				name: '吉林',
				value: 0
			}],	[{
				name: '辽宁',
				value: 0
			}],	[{
				name: '河北',
				value: 0
			}],	[{
				name: '天津',
				value: 0
			}],	[{
				name: '山西',
				value: 0
			}],	[{
				name: '陕西',
				value: 0
			}],	[{
				name: '甘肃',
				value: 0
			}],	[{
				name: '宁夏',
				value: 0
			}],	[{
				name: '青海',
				value: 0
			}],	[{
				name: '新疆',
				value: 0
			}],[{
				name: '西藏',
				value: 0
			}],	[{
				name: '四川',
				value: 0
			}],	[{
				name: '重庆',
				value: 0
			}],	[{
				name: '山东',
				value: 0
			}],	[{
				name: '河南',
				value: 0
			}],	[{
				name: '江苏',
				value: 0
			}],	[{
				name: '安徽',
				value: 0
			}],	[{	
			    name: '湖北',
				value: 0
			}],	[{
				name: '浙江',
				value: 0
			}],	[{
				name: '福建',
				value: 0
			}],	[{
				name: '江西',
				value: 0
			}],	[{
				name: '湖南',
				value: 0
			}],	[{
				name: '贵州',
				value: 0
			}],[{
				name: '广西',
				value: 0
			}],	[{
				name: '海南',
				value: 0
			}],	[{
				name: '上海',
				value: 0
			}]
		];
		var convertData = function(data) {
			var res = [];
			for(var i = 0; i < data.length; i++) {
				var dataItem = data[i];
				var fromCoord = [117.07,28.27]
				var toCoord = chinaGeoCoordMap[dataItem[0].name];
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
		[['鹰潭市', chinaDatas]].forEach(function(item, i) {
		    console.log(item)
			series.push({
					type: 'lines',
					zlevel: 4,
					effect: {
						show: true,
						period: 4, //箭头指向速度，值越小速度越快
						trailLength: 0.02, //特效尾迹长度[0,1]值越大，尾迹越长重
						symbol: 'circle', //箭头图标
						symbolSize: 5, //图标大小
					},
					lineStyle: {
						normal: {
							width: 1, //尾迹线条宽度
							opacity: 0.5, //尾迹线条透明度
							curveness: -0.5,//尾迹线条曲直度
							color:'#FFF100'
						}
					},
					data: convertData(item[1])
				}, {
					type: 'effectScatter',
					coordinateSystem: 'geo',
					zlevel: 4,
					rippleEffect: { //涟漪特效
						period: 3, //动画时间，值越小速度越快
						brushType: 'fill', //波纹绘制方式 stroke, fill
						scale: 3 //波纹圆环最大限制，值越大波纹越大
					},
					label: {
						normal: {
							show: true,
							position: 'right', //显示位置
							offset: [5, 0], //偏移设置
							formatter: function(params){//圆环显示文字
								return params.data.name;
							},
							fontSize: 13
						},
						emphasis: {
							show: true
						}
					},
					symbol: 'circle',
					symbolSize: function(val) {
						return 5+ val[2] * 5; //圆环大小
					},
					itemStyle: {
						normal: {
							show: false,
							color: '#FFF100'
						}
					},
					data: item[1].map(function(dataItem) {
						return {
							name: '',
							value: chinaGeoCoordMap[dataItem[0].name].concat([dataItem[0].value])
						};
					}),
				},
				//攻击点
				{
					type: 'effectScatter',
					coordinateSystem: 'geo',
					zlevel: 4,
					symbol: 'circle',
					symbolSize: 12,
					rippleEffect: {
						period: 3,
						brushType: 'stroke',
						scale: 3
					},
					itemStyle: {
						normal: {
							show: true,
							color: '#FFF100'
						}
					},
					label: {
						normal: {
							show: true,
							position: 'right',
							offset:[5, 0],
							color: '#FFFF00',
							formatter: '{b}',
							textStyle: {
								color: "#00BAFF"
							}
						},
						emphasis: {
							show: true,
							color: "#FFF100"
						}
					},
					data: [{
						name: '鹰潭市',
						value: [117.07,28.27],
					}],
				},
		    	{
			        type: 'map',
			        map: 'china',
/* 			        center: [101.97, 38.71],
 */
			        center: [103.29, 38.38],
			        zoom: 1.19,
			        aspectScale: 0.95,
			        itemStyle: {
			        	normal: {
				            opacity: 0,
			                areaColor: '#333',
			                borderColor: '#00FFFF',
			                borderWidth: 1
			            },
			            emphasis: {
			                areaColor: 'transparent',
			                borderColor: '#00FFFF'
			            }
			        },
			        data:[{  
			            name:"南海诸岛",
			            value:0,  
			            itemStyle:{  
			                opacity:0,
			                label:{show:false}  
			            },  
			        }],
			        zlevel: 2
		    	}
			);
		});
		chart.setOption({
			geo: {
		        type: 'map',
		        map: 'china',
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
		        center: [101.97, 38.71],
		        light: { //光照阴影
		            main: {
		                color: '#fff', //光照颜色
		                intensity: 1.2, //光照强度
		                //shadowQuality: 'high', //阴影亮度
		                shadow: false, //是否显示阴影
		                alpha: 55,
		                beta: 12

		            },
		            ambient: {
		                intensity: 1.5
		            }
		        },   
		        itemStyle: {
		            normal: {
			        	opacity: 0,
		                areaColor: '#0C2361',
		                borderColor: '#00FFFF',
		                borderWidth: 3
		            },
		            emphasis: {
		                areaColor: '#0C2361',
		                borderColor: '#00FFFF',
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
	            }],
	            zlevel: 3,
			},
		    series:series
		});
	}
</script>
</html>
