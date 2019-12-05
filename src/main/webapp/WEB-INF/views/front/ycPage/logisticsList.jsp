<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<%@ include file="../common/page.jsp"%><!-- 前端分页 -->
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>物流服务</title>
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
<link href="${ctx}/static/css/logistics/logisticsPlatform.css" rel="stylesheet"/>
<style>
.hidden{
	display: none;
}
</style>
</head>

<body>
<!-- 列表种类1:车源列表 2:货源列表 3:收藏列表 -->
<input type="hidden" id="kind" value="1"/>
<!-- 页码 -->
<input type="hidden" id="pageNum" value="1">
<form action="" method="post" id="detailForm">
	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
	<input type="hidden" id="info" name="info"/>
</form>
	<div class="project_main">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<div class="project_content_header">
			<div class="container newNav">
			     <div class="newNavSub">
			     	<img src="${ctx}/static/image/homePage_yc/projectDsc.png" />
			     </div>
			    <div class="newNavSub">
			    	<p class="navTitle">物流服务</p>
				    <p>
					<font>一共搜索到</font>
					&nbsp;&nbsp;<font class="projectNum" id="total"></font>&nbsp; <font id="totalUnit">辆</font>&nbsp;
					<font>货物运输</font>&nbsp;&nbsp;<font id="kindUnit">车源</font>
					</p>
			     </div>
			</div>
		</div>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-12">
						<div class="artical-list">
							<div class="titleName clearfix">
								<ul>
									<li><a href="javascript:;">车源信息</a></li>
									<li><a href="javascript:;">我发布的</a></li>
									<li><a href="javascript:;">我收藏的</a></li>
								</ul>
								<!-- <div class="releaseSource" onclick="add()">发布货源</div> -->
							</div>
							<div class="titleItem">
								<div class="title-content">
									<div class="carSourceScreenBar" id="wanjiSearch">
										<div class="screenType">
											<span style="color:#000; font-size: 12px;">当前位置：</span>
											<select id="srcProvince" class="screenRegion" style="width:20%;" ><option value="0" >省份/自治区</option></select> 
											<select id="srcCity" class="screenRegion" style="width:20%;" disabled><option value="0" >城市/自治州</option></select>
											<select id="srcTown" class="screenRegion" style="width:20%;" disabled><option value="0">区/县</option></select>
										</div>
										<div class="screenType">
											<span style="color:#000; font-size: 12px;">期望流向：</span>
											<select id="destProvince" class="screenRegion" style="width:20%;" ><option value="0" >省份/自治区</option></select> 
											<select id="destCity" class="screenRegion" style="width:20%;" disabled><option value="0">城市/自治州</option></select>
											<select id="destTown" class="screenRegion" style="width:20%;" disabled><option value="0">区/县</option></select>
											<span class="screenBtn" onclick="search()">确定</span>
										</div>
										<div class="screenType">
											<span style="color:#000; font-size: 12px;">车型：</span>
											<span id="carType" style="margin-left: 20px;">
												<span class="searchOptions selected" data="-1" onclick="selectTag('carType',this)">不限</span>
												<c:forEach items="${CarTypeDictsList}" var="info">
													<span class="searchOptions" data="${info.Code}" onclick="selectTag('carType',this)">${info.Name}</span>
												</c:forEach>
											</span>
										</div>
										<div class="screenType">
											<span style="color:#000; font-size: 12px;">载型：</span>
											<span id="carLoadType" style="margin-left: 20px;">
												<span class="searchOptions selected" data="-1" onclick="selectTag('carLoadType',this)">不限</span>
												<c:forEach items="${CarLoadDictsList}" var="info">
													<span class="searchOptions" data="${info.Code}" onclick="selectTag('carLoadType',this)">${info.Name}</span>
												</c:forEach>
											</span>
										</div>
										<!-- <div class="screenType">
											<span style="color:#000; font-size: 12px;">车牌号：</span>
											<input type="text" placeholder="请输入车牌号" class="screenRegion" maxlength="10">
										</div> -->
									</div>
								<div class="searchResultBar">
									<div class="searchResult">
										<table id="list">
											<!-- 异步列表展示处 -->
										</table>
									</div>
									<div class="fz0">
										<div class="pageSize" id="pageSize0"></div>
										<div class="m-style M-box0"></div>
									</div>
									<div class="fz0">
										<div class="pageSize" id="pageSize1"></div>
										<div class="m-style M-box1"></div>
									</div>
									<div class="fz0">
										<div class="pageSize" id="pageSize2"></div>
										<div class="m-style M-box2"></div>
									</div>
								</div>
								</div>
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>

	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	</div>
