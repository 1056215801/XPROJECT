<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>物流平台-车源详情</title>
<link href="${ctx}/static/css/logistics/logisticsPlatform.css" rel="stylesheet"/>
<link href="${ctx}/static/css/projectHeader2.css" rel="stylesheet"/>
<link href="${ctx}/static/css/projectFooter.css" rel="stylesheet"/>
</head>

<body>
<input type="hidden" id="kind" value="1"/>
<form action="" method="post" id="detailForm">
	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
	<input type="hidden" id="info" name="info"/>
	<!-- 物流种类 1:万佶物流 2:中危宝物流 -->
	<input type="hidden" id="type" name="type" value="${type}"/>
</form>
<div class="logistics_main">
	<div class="project_header">
	    <%@ include file="../common/header.jsp"%>
	</div>
	
	<div class="logistics_content">
		<div class="details_cont">
			<div class="details_contTop clearfix" id="main">
				
			</div>
			
			<div class="details_contBottom">
				<div style="padding:12px 8px; border:1px solid #ccc; border-bottom: none;">
					<div style="border-left:5px solid #f14241; color:#000; font-weight:bold; padding:0 5px;">同线路车源推荐</div>
				</div>
				<div class="searchResult">
					<table id="list"></table>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp"%>
</div>
<script>
 $(function(){
	$('.tabItem').children().eq(0).css({'display':'none'});
	$('.tabItem').children().eq(1).css({'display':'block'});
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
	 
	var str = '${info}';
	var info = JSON.parse(str.substring(1,str.length-1));  
	var type = '${type}';
	if(type==1){
		if(info.carId!=undefined){
			getWanjiCarList(1, 4, 0, 0,info.carId);
		}else{
			getWanjiCarList(1, 4, info.AdCode, info.TargetAdCode,info.Id);
			setTimeout(function(){
				if($("#list tr").length == 0){
					getWanjiCarList(1, 4, 0, 0,info.Id);
				}
			},500);
		}
		
		
	}else if(type==2){
		getZwbCarList(1, 4, info.beginAreaId, info.endAreaId,info.carId);
		setTimeout(function(){
			if($("#list tr").length == 0){
				getZwbCarList(1, 4, null, null,info.carId);
			}
		},500);
	}
	if(type==1){
		var _div = "";
		if(info.carId==undefined){
			_div = '<div class="details_contTopLeft">'
				+'<div class="detailsImgBar">'
				+'<img src="${ctx}/static/image/logistics/product.jpg" width="180" height="180">'
				+'</div>'
				+'<div class="detailsContBar">'
				+'<div class="detailsContTitle">【'+info.CurPlace+'】&nbsp;到&nbsp;【全国】&nbsp;&nbsp;'+(info.CarTypeName==undefined?'':info.CarTypeName)+'&nbsp;&nbsp;'+(info.CarLoadTypeName==undefined?'':info.CarLoadTypeName)+'</div>'
				+'<div class="detailsContAdd"><img src="${ctx}/static/image/logistics/chufa.png" width="15"><span class="margin_left_5">'+info.CurPlace+'</span></div>'
				+'<div class="detailsContAdd"><img src="${ctx}/static/image/logistics/daoda.png" width="15"><span class="margin_left_5">全国</span></div>'
				+'<div class="detailsCont">'
				+'<div>'
				+'<span class="detailsContTerm">联系人：'+info.Name+'</span>'
				+'<span class="detailsContTerm">联系电话：'+info.Telphone+'</span>'
				+'</div>'
				+'<div>'
				+'<span class="detailsContTerm">车牌号：'+(info.PlateNum==undefined?'':info.PlateNum)+'</span>'
				+'<span class="detailsContTerm">认证情况：';
			if(info.IsAuth){
				_div += '个人&nbsp;';
			}
			if(info.IsCarAuth){
				_div += '车辆&nbsp;';
			}
			if(info.IsCompany){
				_div += '企业&nbsp;';
			}
			_div += '</span></div>'
				+'<div>'
				+'<span class="detailsContTerm">车型：'+(info.CarTypeName==undefined?'':info.CarTypeName)+'</span>'
				+'<span class="detailsContTerm">装载类型：'+(info.CarLoadTypeName==undefined?'':info.CarLoadTypeName)+'</span>'
				+'</div>'
				+'<div>'
				+'<span class="detailsContTerm">载重：'+info.CarLoad+'吨</span>'
				+'<span class="detailsContTerm">车长车宽：长'+info.CarLength+'米&nbsp;宽'+info.CarWidth+'米</span>'
				+'</div>'
				+'<div>'
				+'<span class="detailsContTerm">发布时间：'+info.StrLocationDt+'</span>'
				+'</div>'
				+'</div>'
				+'<div class="detailsContOper clearfix">'
				+'<div class="collectionBtn">';
				
			if(info.isCollect=="true"){
				_div += '<img src="${ctx}/static/image/logistics/alreadyCollect.png" class="collect" width="15" height="15" style="cursor:pointer; margin-right:3px;" data='+JSON.stringify(info)+' onclick="collect(this)">'
					+'<span>已收藏</span>';
			}else{
				_div += '<img src="${ctx}/static/image/logistics/notCollected.png" width="15" height="15" style="cursor:pointer; margin-right:3px;" data='+JSON.stringify(info)+' onclick="collect(this)">'
					+'<span>未收藏</span>';
			}
			_div += '</div>'
				+'<div class="returnPage" style="float:left;" onclick="window.history.go(-1)">返回上一页</div>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'<div class="details_contTopRight">'
				+'<div class="margin_left_7">'
				+'<img src="'+info.Avatar+'" width="50" height="50" style="border-radius:50%; overflow:hidden;">'
				+'<span class="resultName">'
				+'<div>'+info.Name+'</div>';
			if(info.IsAuth){
				_div += '<img src="${ctx}/static/image/logistics/authentication.png" width="37" style="display:block;">';
			}
			_div +=	'</span>'
				+'</div>'
				+'<div class="registrTime">注册时间：'+info.ActiveDt.substring(0,10)+'</div>'
				+'<div class="hisCarSource">TA发布的车源</div>'
				+'</div>';
		}else{
			_div = '<div class="details_contTopLeft">'
				+'<div class="detailsImgBar">'
				+'<img src="${ctx}/static/image/logistics/product.jpg" width="180" height="180">'
				+'</div>'
				+'<div class="detailsContBar">'
				+'<div class="detailsContTitle">【'+info.curPlace+'】&nbsp;到&nbsp;【全国】&nbsp;&nbsp;'+(info.carTypeName==undefined?'':info.carTypeName)+'&nbsp;&nbsp;'+(info.carLoadTypeName==undefined?'':info.carLoadTypeName)+'</div>'
				+'<div class="detailsContAdd"><img src="${ctx}/static/image/logistics/chufa.png" width="15"><span class="margin_left_5">'+info.curPlace+'</span></div>'
				+'<div class="detailsContAdd"><img src="${ctx}/static/image/logistics/daoda.png" width="15"><span class="margin_left_5">全国</span></div>'
				+'<div class="detailsCont">'
				+'<div>'
				+'<span class="detailsContTerm">联系人：'+info.driverName+'</span>'
				+'<span class="detailsContTerm">联系电话：'+info.driverTelphone+'</span>'
				+'</div>'
				+'<div>'
				+'<span class="detailsContTerm">车牌号：'+info.plateNum+'</span>'
				+'<span class="detailsContTerm">认证情况：';
			if(info.isAuth){
				_div += '个人&nbsp;';
			}
			if(info.isCarAuth){
				_div += '车辆&nbsp;';
			}
			if(info.isCompany){
				_div += '企业&nbsp;';
			}
			_div += '</span></div>'
				+'<div>'
				+'<span class="detailsContTerm">车型：'+(info.carTypeName==undefined?'':info.carTypeName)+'</span>'
				+'<span class="detailsContTerm">装载类型：'+(info.carLoadTypeName==undefined?'':info.carLoadTypeName)+'</span>'
				+'</div>'
				+'<div>'
				+'<span class="detailsContTerm">载重：'+info.carLoad+'吨</span>'
				+'<span class="detailsContTerm">车长车宽：长'+info.carLength+'米&nbsp;宽'+info.carWidth+'米</span>'
				+'</div>'
				+'<div>'
				+'<span class="detailsContTerm">发布时间：'+getTime(info.activeDate)+'</span>'
				+'</div>'
				+'</div>'
				+'<div class="detailsContOper clearfix">'
				+'<div class="collectionBtn">';
				
			if(1==1){
				_div += '<img src="${ctx}/static/image/logistics/alreadyCollect.png" class="collect" width="15" height="15" style="cursor:pointer; margin-right:3px;" data='+JSON.stringify(info)+' onclick="collect(this)">'
					+'<span>已收藏</span>';
				
			}else{
				_div += '<img src="${ctx}/static/image/logistics/notCollected.png" width="15" height="15" style="cursor:pointer; margin-right:3px;" data='+JSON.stringify(info)+' onclick="collect(this)">'
					+'<span>未收藏</span>';
			}
			_div += '</div>'
				+'<div class="returnPage" style="float:left;" onclick="window.history.go(-1)">返回上一页</div>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'<div class="details_contTopRight">'
				+'<div class="margin_left_7">'
				+'<img src="'+info.driverAvatar+'" width="50" height="50" style="border-radius:50%; overflow:hidden;">'
				+'<span class="resultName">'
				+'<div>'+info.driverName+'</div>';
			if(info.isAuth){
				_div += '<img src="${ctx}/static/image/logistics/authentication.png" width="37" style="display:block;">';
			}
			_div +=	'</span>'
				+'</div>'
				+'<div class="registrTime">注册时间：'+getTime(info.activeDate)+'</div>'
				+'<div class="hisCarSource">TA发布的车源</div>'
				+'</div>';
		}
		
	}else if(type==2){
		var _div = '<div class="details_contTopLeft">'
			+'<div class="detailsImgBar">'
			+'<img src="https://www.zwb56.com'+info.carTypeIcon+'" width="180" height="180">'
			+'</div>'
			+'<div class="detailsContBar">'
			+'<div class="detailsContTitle">【'+info.startAddressDetail+'】&nbsp;到&nbsp;'+info.endAddressDetail+'&nbsp;&nbsp;'+info.carTypeName+'&nbsp;&nbsp;'+info.sendType+'</div>'
			+'<div class="detailsContAdd"><img src="${ctx}/static/image/logistics/chufa.png" width="15"><span class="margin_left_5">'+info.startAddressDetail+'</span></div>'
			+'<div class="detailsContAdd"><img src="${ctx}/static/image/logistics/daoda.png" width="15"><span class="margin_left_5">'+info.endAddressDetail+'</span></div>'
			+'<div class="detailsCont">'
			+'<div>'
			//+'<span class="detailsContTerm">联系人：'+info.Name+'</span>'
			+'<span class="detailsContTerm">联系电话：'+info.tel+'</span>'
			+'</div>'
			+'<div>'
			+'<span class="detailsContTerm">车型：'+info.carTypeName+'</span>'
			+'<span class="detailsContTerm">配送方式：'+info.sendType+'</span>'
			+'</div>'
			+'<div>'
			+'<span class="detailsContTerm">车长：长'+info.length+'米</span>'
			+'<span class="detailsContTerm">发布时间：'+info.timeInfo+'</span>'
			+'</div>'
			+'</div>'
			+'<div class="detailsContOper clearfix">'
			+'<div class="collectionBtn">';
			
		if(info.isCollectionCar==1){
			_div += '<img src="${ctx}/static/image/logistics/alreadyCollect.png" class="collect" width="15" height="15" style="cursor:pointer; margin-right:3px;" data='+JSON.stringify(info)+' onclick="collect(this)">'
				+'<span>已收藏</span>';
			
		}else{
			_div += '<img src="${ctx}/static/image/logistics/notCollected.png" width="15" height="15" style="cursor:pointer; margin-right:3px;" data='+JSON.stringify(info)+' onclick="collect(this)">'
				+'<span>未收藏</span>';
		}
		_div += '</div>'
			+'<div class="returnPage" style="float:left;" onclick="window.history.go(-1)">返回上一页</div>'
			+'</div>'
			+'</div>'
			+'</div>'
			+'<div class="details_contTopRight">'
			+'<div class="margin_left_7">'
			+'<img src="${ctx}/static/image/logistics/headPortrait.png" width="50" height="50" style="border-radius:50%; overflow:hidden;">'
			+'<span class="resultName">';
		if(info.IsAuth){
			_div += '<img src="${ctx}/static/image/logistics/authentication.png" width="37" style="display:block;">';
		}
		_div +=	'</span>'
			+'</div>'
			+'<div class="registrTime">注册时间：'+info.time+'</div>'
			+'<div class="hisCarSource">TA发布的车源</div>'
			+'</div>';
	}
	
	
	$("#main").append(_div);
	
 });
 
