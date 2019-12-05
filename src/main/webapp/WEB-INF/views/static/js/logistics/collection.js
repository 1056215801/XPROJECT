
//收藏车源

 var imgId1;	
 var imgId2;	

function collect1(info,url) {
	var IsAuth;
	imgId1 = info.Id;
	if (info.IsAuth) {
		IsAuth = 1;
	} else {
		IsAuth = 0;
	}
	var IsCompany;
	if (info.IsCompany) {
		IsCompany = 1;
	} else {
		IsCompany = 0;
	}
	var IsCarAuth;
	if (info.IsCarAuth) {
		IsCarAuth = 1;
	} else {
		IsCarAuth = 0;
	}
	var Avatar;
	if(info.Avatar==""||info.Avatar==null){
		Avatar="";
	}
	
	var ActiveDt= info.ActiveDt;
	ActiveDt=ActiveDt.substring(0,10);
	$.ajax({
		url : url+"/logistics/wanji/json/collectCar",
		type : "get",
		data : {
			"carId":info.Id,
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
			
		},
		success : function(result) {
				if (result.code == 1) {
					$('#seconds1').html(3);
					layer.open({
						type : 1,
						title : '提示',
						skin : 'layui-layer-tl_green',
						shadeClose : true,
						area : [ '250px', '150px' ],
						time : '3000',
						content : $('#addToCollection'),
						success:function(){
							setTimeout(function(){
								$('#seconds1').html(2);
								setTimeout(function(){$('#seconds1').html(1);},1000);
							},1000);
						}
					});
					$('#' + imgId1).each(function(index, obj) {
						$(obj).attr("src",
								url+"/static/weixin/images/logistics/alreadyCollect.png");
					});
					
					$("#MatchisCollect").empty();
					$("#MatchisCollect").html("已收藏");

			} else if (result.code==-2) { 
				layer.msg("请先登录");
			}else{
				layer.msg(result.msg);
			}
		
		},
		error : function() {
			layer.msg("网络连接错误!");
		}
	});
}

function cancelCollect(info,url){
	imgId1=info.Id;
	$.ajax({
		url : url+"/logistics/wanji/json/cancelCollect",
		type : "get",
		data : {
			"carId":info.Id,
		},
		success : function(result) {
				if (result.code == 1) {
					$('#seconds2').html(3);
					layer.open({
						type : 1,
						title : '提示',
						skin : 'layui-layer-tl_green',
						shadeClose : true,
						area : [ '250px', '150px' ],
						time : '3000',
						content : $('#cancelCollection'),
						success:function(){
							setTimeout(function(){
								$('#seconds2').html(2);
								setTimeout(function(){$('#seconds2').html(1);},1000);
							},1000);
						},
						end : function (){
							/*location.reload();*/
						}
					});
					$('#' + imgId1).each(function(index, obj) {
						$(obj).attr("src",
								url+"/static/weixin/images/logistics/notCollected.png");
					});
				
					$("#MatchisCollect").empty();
					$("#MatchisCollect").html("未收藏");

			}else if(result.code==-2){
				layer.msg("请先登录");

			} else { 
				layer.alert(result.msg);
			}
		
		},
		error : function() {
			layer.msg("网络连接错误!");
		}
	});
}




function collect2(info,url) {
	var IsAuth;
	imgId2 = info.Id;

	if (info.IsAuth) {
		IsAuth = 1;
	} else {
		IsAuth = 0;
	}
	var IsCompany;
	if (info.IsCompany) {
		IsCompany = 1;
	} else {
		IsCompany = 0;
	}
	var IsCarAuth;
	if (info.IsCarAuth) {
		IsCarAuth = 1;
	} else {
		IsCarAuth = 0;
	}

	$.ajax({
		url : url+"/logisticsInfo/saveCollectionInfo",
		type : "get",
		data : {
			"plateNum" : info.plateNum,
			"name" : info.name,
			"telphone" : info.telphone,
			"isAuth" : IsAuth,
			"isCompany" : IsCompany,
			"isCarAuth" : IsCarAuth,
			"carWidth" : info.carWidth,
			"carLength" : info.carLength,
			"carLoad" : info.carLoad,
			"carLoadTypeName" : info.carLoadTypeName,
			"carTypeName" : info.carTypeName,
		},
		success : function(result) {
			var infoN = jQuery.parseJSON(result);
			if (infoN.success) {
				if (infoN.errorMsg == "收藏成功") {
					$('#seconds1').html(3);
					layer.open({
						type : 1,
						title : '提示',
						skin : 'layui-layer-tl_green',
						shadeClose : true,
						area : [ '250px', '150px' ],
						time : '3000',
						content : $('#addToCollection'),
						success:function(){
							setTimeout(function(){
								$('#seconds1').html(2);
								setTimeout(function(){$('#seconds1').html(1);},1000);
							},1000);
						}
					});
					$('#' + imgId2).attr("src",
							url+"/static/weixin/images/logistics/alreadyCollect.png");

				} else {
					$('#seconds2').html(3);
					layer.open({
						type : 1,
						title : '提示',
						skin : 'layui-layer-tl_green',
						shadeClose : true,
						area : [ '250px', '150px' ],
						time : '3000',
						content : $('#cancelCollection'),
						success:function(){
							setTimeout(function(){
								$('#seconds2').html(2);
								setTimeout(function(){$('#seconds2').html(1);},1000);
							},1000);
						},
						end : function (){
							location.reload();
						}
					});
					$('#' + imgId2).attr("src",
							url+"/static/weixin/images/logistics/notCollected.png");
				}
			} else {
				layer.alert(infoN.errorMsg);
			}
		},
		error : function() {
			layer.alert("网络连接错误!");
		}
	});
}