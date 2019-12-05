<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>物流平台-首页</title>
<link href="${ctx}/static/css/logistics/logisticsPlatform.css" rel="stylesheet"/>
<link href="${ctx}/static/css/projectHeader2.css" rel="stylesheet"/>
<link href="${ctx}/static/css/projectFooter.css" rel="stylesheet"/>
<!-- buttons -->
<link href="${ctx}/static/css/logistics/buttons.css" rel="stylesheet"/>

</head>

<body>
<div class="logistics_main">
	<div class="project_header">
	    <%@ include file="../common/header.jsp"%>
	</div>
	
	<div class="logistics_content">
		<div class="logistics_contTop">
			<img src="${ctx}/static/image/logistics/banner.jpg" width="100%">
			<div class="contTopText">
				<div style="display: inline-block;">
					<div style="font-size:42px; color:#fff;">降本增效</div>
					<div style="font-size:16px; color:#DCDCDC;">搭乘&nbsp;&nbsp;“&nbsp;互联网&nbsp;+&nbsp;物流&nbsp;”&nbsp;&nbsp;快车&nbsp;！</div>
				</div>
				<%-- <div class="contTopBtnBar clearfix">
					<div class="contTopBtn" onclick="search('1')">
						<div style="font-size:24px; color:#54FF00;">货物运输</div>
						<div>降低成本</div>
						<div><span>我要找车</span><span>我要发货</span></div>
						<img src="${ctx}/static/image/logistics/hand.png" width="25" height="25" class="handLocation">
					</div>
					<div class="contTopBtn" onclick="search('2')">
						<div style="font-size:24px; color:#FFA200;">危化品运输</div>
						<div>专业危化运输</div>
						<div><span>我要找车</span><span>我要发货</span></div>
						<img src="${ctx}/static/image/logistics/hand.png" width="25" height="25" class="handLocation">
					</div>
					<div class="contTopBtn" onclick="search('3')">
						<div style="font-size:24px; color:#00B5FC;">钢材运输</div>
						<div>询价找车</div>
						<div><span>我要找车</span><span>我要发货</span></div>
						<img src="${ctx}/static/image/logistics/hand.png" width="25" height="25" class="handLocation">
					</div>
				</div> --%>
				<div class="contBox clearfix">
					<input type="hidden" id="type" value="1">
					<input type="hidden" id="sendId" value="">
					<input type="hidden" id="receiveId" value="">
					<div class="searchBox">
						<div class="tab-link">
							<span class="on">我要找车</span>
							<span onclick="publish()">我要发货</span>
						</div>
						<div class="search-input">
							<div class="input-item">
								<label>当前位置：</label>
								<input type="text" id="send" placeholder="请选择出发地" onclick="choose(1,this)" readonly>
							</div>
							<div class="input-item">
								<label>期望流向：</label>
								<input type="text" id="receive" placeholder="请选择目的地" onclick="choose(2,this)" readonly>
							</div>
							<div class="input-item">
								<label>车型：</label>
								<input type="text" id="carType" data-val="-1" value="不限" placeholder="请选择车型" readonly>
								<div class="selects" id="types">
									<div class="select-item">不限</div>
									<div class="select-item">后八轮</div>
									<div class="select-item">前四后八</div>
									<div class="select-item">前二后八</div>
								</div>
							</div>
							<div class="input-item">
								<label>载型：</label>
								<input type="text" id="loadType" data-val="-1" value="不限" placeholder="请选择载型" readonly>
								<div class="selects" id="loads">
									<div class="select-item">不限</div>
									<div class="select-item">后八轮</div>
									<div class="select-item">前四后八</div>
									<div class="select-item">前二后八</div>
								</div>
							</div>
						</div>
						<a class="search-btn" href="javascript:;" onclick="search1()">搜索</a>
						<p class="search-des">共有<font>18,485</font>个用户正在使用在线找车</p>
					</div>
					<div class="area-choose">
						<div class="close-btn" onclick="$('.area-choose').fadeOut('fast')"></div>
						<div class="taps">
							<span class="on">省份</span>
							<span>城市</span>
							<span>县区</span>
						</div>
						<div class="area-tabs">
							<div class="tab" id="areaTab1" style="display: block;">
								<span class="on" data-val="">全国</span>
							</div>
							<div class="tab" id="areaTab2">
							</div>
							<div class="tab" id="areaTab3">
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<div class="logistics_cont">
			<div class="logistics_contLeft">
				<!-- 代码开始 -->
				<div class="list_lh">
					<ul>
						<c:forEach items="${str}" var="index">
							<li class="clearfix">
								<div style="width:20%;" class="grayFont">${index}</div>
								<div style="width:25%;"><% 
									String[] telFirst="134,135,136,137,138,139,150,151,152,157,158,159,130,131,132,155,156,133,153,183,186,189".split(","); 
								 	int index = (int)Math.round(Math.random()*21);  
						            String first= telFirst[index];   
								%><%=first%>******<%=Math.round(Math.random()*90+10)%></div>
								<div style="width:30%;">委托了<font class="redFont"><%=Math.round(Math.random()*100)%></font>吨货物</div>
								<div style="width:25%;" class="greenFont">已经成交</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<!-- 代码结束 -->
			</div>
			
			<div class="logistics_contRight">
				<div class="buttonBar">
					<button class="button button-raised buttonContral" onClick="publish()">
						<img src="${ctx}/static/image/logistics/goods.png" width="30" height="30" class="buttonImg">发布货源
					</button>
				</div>
				<div class="hotSourcePlace">
					<div class="info_top">
						<div class="info_title">热门货源地</div>
					</div>
					<div class="cityNameBar">
						<div class="cityName">南昌市</div>
						<div class="cityName">九江市</div>
						<div class="cityName">赣州市</div>
						<div class="cityName">宜春市</div>
						<div class="cityName">丰城市</div>
						<!-- <div class="cityName">南昌市</div>
						<div class="cityName">九江市</div>
						<div class="cityName">赣州市</div>
						<div class="cityName">宜春市</div>
						<div class="cityName">丰城市</div>
						<div class="cityName">南昌市</div>
						<div class="cityName">九江市</div>
						<div class="cityName">赣州市</div>
						<div class="cityName">宜春市</div>
						<div class="cityName">丰城市</div> -->
					</div>
					<img src="${ctx}/static/image/logistics/recommendTip.jpg" width="100%" style="cursor:pointer;">
				</div>
			</div>
		</div>
	</div>
	
	<div id="releaseSource" style="padding:10px; display: none;">
		<div class="bottomLine"></div>
		<div style=" position:relative;">
			<div class="tipTitle">请选择发布货源的种类</div>
			<div style="clear:both;"></div>
		</div>
		<div class="selectType" id="typeList">
			<div class="carSourceType" onclick="selectType('1',this)">
				<img src="${ctx}/static/image/logistics/good.png" height="50">
				<span>货物运输</span>
			</div>
			<div class="carSourceType" onclick="selectType('2',this)">
				<img src="${ctx}/static/image/logistics/risk.png" height="50">
				<span>危化运输</span>
			</div>
		</div>
		<div style="text-align:center;">
			<input type="hidden" id="type" />
			<input type="button" class="button button-raised button_Contral" style="width:25%;" value="返回" onclick="returnBtn()">
			<input type="button" class="button button-raised button-caution button_Contral" style="width:40%;" value="确认" onclick="publish()">
		</div>
	</div>
	
	<div class="project_footer">
		<div class="copyright">
			<div class="copyrightLeft">
				<div>
					<span>关于我们</span>&nbsp;&nbsp;&nbsp;<span>联系我们</span>&nbsp;&nbsp;&nbsp;<span>法律条款</span>
				</div>
				<div class="font12" style="margin-top:30px;">
					<div>Copyright @ 2016 - 2020 CloudCommunity Inc.All Rights Reserved.Powered by 融合科技</div>
					<div>江西省工业和信息化厅（园区办） 赣ICP备16003961号-1 </div>
				</div>
			</div>
			<div class="copyrightRight">
				<div style="float:left;">
					<div class="font12">
						<div class="alignRight">扫描二维码加入</div>
						<div class="alignRight">微信公众号：江西工业园区微讯</div>
					</div>
					<div class="copyrightTel">
						<img alt="" src="${ctx}/static/image/logistics/hotline.jpg">
					</div>
				</div>
				<img src="${ctx}/static/image/logistics/QRcodeImg.jpg" width="100px" height="100px;" class="QRcodeImg">
				<div style="clear:both;"></div>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