</script>
<script type="text/javascript">
function ityzl_SHOW_LOAD_LAYER(){  
    return layer.msg('努力中...', {icon: 16,shade: [0.5, '#f5f5f5'],scrollbar: false,time:100000}) ;  
}

function getWanjiCarList(pageNum, pageSize, AdCode, TargetAdCode, Id){
	var TypeCode = -1;
	var CarLoadType = -1;
	
	var index = null;
	$.ajax({
		url:"${ctx}/logistics/wanji/json/getPlatCar",
		type:"post",
		data:{
			"${_csrf.parameterName}" : '${_csrf.token}',
			"Take" : pageSize,
			"Skip" : (pageNum-1)*pageSize,
			"AdCode" : AdCode,
			"TargetAdCode" : TargetAdCode,
			"TypeCode" : TypeCode,
			"CarLoadType" : CarLoadType
		},
		dataType:"json",
		beforeSend:function(){
			index = ityzl_SHOW_LOAD_LAYER(); 
	    },
		success:function(result){
			layer.close(index);
			if(result.code==1){
				var total = result.jsonValue.Total;
				if(pageNum==1 && result.jsonValue.Total!=null){
					$("#total").text(total);
					$("#totalUnit").text("辆");
					$("#kindUnit").text("车源");
				}
			    $("#pageNum").val(Number(pageNum)+1);
				var list = result.value;
				for(var i=0;i<list.length;i++){
					var info = list[i];
					if(info.Id==Id){
						continue;
					}
					var CarTypeName = info.CarTypeName;
					var CarLoadTypeName = info.CarLoadTypeName;
					var Avatar = info.Avatar;
					if(CarTypeName == null){
						CarTypeName = "";
					}
					if(CarLoadTypeName == null){
						CarLoadTypeName = "";
					}
					if(Avatar == null){
						Avatar = "${ctx}/static/image/logistics/headPortrait.png";
					}
					
					var _div = '<tr>'
						+'<td width="5%">'
						+'<img src="${ctx}/static/image/logistics/product.jpg" width="62" height="62" style="margin:0 8px;">'
						+'</td>'
						+'<td width="10%" style="text-align:left;">'
						+'<img src="${ctx}/static/image/logistics/currentLocation.png" width="30" height="30">'
						+'<span class="resultAdd">'+info.CurPlace+'</span>'
						+'</td>'
						+'<td width="10%">'
						+'<span class="resultConnect">'
						+'<div>'+CarTypeName+'</div>'
						+'<img src="${ctx}/static/image/logistics/directionLine.png" width="60" height="5" style="display:block;">'
						+'<div>'+CarLoadTypeName+'</div>'
						+'</span>'
						+'</td>'
						+'<td width="10%">'
						+'<img src="${ctx}/static/image/logistics/destination.png" width="30" height="30">'
						+'<span class="resultAdd">全国</span>'
						+'</td>'
						+'<td width="20%" style="text-align:left;">'
						+'<span class="redLabel">载重:'+info.CarLoad+'吨</span><br>'
						+'<span class="redLabel">车长:'+info.CarLength+'&nbsp;车宽:'+info.CarWidth+'米</span>'
						+'</td>'
						+'<td width="15%" style="text-align:left;">'
						+'<img src="'+Avatar+'" width="50" height="50" style="border-radius:50%; overflow:hidden;">'
						+'<span class="resultName">'
						+'<div>'+info.Name+'</div>';
						if(info.IsAuth){
							_div += '<img src="${ctx}/static/image/logistics/authentication.png" width="37" style="display:block;">';
						}
					_div += '</span>'
						+'</td>'
						+'<td width="10%" style="text-align:left;">'
						+'<span class="resultTime">'+info.StrLocationDt+'</span>'
						+'</td>'
						+'<td width="5%">';
						if(info.isCollect=="true"){
							_div += '<img src="${ctx}/static/image/logistics/alreadyCollect.png" class="collect" width="20" height="20" style="cursor:pointer;" data='+JSON.stringify(info)+' onclick="collect(this)">';
						}else{
							_div += '<img src="${ctx}/static/image/logistics/notCollected.png" width="20" height="20" style="cursor:pointer;" data='+JSON.stringify(info)+' onclick="collect(this)">';
						}
					_div += '</td>'
						+'<td width="10%">'
						+'<span class="detailsBtn" data='+JSON.stringify(info)+' onclick="detail(this)">查看详情</span>'
						+'</td>'
						+'</tr>';
					$("#list").append(_div);
					
				}
			}
		},
		error:function(){
			layer.msg("列表加载失败，请刷新重试！");
		}
		
	});
}


