<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<title>宜春工业大数据企业统计</title>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="content fz0">
	    <div class="pro-left">
         	<ul class="production">
				<li class="first-li on" val1="9" val2="index5_code2" val3="企业统计">
					<div class="product-type" id="qytj">企业统计</div>
				</li>
				<li class="first-li" val1="19" val2="index5_code3" val3="企业创新">
					<div class="product-type" id="qycx">企业创新</div>
				</li>
				<li class="first-li" val1=""> 
					<div class="product-type" id="qyhx">企业画像</div>
				</li>
			</ul>
		</div>
		<div class="pro-right">
		    <div class="nav-title">
		    	<form action="" method="post" id="form">
					<input type="hidden" id="industryTypeId" value="">
					<input type="hidden" id="countyId" value="360900">
					<input type="hidden" id="countyName" value="宜春市">
					<input type="hidden" id="type" value="1">
					<input type="hidden" id="kind" value="1">
					<input type="hidden" id="showType" value="0">
				</form>
		    	<div class="nav">	
					<div class="nav-text">
						<div class="nav-titleName" onclick="changeDiv()">
							<font>企业统计</font>
					   </div>
					   <div class="tab-eightIndustry" id="index">
						   	<span>企业概况</span>
						   	<span>企业现状</span>
					   </div>
					   <div class="selects" id="forthTab00" style="display: inline-block;margin-left: 20px;">
							<div class="select select1">
								<p><font id="font1">所属产业</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="ul1"></ul>
								</div>
							</div>
						</div>
					</div>
				</div> 
            </div>
            <div class="content-tab" id="tab0" style="height: calc(100% - 65px);">
				<div class="blockStyle" style="height: 50%;">
				     <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="selects" style="position: absolute; top:10px; left: 20px; z-index: 10;">
							<img src="${ctx}/static/image/cityDataCenter/ycNew/point.png" width="20" style="vertical-align: middle;">
							<div class="select select2" style="vertical-align: middle; margin-left: 0;">
								<p><font id="font2" style="color: #fff;">宜春市</font><i class="fa fa-caret-down"></i></p>
								<div class="select-items">
									<ul id="ul2">
										<li data-val="360900">宜春市</li>
										<li data-val="360983">高安市</li>
										<li data-val="360982">樟树市</li>
										<li data-val="360981">丰城市</li>
										<li data-val="360926">铜鼓县</li>
										<li data-val="360925">靖安县</li>
										<li data-val="360924">宜丰县</li>
										<li data-val="360923">上高县</li>
										<li data-val="360922">万载县</li>
										<li data-val="360921">奉新县</li>
										<li data-val="360902">袁州区</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="chart3" id="chart0"></div>
					<%-- 	<img class="arrow1" src="${ctx}/static/image/cityDataCenter/ycNew/arrowDown.png">
						<img class="arrow2" src="${ctx}/static/image/cityDataCenter/ycNew/arrowDown.png"> --%>
					 </div>
				</div>
		     	<div class="blockStyle" style="height: calc(50% - 10px);">
		     		<div class="outsideBox">
		                <img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
						<div class="legendParent">
						   <span class="on">企业总数</span>
						   <span>规上企业</span>
						   <span>重点企业</span>
						   <span>龙头企业</span>
						   <span>上市企业</span>
						   <span>两化融合</span>
						   <span>专辑特新</span>
						   <span>高新企业</span>
						   <span>产品数量</span>
						</div>
					    <div class="chart3" id="chart11" style="height: calc(100% - 68px);margin-top: 68px;"></div>
					</div>
				</div>
		   </div>
			<div class="content-tab" id="tab1" style="height: calc(100% - 65px);">
				<div class="blockStyle" style="height: 50%;">
		            <div class="spanStyle" style="width: 50%;">
		                <div class="outsideBox">
		                   <img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="part-content">
								<div class="chart-title">
									<font>企业分布热点图 </font>
									<span data="1">各区县详情</span>
									<span class="back-btn" data="1">返回</span>
								</div>
								<div class="chart-tab">
									<div class="chart3" id="chart1"></div>
									<div class="map-areas" id="area1" style="top: 50px;left: 20px;">
										<span style="cursor: pointer;">
											<h4>宜春市</h4>
										</span>
										<span>
											<h4>宜春市</h4>
										</span>
									</div>
									<div class="chart3 chart4" id="chart21"></div>
								</div>
							</div>
					   </div>
				    </div>
					<div class="spanStyle" style="width: calc(50% - 10px);">
					      <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="part-content">
								<div class="chart-title">
									<font>企业按性质分布 </font>
									<span data="2">各区县详情</span>
									<span class="back-btn" data="2">返回</span>
								    <div class="selects fr" style="display: none;">
										<div class="select">
											<p><font id="chartFont22"></font><i class="fa fa-caret-down"></i></p>
											<div class="select-items">
												<ul id="chartUl22"></ul>
											</div>
										</div>
									 </div>
								</div>
								<div class="chart-tab">
									<div class="chart3" id="chart2"></div>
									<div class="chart3 chart4" id="chart22"></div>
								</div>
							</div>
					   </div>	
				   </div>
			  </div>
			  <div class="blockStyle" style="height: calc(50% - 10px);">
		           <div class="spanStyle" style="width: 50%;">
		               <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="part-content">
								<div class="chart-title">
									<font>企业历年注册数量增长 </font>
									<span data="3">各区县详情</span>
									<span class="back-btn" data="3">返回</span>
								    <div class="selects fr" style="display: none;">
										<div class="select">
											<p><font id="chartFont23"></font><i class="fa fa-caret-down"></i></p>
											<div class="select-items">
												<ul id="chartUl23"></ul>
											</div>
										</div>
									 </div>
								</div>
								<div class="chart-tab">
									<div class="chart3" id="chart3"></div>
									<div class="chart3 chart4" id="chart23"></div>
								</div>
							</div>
					   </div>	
				   </div>
				   <div class="spanStyle" style="width: calc(50% - 10px);">
				        <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="part-content">
								<div class="chart-title">
									<font>企业按注册资金分布</font>
									<span data="4">各区县详情</span>
									<span class="back-btn" data="4">返回</span>
								    <div class="selects fr" style="display: none;">
										<div class="select">
											<p><font id="chartFont24"></font><i class="fa fa-caret-down"></i></p>
											<div class="select-items">
												<ul id="chartUl24"></ul>
											</div>
										</div>
									 </div>
								</div>
								<div class="chart-tab">
									<div class="chart3" id="chart4"></div>
									<div class="chart3 chart4" id="chart24"></div>
								</div>
							</div>
						</div>	
				   </div>
			   </div>
		   </div>
            <div class="content-tab" id="tab2" style="height: calc(100% - 65px);">
				<div class="blockStyle" style="height: 50%;">
		            <div class="spanStyle" style="width: 50%;">
		                 <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="part-content">
								<div class="chart-title">
									<font>企业分布热点图</font>
									<span data="5">各区县详情</span>
									<span class="back-btn" data="5">返回</span>
								</div>
								<div class="chart-tab">
									<div class="chart3" id="chart5"></div>
									<div class="map-areas" id="area5" style="top: 50px;left: 20px;">
										<span style="cursor: pointer;">
											<h4>宜春市</h4>
										</span>
										<span>
											<h4>宜春市</h4>
										</span>
									</div>
									<div class="chart3 chart4" id="chart31"></div>
								</div>
							</div>
						</div>	
					</div>
					<div class="spanStyle" style="width: calc(50% - 10px);">
					      <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="part-content">
								<div class="chart-title">
									<font>企业单位人员规模划分</font>
									<span data="6">各区县详情</span>
									<span class="back-btn" data="6">返回</span>
								    <div class="selects fr" style="display: none;">
										<div class="select">
											<p><font id="chartFont32"></font><i class="fa fa-caret-down"></i></p>
											<div class="select-items">
												<ul id="chartUl32"></ul>
											</div>
										</div>
									 </div>
								</div>
								<div class="chart-tab">
									<div class="chart3" id="chart6"></div>
									<div class="chart3 chart4" id="chart32"></div>
								</div>
							</div>
						</div>	
					</div>
				</div>
				<div class="blockStyle" style="height: calc(50% - 10px);">
		     		<div class="spanStyle" style="width: 50%;">
		     		     <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="part-content">
								<div class="chart-title">
									<font>总企业数量及增长状况</font>
									<span data="7">各区县详情</span>
									<span class="back-btn" data="7">返回</span>
								    <div class="selects fr" style="display: none;">
										<div class="select">
											<p><font id="chartFont33"></font><i class="fa fa-caret-down"></i></p>
											<div class="select-items">
												<ul id="chartUl33"></ul>
											</div>
										</div>
									 </div>
								</div>
								<div class="chart-tab">
									<div class="chart3" id="chart7"></div>
									<div class="chart3 chart4" id="chart33"></div>
								</div>
							</div>
						</div>	
					</div>
		         	<div class="spanStyle" style="width: calc(50% - 10px);">
		         	     <div class="outsideBox">
		                   	<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="part-content">
								<div class="chart-title">
									<font>企业单位人员学历结构</font>
									<span data="8">各区县详情</span>
									<span class="back-btn" data="8">返回</span>
								    <div class="selects fr" style="display: none;">
										<div class="select">
											<p><font id="chartFont34"></font><i class="fa fa-caret-down"></i></p>
											<div class="select-items">
												<ul id="chartUl34"></ul>
											</div>
										</div>
									 </div>
								</div>
								<div class="chart-tab">
									<div class="chart3" id="chart8"></div>
									<div class="chart3 chart4" id="chart34"></div>
								</div>
							</div>
						</div>	
					</div>
				</div>
		    </div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-liquidfill.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/ycFourthData.js"></script>
