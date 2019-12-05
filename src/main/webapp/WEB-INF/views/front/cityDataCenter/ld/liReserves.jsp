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
<title>锂电大数据锂资源储量分布</title>
<style>

</style>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="content">
		<div class="column w60">
			<div class="column-box">
				<div class="tab-title">
					<span class="on">世界分国别储量（万吨）</span>
				</div>
				<div class="world-map" id="map3"></div>
			</div>
		</div>
		<div class="column w40">
			<div class="column-box">
				<div class="row-box h60">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
					<div class="tab-title">
						<span class="on">中国分省市储量（万吨）</span>
					</div>
					<div class="world-map" id="map2"></div>
				</div>
				<div class="row-box h40">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
					<div class="tab-title">
						<span class="on">4大矿区储量分布（万吨）</span>
					</div>
					<div class="world-map">
						<div class="echart-map" id="map1"></div>
						<div class="area-list" id="parkList"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-gl.min.js"></script>
<script type="text/javascript" src="${ctx}/static/map/world.js"></script>
<script type="text/javascript" src="${ctx}/static/map/china.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/ldData.js"></script>
<script type="text/javascript">
	$(function () {	
		getLiTotal(0);
		getLiTotal(1);
		getLiTotal(2);
	});
	function getLiTotal(type) {
		var zg = [
		    {name:'青海省',   value: [101.778984,36.627853, 0]},
		    {name:'江西宜春',   value: [114.42241,27.828779, 0]},
		    {name:'西藏',   value: [91.123194,29.651639, 0]},
		    {name:'四川阿坝、甘孜',   value: [102.227392,31.910171, 0]}
		];
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
				var datas = [];
				var div = '';
				for(var i = 0; i < result.value.length; i++){
					var temp = {
							name : result.value[i].zoneName,
							value : result.value[i].liWeight,
							desc: result.value[i].remark
					}
					if(result.value[i].zoneName != '合计(大约)') {
						datas.push(temp);
						if(type == 1) {
							for(var j=0;j<zg.length;j++){
								if(result.value[i].zoneName == zg[j].name){
									zg[j].value[2] = result.value[i].liWeight;
									zg[j].remark = result.value[i].remark;
								}
							}
						}
						else if(type == 2){
			 				var w = i==0?'w70':i==1?'w60':i==2?'w25':'w15';
			 				div += '<div class="count-item">';
			 				div += '<p><span></span><font>'+result.value[i].zoneName+'</font></p>';
			 				div += '<div><span class="'+w+'">';
			 				div += '</span><font>'+result.value[i].liWeight+'</font></div></div>';
						}
					}
				}
				if(type == 0){
					chart3(datas);
				} else if(type == 1) {
					chart2('储量',zg);
				} else {
					chart4(datas);
					$("#parkList").html(div)
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			}
		});
	}
</script>
</html>
