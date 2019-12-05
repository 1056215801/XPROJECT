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
<%-- <link href="${ctx}/static/plugins/videojs/video-js.min.css" rel="stylesheet">
<script src="${ctx}/static/plugins/videojs/video.min.js"></script>
<script src="${ctx}/static/plugins/videojs/videojs-contrib-hls.min.js"></script> --%>
<title>宜春工业大数据工业监测</title>
<style>
#video-wrap{
	width: 65%;
    height: 100%;
    margin: auto 5%;
    /* margin-right: 9%; */
	box-sizing: border-box;
	margin-top: -53%;
	margin-bottom: 0px;
	top: 50%;
}
.videos .video{
	margin-bottom: 15%;
	z-index: 1000;
}
.select-company{
	position: absolute;
	right: 1%;
	top: 5px;
	background: rgba(255,255,255,0.1);
	border: 1px solid rgba(129, 195, 255, 1);
	border-radius: 4px;
	padding: 7px 5px;
	font-size: 15px;
	color: #00D8FF;
	display: none;
}
.select-company:hover{
	color: #fff;
}
.choose-box ul{
	height: 417px;
    overflow-y: scroll;
}
.totaltext{
	/* padding: 10px; */
	font-size: 16px;
	color:#000;
}
.totaltext b{
	color: #00D8FF;
    font-size: 24px;
}
.companyList-box{
	overflow-y: scroll;
    height: 100%;
}
.companyList ul{
	margin-left: 10px;
    margin-top: 20px;
}
.companyList li{
	padding: 5px 5px;
    margin: 10px 15px;
    color: #000;
    font-size: 16px;
    line-height: normal;
    /* background: linear-gradient(90deg,rgba(0,57,165,1),rgba(2,64,200,0)); */
}
.companyList li.active{
	color: #00D8FF
}
.companyList li:hover{
	color: #00D8FF
}
.layui-layer-page .layui-layer-content {
    position: relative;
    overflow: hidden;
}
.layui-layer-page .layui-layer-btn{
	border-top: 1px solid #eee;
	background: #f8f8f8;
	padding-top: 10px;
}
.layui-layer-page .layui-layer-btn a:nth-child(2){
	background-color: #fff
}