</body>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script src="${ctx}/static/js/plugins/pagination/jquery.pagination.js"></script> 
<script type="text/javascript">
var isBox0 = true;
var tags = 0;
$(function() {
	if('${entranceId}'==3600009){
		$(".nav-content a:eq(3)").addClass("on");
		$(".second-menu p:eq(2) a:eq(0)").addClass("on");
	}else{
		$(".nav-content a:eq(2)").addClass("on");
		$(".second-menu p:eq(0) a:eq(0)").addClass("on");
	}
	$(".source-room a").removeClass("on");
	$(".source-room a:eq(12)").addClass("on");
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("on");
		$(this).click(function(){
			$(this).addClass("on").siblings().removeClass("on");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
			var type = $("#type").val();
			if(index==0){
				$("#kind").val(1);
				$("#list").empty();
				isBox0 = true;
				
				$('.M-box1').hide();
				$('#pageSize1').hide();
				$('.M-box2').hide();
				$('#pageSize2').hide();
				getWanjiCarList(1,6);					
			}else if(index==1){
				$("#kind").val(2);
				$("#list").empty();
				isBox1 = true;
				$('.M-box0').hide();
				$('#pageSize0').hide();
				$('.M-box2').hide();
				$('#pageSize2').hide();
				getWanjiGoodsList();
			}else if(index==2){
				$("#kind").val(3);
				$("#list").empty();
				isBox2 = true;
				$('.M-box0').hide();
				$('#pageSize0').hide();
				$('.M-box1').hide();
				$('#pageSize1').hide();
				getWanjiCollectList(1,6);
			}
		});
    });
	//地址字典
	getWanjiArea(-1, 1, 1, 1);
	getWanjiArea(-1, 1, 2);
	//车源列表
	if('${entranceId}' == '3609009') {
		getWanjiArea('360000',2,1,1);
		getWanjiCarList(1,6,1);
	} else { getWanjiCarList(1,6);}
	
	$("#srcProvince").change(function(){
		getWanjiArea($(this).val(),2,1);
	});
	$("#destProvince").change(function(){
		getWanjiArea($(this).val(),2,2);
	});
	
	$("#srcCity").change(function(){
		getWanjiArea($(this).val(),3,1);
	});
	$("#destCity").change(function(){
		getWanjiArea($(this).val(),3,2);
	}); 
	$(".optionBtnRel").click(function(){
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}else{
			$(this).addClass("selected");
		}
	});
});