</div>
<!-- <script src="js/jquery.js"></script> -->
<script>
 $(function(){
	$('.tabItem').children().eq(0).css({'display':'none'});
	$('.tabItem').children().eq(1).css({'display':'block'});
	getCar();
	$("#send").val("江西省");
	$("#receive").val("");
	$("#carType").val("不限");
	$("#loadType").val("不限");
    $(".tabName ul li").each(function(){//页面头部模块切换控制
		var index=$(this).index();
		$(".tabName ul li").eq(1).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		})
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(4).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		})
    });
	$(".header_WeChat").click(function(){		
    	var div = $(".WeChatQRcode"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
		}else{ 
	  		div.slideUp("fast"); 
		} 
    });
	$(".taps span").on("click",function(){          //地址选择切换
		var $ind = $(this).index() + 1;
		$(this).addClass("on").siblings().removeClass("on");
		$("#areaTab"+$ind).siblings().fadeOut("fast");
		setTimeout(function(){$("#areaTab"+$ind).fadeIn("fast");},200)
	})
 });
var names = [];
var sendId = '';
var sendIds = ['360000',0,0];
var receiveId = '';
var receiveIds = [0,0,0];
var type = 1;
function spanClick(e){
	var $ind = $(e).parent().index();
	$(e).addClass("on").siblings().removeClass("on");
	setTimeout(function(){$("#areaTab"+($ind+2)).fadeIn("fast");},200);
	if($(e).attr('data-val') && $(e).attr('data-val')!='0'){
		$(".taps span:eq("+($ind+1)+")").addClass("on").siblings().removeClass("on");
		$("#areaTab"+($ind+2)).siblings().fadeOut("fast");
		$(".tab:gt("+$ind+")").find("span").removeClass("on");
		if(type==1){
			sendId = $(e).attr("data-val");
			getAddress(sendId,$ind+2);
			sendIds = [];
			$(".tab span.on").each(function(){
				sendIds.push($(this).attr("data-val"))
			})
		} else { 
			receiveId = $(e).attr("data-val");
			getAddress(receiveId,$ind+2);
			receiveIds = [];
			$(".tab span.on").each(function(){
				receiveIds.push($(this).attr("data-val"))
			})
		}
		if($ind == 2) { $(".area-choose").fadeOut("fast");}
	} else {
		$(".area-choose").fadeOut("fast");
		$("#areaTab"+ ($ind + 2)).empty();
		if($("#areaTab"+ ($ind + 3))){ $("#areaTab"+ ($ind + 3)).empty();}
		if(type == 1){
			if($ind == 0){ name[1] = '';name[2] = '';sendId = '';}
			if($ind == 1){ name[2] = '';sendId = $("#areaTab1 span.on").attr('data-val')}
			sendIds = [];
			$(".tab span.on").each(function(){
				sendIds.push($(this).attr("data-val"))
			})
		} else {
			if($ind == 0){ name[1] = '';name[2] = '';receiveId = '';}
			if($ind == 1){ name[2] = '';receiveId = $("#areaTab1 span.on").attr('data-val')}
			receiveIds = [];
			$(".tab span.on").each(function(){
				receiveIds.push($(this).attr("data-val"))
			})
		}
	}
	
	names[$ind] = $(e).text();
	names[$ind+1] = '';
	names[$ind+2] = '';
	if(type==1){
		$("#send").val(names.join(" "));
	} else { $("#receive").val(names.join(" "));}
}
function getAddress(pId,type) {
	var url = '${ctx}/logistics/wanji/json/getAddress';
	var param = { "parent" : pId};
	$.post(url,param,function(data){
		var name = type == 1 ? '全国' : (type == 2 ? '全省' : '全市');
		var _div = '<span data-val="0" onclick="spanClick(this)">'+ name +'</span>';
		$("#areaTab"+type).empty();
		for(var i = 0; i < data.length; i++){
			_div += '<span data-val="'+data[i].CODE+'" onclick="spanClick(this)">'+data[i].NAME+'</span>';
		}
		$("#areaTab"+type).append(_div);

	})
};
function choose(t,e) {
	$(".area-choose").fadeIn("fast");
	if(type != t){
		$(".tab span").removeClass("on");
		$(".taps span:eq(0)").addClass("on").siblings().removeClass("on");
		$(".tab:eq(0)").show("fast").siblings().hide("fast");
		$("#areaTab2").empty();
		$("#areaTab3").empty();
	}
	type = t;
	getAddress(-1,1);
};