.search-box{
	margin: 20px 3% 10px;
    text-align: center;
    border: 1px solid #666;
    border-radius: 4px;
    padding: 0;
    width: 91%;
    padding-left: 6px;
    height: 33px;
}
.search-select{
	width: 32%;
	border: none;
	height: 63%;
}
.search-select:focus,.search-input:focus{
	outline: none;
}
.search-input{
	padding: 2px 5px;
    border: none;
    width: 50%;
    height: 100%;
    border-right: 1px solid #666;
    border-left: 1px solid #666;
}
.search-input::-webkit-input-placeholder {
	/* placeholder颜色  */ 
	color: #666;         
	/* placeholder字体大小  */
	font-size: 14px;
}
.search-btn{
	padding: 5px 10px;
    border: none;
    background: #eee;
    color: #000;
    cursor: pointer;
    width: 18%;
    display: inline-block;
    height: 100%;
    border-bottom: 1px solid #666;
}
.tipforTab2{
	position: absolute;
    right: 1%;
	top: 14px;
	color:#00D8FF;
	display: none;
}
</style>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="content fz0">
		<input type="hidden" id="orgId" value="${orgId}" name="orgId">
		<input type="hidden" id="year" value="" name="year">
		<input type="hidden" id="type" value=1 name="type">
		<input type="hidden" id="compKind" value=0 name="compKind">
		<input type="hidden" id="peakYear" value="" name="peakYear">
		<input type="hidden" id="peakMonth" value="" name="peakMonth">
		<input type="hidden" id="peakDay" value="" name="peakDay">
		<input type="hidden" id="companyId" value="" name="companyId">
		<input type="hidden" id="companyName" value="" name="companyName">
		<div class="pro-left">
		   <ul class="production">
				<li class="first-li on" val1="24" val2="index3_code1" val3="实时用电监测">
					<div class="product-type" >实时用电监测</div>
				</li>
				<li class="first-li" val1="25" val2="index3_code2" val3="视频监控"> 
					<div class="product-type">视频监控</div>
				</li>
				<li class="first-li" val1=""> 
					<div class="product-type">重点企业监测</div>
				</li>
				<li class="first-li" val1=""> 
					<div class="product-type">民爆企业监测</div>
				</li>
				<li class="first-li" val1=""> 
					<div class="product-type">中频炉企业监测</div>
				</li>
				<li class="first-li" val1=""> 
					<div class="product-type">安全生产监测</div>
				</li>
				<li class="first-li" val1=""> 
					<div class="product-type">生产要素监测</div>
				</li>
			</ul>
		</div>
		<div class="pro-right">
			<div style="height: 100%; padding-top: 10px;">
				<div class="spanStyle" style="width: 68%;">
					<div class="blockStyle" style="height: 60%;">
						<div class="chart3" id="ycMap"></div>
					</div>
					<div class="blockStyle" style="height: calc(40% - 10px);">
						<div class="outsideBox">
							<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar">
								<div class="tabCaption">
									<span id="qyrfh" class="select-tabs on">重点企业日负荷实时曲线</span>
									<span id="qyyyd" class="select-tabs">重点企业月用电</span>
									<span class="select-tabs">重点企业每天用电高峰时段</span>
									<a class="select-company" href="javascript:;">选择企业</a>
									<span class="tipforTab2">单位：kw</span>
								</div>
							</div>
							<div class="tabs">
								<div class="tab" id="firstTab0">
									<div class="chart3" id="electricChart"></div>
									<div class="electric-infor" style="right:1%">
										<div class="electric-infor-box">
											<p id="today">今日最大负荷(<b class="yellowT2" id="tTime">11:15</b>)</p>
											<h3 class="bgT" id="jrfh"><font class="yellowT2" id="jrfh1"></font><font class="yellowT2" style="font-size: 24px;">.</font><font class="yellowT2" id="jrfh2"></font> <small>万 kw</small>
										</h3>
										</div>
										<div class="electric-infor-box">
											<p id="yesterday">昨日最大负荷(<b class="yellowT2" id="yTime">11:15</b>)</p>
											<h3 class="bgT" id="zrfh">
												<font class="greenT" id="zrfh1"></font><font class="greenT" style="font-size: 24px;">.</font><font class="greenT" id="zrfh2"></font><small>万 kw</small>
											</h3>
										</div>
									</div>
								</div>
								<div class="tab" id="firstTab1" style="display: none;">
									<div class="chart3" id="electricChart2"></div>
									<div class="electric-infor">
										<div class="electric-infor-box">
											<p>本月累计电量</p>
											<h3 class="" style="color:#00DEFF"><font id="bylj"></font> <small>万 kwh</small></h3>
										</div>
										<div class="electric-infor-box">
											<p>同时段累计对比</p>
											<p class="bgT" id="nowTime"></p>
											<h2 class="purpleT"><b id="percent">12</b> <!-- <small>%</small> --></h2>
										</div>
									</div>
								</div>
								<div class="tab" id="firstTab2" style="display: none;">
									<div style="position: absolute; top: 0px; right: 20px; z-index: 10;">
										<div class="fr selects">
											<div class="select">
												<p><font id="peakFont1">2018</font><i class="fa fa-caret-down"></i></p>
												<div class="select-items">
													<ul id="peakUl1" style="max-height: 155px;">
													</ul>
												</div>
											</div>
											<div class="select">
												<p><font id="peakFont2">1月</font><i class="fa fa-caret-down"></i></p>
												<div class="select-items">
													<ul id="peakUl2" style="max-height: 155px;">
													</ul>
												</div>
											</div>
											<div class="select">
												<p><font id="peakFont3">1日</font><i class="fa fa-caret-down"></i></p>
												<div class="select-items">
													<ul id="peakUl3" style="max-height: 155px;">
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="chart3" id="electricChart3"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="spanStyle" style="width: calc(32% - 10px);">
					<div class="blockStyle" style="height: 52%;">
						<div class="outsideBox">
							<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar">
								<span class="tabCaption">企业实时用电</span>
							</div>
							<div class="electric-title electric-title2" style="text-align: center;">
								<span class="dbT">今日累计用电<b class="orangeT" id="ljyd"></b>万kwh</span>
							</div>
							<div class="company-half mg15">
								<div class="dib company-box">
									<p>接入企业</p>
									<h2 class="yellowT2">
										<font id="e1"></font>个
									</h2>
								</div>
								<div class="dib company-box">
									<p>接入监测分路总个数</p>
									<h2 class="yellowT2">
										<font id="e2"></font>个
									</h2>
								</div>
							</div>
							<div class="companybox-list" style="margin-left: 15px;">
								<span class="">
									<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
									<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
									<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
									<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
									<div class="middle-box">
										<img src="${ctx}/static/image/cityDataCenter/ycNew2/electric-bg1.png">
										<p>重点企业(个)</p>
										<h3 class="absolute-font">
											<font id="e3">0</font>
										</h3>
										<div class="clearfix"></div>
									</div>
								</span>
								<span>
									<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
									<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
									<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
									<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
									<div class="middle-box">
										<img src="${ctx}/static/image/cityDataCenter/ycNew2/electric-bg2.png">
										<p>高耗能企业(个)</p>
										<h3 class="absolute-font">
											<font id="e4">0</font>
										</h3>
									</div>
								</span>
								<span>
									<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
									<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
									<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
									<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
									<div class="middle-box">
										<img src="${ctx}/static/image/cityDataCenter/ycNew2/electric-bg1.png">
										<p>专精特新企业(个)</p>
										<h3 class="absolute-font">
											<font id="e5">0</font>
										</h3>
									</div>
								</span>
								<span>
									<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
									<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
									<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
									<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
									<div class="middle-box">
										<img src="${ctx}/static/image/cityDataCenter/ycNew2/electric-bg2.png">
										<p>涉钢企业(个)</p>
										<h3 class="absolute-font">
											<font id="e6">0</font>
										</h3>
									</div>
								</span>
								<span>
									<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
									<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
									<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
									<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
									<div class="middle-box">
										<img src="${ctx}/static/image/cityDataCenter/ycNew2/electric-bg1.png">
										<p>锂电企业(个)</p>
										<h3 class="absolute-font">
											<font id="e7">0</font>
										</h3>
									</div>
								</span>
								<span>
									<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
									<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
									<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
									<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
									<div class="middle-box">
										<img src="${ctx}/static/image/cityDataCenter/ycNew2/electric-bg2.png">
										<p>中频炉企业(个)</p>
										<h3 class="absolute-font">
											<font id="e8">0</font>
										</h3>
									</div>
								</span>
							</div>
						</div>
					</div>
					<div class="blockStyle" style="height: calc(48% - 10px);">
						<div class="outsideBox">
							<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
							<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
							<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
							<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
							<div class="tabCaptionBar">
								<span class="tabCaption">企业预警</span>
							</div>
							<div class="warning">
								<div class="warn-box">
									<ul id="warning">
									</ul>
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
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/ycFourthData.js"></script>
<script src="${ctx}/static/js/dataCenter/ycAnimate.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script type="text/javascript">
var role=false;
	$(function(){
		$(".head>a:eq(3)").addClass("on");
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
		 //左侧菜单栏点击事件
		$(".first-li").on("click",function(){
			var v1 = $(this).attr("val1");
			var v2 = $(this).attr("val2");
			var v3 = $(this).attr("val3");
			if(v1!=''){
				checkRight(v1,'',v2,v3);
			} else { alert("建设中!")}
		});
		//ehcart图表切换
		$(".select-tabs").on("click",function(){
			var ind = $(this).index();
			if(ind==2){
				$(".select-company").hide();
				$(".tipforTab2").show();
			}else if(role){
				$(".select-company").show();
				$(".tipforTab2").hide();
			}else{
				$(".tipforTab2").hide();
			}
			$(this).addClass("on").siblings().removeClass("on");
			$(this).parent().parent().next().find(".tab").fadeOut("fast");
			$("#type").val(ind+1);
			layer.load(1, {
			  shade: [0.1,'#fff'] //0.1透明度的白色背景
			});
			setTimeout(function(){
				$("#firstTab"+ind).fadeIn("fast");
				if($("#companyId").val()!='' && $("#type").val()==1){
					getElec();
					layer.closeAll();
				}else{
					getElectric();
				}
			},210);
		})
		$(".companybox-list span").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			$("#companyId").val('');
			$(".select-company").text('选择企业');
			if(ind+1 != $('#compKind').val()){
				$('#compKind').val(ind+1);
			}else{
				$(".companybox-list span").removeClass("on");
				$('#compKind').val(0);
			}
			getElectric();
		});
		$(".select-company").on('click',function(){
			$('#compKind').val(0);
			$("#search-input").val("")
			$("#companyName").val("")
			$(".companybox-list span").removeClass("on");
			getCompanyList();
		})
		getYcMap(); //宜春地图
		getMapData();//热点分布图
		getselectTime();
		getElecInfor(1); //用电
		getElectric(); //用电
		getDefaultDate(); //用电
		getRole();//判断角色权限
		// getCompanyList();//获取企业列表数据
		// getElec()
	});
	//宜春地图
	function getYcMap(data){
	    var data = data;
		$.get('${ctx}/static/map/360900.json', function (chinaJson) {
		    echarts.registerMap('yc', chinaJson);
			ycHotMap_new(data);
		});
	}
	function getMapData(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/electricInfo/selectElectricMapData",
			type : "post",
		 	async: false,
			data : {},
			dataType : "json",
			success : function(result){
				if(result.success){
					var data = result.data;
					var y = new Date().getFullYear();
					var m = new Date().getMonth() + 1;
					var list=[ 
							{name : '袁州区', SPACE_ID : "360902",value : "0"}, 
							{name : '奉新县', SPACE_ID : "360921",value : "0"}, 
							{name : '万载县', SPACE_ID : "360922",value : "0"}, 
							{name : '上高县', SPACE_ID : "360923",value : "0"}, 
							{name : '宜丰县', SPACE_ID : "360924",value : "0"}, 
							{name : '靖安县', SPACE_ID : "360925",value : "0"}, 
							{name : '铜鼓县', SPACE_ID : "360926",value : "0"}, 
							{name : '丰城市', SPACE_ID : "360981",value : "0"}, 
							{name : '樟树市', SPACE_ID : "360982",value : "0"}, 
							{name : '高安市', SPACE_ID : "360983",value : "0"} 
					]
					console.log(result)
					
					for(var j = 0; j < list.length; j++){
						// list[j].name = list[j].SPACE_NAME;
						// list[j].value = list[j].VALUE;
						for(var k=0; k<data.length;k++){
							if(list[j].SPACE_ID == data[k].SPACE_ID){
								list[j].value = (data[k].VALUE/10000).toFixed(2);
							}
						}
						for(var i = 0; i < yc3.length; i++){
							if(list[j].SPACE_ID == yc3[i].name){
								yc3[i].value[2] = list[j].VALUE;
							}else{
								yc3[i].value[2] = 0;
							}
						}
					}
					// console.log(list)
					$.get('${ctx}/static/map/360900.json', function (chinaJson) {
					    echarts.registerMap('yichun', chinaJson);
					    getYcMap(list);
					});
				}
			},
			error : function() {
				//layerTips("校验权限异常");
			}
		});
	}
	//企业每天用电高峰时段日期筛选
	function getselectTime(){
		var year = "";
		var month = "";
		var day = "";
		if($("#peakYear").val() == "" || $("#peakMonth").val() == "" || $("#peakDay").val() == ""){
			var date = new Date();
			
			year = date.getFullYear();
			$("#peakYear").val(year);
			$('#peakFont1').text(year);
			
			month = date.getMonth()+1;
			if(month < 10){
				$("#peakMonth").val("0"+month);
			}else{
				$("#peakMonth").val(month);
			}
			$('#peakFont2').text(month+"月");
			
		    //这里传入的0代表获取上一个月的最后一天；如果传1，则获得当月的第一天；
		    day = new Date(year,month,0);
	        /* console.log(day.getDate()); */
	        if(date.getDate()<10){
	        	$("#peakDay").val("0"+date.getDate());
	        }else{
	        	$("#peakDay").val(date.getDate());
	        }
			$('#peakFont3').text(date.getDate()+"日");
			
			for(var i=year; i>2014;i--){
		    	$('#peakUl1').append('<li>'+i+'</li>');
		    }
			for(var i=1; i<13;i++){
		    	$('#peakUl2').append('<li>'+i+'月</li>');
		    }
		}else{
			year = $("#peakYear").val();
			month = $("#peakMonth").val();
		    day = new Date(year,month,0);
		}
	    
	    $('#peakUl3').empty();
	    for(var i=1; i<day.getDate()+1;i++){
	    	$('#peakUl3').append('<li>'+i+'日</li>');
	    }
		
	    var flag = true;
	    $(".select li").on("click",function(){
			if(flag){
				$(this).parents('.select-items').slideToggle();
				if($(this).parent().attr('id')=='peakUl1'){
					$('#peakFont1').text($(this).text());
		 			$('#peakYear').val($(this).text());
		 			getElectric();
				}else if($(this).parent().attr('id')=='peakUl2'){
		  			$('#peakFont2').text($(this).text());
					var month = $(this).text();
					month = month.substring(0,month.lastIndexOf('月'))
					if(month < 10){
						$("#peakMonth").val("0"+month);
					}else{
						$('#peakMonth').val(month);
					}
					getElectric();
				}else if($(this).parent().attr('id')=='peakUl3'){
					$('#peakFont3').text($(this).text());
					var day = $(this).text();
					day = day.substring(0,day.lastIndexOf('日'))
					if(day < 10){
			        	$("#peakDay").val("0"+day);
			        }else{
			        	$('#peakDay').val(day);
			        }
					getElectric();
				}
				flag = false;
				setTimeout(function(){
					getselectTime();
				},300)
			}
		})
	}
	//刷新
	var start = 0;
	var end = 13;
	//用电折线图
	var elecData = '';
	function getElectric(){
		var time = $("#peakYear").val()+"-"+$("#peakMonth").val()+"-"+$("#peakDay").val();
		var companyId=$("#companyId").val();
		var param = {
			type: $('#type').val(),
			orgId : $('#orgId').val()=='3609009'?'360900':$('#orgId').val(),
			compKind : $('#compKind').val(),
			time : time,
			companyId: companyId
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/electric/electricCount",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				console.log(result)
				if(result.success){
					layer.closeAll();
				    var m = new Date().getMonth()+1;
				    var d = new Date().getDate();
				    var today = '截止 ('+m+'-'+d+')';
				    $("#nowTime").text(today);
				    var datas = result.data;
					if(param.type == 1) {
						//设置折线图显示时段
						end = Math.ceil((datas.bar1.charData.today.length/datas.bar1.charData.xAxis.length)*100) + 1;
						end = end > 100 ? 100 : end < 15 ? 15 : end;
						start = end - 15;
						
						$("#ljyd").rollNum({
					      	deVal: datas.bar1.maxData.powTo.split(".")[0],
					      	digit: datas.bar1.maxData.powTo.split(".")[0].length
					    });
						if(datas.bar1.maxData.today){
							var t1 = datas.bar1.maxData.today.split(".")[0];
							var t2 = datas.bar1.maxData.today.split(".")[1];
							$("#jrfh1").rollNum({
						      	deVal: t1,
						      	digit: t1.length
							});
							$("#jrfh2").rollNum({
						      	deVal: t2,
						      	digit: t2.length
						    });
							$("#tTime").text(datas.bar1.maxData.todayTime);
						} else { 
							$("#jrfh1").rollNum({
						      	deVal: 0,
						      	digit: 1
					    	});
							$("#jrfh2").rollNum({
						      	deVal: 0,
						      	digit: 1
					    	});
						}
						if(datas.bar1.maxData.yesterday){
							var y1 = datas.bar1.maxData.yesterday.split(".")[0];
							var y2 = datas.bar1.maxData.yesterday.split(".")[1];
							$("#zrfh1").rollNum({
						      	deVal: y1,
						      	digit: y1.length
							});
							$("#zrfh2").rollNum({
						      	deVal: y2,
						      	digit: y2.length
						    });
							$("#yTime").text(datas.bar1.maxData.yesterdayTime);
						} else { 
							$("#zrfh1").rollNum({
						      	deVal: 0,
						      	digit: 1
					    	});
							$("#zrfh2").rollNum({
						      	deVal: 0,
						      	digit: 1
					    	});
						}
						elecData = datas.bar1.charData;
						elecLine(datas.bar1.charData);
					} else if(param.type == 2){
						$("#bylj").rollNum({
					      	deVal: datas.bar2.curValue.split(".")[0],
					      	digit: datas.bar2.curValue.split(".")[0].length
					    });
						$("#percent").text(datas.bar2.percent)
						electricBar(datas.bar2);
					} else {
						electricScatter(datas.bar3.maxListData);
					}
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	}
	//用电数据
	function getElecInfor(type){
		var param = {
			"orgId" : $('#orgId').val()=='3609009'?'360900':$('#orgId').val()
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/electric/companyCount",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				// console.log(result)
				if(result.success){
					$("#e1").rollNum({
				      	deVal: result.companyData.count.COUNT1,
				      	digit: result.companyData.count.COUNT1.length
				    });
					$("#e2").rollNum({
				      	deVal: result.companyData.count.COUNT2,
				      	digit: result.companyData.count.COUNT2.length
				    });
					$("#e3").rollNum({
				      	deVal: result.companyData.count.COUNT3,
				      	digit: result.companyData.count.COUNT3.length
				    });
					$("#e4").rollNum({
				      	deVal: result.companyData.count.COUNT4,
				      	digit: result.companyData.count.COUNT4.length
				    });
					$("#e5").rollNum({
				      	deVal: result.companyData.count.COUNT5,
				      	digit: result.companyData.count.COUNT5.length
				    });
					$("#e6").rollNum({
				      	deVal: result.companyData.count.COUNT6,
				      	digit: result.companyData.count.COUNT6.length
				    });
					$("#e7").rollNum({
				      	deVal: result.companyData.count.COUNT7,
				      	digit: result.companyData.count.COUNT7.length
				    });
					$("#e8").rollNum({
				      	deVal: result.companyData.count.COUNT8,
				      	digit: result.companyData.count.COUNT8.length
				    });
					if(type == 1){
						var div = '';
						if(result.companyData.warnList.length > 5){
							for(var j=0;j<2;j++){
								for(var i = 0; i < result.companyData.warnList.length; i++){
									var info = result.companyData.warnList[i];
									div += '<li>';
									div += '<p>'+ info.time + '</p>';
									div += '<p><span style="display: inline-block; width: calc(100% - 70px);">'+ info.companyName + ' 产生了一条用电数据</span>';
									div += '<font class="greenT">用电正常</font><div class="clearfix"></div></p>';
									div += '</li>';
								}
							}
							$("#warning").addClass("roll");
						}else{
							for(var i = 0; i < result.companyData.warnList.length; i++){
								var info = result.companyData.warnList[i];
								div += '<li>';
								div += '<p>'+ info.time + '</p>';
								div += '<p><span style="display: inline-block; width: calc(100% - 70px);">'+ info.companyName + ' 产生了一条用电数据</span>';
								div += '<font class="greenT">用电正常</font><div class="clearfix"></div></p>';
								div += '</li>';
							}
							$("#warning").removeClass("roll");
						}
						$("#warning").html(div);
					}
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	}
	//获取最近有数据的年月
	function getDefaultDate(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/eleManagement/defYearAndMonth",
			type : "post",
			async:false, 
			data : {
				"orgId" : '360900',
				"kind" : 1
			},
			success : function(result) {
				if (result.success) {
					$('#year').val(result.value.year);
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	// 判断用户是否有角色接口
	function getRole(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/roleInfo/hasRole",
			type : "post",
			async:false, 
			data : {
				accountId:'${accountId}',
				roleId:'90020181220154121800056000000002'
			},
			success : function(result) {
				if (result.success) {
					role = result.value;
					if(role){
						$(".select-company").show();
					}
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}

var selectedName='';
	// 获取企业列表数据
	function getCompanyList(){
		var companyName=$("#companyName").val();
		var compKind=$("#compKind").val();
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/electric/focusCompany",
			type : "post",
			async:false, 
			data : {
				companyName: companyName,
				compKind: compKind
			},
			success : function(result) {
				if (result.success) {
					var data=result.data
					var div='';
					// div+='<p class="totaltext">共有<b>'+data.total+'</b>重点监测企业</p>'
					div+='<div class="search-box">';
					div+='<select class="search-select">';
					div+='<option value="0">全部企业</option>';
					div+='<option value="1">重点企业</option>';
					div+='<option value="2">高耗能企业</option>';
					div+='<option value="3">专精特新企业</option>';
					div+='<option value="4">涉钢企业</option>';
					div+='<option value="5">锂电企业</option>';
					div+='<option value="6">中频炉企业</option>';
					div+='</select>';
					div+='<input id="search-input" class="search-input" type="text" placeholder="搜索企业" value="" />';
					div+='<span class="search-btn" href="javascript:;">搜索</span>'
					div+='</div>';
					div+='<div class="companyList-box">';
					div+='<ul class="companyList">';
					for(var i=0;i<data.total;i++){
						if(data.listData[i].id==$("#companyId").val()){
							div+='<li class="active" id="'+data.listData[i].id+'">'+data.listData[i].name+'</li>';
						}else{
							div+='<li id="'+data.listData[i].id+'">'+data.listData[i].name+'</li>';
						}
					}
					div+='</ul></div>';
					layer.confirm(div,{
						type: 1,//1 表示content直接显示html 2表示发送请求页面
						title: '<p class="totaltext">共有<b id="companytotal">'+data.total+'</b>重点监测企业</p>',
						closeBtn: 1, //显示关闭按钮 0不显示
						shade: [0.5, '#393D49'],//遮盖层
						shadeClose: true,
						area: ['20%', '42%'],
						offset: 'auto',
						shift: 2,
						btn: ['确定','重置'],
						btn1: function(){
							if($("#companyId").val()!=""){
								if($("#type").val()==1){
									getElec();
								}else if($("#type").val()==2){
									getElectric();
								}
								$(".select-company").text('已选企业:'+selectedName);
							}
							layer.closeAll();
							$("#search-input").val("")
						},btn2: function(){ 
							$("#companyId").val("");
							$(".select-company").text('选择企业');
							// $("#qyrfh").text('重点企业日负荷实时曲线 ')
							// $("#qyyyd").text('重点企业月用电 ')
							getElectric();
							layer.closeAll();
							$("#search-input").val("")
						},cancel: function(){ 
							$("#search-input").val("")
						},
						// content: div //iframe的url，no代表不显示滚动条
					})
					$(".companyList").on("click","li",function(){
						$(this).addClass("active").siblings().removeClass("active");
						selectedName=$(this).text();
						choosecompany($(this).attr('id'));
					})
					$(".search-box").on("change",".search-select",function(){
						$("#compKind").val($(this).val());
						$("#companyName").val($("#search-input").val());
						getNewCompanyList();
					})
					$('#search-input').bind('keyup', function(event) {
						if (event.keyCode == "13") {
							$("#companyName").val($(this).val());
							getNewCompanyList()
						}
					});
					$('.search-box').on('click','.search-btn', function() {
						$("#companyName").val($('#search-input').val());
						getNewCompanyList();
					});
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}

	// 企业筛选
	function getNewCompanyList(){
		var companyName=$("#companyName").val();
		var compKind=$("#compKind").val();
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/electric/focusCompany",
			type : "post",
			async:false, 
			data : {
				companyName: companyName,
				compKind: compKind
			},
			success : function(result) {
				if (result.success) {
					// console.log(result)
					var data=result.data
					var div='';
					for(var i=0;i<data.total;i++){
						if(data.listData[i].id==$("#companyId").val()){
							div+='<li class="active" id="'+data.listData[i].id+'">'+data.listData[i].name+'</li>';
						}else{
							div+='<li id="'+data.listData[i].id+'">'+data.listData[i].name+'</li>';
						}
					}
					$(".companyList").html(div);
					$("#companytotal").text(data.total);
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
	//获取选择企业的用电数据
	function getElec(){
		var companyId=$("#companyId").val();
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/electric/electricTime",
			type : "post",
			async:false, 
			data : {
				companyId: companyId,
			},
			success : function(result) {
				if (result.success) {
					// console.log(result)
					var data=result;
					end = Math.ceil((data.chartData.today.length/data.chartData.xAxis.length)*100) + 1;
					end = end > 100 ? 100 : end < 13 ? 13 : end;
					start = end - 13;
					elecData = result.maxData;
					elecLine(data.chartData);

					$("#ljyd").rollNum({
					      	deVal: data.maxData.powTo.split(".")[0],
					      	digit: data.maxData.powTo.split(".")[0].length
					    });
						if(data.maxData.today){
							var t1 = data.maxData.today.split(".")[0];
							$("#jrfh1").rollNum({
						      	deVal: t1,
						      	digit: t1.length
						    });
							$("#tTime").text(data.maxData.todayTime);
						} else { 
							$("#jrfh1").rollNum({
						      	deVal: 0,
						      	digit: 1
					    	});
						}
						if(data.maxData.yesterday){
							var y1 = data.maxData.yesterday.split(".")[0];
							var y2 = data.maxData.yesterday.split(".")[1];
							$("#zrfh1").rollNum({
						      	deVal: y1,
						      	digit: y1.length
						    });
							$("#yTime").text(data.maxData.yesterdayTime);
						} else { 
							$("#zrfh1").rollNum({
						      	deVal: 0,
						      	digit: 1
					    	});
						}
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}

	//选择企业
	function choosecompany(companyid,companyname){
		if(companyid !='' && companyid != undefined && companyid !=null){
			$("#companyId").val(companyid);
			// $("#qyrfh").text(companyname+'日负荷实时曲线 ')
			// $("#qyyyd").text(companyname+'月用电')
		}

	}
</script>
</html>
