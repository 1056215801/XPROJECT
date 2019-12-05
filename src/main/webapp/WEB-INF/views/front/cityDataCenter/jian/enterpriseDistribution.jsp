<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<%-- <%@ include file="header.jsp"%> --%>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>吉安企业分布</title>
    <!-- <link href="../../js/jquery-weui/lib/weui.min.css" rel="stylesheet" >
	<link href="../../js/jquery-weui/css/jquery-weui.css" rel="stylesheet">
    <link href="../../pc/css/industryMap/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="../../pc/css/industryMap/industryMap.css" rel="stylesheet"/> -->
    <link href="${ctx}/static/css/cityDataCenter/industryMap.css" rel="stylesheet">
    <style type="text/css">
    	/*解决vue.js由于延时显示了{{message}}引用界面解决方法*/
		[v-cloak] {
		    display: none;
        }
        /*去除百度地图版权*/
        .anchorBL{
            display:none;
        }
        .BMap_cpyCtrl{
            display:none;
        }
    </style>
</head>
<body>
<div class="industry_main">
	<div class="map_header">
		<img id="logoImage" src="${ctx}/static/image/cityDataCenter/jian/logo.png" height="49">
		
		<div class="moduleChoiceBar clearfix">
			<div class="moduleChoice thisModule" id="enterprise"><img src="${ctx}/static/image/cityDataCenter/jian/enterpriseDistribution.png" width="26"><span>企业分布</span></div>
		</div>
	</div>
	
	<div id="allmap"></div>
	
	<div class="map_copyright">
		技术支持：江西融合科技有限责任公司
		<div class="map_author">Sean</div>
	</div>
	
</div>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="../../js/jquery-weui/js/jquery-weui.js"></script> -->

<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<!-- <script type="text/javascript" src="../../pc/js/ckplayer/ckplayer.js"></script> -->

<script type="text/javascript" src="${ctx}/static/js/dataCenter/map/coordMap.js"></script>