function search1(){
	if(sendIds.length == 1){ sendIds[1] = '0';sendIds[2] = '0';}
	if(sendIds.length == 2){ sendIds[2] = '0';}
	if(receiveIds.length == 1){ receiveIds[1] = '0';receiveIds[2] = '0';}
	if(receiveIds.length == 2){ receiveIds[2] = '0';}
	var param = {
		"AdCodes" : sendIds.join(","),
		"TargetAdCodes" : receiveIds.join(","),
		"TypeCode" : $("#carType").attr("data-val"),
		"CarLoadType" : $("#loadType").attr("data-val"),
		"type" : 1
	}
	/* window.location.href="${ctx}/front/logistics/search?type=1&AdCodes="
			+param.AdCode+"&TargetAdCodes="+param.TargetAdCode+"&TypeCode="
			+param.TypeCode+"&CarLoadType="+param.CarLoadType; */
	
	post('${ctx}/front/logistics/search', param)
}

function post(URL, PARAMS) { 
    var temp = document.createElement("form"); 
    temp.action = URL; 
    temp.method = "post"; 
    temp.style.display = "none"; 
    for (var x in PARAMS) { 
      var opt = document.createElement("textarea"); 
      opt.name = x; 
      opt.value = PARAMS[x]; // alert(opt.name) 
      temp.appendChild(opt); 
      } 
    document.body.appendChild(temp); 
    temp.submit(); 
    return temp; 
}

