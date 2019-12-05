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
<link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">

<link href="${ctx}/static/js/plugins/video/video-js.css" rel="stylesheet">
<title>宜春工业大数据工业监测</title>
<style>
	/*去除百度地图版权*/
	.anchorBL{
		display:none;
	}
	.BMap_cpyCtrl{
		display:none;
	}
</style>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="content fz0">
		<input type="hidden" id="orgId" value="${orgId}" name="orgId">
		<input type="hidden" id="proYear" value="" name="proYear">
		<input type="hidden" id="proMonth" value="" name="proMonth">
		<input type="hidden" id="comYear" value="" name="comYear">
		<div class="pro-left absolute-left">
			<ul class="production">
				<li class="first-li" val1="24" val2="index3_code1" val3="实时用电监测">
					<div class="product-type" >实时用电监测</div>
				</li>
				<li class="first-li on" val1="25" val2="index3_code2" val3="视频监控"> 
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
		<div class="spanStyle" style="z-index: 99;">
			<div class="" style="width: 100%; height: calc(100% + 10px);" id="satelliteMap"></div>
		</div>
		<div class="video-show-box">
			<div class="video-wrap" id="" style="overflow: hidden">
				<!-- <p id="comp-name">企业实时视频</p> -->
				<img class="closeBtn" src="${ctx}/static/image/cityDataCenter/yc/delete.png" width="20">
				<div class="video-show">
					<!-- testfile -->
					<!-- <iframe id="videoIframe" src="https://testfile.inpark.com.cn/AttachmentPortal/hls3.jsp?cameraUuid=e39f4270900345d8a930cac6e99342b4"frameborder="0"  scrolling="auto" style="width: 100%; height:100%;overflow:hidden;"></iframe> -->
					<img src="${ctx}/static/image/cityDataCenter/jxNew/comVideo1.gif" style="width: 100%; height:100%;">
					<!-- <video id="myVideo" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="auto" data-setup='{}' style='width: 100%;height: 100%;'>
			            <source id="source" src="http://testfile.inpark.com.cn:89/mag/hls/ceb5e7d49e3846639a6bc6864e6c444e/0/live.m3u8" type="application/x-mpegURL"></source>
			        </video> -->
				</div>
			</div>
		</div>
		<div class="spanStyle absolute-right" style="width: calc(32% - 10px); height: calc(100% - 30px); margin-top: 10px;">
			<div class="blockStyle" style="height: 40%;">
				<div class="outsideBox" style="background: rgba(0,29,82,0.7);">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">实时预警</span>
					</div>
					<div class="tabContBar">
						<div class="warning warning-video">
							<div class="warn-box">
								<ul id="warning" class="">
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="blockStyle" style="height: calc(60% - 10px);">
				<div class="outsideBox" style="background: rgba(0,29,82,0.5);">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar tab-links" id="tab-links">
						<span class="on">实时监控视频</span>
						<span>设备在线</span>
						<%-- <div class="screening"><img src="${ctx}/static/image/cityDataCenter/ycFourth/screen.png" style="margin-right: 7px;">筛选</div> --%>
					</div>
					<div class="tabContBar">
						<div class="tab video-tab" id="tab1">
							<div class="searchBar">
								<img src="${ctx}/static/image/cityDataCenter/ycFourth/search.png" onclick="searchVideo()">
								<input id="searchInput" type="text" value="" placeholder="请输入设备编号或关键词"/>
							</div>
							<div class="video-list">
								<div class="video-list-bar" id="videoList"></div>
								<%-- <div class="video-box">
									<div class="video">
										<img src="${ctx}/static/image/cityDataCenter/ycNew2/dd.jpg" alt="">
									</div>
									<div class="tips">
										<div class="video-number">1</div>
										<div class="video-info">
											<p class="video-name">JK1001</p>
											<p class="video-time">
												<span>2019-1-31</span>
												<span style="float: right;">16:23:41</span>
												<div class="clearfix"></div>
											</p>
										</div>
										<div class="clearfix"></div>
									</div>
								</div> --%>
							</div>
						</div>
						<div class="tab video-tab" id="tab2" style="display: none;">
							<div class="chart3" id="pie"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script src="${ctx}/static/js/dataCenter/ycFourthData.js"></script>
<script src="${ctx}/static/js/dataCenter/ycAnimate.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>

