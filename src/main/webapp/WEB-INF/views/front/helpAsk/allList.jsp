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
<title>帮你问问</title>
<link href="${ctx}/static/css/projectDeclare/projectApplication.css"rel="stylesheet" />
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
</head>

<body>
	<div class="project_main" style="background-color: #f3f3f4;">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<div class="project_content_header">
			<div class="container newNav">
			     <div class="newNavSub">
			     	<img src="${ctx}/static/image/homePage_yc/projectDsc.png" />
			     </div>
			    <div class="newNavSub">
			    	<p class="navTitle">帮你问问</p>
			    	<p><font class="projectNum" id="projectNum1">0</font>&nbsp;
				<font id="font1">条</font> &nbsp;&nbsp; <font id="font2">问题</font></p>
			     </div>
			</div>
		</div>
		<div class="project_artical">
			<input type="hidden" id="type" value="0" />
			<input type="hidden" id="pageNum" value="1" />
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-list">
							<div class="titleName" style="position: relative;">
								<ul>
									<li class="on"><a href="javascript:;" >全部问题</a></li>
									<li><a href="javascript:;">我的互动</a></li>
									<li><a href="javascript:;">我的提问</a></li>
									<li><a href="javascript:;">我的回复</a></li>
								</ul>
								<div class="searchBar">
									<input type="text" id="searchKey" name="searchKey" placeholder="标题关键字" style="border-radius: 4px;border: 1px solid #e1e1e1;"/>
									<img src="${ctx}/static/image/homePage_yc/seach.png" width="15" onclick="search()">
								</div>
							</div>
							<div class="titleItem">
								<div class="title-content" id="set0">
									<div id="allList"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize0"></div>
										<div class="m-style M-box0"></div>
									</div>
								</div>
								<div class="title-content" id="set1" style="display: none;">
									<div id="myApplyPro"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize1"></div>
										<div class="m-style M-box1"></div>
									</div>
								</div>
								<div class="title-content" id="set2" style="display: none;">
									<div id="mylist"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize2"></div>
										<div class="m-style M-box2"></div>
									</div>
								</div>
								<div class="title-content" id="set3" style="display: none;">
									<div id="askInfo"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize3"></div>
										<div class="m-style M-box3"></div>
									</div>
								</div>
							</div>
						</div>
		
					</div>
					<c:import url="/slideSelect" charEncoding="UTF-8">
					 	<c:param name="entranceId" value="${entranceId}" />
					</c:import>
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
var isBox0 = true
var isBox1 = true;
var isBox2 = true;
var isBox3 = true;
$(function(){
	if('${entranceId}'==3600009){
		$(".nav-content a:eq(6)").addClass("on");
	}else{
		$(".nav-content a:eq(2)").addClass("on");
		$(".second-menu p:eq(1) a:eq(0)").addClass("on");
	}
	$(".source-room a").removeClass("on");
	$(".fr li").eq(5).addClass("on");
	$(".fir-floor").show();
	$(".publish-btn h1").text('问题发布');
	
	$(".titleName li").on("click",function(){          //大项目tab切换
		var $ind = $(this).index();
		var accountId = '${accountId}';
		if($(this).hasClass("on")){ return ;}
		$("#type").val($ind);
		if ($ind == 0) {
			isBox0 = true;
			$('.searchBar').show();
			getInfoList(1, 10, $ind);
		}
		if ($ind == 1) {
			isBox1 = true;
			$('.searchBar').hide();
			if(getIsLogin()){
				getAnswerPush(1, 10, accountId);
			}else{
				layer.msg("亲，你还没有登陆。");
			}
		}
		if ($ind == 2) {
			isBox2 = true;
			$('.searchBar').show();
			if(getIsLogin()){
				myAsk(1, 10, accountId);
			}else{
				layer.msg("亲，你还没有登陆。");
			}
		}
		if ($ind == 3) {
			isBox3 = true;
			$('.searchBar').hide();
			if(getIsLogin()){
				getAnswerList(1, 10, accountId)
			}else{
				layer.msg("亲，你还没有登陆。");
			}
		}
		$(this).addClass("on").siblings().removeClass("on");
		$("#set"+$ind).siblings().fadeOut("fast");
		setTimeout(function(){$("#set"+$ind).fadeIn("fast");},200);
	});
	getInfoList(1,10,0);
	//回车触发搜索事件
	$("#searchKey").bind('keydown', function(event) {
		if (event.keyCode == "13") {
			search();
		}
	});
});
function search(){
	var type = $("#type").val();
	if(type==0){
		isBox0 = true;
		$('#allList').empty();
		getInfoList(1, 10, 0);
	}else if(type==2){
		isBox2 = true;
		if(getIsLogin()){
			myAsk(1, 10, '${accountId}');
		}
	}
}
function getInfoList(pageNum,pageSize,type){
	$('#pageNum').val(pageNum);
	if(type == "0"){
	$.ajax({
		url:"${urlPath}XOffice/interface/json/question/askInfo/askList",
		type:"get",
		data:{
				"pageNum": pageNum,
				"pageSize": pageSize,
				"askTitle": $('#searchKey').val()
			 },
		dataType:"json",
		success:function(result){
			if(result.errorCode==-1){
				layer.alert(result.msg);
			}else if(result.code==1){
				layer.msg(result.msg);
			}else{
				$('#allList').empty();
				$('#projectNum1').text(result.total);
				$('#font2').text('问题');
				var list = result.askList;
				var tagList = result.tagList;
				for(var i=0;i<list.length;i++){
					var info = list[i];
					if(info.askImgUrls){
						var img = info.askImgUrls.split(",")[0];
					}
					var _div =  '<div class="declareDataBar">'+
								'<a target="_blank" href="${ctx}/helpAsk/detail/'+info.askId+'?entranceId=${entranceId}">';
						if(info.askImgUrls == undefined){
							_div += '<div class="text-box" style="width: 100%;">';
						}else {
							_div += '<div class="text-box">';
						}
						_div += '<div class="declareTitle">';
						if(info.isSolved==1){
					  		_div += '<span class="flag flag4">已解决</span><span class="triang triang4"></span>';
				 		}
						_div += info.askTitle+'</div>'+
								'<div class="askIcons">'+
								'<img src="${ctx}/static/image/homePage_yc/ico@3x.png" style="margin-right: 10px;" width="20">'+
								typeLevel(tagList,info.askTagIds)+'&nbsp; '+
								info.browseNum + '阅读&nbsp; - &nbsp; ' +
								info.answerNum + '回复' +
								'</div>'+
								'</div>';
						if(info.askImgUrls != undefined){
							_div += '<img src="'+img+'" width="180px;" height="110px;">'
						}
						_div += '</a></div>';
					$('#allList').append(_div); 
				}
				if(result.total > 10 &&pageNum == 1){
					if(isBox0){
						 isBox0 = false;
						 showPagination('.M-box0',result.total,getInfoList,type);
						}
					$('#pageSize0').show();
					$('#pageSize0').html('共检索到'+result.total+' 条数据，每页10条');
				}else if(result.total <= 10 &&pageNum == 1){
					$('#pageSize0').hide();
					$('.M-box0').hide();
				}
				if(result.total == 0){
					$('.M-box0').hide();
					$('#pageSize0').hide();
					var div = "<div style='width:100%; text-align: center; padding: 100px 0;'>暂无更多信息</div>"
					$('#allList').html(div); 
				}
			} 
		},
		error:function(){
			tips("请求超时，请稍后重试");
			},
		});
	}
	if (type == "1") {
		if(getIsLogin()){
			getAnswerPush(1, 10, '${accountId}');
		}else{
			layer.msg("亲，你还没有登陆。");
		}
	}
	if (type == "2") {
		if(getIsLogin()){
			myAsk(1, 10, '${accountId}');
		}else{
			layer.msg("亲，你还没有登陆。");
		}
	}
	if (type == "3") {
		if(getIsLogin()){
			getAnswerList(1, 10, '${accountId}')
		}else{
			layer.msg("亲，你还没有登陆。");
		}
	}
}
function getAnswerPush(pageNum, pageSize) {
	$.ajax({
				url : "${urlPath}XOffice/interface/json/question/answerPush/answerPushList",
				type : "get",
				data : {
					"pageNum" : pageNum,
					"pageSize" : pageSize,
					"accountId" : '${accountId}'
				},
				dataType : "json",
				success : function(result) {
					$('#myApplyPro').empty();
					if (result.errorCode == -1) {
						layer.msg(result.msg);
					} else if (result.code == 1) {
						layer.msg(result.msg);
					} else {
						var list = result.answerPushList;
						$('#projectNum1').text(result.total);
						$('#font2').text('互动');
						for (var i = 0; i < list.length; i++) {
							var info = list[i];

							var _div = '<div class="declareDataBar">'
									+ '<a  target="_blank" href="${ctx}/helpAsk/detail/'+info.askId+'?entranceId=${entranceId}">'
									+ '<div>'
									+ '<div style="height: 30px;line-height: 30px;font-size: 16px;">'
									+ info.createTimeStr
									+ '</div>';
								if(info.answerAccountId == '${accountId}'){
									_div += '<div style="height: 30px;color: #666;line-height: 30px;font-size: 16px;">你回答了：'
										+ '<font style="color: #333;font-size: 18px;text-decoration: underline;">'
										+ info.askTitle
										+ '</font>'
										+ '</div>';
								}else {
									_div += '<div style="height: 30px;color: #666;line-height: 30px;font-size: 16px;">收到<font style="color:#0af;">'+info.answerAccountNick+'</font>的回答：'
										+ '<font style="color: #333;font-size: 18px;text-decoration: underline;">'
										+ info.askTitle
										+ '</font>'
										+ '</div>';
								}
									_div += '<div style="margin-top: 20px;font-size: 16px;">他的回答：'
									+ info.answerContent
									+ '</div>' + '</div>' + '</a>'
									+ '</div>';

							$('#myApplyPro').append(_div);
						}
						if(result.total > 10 &&pageNum == 1){
							if(isBox1){
								 isBox1 = false;
								 showPagination('.M-box1',result.total,getAnswerPush,'');
								}
							$('#pageSize1').show();
							$('#pageSize1').html('共检索到'+result.total+' 条数据，每页10条');
						}else if(result.total <= 10 &&pageNum == 1){
							$('.M-box1').hide();
							$('#pageSize1').hide();
						}
						if(result.total == 0){
							$('.M-box1').hide();
							$('#pageSize1').hide();
							var div = "<div style='width:100%; text-align: center; padding: 100px 0;'>暂无更多信息</div>"
							$('#myApplyPro').html(div); 
						}
					}
				},
				error : function() {
					tips("请求超时，请稍后重试");
				},
			});
}
function myAsk(pageNum, pageSize) {
	$.ajax({
			url : "${urlPath}XOffice/interface/json/question/askInfo/askList",
			type : "get",
			data : {
				"pageNum" : pageNum,
				"pageSize" : pageSize,
				"accountId" : '${accountId}',
				"askTitle": $('#searchKey').val()
			},
			dataType : "json",
			success : function(result) {
				$('#mylist').empty();
				if (result.errorCode == -1) {
					layer.msg(result.msg);
				} else if (result.code == 1) {
					layer.msg(result.msg);
				} else {
					$('#mylist').empty();
					$('#projectNum1').text(result.total);
					$('#font2').text('提问');
					var list = result.askList;
					var tagList = result.tagList
					
					for (var i = 0; i < list.length; i++) {
						var info = list[i];
						if(info.askImgUrls){
							var img = info.askImgUrls.split(",")[0];
						}
						var _div =  '<div class="declareDataBar">'+
									'<a target="_blank" href="${ctx}/helpAsk/detail/'+info.askId+'?entranceId=${entranceId}">';
							if(info.askImgUrls == undefined){
								_div += '<div class="text-box" style="width: 100%;">';
							}else {
								_div += '<div class="text-box">';
							}
							_div += '<div class="declareTitle">';
							if(info.isSolved==1){
						  		_div += '<span class="flag flag4">已解决</span><span class="triang triang4"></span>';
					 		}
							_div += info.askTitle+'</div>'+
									'<div class="askIcons">'+
									'<img src="${ctx}/static/image/homePage_yc/ico@3x.png" style="margin-right: 10px;" width="20">'+
									typeLevel(tagList,info.askTagIds)+'&nbsp; '+
									info.browseNum + '阅读&nbsp; - &nbsp; ' +
									info.answerNum + '回复' +
									'</div>'+
									'</div>';
							if(info.askImgUrls != undefined){
								_div += '<img src="'+img+'" width="180px;" height="110px;">'
							}
							_div += '</a></div>';
						$('#mylist').append(_div);
					}
					if(result.total >5 &&pageNum ==1 ){
						if(isBox2){
							 isBox2 = false;
							 showPagination('.M-box2',result.total,myAsk,'',5);
							}
						$('#pageSize2').show();
						$('#pageSize2').html('共检索到'+result.total+' 条数据，每页10条');
					}else if (result.total <= 5 &&pageNum ==1){
						$('.M-box2').hide();
						$('#pageSize2').hide();
					}
					if(result.total == 0){
						$('.M-box2').hide();
						$('#pageSize2').hide();
						var div = "<div style='width:100%; text-align: center; padding: 100px 0;'>暂无更多信息</div>"
						$('#mylist').html(div); 
					}
				}
			},
			error : function() {
				tips("请求超时，请稍后重试");
			}
		});
}