function getZwbCarList(pageNum, pageSize, beginAreaId, endAreaId, carId){
	
	var index = null;
	$.ajax({
		url:"${ctx}/logistics/zwb/json/findCar",
		type:"post",
		data:{
			"curPage":pageNum,
			"pageCount":pageSize,
			"beginAreaId":beginAreaId,
			"endAreaId":endAreaId, 
			"${_csrf.parameterName}":'${_csrf.token}'
		},
		dataType:"json",
		beforeSend:function(){
			index = ityzl_SHOW_LOAD_LAYER(); 
	    },
		success:function(result){
			layer.close(index);
			if(result.code==50000){
				var total = result.jsonValue.totalCount;
				if(pageNum==1 && total!=null){
					$("#total").text(total);
					$("#totalUnit").text("辆");
					$("#kindUnit").text("车源");
				}
				var list = result.value;
				for(var i=0;i<list.length;i++){
					var info = list[i];
					if(info.carId==carId){
						continue;
					} 
					var _div = '<tr>'
						+'<td width="5%">'
						+'<img src="https://www.zwb56.com'+info.carTypeIcon+'" width="62" height="62" style="margin:0 8px;">'
						+'</td>'
						+'<td width="10%" style="text-align:left;">'
						+'<img src="${ctx}/static/image/logistics/currentLocation.png" width="30" height="30">'
						+'<span class="resultAdd">'+info.beginAreaName+'</span>'
						+'</td>'
						+'<td width="10%">'
						+'<span class="resultConnect">'
						+'<div>'+info.linesFlag+'</div>'
						+'<img src="${ctx}/static/image/logistics/directionLine.png" width="60" height="5" style="display:block;">'
						+'<div>'+info.sendType+'</div>'
						+'</span>'
						+'</td>'
						+'<td width="10%">'
						+'<img src="${ctx}/static/image/logistics/destination.png" width="30" height="30">'
						+'<span class="resultAdd">'+info.endAreaName+'</span>'
						+'</td>'
						+'<td width="20%" style="text-align:left;">'
						+'<span class="redLabel">载重:'+info.tonnage+'吨</span><br>'
						+'<span class="redLabel">车长:'+info.length+'米</span>'
						+'</td>'
						+'<td width="15%" style="text-align:left;">'
						+'<img src="${ctx}/static/image/logistics/headPortrait.png" width="50" height="50" style="border-radius:50%; overflow:hidden;">'
						+'<span class="resultName">'
						+'<div>'+info.carTypeName+'</div>'
						+'</span>'
						+'</td>'
						+'<td width="10%" style="text-align:left;">'
						+'<span class="resultTime">'+info.timeInfo+'</span>'
						+'</td>'
						+'<td width="5%">';
						if(info.isCollectionCar=="1"){
							_div += '<img src="${ctx}/static/image/logistics/alreadyCollect.png" class="collect" width="20" height="20" style="cursor:pointer;" data='+JSON.stringify(info)+' onclick="collect(this)">';
						}else{
							_div += '<img src="${ctx}/static/image/logistics/notCollected.png" width="20" height="20" style="cursor:pointer;" data='+JSON.stringify(info)+' onclick="collect(this)">';
						}
					_div += '</td>'
						+'<td width="10%">'
						+'<span class="detailsBtn" data='+JSON.stringify(info)+' onclick="detail(this)">查看详情</span>'
						+'</td>'
						+'</tr>';
					$("#list").append(_div);
				}
			}
		},
		error:function(){
			layer.msg("列表加载失败，请刷新重试！");
		}
		
	});
}