<script type="text/javascript" src="../../../static/js/dataCenter/map/coordMap.js"></script>

<script src="${ctx}/static/js/dataCenter/map/mapCoordinateTransformation.js"></script>
<script src="https://api.tianditu.gov.cn/api?v=4.0&tk=c00d6822cb117910a29a8030b74caf01" type="text/javascript"></script>

<%-- <script src="${ctx}/static/js/plugins/video/video.js"></script>
<script src="${ctx}/static/js/plugins/video/videojs-contrib-hls.min.js"></script> --%>
<script type="text/javascript">
	var pieData = [{
		value: 7,
		name: '在线'
	}, {
		value: 6,
		name: '不在线'
	}]
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
		//视频和设备标题栏切换
		$(".tab-links span").on("click",function(){
			var ind = $(this).index()+1;
			$(this).addClass("on").siblings().removeClass("on");
			$(this).parent().next().find(".tab").fadeOut("fast");
			$("#tab"+ind).fadeIn("fast");
			if(ind==2){
				getPie();
			}
		});
		//关闭视频弹框
		$(".closeBtn").on("click",function(){
			$(".video-show-box").fadeOut("fast");
		})
		getMonitorVideo();
		getSatelliteMap();
	});
	function getMonitorVideo(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/hikvision/selectCameraInfo",//testfile
			type : "post",
			data : {
				cameraName : $("#searchInput").val()
			},
			dataType : "json",
			success : function(result){
				console.log(result)
				if(result.success){
					//实时监控视频数据
					var div1 = '';
					for(var i = 0; i < result.value.length; i++){
						var info = result.value[i];
						var num = i+1;
						div1 += '<div class="video-box" camera="'+info.cameraUuid+'" lon="'+info.longitude+'" lat="'+info.latitude+'" onLineStatus="'+info.onLineStatus+'">';
						div1 += '	<div class="video">';
						if(info.onLineStatus == "1"){
							div1 += '		<div class="videoPlay">';
							div1 += '			<i></i><img src="${ctx}/static/image/cityDataCenter/ycFourth/play.png" width="35px">';
							div1 += '		</div>';
							div1 += '		<img src="${ctx}/static/image/cityDataCenter/ycNew2/dd.jpg" alt="">';
						}else if(info.onLineStatus == "0"){
							div1 += '		<div class="videoPlay bgc">';
							div1 += '			<i></i><div class="wordBar"><img src="${ctx}/static/image/cityDataCenter/ycFourth/wuxinhao.png" width="35px"><div class="word">离线</div></div>';
							div1 += '		</div>';
							div1 += '		<img src="${ctx}/static/image/cityDataCenter/ycFourth/timg.jpg" alt="">';
						}
						div1 += '	</div>';
						div1 += '	<div class="tips">';
						div1 += '		<div class="video-number">'+num+'</div>';
						div1 += '		<div class="video-info">';
						div1 += '			<p class="video-name">'+info.cameraName+'</p>';
						div1 += '			<p class="video-time">';
						div1 += '				<span>'+nvlDate(info.updateTime,"yyyy-MM-dd")+'</span>';
						div1 += '				<span style="float: right;">'+nvlDate(info.updateTime,"hh:mm:ss")+'</span>';
						div1 += '				<div class="clearfix"></div>';
						div1 += '			</p>';
						div1 += '		</div>';
						div1 += '		<div class="clearfix"></div>';
						div1 += '	</div>';
						div1 += '</div>';
					}
					$("#videoList").html(div1);
					
					//点击视频播放
					$(".video-box").on("click",".video",function(){
						if($(this).parent().attr("lon") != "" && $(this).parent().attr("lon") != "undefined" && $(this).parent().attr("lat") != "" && $(this).parent().attr("lat") != "undefined"){
							map.panTo(new T.LngLat($(this).parent().attr("lon"),$(this).parent().attr("lat")),15);
						}else{
							layer.alert('此视频所属企业暂无经纬度！')
						}
						if($(this).parent().attr("onLineStatus") == "1"){
							if($(this).parent().attr("camera") != "" && $(this).parent().attr("camera") != undefined){
								var cameraUuid = $(this).parent().attr("camera");
								setTimeout(function(){
									$(".video-show-box").fadeIn("fast");
									//$("#videoIframe").attr("src","https://testfile.inpark.com.cn/AttachmentPortal/hls3.jsp?cameraUuid="+cameraUuid)//testfile
									$("#source").attr("src","http://testfile.inpark.com.cn:89/mag/hls/"+cameraUuid+"/0/live.m3u8")
								},500);
							}else{
								layer.msg("视频未配置cameraUuid，请联系管理员！")
							}
						}else if($(this).parent().attr("onLineStatus") == "0"){
							
						}else{}
					});
					
					//实时预警数据
					var div2 = '';
					if(result.value.length > 7){
						for(var j=0;j<2;j++){
							for(var i = 0; i < result.value.length; i++){
								var info = result.value[i];
								div2 += '<li>';
								div2 += '	<p>';
								if(info.onLineStatus == "1"){
									div2 += '	<font class="greenT" style="float:none;">视频正常</font>';
									div2 += '	<span style="color:#fff;">【'+ info.cameraName + '】正常；</span>';
								}else if(info.onLineStatus == "0"){
									div2 += '	<font class="redT" style="float:none;">视频异常</font>';
									div2 += '	<span style="color:#fff;">【'+ info.cameraName + '】预警，无信号；</span>';
								}else{}
								div2 += '		<span class="wraningTime">' + nvlDate(info.updateTime,"hh:mm") + '</span>'
								div2 += '	</p>';
								div2 += '</li>';
							}
						}
						$("#warning").addClass("roll");
					}else{
						for(var i = 0; i < result.value.length; i++){
							var info = result.value[i];
							div2 += '<li>';
							div2 += '	<p>';
							if(info.onLineStatus == "1"){
								div2 += '	<font class="greenT" style="float:none;">视频正常</font>';
								div2 += '	<span style="color:#fff;">【'+ info.cameraName + '】正常；</span>';
							}else if(info.onLineStatus == "0"){
								div2 += '	<font class="redT" style="float:none;">视频异常</font>';
								div2 += '	<span style="color:#fff;">【'+ info.cameraName + '】预警，无信号；</span>';
							}else{}
							div2 += '		<span class="wraningTime">' + nvlDate(info.updateTime,"hh:mm") + '</span>'
							div2 += '	</p>';
							div2 += '</li>';
						}
						$("#warning").removeClass("roll");
					}
					$("#warning").html(div2);
					
					//绘制设备在线情况饼图数据
					var online = 0;
					var notOnline = 0;
					for(var i = 0; i < result.value.length; i++){
						var info = result.value[i];
						if(info.onLineStatus == "1"){
							online++;
						}else if(info.onLineStatus == "0"){
							notOnline++;
						}else{}
					}
					pieData = [{
						value: online,
						name: '在线'
					}, {
						value: notOnline,
						name: '不在线'
					}]
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	}
	
	function getSatelliteMap(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/hikvision/selectCameraInfo",//testfile
			type : "post",
			data : {
				cameraName : $("#searchInput").val()
			},
			dataType : "json",
			success : function(result){
				if(result.success){
					map.clearOverLays();
					//去除没有经纬度的数据
					var longLatList = [];
					for (var i = 0; i < result.value.length; i++) {
						var info = result.value[i];
						if(info.longitude != "" && info.longitude != undefined && info.latitude != "" && info.latitude != undefined){
							var one = {longitude:info.longitude,latitude:info.latitude,companyId:info.companyId};
							longLatList.push(one);
						}
					}
					//console.log(longLatList)
					//去除剩余数组中重复的数据
					var resultList = [];
					for(var i=0 ; i<longLatList.length ; i++){
						var flag = true;
						for(var j=0 ; j<resultList.length ; j++){
							if(longLatList[i].longitude == resultList[j].longitude){
								flag = false;
							};
						}; 
						if(flag){
							resultList.push(longLatList[i]);
						};
					};
					//console.log(resultList)
			        //经纬度转换BD09 => WGS84
			        var changeList = [];
					for (var i = 0; i < resultList.length; i++) {
						var info = resultList[i];
						//BD09 => GCJ02
						var gc = baiduTomars({lon:info.longitude,lat:info.latitude})
						//GCJ02 => WGS84
						var wg = transformGCJ2WGS(gc.lon,gc.lat);
						wg.companyId = info.companyId;
						changeList.push(wg)
					}
					//console.log(changeList)
					
					//天地图数据
					//转换前经纬度
					/* for (var i = 0; i < resultList.length; i++) {
						var info = resultList[i];
			            var point = new T.LngLat(info.longitude,info.latitude);
			        } */
			        //转换后经纬度
					for (var i = 0; i < changeList.length; i++) {
						var info = changeList[i];
			            var point = new T.LngLat(info.lon,info.lat);
			            var marker = new T.Marker(point);// 创建标注
			            map.addOverLay(marker);
			            
			            if(info.companyId != "" && info.companyId != undefined){
				            $.ajax({
								url : "${OfficeUrl}XOffice/interface/json/hikvision/selectCameraInfo",//testfile
								type : "post",
								data : {
									companyId : info.companyId
								},
								async: false,
								dataType : "json",
								success : function(result){
									if(result.success){
										var label = new T.Label({
							                text: "",
							                position: point,
							                offset: new T.Point(0, 0)
							            });
										var lContent = '';
											lContent+= '<div class="videoWarnBar">';
											for(var i=0 ; i<result.value.length ; i++){
												var info = result.value[i];
												lContent+= '	<div class="videoWarn">';
												if(info.onLineStatus == "1"){
													lContent+= '		<img src="${ctx}/static/image/cityDataCenter/ycFourth/normal.png" width="20">';
													lContent+= '		<span style="background-color: rgba(4,178,12,0.6);">【'+ info.cameraName + '】正常；</span>';
												}else if(info.onLineStatus == "0"){
													lContent+= '		<img src="${ctx}/static/image/cityDataCenter/ycFourth/warning.png" width="20">';
													lContent+= '		<span style="background-color: rgba(255,9,26,0.6);">【'+ info.cameraName + '】预警，无信号；</span>';
												}else{}
												lContent+= '	</div>';
											}
											lContent+= '</div>';
										label.setLabel(lContent);
							            map.addOverLay(label);
							            
							            var infoWin = new T.InfoWindow(content,{
							            	closeButton: false,
							            	offset:new T.Point(0,-30)
							            });
							            infoWin.setLngLat(point);
							            infoWin.setContent(result.value[0].companyName);
							            map.addOverLay(infoWin);
									}
								},
								error : function() {
									//alert("校验权限异常");
								}
							});
			            }
			        }
			        if(changeList != [] && changeList != undefined){
			        	setTimeout(function(){
				            map.panTo(new T.LngLat(changeList[0].lon,changeList[0].lat),13);
				        },500)
			        }
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	}
	
	function getPie(){
		var data = pieData;
		devicePie(data);
	}
	
	//鼠标点击和键盘回车搜索操作
	function searchVideo(){
		getMonitorVideo();
		getSatelliteMap();
	}
	$("#searchInput").on('keypress',function(e) {  
        var keycode = e.keyCode;
        if(keycode=='13') {
            e.preventDefault();
            //请求搜索接口
            getMonitorVideo();
            getSatelliteMap();
        }  
 	});
	
	function nvlDate(d,fmt){
		if(d==null || d==undefined){
			return "";
		}
		return formatCSTDate(d,fmt);;
	}
	//格式化CST日期的字串
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
<script type="text/javascript">
	var map;
	var zoom = 13;
	onLoad();
	function onLoad() {
	  	//初始化地图对象
        map = new T.Map("satelliteMap");
        //设置显示地图的中心点和级别
        map.centerAndZoom(new T.LngLat(114.35690683766214,27.874402220782343), zoom);
        
        map.setMapType(TMAP_HYBRID_MAP);
	}
	/* var map;
	var markers = [];
	var markerClusterer;
	
	map = new BMap.Map("satelliteMap");
	var point = new BMap.Point(116.033448,27.319418);
	map.centerAndZoom(point, 8); 
	map.enableScrollWheelZoom();                            //启用滚轮放大缩小
	map.addControl(new BMap.NavigationControl());              // 添加平移缩放控件
	map.addControl(new BMap.ScaleControl());                   // 添加比例尺控件
	map.addControl(new BMap.OverviewMapControl());             //添加缩略地图控件
	//map.addControl(new BMap.MapTypeControl());          //添加地图类型控件
	map.setMapType(BMAP_HYBRID_MAP); */
</script>
</html>
