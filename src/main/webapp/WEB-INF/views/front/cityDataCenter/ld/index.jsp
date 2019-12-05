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
<title>锂电大数据首页</title>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="content">
		<input type="hidden" id="type" name="type" value="1">
		<input type="hidden" id="proId" name="proId" value="">
		<input type="hidden" id="year" name="year" value="">
		<input type="hidden" id="month" name="month" value="">
		<div class="column w27">
			<div class="column-box">
				<div class="row-box h40">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
					<div class="tab-title">
						<span class="on">每日价格行情</span>
						<font id="cpjgTime">2018-11-26</font>
					</div>
					<div class="tab cpjg-table" style="overflow: hidden;" onclick="location.href='${ctx}/front/cityDataCenter/ycLdIndex/3?type=0'">
						<div class="cpjg-bar">
							<span class="w60">产品名称</span>
							<span class="w20">单位</span>
							<span class="w20">均价</span>
						</div>
						<div class="cpjg">
							<table id="cpjgTable"></table>
						</div>
					</div>
				</div>
				<div class="row-box h35 no-row-box">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
					<div class="tab-title">
						<span class="on" id="jckPro"></span>
						<font class="clickable-font">出口量</font><font class="clickable-font on">进口量</font>
						<div class="jck-list">
							<ul id="jckList">
								<li>氢氧化锂（HS28252010）</li>
								<li>氢氧化锂（HS28252010）</li>
								<li>氢氧化锂（HS28252010）</li>
								<li>氢氧化锂（HS28252010）</li>
								<li>氢氧化锂（HS28252010）</li>
							</ul>
						</div>
					</div>
					<div class="tab ">
						<div class="process onTopProcess" id="holi" onclick="location.href='${ctx}/front/cityDataCenter/ycLdIndex/14?type=1'">
						</div>
					</div>
				</div>
				<div class="row-box h25">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
					<div class="tab-title">
						<span class="on">不同材料锂电池装机占比（MWh,%）</span>
					</div>
					<div class="tab">
						<div class="process">
							<div class="dib w50" id="install" style="height: 100%;"></div>
							<div class="material w50">
								<div class="count-item">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="column w45">
			<div class="column-box center-box">
				<div class="row-box lidian-box nobd">
					<div class="dib w50" id="w501">
						<p id="p-ljData"></p>
						<div class="li-number">
						 <font id="ld-ljData1" class="dib"></font>
							<span class="dib">
								<ul class="dataNums inrow">
									<li class="dataOne ">
									<div class="dataBoc">
										<div class="tt" t="38">
											<span class="dib">.</span>
										</div>
									</div>
								</li>
							</ul>
							</span>
							<font id="ld-ljData2" class="dib" ></font>
							<img id="img1">
						</div>
					</div>
					<div class="dib w50" id="w502">
						<p id="car-byData"></p>
						<div class="li-number">
							<font class="dib"  id="ld-byData1" ></font>
 							<img id="img2">
						</div>
					</div>
				</div>
				<div class="row-box nobd main-box">
					<div class="main-tabs" id="processTab">
						<span class="on"><font>锂资源分布</font></span>
						<span><font>锂电产业链</font></span>
						<span><font>重点企业分布</font></span>
					</div>
					<div class="tab process-tab" style="overflow: hidden;">
						<div class="process" id="processTab0" style="text-align: center;">
							<img class="jx-map" src="${ctx}/static/image/cityDataCenter/yc/jxmap.png">
							<div class="jx-point">
								<div class="points">
									<p>锂资源储量：250万吨</p>
								</div>
								<div class="points points2">
								</div>
								<div class="points points3">
								</div>
							</div>
							<!-- <div class="echart-map" id="map1"></div> -->
						</div>
						<div class="process" id="processTab1">
							<div class="process-bars">
								<div class="process-bar">
									<font>原材料</font>
								</div>
								<div class="process-bar">
									<font>电池材料及电芯</font>
								</div>
								<div class="process-bar">
									<font>应用</font>
								</div>
							</div>
							<div class="process-pic" onclick="location.href='${ctx}/front/cityDataCenter/ycLdIndex/8'">
								<div class="floor first">
									<div class="inner-floor">
										<span class="w100 clickClass"><font>锂矿石</font></span>
										<div class="alignCenter"></div>
									</div>
									<div class="inner-floor">
										<span class="w100"><font>锂云母精矿</font></span>
										<div class="alignCenter"></div>
									</div>
									<div class="inner-floor">
										<span class="w50"><font>氢氧化锂</font></span>
										<span class="w50"><font>碳酸锂</font></span>
										<div class="alignCenter"></div>
									</div>
									<div class="line-box line-box1">
										<div class="line line1"></div>
										<div class="line line2"></div>
										<div class="line line3"></div>
										<div class="line line4"></div>
										<div class="line line5"></div>
										<div class="line line6"></div>
										<div class="line line7"></div>
										<div class="line line8"></div>
										<div class="point point1"></div>
										<div class="point point2"></div>
										<div class="point point1 point3"></div>
										<div class="point point2 point4"></div>
									</div>
								</div>
								<div class="floor second">
									<div class="inner-floor">
										<span><font>正极</font></span>
										<span><font>负极</font></span>
										<span><font>隔膜</font></span>
										<span class="w1"><font>电解液</font></span>
										<div class="alignCenter"></div>
									</div>
									<div class="inner-floor">
										<span class="w100"><font>电芯制造与pack封装</font></span>
										<div class="alignCenter"></div>
									</div>
									<div class="inner-floor">
										<span class="w100"><font>动力、消费、储能电池</font></span>
										<div class="alignCenter"></div>
									</div>
									<div class="ldsbpt">
										<span class="w100"><font>锂电设备配套</font></span>
										<div class="alignCenter"></div>
									</div>
									<div class="line-box line-box2">
										<div class="line line1"></div>
										<div class="line line2"></div>
										<div class="line line3"></div>
										<div class="line line4"></div>
										<div class="line line5"></div>
										<div class="line line6"></div>
										<div class="line line7"></div>
										<div class="line line8"></div>
										<div class="line line9"></div>
										<div class="line line10"></div>
										
										<div class="point point1"></div>
										<div class="point point2"></div>
										<div class="point point3"></div>
										<div class="point point4"></div>
										<div class="point point5"></div>
										<div class="point point6"></div>
										<div class="point point1 point7"></div>
										<div class="point point2 point8"></div>
										<div class="point point3 point9"></div>
										<div class="point point4 point10"></div>
										<div class="point point5 point11"></div>
										<div class="point point6 point12"></div>
									</div>
								</div>
								<div class="floor third">
									<span class="w100 clickClass"><font>新能源车、3C数码、工业储能</font></span>
									<div class="alignCenter"></div>
								</div>
							</div>
						</div>
						<div class="process" id="processTab2" style="display:block;height: 100%;overflow: hidden;">
							<div class="map-item" id="selectMap">
								<p class="on">锂电正极材料</p>
								<p>新能源汽车电机及配套商</p>
								<p>动力锂电池</p>
								<p>新能源汽车产业</p>
							</div>
							<div class="echart-map2" id="map2" ></div>
							<div class="companys">
								<div class="company-box" id="companyBox"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="column w27">
			<div class="column-box">
				<div class="row-box h40">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
					<div class="tab-title hangye-title">
						<span class="on">宜春锂电行业经济指标</span>
					</div>
					<div class="tab">
						<div class="tab-bar">
							<div class="dib infor-box">
								<img src="${ctx}/static/image/liData/circle1.png">
								<div class="infor-number">
									<h3 class="orangeT">26036</h3>
									<p>今日累计电量</p>
								</div>
							</div>
							<div class="dib chart-box">
								<p>实时电量曲线<font class="fr">单位：万千瓦时</font></p>
								<div class="chart3" id='elecLine'></div>
							</div>
						</div>
						<div class="tab-bar">
							<div class="dib infor-box">
								<img src="${ctx}/static/image/liData/circle2.png">
								<div class="infor-number">
									<h3 class="orangeT">230</h3>
									<p>工业投资项目</p>
								</div>
							</div>
							<div class="dib chart-box">
								<p class="yellowT">主营业务收入（近一年）<font class="fr">单位：万千瓦时</font></p>
								<div class="chart3" id='elecBar'></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row-box h30">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
				 	<div class="tab-title tab-title-science">
					    <span class="on">锂电专家</span>
						<span>科研机构</span>
						<span>产业峰会</span>
						<font href="javascript:;" onclick="goIndex6()">更多 &gt;</font>
					</div>
					<div class="tab process-tab">
						<div class="expert-list" id="science-1">
						   <div class="swiper-container loop-swiper" id="swiper1" style="display:block;height: 100%;">
							    <div class="swiper-wrapper" id="swiper1Chirld">
								 </div>
							 </div>
						</div>
						<div class="science-list expert-list" id="science-2" style="display:block;height: 100%;">
							<div class="swiper-container loop-swiper" id="swiper2">
							    <div class="swiper-wrapper" id="swiper2Chirld">
								 </div>
							 </div>
						</div>
						<div class="science-list" id="science-3" style="display:block;height: 100%;">
							<div class="swiper-container loop-swiper" id="swiper3">
							    <div class="swiper-wrapper" id="swiper3Chirld">
								 </div>
							  <div class="swiper-pagination"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row-box h30">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
				    <input type="hidden" id="kindId" value=""/>
				    <input type="hidden" id="type" value="0"/>
				    <input type="hidden" id="type1" value="0"/>
				    <input type="hidden" id="typeId" />
					<div class="tab-title tab-title-trends">
						<font href="javascript:;" onclick="goIndex4()">更多 &gt;</font>
	 				</div>
					<div class="tab process-tab trends-tab">
					    <div class="trends" id="trends-0">
					    </div>
					    <div class="trends" id="trends-1" style="display: none;">
					    </div>
					    <div class="trends" id="trends-2" style="display: none;">
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
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-gl.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/map/china.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/ldData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script type="text/javascript">
var type1 = 1;
var type2 = 1;
var mtype = 1;
var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	$(function () {	
		if(width<1440&&(sessionStorage.isgood==0 ||sessionStorage.isgood == null||sessionStorage.isgood==undefined)){
			   layer.confirm('您的电脑分辨率过低，为了保证最优的展现效果建议您更换为1920x1080（或1600x900、1440X900）分辨率。'+'\n'+'<a target="blank" href="https://jingyan.baidu.com/article/3ea5148904ad9c52e61bbac2.html">如何设置分辨率?</a>', {
                   btn: ['确定','取消'], title:"提示" , btn1:function(index){
                	   sessionStorage.isgood = 1 ;
                	   layer.close(index);
                   }, btn2: function (index) {
                	   sessionStorage.isgood = 0 ;
                	   layer.close(index);
                   },cancel: function(){ 
                	   sessionStorage.isgood = 0 ;
                   }
	            });
		}
		getMenu();
		//CreateGoodsDstribution(1);
		var h1 = $('.process-bar:eq(0)').height() * 5 / 6;
		var h2 = $('.process-bar:eq(1)').height() / 6;
		var h3 = $('.process-bar:eq(2)').height() / 2;
		var lineHeight1 = h1 + h2;
		$(".line-box1").height(lineHeight1);
		$(".line-box2").height((h2 * 5)+h3);
		//锂电专家切换
		$(".tab-title-science span").on("click", function() {
			var $ind = $(this).index() + 1;
			type1 = $ind;
			$('#type1').val($ind-1);
			$(this).addClass("on").siblings().removeClass("on");
			$("#science-" + $ind).siblings().fadeOut("fast");
			setTimeout(function() {
				$("#science-" + $ind).fadeIn("fast");
			}, 200) 
		});
		//进出口下拉
		$("#jckPro").on("click",function(){
			$(".jck-list").slideToggle();
		});
		$(".column").on("mouseenter",function(){
			$(".jck-list").hide();

		});
		//进出口切换
		$(".clickable-font").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings("font").removeClass("on");
			var i = ind == 2 ? 1 : 2;
			$("#type").val(i);
			getproList();
		});
		$("#processTab span").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			$("#processTab"+ind).siblings().fadeOut('fast');
			if(ind==2){
				$("#processTab"+ind).fadeIn('fast');
			} else {
				setTimeout(function(){ 
					$("#processTab"+ind).fadeIn('fast');
				},210)
			}
		});
		$(".h25 .tab-title").on("click",function(){
			window.open("${ctx}/front/cityDataCenter/ycLdIndex/12?mtype="+mtype,'_self')
		})
		$("#w501").on("click",function(){
			window.open("${ctx}/front/cityDataCenter/ycLdIndex/12?mtype="+mtype,'_self')
		})
		$("#w502").on("click",function(){
			window.open("${ctx}/front/cityDataCenter/ycLdIndex/11?mtype="+mtype,'_self')
		})
		searchPro(); //每日价格行情
		getRollNum();//获取翻牌器值和电池装机占比
		getLiNewsType(); //
		getLiScienceType();
		getAssistExpertInfoList(1,9);  //锂电专家
		getIndustrialImage(1,2);
		getMoney();
		getLogos();
		getproList();
	});
	function searchPro() {
		var param = {
			"productId" : '',
			"orderByClause" : 'm.BELONG_DATE DESC',
			"dateType" : 0,
			"pageSize" : 1000
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liProductMarket/list",
			type : "post",
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					var _div = '';
					for (var i = 0; i < result.value.length; i++) {
						var info = result.value[i];
						var name = info.indicatorsParam ? '(' + info.indicatorsParam + ')' : '';
						var img = Number(info.riseFall) > 0 ? 'arrow-up' : 'arrow-down';
						_div += '<tr>';
						_div += '<td class="w60 fz14">' + info.goodsName + name + '</td>';
						_div += '<td class="w20">' + info.priceUnit + '</td>';
						_div += '<td class="w20" style="text-align: right;">' + info.avgPrice + '<img src="/XProject/static/image/liData/'+img+'.png"></td>';
						_div += '</tr>';
					}
					$("#cpjgTime").text(result.liProductMarket.belongDateStr)
					$("#cpjgTable").html(_div);
					if($("#cpjgTable").height() > $("#cpjgTable").parent().height()){
						$("#cpjgTable").append(_div);
						$("#cpjgTable").addClass('roll');
					};
				}
			}
		})
	};
	//获取地图列表
	function getMenu(){
		var param = {
			type: 1
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liCompInfo/getLinkArray",
			type : "post",
			data : param,
			dataType : "json",
			success : function(result) {
				if(result.success){
					var _div = '';
					for(var i=0;i<result.list.length;i++){
						var list = result.list[i];
						_div += '<p>'+list+'</p>';
					}
					$("#selectMap").html(_div);
					$("#selectMap p").on("click",function(){
						var ind = $(this).text();
						$(this).toggleClass("on").siblings().removeClass("on");
						if(!$(this).hasClass("on")){ ind = '';}
						getCompany(ind)
					});
				}else{
					layer.msg(result.errorMsg);
				}
			},
			error : function() {
				layer.msg("系统异常");
			}
		});
	}
	//获取产品列表
	function getproList(){
		var param = {
			type: $("#type").val()
		}
		var url = '${OfficeUrl}XOffice/interface/json/importExport/titleJsonList';
		$.ajax({
			url : url,
			type: "post",
			data: param,
			dataType : "json",
			success : function(result) {
				if(result.success){
					var info = result.data;
					var d = '';
					$('#year').val(info.year);
					$('#month').val(info.month);
					for(var i = 0; i < info.data.length; i++){
						var infor = info.data[i];
						d += '<li data="'+infor.batteryId+'">'+infor.batteryName+'('+infor.batteryCode+')</li>';
						if(i == 0){ 
							$("#jckPro").html(infor.batteryName+'('+infor.batteryCode+')'+'<i class="fa fa-caret-down"></i>');
							$("#proId").val(infor.batteryId);
						}
					}
					$("#jckList").html(d);
					//菜单栏切换事件
					$("#jckList li").on("click",function(){
						$("#proId").val($(this).attr('data'));
						$(".jck-list").slideToggle();
						$("#jckPro").html($(this).text()+'<i class="fa fa-caret-down"></i>');
						getProDetail();
					})
					getProDetail();
				}
			}
		})
	}
	//获取产品详情
	function getProDetail(){
		var param = {
			type: $("#type").val(),
			year: $("#year").val(),
			month : $("#month ").val(),
			batteryId : $("#proId").val()
		}
		var url = '${OfficeUrl}XOffice/interface/json/importExport/jsonData';
		$.ajax({
			url : url,
			type: "post",
			data: param,
			dataType : "json",
			success : function(result) {
				if(result.success){
					if(result.data.data){
						var d = result.data.data;
						//对照表
						chartholi(d.barData1);
					} else {
						
					}
				}
			}
		})
	}
	function getRollNum() {
		var param = {
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/main/mainLiJsonData",
			type : "post",
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					$('#p-ljData').text(result.result.month+'月中国锂电装机量（GWh）');
					$('#car-byData').text(result.result.month+'月中国新能源汽车产量（辆）');
					$("#ld-ljData1").empty();
					$("#ld-ljData2").empty();
					installPieChart(result.result.data.barData);
					 var list = result.result.data.barData.seriesPerc;
					 for (var i=0; i<list.length;i++){
						 var info = list[i];
						 var _div = "";
						 _div +=  '<div><i></i><font>'+info.name+'</font>'
						 _div += '<span><div style="width: '+info.perc+'%;">'
						 _div +=  '</div></span>'
						_div +=  '<b>'+info.value+'</b></div>'
						$('.count-item').append(_div);
					 }
					
					$("#ld-ljData1").rollNum({
						deVal: result.result.data.installedValue.split('.')[0],
				    	digit: result.result.data.installedValue.split('.')[0].toString().length
				    });
					$("#ld-ljData2").rollNum({
				    	deVal: result.result.data.installedValue.split('.')[1],
				    	digit: result.result.data.installedValue.split('.')[1].toString().length
				    });
					$("#ld-byData1").rollNum({
				    	deVal: result.result.data.carOutputValue,
				    	digit: result.result.data.carOutputValue.toString().length
				    });
					if(result.result.data.installedArrow==1){
						$('#img1').attr('src','${ctx}/static/image/liData/arrow-up.png');
					}else{
						$('#img1').attr('src','${ctx}/static/image/liData/arrow-down.png');
					}
					if(result.result.data.carOutputArrow==1){
						$('#img2').attr('src','${ctx}/static/image/liData/arrow-up.png');
					}else{
						$('#img2').attr('src','${ctx}/static/image/liData/arrow-down.png');
					}
					
				}
			}
		})
	};
	
	function CreateGoodsDstribution() {
		$.get('${ctx}/static/map/360000.json', function(chinaJson) {
			echarts.registerMap('yichun', chinaJson);
		    var goodsMap = echarts.init(document.getElementById('map1'));
		    var jxMap = [
		    	{name:'南昌市',   value:[115.9,28.68]},
		    	{name:'景德镇市',   value:[117.17,29.27]},
		    	{name:'萍乡市',   value:[113.87,27.65]},
		    	{name:'九江市',   value:[115.98,29.68]},
		    	{name:'新余市',   value:[114.93,27.8]},
		    	{name:'鹰潭市',   value:[117.05,28.23]},
		    	{name:'赣州市',   value:[114.93,25.87]},
		    	{name:'吉安市',   value:[114.98,27.12]},
		    	{name:'宜春市',   value:[114.38,27.8]},
		    	{name:'抚州市',   value:[116.35,27.98]},
		    	{name:'上饶市',   value:[117.95,28.43]}
		    ];
			var zo = 1.2;
		    var fz3 = 18;
			if(width <= 1600){
				zo = 1;
				fz3 = 16;
			}
			if(width <= 1366){
				zo = 1;
				fz3 = 12;
			}
			var color = ['#a6c84c', '#ffa022', '#46bee9'];
			var option = {
			    tooltip : {
			        trigger: 'item',
			        formatter:function(params, ticket, callback){
		                return params.name;
			        }
			    },
			    geo: {
			        map: 'yichun',
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
			        zoom : zo,
			        //center: [115.00,28.20],
			        aspectScale : 1,
			        itemStyle: {
			            normal: {
			                areaColor: 'transparent',
			                borderColor: '#003099',
			                borderWidth: 5
			            },
			            emphasis: {
			                areaColor: 'transparent',
			                borderColor: '#003099'
			            }
			        }
			    },
			    series: [
				    {
				        type: 'effectScatter',
				        coordinateSystem: 'geo',
				        zlevel: 2,
				        rippleEffect: {
				            brushType: 'fill',
				            scale : 5
				        },
				        label: {
				            normal: {
				                show: true,
				                position: 'bottom',
				                fontWeight: 'bold',
				                fontSize: fz3,
				                formatter: '{b}',
				                color: '#00FFF6'
				            }
				        },
				        symbolSize: 12,
				        itemStyle: {
			                color: '#00FFF6'
				        },
				        data: jxMap
				    },
				    {
				        type: 'scatter',
				        coordinateSystem: 'geo',
				        zlevel: 1,
				        symbol: 'circle',
				        symbolSize: 70,
				        itemStyle: {
			                color: {
				                type: 'radial',
				                x: 0.5,
				                y: 0.5,
				                r: 0.5,
				                colorStops: [{
				                    offset: 0, color: 'rgba(0,255,246,.6)' // 0% 处的颜色
				                }, {
				                    offset: 1, color: 'rgba(0,255,246,0)' // 0% 处的颜色
				                }],
				                globalCoord: false // 缺省为 false
			                },
	                		opacity: .5
				        },
				        data: jxMap
				    }
				]
			};
		    goodsMap.setOption(option);
			goodsMap.on("click",function(params){
				window.location.href="${ctx}/front/cityDataCenter/ycLdIndex/2";
			})
		})
	}
	function installPieChart(data){
		var pieLegend = data.legend;
		var pieSeries = data.series;

        var ig = 10;
        var sz = 12;
        var ih = 10;
        var fz = 12;
        var left = '50%';
        if(width <= 1600){
        	ig = 2;
        	sz = 8;
        	ih = 5;
        }
        if(width <= 1440){
        	left = '60%';
        }
        if(width <= 1366){
        	fz = 8;
        	left = '70%';
        }
		var pieOption = {
			tooltip: {
				trigger: 'item',
		        formatter: "{b}:{d}%"
			},
		    legend: {
		    	show: true,
		    	data:[],
		    	orient: 'vertical',
		    	top: '0',
		        left: '0',
		        itemWidth: 12,
		        itemHeight: 10,
		        itemGap: ig,
		   		textStyle: {
		            color: "#0796BE",
		            fontSize: fz
		        },
		    },
		    color:['#FF43CC','#FFA360','#0060B1','#E60012','#19CC61',
		        '#8957A1','#2199FF','#FF4571','#4EC971'],
		    series: [{
		        type: 'pie',
		        radius : '100%',
		        center: [left, '50%'],
		        itemStyle:{
		        	  normal : {
				             label:{
				            	 position: 'inside',
				            	 formatter: '{d}%',
				            	 textStyle:{
				            		 fontSize:sz
						         }
				             },
			            },
		        },
		        labelLine: {
		        	length: ih,
		        	length2: ih,
				},
		    }] 
		};
		var div_ = document.getElementById("install");
		div_.removeAttribute("_echarts_instance_");
		var chart = echarts.init(div_);
		//var chart = echarts.init(document.getElementById('install'));
		pieOption.legend.data = pieLegend;
		pieOption.series[0].data = pieSeries;

		chart.setOption(pieOption);
	}
	var loop = '';
	function chartholi(d){
		var chart = echarts.init(document.getElementById('holi'));
        var ig = 10;
        var sz = 12;
        var b = 50;
        if(width <= 1600){
        	ig = 0;
        	sz = 10;
        	b = 30;
        }
		var option = {
			legend: {
		        data: d.legend,
		        textStyle:{
		        	color:  '#03E0C2',
		        	fontSize: sz
		        },
		        bottom: 0,
		        itemGap: ig,
		        itemHeight:10,
		        itemWidth:12
		    },
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            lineStyle: {
		                color: '#57617B'
		            }
		        }
		    },
		    grid: {
		        left: '0',
		        right: '0',
		        bottom: b,
		        top: 5,
		        containLabel: true
		    },
		    xAxis: [{
		        type: 'category',
		        boundaryGap: true,
		        axisLine: {
		            lineStyle: {
		                color: 'rgba(255,255,255,.2)'
		            }
		        },
		        data: d.xAxis.slice(0,6),
		        axisTick: {
		            show: false
		        },
		        axisLabel:{
		        	margin: 5,
		        	interval:0,
		            textStyle:{
		            	fontSize:12
		            },
	            	color:  'rgba(131,173,186,.8)'
		        }
		    }],
		    yAxis: [{
		        type: 'value',
		        nameTextStyle:{
		        	align: 'left'
		        },
		        axisTick: {
		            show: false
		        },
		        splitNumber : 2,
		        splitLine: {
		        	lineStyle: {
		                color: 'rgba(255,255,255,.2)'
		            }
		        },
		        axisLine: {
		            lineStyle: {
		            	color:  'rgba(131,173,186,.8)'
		            }
		        },
		        axisLabel: {
		            textStyle: {
		                fontSize: 12
		            },
	            	color:  'rgba(131,173,186,.8)'
		        }
		    },{
		        type: 'value',
	            scale: true,
		        axisLine: {
		            show:false
		        },
		        axisTick: {
		            show: false
		        },
		        splitLine: {
		        	lineStyle: {
		                color: 'rgba(255,255,255,.2)'
		            }
		        },
		        axisLine: {
		            lineStyle: {
		            	color:  'rgba(131,173,186,.8)'
		            }
		        },
		        axisLabel: {
		            textStyle: {
		                fontSize: 12
		            },
	            	color:  'rgba(131,173,186,.8)'
		        }
		    }],
		    series: [{
		        name: d.legend[0],
		        type: 'bar',
		        barWidth  : '15',
		        symbolSize: 0,  
		        itemStyle: {
				    normal: {
				        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
				            offset: 0,
				            color: '#12AABB'
				        }, {
				            offset: 1,
				            color: '#3451B9'
				        }]),
				        opacity: 1,
				    }
		        },
		        data: d.seriesBar1.slice(0,6),
		    },
		    {
		        name: d.legend[2],
		        type: 'line',
		        symbol: 'circle',  
		        symbolSize: 10,  
		        yAxisIndex: 1,
		        itemStyle: {
		            normal: {
		                color: 'rgb(255, 9, 30)'
		            },
		        },
		        lineStyle: {
		            normal: {
		                color: 'rgb(255, 9, 30)'
		            },
		        },
		        data: d.seriesLine1.slice(0,6),
		    },{
		        name: d.legend[1],
		        type: 'bar',
		        barWidth  : '15',
		        symbolSize: 0,  
		        itemStyle: {
		        	normal: {
		            	color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
		                    offset: 0,
		                    color: '#FFD154'
		                }, {
		                    offset: 1,
		                    color: '#FF903E'
		                }]),
		                opacity: 1,
		            }
		        },
		        data: d.seriesBar2.slice(0,6),
		    },
		    {
		        name: d.legend[3],
		        type: 'line',
		        barWidth  : '5',
		        yAxisIndex: 1,
		        symbol: 'circle',  
		        symbolSize: 10,  
		        itemStyle: {
		            normal: {
		                color: '#19cc61'
		            },
		        },
		        lineStyle: {
		            normal: {
		                color: '#19cc61'
		            },
		        },
		        data: d.seriesLine2.slice(0,6),
		    }]
		};
		chart.setOption(option);
		var axisData = d.xAxis;
		var data4 = d.seriesBar1;
		var data5 = d.seriesLine1;
		var data6 = d.seriesBar2;
		var data7 = d.seriesLine2;
		var count = 7;
		clearInterval(loop);
		loop = setInterval(function (){
		    var data0 = option.series[0].data;
		    var data1 = option.series[1].data;
		    var data2 = option.series[2].data;
		    var data3 = option.series[3].data;
		    data0.shift();
		    data0.push(data4[count-1]);
		    data1.shift();
		    data1.push(data5[count-1]);
		    data2.shift();
		    data2.push(data6[count-1]);
		    data3.shift();
		    data3.push(data7[count-1]);

		    option.xAxis[0].data.shift();
		    option.xAxis[0].data.push(axisData[count-1]);
		    if (count == 12) {
				count = 1;
			}else{
		    	count = count+1;
			}
		   chart.setOption(option);
		}, 2000);
	 }
	function goIndex6(){
		var type = $('#type1').val();
		window.location.href=("${ctx}/front/cityDataCenter/ycLdIndex/6?type="+type)
	}
	function goIndex4(){
		var type = $('#type').val();
		window.location.href="${ctx}/front/cityDataCenter/ycLdIndex/4?type="+type;
	}
	function getMoney() {
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/pkInTpInOpMnAcLog/pkInTpInOpMnAcLogList?areaId=360900",
			type : "post",
			data : {},
			dataType : "json",
			success : function(result) {
				if(result.success){
					chart1(result.value);	
					chartElecLine();
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	};
	function getLogos() {
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liCompInfo/getLogoList",
			type : "post",
			data : {},
			dataType : "json",
			success : function(result) {
				console.log(result)
				if(result.success){
					var val = result.value;
					var _div = '';
					for(var i = 0;i < 2;i++){
						for(var j = 0;j < val.length;j++){
							_div += '<a href="javascript:;" onclick="toMap(\''+val[j].id+'\',6)"><img src="'+val[j].logoUrl+'"></a>';
						}
					}
					$("#companyBox").html(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function getIndustrialImage(pageNum,pageSize){
		 $('.artical-box').empty();
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liIndustrySummit/list",
			type : "post",
			data : {
				"pageNum": pageNum,
			    "pageSize": pageSize,
			    "status": '1'
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.list;
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var _div = "";
					 _div += '<div class="swiper-slide">'
					 _div += '<a target="_blank" href="'+info.url+'" style="width: 100%; height: 100%;">'
					 _div += '<img src="'+info.imageUrl+'" title="'+info.title+'">'
					 _div += '</a>'
					 _div += '</div>'
				    $('#swiper3Chirld').append(_div);
				} 
				var swiper3 = new Swiper('#swiper3', {
					autoplay:true,
				    observer:true,
				    spaceBetween : 10,
				    pagination: {
				        el: '.swiper-pagination',
					    clickable :true,
				    },
			 });
				$('#science-3').hide();
				if(result.total == 0){
					var _div = "<div id='noData'>暂无数据</div>";
				    $('#swiper3Chirld').append(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function openImgUrl(url){
 		window.open(url,"_blank");
 	}
	function searchProduct(e,id,text){
		if(e==''){
			$("#liName").text(text);
		}else{
			$("#liName").text($(e).text());
		}
		$('.select-div').slideUp();
		var param = {
				"indicatorsId": id,
				//"belongDate": '2018-08-09',
				"orderByClause": 'm.BELONG_DATE DESC',
			    "dateType": 0
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liProductMarket/list",
			type : "post",
			data : param,
			dataType : "json",
			success : function(result) {
				if(result.success){
					if(result.value.length > 0){
						var info = result.value[0];
						if(info.priceUnit=='元/吨'){
							var avgPrice = info.avgPrice/10000;
							var minPrice = info.minPrice/10000;
							var maxPrice = info.maxPrice/10000;
							$('#priceUnit').text('单位：万元/吨');
							$("#productPrice font:eq(0)").text(avgPrice);
							$("#productPrice font:eq(1)").text(minPrice + '-' + maxPrice);
						}else{
							$('#priceUnit').text('单位：'+info.priceUnit);
							$("#productPrice font:eq(0)").text(info.avgPrice);
							$("#productPrice font:eq(1)").text(info.minPrice + '-' + info.maxPrice);
						}
						$("#productPrice font:eq(2)").text(info.riseFall);
					} else {
						$("#productPrice font:eq(0)").text('-');
						$("#productPrice font:eq(1)").text('-');
						$("#productPrice font:eq(2)").text('-');
					}
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function getLiScienceType(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/serviceInstitutionInfo/kindList",
			type : "post",
			data : {
				"kindName": "锂电",
			    "type": '1',
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.kindList;
				if(infoList.length>0){
					for(var i=0;i<infoList.length;i++){
						var list = infoList[i];
						if(list.kindName=="锂电"){
							$('#kindId').val(list.kindId);
							$('#kindName').val(list.kindName);
							break;
						}
					}
					getLiScienceList(1,9);
				}else{
					$('#science-2').hide();
					var _div = "<div id='noData'>暂无数据</div>";
					$("#swiper2Chirld").append(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function getLiNewsType(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liNewsType/list",
			type : "post",
			data : {
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.list;
			 	for(var i=0;i<3;i++){
					var info = infoList[i];
					var _div = "";
					getliNewsInfoListById(1,5,info.id,i);
					if(i==0){
						_div += '<span class="on" onclick="selectByKey(this,'+info.id+','+i+');">'+info.typeName+'</span>'
					}else{
						_div += '<span onclick="selectByKey(this,'+info.id+','+i+')">'+info.typeName+'</span>'
					}
					$('.tab-title-trends').append(_div);
				} 
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function getliNewsInfoListById(pageNum,pageSize,id,type){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liNewsInfo/list",
			type : "post",
			data : {
				"status": '1',
				"typeIds": id,
				"pageNum" : pageNum,
				"pageSize" : pageSize,
				"status": '1'
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.list;
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var _div = "";
					var t = formatCSTDate(info.createTime,"yyyy-MM-dd");
					_div += '<a target="_blank" href="${ctx}/front/cityDataCenter/ycLdIndex/5?id='+info.id+'&typeId='+id+'" class="trends-a">'
					_div +=	'<font>'+info.title+'</font>'
					_div += '<span>'+t+'</span>'
				    _div +='</a>'
				    if(type==0){
				    	$('#trends-0').append(_div);
				    }else if(type==1){
				    	$('#trends-1').append(_div);
				    }else{
				    	$('#trends-2').append(_div);
				    }
				}
				if(result.total == 0){
					var _div = "<div id='noData'>暂无数据</div>";
					   if(type==0){
					    	$('#trends-0').append(_div);
					    }else if(type==1){
					    	$('#trends-1').append(_div);
					    }else{
					    	$('#trends-2').append(_div);
					    }
				}
				
				
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			}
		});
	}
	function selectByKey(obj,id,type){
		$('#type').val(type);
		$(".tab-title-trends span").removeClass("on");
		$(obj).addClass("on");
		  if(type==0){
		    	$('#trends-0').show();
		    	$('#trends-1').hide();
		    	$('#trends-2').hide();
		    }else if(type==1){
		    	$('#trends-1').show();
		    	$('#trends-0').hide();
		    	$('#trends-2').hide();
		    }else{
		    	$('#trends-2').show();
		    	$('#trends-0').hide();
		    	$('#trends-1').hide();
		    }
		
	}
	function getLiScienceList(pageNum,pageSize) {
		if($('#kindId').val()==''||$('#kindId').val()==undefined){
			var _div = "<div id='noData'>暂无数据</div>";
			$("#science-2").append(_div);
			return;
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/serviceInstitutionInfo/list", 
			type : "post",
			data : {	
				"pageNum" : pageNum,
				"pageSize" : pageSize,
  			 	"serviceKindId" : $('#kindId').val(),
  			 	"type": '1',
 			 	"orderByClause" : "create_time desc",
 			},
			dataType : "json",
			success : function(result) {
			 	var infoList = result.value;
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var _div = "";
					 _div += '<div class="swiper-slide">'
					_div += '<a class="dib" target="_blank" href="${ctx}/yc/detail?type=5&entranceId=${entranceId}&id='+info.id+'">'
					_div += '<div class="middle-pic index-pic">'
					if(info.logoUrl){
						_div +=	 '<div class="expert-pic" style="background-image:url('+info.logoUrl+')">'
					}else{
						_div +=	'<div class="expert-pic" style="background-image:url(${ctx}/static/image/homePage_yc/kyjg1.png)">'
					}
					_div += '</div>'
				    _div += '<div class="expert-infor">'
				    _div += '<h3><strong class="institution-strong">'+info.institutionName+'</strong></h3>'
				  /*   if(info.researchDirection){
					    _div += '<p>'+info.researchDirection+'</p>'
				    }else{
					    _div += '<p class="no-p"></p>'
				    } */
				    _div += '</div>'
					_div += '</div>'
				    _div +=	'</a>'
					_div += '</div>'
					$("#swiper2Chirld").append(_div);
				} 
				var swiper2 = new Swiper('#swiper2', {
					slidesPerView :2,
				    slidesPerGroup : 1,
				    spaceBetween : 10,
				    observer:true,
				    autoPlay:true,
				 });
				$('#science-2').hide();
				if(result.total == 0){
					var _div = "<div id='noData'>暂无数据</div>";
					$("#swiper2Chirld").append(_div);
				}
			},
			error : function() {
				tips("请求超时，请稍后重试");
			},
		});
	}
	function getAssistExpertInfoList(pageNum,pageSize) {
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/assistExpertInfo/list",
			type : "post",
			data : {
				"pageNum" : pageNum,
				"pageSize" : pageSize,
  			 	"typeId" : "90020180925100647002193000000001",
 			},
			dataType : "json",
			success : function(result) {
				var infoList = result.list;
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var _div = "";
					 _div += '<div class="swiper-slide">'
					_div += ' <a class="dib" target="_blank" href="${ctx}/expert/detail/'+info.expertId+'?entranceId=3609009">'
					_div += '<div class="middle-pic">'
					if(info.imageUrl){
						_div +=	 '<div class="expert-pic" style="background-image:url('+info.imageUrl+')">'
					}else{
						_div +=	 '<div class="expert-pic" style="background-image:url(${ctx}/static/image/homePage_yc/headPortrait.png)">'
					}
					_div += '</div>'
					_div +=  '<div class="expert-infor">'
					_div +=	  '<h3><strong>'+info.expertName+'</strong></h3>'
					_div += '<p>'+(info.typeName==undefined?'':info.typeName)+'</p>'
					_div += '</div>'
					_div += '</div>'
					_div += '</a>'
					_div += '</div>'
					$("#swiper1Chirld").append(_div);
				}
				var swiper1 = new Swiper('#swiper1', {
					autoplay:true,
					slidesPerView :3,
				    slidesPerGroup : 1,
				    spaceBetween : 10,
				    observer:true,
				    autoPlay:true,
				 });
				if(result.total == 0){
					var _div = "<div id='noData'>暂无数据</div>";
					$("#swiper1Chirld").append(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function getCompany(type) {
		var zg = [
		    {name:'650000',   value: [87.500966,  43.983832, 0]},
		    {name:'540000',   value: [90.959657,  29.881987, 0]},
		    {name:'630000',   value: [101.703679, 36.733408, 0]},
		    {name:'620000',   value: [103.764176, 36.198433, 0]},
		    {name:'150000',   value: [111.711808, 40.98898,  0]},
		    {name:'640000',   value: [106.192619, 38.605171, 0]},
		    {name:'510000',   value: [103.984944, 30.712171, 0]},
		    {name:'530000',   value: [102.733927, 25.025991, 0]},
		    {name:'610000',   value: [112.521289, 38.025365, 0]},
		    {name:'140000',   value: [108.84183,  34.5021, 0]},
		    {name:'500000',   value: [106.413387, 29.689402, 0]},
		    {name:'520000',   value: [106.560565, 26.756654, 0]},
		    {name:'450000',   value: [108.326706, 22.99805,  0]},
		    {name:'460000',   value: [110.129641, 20.14162,  0]},
		    {name:'440000',   value: [113.183592, 23.202287, 0]},
		    {name:'820000',   value: [113.551538, 22.109432, 0]},
		    {name:'810000',   value: [114.066662, 22.588638, 0]},
		    {name:'710000',   value: [121.49917,  25.12653,  0]},
		    {name:'350000',   value: [119.107522, 26.193691, 0]},
		    {name:'360000',   value: [115.722419, 28.882959, 0]},
		    {name:'430000',   value: [112.778851, 28.363482, 0]},
		    {name:'420000',   value: [114.177046, 30.743959, 0]},
		    {name:'340000',   value: [117.120614, 31.943998, 0]},
		    {name:'330000',   value: [119.990592, 30.361806, 0]},
		    {name:'320000',   value: [118.665986, 32.194658, 0]},
		    {name:'410000',   value: [113.441154, 34.8448,   0]},
		    {name:'370000',   value: [116.973435, 36.763019, 0]},
		    {name:'310000',   value: [121.315197, 31.314325, 0]},
		    {name:'130000',   value: [114.397814, 38.170754, 0]},
		    {name:'120000',   value: [117.194203, 39.180291, 0]},
		    {name:'110000',   value: [116.384722, 39.977552, 0]},
		    {name:'210000',   value: [123.412489, 41.875105, 0]},
		    {name:'220000',   value: [125.252219, 43.850841, 0]},
		    {name:'230000',   value: [126.503235, 45.865719, 0]}
		];
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liCompInfo/list",
			type : "post",
			data : {
				compPrId: '',
				compAreaId: '',
				link1: type
			},
			dataType : "json",
			success : function(result) {
				for(var i=0;i<result.value.length;i++){
					var val = result.value[i];
					for(var j=0;j<zg.length;j++) {
						if(val.compPrId == zg[j].name){
							zg[j].value[2] += 1;
						}
					}
				}
				chart2(type,zg);
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			}
		})
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
	function toLink(type){
		if(type == 1) { window.open("https://p4psearch.1688.com/p4p114/p4psearch/offer2.htm?spm=a312h.2018_new_sem.dh_001.2.30b37032R3BqDV&keywords=1860%E9%94%82%E7%94%B5%E6%B1%A0&cosite=baidujj&location=landing_t4&trackid=8856883915965976784496&keywordid=95224439757&format=normal&sortType=&descendOrder=&province=&city=&priceStart=&priceEnd=&dis=&provinceValue=%E6%89%80%E5%9C%A8%E5%9C%B0%E5%8C%BA")}
		else if(type == 2) { window.open("https://p4psearch.1688.com/p4p114/p4psearch/offer2.htm?spm=a312h.2018_new_sem.dh_001.2.30b37032R3BqDV&keywords=%E8%B4%9F%E6%9E%81%E6%9D%90%E6%96%99&cosite=baidujj&location=landing_t4&trackid=8856883915965976784496&keywordid=95224439757&format=normal&sortType=&descendOrder=&province=&city=&priceStart=&priceEnd=&dis=&provinceValue=%E6%89%80%E5%9C%A8%E5%9C%B0%E5%8C%BA")}
		else if(type == 6) { toOffice('/oneApplication?menuId=90020180525085042800043000000002&subMenuId=90020180702103843800045000000001&isCheckFlag=1');}
		else if(type == 7) { toOffice('/oneApplication?menuId=90020170411145757801119000000011');}
		else { window.open("${ctx}/front/cityDataCenter/ycLdIndex/7?type="+type);}
	}
	function toMap(id,type){
		window.open("${ctx}/front/cityDataCenter/ycLdIndex/7?type="+type+"&typeId="+id)
	}
</script>
</html>