function collect(obj){
	//var info =  eval("("+$(obj).attr("data")+")");
	var info = JSON.parse($(obj).attr("data"));
	var type = $("#type").val();
	var kind = $("#kind").val();
	var carId = null;
	if(info.carId!=undefined){
		kind=3;
	}
	if(kind==1){
		carId = info.Id;
	}else if(kind==3){
		carId = info.carId;
	}
	if(type==1){
		var IsAuth;
		var IsCompany;
		var IsCarAuth;
		var Avatar;
		var ActiveDt= info.ActiveDt;
		if(kind==1){
			if(info.IsAuth){
				IsAuth = 1;
			}else {
				IsAuth = 0;
			}
			if(info.IsCompany){
				IsCompany = 1;
			}else{
				IsCompany = 0;
			}
			if(info.IsCarAuth){
				IsCarAuth = 1;
			}else{
				IsCarAuth = 0;
			}
			if(info.Avatar==""||info.Avatar==null){
				Avatar="";
			}
			ActiveDt=ActiveDt.substring(0,10);
		}
		
		if($(obj).hasClass("collect")){
			$.ajax({
				url:"${ctx}/logistics/wanji/json/cancelCollect",
				type:"post",
				data:{
					"carId":carId,
					"${_csrf.parameterName}" : '${_csrf.token}'
				},
				dataType:"json",
				success:function(result){
					if(result.code==1){
						$(obj).removeClass("collect");
						$(obj).attr("src","${ctx}/static/image/logistics/notCollected.png");
						layer.msg("取消收藏成功！");
						info.isCollect = "false";
						$(obj).attr("data",JSON.stringify(info));
						$(obj).parent().next().children().attr("data",JSON.stringify(info));
					}else if(result.code==-2){
						layer.msg("亲，您还没有登录")
					}else if(result.code==4){
						layer.msg(result.msg);
					}else{
						layer.alert(result.msg);
					}
				},
				error:function(){
					layer.alert("操作异常，请刷新重试！");
				}
			});
			
		}else{
			$.ajax({
				url:"${ctx}/logistics/wanji/json/collectCar",
				type:"post",
				data:{
					"carId":carId,
					"activeDt":ActiveDt,
					"plateNum" : info.PlateNum,
					"isAuth" : IsAuth,
					"isCompany" : IsCompany,
					"isCarauth" : IsCarAuth,
					"carWidth" : info.CarWidth,
					"carLength" : info.CarLength,
					"carLoad" : info.CarLoad,
					"carLoadTypeName" :info.CarLoadTypeName,
					"carTypeName" : info.CarTypeName,
					"driverAvatar":info.Avatar,
					"driverName":info.Name,
					"driverId":info.DriverId,
					"driverTelphone" : info.Telphone,
					"curPlace":info.CurPlace,
					"${_csrf.parameterName}" : '${_csrf.token}'
				},
				dataType:"json",
				success:function(result){
					if(result.code==1){
						$(obj).addClass("collect");
						$(obj).attr("src","${ctx}/static/image/logistics/alreadyCollect.png");
						layer.msg("收藏成功！");
						info.isCollect = "true";
						$(obj).attr("data",JSON.stringify(info));
						$(obj).parent().next().children().attr("data",JSON.stringify(info));
					}else if(result.code==-2){
						layer.msg("亲，您还没有登录")
					}else if(result.code==4){
						layer.msg(result.msg);
					}else{
						layer.alert(result.msg);
					}
				},
				error:function(){
					layer.alert("操作异常，请刷新重试！");
				}
			});
		}
	}else{
		if($(obj).hasClass("collect")){
			$.ajax({
				url:"${ctx}/logistics/zwb/json/cancelCollect",
				type:"post",
				data:{
					"carSourceId":info.id,
					"${_csrf.parameterName}" : '${_csrf.token}'
				},
				dataType:"json",
				success:function(result){
					if(result.code==50013){
						$(obj).removeClass("collect");
						$(obj).attr("src","${ctx}/static/image/logistics/notCollected.png");
						layer.msg("取消收藏成功！");
						info.isCollectionCar = 0;
						$(obj).attr("data",JSON.stringify(info));
						$(obj).parent().next().children().attr("data",JSON.stringify(info));
					}else if(result.code==-2){
						layer.msg("亲，您还没有登录")
					}else{
						layer.alert(result.msg);
					}
				},
				error:function(){
					layer.alert("操作异常，请刷新重试！");
				}
			});
			
		}else{
			$.ajax({
				url:"${ctx}/logistics/zwb/json/collectCar",
				type:"post",
				data:{
					"carSourceId":info.id,
					"${_csrf.parameterName}" : '${_csrf.token}'
				},
				dataType:"json",
				success:function(result){
					if(result.code==50005){
						$(obj).addClass("collect");
						$(obj).attr("src","${ctx}/static/image/logistics/alreadyCollect.png");
						layer.msg("收藏成功！");
						info.isCollectionCar = 1;
						$(obj).attr("data",JSON.stringify(info));
						$(obj).parent().next().children().attr("data",JSON.stringify(info));
					}else if(result.code==-2){
						layer.msg("亲，您还没有登录")
					}else{
						layer.alert(result.msg);
					}
				},
				error:function(){
					layer.alert("操作异常，请刷新重试！");
				}
			});
		}
	}
	
}

function detail(obj){
	$("#info").val("("+$(obj).attr("data")+")");
	$("#detailForm").attr("action","${ctx}/front/logistics/detail").submit();
}

//long类型时间转换
function getTime(time) {
	var date = new Date(time);
	Y = date.getFullYear() + '-';
	M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
			.getMonth() + 1)
			+ '-';
	D = (date.getDate() < 10 ?( '0' + date.getDate() ) : date.getDate() ) + ' ';
	h = (date.getHours() < 10 ?( '0' + date.getHours() ) : date.getHours() ) + ':';
	m = (date.getMinutes() < 10 ?( '0' + date.getMinutes() ) : date.getMinutes() );
	/* s = (date.getSeconds() < 10 ?( '0' + date.getSeconds() ) : date.getSeconds() ); */
	return (Y + M + D + h + m );
}
</script>
</body>
</html>