function getWanjiArea(parent, areaKind, addKind, flag){
	var flag = flag;
	if(parent==0){
		if(addKind==1){
			if(areaKind==2){
				$("#srcCity").empty();
				$("#srcCity").append('<option value="0">城市/自治州</option>');
				$("#srcCity").attr("disabled","disabled");
				$("#srcTown").empty();
				$("#srcTown").append('<option value="0">区/县</option>');
				$("#srcTown").attr("disabled","disabled");
			}else if(areaKind==3){
				$("#srcTown").empty();
				$("#srcTown").append('<option value="0">区/县</option>');
				$("#srcTown").attr("disabled","disabled");
			}
		}else if(addKind==2){
			if(areaKind==2){
				$("#destCity").empty();
				$("#destCity").append('<option value="0">城市/自治州</option>');
				$("#destCity").attr("disabled","disabled");
				$("#destTown").empty();
				$("#destTown").append('<option value="0">区/县</option>');
				$("#destTown").attr("disabled","disabled");
			}else if(areaKind==3){
				$("#destTown").empty();
				$("#destTown").append('<option value="0">区/县</option>');
				$("#destTown").attr("disabled","disabled");
			}
		}
		return;
	}
	
	if(addKind==1){
		if(areaKind==2){
			$("#srcTown").empty();
			$("#srcTown").append('<option value="0">区/县</option>');
			$("#srcTown").attr("disabled","disabled");
		}
	}else if(addKind==2){
		if(areaKind==2){
			$("#destTown").empty();
			$("#destTown").append('<option value="0">区/县</option>');
			$("#destTown").attr("disabled","disabled");
		}
	}
	
	if(areaKind==2){
		if(addKind==1){
			$("#srcCity").removeAttr("disabled");
		}else if(addKind==2){
			$("#destCity").removeAttr("disabled");
		}
	}else if(areaKind==3){
		if(addKind==1){
			$("#srcTown").removeAttr("disabled");
		}else if(addKind==2){
			$("#destTown").removeAttr("disabled");
		}
	}
	
	$.ajax({
		url:"${ctx}/logistics/wanji/json/getAddress",
		type:"get",
		data:{"parent":parent},
		dataType:"json",
		success:function(result){
			if(areaKind==2){
				if(addKind==1){
					$("#srcCity").empty().append('<option value="0">城市/自治州</option>');
				}else if(addKind==2){
					$("#destCity").empty().append('<option value="0">城市/自治州</option>');
				}
			}else if(areaKind==3){
				if(addKind==1){
					$("#srcTown").empty().append('<option value="0">区/县</option>');
				}else if(addKind==2){
					$("#destTown").empty().append('<option value="0">区/县</option>');
				}
			}
			//'<option value="0">省份/自治区</option>';
			for(var i=0;i<result.length;i++){
				var info = result[i];
				var _div = '<option value="'+info.CODE+'">'+info.NAME+'</option>';
				if(areaKind==1){
					if(addKind==1){
						$("#srcProvince").append(_div);
					}else if(addKind==2){
						$("#destProvince").append(_div);
					}
				}else if(areaKind==2){
					if(addKind==1){
						$("#srcCity").append(_div);
					}else if(addKind==2){
						$("#destCity").append(_div);
					}
				}else{
					if(addKind==1){
						$("#srcTown").append(_div);
					}else if(addKind==2){
						$("#destTown").append(_div);
					}
				}
				if('${entranceId}' == '3609009' && flag == 1) {
					if(info.CODE == '360000'){
						$("#srcProvince option:eq("+(i+1)+")").attr("selected","selected");
					}
					if(info.CODE == '360900'){
						$("#srcCity option:eq("+(i+1)+")").attr("selected","selected");
						flag == 2;
					}
				}
			}
		},
		error:function(){
			layer.msg("地址请求超时，请刷新页面！");
		}
	});	
}

function ityzl_SHOW_LOAD_LAYER(){  
    return layer.msg('努力中...', {icon: 16,shade: [0.5, '#f5f5f5'],scrollbar: false,time:100000}) ;  
} 