<script type="text/javascript">
	$(function(){
		$(".head>a:eq(5)").addClass("on");
		//左侧菜单栏点击事件
		$(".first-li").on("click",function(){
			var v1 = $(this).attr("val1");
			var v2 = $(this).attr("val2");
			var v3 = $(this).attr("val3");
			if(v1!=''){
				checkRight(v1,'',v2,v3);
			} else { alert("建设中!")}
		});
		getIndustry();
		getChartData();
		$(document).click(function(event){
			if(!$(".select p").is(event.target) && $(".select p").has(event.target).length === 0){
				$('.select-items').slideUp();
			}
		});
		$(".select p").on("click",function(){
			if($(this).next().css("display")!='block'){
				$(".select p").next().slideUp();
			}
			$(this).next().slideToggle();
		})
		$("#ul2 li").on("click",function(){
			var text = $(this).text();
			var val = $(this).attr("data-val");
			$("#font2").text(text);
			$("#countyId").val(val);
			$(this).parents('.select-items').slideToggle();
			$(".back-btn").hide().prev().show().siblings(".selects").hide();
			getChartData();
			var type = $('#showType').val();
			$("#tab"+type).fadeIn("fast");
		})
		$("#index span").on("click",function(){
			var ind = $(this).index()+1;
			$('#showType').val(ind);
			$(this).addClass("on").siblings().removeClass("on");
			$("#type").val(1);
			$("#kind").val(ind+1);
			$("#countyId").val('360900');
			$("#countyName").val('宜春市');
			$(".map-areas span:eq(1)").removeClass("on");
			$(".content-tab").fadeOut("fast");
			setTimeout(function(){
				getChartData();
				$("#tab"+ind).fadeIn("fast");
			},210);
		})
		$(".legendParent span").on("click",function(){
			var ind = $(this).index()+1;
			$(this).addClass("on").siblings().removeClass("on");
		    if(ind > 5){ ind++;}
		    getTabData(1,ind);
		
		});
		$(".chart-title span").on("click",function(){
			var t = $(this).text();
			var ind = $(this).index();
			var val = $(this).attr('data');
			$(this).hide().siblings("span").show();
			if(t == '返回'){ $(this).siblings(".selects").hide()}
			else { $(this).siblings(".selects").show()}
			console.log(ind);
			if(ind == 1){
				$("#chart"+val).fadeOut("fast");
				setTimeout(function(){ 
					if(val < 5){ $("#chart2"+val).fadeIn("fast");getTabData(2,val,1);}
					else { $("#chart3"+Number(val-4)).fadeIn("fast");getTabData(3,val-4,1,false,val);}
					var type = $('#showType').val();
					$("#tab"+type).fadeIn("fast");
				},190);
				if(val == 1 || val == 5){
					$(".map-areas").hide();
				}
			} else if(ind == 2){
				if(val < 5){ $("#chart2"+val).fadeOut("fast");}
				else { $("#chart3"+Number(val-4)).fadeOut("fast");}
				setTimeout(function(){ $("#chart"+val).fadeIn("fast"); },190);
				if(val == 1 || val == 5){
					$(".map-areas").show();
				}
			}
		})
		$(".map-areas span:eq(0)").on("click",function(){
			$(this).next().removeClass("on");
			$("#countyId").val('360900');
			$("#countyName").val('宜春市');
			$("#type").val(1);
			getChartData();
			var type = $('#showType').val();
			$("#tab"+type).fadeIn("fast");
		});
	});
	function getIndustry(){
		var param = {
			"orgId" : $("#countyId").val(),
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/industryTypeForOrgId/list",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					var _div = '<li data-val="">所属产业</li>';
					for(var i=0;i<result.list.length;i++){
						_div += '<li data-val="'+result.list[i].typeId+'">'+result.list[i].typeName+'</li>'
					}
					$("#ul1").html(_div);
					$("#ul1 li").on("click",function(){
						var ind = $(this).index()+1;
						var text = $(this).text();
						var val = $(this).attr("data-val");
						$("#font1").text(text);
						$("#type").val(1);
						$("#countyId").val('360900');
						$("#countyName").val('宜春市');
						$(".map-areas span:eq(1)").removeClass("on");
						$("#industryTypeId").val(val);
						$(this).parents('.select-items').slideToggle();
						$(".back-btn").hide().prev().show().siblings(".selects").hide();
						getChartData();
						var type = $('#showType').val();
						$("#tab"+type).fadeIn("fast");
					})
				}
			},
			error : function() {
				alert("校验权限异常");
			}
		});
	};
	function getTabData(x,y,z,t,value){  //参数：三大区块分类1,2,3； 后面2大区块的4大区块1,2,3,4；区块里面的分类
		var typeId = $("#industryTypeId").val() == '360900' ? '' : $("#industryTypeId").val();
		xy = x.toString() + y.toString();
		var param = {
			"coorX": x,
			"coorY": y,
			"coorZ": z,
			"industryTypeId": typeId
		};
		if(value == 5){
			param.coorX = 2;
			param.coorY = 1;
		}
		if(value == 7){
			param.coorY = 1;
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/officeCompanyStatisticsDetails/data",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				var _div = '';
				var left = result.value.dataL;
				var right = result.value.dataR;
				if(x == 1){
					var datas = [
						{ name: '企业总数', value: left.total},
						{ name: '规上企业', value: left.vgs},
						{ name: '重点企业', value: left.vzd},
						{ name: '龙头企业', value: left.vlt},
						{ name: '上市企业', value: left.vss},
						{ name: '两化融合', value: left.vlh},
						{ name: '专精特新', value: left.vzt},
						{ name: '高新企业', value: left.vgq},
						{ name: '产品数量', value: left.vcp}
					];
			    	chartBar(x,'chart1'+x,right);
				} else { 
					if(left){  //筛选列表
						var dl = left.length > 10 ? 10 : left.length;  //最多10个
						var tempData = [];
						for(var i = 0; i < dl; i++){
							if(left[i].name){
								_div += '<li data="'+(i+1)+'">' + left[i].name +'</li>';
							} else { 
								_div += '<li data="'+left[i].year+'">' + left[i].year + '年' + '</li>';
							}
						}
						$("#chartUl"+x+y).html(_div);
						$("#chartUl"+x+y+' li').on("click",function(){          //点击选项效果
							var val = $(this).attr("data");
							var text = $(this).text();
							$("#chartFont"+x+y).text(text);
							$(this).parents('.select-items').slideToggle();
							getTabData(x,y,val,1,value);
						})
						if(!t){
							if(left[0].name){
								$("#chartFont"+x+y).text(left[0].name);
							} else { $("#chartFont"+x+y).text(left[0].year + '年');}
						}
					}
			    	chartBar(x,'chart'+x+y,right);
				}
			},
			error : function() {
				alert("校验权限异常");
			}
		});
	}
	function chartBar(type,id,datas) {
		console.log(type,id)
		console.log(datas)
		var chart = echarts.init(document.getElementById(id));
		var data = {
			    title: ['12-02', '12-03', '12-04', '12-05', '12-06'],
			};
		var x = [];
		for(var i = 1; i < datas.length; i++){
			data.title[i-1] = datas[i].SPACENAME;
			var temp = {
					order : datas[i].ORDERNUM,
					value : datas[i].TOTAL,
					tooltip: {
						formatter: function(param){
							var order = param.data.order ? '排名：' + param.data.order : ''
							return param.seriesName +'：' + param.value + '<br>'+order;
						}
					}
			}
			x.push(temp)
		}
	    var fz = 18;
	    if(width <= 1600){
	    	fz = 16;
	    }
	    if(width <= 1440){
	    	fz = 14;
	    }
		var option = {
		    title: {
		        text: '各区县详情',
		        top: 30,
		        textStyle: {
		            color: '#fff',
		            fontSize: fz
		        }
		    },
		    grid: {
		    	top: 90,
		    	bottom: 20
		    },
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'cross',
		            label: {
		                backgroundColor: '#283b56'
		            }
		        },
		        formatter: function(params){
	            	return '企业数量：'+params[0].value;
	            }, 
		    },
		    legend: {
		        top: 32,
		        data: ['企业数量('+datas[0].TOTAL+')'],
		        textStyle: {
		            color: '#fff'
		        }
		    },
		    xAxis: [{
		        type: 'category',
		        data: data.title,
		        splitLine: {
		            show: false
		        },
		        axisLine: {
		            show: false
		        },
		        axisLabel: {
			        color: '#83adba',
		            interval : 0
		        },
		        axisTick: {
		            show: false
		        }
		    }],
		    yAxis: [{
		        type: 'value',
		        name: '单位：个',
		        nameTextStyle: { color: '#83adba'},
		        scale: true,
		        minInterval: 1,
		        min: 0,
		        splitLine: {
		            lineStyle: {
		                color: '#333'
		            }
		        },
		        axisLine: {
		            lineStyle: {
		                color: '#333'
		            }
		        },
		        axisLabel: {
			        color: '#83adba'
		        },
		        axisTick: {
		            show: false
		        }
		    }],
		    series: [{
		        name: '企业数量('+datas[0].TOTAL+')',
		        type: 'bar',
		        barWidth : 20,
		        yAxisIndex: 0,
		        data: x,
		        itemStyle: {
		            normal: {
		                color: {
		                    type: 'linear',
		                    x: 0,
		                    y: 0,
		                    x2: 0,
		                    y2: 1,
		                    colorStops: [{
		                        offset: 0, color: '#dade16' // 0% 处的颜色
		                    }, {
		                        offset: 1, color: '#f1c851' // 100% 处的颜色
		                    }],
		                    globalCoord: false // 缺省为 false
		                }
		            }
		        },
		        label: {
		            normal: {
		                show: true,
		                position: 'top',
		                color: '#0689FF'
		            }
		        }
		    }]
		};
