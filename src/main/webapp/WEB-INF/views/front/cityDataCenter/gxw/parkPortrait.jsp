<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit"/>
<meta http-equiv="Cache-Control" content="no-siteapp"/>
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/gxwHomePage.css"/>
<title>江西省工业大数据园区画像</title>
</head>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="360000">
		<input type="hidden" id="region" name="region" value="江西省">
		<input type="hidden" id="companyId" name=""companyId"" value="">
	</form>
	<div class="drawHeader">
		<img src="${ctx}/static/image/cityDataCenter/jxNew/yuanqulogo.png">
	</div>
	<div class="drawContent">
		<div class="spanStyle" style="width: 27.5%;">
			<div class="blockStyle" style="height: 35%;">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">园区规模效益</span>
					</div>
					<div class="tabContBar">
						<div class="orders orders3" id="o1">
							<span class="on">主营业务收入</span>
							<span>利润总额</span>
							<span>主营业务收入利润率</span>
							<span>税收</span>
							<span>工业固投及增速</span>
							<span>新增规上企业</span>
						</div>
						<div class="chart-unit" id="u1">亿元</div>
						<div class="park-chart" id="chart1"></div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(35% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">科技创新</span>
					</div>
					<div class="tabContBar">
						<div class="orders orders3" id="o2">
							<span class="on">高新技术产业比重</span>
							<span>科研经费支出占比</span>
							<span>创新成果</span>
						</div>
						<div class="park-chart park-chart2" id="chart2"></div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(30% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">园区主体</span>
					</div>
					<div class="tabContBar">
						<div class="orders orders3" id="o3">
							<span class="on">产业结构</span>
							<span>代表企业</span>
						</div>
						<div class="table-body">
							<table id="demonstrateTable">
								<!-- <tr>
									<td class=""><span class="yellowPoint"></span><span class="dataLimit">家用电器高效变频压缩机智能制造试点示范</span></td>
								</tr> -->
							</table>
							<font class="unData" id="unDataPark" style="display: none;">暂无数据</font>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="spanStyle" style="width: calc(45% - 10px);">
			<div class="blockStyle" style="height: 70%;">
				<div class="tabCaptionBar">
					<span class="tabCaption" id="companyTitleName"></span>
				</div>
				<div class="tabContBar">
					<div class="yqhx">
						<div class="yq-logo dib">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="companyLogo">
									<i></i>
									<img id="logoUrl" src="${ctx}/static/image/cityDataCenter/jxNew/default.png">
									<img class="switch-img" src="${ctx}/static/image/cityDataCenter/jxNew/saomiao.png">
								</div>
							</div>
							<img class="guang" src="${ctx}/static/image/cityDataCenter/jxNew/guang.png">
							<img class="wutai" src="${ctx}/static/image/cityDataCenter/jxNew/wutai.png">
						</div>
						<div class="yq-honor dib">
							<div class="swiper-container" id="swiper">
							    <div class="swiper-wrapper">
							    	<div class="swiper-slide">
							    		<div class="middle-pic">
											<img src="${ctx}/static/image/cityDataCenter/jxNew/jiangbei.png">
											<p>荣誉</p>
							    		</div>
							    	</div>
							    	<div class="swiper-slide">
							    		<div class="middle-pic">
											<img src="${ctx}/static/image/cityDataCenter/jxNew/jiangbei.png">
											<p>荣誉</p>
							    		</div>
							    	</div>
							    	<div class="swiper-slide">
							    		<div class="middle-pic">
											<img src="${ctx}/static/image/cityDataCenter/jxNew/jiangbei.png">
											<p>荣誉</p>
							    		</div>
							    	</div>
							    	<div class="swiper-slide">
							    		<div class="middle-pic">
											<img src="${ctx}/static/image/cityDataCenter/jxNew/jiangbei.png">
											<p>荣誉</p>
							    		</div>
							    	</div>
							    	<div class="swiper-slide">
							    		<div class="middle-pic">
											<img src="${ctx}/static/image/cityDataCenter/jxNew/jiangbei.png">
											<p>荣誉</p>
							    		</div>
							    	</div>
							    	<div class="swiper-slide">
							    		<div class="middle-pic">
											<img src="${ctx}/static/image/cityDataCenter/jxNew/jiangbei.png">
											<p>荣誉</p>
							    		</div>
							    	</div>
								</div>
							</div>
						</div>
					</div>
					<div class="parkInfoBar">
						<div class="companyInfo">
							<span class="infoName">园区名称：</span><span class="infoValue" id="parkName"></span>
							<span class="infoName">园区级别：</span><span class="infoValue" id="parkKind"></span>
						</div>
						<div class="companyInfo">
							<span class="infoName">成立时间：</span><span class="infoValue" id="createTime"></span>
							<span class="infoName">园区规划面积：</span><span class="infoValue" id="landSquare"></span>
						</div>
						<div class="companyInfo">
							<span class="infoName">实际开发面积：</span><span class="infoValue" id="coverSquare"></span>
							<span class="infoName">土地利用率：</span><span class="infoValue" id="coverPercent"></span>
						</div>
						<div class="companyInfo">
							<span class="infoName">主要负责人：</span><span class="infoValue" id="leadPerson"></span>
							<span class="infoName">主要联系人：</span><span class="infoValue" id=contactName></span>
						</div>
						<div class="companyInfo">
							<span class="infoName">联系电话：</span><span class="infoValue" id="contactPhone"></span>
							<span class="infoName">园区网站：</span><span class="infoValue" id="siteUrl"></span>
						</div>
						<div class="companyInfo">
							<span class="infoName">企业地址：</span><span class="infoValue" style="width: calc(100% - 100px);" id="positionAddress"></span>
						</div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(30% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">营商环境</span>
					</div>
					<div class="tabContBar">
						<div class="orders orders3 orders4" id="o4">
							<span class="on">基础设施投资增速</span>
							<span>建成标准厂房建筑面积</span>
							<span>审批事项通办率</span>
							<span>安全生产标准化达标率</span>
							<span>基金投资规模</span>
						</div>
						<div class="park-chart park-chart2" id="chart3"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="spanStyle" style="width: calc(27.5% - 10px);">
			<div class="blockStyle" style="height: 35%;">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">集约发展</span>
					</div>
					<div class="tabContBar">
						<div class="orders orders3" id="o5">
							<span class="on">首位产业集聚度</span>
							<span>亩均固定资产投资</span>
							<span>亩均税收</span>
							<span>工业土地产出率</span>
							<span>项目用地开发率</span>
						</div>
						<div class="chart-unit" id="u4">万元</div>
						<div class="park-chart" id="chart4"></div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(30% - 10px);">	
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">融合开放</span>
					</div>
					<div class="tabContBar">
						<div class="orders orders3" id="o6">
							<span class="on">企业成果</span>
							<span>实际利用外资</span>
							<span>实际利用省外资金</span>
							<span>进出口总额</span>
							<span>高新技术出口额比重</span>
						</div>
						<div class="park-chart" id="chart5"></div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(35% - 10px);">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">绿色发展</span>
					</div>
					<div class="tabContBar">
						<div class="orders orders3" id="o7">
							<span class="on">单位工业增加值能耗</span>
							<span>单位工业增加值用水量</span>
							<span>工业固体废物综合利用率</span>
							<span>污水集中处理率</span>
						</div>
						<div class="chart-unit" id="u6">吨标煤/万元</div>
						<div class="park-chart" id="chart6"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/dataCenter/gxwData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="https://api.map.baidu.com/api?v=2.0&ak=2b82bdceb647d5f7819514f45c752413"></script>
<script type="text/javascript">
	$(function(){
		$(".orders span").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			var x = park.yearList;
			var y = '',y2 = '';
			if($(this).parent().attr("id") == 'o1') {
 				switch(ind) {
 				case 0:
 					y = park.zyywsrList;
 					y2 = park.zyywsrPercentList;
 				  	break;
 				case 1:
 					y = park.lrList;
 					y2 = park.lrPercentList;
	 				break;
 				case 2:
 					y = park.zyywsrlrlList;
	 				break;
 				case 3:
 					y = undefined;
	 				break;
 				case 4:
 					y = park.gygdzctzeList;
 					y2 = park.gygdzctzePercentList;
	 				break;
 				case 5:
 					y = undefined;
	 				break;
 				}
 				if(ind == 2){
 					charts(x,y,6,'chart1');
 				} else {
 					charts(x,y,5,'chart1',y2);
 				}
			} else if($(this).parent().attr("id") == 'o2') {
				x = park.data['kjcx_'+ind].xAxis;
				y = park.data['kjcx_'+ind].series;
				charts(x,y,1,'chart2');
			} else if($(this).parent().attr("id") == 'o3') {
 				switch(ind) {
 				case 0:
 					tables(park.typeList,0);
 				  	break;
 				case 1:
 					tables(park.parkCompanyList,1);
	 				break;
 				}
			} else if($(this).parent().attr("id") == 'o4') {
				x = park.data['yshj_'+ind].xAxis;
				y = park.data['yshj_'+ind].series;
				charts(x,y,2,'chart3');
			} else if($(this).parent().attr("id") == 'o5') {
				x = park.data['jyfz_'+ind].xAxis;
				y = park.data['jyfz_'+ind].series;
				charts(x,y,3,'chart4');
			} else if($(this).parent().attr("id") == 'o6') {
				x = park.data['rhkf_'+ind].xAxis;
				y = park.data['rhkf_'+ind].series;
				charts(x,y,1,'chart5');
			} else if($(this).parent().attr("id") == 'o7') {
				x = park.data['lsfz_'+ind].xAxis;
				y = park.data['lsfz_'+ind].series;
				charts(x,y,4,'chart6');
			}
		});
		getParkData();
	})
	var park = '';
	function getParkData(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/companyInfo/parkPortrait",
			type : "post",
			data : {
				"parkId" : "${parkId}" //1002
			},
			success : function(result) {
				console.log(result)
				if (result.success) {
					park = result;
					//园区规模效益
					charts(result.yearList,result.zyywsrList,5,'chart1',result.zyywsrPercentList);
					//科技创新
					charts(result.data.kjcx_0.xAxis,result.data.kjcx_0.series,1,'chart2');
					//营商环境
					charts(result.data.yshj_0.xAxis,result.data.yshj_0.series,2,'chart3');
					//集约发展
					charts(result.data.jyfz_0.xAxis,result.data.jyfz_0.series,3,'chart4');
					//融合开放
					charts(result.data.rhkf_0.xAxis,result.data.rhkf_0.series,1,'chart5');
					//绿色发展
					charts(result.data.lsfz_0.xAxis,result.data.lsfz_0.series,4,'chart6');
					//园区主体
					tables(result.typeList,0);
					//荣誉列表
					if(result.honorList.length>0){
						var div = '';
						for(var i=0;i<result.honorList.length;i++){
							div += '<div class="swiper-slide">';
							div += '<div class="middle-pic">';
							div += '<img src="${ctx}/static/image/cityDataCenter/jxNew/jiangbei.png">';
							div += '<p>'+ result.honorList[i].honorName+'</p>';
							div += '</div>';
							div += '</div>';
						}
						$("#swiper .swiper-wrapper").html(div);
					}
					var swiper = new Swiper('#swiper', {
						autoplay:true,
						direction : 'vertical',
						slidesPerView : 3,
					    slidesPerGroup : 1,
					    spaceBetween : 10,
					    observer:true,
					    autoPlay:true,
					});
					
					//园区信息
					var kind = result.parkInfo.parkKind == 0 ? '一般省级' : result.parkInfo.parkKind == 1 ? '国家级' : result.parkInfo.parkKind == 2 ? '重点省级' : '筹备';
					$("#logoUrl").attr("src",result.parkInfo.logoUrl);
					$("#companyTitleName").text(result.parkInfo.parkName);
					$("#parkName").text(result.parkInfo.parkName);
					$("#createTime").text(formatCSTDate(result.parkInfo.createTime,'yyyy-MM-dd'));
					$("#parkKind").text(kind);
					$("#leadPerson").text(nvlStr2(result.parkInfo.leadPerson));
					$("#contactName").text(nvlStr2(result.parkInfo.contactName));
					$("#contactPhone").text(nvlStr2(result.parkInfo.contactPhone));
					$("#siteUrl").text(nvlStr2(result.parkInfo.siteUrl));
					$("#positionAddress").text(nvlStr2(result.parkInfo.positionAddress));
					$("#landSquare").text(nvlStr2(result.squareInfo.landSquare)+'平方公里');
					$("#coverSquare").text(nvlStr2(result.squareInfo.coverSquare)+'平方公里');
					var per = nvlStr2(result.squareInfo.coverPercent) == '暂无' ? '暂无' : nvlStr2(result.squareInfo.coverPercent) + '%';
					$("#coverPercent").text(per);
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	//绘制echart图
	function charts(x,y,t,id,y2){
		var op = chartOption;
		if(t == 1){ //1:橙色线；2：蓝色线；3：橙色柱；4：蓝色柱;5:蓝色线柱；6：蓝色单线
			op.series = line1;
			op.xAxis.splitLine.show = true;
		} else if(t == 2){
			op.series = line2;
			op.xAxis.splitLine.show = true;
		} else if(t == 3){
			op.series = bar1;
			op.xAxis.splitLine.show = false;
		} else if(t == 4){
			op.series = bar2;
			op.xAxis.splitLine.show = false;
		} else if(t == 5){
			op.series = [];
			op.series.push(bar1);
			op.series.push(line3);
			op.series[1].yAxisIndex = 1;
		} else if(t == 6){
			op.xAxis.splitLine.show = true;
			op.series = line3;
		}
		if(y){
			var div_ = document.getElementById(id);
			div_.removeAttribute("_echarts_instance_");
			var barChart = echarts.init(div_);
			op.xAxis.data = x;
			if(t == 5){
				op.series[0].data = y;
				op.series[1].data = y2;
			} else {
				op.series.data = y;
			}
			barChart.setOption(op);
		}else{
			$("#"+id).html("<font class=\"unData\">建设中</font>");
		}
	}
	//园区主体
	function tables(list,t){
		var div = '';
		if(list.length>0){
			$("#unDataPark").hide();
			for(var i=0;i<list.length;i++){
				var name = t == 0 ? list[i].typeName : list[i].companyName
				div += "<tr>";
				div += "<td><span class='yellowPoint'></span><span class='dataLimit'>"+name+"</span></td>";
				div += "</tr>";
			}
			$("#demonstrateTable").html(div);
			if($("#demonstrateTable").height() > $("#demonstrateTable").parent().height()){
				$("#demonstrateTable").append(div);
				$("#demonstrateTable").addClass('roll');
				$("#demonstrateTable").css("animation-duration",list.length*4+"s");
			}else{
				$("#demonstrateTable").removeClass('roll');
			}
		} else {
			$("#demonstrateTable").empty();
			$("#unDataPark").show();
		}
	}
	
	//配置
	var chartOption = {
		legend: {
			show: false
	    },
        grid: {
        	right: 20,
        	left: 0,
        	bottom: 0,
        	top: 20,
        	containLabel: true
        },
        tooltip: {
            show:true,
            trigger: 'axis',
        },
        xAxis: {
	        data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
            splitLine: {
                show: false,
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
                fontSize: 11,
            }
		},
		yAxis: [{
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
				fontSize: 11,
				formatter:function(params){
					return params;
				}
			}
        },{
			splitLine: {
				show: false,
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
				fontSize: 11,
				formatter:function(params){
					return params;
				}
			}
        }]
	};
	var bar1 = {
		type: 'bar',
		barWidth: 30,
		color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			offset: 0,
			color: '#FFD154'
		}, {
			offset: 1,
			color: '#FF903E'
		}]),
	}
	var bar2 = {
		type: 'bar',
		barWidth: 30,
		color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			offset: 0,
			color: '#67F8B3'
		}, {
     			offset: 1,
     			color: '#05A6FC'
		}]),
	}
	var line1 = {
		type: 'line',
		symbolSize: 0,
		smooth: true,
		color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
			offset: 0,
			color: '#FFD154'
		}, {
			offset: 1,
			color: '#FF903E'
		}]),
		areaStyle: {
			color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
				offset: 0,
				color: '#FFD154'
			}, {
				offset: 1,
				color: '#FF903E'
			}]),
			opacity: 0.2,
		}
	}
	var line2 = {
		type: 'line',
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
	}
	var line3 = {
		type: 'line',
		symbolSize: 0,
		color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
			offset: 0,
			color: '#67F8B3'
		}, {
     			offset: 1,
     			color: '#05A6FC'
		}])
	}
	// 格式化CST日期的字串
	function formatCSTDate(strDate, format) {
		return formatDate(new Date(strDate), format);
	}
	// 格式化日期,
	function formatDate(date, format) {
		var paddNum = function(num) {
			num += "";
			return num.replace(/^(\d)$/, "0$1");
		}
		// 指定格式字符
		var cfg = {
			yyyy : date.getFullYear(), // 年 : 4位
			yy : date.getFullYear().toString().substring(2),// 年 : 2位
			M : date.getMonth() + 1, // 月 : 如果1位的时候不补0
			MM : paddNum(date.getMonth() + 1), // 月 : 如果1位的时候补0
			d : date.getDate(), // 日 : 如果1位的时候不补0
			dd : paddNum(date.getDate()),// 日 : 如果1位的时候补0
			hh : paddNum(date.getHours()), // 时
			mm : paddNum(date.getMinutes()), // 分
			ss : paddNum(date.getSeconds())
		// 秒
		}
		format || (format = "yyyy-MM-dd hh:mm:ss");
		return format.replace(/([a-z])(\1)*/ig, function(m) {
			return cfg[m];
		});
	}
</script>
</html>