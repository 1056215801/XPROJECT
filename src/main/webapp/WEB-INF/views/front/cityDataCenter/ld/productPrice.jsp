<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/font-awesome.min93e3.css" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/liData/ldHomePage.css"/>
<title>锂电大数据首页</title>
<style>
</style>
</head>
<body class="gray-bg">
	<input type="hidden" value="" id="proId">
	<%@ include file="header.jsp"%>
	<div class="container-fluid content2">
		<div class="main">
			<div class="pro-left">
				<ul class="production price-production" id="production">
					<li class="first-li on">
						<div class="product-type" onclick="searchPro(this,'',0,0)">今日更新</div>
					</li>
				</ul>
			</div>
			<div class="pro-right index3-right">
			 	 <div class="outsideBox">
				  		<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
					<div class="pro-tab" id="proTab0">
						<div class="price-title">
							<font>今日更新</font>
							<div class="download">
								<i class="fa fa-download"></i><font>下载数据</font>
							</div>
						</div>
						<div class="price-table">
							<table>
								<tbody id="priceTable"></tbody>
							</table>
						</div>
					</div>
					<div class="pro-tab" id="proTab1" style="display: none;">
						<h1 id="productTitle">价格行情走势图</h1>
						<!-- <div class="pro-items" id="addressItems">
							<span><i class="fa fa-square fa-check-square"></i>中国</span>
						</div> -->
						<div class="pro-items" id="productItems">
							<span><i class="fa fa-square fa-check-square"></i>电池级碳酸锂</span> <span><i class="fa fa-square"></i>电池级碳酸锂</span>
						</div>
						<div class="price-title price-title2">
							<span class="on">当日价格</span>
							<!-- <span>近一周</span> -->
							<span>历史价格</span>
							<div class="download">
								<i class="fa fa-download"></i><font>下载数据</font>
							</div>
						</div>
						<div class="price-detail" style="height: calc(100% - 240px);">
							<div class="product-tab" id="priceTable2"></div>
						</div>
					</div>
			    </div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/liData.js"></script>
