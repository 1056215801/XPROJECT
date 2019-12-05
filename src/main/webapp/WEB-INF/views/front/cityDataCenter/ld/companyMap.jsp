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
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/liData/homePage.css"/>
<title>锂电大数据首页</title>
<style>
::-webkit-input-placeholder { /* WebKit, Blink, Edge */
    color: #BFBFFF;
}
:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
    color: #BFBFFF;
}
::-moz-placeholder { /* Mozilla Firefox 19+ */
    color: #BFBFFF;
}
:-ms-input-placeholder { /* Internet Explorer 10-11 */
    color: #BFBFFF;
}
</style>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="container-fluid content2">
		<input type="hidden" id="type" value="3">
		<input type="hidden" id="proId" value="">
		<input type="hidden" id="areaId" value="">
		<input type="hidden" id="areaName" value="">
		<input type="hidden" id="link1" value="">
		<input type="hidden" id="link2" value="">
		<input type="hidden" id="productId" value="">
		<div class="map-tab">
			<div class="tab">
				<div class="map-items" id="menu1">
					<p>锂电正极材料</p>
					<p>新能源汽车电机及配套商</p>
					<p>动力锂电池</p>
					<p>新能源汽车产业</p>
				</div>
				<div class="map-selects" id="menu2">
				</div>
			</div>
		</div>
		<div class="map-tab2">
			<div class="tab">
				<div class="map-search">
					<img class="dib" src="${ctx}/static/image/cityDataCenter/yc/search.png">
					<input class="dib" id="compName" oninput="search(this)" type="text" placeholder="请输入企业名称">
					<img class="dib" id="del" onclick="clearInput()" src="${ctx}/static/image/cityDataCenter/yc/delete.png">
				</div>
				<div class="map-chart" id="chart"></div>
				<ul class="map-companys" id="tab2">
					<li class="map-company">
						<span>山东省</span>
						<span>32家</span>
					</li>
				</ul>
				<div class="list-cover" id="compList">
					<p>新能源汽车产业</p>
				</div>
			</div>
		</div>
	</div>
	<div class="baidu-map" id="allmap"></div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/map/world.js"></script>
<script type="text/javascript" src="${ctx}/static/map/china.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/liData.js"></script>