function getWanjiCarList(pageNum, pageSize, flag){
	$('#list').empty();
	//获取搜索条件值
	var AdCode = 0;
	var TargetAdCode = 0;
	var TypeCode = -1;
	var CarLoadType = -1;
	if(!$("#srcTown").attr("disabled")){
		AdCode = $("#srcTown").val();
		if(AdCode==0){
			AdCode = $("#srcCity").val();
		}
	}else{
		if(!$("#srcCity").attr("disabled")){
			AdCode = $("#srcCity").val();
			if(AdCode==0){
				AdCode = $("#srcProvince").val();
				if(flag == 1) { AdCode = '360900'}
			}
		}else{
			AdCode = $("#srcProvince").val();
		}
	}
	
	if(!$("#destTown").attr("disabled")){
		TargetAdCode = $("#destTown").val();
		if(TargetAdCode==0){
			TargetAdCode = $("#destCity").val();
		}
	}else{
		if(!$("#destCity").attr("disabled")){
			TargetAdCode = $("#destCity").val();
			if(TargetAdCode==0){
				TargetAdCode = $("#destProvince").val();
			}
		}else{
			TargetAdCode = $("#destProvince").val();
		}
	}
	$("#carType .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			TypeCode = $(this).attr("data");
		}
	});
	
	$("#carLoadType .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			CarLoadType = $(this).attr("data");
		}
	});
	
	var index = null;
	var param = {
			"${_csrf.parameterName}" : '${_csrf.token}',
			"Take" : pageSize,
			"Skip" : (pageNum-1)*pageSize,
			"AdCode" : AdCode,
			"TargetAdCode" : TargetAdCode,
			"TypeCode" : TypeCode,
			"CarLoadType" : CarLoadType
	}
	$.ajax({
		url:"${ctx}/logistics/wanji/json/getPlatCar",
		type:"post",
		data: param,
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
				//$('.searchResult').empty();
				var list = result.value;
				for(var i=tags;i<list.length;i++){
					var info = list[i];
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
						+'<td width="10%">'
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
 			if( 6 < total && pageNum == 1){
					if(isBox0){
						 isBox0 = false;
						 showPagination('.M-box0',total,getWanjiCarList,flag,6);
						}
					$('#pageSize0').show();
					$('#pageSize0').html('共检索到'+total+' 条数据，每页6条');
				}else if(6 >= total && pageNum == 1){
					$('.M-box0').hide();
					$('#pageSize0').hide();
				} 
			}else{
				$('.M-box0').hide();
				$('#pageSize0').hide();
			}
		},
		error:function(){
			layer.msg("列表加载失败，请刷新重试！");
		}
		
	});
}