function getAnswerList(pageNum, pageSize) {
	$.ajax({
				url : "${urlPath}XOffice/interface/json/question/answerInfo/answerList",
				type : "get",
				data : {
					"pageNum" : pageNum,
					"pageSize" : pageSize,
					"accountId" : '${accountId}'
				},
				dataType : "json",
				success : function(result) {
					$('#askInfo').empty();
					if (result.errorCode == -1) {
						layer.msg(result.msg);
					} else if (result.code == 1) {
						layer.msg(result.msg);
					} else {
						$('#projectNum1').text(result.total);
						$('#font2').text('回复');
						var list = result.answerList;
						
						for (var i = 0; i < list.length; i++) {
							var info = list[i];

							var _div = '<div class="declareDataBar">'
									+ '<a target="_blank" href="${ctx}/helpAsk/reply/'+info.answerId+'">'
									+ '<div>'
									+ '<div style="height: 40px;line-height: 40px;font-size: 18px;">问题：'
									+ info.askTitle
									+ '</div>'
									+ '<div style="height: 30px;line-height: 30px;font-size: 16px;">回复：'
									+ '<font style="font-size: 16px;">'
									+ info.answerContent
									+ '</font>'
									+ '</div>'
									+ '<div style="margin-top: 20px;color: #666;font-size: 14px;">'
									+ info.createTimeStr
									+ '</div>' + '</div>' + '</a>'
									+ '</div>';

							$('#askInfo').append(_div);
						}
						if(result.total >10 &&pageNum ==1 ){
							if(isBox3){
								 isBox3 = false;
								 showPagination('.M-box3',result.total,getAnswerList,'');
								}	
							$('#pageSize3').show();
							$('#pageSize3').html('共检索到'+result.total+' 条数据，每页10条');
						}else if (result.total <= 10 &&pageNum ==1){
							$('.M-box3').hide();
							$('#pageSize3').hide();
						}
						if(result.total == 0){
							$('.M-box3').hide();
							$('#pageSize3').hide();
							var div = "<div style='width:100%; text-align: center; padding: 100px 0;'>暂无更多信息</div>"
							$('#askInfo').html(div); 
						}
					}
				},
				error : function() {
					tips("请求超时，请稍后重试");
				}
			});
}
function getIsLogin() {
	var flag = false;
	$.ajax({
			url : "${ctx}/session/account/isLogin",
			type : "get",
			async: false, 
			dataType : "json",
			success : function(result) {
				flag = result.success;
			},
			error : function() {
				tips("请求超时，请稍后重试");
			}
		});
	return flag;
}
function typeLevel(list, ids) {
	var str = "";
	var arr = ids.split(",");
	for (var i = 0; i < arr.length; i++) {
		for (var j = 0; j < list.length; j++) {
			if (arr[i].toString() == list[j].tagId.toString()) {
				str += list[j].tagName + "&nbsp; &nbsp;";
			}
		}
	}
	return str;
}

function add() {
	if('${accountId}' == ''){
		return tips("亲，请先登陆哦！");
	}
	location.href='${ctx}/helpAsk/add?entranceId=${entranceId}';
}

function getmore() {
	var pageNum = Number($("#pageNum").val()) + 1;
	
	getInfoList(pageNum, 10, $("#type").val());
}
</script>
</html>