<script type="text/javascript">
	$(function(){
		getLiProduct();
		$(".price-title2 span").on("click", function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings('span').removeClass("on");
			if (ind == 0) {
				searchPro('', '', 1, ind, 1);
			} else {
				loadData(ind)
			}
		})
	}); 
	function getLiProduct(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liProductType/queryProductTypeList",
			type : "post",
			data : {},
			dataType : "json",
			success : function(result){
				if (result.success) {
					var _div = '';
					for (var i = 0; i < result.typeList.length; i++) {
						var info = result.typeList[i];
						_div += '<li class="first-li">';
						_div += '<div class="product-type">' + info.typeName
							+ '<i class="fa fa-angle-right"></i></div>';
						_div += '<ul class="product-item">';
						for (var j = 0; j < info.productList.length; j++) {
							var item = info.productList[j];
							_div += '<li class="second-li" data-val="' + item.id + '" onclick="searchPro(this,\''
								+ item.id + '\',1,0)">' + item.productName + '</li>';
						}
						_div += '</ul>';
						_div += '</li>';
					}
					$("#production").append(_div);
					$(".product-type").on(
						"click",
						function(){
							$(this).parent().addClass("on").siblings().removeClass("on");
							if($(this).parent().index()==0){
								$(this).parent().siblings().find("i").addClass("fa-angle-right").removeClass("fa-angle-down");
								$(this).parent().siblings().find(".product-item").slideUp();
							}else{
								if($(this).find("i").attr("class").indexOf("fa-angle-down")!=-1){
									$(this).find("i").addClass("fa-angle-right").removeClass("fa-angle-down");
								}else{
									$(this).find("i").addClass("fa-angle-down").removeClass("fa-angle-right");
								}
								$(this).parent().find(".product-item").slideToggle();
							}
						})
					$(".second-li").each(
						function(){
							if ($(this).text() == '${typeName}') {
								$(this).parent().siblings(".product-type").find("i").removeClass("fa-angle-down");
								$(this).addClass("on").parent().slideDown().parent().addClass("on").siblings()
									.removeClass("on");
								var name = $(this).text();
								var id = $(this).attr("data-val");
								getLi(name, id);
								searchPro('', id, 1, 0)
							} else if ('${type}' == 0) {
								searchPro('', '', 0, 0)
							}
						})
				}
			},
			error : function(){
			//tips("请求超时，请稍后重试");
			},
		});
	}
	function getLi(name,id){
		$.ajax({
			url : "${OfficeUrl}/XOffice/interface/json/liProductMarket/addressList",
			type : "post",
			data : {
				"productId" : id
			},
			dataType : "json",
			success : function(result){
				if (result.success) {
					/* var _div = '';
					for (var i = 0; i < result.addressList.length; i++) {
						var info = result.addressList[i];
						_div += '<span data-val="'+info.address+'" onclick="checkSelect(this);"><i class="fa fa-square fa-check-square" " data-val="'+info.address+'"></i>'
							+ nvlStr(info.address) + '</span>'
					}
					$("#addressItems").html(_div); */
					var _div1 = '';
					for (var i = 0; i < result.indicatorsList.length; i++) {
						var info = result.indicatorsList[i];
						var name = nvlStr(info.goodsName)+(nvlStr(info.indicatorsParam)==''?'':'('+nvlStr(info.indicatorsParam)+')');
						_div1 += '<span onclick="checkSelect1(this);"><i class="fa fa-square '+(i==0?'fa-check-square':'')+'" data="'+info.indicatorsId+'" data-val="'+name+'" ></i>'
							+ name + '</span>'
					}
					$("#productItems").html(_div1);
				}
			},
			error : function(e){
				console.log(e);
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function searchPro(e, id, type, kind, isChange){
		if (type != 0) {
			$("#proTab0").fadeOut('fast');
			setTimeout(function(){
				$("#proTab1").fadeIn('fast')
			}, 210);
		} else {
			$("#proTab1").fadeOut('fast');
			setTimeout(function(){
				$("#proTab0").fadeIn('fast')
			}, 210);
		}
		if (id != '') {
			$("#proId").val(id)
		}
		var param = {
			"productId" : id,
			"orderByClause" : 'm.BELONG_DATE DESC',
			"dateType" : 0,
			"pageSize" : 1000
		}
		if (isChange == 1) {
			param.productId = $("#proId").val()
		}
		if (e != '') {
			$(".second-li").removeClass("on");
			$(e).addClass("on");
			var name = $(e).text();
			getLi(name, id);
			$("#productTitle").html('【' + name + '】' + '价格行情走势图<font>单位：元/吨</font>');
		}
		$.ajax({
				url : "${OfficeUrl}XOffice/interface/json/liProductMarket/list",
				type : "post",
				data : param,
				dataType : "json",
				success : function(result){
					if (result.success) {
						if (type == 0) {
							$(".second-li").removeClass("on");
							var _div = '<tr><th>名称</th><th>价格范围</th><th>均价</th><th>单位</th><th>涨跌</th><th>日期</th></tr>';
							for (var i = 0; i < result.value.length; i++) {
								var info = result.value[i];
								var name = result.value[i].indicatorsParam ? '(' + result.value[i].indicatorsParam
									+ ')' : '';
								_div += '<tr>';
								_div += '<td>' + info.goodsName + name + '</td>';
								_div += '<td>' + info.minPrice + '-' + info.maxPrice + '</td>';
								_div += '<td>' + info.avgPrice + '</td>';
								_div += '<td>' + info.priceUnit + '</td>';
								_div += '<td>' + info.riseFall + '</td>';
								_div += '<td>' + formatCSTDate(info.belongDate, 'yyyy-MM-dd') + '</td>';
								_div += '</tr>';
							}
							if(result.value.length == 0){ _div += '<tr><td colspan="6">暂无数据！</td></tr>'}
							$("#priceTable").html(_div);
						} else {
							var priceUnit = ""
							$(".price-title2 span:eq(0)").addClass("on").siblings('span').removeClass("on");
							var _div = '<table><tr><th>日期</th><th>产品</th><th>指标</th><th>价格类型</th><th>价格</th><th>涨跌额</th><th>单位</th><th>更新时间</th></tr>';
							for (var i = 0; i < result.value.length; i++) {
								var info = result.value[i];
								_div += '<tr>';
								_div += '<td >' + formatCSTDate(info.belongDate, 'yyyy-MM-dd') + '</td>';
								_div += '<td rowspan="2">' + info.goodsName + '</td>';
								_div += '<td rowspan="2">' + notNull(info.indicatorsParam) + '</td>';
								_div += '<td>市场价</td>';
								_div += '<td style="background:#cb4f04;">' + info.avgPrice + '</td>';
								_div += '<td>' + info.riseFall + '</td>';
								_div += '<td>' + info.priceUnit + '</td>';
								_div += '<td >' + formatCSTDate(info.updateTime, 'yyyy-MM-dd hh:mm:ss') + '</td>';
								_div += '</tr>';
								_div += '<tr>';
								_div += '<td >' + formatCSTDate(info.belongDate, 'yyyy-MM-dd') + '</td>';
								_div += '<td>成交价最低/最高</td>';
								_div += '<td>' + info.minPrice + '-' + info.maxPrice + '</td>';
								_div += '<td> </td>';
								_div += '<td>' + info.priceUnit + '</td>';
								_div += '<td >' + formatCSTDate(info.updateTime, 'yyyy-MM-dd hh:mm:ss') + '</td>';
								_div += '</tr>';
							}
							if(result.value.length == 0){ _div += '<tr><td colspan="8">暂无数据！</td></tr>'}
							_div += '</table>';
							$("#priceTable2").html(_div);
						}
					}
				},
				error : function(){
				//tips("请求超时，请稍后重试");
				},
			});
	}
	function loadData(type){
		var idsArr = '';
		$("#productItems span").each(function(e){
			if($(this).find("i").hasClass("fa-check-square")) {
				idsArr = $(this).find("i").attr("data")
			}
		})
		var id = $("#proId").val();
		$.ajax({
			url : '${OfficeUrl}XOffice/interface/json/liProductMarket/foregroundList',
			type : 'post',
			data : {
				'productId' : id,
				'dateType' : 2,
				indicatorsId: idsArr
			},
			success : function(result){
				if (result.valueList.length == 1 && result.valueList[0].length == 0) {
					return
				}
				chart6(result);
				//$("#productItems .fa-check-square").click();
			},
			error : function(){
				layer.msg("数据访问超时，请稍后重试！");
			}
		})
	}
	// 格式化CST日期的字串
	function formatCSTDate(strDate, format){
		return formatDate(new Date(strDate), format);
	}
	// 格式化日期,
	function formatDate(date, format){
		var paddNum = function(num){
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
		return format.replace(/([a-z])(\1)*/ig, function(m){
			return cfg[m];
		});
	}
	function notNull(e){
		if (!e || e == null || e == 'undefined' || e == 'null') {
			return '/'
		}
		return e;
	}
	function nvlStr(str, value){
		if (str == null || str == undefined || str == "undefined") {
			return value != null && value != undefined ? value : "";
		}
		return str;
	}
	//选择取消样式
	function checkSelect(obj){
		var i = $(obj).find("i").get(0);
		var address = $(obj).attr("data-val");
		//获取实例
		var chart = echarts.getInstanceByDom(document.getElementById('priceTable2'));
		if(chart!=undefined){
			var option = chart.getOption().legend;
			var legends = option[0].data;
			var operStr = "";
			if($(i).hasClass("fa-check-square")){
				$(i).removeClass("fa-check-square");
				operStr = 'legendUnSelect';
			}else{
				$(i).addClass("fa-check-square");
				operStr = 'legendToggleSelect';
			}
			for(var x=0;x<legends.length;x++){
				var legendName = legends[x];
				if(nameCheck(legendName,address,operStr)){
					chart.dispatchAction({
					    type: operStr,
					    name: legendName
					})
				}
			}
		}
	}
	function checkSelect1(obj){
		var i = $(obj).find("i").get(0);
		var address = $(i).attr("data-val");
		//获取实例
		var chart = echarts.getInstanceByDom(document.getElementById('priceTable2'));
		if(chart!=undefined){
			/* var option = chart.getOption().legend;
			var legends = option[0].data;
			var operStr = ""; */
			$("#productItems i").removeClass("fa-check-square");
			$(i).addClass("fa-check-square");
			loadData()
			//取消所有图例
			/* for(var x=0;x<legends.length;x++){
				var legendName = legends[x];
				chart.dispatchAction({
				    type: 'legendUnSelect',
				    name: legendName
				})
			}
			//勾选指定图例
			var indicatorName = $("#productItems .fa-check-square").attr("data-val");
			$("#addressItems .fa-check-square").each(function(){
				var address = $(this).attr("data-val");
				for(var x=0;x<legends.length;x++){
					var legendName = legends[x];
					operStr= 'legendToggleSelect';
					if(nameCheck(legendName,address,operStr)){
						chart.dispatchAction({
						    type: operStr,
						    name: legendName
						})
					}
				}
			}); */
		}
	}
	
	
	//s1字符串是否以s2字符串为结尾
	function nameCheck(s1,s2,type){
		if(type=="legendUnSelect"){
			var indicatorName = $("#productItems .fa-check-square").attr("data-val");
			if(s1!=undefined && s2!=undefined && s1.indexOf(s2)>0 && s1.substring(s1.indexOf(s2))==s2){
				return true;
			}
			return false;
		}else{
			var indicatorName = $("#productItems .fa-check-square").attr("data-val");
			if(s1!=undefined && s2!=undefined && s1==indicatorName+s2){
				return true;
			}
			console.log("不一样");
			return false;
		}
	}
	
</script>
</html>