function getWanjiGoodsList(){
	$('#list').empty();
	var index = null;
	$.ajax({
		url:"${ctx}/logistics/wanji/json/mylist",
		type:"post",
		data:{
			"${_csrf.parameterName}" : '${_csrf.token}'
		},
		dataType:"json",
		beforeSend:function(){
			index = ityzl_SHOW_LOAD_LAYER(); 
	    },
		success:function(result){
			layer.close(index);
			if(result.code==1){	
				var list = result.jsonValue.Cargoes;
				var total = result.jsonValue1.Total;
				$("#total").text(total);
				$("#totalUnit").text("次");
				$("#kindUnit").text("货源");
				for(var i=0;i<list.length;i++){
					var info = list[i];
					var Avatar = info.Avatar;
					var _div = "<tr>";
				/* 	if(i>5){
						_div += '<tr class="hidden">';
					}else{
						_div += '<tr>';
					} */
					_div += '<td width="5%">'
						+'<img src="${ctx}/static/image/logistics/headPortrait.png" width="62" height="62" style="margin:0 8px;">'
						+'</td>'
						+'<td width="10%" style="text-align:left;">'
						+'<img src="${ctx}/static/image/logistics/currentLocation.png" width="30" height="30">'
						+'<span class="resultAdd">'+info.SrcName+'</span>'
						+'</td>'
						+'<td width="10%">'
						+'<span class="resultConnect">'
						+'<div>'+info.StrTypeCode+'</div>'
						+'<img src="${ctx}/static/image/logistics/directionLine.png" width="60" height="5" style="display:block;">'
						+'<div>'+info.SubTypeName+'</div>'
						+'</span>'
						+'</td>'
						+'<td width="10%">'
						+'<img src="${ctx}/static/image/logistics/destination.png" width="30" height="30">'
						+'<span class="resultAdd">'+info.DestName+'</span>'
						+'</td>'
						+'<td width="20%">'
						+'<span class="redLabel">'+info.StrCount+'</span><br>'
						+'<span class="redLabel">'+info.LimCarLength1+'&nbsp;'+info.LimCarLength2+'&nbsp;'+info.LimCarLength2+'米</span>'
						+'</td>'
						+'<td width="15%">';
						if(Avatar == null || Avatar == ""){
							_div += '<img src="${ctx}/static/image/logistics/headPortrait.png" width="50" height="50" style="border-radius:50%; overflow:hidden;">';
						}else{
							_div += '<img src="'+Avatar+'" width="50" height="50" style="border-radius:50%; overflow:hidden;">';
						}
						_div += '<span class="resultName">'
						+'<div>'+info.Contact+'</div>'
						+'<div width="37" style="display:block;" class="resultConnect">'+info.StrPrice+'</div>'
						+'</span>'
						+'</td>'
						+'<td width="10%">'
						+'<span class="resultTime">'+info.StrCreateDt+'</span>'
						+'</td>'
						+'<td width="5%">'
						+'</td>'
						+'<td width="10%">'
						+'<span class="" >'+info.Phone+'</span>'
						+'</td>'
						+'</tr>';
					$("#list").append(_div);
					
				}
				if( 5 < total){
					if(isBox1){
						 isBox1 = false;
						 showPagination('.M-box1',total,getWanjiGoodsList,'',5);
						}
					$('#pageSize1').show();
					$('#pageSize1').html('共检索到'+total+' 条数据，每页6条');
				}else if(5 >= total ){
					$('.M-box1').hide();
					$('#pageSize1').hide();
				}  
			}else{
				if(result.code==-2){
					layer.msg("亲，您还没登录！");
				}else if(result.code==4){
					layer.msg(result.msg);
				}
				$("#getMore").hide();
			}
		},
		error:function(){
			layer.msg("列表加载失败，请刷新重试！");
		}
		
	});
}