/* 		if(xy == '11') { option.legend.data[0] = '企业总数'; option.series[0].name = '企业总数'; }
		if(xy == '12') { option.legend.data[0] = '规上企业'; option.series[0].name = '规上企业'; }
		if(xy == '13') { option.legend.data[0] = '重点企业'; option.series[0].name = '重点企业'; }
		if(xy == '14') { option.legend.data[0] = '龙头企业'; option.series[0].name = '龙头企业'; }
		if(xy == '15') { option.legend.data[0] = '上市企业'; option.series[0].name = '上市企业'; }
		if(xy == '17') { option.legend.data[0] = '两化融合'; option.series[0].name = '两化融合'; }
		if(xy == '18') { option.legend.data[0] = '专精特新'; option.series[0].name = '专精特新'; }
		if(xy == '19') { option.legend.data[0] = '高新企业'; option.series[0].name = '高新企业'; }
		if(xy == '110') { option.legend.data[0] = '产品个数'; option.series[0].name = '产品个数'; } */
		if(xy == '11') { option.legend.data[0] = ''; option.series[0].name = ''; }
		if(xy == '12') { option.legend.data[0] = ''; option.series[0].name = ''; }
		if(xy == '13') { option.legend.data[0] = ''; option.series[0].name = ''; }
		if(xy == '14') { option.legend.data[0] = ''; option.series[0].name = ''; }
		if(xy == '15') { option.legend.data[0] = ''; option.series[0].name = ''; }
		if(xy == '17') { option.legend.data[0] = ''; option.series[0].name = ''; }
		if(xy == '18') { option.legend.data[0] = ''; option.series[0].name = ''; }
		if(xy == '19') { option.legend.data[0] = ''; option.series[0].name = ''; }
		if(xy == '110') { option.legend.data[0] = ''; option.series[0].name = ''; }
		
		if(xy == '34') { 
			option.yAxis[0].name = '单位：人'; 
			option.legend.data[0] = '人员数量('+datas[0].TOTAL+')';
			option.series[0].name = '人员数量('+datas[0].TOTAL+')';
		}
		if(type == 1){
		    if(width <= 1600){
		    	option.title.top = 20;
		    	option.legend.top = 20;
		    	option.grid.top = 70;
		    }
		}
		chart.setOption(option);
		$('#tab1').hide();
		$('#tab2').hide();
	}
	var chartData = '';
	function getChartData(){
		var id = $("#industryTypeId").val();
		var countyId = $("#countyId").val();
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/officeCompanyStatistics/data",
			type : "post",
		 	async: false,
			data : {
				"industryTypeId": id,
				"countyId": countyId == '360900' ? '' : countyId
			},
			dataType : "json",
			success : function(result){
				$(".chart3").show();
				loadChart(result.value);
				chartData = result.value;
				getTabData(1,1,1);
			},
			error : function() {
				alert("校验权限异常");
			}
		});
	}
	function loadChart(value){
		var chart0 = echarts.init(document.getElementById('chart0'));
		var chart1 = echarts.init(document.getElementById('chart1'));
		var chart2 = echarts.init(document.getElementById('chart2'));
		var chart3 = echarts.init(document.getElementById('chart3'));
		var chart4 = echarts.init(document.getElementById('chart4'));
		var chart5 = echarts.init(document.getElementById('chart5'));
		var chart6 = echarts.init(document.getElementById('chart6'));
		var chart7 = echarts.init(document.getElementById('chart7'));
		var chart8 = echarts.init(document.getElementById('chart8'));
		var t = Number($("#type").val());
		var k = Number($("#kind").val());
		if(k == 1){
			initChartMain(chart0,value.value0);
		} else if(k == 2){
			if(t == 1){ initChartMap(chart1,value.value1);}
			
			var arr2 = value.value2;
			var xAxisData2=new Array();
			for(var i = 0 ; i < arr2.length ; i++){
					xAxisData2[i] = arr2[i].name;
			}
			initChartB(chart2,xAxisData2,arr2,"企业性质分布");
			
			var arr4 = value.value4;
			var xAxisData4=new Array();
			for(var i = 0 ; i < arr4.length ; i++){
					xAxisData4[i] = arr4[i].name;
			}
			initChartB(chart4,xAxisData4,arr4,"企业注册资金分布");
			
			var arr3 = value.value3;
			var xAxisData3=new Array();
			var seriesData30=new Array();
			var seriesData31=new Array();
			console.log(arr3)
			for(var i = 0 ; i < arr3.length ; i++){
				if(i>=10){
					break;
				}else{
					xAxisData3[i] = arr3[i].year;
					seriesData30[i] = arr3[i].num;
					seriesData31[i] = arr3[i].per;
				}
			}
			initChartA(chart3,xAxisData3,seriesData30,seriesData31);
		} else {
			if(t == 1){ initChartMap(chart5,value.value1);}
			
			var arr5 = value.value5;
			var xAxisData5=new Array();
			var seriesData50=new Array();
			var seriesData51=new Array();
			for(var i = 0 ; i < arr5.length ; i++){
				if(i>=10){
					break;
				}else{
					xAxisData5[i] = arr5[i].year;
					seriesData50[i] = arr5[i].num;
					seriesData51[i] = arr5[i].per;
				}
			}
			initChartA(chart7,xAxisData5,seriesData50,seriesData51);
			
			var arr6 = value.value6;
			var xAxisData6=new Array();
			for(var i = 0 ; i < arr6.length ; i++){
					xAxisData6[i] = arr6[i].name;
			}
			initChartB(chart6,xAxisData6,arr6,"企业单位人员规模划分");
			
			var arr8 = value.value8;
			var xAxisData8=new Array();
			for(var i = 0 ; i < arr8.length ; i++){
					xAxisData8[i] = arr8[i].name;
			}
			initChartB(chart8,xAxisData8,arr8,"企业单位人员学历结构");
		}
		$(".chart4").hide();
		$(".back-btn").hide().prev().show().siblings(".selects").hide();
	}
	
	function initChartMain(chart,json){
		var arr = [
			{ name: '企业总数', value: json.total},
			{ name: '规上企业', value: json.vgs},
			{ name: '重点企业', value: json.vzd},
			{ name: '龙头企业', value: json.vlt},
			{ name: '上市企业', value: json.vss},
			{ name: '两化融合', value: json.vlh},
			{ name: '专精特新', value: json.vzt},
			{ name: '高新企业', value: json.vgq},
			{ name: '产品数量', value: json.vcp}
		];
		var pp = [];
		
		var sz = 150;
		var fz2 = 24;
		var fz3 = 18;
		var sum = 40;
		if(width < 1440){
			sz = 100;
			fz2 = 18;
			fz3 = 14;
			sum = 20;
		}
		for(var i = 0; i < sum;i++){
			var temp = {
	            name: ' ',
	            value: [Math.random() * 10, Math.random() * 20, 100]
			}
			pp.push(temp)
		}
		var series = [/* {
	        type: 'scatter',
	        symbolSize: (d, i) => Math.random() * 20,
	        itemStyle: {
	            normal: {
	                color: 'transparent',
	                borderColor: '#031636'//'#00ceff'
	            }
	        },
	        data: pp
	    } */];
		var poi = [['50%','50%'],['17.5%','25%'],['32.5%','25%'],['67.5%','25%'],['82.5%','25%'],['17.5%','75%'],['32.5%','75%'],['67.5%','75%'],['82.5%','75%']];
	    for(var j=0;j<arr.length;j++){
			var s1 = {
		        type: 'liquidFill',
		        data: [{
		        	value: 0.5,
		        	name: arr[j].name,
		        	val: arr[j].value
		        }, 0.4, 0.3],
		        color: j == 0 ? ['#F3CF76'] : ['#00B9F5'], //颜色
		        center: poi[j], //位置
		        outline: {  //边框
		            show: true,
		            borderDistance: 1,
		            itemStyle: {
		                color: '#FFF',
		                borderColor: j == 0 ? '#F3CF76' : '#00B9F5',
		                borderWidth: 1
		            }
		        },
		        radius: j==0?'50%':'35%', //半径
		        backgroundStyle: {
		            color: '#0E5876'
		        },
		        label: {
		            color: '#f1c851',
		            insideColor: '#fff',
		            fontSize: fz2,
	            	formatter: function(params){
	            		
	            		return params.data.val + "\n{a|" + params.name + '}';
	            	},
	            	rich: {
	            		a: {
	            			fontSize: fz3
	            		}
	            	}
		        }
		    };
			series.push(s1)
		}
		var option = {
		    xAxis: {
		        show: false,
		        min: 0,
		        max: 10
		    },
		    yAxis: {
		        show: false,
		        scale: true,
		        min: 0,
		        max: 20
		    },
		    series: series
		};
		chart.setOption(option);
	 	 /*  chart.on('click', function (params) {
		    var ind = params.seriesIndex + 1;
		    if(ind > 5){ ind++;}
		    getTabData(1,ind);
		});    */
	}
	
	function initChartMap(chart,seriesData,chart7){
		chart.showLoading();
		$.get('${ctx}/static/map/360900.json', function (ycJson) {
			chart.hideLoading();
			echarts.registerMap('YC', ycJson);
			var mapOption = {
			        title: {
			            show: false
			        },
			        tooltip: {
			            trigger: 'item',
			            showDelay: 0,
			            transitionDuration: 0.2,
			            formatter: function (params) {
			                var value = (params.value + '').split('.');
			                value = value[0].replace(/(\d{1,3})(?=(?:\d{3})+(?!\d))/g, '$1,');
			                return params.seriesName + '<br/>' + params.name + ': ' + value;
			            }
			        },
			        visualMap: {
			            left: 'right',
			            min: 0,
			            max: 500,
			            textStyle: {
			            	color: '#fff'
			            },
			            inRange: {
			                color: ['#ffffbf', '#a50026']
			            },
			            text:['高', '低'],           // 文本，默认为数值文本
			            calculable: false
			        },
			        toolbox: {
			            show: false
			        },
			        series: [
			            {
			                name: '宜春市企业分布热点图',
			                type: 'map',
			                roam: false,
					        zoom: 1.2,
					        aspectScale: 1,
			                map: 'YC',
			                selectedMode: 'single',
			                itemStyle:{
			                    normal:{label:{show:true}},
			                    emphasis:{label:{show:true}}
			                },
			                // 文本位置修正
			                textFixed: {
			                    Alaska: [20, -20]
			                },
			                data:seriesData
			            }
			        ]
			    };
	
			    chart.setOption(mapOption);
			    var data = [ 
					{name : '宜春市', value : ["360900",'YICHUN']}, 
					{name : '袁州区', value : ["360902",'YUANZHOU']}, 
					{name : '奉新县', value : ["360921",'FENGXIN']}, 
					{name : '万载县', value : ["360922",'WANZAI']}, 
					{name : '上高县', value : ["360923",'SHANGGAO']}, 
					{name : '宜丰县', value : ["360924",'YIFENG']}, 
					{name : '靖安县', value : ["360925",'JINGAN']}, 
					{name : '铜鼓县', value : ["360926",'TONGGU']}, 
					{name : '丰城市', value : ["360981",'FENGCHENG']}, 
					{name : '樟树市', value : ["360982",'ZHANGSHU']}, 
					{name : '高安市', value : ["360983",'GAOAN']} 
				]
			    chart.off('click');
			    chart.on("click",function(params){
			    	console.log(params)
			    	var k = $("#kind").val();
			    	$("#type").val(2);
			    	console.log(k)
			    	if($("#countyName").val() == params.name){
		    			$("#countyId").val('360900');
		    			$("#countyName").val('宜春市');
		    			if(k==2){ $("#area1 span:eq(1)").removeClass("on");}//.map-areas
		    			else if(k==3){$("#area5 span:eq(1)").removeClass("on");}
		    			getChartData();
			    	} else {
				    	for(var i=0;i<data.length;i++){
				    		if(data[i].name == params.name){
				    			$("#countyId").val(data[i].value[0]);
				    			$("#countyName").val(params.name);
				    			if(k==2){ $("#area1 span:eq(1)").addClass("on").find("h4").text(params.name);}//.map-areas
				    			else if(k==3){ $("#area5 span:eq(1)").addClass("on").find("h4").text(params.name);}
				    		}
				    	}
				    	getChartData();
				    	var type = $('#showType').val();
						$("#tab"+type).fadeIn("fast");
			    	}
			    })
		});
	}
	function initChartA(chart,xAxisData,seriesData0,seriesData1){
		/*折线图配置*/
		var barOption = {
			backgroundColor:'' ,
			title : {
				text : '',
				x:'center',
				textStyle : {
					color : "#fff",
					fontSize : 16
				}
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				top: 30,
				x:'center',
				textStyle:{
					fontSize:14,
					color: '#fff'
				},
				data:['数量','增长率']
		    },
			grid : {
				top: 70,
				bottom: 5,
				left:'5%',
				right:'5%',
				containLabel : true,
			},
			xAxis : [ {
				type : 'category',
				boundaryGap : true,
				data : xAxisData.reverse(),
				axisLine : {
					show:false
				},
				axisTick : {
					show:false
				},
				axisLabel :{  
	        	    interval:0,
	        	    rotate:0,
			        color: '#fff'
	        	}
			} ],
			yAxis : [
				{
			        type: 'value',
			        name: "单位：个",
			        nameTextStyle: {
				        color: '#fff'
			        },
			        axisLabel: {
			            formatter: '{value}',
				        color: '#fff'
			        },
			    	splitLine:{
			    		lineStyle:{
			    			opacity:0
			    		}
			    	}
			    },
			    {
			        type: 'value',
			        name: "增长率",
			        nameTextStyle: {
				        color: '#fff'
			        },
			        axisLabel: {
			            formatter: '{value}%',
				        color: '#fff'
			        },
			    	splitLine:{
			    		lineStyle:{
			    			opacity:0.4
			    		}
			    	}
			    }
			],
			series : [
				{
					name : '数量',
					type : 'bar',
					barWidth : "20",
					yAxisIndex : 0,
					data : seriesData0.reverse(),
					itemStyle : {
				    	normal: {
				    		color: '#0589FF'
				    	}
				    },
					label : {
				         normal: {
				             show: true,
				             position: 'top'
				         }
				    }
				},
				{
					name : '增长率',
					type : 'line',
					yAxisIndex : 1,
					lineStyle : {
						normal:{
			        		color:"#F46005"
			        	}
					},
					data : seriesData1.reverse(),
					label : {
				         normal: {
				             show: true,
				             position: 'top'
				         }
				    }
				},
			]
		};
	    if(width <= 1366){
	    	barOption.legend.top = 35;
	    }
		chart.setOption(barOption);
	}
	
	function initChartB(chart,legendData,seriesData,seriesName){
		for(var i=0;i<legendData.length;i++){
			if(Number(seriesData[i].value)==0){
				seriesData.splice(i,1);
				legendData.splice(i,1);
				i--;
			}
		}
		var pieOption = {
			backgroundColor:'' ,
		    title : {
		        text: '',
		        subtext: '',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    color:['#FFA900','#FEDD06','#89F1AA','#0589FF','#9ED0FA','#C81974','#725196'],
		    legend: {
		        orient: 'vertical',
		        left: 'right',
		        textStyle: {
			        color: '#fff'
		        },
		        data: legendData
		    },
		    series : [
		        {
		            name: seriesName,
		            type: 'pie',
		            radius : '55%',
		            center: ['40%', '60%'],
		            data:seriesData,
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            },
		            label: {
		            	show: true,
		            	formatter: '{b}({c})'
		            }
		        }
		    ]
		};
		if(seriesData.length == 0){
			pieOption.title = {
		        text: '暂未统计到数据，持续完善中',
		        left:'center',
		        top:'center',
		        textStyle : {
		        	color: '#fff',
		        	fontSize: 24
		        }
			}
		}
		chart.setOption(pieOption);
	}
	function changeDiv(){
		$(".content-tab").fadeOut("fast");
		$(".tab-eightIndustry>span").removeClass("on");
		$("#countyName").text('宜春市');
		$("#countyId").val('360900');
		$("#type").val(1);
		$("#kind").val(1);
		$(".legendParent span:eq(0)").addClass("on").siblings().removeClass("on");
		setTimeout(function(){
			getTabData(1,1);
			$("#tab0").fadeIn("fast");
		},210);
	}
</script>
</html>
