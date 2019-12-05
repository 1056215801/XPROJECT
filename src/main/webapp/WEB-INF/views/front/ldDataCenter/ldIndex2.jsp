<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/liData/homePage.css"/>
<title>锂电大数据锂资源储量分布</title>
<style>

</style>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
<%-- 	<div class="nav">
		<div class="nav-text"><img src="${ctx}/static/image/liData/line.png"><font>锂资源储量分布</font><img class="rotate" src="${ctx}/static/image/liData/line.png"></div>
		<div class="return" onclick="location.href='${ctx}/front/ldDataCenter/index/1'"><img src="${ctx}/static/image/liData/back.png"><font>返回首页</font></div>
	</div> --%>
	<div class="container-fluid content2">
		<input type="hidden" id="type" value="1">
		<div class="world-map" id="map3"></div>
		<div class="map-unit">单位：万吨</div>
		<div class="pie-data">
			<p>上月产量</p>
			<p>78562</p>
			<p>万吨</p>
		</div>
		<div class="main">
			<div class="pro-left">
				<ul class="production">
					<li class="first-li on">
						<div class="product-type">世界分国别储量</div>
					</li>
					<li class="first-li">
						<div class="product-type">中国分省市储量</div>
					</li>
					<li class="first-li">
						<div class="product-type">四大矿区分布</div>
					</li>
					<!-- <li class="first-li">
						<div class="product-type">世界可采年限</div>
					</li> -->
				</ul>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/map/world.js"></script>
<script type="text/javascript" src="${ctx}/static/map/china.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/liData.js"></script>
<script type="text/javascript">
	$(function () {	
		$(".product-type").on("click",function(){
			$(this).parent().addClass("on").siblings().removeClass("on");
			var type = $(this).parent().index();
			getLiTotal(type);
		})
		getLiTotal(0);
	});
	function getLiTotal(type) {
		var url = '${OfficeUrl}XOffice/interface/json/liStorageVolume/list';
		$.ajax({
			url : url,
			type:"post",
			data:{
				type: type,
				yearCaliber: '2017'
			},
			dataType : "json",
			success : function(result) {
				console.log(result)
				var world = [];
				var china = [];
				var yc = [];
				var width = window.innerWidth
				|| document.documentElement.clientWidth
				|| document.body.clientWidth;
				for(var i = 0; i < result.value.length; i++){
					var temp = {
							name : result.value[i].zoneName,
							value : result.value[i].liWeight,
							desc: result.value[i].remark
					}
					if(result.value[i].type == 0 && result.value[i].zoneName != '合计(大约)') {
						world.push(temp)
					}
					if(result.value[i].type == 1 && result.value[i].zoneName != '合计(大约)') {
						temp.tooltip = {
							formatter: function (params, ticket, callback) {
								if(params.value){
									console.log()
									var desc = params.data.desc ? params.data.desc : '暂无';
									var _div = "";
									if(width < 1900){
										 _div = '<div style="position:relative;padding: 10px;background:rgba(0,81,136,.8);border:2px solid #00f5ff;border-radius:3px;">';
										 _div += '<p style="text-align:center;font-size:16px;color:#00f5ff;">'+params.name+'</p>';
										 _div += '<p style="width:600px;text-indent:24px;font-size:12px;color:#fff;white-space: normal;">'+desc+'</p>';
										 _div += '<img src="${ctx}/static/image/liData/jt.png" style="position:absolute;top:-15px;left:50%;margin-left:-11px;">';
										 _div += '</div>';
									}else{
										 _div = '<div style="position:relative;padding: 15px;background:rgba(0,81,136,.8);border:2px solid #00f5ff;border-radius:3px;">';
										 _div += '<p style="text-align:center;font-size:16px;color:#00f5ff;">'+params.name+'</p>';
										 _div += '<p style="width:300px;text-indent:24px;font-size:12px;color:#fff;white-space: normal;">'+desc+'</p>';
										 _div += '<img src="${ctx}/static/image/liData/jt.png" style="position:absolute;top:-15px;left:50%;margin-left:-11px;">';
										 _div += '</div>';
									}
								    return _div;
								}
							}
						}
						china.push(temp)
					}
					if(result.value[i].type == 2 && result.value[i].zoneName != '合计(大约)') {
						yc.push(temp)
					}
				}
				if(type == 0){
				    $(".map-unit").show();
				    $(".pie-data").hide();
					chart3(world,'world');
				} else if(type == 1) {
				    $(".map-unit").show();
				    $(".pie-data").hide();
					chart3(china,'china');
				} else {
				    $(".map-unit").hide();
				    $(".pie-data").show();
					chart4(yc);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			}
		});
	}
</script>
</html>
