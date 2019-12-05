<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>找车源</title>
<link href="${ctx}/static/weixin/css/logistics/logisticsPlatform.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/logistics/sourceDetails.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/layer.css" rel="stylesheet" />
<!--<link rel="stylesheet" href="css/LArea.css">-->
<script src="${ctx}/static/weixin/js/layer.js" type="text/javascript"></script>
<style>
body .layui-layer-tl_green .layui-layer-title{background-color:#00A85A; color:#fff; border: none;}
body .layui-layer-bg_gray .layui-layer-content{background-color:#ebebeb;}
body .layui-layer-bg_gray .layui-layer-btn0{background-color:#00A85A; color:#FFF; text-align:center; padding:5px 0; width:100%; margin:0;}
</style>
<script>
 $(function(){
 	$(".address").click(function(){ 
		var div = $("#dropdown"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
			$(".mtop").removeClass("mtop56");
			$(".mtop").addClass("mtop126");
			$(".address").addClass("colorDeep");
		}else{ 
	  		div.slideUp("fast"); 
			$(".mtop").removeClass("mtop126");
			$(".mtop").addClass("mtop56");
			$(".address").removeClass("colorDeep");
		} 
	}); 
	$(".viewMore").click(function(){ 
		var ul = $("#viewMore ul"); 
		if(ul.css("display")=="none"){ 
			ul.slideDown("fast"); 
		}else{ 
			ul.slideUp("fast"); 
		} 
	}); 
	$("#viewMore ul li a").click(function(){
		$("#viewMore ul").hide(); 
	});
	$("#searchOptions .optionBtn").click(function(){
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}else{
			var far = $(this).parent().attr("class");
			$("."+far+" .optionBtn:first").removeClass("selected");
			$(this).addClass("selected");
		}
	});
 });
 function viewDetails(){
 	layer.open({
		type: 1,
		title:false,
		skin: 'layui-layer-bg_gray',
		shadeClose: true,
		shade: [0],
		area:['100%','100%'],
		shift:2,
		closeBtn:0,
		content: $('#carSourceDetails')
	});
 };
 function addToCollection(){
 	layer.open({
		type: 1,
		title:'提示',
		skin: 'layui-layer-tl_green',
		shadeClose: true,
		area:['250px','150px'],
		time: '5000',
		content: $('#addToCollection')
	});
 };
 function searchOptions(){
 	layer.open({
		type: 1,
		title:false,
		skin: 'layui-layer-bg_gray',
		shadeClose: true,
		shade: [0],
		area:['100%','100%'],
		shift:2,
		closeBtn:0,
		content: $('#searchOptions'),
		btn: '确认选择'
	});
 };
 var count=0 ;
 $(document).ready(function() {
	if(4<=3){//${fn:length(list)}
		$('#getmore').hide();
	}else{
		$('#getmore').show();
	}
	for(i=0;i<3 ;i++){
		$('#li_'+i).show() ;
	}
 });
 function getMore(){
	count++ ;
	var start=count*3  ;
	for(i=start;i<start+3 ;i++){
		$('#li_'+i).show() ;
		}
    if(start+3>=8){//${fn:length(list)}
    	$('#getmore').hide();
    }
 }//id="li_${varStatus.index}" style="display:none"
</script>
</head>

<body>
<div class="platform_main">
	<div class="platform_content">
		<div class="searchBar">
			<div class="address colorDeep">
				<img src="${ctx}/static/weixin/images/logistics/map.png" width="20px;" height="20px;" style="margin:13px 12px;"/>
			</div>
			<input type="text" onClick="searchOptions();" class="searchInput" placeholder="选择车载类型"/>
			<div style="clear:both;"></div>
		</div>
		<div id="dropdown">
			<div class="dropdownContent">
				<div>
					<div class="tipLeft">出发地</div>
					<div class="tipRight">到达地</div>
					<div style="clear:both;"></div>
				</div>
				<div class="addContent">
					<div class="addLeft">
						<div>点击选择</div>
						<div>出发地</div>
					</div>
					<div class="addMid">
						<img src="${ctx}/static/weixin/images/logistics/interchange.png" width="40px;" height="40px;"/>
					</div>
					<div class="addRight">
						<div>点击选择</div>
						<div>到达地</div>
					</div>
					<div style="clear:both;"></div>
				</div>
			</div>
		</div>
		
		<div class="mtop mtop126"></div>
		<div id="li_1" class="contentBar ">
		<a href="javascript:;" onClick="viewDetails();" style="text-decoration:none;">
			<div style="border-bottom:1px solid #ccc;">
				<img src="${ctx}/static/weixin/images/logistics/currentLocation.png" width="20px;" height="20px;" style="float:left; margin:10px 5px;"/>
				<div style="float:left;text-align:center; font-weight:bold;">
					<div style="color:#000; font-size:17px;">西湖区</div>
					<div style="color:#000;">江西南昌</div>
				</div>
				<div style="float:left;text-align:center; width:40%;">
					<div style="font-size:12px; color:#969696;">单桥</div>
					<div style="font-size:0;">
					<img src="${ctx}/static/weixin/images/logistics/directionLine.png" width="50px;" height="5px;"/>
					</div>
					<div style="font-size:12px; color:#969696;">普通</div>
				</div>
				<img src="${ctx}/static/weixin/images/logistics/destination.png" width="20px;" height="20px;" style="float:left; margin:10px 5px;"/>
				<div style="float:left;text-align:center; font-weight:bold;">
					<div style=" color:#000; font-size:17px; padding:10px 0;">全国</div>
				</div>
				<div style="clear:both;"></div>
			</div>
		</a>
			<div>
				<img src="${ctx}/static/weixin/images/logistics/headPortrait.png" width="45px;" height="45px;" style="float:left; margin-top:7px;"/>
				<div style="float:left; margin-left:10px;">
					<div style="font-size:15px; float:left; margin-top:5px; margin-bottom:2px; color:#000;">肖宏远</div>
					<img src="${ctx}/static/weixin/images/logistics/authentication.png" width="35px;" height="12px;" style=" margin-top:9px; margin-left:5px;"/>
					<div style="clear:both;"></div>
					<div style="font-size:13px;">
						<span style="background-color:#F14342; color:#FFFFFF; padding:1px 3px; border-radius:2px;">17.55吨</span>
						<span style="background-color:#F14342; color:#FFFFFF; padding:1px 3px; border-radius:2px;">6.2*2.4米</span>
					</div>
				</div>
				<div style="float:right;">
					<div style="font-size:12px; color:#969696; float:left; margin-top:7px; margin-right:3px;">刚刚</div>
					<a href="javascript:;" onClick="addToCollection();" style="text-decoration:none;">
					<img src="${ctx}/static/weixin/images/logistics/notCollected.png" width="20px;" height="20px;" style="margin:10px 5px;"/>
					</a>
					<img src="${ctx}/static/weixin/images/logistics/dialTelephone48.png" width="40px;" height="40px;" style="margin-top:6px;"/>
				</div>
				<div style="clear:both;"></div>
			</div>
		</div>
		
		<div id="li_2" class="contentBar">
			<div style="border-bottom:1px solid #ccc;">
				<img src="${ctx}/static/weixin/images/logistics/currentLocation.png" width="20px;" height="20px;" style="float:left; margin:10px 5px;"/>
				<div style="float:left;text-align:center; font-weight:bold;">
					<div style="color:#000; font-size:17px;">西湖区</div>
					<div style="color:#000;">江西南昌</div>
				</div>
				<div style="float:left;text-align:center; width:40%;">
					<div style="font-size:12px; color:#969696;">单桥</div>
					<div style="font-size:0;">
					<img src="${ctx}/static/weixin/images/logistics/directionLine.png" width="50px;" height="5px;"/>
					</div>
					<div style="font-size:12px; color:#969696;">普通</div>
				</div>
				<img src="${ctx}/static/weixin/images/logistics/destination.png" width="20px;" height="20px;" style="float:left; margin:10px 5px;"/>
				<div style="float:left;text-align:center; font-weight:bold;">
					<div style=" color:#000; font-size:17px; padding:10px 0;">全国</div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div>
				<img src="${ctx}/static/weixin/images/logistics/headPortrait.png" width="45px;" height="45px;" style="float:left; margin-top:7px;"/>
				<div style="float:left; margin-left:10px;">
					<div style="font-size:15px; float:left; margin-top:5px; margin-bottom:2px; color:#000;">江西融合...</div>
					<img src="${ctx}/static/weixin/images/logistics/authentication.png" width="35px;" height="12px;" style=" margin-top:9px; margin-left:5px;"/>
					<div style="clear:both;"></div>
					<div style="font-size:13px;">
						<span style="background-color:#F14342; color:#FFFFFF; padding:1px 3px; border-radius:2px;">17.55吨</span>
						<span style="background-color:#F14342; color:#FFFFFF; padding:1px 3px; border-radius:2px;">6.2*2.4米</span>
					</div>
				</div>
				<div style="float:right;">
					<div style="font-size:12px; color:#969696; float:left; margin-top:7px; margin-right:3px;">3小时前</div>
					<img src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;" style="margin:10px 5px;"/>
					<img src="${ctx}/static/weixin/images/logistics/dialTelephone48.png" width="40px;" height="40px;" style="margin-top:6px;"/>
				</div>
				<div style="clear:both;"></div>
			</div>
		</div>
		
		<div id="li_3" class="contentBar">
			<div style="border-bottom:1px solid #ccc;">
				<img src="${ctx}/static/weixin/images/logistics/currentLocation.png" width="20px;" height="20px;" style="float:left; margin:10px 5px;"/>
				<div style="float:left;text-align:center; font-weight:bold;">
					<div style="color:#000; font-size:17px;">西湖区</div>
					<div style="color:#000;">江西南昌</div>
				</div>
				<div style="float:left;text-align:center; width:40%;">
					<div style="font-size:12px; color:#969696;">单桥</div>
					<div style="font-size:0;">
					<img src="${ctx}/static/weixin/images/logistics/directionLine.png" width="50px;" height="5px;"/>
					</div>
					<div style="font-size:12px; color:#969696;">普通</div>
				</div>
				<img src="${ctx}/static/weixin/images/logistics/destination.png" width="20px;" height="20px;" style="float:left; margin:10px 5px;"/>
				<div style="float:left;text-align:center; font-weight:bold;">
					<div style=" color:#000; font-size:17px; padding:10px 0;">全国</div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div>
				<img src="${ctx}/static/weixin/images/logistics/headPortrait.png" width="45px;" height="45px;" style="float:left; margin-top:7px;"/>
				<div style="float:left; margin-left:10px;">
					<div style="font-size:15px; float:left; margin-top:5px; margin-bottom:2px; color:#000;">江西融合...</div>
					<img src="${ctx}/static/weixin/images/logistics/authentication.png" width="35px;" height="12px;" style=" margin-top:9px; margin-left:5px;"/>
					<div style="clear:both;"></div>
					<div style="font-size:13px;">
						<span style="background-color:#F14342; color:#FFFFFF; padding:1px 3px; border-radius:2px;">17.55吨</span>
						<span style="background-color:#F14342; color:#FFFFFF; padding:1px 3px; border-radius:2px;">6.2*2.4米</span>
					</div>
				</div>
				<div style="float:right;">
					<div style="font-size:12px; color:#969696; float:left; margin-top:7px; margin-right:3px;">3小时前</div>
					<img src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;" style="margin:10px 5px;"/>
					<img src="${ctx}/static/weixin/images/logistics/dialTelephone48.png" width="40px;" height="40px;" style="margin-top:6px;"/>
				</div>
				<div style="clear:both;"></div>
			</div>
		</div>
		
		<div id="li_4" style="display:none;" class="contentBar">
			<div style="border-bottom:1px solid #ccc;">
				<img src="${ctx}/static/weixin/images/logistics/currentLocation.png" width="20px;" height="20px;" style="float:left; margin:10px 5px;"/>
				<div style="float:left;text-align:center; font-weight:bold;">
					<div style="color:#000; font-size:17px;">西湖区</div>
					<div style="color:#000;">江西南昌</div>
				</div>
				<div style="float:left;text-align:center; width:40%;">
					<div style="font-size:12px; color:#969696;">单桥</div>
					<div style="font-size:0;">
					<img src="${ctx}/static/weixin/images/logistics/directionLine.png" width="50px;" height="5px;"/>
					</div>
					<div style="font-size:12px; color:#969696;">普通</div>
				</div>
				<img src="${ctx}/static/weixin/images/logistics/destination.png" width="20px;" height="20px;" style="float:left; margin:10px 5px;"/>
				<div style="float:left;text-align:center; font-weight:bold;">
					<div style=" color:#000; font-size:17px; padding:10px 0;">全国</div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div>
				<img src="${ctx}/static/weixin/images/logistics/headPortrait.png" width="45px;" height="45px;" style="float:left; margin-top:7px;"/>
				<div style="float:left; margin-left:10px;">
					<div style="font-size:15px; float:left; margin-top:5px; margin-bottom:2px; color:#000;">江西融合...</div>
					<img src="${ctx}/static/weixin/images/logistics/authentication.png" width="35px;" height="12px;" style=" margin-top:9px; margin-left:5px;"/>
					<div style="clear:both;"></div>
					<div style="font-size:13px;">
						<span style="background-color:#F14342; color:#FFFFFF; padding:1px 3px; border-radius:2px;">17.55吨</span>
						<span style="background-color:#F14342; color:#FFFFFF; padding:1px 3px; border-radius:2px;">6.2*2.4米</span>
					</div>
				</div>
				<div style="float:right;">
					<div style="font-size:12px; color:#969696; float:left; margin-top:7px; margin-right:3px;">3小时前</div>
					<img src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;" style="margin:10px 5px;"/>
					<img src="${ctx}/static/weixin/images/logistics/dialTelephone48.png" width="40px;" height="40px;" style="margin-top:6px;"/>
				</div>
				<div style="clear:both;"></div>
			</div>
		</div>
		
		<div id="li_5" style="display:none;" class="contentBar">
			<div style="border-bottom:1px solid #ccc;">
				<img src="${ctx}/static/weixin/images/logistics/currentLocation.png" width="20px;" height="20px;" style="float:left; margin:10px 5px;"/>
				<div style="float:left;text-align:center; font-weight:bold;">
					<div style="color:#000; font-size:17px;">西湖区</div>
					<div style="color:#000;">江西南昌</div>
				</div>
				<div style="float:left;text-align:center; width:40%;">
					<div style="font-size:12px; color:#969696;">单桥</div>
					<div style="font-size:0;">
					<img src="${ctx}/static/weixin/images/logistics/directionLine.png" width="50px;" height="5px;"/>
					</div>
					<div style="font-size:12px; color:#969696;">普通</div>
				</div>
				<img src="${ctx}/static/weixin/images/logistics/destination.png" width="20px;" height="20px;" style="float:left; margin:10px 5px;"/>
				<div style="float:left;text-align:center; font-weight:bold;">
					<div style=" color:#000; font-size:17px; padding:10px 0;">全国</div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div>
				<img src="${ctx}/static/weixin/images/logistics/headPortrait.png" width="45px;" height="45px;" style="float:left; margin-top:7px;"/>
				<div style="float:left; margin-left:10px;">
					<div style="font-size:15px; float:left; margin-top:5px; margin-bottom:2px; color:#000;">江西融合...</div>
					<img src="${ctx}/static/weixin/images/logistics/authentication.png" width="35px;" height="12px;" style=" margin-top:9px; margin-left:5px;"/>
					<div style="clear:both;"></div>
					<div style="font-size:13px;">
						<span style="background-color:#F14342; color:#FFFFFF; padding:1px 3px; border-radius:2px;">17.55吨</span>
						<span style="background-color:#F14342; color:#FFFFFF; padding:1px 3px; border-radius:2px;">6.2*2.4米</span>
					</div>
				</div>
				<div style="float:right;">
					<div style="font-size:12px; color:#969696; float:left; margin-top:7px; margin-right:3px;">3小时前</div>
					<img src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;" style="margin:10px 5px;"/>
					<img src="${ctx}/static/weixin/images/logistics/dialTelephone48.png" width="40px;" height="40px;" style="margin-top:6px;"/>
				</div>
				<div style="clear:both;"></div>
			</div>
		</div>
		
		<div id="li_6" style="display:none;" class="contentBar">
			<div style="border-bottom:1px solid #ccc;">
				<img src="${ctx}/static/weixin/images/logistics/currentLocation.png" width="20px;" height="20px;" style="float:left; margin:10px 5px;"/>
				<div style="float:left;text-align:center; font-weight:bold;">
					<div style="color:#000; font-size:17px;">西湖区</div>
					<div style="color:#000;">江西南昌</div>
				</div>
				<div style="float:left;text-align:center; width:40%;">
					<div style="font-size:12px; color:#969696;">单桥</div>
					<div style="font-size:0;">
					<img src="${ctx}/static/weixin/images/logistics/directionLine.png" width="50px;" height="5px;"/>
					</div>
					<div style="font-size:12px; color:#969696;">普通</div>
				</div>
				<img src="${ctx}/static/weixin/images/logistics/destination.png" width="20px;" height="20px;" style="float:left; margin:10px 5px;"/>
				<div style="float:left;text-align:center; font-weight:bold;">
					<div style=" color:#000; font-size:17px; padding:10px 0;">全国</div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div>
				<img src="${ctx}/static/weixin/images/logistics/headPortrait.png" width="45px;" height="45px;" style="float:left; margin-top:7px;"/>
				<div style="float:left; margin-left:10px;">
					<div style="font-size:15px; float:left; margin-top:5px; margin-bottom:2px; color:#000;">江西融合...</div>
					<img src="${ctx}/static/weixin/images/logistics/authentication.png" width="35px;" height="12px;" style=" margin-top:9px; margin-left:5px;"/>
					<div style="clear:both;"></div>
					<div style="font-size:13px;">
						<span style="background-color:#F14342; color:#FFFFFF; padding:1px 3px; border-radius:2px;">17.55吨</span>
						<span style="background-color:#F14342; color:#FFFFFF; padding:1px 3px; border-radius:2px;">6.2*2.4米</span>
					</div>
				</div>
				<div style="float:right;">
					<div style="font-size:12px; color:#969696; float:left; margin-top:7px; margin-right:3px;">3小时前</div>
					<img src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;" style="margin:10px 5px;"/>
					<img src="${ctx}/static/weixin/images/logistics/dialTelephone48.png" width="40px;" height="40px;" style="margin-top:6px;"/>
				</div>
				<div style="clear:both;"></div>
			</div>
		</div>
		
	</div>
	
	<div id="carSourceDetails" class="details_main">
		<div class="fixed_top">
			<img src="${ctx}/static/weixin/images/logistics/carSourceDetails.png" width="20px;" height="20px;" style="margin:3px 5px 0 10px;"/>
			<span style="position:absolute; top:8px; color:#FFF;">车源详情</span>
		</div>
		<div style="padding-top:40px; margin-bottom:60px;">
			<div class="details_group">
				<div class="details_groupBefore">
					<div class="details_left">当前位置</div>
					<div class="details_right">江西宜春丰城市</div>
					<div style="clear:both;"></div>
				</div>
				<div class="details_groupLast">
					<div class="details_left">期望流向</div>
					<div class="details_right">全国</div>
					<div style="clear:both;"></div>
				</div>
			</div>
			
			<div class="details_group">
				<div class="details_groupBefore">
					<div class="details_left">联系人</div>
					<div class="details_right">曾国强</div>
					<div style="clear:both;"></div>
				</div>
				<div class="details_groupBefore">
					<div class="details_left">联系电话</div>
					<div class="details_right">18970008000</div>
					<img src="${ctx}/static/weixin/images/logistics/phoned.png" width="20px;" height="20px;" style="float:left; margin-left:5px;"/>
					<div style="clear:both;"></div>
				</div>
				<div class="details_groupBefore">
					<div class="details_left">车牌号</div>
					<div class="details_right">赣CB0717</div>
					<div style="clear:both;"></div>
				</div>
				<div class="details_groupLast">
					<div class="details_left">认证情况</div>
					<div class="details_right">车辆</div>
					<img src="${ctx}/static/weixin/images/logistics/carCertification.png" width="20px;" height="20px;" style="float:left; margin-left:5px;"/>
					<div style="clear:both;"></div>
				</div>
			</div>
			
			<div class="details_group">
				<div class="details_groupBefore">
					<div class="details_left">车型</div>
					<div class="details_right">单轿</div>
					<div style="clear:both;"></div>
				</div>
				<div class="details_groupBefore">
					<div class="details_left">装载类型</div>
					<div class="details_right">普通</div>
					<div style="clear:both;"></div>
				</div>
				<div class="details_groupBefore">
					<div class="details_left">车长车宽</div>
					<div class="details_right">长5米 宽2.4米</div>
					<div style="clear:both;"></div>
				</div>
				<div class="details_groupBefore">
					<div class="details_left">载重</div>
					<div class="details_right">15.2吨</div>
					<div style="clear:both;"></div>
				</div>
				<div class="details_groupLast">
					<div class="details_left">发布时间</div>
					<div class="details_right">2016-02-12 13:32:23</div>
					<div style="clear:both;"></div>
				</div>
			</div>
		</div>
		
		<div class="fixed_bottom">
			<a href="logisticsPlatform.html">
			<img src="${ctx}/static/weixin/images/logistics/return.png" width="20px;" height="20px;" style="float:left; margin:12px 10px;"/>
			</a>
			<div style="float:right; border-left:1px solid #DCDCDC; padding:0 10px;">
				<img src="${ctx}/static/weixin/images/logistics/phone.png" width="20px;" height="20px;" style="margin:12px 0;"/>
				<span style="position:relative; bottom:16px; color:#01A858;">拨打电话</span>
			</div>
			<div style="float:right; border-left:1px solid #DCDCDC; padding:0 10px;">
				<img src="${ctx}/static/weixin/images/logistics/alreadyCollect.png" width="20px;" height="20px;" style="margin:12px 0;"/>
				<span style="position:relative; bottom:16px; color:#F04444;">已收藏</span>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
	
	<div id="searchOptions" style="display:none;">
		<div style="font-size:16px; padding:6px 10px;">车长</div>
		<div class="options_1" style="background-color:#FFF; padding:5px 12px;">
			<div class="optionBtn selected">车长不限</div>
			<div class="optionBtn">3米</div>
			<div class="optionBtn">3.8米</div>
			<div class="optionBtn">4.2米</div>
			<div class="optionBtn">4.5米</div>
			<div class="optionBtn">5米</div>
			<div class="optionBtn">6.2米</div>
			<div class="optionBtn">6.8米</div>
			<div class="optionBtn">7.2米</div>
			<div class="optionBtn">7.6米</div>
			<div class="optionBtn">8.6米</div>
			<div class="optionBtn">8.8米</div>
			<div class="optionBtn">9.6米</div>
			<div class="optionBtn">13米</div>
			<div class="optionBtn">14.6米</div>
			<div class="optionBtn">15米</div>
			<div class="optionBtn">16米</div>
			<div class="optionBtn">17.6米</div>
			<div class="optionBtn">19米</div>
			<div class="optionBtn">21米</div>
			<div class="optionBtn">25米</div>
			<div style="clear:both;"></div>
		</div>
		<div style="font-size:16px; padding:6px 10px;">车型</div>
		<div class="options_2" style="background-color:#FFF; padding:5px 12px;">
			<div class="optionBtn selected">车型不限</div>
			<div class="optionBtn">小车</div>
			<div class="optionBtn">单桥</div>
			<div class="optionBtn">后八轮</div>
			<div class="optionBtn">单桥</div>
			<div class="optionBtn">前四后四</div>
			<div class="optionBtn">前四后六</div>
			<div class="optionBtn">前四后八</div>
			<div class="optionBtn">前四后十</div>
			<div class="optionBtn">五桥</div>
			<div class="optionBtn">六桥</div>
			<div class="optionBtn">半挂</div>
			<div class="optionBtn">一拖二</div>
			<div class="optionBtn">二拖二</div>
			<div class="optionBtn">二拖三</div>
			<div class="optionBtn">冷藏</div>
			<div class="optionBtn">保温</div>
			<div class="optionBtn">危货</div>
			<div class="optionBtn">油罐</div>
			<div class="optionBtn">自卸</div>
			<div class="optionBtn">工程</div>
			<div class="optionBtn">特种拖</div>
			<div style="clear:both;"></div>
		</div>
		<div style="font-size:16px; padding:6px 10px;">装载类型</div>
		<div class="options_3" style="background-color:#FFF; padding:5px 12px;">
			<div class="optionBtn selected">装载类型不限</div>
			<div class="optionBtn">普通</div>
			<div class="optionBtn">平板</div>
			<div class="optionBtn">高低平板</div>
			<div class="optionBtn">低栏</div>
			<div class="optionBtn">高栏</div>
			<div class="optionBtn">花栏</div>
			<div class="optionBtn">半封闭</div>
			<div class="optionBtn">普通</div>
			<div class="optionBtn">平板</div>
			<div class="optionBtn">集装箱</div>
			<div class="optionBtn">开顶箱</div>
			<div style="clear:both;"></div>
		</div>
	</div>
	
	<div id="addToCollection" style="display:none; text-align:center; padding:20px 0;">
		<div>车源已收藏</div>
		<div>请到“<span style="color:#FF6707;">收藏车源</span>”进行查看</div>
		<div>5秒后自动关闭</div>
	</div>
	
	<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
	<div id="tbox">
		<a id="gotop" href="#top"></a>
	</div>
	
	<div class="navigationBar">
			<ul>
				<!--<li>
				<a href="javascript:;">
					<div class="navImage"><img src="images/carSource.png" width="20" height="20"/></div>
					<div class="navTitle">首页</div>
				</a>			
			</li>-->
				<li><a href="${ctx}/auth/page/mobile/weixin/logistics/zwb/weixin/main">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/riskLogistics/carSourced.png" width="20" height="20" />
					</div>
					<div class="navTitle">物流服务</div>
				</a></li>
				<li><a href="javascript:;" onClick="selectReleaseType();">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/riskLogistics/releaseSupply.png" width="20" height="20" />
					</div>
					<div class="navTitle">发布货源</div>
				</a></li>
				<li><a href="javascript:;" class="viewMore">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/riskLogistics/more.png" width="20" height="20" />
					</div>
					<div class="navTitle">更多服务</div>
				</a></li>
			</ul>
			<div id="viewMore">
				<ul style="margin-top: -137px;">
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/logisticsInfo/mySupply">我的货源</a></li>
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/logisticsInfo/myCollection">我的收藏</a></li>
					<li><a href="${ctx}/logisticsInfo/incrementServices">增值服务</a></li>
				</ul>
			</div>
		</div>
</div>
	<!--<script src="js/LAreaData1.js"></script>
    <script src="js/LAreaData2.js"></script>
    <script src="js/LArea.js"></script>
    <script>
    var area1 = new LArea();
    area1.init({
        'trigger': '#demo1', //触发选择控件的文本框，同时选择完毕后name属性输出到该位置
        'valueTo': '#value1', //选择完毕后id属性输出到该位置
        'keys': {
            id: 'id',
            name: 'name'
        }, //绑定数据源相关字段 id对应valueTo的value属性输出 name对应trigger的value属性输出
        'type': 1, //数据源类型
        'data': LAreaData //数据源
    });
    area1.value=[1,13,3];//控制初始位置，注意：该方法并不会影响到input的value
    </script>-->
</body>
</html>