<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=2b82bdceb647d5f7819514f45c752413"></script>
<!-- <script type="text/javascript" src="https://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script> -->
<script type="text/javascript" src="${ctx}/static/js/dataCenter/map/TextIconOverlay.js"></script><!-- line717、766 -->
<script type="text/javascript" src="https://api.map.baidu.com/library/EventWrapper/1.2/src/EventWrapper.min.js"></script>
<!-- <script type="text/javascript" src="https://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script> -->
<!-- <script type="text/javascript" src="${ctx}/static/js/dataCenter/map/MarkerClusterer.js"></script> -->
<script type="text/javascript" src="${ctx}/static/js/dataCenter/map/MarkerClusterer2.js"></script><!-- line198、494 -->
<script type="text/javascript" src="https://lbsyun.baidu.com/custom/stylelist.js"></script>
<script type="text/javascript">
var searchProvinceId= "360000";
var searchAreaId= "";
var searchSpaceId= "";
var searchCompanyName= "";
var searchTypeId= "";
var searchZyywsrValue= "";
var pageNumber= 1;
var pageSize= 10;
var isFirst= true;//判断是否首次加载
	$(function(){
		//console.log(${UrlPath})
		//getMapData();
		
		
	})
	function getMapData(){
		$.ajax({
			url : "${UrlPath}XWeixin/interface/json/companyInfo/list",
			type : "post",
			data : {
				"provinceId":searchProvinceId,
				"areaId":searchAreaId,
				"companyName":searchCompanyName,
				"typeId":searchTypeId,
				"zyywsrValue":searchZyywsrValue
			},
			dataType : "json",
			success : function(result) {
				console.log(result)
				if(result.success){
					if(!isFirst){
						//清除所有标注
						for(var i=0;i<markers.length;i++){
							map.removeOverlay(markers[i]);
						}
						//清除所有聚合(指向清除markers时，必须放在清空marker数组数据之前)
						markerClusterer.removeMarkers(markers);
						//markerClusterer.clearMarkers();//可放置于清空marker数组数据之后
						//清空marker数组数据
						markers.splice(0,markers.length);
					}
					
					for(var i=0;i<result.list.length;i++){
						var list = result.list[i];
						
						if(list.addressLongitude == undefined){list.addressLongitude = "";}
						if(list.addressLatitude == undefined){list.addressLatitude = "";}
						
						var marker = new BMap.Marker(new BMap.Point(list.addressLongitude,list.addressLatitude));  // 创建标注
						marker.id = 'marker'+i;//添加marker时附加一个id属性
						var n = -(list.companyName.length*10-8)/2;//计算label水平位移距离
						var label = new BMap.Label("<div style='text-align:center;'>"+list.companyName+"</div>",{offset:new BMap.Size(n,-25)});
						marker.setLabel(label);
						label.setStyle({
							color : "#000",
							backgroundColor:'#FFF',//文本背景色
							borderColor:'#0F90D2',//文本框边框色
							fontSize : "10px",
							height : "20px",
							lineHeight : "20px",
							fontFamily:"微软雅黑",
							cursor: "pointer"
						});
						addClickHandler(marker,list.companyId);
						addLabelClickHandler(label,list.companyId)
						
						markers.push(marker);
					}
					//生成覆盖物的点聚合
					markerClusterer = new BMapLib.MarkerClusterer(map, {markers:markers});
					markerClusterer.setMinClusterSize(3);//设置单个聚合的最小数量
					
					//删除样式文件，还原自定义覆盖物label下的before颜色
					$("#allmap").removeClass("prov");
				}else{
					layer.msg(result.errorMsg);
				}
			},
			error : function() {
				layer.msg("系统异常");
			}
		});
	}
	
	//企业分布的详情页面，主要产品的获取
	function getProductDisplay(companyId){
		$.ajax({
        	url : "https://www.jx968969.com/XProduction/interface/json/showProductInfo/searchList",
        	type : "post",
        	data : {
        		"companyId": companyId,//"201601250528128080930"
        		"pageNum": 1,
        		"pageSize": 8
        	},
        	dataType : "json",
			success : function(result) {
				var list = result.productList;
				var _div = "";
				if(list.length == 0 && result.total == 0){
					$(".industryDataBar").html("<div class=\'noProductData\'>暂无产品</div>");
				}else {
					for(var i=0 ; i<list.length ; i++){
						var info = list[i];
						_div += "<div class=\'industryData\'>";
						_div += "	<div class=\'industryImg\'>";
					if(info.picUrl != undefined && info.picUrl != ''){
						_div += "		<img src=\'"+nvlStr(info.picUrl)+"\' width=\'100%\'>";
					}else{
						_div += "		<img src=\'../../pc/image/industryMap/defaultImage.png\' width=\'100%\'>";
					}
						_div += "	</div>";
						_div += "	<div class=\'industryName\'>"+nvlStr(info.productName)+"</div>";
						_div += "</div>";
					}
				}
				
				$(".industryDataBar").append(_div);
			},
			error :function(){
				
			}
        });
	}