<script type="text/javascript" src="${ctx}/static/pc/js/coordMap.js"></script>
<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=2b82bdceb647d5f7819514f45c752413"></script>
<script>
var _IMAGE_PATH = '${ctx}/static/pc/image/industryMap/m';
</script>
<script type="text/javascript" src="${ctx}/static/pc/js/industryMap/TextIconOverlay.js"></script><!-- line717、766 -->
<script type="text/javascript" src="https://api.map.baidu.com/library/EventWrapper/1.2/src/EventWrapper.min.js"></script>
<script type="text/javascript" src="${ctx}/static/pc/js/industryMap/MarkerClusterer2.js"></script><!-- line198、494 -->
<script type="text/javascript" src="https://lbsyun.baidu.com/custom/stylelist.js"></script>
<script type="text/javascript">
	$(function () {	
		$("#time").text(getNow());
		if('${type}' == 6){
			//当Url.queryString("areaId")或者Url.queryString("areaName")不为空，说明层级为市级
			$("#type").val('6');
			$("#productId").val('${typeId}');
		} else if('${type}' == 5){
			//当Url.queryString("areaId")或者Url.queryString("areaName")不为空，说明层级为市级
			$("#type").val('4');
			$("#proId").val('360000');
			$("#areaId").val('360900');
			$("#areaName").val('宜春市');
			getBoundary(map,"宜春市");//行政区域
		} else if('${type}' == 4) {
			//当Url.queryString("areaId")或者Url.queryString("areaName")不为空，说明层级为市级
			$("#type").val('3');
			$("#proId").val('360000');
			$("#areaName").val('江西省');
			getBoundary(map,"江西省");//行政区域
		} else if('${type}' == 3) {
			//当Url.queryString("areaId")或者Url.queryString("areaName")不为空，说明层级为市级
			$("#type").val('');
		} 
		getMenu(1)
	});
	var isFirst = true;
	var mapData = [];
	var localData = '';
	var localIndex = '';
	function getCompany(isC) {
		var type = $("#type").val();
		var areaId = $("#areaId").val();
		var proId = $("#proId").val();
		var id = $("#productId").val();
		var param = {
			compPrId: proId,
			compAreaId: areaId,
			link1: $("#link1").val(),
			link2: $("#link2").val(),
			compName: $("#compName").val()
		}
		if(param.compName != ''){
			param.compPrId = '';
			param.compAreaId = '';
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liCompInfo/list",
			type : "post",
			data : param,
			dataType : "json",
			success : function(result) {
				if(isC){  //条件筛选
					var div = '';
					for(var i=0;i<result.value.length;i++){
						var list = result.value[i];
						div += '<p onclick="searchComp(\''+list.compPrName+'\',\''+list.compAreaName+'\',\''+list.compPrId+'\',\''+list.compAreaId+'\',\''+list.compName+'\')">'+list.compName+'</p>'
					}
					$("#compList").html(div)
				} else {
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
					for(var i=0;i<result.value.length;i++){
						var list = result.value[i];
						
						if(list.id == id){
							localData = list;
							localIndex = i;
							$("#productId").val('')
							if(list.provinceId == '360000'){ //分省内省外
								getBoundary(map,list.areaName);//行政区域
								
							} else {
								getBoundary(map,list.provinceName);//行政区域
							}
							return setTimeout(function(){ getCompany();},500)
						}
						
						if(list.addressLongitude == undefined){list.addressLongitude = "";}
						if(list.addressLatitude == undefined){list.addressLatitude = "";}
						
						var marker = new BMap.Marker(new BMap.Point(list.addressLongitude,list.addressLatitude));  // 创建标注
						marker.id = 'marker'+i;//添加marker时附加一个id属性
						var n = -(list.compName.length*12-8)/2;//计算label水平位移距离
						var label = new BMap.Label("<div style='text-align:center;'>"+list.compName+"</div>",{offset:new BMap.Size(n,-25)});
						marker.setLabel(label);
						label.setStyle({
							color : "#000",
							backgroundColor:'#FFF',//文本背景色
							borderColor:'#0F90D2',//文本框边框色
							fontSize : "12px",
							height : "20px",
							lineHeight : "20px",
							fontFamily:"微软雅黑",
							cursor: "pointer"
						});
						addClickHandler(marker,list);
						addLabelClickHandler(label,list)
						
						markers.push(marker);
					}
					//生成覆盖物的点聚合
					markerClusterer = new BMapLib.MarkerClusterer(map, {markers:markers});
					markerClusterer.setMinClusterSize(3);//设置单个聚合的最小数量
					
					//删除样式文件，还原自定义覆盖物label下的before颜色
					$("#allmap").removeClass("prov");
					getDetail();
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			}
		})
	}
	function getDetail(){
		var markerId = 'marker' + localIndex;
		var list = localData;
   		if(list.addressLongitude != undefined && list.addressLongitude != "" 
   		&& list.addressLatitude != undefined && list.addressLatitude != ""){
       		var point = new BMap.Point(list.addressLongitude,list.addressLatitude);
       		map.centerAndZoom(point, 16);
       		//根据列表返回的values值，打开对应的marker的详情页面
       		//var markerId = $(e.currentTarget).parent().attr("values");
       		//var markerId = $(e.currentTarget).attr("values");
       		setTimeout(function(){//延时加载map.getOverlays()，防止marker.id未赋值
	        		var markers = map.getOverlays();//获取所有marker进行遍历
		            for (var i = 0; i < markers.length; i++) {
		                if (markers[i].toString() == "[object Marker]") {
		                    if (markers[i].id == markerId) {
		                    	markers[i].dispatchEvent("click");
		                    }
		                }
		            }
       		},500)
   		}
	}
	function getMenu(kind,name){
		var param = {
			type: kind,
			name: name
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liCompInfo/getLinkArray",
			type : "post",
			data : param,
			dataType : "json",
			success : function(result) {
				if(result.success){
					var _div = '';
					if(kind == 1){
						for(var i=0;i<result.list.length;i++){
							var list = result.list[i];
							var c = i==0? 'on' : ''
							_div += '<p class="'+c+'">'+list+'</p>';
						}
						$("#menu1").html(_div);
						$("#menu1 p").on("click",function(){                           //一级菜单点击效果
							$(this).addClass("on").siblings().removeClass("on");
							$("#link1").val($(this).text())
							isFirst = false;
							getMenu(2,$(this).text())
						})
						$("#link1").val(result.list[0]); 
						getMenu(2,result.list[0])       //默认加载二级菜单
					} else {
						for(var i=0;i<result.list.length;i++){
							var list = result.list[i];
							var c = i==0? 'on' : ''
							_div += '<span class="'+c+'">'+list+'</span>';
						}
						$("#menu2").html(_div);
						$("#menu2 span").on("click",function(){                         //二级菜单点击效果
							$(this).toggleClass("on").siblings().removeClass("on");
							$("#link2").val($(this).text())
							if(!$(this).hasClass("on")){ $("#link2").val('');}
							isFirst = false;
							getCompany();          //根据点击值获取企业列表
							getMapData(1); //单独获取左边的地区列表
							getMapData(2); //单独获取左边的省级列表
						})
						$("#link2").val(result.list[0]); 
						getCompany();          //根据默认值获取企业列表
						getMapData(1); //单独获取左边的地区列表
						getMapData(2); //单独获取左边的省级列表
					}
				}else{
					layer.msg(result.errorMsg);
				}
			},
			error : function() {
				layer.msg("系统异常");
			}
		});
	}
	function search(e) {
		$("#compName").val($(e).val());
		if($(e).val() != ""){
			$("#del").fadeIn("fast");
			$("#compList").slideDown("fast");
			getCompany(true);
		} else {
			$("#del").fadeOut("fast");
			$("#compList").slideUp("fast");
		}
	}
	function clearInput() {
		$("#compName").val("");
		$("#del").fadeOut("fast");
		$("#compList").slideUp("fast");
		getCompany();
	}
	function getMapData(kind){
		var type = $("#type").val();
		var proId = $("#proId").val();
		var kind = kind;
		var param = {
			id: type == 3 ? proId : '',
			link1: $("#link1").val(),
			link2: $("#link2").val(),
			areaKind: type
		}
		if(kind == 1){ param.id = '360000'; param.areaKind = 3;}
		if(kind == 2){ param.id = ''; param.areaKind = '';}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liCompInfo/getAreaCount",
			type : "post",
			data : param,
			dataType : "json",
			success : function(result) {
				if(result.success){
					var div = '';
					var _div = '';
					var d1 = [];
					var total = 0;
					for(var i=0;i<result.value.length;i++){
						var list = result.value[i];
						for(var key in areaInfoMap){
							if(list.ID == key){
								var c = list.ID == $("#proId").val() ? 'on' : '';
								var temp = { name: areaInfoMap[key], value: list.COUNT, id: list.ID};
								d1.push(temp);
								_div += '<li class="map-company '+c+'" onclick="searchByArea(this,\''+list.ID+'\',\''+areaInfoMap[key]+'\')">';
								_div += 	'<span>'+areaInfoMap[key]+'</span>';
								_div += 	'<span>'+list.COUNT+'家</span>';
								_div += '</li>';
								total += Number(list.COUNT)
							}
						}
					}
					div += '<li class="map-company qg-company">';
					div += 	'<span>全国</span>';
					div += 	'<span>'+total+'家</span>';
					div += '</li>';
					div += _div
					if(kind == 1){
						chart(d1);
					}
					else { 
						if(result.value.length == 0) { _div = '<p>暂无数据</p>';}
						$("#tab2").html(div);
					}
				}else{
					layer.msg(result.errorMsg);
				}
			},
			error : function() {
				layer.msg("系统异常");
			}
		});
	}
	function chart(d1) { //环形饼状图
		var t = 0;
		for(var i=0;i<d1.length;i++){
			t+=Number(d1[i].value);
		}
		var chart2 = echarts.init(document.getElementById("chart"));
		var ratioPieOption = {
			title: {
				text: t,
				textStyle: {
					color: '#fff',
					fontSize: 30,
					fontWeight: 'normal'
				},
				subtext:  '江西省（家）',
				subtextStyle: {
					color: '#fff',
					fontSize: 12
				},
				top: '40%',
				left: 'center'
			},
			tooltip: {
				trigger: 'item'
			},
			color: ['#8491FF','#A9EBC7','#DFD4A6','#79D1B1','#98DA8A','#B2A2FF','#DFC6C1','#7AD6EB','#DF8AB3','#70B6FF'],
		    series: [{
		        type: 'pie',
		        radius : ['40%', '60%'],
		        center: ['50%', '50%'],
		        label: {
		        	show: true,
		        	formatter: function(params){
		            	return params.name+"\n"+params.value+"家("+params.percent+"%)";
		            },
		            color: '#fff'
		        },
		        labelLine: {
		        	length: 10,
		        	length2: 10,
				},
				data: d1
		    }]  
		};
		chart2.setOption(ratioPieOption);
		chart2.on('click', function(param){
			$("#type").val('4');
			searchByArea(1,param.data.id,param.name)
		})
	}
	function searchByArea(e,id,name){
		var type = $("#type").val();
		$("#compName").val('');
		if(type == '') { type = 3; $("#type").val('3');}
		if(e!=1) {
			type = 3; $("#type").val('3');
			$(e).addClass("on").siblings().removeClass("on");
		}
		if(type == 3){
			$("#proId").val(id);
			$("#areaId").val('');
		}
		if(type == 4){
			$("#proId").val('360000');
			$("#areaId").val(id);
		}
		if($("#proId").val() == '360000'){
			$("#chart").show();
			$(".map-companys").removeClass("on");
		} else {
			$("#chart").hide();
			$(".map-companys").addClass("on");
		}
		$("#areaName").val(name);
		getBoundary(map,name);//行政区域
		isFirst = false;
		setTimeout(function(){ getCompany();},1000)
	}
	function searchComp(pro,area,proId,areaId,name){
		$("#compName").val(name);
		if(pro=='江西省') {
			$("#proId").val('360000');
			$("#areaId").val(areaId);
			getBoundary(map,area);//行政区域
		} else { 
			$("#proId").val(proId);
			$("#areaId").val('');
			getBoundary(map,pro);
		}//行政区域
		isFirst = false;
		$("#tab2 li").each(function(e){
			if($(this).find("span:eq(0)").text()==pro){
				$(this).addClass("on").siblings().removeClass("on")
			}
		})
		$("#compList").slideUp("fast");
		setTimeout(function(){ getCompany();},1000)
	}
	function getNow() {
		var date = new Date();
		var y = date.getFullYear();
		var m = date.getMonth() + 1;
		var d = date.getDate();
		var day = date.getDay();
		var x = '';
		switch (day) {
			case 0: x="星期天";
			  break;
			case 1: x="星期一";
			  break;
			case 2: x="星期二";
			  break;
			case 3: x="星期三";
			  break;
			case 4: x="星期四";
			  break;
			case 5: x="星期五";
			  break;
			case 6: x="星期六";
			  break;
		}
		return y+'年 '+m+'月 '+d+'日 '+x;
	}
	

	var map;
	var markers = [];
	var markerClusterer;
	
	map = new BMap.Map("allmap");
	var point = new BMap.Point(116.033448,27.319418);
	map.centerAndZoom(point, 5); 
	map.enableScrollWheelZoom();                            //启用滚轮放大缩小
	map.addControl(new BMap.NavigationControl());               // 添加平移缩放控件
	map.addControl(new BMap.ScaleControl());                    // 添加比例尺控件
	map.addControl(new BMap.OverviewMapControl());              //添加缩略地图控件
	//map.addControl(new BMap.MapTypeControl());          //添加地图类型控件
	map.disable3DBuilding();
	
	
	//底层地图替换主题. 模板页可以查看http://lbsyun.baidu.com/custom/list.htm      
	map.setMapStyle({style:'bluish'});
	
	//地图详情页面tab切换
	function tabOper(e){
		var er = $(e).attr("value");
		$("#allmap .nav>li").removeClass("active");
		$(e).addClass("active");
		$("#allmap .tab-content>div").removeClass("active");
		$("#detailTab-"+er).addClass("active");
	}
	var opts = {
		width : 450,     // 信息窗口宽度
		height: 150,     // 信息窗口高度
		title : false, // 信息窗口标题
		offset: new BMap.Size(0, -20)
	};
	function addClickHandler(marker,data){
		marker.addEventListener("click",function(e){
			openInfo(data,e)
		});
	}
	function addLabelClickHandler(label,data){
		//文本标注点击显示信息窗口
		label.addEventListener("click",function(e){
			openInfo(data,e)
		})
	}
	function openInfo(data,e){
		
		var content = "<div class='companyBox'>";
		content += "<h1><img class='dib' src='${ctx}/static/image/liData/company-icon.png'><font class='dib'>"+ data.compName +"</font></h1>";
		content += "<div class='company-item'><label class='dib'>主要产品</label><font class='dib'>"+ notNull(data.productName) +"</font></div>";
		content += "<div class='company-item company-item2'><label class='dib'>联系电话</label><font class='dib'>"+ notNull(data.contactPhone) +"</font></div>";
		content += "<div class='company-item company-item2'><label class='dib'>联系邮箱</label><font class='dib'>"+ notNull(data.contactEmail) +"</font></div>";
		content += "<div class='company-item'><label class='dib'>网站地址</label><a class='dib' target='_blank' href='"+ data.compUrl +"'>"+ notNull(data.compUrl) +"</a></div>";
		content += "<div class='company-item'><label class='dib'>企业地址</label><font class='dib'>"+ notNull(data.compAddress) +"</font></div>";
		content += "</div>";

		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
		map.openInfoWindow(infoWindow,point); //开启信息窗口
		
	}
	
	//指定省市进行描边处理
	function getBoundary(map,city){
		var city = city;
		var bdary = new BMap.Boundary();
        bdary.get(city, function(rs){//获取行政区域
	        map.clearOverlays();//清除地图覆盖物
	        //思路：利用行政区划点的集合与外围自定义东南西北形成一个环形遮罩层
	        //1.获取选中行政区划边框点的集合rs.boundaries[0]
	        var strs = new Array();
	        var bd = rs.boundaries[0];
	        if(city == '台湾省' || city == '四川省' || city == '贵州省' || city == '天津市') { bd = rs.boundaries[1]}
	        if(city == '河北省' || city == '广东省' || city == '湖南省') { bd = rs.boundaries[2]}
	        if(city == '海南省') { bd = rs.boundaries[3]}
	        if(city == '江苏省') { bd = rs.boundaries[4]}
	        strs = bd.split(";");
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
	        var ply = new BMap.Polygon(bd, {strokeWeight:3,strokeColor:"#114bf3",fillColor:""});
	        map.addOverlay(ply);   
	        map.setViewport(ply.getPath());//调整视野 
        }); 
	}
	function notNull(e){
		if(!e || e == null || e == 'undefined' || e == 'null'){ return '暂无'}
		return e;
	}
</script>
</html>
