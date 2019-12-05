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
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/font-awesome.min93e3.css"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/liData/homePage.css"/>
<title>锂电大数据产业链</title>
<style>

</style>
</head>
<body class="gray-bg">
	<input type="hidden" value="" id="proId">
	<%@ include file="header.jsp"%>
	<div class="container-fluid content2">
		<div class="main">
			<div class="pro-left">
				<ul class="production" id="production">
					<li class="first-li on">
						<div class="product-type">发展情况<i class="fa fa-angle-up fa-angle-down"></i></div>
						<ul class="product-item" style="display: block;">
							<li class="second-li on">原材料开采加工企业</li>
							<li class="second-li">正极材料生产企业</li>
							<li class="second-li">负极材料生产加工企业</li>
							<li class="second-li">隔膜材料生产企业</li>
							<li class="second-li">电解液生产加工企业</li>
							<li class="second-li">电芯生产加工企业</li>
							<li class="second-li">下游新能源汽车制造企业</li>
						</ul>
					</li>
					<!-- <li class="first-li">
						<div class="product-type">市场地位<i class="fa fa-angle-up fa-angle-down"></i></div>
						<ul class="product-item">
							<li class="second-li">矿产原材料</li>
							<li class="second-li">正极材料</li>
							<li class="second-li">负极材料</li>
							<li class="second-li">隔膜材料</li>
							<li class="second-li">电解液</li>
							<li class="second-li">电芯制造</li>
							<li class="second-li">新能源汽车</li>
						</ul>
					</li> -->
					<li class="first-li">
						<div class="product-type">国内外优秀企业<i class="fa fa-angle-up fa-angle-down"></i></div>
						<ul class="product-item">
							<li class="second-li">碳酸锂</li>
							<li class="second-li">正极材料</li>
							<li class="second-li">负极材料</li>
							<li class="second-li">隔膜、铝塑膜</li>
							<li class="second-li">电解质、电解液</li>
							<li class="second-li">锂电池及设备制造</li>
							<li class="second-li">锂电池应用</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="chain">
			<div class="tab" id="tab0">
				<h2 class="chain-title"><font id="chainTitle">原材料开采加工企业</font><i class="fa fa-caret-down"></i></h2>
				<div class="chain-circle">
					<div class="circle-box">
						<h1><font id="price">15</font><small>亿元</small></h1>
						<p>2016年产值</p>
					</div>
				</div>
				<div class="chain-arrow"><img src="${ctx}/static/image/liData/chain_06.png"></div>
				<div class="chain-item" id="chainList">
				<span>
					<div class="circle-box2">
						<h1>四一四矿</h1>
						<p>锂电矿产原料锂云母</p>
					</div>
				</span>
				<span>
					<div class="circle-box2">
						<h1>银锂新能源</h1>
						<p>碳酸锂制备</p>
					</div>
				</span>
				<span>
					<div class="circle-box2">
						<h1>旭锂矿业</h1>
						<p>碳酸锂制备</p>
					</div>
				</span>
				<span>
					<div class="circle-box2">
						<h1>南氏锂电</h1>
						<p>碳酸锂制备</p>
					</div>
				</span>
				</div>
			</div>
			<div class="tab" id="tab1">
			</div>
			<div class="tab" id="tab2">
				<h2 class="chain-title"><font>碳酸锂</font><i class="fa fa-caret-down"></i></h2>
				<div class="chain-item">
					<span>
						<div class="circle-box2">
							<h1>SQM</h1>
							<p>智利Atacama 盐湖</p>
							<p>沉淀法提锂</p>
						</div>
						<div class="chain-tip">
							<h3>优劣势分析</h3>
							<p>占全球产能的25%，生产成本较低。副产品主要为钾肥。年产4万吨碳酸锂，生产成本1.2万元/吨。</p>
						</div>
					</span>
					<span>
						<div class="circle-box2">
							<h1>FMC</h1>
							<p>翁布雷穆埃尔托盐湖</p>
							<p>沉淀法提锂</p>
						</div>
						<div class="chain-tip">
							<h3>优劣势分析</h3>
							<p>占全球产能20%，生产成本较低，副产品单一。生产成本1.6万元/吨。</p>
						</div>
					</span>
					<span>
						<div class="circle-box2">
							<h1>Chemetall</h1>
							<p>美国Silver Peak 盐湖</p>
							<p>沉淀法提锂</p>
						</div>
						<div class="chain-tip">
							<h3>优劣势分析</h3>
							<p>占全球产能的15%，生产成本较低。生产成本1.7万元/吨。</p>
						</div>
					</span>
					<span>
						<div class="circle-box2">
							<h1>西藏矿业</h1>
							<p>西藏扎布耶盐湖</p>
							<p>碳化法</p>
						</div>
						<div class="chain-tip">
							<h3>优劣势分析</h3>
							<p>生产成本低。地理、交通条件恶劣，影响大规模生产。生产成本2.2万元/吨。</p>
						</div>
					</span>
					<span>
						<div class="circle-box2">
							<h1>青海锂业</h1>
							<p>青海东台吉乃尔盐湖</p>
							<p>电渗析法处理盐湖卤水生产碳酸锂</p>
						</div>
						<div class="chain-tip">
							<h3>优劣势分析</h3>
							<p>镁锂分离困难，生产线实际产能一直未能达到设计产能，年产不足1000吨。</p>
						</div>
					</span>
					<span>
						<div class="circle-box2">
							<h1>天齐锂业</h1>
							<p>四川阿坝、甘孜州地区锂辉石矿</p>
							<p>硫酸法</p>
						</div>
						<div class="chain-tip">
							<h3>优劣势分析</h3>
							<p>生产成本高、副产品单一。生产成本3.5万元/吨。</p>
						</div>
					</span>
					<span>
						<div class="circle-box2">
							<h1>赣锋锂业</h1>
							<p>澳大利亚锂辉石矿、南美卤水矿再加工</p>
							<p>沉硫酸法</p>
						</div>
						<div class="chain-tip">
							<h3>优劣势分析</h3>
							<p>生产成本较高、受资源供给影响较大。生产成本3.1万元/吨。</p>
						</div>
					</span>
					<span>
						<div class="circle-box2">
							<h1>银河锂业</h1>
							<p>澳大利亚银河矿业锂辉石矿</p>
							<p>硫酸法</p>
						</div>
						<div class="chain-tip">
							<h3>优劣势分析</h3>
							<p>生产成本较高、副产品价值小。生产成本2.9万元左右。</p>
						</div>
					</span>
					<span>
						<div class="circle-box2">
							<h1>宜 春 银 锂</h1>
							<p>宜春市锂云母矿</p>
							<p>变温碳化法新工艺</p>
						</div>
						<div class="chain-tip">
							<h3>优劣势分析</h3>
							<p>生产成本较低、工业流程短易于控制、副产品综合价值大、环境友好，生产成本2.3万元/吨。</p>
						</div>
					</span>
					<span>
						<div class="circle-box2">
							<h1>宜春合纵</h1>
							<p>宜春市锂云母矿</p>
							<p>矿相重构高效提取制备碳酸锂工艺</p>
						</div>
						<div class="chain-tip">
							<h3>优劣势分析</h3>
							<p>生产成本较低，环境友好，生产成本控制在2.8万元/吨。</p>
						</div>
					</span>
					<div class="chain-text">
						目前我市已正常投产的碳酸锂生产企业有合纵锂业、银锂、迈特新能源等3家，待改造企业1家，另有2家在建。与国内外其他碳酸锂企业相比，我市的企业综合生产成本较低，其中银锂和合纵均能在不增加成本的前提下，提取出锂盐的同时，获得铷、铯、钾盐等附加值很高的产品，生产技术已经达到国际领先水平。去年的产量达到2000吨，今年产能将达到5000吨以上，明年将达到2万吨。
					</div>
				</div>
			</div>
			<div class="tab" id="tab3">
				<h2 class="chain-title"><font id="chainTitle2">碳酸锂</font><i class="fa fa-caret-down"></i></h2>
				<div class="chain-item">
					<div class="price-table chain-table">
						<table>
							<tbody id="priceTable">
								
							</tbody>
						</table>
					</div>
					<div class="chain-text" id="chainText">
						目前我市已正常投产的碳酸锂生产企业有合纵锂业、银锂、迈特新能源等3家，待改造企业1家，另有2家在建。与国内外其他碳酸锂企业相比，我市的企业综合生产成本较低，其中银锂和合纵均能在不增加成本的前提下，提取出锂盐的同时，获得铷、铯、钾盐等附加值很高的产品，生产技术已经达到国际领先水平。去年的产量达到2000吨，今年产能将达到5000吨以上，明年将达到2万吨。
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
	$(function () {	
		$(".product-type").on("click",function(){
			var ind = $(this).parent().index();
			$(this).find("i").removeClass("fa-angle-down");
			$(this).parent().addClass("on").siblings().removeClass("on").find("i").addClass("fa-angle-down");
			$(this).parent().siblings().find(".product-item").slideUp();
			$(this).siblings(".product-item").slideDown();
		})
		$(".second-li").on("click",function(){
			var ind = $(".first-li.on").index();
			var ind2 = $(this).index();
			var name = $(this).text();
			$(".second-li").removeClass("on");
			$(this).addClass("on");
			if(ind == 0){
				getLi(name);
				$("#tab0").siblings().fadeOut("fast");
				setTimeout(function(){
					$("#tab0").fadeIn("fast");
				},210);
			} /* else if(ind == 1){
				$("#tab1").siblings().fadeOut("fast");
				setTimeout(function(){
					$("#tab1").fadeIn("fast");
				},210);
				
			} */ else if(ind == 1){
				if(ind2 == 0){
					$("#tab2").siblings().fadeOut("fast");
					setTimeout(function(){
						$("#tab2").fadeIn("fast");
					},210);
				} else {
					getTable(name);
					$("#tab3").siblings().fadeOut("fast");
					setTimeout(function(){
						$("#tab3").fadeIn("fast");
					},210);
				}
			}
		})
	}); 
	function getLi(name){
		for(var i = 0; i < list1.length; i++){
			if(name == list1[i].name){
				var info = list1[i];
				$("#chainTitle").text(info.name);
				$("#price").text(info.price);
				var _div = '';
				for(var j=0;j<info.list.length;j++){
					_div += '<span><div class="circle-box2"><h1>'+info.list[j].companyName+'</h1><p>'+info.list[j].product+'</p></div></span>'
				}
				$("#chainList").html(_div);
			}
		}
	}
	function getTable(name){
		for(var i = 0; i < list2.length; i++){
			if(name == list2[i].name){
				var info = list2[i];
				$("#chainTitle2").text(info.name);
				$("#chainText").text(info.desc);
				var _div = '';
				for(var j=0;j<info.list.length;j++){
					var info2 = info.list[j];
					_div += '<tr>';
					if(j == 0) {
						_div += '<th>'+ info2.companyName +'</th>';
						_div += '<th>'+ info2.company1 +'</th>';
						if(info2.company2) { _div += '<th>'+ info2.company2 +'</th>';}
						if(info2.company3) { _div += '<th>'+ info2.company3 +'</th>';}
						if(info2.company4) { _div += '<th>'+ info2.company4 +'</th>';}
						if(info2.company5) { _div += '<th>'+ info2.company5 +'</th>';}
					} else {
						_div += '<td>'+ info2.companyName +'</td>';
						_div += '<td>'+ info2.company1 +'</td>';
						if(info2.company2) { _div += '<td>'+ info2.company2 +'</td>';}
						if(info2.company3) { _div += '<td>'+ info2.company3 +'</td>';}
						if(info2.company4) { _div += '<td>'+ info2.company4 +'</td>';}
						if(info2.company5) { _div += '<td>'+ info2.company5 +'</td>';}
					}
					_div += '</tr>';
				}
				$("#priceTable").html(_div);
			}
		}
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
	function notNull(e){
		if(!e || e == null || e == 'undefined' || e == 'null'){ return '/'}
		return e;
	}
	var list1 = [
		{
			"name": "原材料开采加工企业",
			"price": "15",
			"list": [
				{ "companyName": "四一四矿", "product": "锂电矿产原料锂云母"},
				{ "companyName": "银锂新能源", "product": "碳酸锂制备"},
				{ "companyName": "旭锂矿业", "product": "碳酸锂制备"},
				{ "companyName": "南氏锂电", "product": "碳酸锂制备"}
			]
		},
		{
			"name": "正极材料生产企业",
			"price": "28",
			"list": [
				{ "companyName": "博能新材料", "product": "正极材料（钴酸锂、锰酸锂、镍锰钴三元等）"},
				{ "companyName": "升华新材料", "product": "正极材料（磷酸铁锂）"},
				{ "companyName": "江特锂电", "product": "正极材料"},
				{ "companyName": "艾德纳米", "product": "正极材料"}
			]
		},
		{
			"name": "负极材料生产加工企业",
			"price": "22",
			"list": [
				{ "companyName": "申田碳素", "product": "负极材料原材料初加工处理"},
				{ "companyName": "新卡奔", "product": "负极材料原材料初加工处理，石墨坩埚"},
				{ "companyName": "江西紫宸", "product": "容量型锂电池负极材料、综合性锂电池负极材料、倍率型锂电池负极材料"},
				{ "companyName": "正拓新能源", "product": "负极材料（动力电池为主约占90%，储能材料10%）"},
				{ "companyName": "鑫豪泰", "product": "负极材料"}
			]
		},
		{
			"name": "隔膜材料生产企业",
			"price": "0.9",
			"list": [
				{ "companyName": "星分子", "product": "电池隔膜材料"},
				{ "companyName": "明冠新材料", "product": "待投产"},
				{ "companyName": "清陶能源", "product": "待投产，陶瓷隔膜材料"}
			]
		},
		{
			"name": "电解液生产加工企业",
			"price": "0",
			"list": [
			]
		},
		{
			"name": "电芯生产加工企业",
			"price": "30",
			"list": [
				{ "companyName": "赛特新能源", "product": "容量型主供笔记本电脑、移动电影、储能路灯、动力型主供乘用车"},
				{ "companyName": "伟睿新能源", "product": "电池生产"},
				{ "companyName": "福斯特", "product": "电池生产"},
				{ "companyName": "九鼎动力", "product": "电池产品"}
			]
		},
		{
			"name": "下游新能源汽车制造企业",
			"price": "1",
			"list": [
				{ "companyName": "中宜客车", "product": "新能源整车制造（客车为主、物流特种车辆为辅）"},
				{ "companyName": "江特电动车", "product": ""},
			]
		}
	];
	var list2 = [
		{
			"name": "正极材料",
			"desc": "目前我市正极材料已投产生产线13条，产量预计为1600吨，产值2亿元左右。在建生产线约100条，达产后产值可达100亿元。",
			"list": [
				{ 
					"companyName": "正极材料厂家", 
					"company1": "钴酸锂",
					"company2": "锰酸锂",
					"company3": "三元系",
					"company4": "磷酸铁锂",
					"company5": "富锂锰基"
				},
				{ 
					"companyName": "国外企业", 
					"company1": "日亚化学、AGC、清美化学、韩国优美科",
					"company2": "日本三洋、日本电器、韩国LG化学",
					"company3": "日亚化学、清美化学、韩国优美科、日本户田",
					"company4": "美国威能科技、魁北克水电集团",
					"company5": " "
				},
				{ 
					"companyName": "国内企业", 
					"company1": "杉杉股份、当升科技、中信国安盟固利",
					"company2": "杉杉股份、中信国安盟固利、湖南瑞翔",
					"company3": "杉杉股份、当升科技、深圳天骄",
					"company4": "天津贝特瑞、天津斯特兰、浙江美思",
					"company5": "深圳贝特瑞"
				},
				{ 
					"companyName": "宜春企业", 
					"company1": "博能新材料",
					"company2": "升华新材料",
					"company3": "江特锂电",
					"company4": "艾德纳米、锐邦科技",
					"company5": "江特锂电"
				}
			]
		},
		{
			"name": "负极材料",
			"desc": "宜春负极材料已投产的生产企业有正拓、紫宸科技、新卡奔、申田碳素、鑫豪泰、宁新碳素6家，其中紫宸和正拓产量分别位居全国的第二和第五，产品居于国际领先水平，且正在推出更先进的硅碳负极材料。预计今年负极材料产量为6万吨左右，占全国产量的40%，可实现销售收入40亿元左右，三年内有望突破100亿元。",
			"list": [
				{ 
					"companyName": "国家", 
					"company1": "企业名称"
				},
				{ 
					"companyName": "国外企业", 
					"company1": "日本碳素、昭和电工、日本制铁、日本三洋"
				},
				{ 
					"companyName": "国内企业", 
					"company1": "上海杉杉、深圳贝特瑞、湖南海荣"
				},
				{ 
					"companyName": "宜春企业", 
					"company1": "正拓新能源、紫宸科技、申田碳素、鑫豪泰等"
				}
			]
		},
		{
			"name": "隔膜、铝塑膜",
			"desc": "目前，我市已投产的江西星分子材料科技有限公司，其隔膜干法双向拉伸技术处于国际领先水平，明冠新材料生产的铝塑膜填补了国内空白。",
			"list": [
				{ 
					"companyName": "国家", 
					"company1": "企业名称"
				},
				{ 
					"companyName": "日本", 
					"company1": "旭化成、东燃化学、宇部兴产、住友化学、三菱化学、日东电工等。"
				},
				{ 
					"companyName": "美国", 
					"company1": "Celgard（美国Polypore 集团旗下企业）、恩泰克（Entek）等。"
				},
				{ 
					"companyName": "韩国", 
					"company1": "SK 创新（SK Innovation，由原SK Energy 改组而来，韩国SK 集团旗下企业）；W-Scope、WIDE 等公司也有少量生产和销售。"
				},
				{ 
					"companyName": "中国", 
					"company1": "新乡格瑞思、佛山塑料、深圳星源材质、中科来方、南通天丰、九九久、紫江、中信国安"
				},
				{ 
					"companyName": "宜春", 
					"company1": "江西星分子材料、明冠新材料"
				}
			]
		},
		{
			"name": "电解质、电解液",
			"desc": "宜春目前只有金晖公司一家电解液生产企业，2014年6月份试产，今年产值约5000万元，三年内有望达到3亿元，生产技术水平为中档次。",
			"list": [
				{ 
					"companyName": "国家", 
					"company1": "企业名称"
				},
				{ 
					"companyName": "日本", 
					"company1": "三菱化学、日本宇部兴产、富山药品工业"
				},
				{ 
					"companyName": "韩国", 
					"company1": "三星、三和"
				},
				{ 
					"companyName": "德国", 
					"company1": "南方化学、MERCH公司"
				},
				{ 
					"companyName": "中国", 
					"company1": "国泰华荣、天津金牛、河南多氟多、广州天赐、珠海赛维、东莞杉杉、新宙邦"
				},
				{ 
					"companyName": "宜春", 
					"company1": "宜春金晖"
				}
			]
		},
		{
			"name": "锂电池及设备制造",
			"desc": "宜春已投产锂电池生产企业有5家，分别是福斯特、赛特、金路、鸿兴、超维，另有6家企业正在建设中。其中，福斯特18650电池实现日产120万只，列全国第一，全球第三，动力电池生产规模为年产6万组，产销量居全国第8位，生产技术居国内中上游。今年锂电池生产企业预计产值超35亿元，其中福斯特有望达到22亿元，三年内我市锂电池生产企业的产值有望达到200亿元。宜春已经投产的锂电池生产设备企业只有赢合科技一家，是国内技术水平最好的设备制造企业之一。",
			"list": [
				{ 
					"companyName": "电池生产厂家", 
					"company1": "企业名称"
				},
				{ 
					"companyName": "国外企业", 
					"company1": "韩国三星、LG、日本松下、索尼、三洋、三菱、索尼"
				},
				{ 
					"companyName": "国内企业", 
					"company1": "比亚迪、沃特玛、国能、深圳比克、天津力神、德赛电池、中聚电池"
				},
				{ 
					"companyName": "宜春企业", 
					"company1": "福斯特、赛特、金路、鸿兴、超维、倍特力（在建）、睿达（在建）、金域电子（在建）、金沃特（在建）、丰日（在建）、荣亚（在建）、赢合科技"
				}
			]
		},
		{
			"name": "锂电池应用",
			"desc": "目前宜春已投产的锂电新能源车企业有3家，在建企业1家。3家已投产企业中特种汽车厂为新能源专用车生产企业，江特电动车有限公司为低速电动车生产企业，宜春客车厂为大、中巴车生产企业。宜春现已取得新能源专用车生产资质和新能源客车生产资质，已建成四大工艺齐全的乘用车生产车间，正在积极申报乘用车生产资质。此外，我市还有3家其它锂电应用企业，主要以手机生产为主。",
			"list": [
			]
		}
	]
</script>
</html>