</script>
<script type="text/javascript">
	var map;
	var markers = [];
	var markerClusterer;
	
	map = new BMap.Map("allmap");
	var point = new BMap.Point(114.905444,27.021259);
	map.centerAndZoom(point, 17); 
	map.enableScrollWheelZoom();                            //启用滚轮放大缩小
	map.addControl(new BMap.NavigationControl());               // 添加平移缩放控件
	map.addControl(new BMap.ScaleControl());                    // 添加比例尺控件
	map.addControl(new BMap.OverviewMapControl());              //添加缩略地图控件
	//map.addControl(new BMap.MapTypeControl());          //添加地图类型控件
	map.disable3DBuilding();
		
	//底层地图替换主题. 模板页可以查看http://lbsyun.baidu.com/custom/list.htm      
	map.setMapStyle({style:'bluish'});
	
	var marker1 = new BMap.Marker(new BMap.Point(114.905444, 27.021259));
	var marker2 = new BMap.Marker(new BMap.Point(114.903472, 27.018423));
	var marker3 = new BMap.Marker(new BMap.Point(114.904142, 27.018808));
	var marker4 = new BMap.Marker(new BMap.Point(114.902639, 27.023325));
	var marker5 = new BMap.Marker(new BMap.Point(114.908744, 27.019881));
	
	map.addOverlay(marker1);
	map.addOverlay(marker2);
	map.addOverlay(marker3);
	map.addOverlay(marker4);
	map.addOverlay(marker5);
	
	//地图详情页面tab切换
	function tabOper(e){
		var er = $(e).attr("value");
		$("#allmap .nav>li").removeClass("active");
		$(e).addClass("active");
		$("#allmap .tab-content>div").removeClass("active");
		$("#detailTab-"+er).addClass("active");
	}
	var opts = {
		width : 480,     // 信息窗口宽度
		height: 350,     // 信息窗口高度
		title : false, // 信息窗口标题
		offset: new BMap.Size(0, -20)
	};
	function addClickHandler(marker,companyId){
		marker.addEventListener("click",function(e){
			openInfo(companyId,e)
		});
	}
	function addLabelClickHandler(label,companyId){
		//文本标注点击显示信息窗口
		label.addEventListener("click",function(e){
			openInfo(companyId,e)
		})
	}
	function openInfo(companyId,e){
		$.ajax({
			url : path + "/interface/json/companyInfo/detail",
			type : "post",
			data : {
				"companyId":companyId
			},
			dataType : "json",
			success : function(result) {
				if(result.success){
					var value = result.value;
					
					var content = "<div class='tabs-container'>";
						content+=     "<div class='tabs-left'>";
						content+=         "<ul class='nav nav-tabs'>";
						content+=             "<li class='active' value='1' onclick='tabOper(this)'><a data-toggle='tab'>基本情况</a></li>";
						content+=             "<li class='' value='2' onclick='tabOper(this)'><a data-toggle='tab'>宣传视频</a></li>";
						content+=             "<li class='' value='3' onclick='tabOper(this)'><a data-toggle='tab'>主要产品</a></li>";
						/* content+=             "<li class='' value='4' onclick='tabOper(this)'><a data-toggle='tab'>经济指标</a></li>"; */
						content+=         "</ul>";
						content+=         "<div class='tab-content'>";
						content+=             "<div id='detailTab-1' class='tab-pane active'>";
						content+=                 "<div class='panel-body'>";
						content+=                 	  "<div class='detailImage'>";
					if(value.organizationPanoramaBean.snapshotAtUrl != undefined && value.organizationPanoramaBean.snapshotAtUrl != ''){
						content+=                     	  "<img src="+value.organizationPanoramaBean.snapshotAtUrl+" width='75%'>";
					}else{
						content+=					  	  "<img src='../../pc/image/industryMap/yuanqu.jpg' width='75%'>";
					}
						//content+=					  	  "<img src='../../pc/image/industryMap/ycCode.jpg' width='25%'>";
						content+=                 	  "</div>";
						content+=                 	  "<div class='detailName'>"+nvlStr(value.companyName)+"</div>";
						content+=                 	  "<div class='detailContBar'>";
						content+=                 	  	  "<div class='detailCont'>";
					if(value.parkName != undefined && value.parkName != ''){
						content+=                 	  		  "<span class='detailAttr'>所在园区</span><span class='detailValue'>"+nvlStr(value.parkName)+"</span>";
					}else{
						content+=                 	  		  "<span class='detailAttr'>所在园区</span><span class='detailValue noText'></span>";
					}
					if(value.socialCreditNo != undefined && value.socialCreditNo != ''){
						content+=                 	  		  "<span class='detailAttr'>统一社会信用代码</span><span class='detailValue'>"+nvlStr(value.socialCreditNo)+"</span>";
					}else{
						content+=                 	  		  "<span class='detailAttr'>统一社会信用代码</span><span class='detailValue noText'></span>";
					}
						content+=                 	  	  "</div>";
						content+=                 	  	  "<div class='detailCont'>";
					if(value.legalPerson != undefined && value.legalPerson != ''){
						content+=                 	  		  "<span class='detailAttr'>法人代表</span><span class='detailValue'>"+nvlStr(value.legalPerson)+"</span>";
					}else{
						content+=                 	  		  "<span class='detailAttr'>法人代表</span><span class='detailValue noText'></span>";
					}
					if(value.siteUrl != undefined && value.siteUrl != ''){
						content+=                 	  		  "<span class='detailAttr'>网站地址</span><span class='detailValue'><span onclick='openSiteUrl(\""+nvlStr(value.siteUrl)+"\")' style='color: #0F90D2; cursor: pointer;'>点击查看</span></span>";
					}else{
						content+=                 	  		  "<span class='detailAttr'>网站地址</span><span class='detailValue noText'></span>";
					}
						content+=                 	  	  "</div>";
						content+=                 	  	  "<div class='detailCont'>";
					if(value.wxCode != undefined && value.wxCode != ''){
						content+=                 	  		  "<span class='detailAttr'>微信公众号(二维码)</span><span class='detailValue'>"+nvlStr(value.wxCode)+"</span>";
					}else{
						content+=                 	  		  "<span class='detailAttr'>微信公众号(二维码)</span><span class='detailValue noText'></span>";
					}
					if(value.positionAddress != undefined && value.positionAddress != ''){
						content+=                 	  		  "<span class='detailAttr'>企业地址</span><span class='detailValue'>"+nvlStr(value.positionAddress)+"</span>";
					}else{
						content+=                 	  		  "<span class='detailAttr'>企业地址</span><span class='detailValue noText'></span>";
					}
						content+=                 	  	  "</div>";
						content+=                 	  	  "<div class='detailCont'>";
					if(value.officePhone != undefined && value.officePhone != ''){
						content+=                 	  		  "<span class='detailAttr'>联系方式</span><span class='detailValue'>"+nvlStr(value.officePhone)+"</span>";
					}else{
						content+=                 	  		  "<span class='detailAttr'>联系方式</span><span class='detailValue noText'></span>";
					}
					if(value.organizationPanoramaBean.panoramaUrl != undefined && value.organizationPanoramaBean.panoramaUrl != ''){
						content+=                 	  		  "<span class='detailAttr'>360°全景</span><span class='detailValue'><a href='"+value.organizationPanoramaBean.panoramaUrl+"' target='_blank' style='color: #0F90D2;'>点击查看</a></span>";
					}else{
						content+=                 	  		  "<span class='detailAttr'>360°全景</span><span class='detailValue noText'></span>";
					}
						content+=                 	  	  "</div>";
						content+=                 	  "</div>";
						content+=                 "</div>";
						content+=             "</div>";
						content+=             "<div id='detailTab-2' class='tab-pane'>";
						content+=                 "<div class='panel-body'>";
						content+=					  "<div class='productionLineBar'>";
						content+=		            	 "<div id='productionLine'></div>";
						content+=		          	  "</div>";
						content+=                 "</div>";
						content+=             "</div>";
						content+=             "<div id='detailTab-3' class='tab-pane'>";
						content+=                 "<div class='panel-body'>";
						content+=					  "<div class='industryDataBar clearfix'>"
						content+=					  "</div>"
						content+=                 "</div>";
						content+=             "</div>";
						/* content+=             "<div id='detailTab-4' class='tab-pane'>";
						content+=                 "<div class='panel-body'>";
						content+=                 	  "<div class='detailImage'>";
					if(value.organizationPanoramaBean.snapshotAtUrl != undefined && value.organizationPanoramaBean.snapshotAtUrl != ''){
						content+=                     	  "<img src="+value.organizationPanoramaBean.snapshotAtUrl+" width='75%'>";
					}else{
						content+=					  	  "<img src='../../pc/image/industryMap/yuanqu.jpg' width='75%'>";
					}
						//content+=					  	  "<img src='../../pc/image/industryMap/ycCode.jpg' width='25%'>";
						content+=                 	  "</div>";
						content+=                 	  "<div class='detailName'>"+nvlStr(value.companyName)+"</div>";
						content+=                 	  "<div class='detailContBar'>";
						content+=                 	  	  "<div class='detailCont'>";
					if(value.coIndicatorMonthLogBean.gyzczValue != undefined && value.coIndicatorMonthLogBean.gyzczValue != ''){
						content+=                 	  		  "<span class='detailAttr'>上年度工业增加值</span><span class='detailValue'>"+nvlStr(value.coIndicatorMonthLogBean.gyzczValue)+"（万元）</span>";
					}else{
						content+=                 	  		  "<span class='detailAttr'>上年度工业增加值</span><span class='detailValue noText'></span>";
					}
					if(value.coIndicatorMonthLogBean.ckjhlValue != undefined && value.coIndicatorMonthLogBean.ckjhlValue != ''){
						content+=                 	  		  "<span class='detailAttr'>上年度出口交货量</span><span class='detailValue'>"+nvlStr(value.coIndicatorMonthLogBean.ckjhlValue)+"（万元）</span>";
					}else{
						content+=                 	  		  "<span class='detailAttr'>上年度出口交货量</span><span class='detailValue noText'></span>";
					}
						content+=                 	  	  "</div>";
						content+=                 	  	  "<div class='detailCont'>";
					if(value.coIndicatorMonthLogBean.pjcyryValue != undefined && value.coIndicatorMonthLogBean.pjcyryValue != ''){
						content+=                 	  		  "<span class='detailAttr'>上年度平均从业人员个数</span><span class='detailValue'>"+nvlStr(value.coIndicatorMonthLogBean.pjcyryValue)+"（人）</span>";
					}else{
						content+=                 	  		  "<span class='detailAttr'>上年度平均从业人员个数</span><span class='detailValue noText'></span>";
					}
					if(value.coIndicatorMonthLogBean.zyywsrValue != undefined && value.coIndicatorMonthLogBean.zyywsrValue != ''){
						content+=                 	  		  "<span class='detailAttr'>上年度主营业务收入</span><span class='detailValue'>"+nvlStr(value.coIndicatorMonthLogBean.zyywsrValue)+"（万元）</span>";
					}else{
						content+=                 	  		  "<span class='detailAttr'>上年度主营业务收入</span><span class='detailValue noText'></span>";
					}
						content+=                 	  	  "</div>";
						content+=                 	  	  "<div class='detailCont'>";
					if(value.coIndicatorMonthLogBean.yjzzsValue != undefined && value.coIndicatorMonthLogBean.yjzzsValue != ''){
						content+=                 	  		  "<span class='detailAttr'>上年度利税</span><span class='detailValue'>"+nvlStr(value.coIndicatorMonthLogBean.yjzzsValue)+"（万元）</span>";
					}else{
						content+=                 	  		  "<span class='detailAttr'>上年度利税</span><span class='detailValue noText'></span>";
					}
					if(value.coIndicatorMonthLogBean.lrValue != undefined && value.coIndicatorMonthLogBean.lrValue != ''){
						content+=                 	  		  "<span class='detailAttr'>上年度利润</span><span class='detailValue'>"+nvlStr(value.coIndicatorMonthLogBean.lrValue)+"（万元）</span>";
					}else{
						content+=                 	  		  "<span class='detailAttr'>上年度利润</span><span class='detailValue noText'></span>";
					}
						content+=                 	  	  "</div>";
						content+=                 	  "</div>";
						content+=                 "</div>";
						content+=             "</div>"; */
						
						content+=         "</div>";
						content+=     "</div>";
						content+= "</div>";

					var p = e.target;
					var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
					var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
					map.openInfoWindow(infoWindow,point); //开启信息窗口
					/* setTimeout(function(){
						$(".tabs-container").parent().parent().addClass("pointDetailBar");
					},300) */
					
					//获取企业的视频文件并初始化
					setTimeout(function(){
						var video = result.value.organizationVideoBean;
						if(video != ""){
							productionLineUrl = video[0].videoUrl;
							VideoPlay(productionLineUrl,-1,305);
						}else {
							VideoPlay("",-1,305);
						}
					},300)
					
					getProductDisplay(companyId);
				}else{
					layer.msg("系统异常");
				}
			},
			error : function() {
				layer.msg("系统异常");
			}
		});
		
	}
	
	//展开网站地址
	function openSiteUrl(url){
		layer.open({
			title: false,
			shade: 0.1,
			shadeClose: true,
			content: url,
		});   
	}
	
	//指定省市进行描边处理
	function getBoundary(map,city){
		/* var bdary = new BMap.Boundary();
		bdary.get(city,function(rs){//获取行政区域
			map.clearOverlays();        //清除地图覆盖物           
			var count = rs.boundaries.length;//行政区域的点有多少个
			if(count === 0){
				alert("未能获取当前输入行政区域");
				return;
			}
			var pointArray = [];
			for(var i=0;i<count;i++){
				var ply = new BMap.Polygon(rs.boundaries[i],{strokeWeight:3,strokeColor:"#2C06C6",fillColor:"#fff",fillOpacity:"0.5"});//建立多边形覆盖物transparent
				map.addOverlay(ply);//添加覆盖物
				pointArray = pointArray.concat(ply.getPath());
			}
			map.setViewport(pointArray);//调整视野
		}) */
		var bdary = new BMap.Boundary();
        bdary.get(city, function(rs){//获取行政区域
	        map.clearOverlays();//清除地图覆盖物
	        //思路：利用行政区划点的集合与外围自定义东南西北形成一个环形遮罩层
	        //1.获取选中行政区划边框点的集合rs.boundaries[0]
	        var strs = new Array();
	        strs = rs.boundaries[0].split(";");
	        var ENWS = ""; 
        	for (var i=0;i<strs.length;i++) {
        		ENWS += strs[i] + ";"
            }
	        //2.自定义外围边框点的集合
	        var E_JW = "170.672126, 39.623555;";        //东
	        var EN_JW = "170.672126, 81.291804;";       //东北角
	        var N_JW = "105.913641, 81.291804;";        //北
	        var NW_JW = "-169.604276,  81.291804;";     //西北角
	        var W_JW = "-169.604276, 38.244136;";       //西
	        var WS_JW = "-169.604276, -68.045308;";     //西南角
	        var S_JW = "114.15563, -68.045308;";        //南
	        var SE_JW = "170.672126, -68.045308 ;";     //东南角
	        //3.添加环形遮罩层
	        var ply1 = new BMap.Polygon(ENWS + E_JW + SE_JW + S_JW + WS_JW + W_JW + NW_JW + N_JW + EN_JW + E_JW, {strokeColor:"none",strokeOpacity:0,fillColor:"#fff",fillOpacity:"0.6"}); //建立多边形覆盖物
	        map.addOverlay(ply1);//遮罩物是半透明的，如果需要纯色可以多添加几层
	        //4. 给目标行政区划添加边框，其实就是给目标行政区划添加一个没有填充物的遮罩层
	        var ply = new BMap.Polygon(rs.boundaries[0], {strokeWeight:3,strokeColor:"#114bf3",fillColor:""});
	        map.addOverlay(ply);   
	        map.setViewport(ply.getPath());//调整视野 
        }); 
	}
</script>
<script type="text/javascript">
	//"http://movie.ks.js.cn/flv/other/1_0.mp4"
    function VideoPlay(F,A,E){ // F:url A:width E:height
		if(F == "" || F == undefined){
			F = "https://file.inpark.com.cn/resources/2017/09/06/90020170906145836008002000001029.mp4";
		}
        var B = F;
        var G = { f: B, c: 0, b: 1, p: 2, i: "../../pc/image/industryMap/black.jpg" };
        var D = { bgcolor: "#000", allowFullScreen: true, allowScriptAccess: "always" };
        var C = ["" + B + "->video/mp4", "" + B + "->video/webm", "" + B + "->video/ogg"];
        var H = ["all"];
        CKobject.embed("ckplayer/ckplayer.swf", "productionLine", "ckplayer_productionLine", A, E, true, G, C, D, H)
    }
</script>
</body>
</html>