function getWanjiCollectList(pageNum,pageSize){
	$('#list').empty();
	var index = null;
	$.ajax({
		url:"${ctx}/logistics/wanji/json/collectList",
		type:"post",
		data:{
			"${_csrf.parameterName}" : '${_csrf.token}',
			"pageSize" : pageSize ,
			"pageNum" : pageNum
		},
		dataType:"json",
		beforeSend:function(){
			index = ityzl_SHOW_LOAD_LAYER(); 
	    },
		success:function(result){
			layer.close(index);
			if(result.code==1){
			    $("#pageNum").val(Number(pageNum)+1);
				var list = result.value;
				var total = result.jsonValue.total; 
				$("#total").text(total);
				$("#totalUnit").text("辆");
				$("#kindUnit").text("收藏车源");
				for(var i=0;i<list.length;i++){
					var info = list[i];
					var carTypeName = info.carTypeName;
					var carLoadTypeName = info.carLoadTypeName;
					var avatar = info.driverAvatar;
					
					if(carTypeName == null){
						carTypeName = "";
					}
					if(carLoadTypeName == null){
						carLoadTypeName = "";
					}
					if(avatar == null){
						avatar = "${ctx}/static/image/logistics/headPortrait.png";
					}
					
					var _div = '<tr>'
						+'<td width="10%">'
						+'<img src="${ctx}/static/image/logistics/headPortrait.png" width="62" height="62" style="margin:0 8px;">'
						+'</td>'
						+'<td width="10%" style="text-align:left;">'
						+'<img src="${ctx}/static/image/logistics/currentLocation.png" width="30" height="30">'
						+'<span class="resultAdd">'+info.curPlace+'</span>'
						+'</td>'
						+'<td width="10%">'
						+'<span class="resultConnect">'
						+'<div>'+carTypeName+'</div>'
						+'<img src="${ctx}/static/image/logistics/directionLine.png" width="60" height="5" style="display:block;">'
						+'<div>'+carLoadTypeName+'</div>'
						+'</span>'
						+'</td>'
						+'<td width="10%">'
						+'<img src="${ctx}/static/image/logistics/destination.png" width="30" height="30">'
						+'<span class="resultAdd">全国</span>'
						+'</td>'
						+'<td width="20%" style="text-align:left;">'
						+'<span class="redLabel">载重:'+info.carLoad+'吨</span><br>'
						+'<span class="redLabel">车长:'+info.carLength+'&nbsp;车宽:'+info.carWidth+'米</span>'
						+'</td>'
						+'<td width="15%" style="text-align:left;">'
						+'<img src="'+avatar+'" width="50" height="50" style="border-radius:50%; overflow:hidden;">'
						+'<span class="resultName">'
						+'<div>'+info.driverName+'</div>';
						if(info.isAuth){
							_div += '<img src="${ctx}/static/image/logistics/authentication.png" width="37" style="display:block;">';
						}
					_div += '</span>'
						+'</td>'
						+'<td width="10%" style="text-align:left;">'
						+'<span class="resultTime">'+getTime(info.activeDate)+'</span>'
						+'</td>'
						+'<td width="5%">'
						+'<img src="${ctx}/static/image/logistics/alreadyCollect.png" class="collect" width="20" height="20" style="cursor:pointer;" data='+JSON.stringify(info)+' onclick="collect(this)">'
						+'</td>'
						+'<td width="10%">'
						+'<span class="detailsBtn" data='+JSON.stringify(info)+' onclick="detail(this)">查看详情</span>'
						+'</td>'
						+'</tr>';
					$("#list").append(_div);
					
				}
				if( 6 < total && pageNum == 1){
					if(isBox2){
						 isBox2 = false;
						 showPagination('.M-box2',total,getWanjiCollectList,0,6);
						}
					$('#pageSize2').show();
					$('#pageSize2').html('共检索到'+total+' 条数据，每页6条');
				}else if(6 >= total && pageNum == 1){
					$('.M-box2').hide();
					$('#pageSize2').hide();
				} 
			}else{
				if(result.code==-2){
					layer.msg("亲，您还没登录！");
				}else if(result.code==4){
					layer.msg(result.msg);
				}
				$("#getMore").hide();
			}
		},
		error:function(){
			layer.msg("列表加载失败，请刷新重试！");
		}
		
	});
}


function getMore(){
	var type = $("#type").val();
	var kind = $("#kind").val();
	var pageNum = $("#pageNum").val();
	if(kind==1){
		getWanjiCarList(pageNum,6);
	}else if(kind==3){
		getWanjiCollectList(pageNum,6);
	}else{
		$("#list tr").each(function(){
			if($(this).hasClass("hidden")){
				$(this).removeClass("hidden");
			}
		});
		$("#getMore").hide(); 
	}
}

function detail(obj){
	$("#info").val("("+$(obj).attr("data")+")");
	$("#detailForm").attr("action","${ctx}/logistics/detail?entranceId=${entranceId}").submit();
}

function collect(obj){
	var info =  eval("("+$(obj).attr("data")+")");
	var kind = $("#kind").val();
	var carId = null;
	if(kind==1){
		carId = info.Id;
	}else if(kind==3){
		carId = info.carId;
	}
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
					if(kind==3){
						$(obj).parent().parent().remove();
					}
					info.isCollect = "false";
					$(obj).parent().next().children().attr("data",JSON.stringify(info));
					layer.msg("取消收藏成功！");
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

function selectTag(id, obj){
	$("#"+id+" .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}
	});
	$(obj).addClass("selected");
}

function search(){
	var type = $("#type").val();
	$("#list").empty();
	isBox0 = true;
	getWanjiCarList(1,6);
}
function add(){
	if('${accountId}' == ''){
		return tips("亲，请先登陆哦！");
	}
	location.href='${ctx}/logistics/add?entranceId=${entranceId}';
}
</script>
</html>