function releaseSource(){
	layer.open({
		type: 1,
		title:false,
		shadeClose: true,
		shade: [0],
		area:['500px','300px'],
		offset:['150px','30%'],
		closeBtn:0,
		content: $('#releaseSource')
	});
}
function getCar(){
	var url = '${ctx}/interface/json/wanji/getPlatCarDict';
	$.post(url,function(data){
		if(data.success){
			var load = data.CarLoadDictsList;
			var type = data.CarTypeDictsList;
			var _div1 = '<div class="select-item" data-val="-1">不限</div>';
			var _div2 = '<div class="select-item" data-val="-1">不限</div>';
			$("#types").empty();
			$("#loads").empty();
			for(var i = 0; i < type.length; i++){
				_div1 += '<div class="select-item" data-val="'+type[i].Code+'">'+type[i].Name+'</div>';
			}
			for(var i = 0; i < load.length; i++){
				_div2 += '<div class="select-item" data-val="'+load[i].Code+'">'+load[i].Name+'</div>';
			}
			$("#types").append(_div1);
			$("#loads").append(_div2);
			
			$(document).on("click",function(e){          //地址选择切换
				$(".selects").slideUp("fast");
			})
			$(".selects").siblings("input").on("click",function(e){          //地址选择切换
				$(this).siblings(".selects").slideToggle("fast");
				$(this).parent().siblings().find(".selects").slideUp("fast");
				e.stopPropagation();
			})
			$(".select-item").on("click",function(){          //地址选择切换
				$(this).parent().siblings("input").val($(this).text()).attr('data-val',$(this).attr('data-val'))
			})
		}
	})
}
</script>
<!-- scroll -->
<script src="${ctx}/static/js/scroll.js"></script>
<script type="text/javascript">
$(function(){
	$("div.list_lh").myScroll({
		speed:35, //数值越大，速度越慢
		rowHeight:42 //li的高度
	});
});

function selectType(type,obj){
	if(type==1){
		if($(obj).hasClass("goodSelected")){
			$(obj).removeClass("goodSelected");
			$("#type").val("");
		}else{
			if($(obj).next().hasClass("riskSelected")){
				$(obj).next().removeClass("riskSelected")
			}
			$(obj).addClass("goodSelected");
			$("#type").val(type);
		}
	}else if(type==2){
		if($(obj).hasClass("riskSelected")){
			$(obj).removeClass("riskSelected");
			$("#type").val("");
		}else{
			if($(obj).prev().hasClass("goodSelected")){
				$(obj).prev().removeClass("goodSelected")
			}
			$(obj).addClass("riskSelected");
			$("#type").val(type);
		}
	}
}

function publish(){
	window.location.href="${ctx}/front/logistics/publish?type=1";
}

function returnBtn(){
	layer.closeAll();
}
</script>
</body>
</html>
