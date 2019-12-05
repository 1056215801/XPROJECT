<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<%@ include file="../common/page.jsp"%><!-- 前端分页 -->
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>项目申报</title>
<link href="${ctx}/static/css/projectDeclare/buttons.css" rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
<style type="text/css">
.timeLimit {
	position: absolute; right: 0px; top: 130px; font-size: 16px; width: 180px; text-align: center;
}

.timeLimitContGray {
	color: #a0a0a0;
}

.timeLimitContGreen {
	color: #329004;
}

.redFont {
	color: #f14241; font-weight: bold;
}
</style>
</head>
<body>
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
					<p class="navTitle">项目申报</p>
					<p>
						<font class="projectNum">${countApplying}</font>&nbsp;<font>项</font>&nbsp;&nbsp; <font>正在申报</font> &nbsp;&nbsp;&nbsp;&nbsp;<font class="projectNum">${countPulicity}</font>&nbsp;<font>项</font>
						&nbsp;&nbsp;<font>申报已公示</font>
					</p>
				</div>
			</div>
		</div>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-list">
							<div class="titleName">
								<ul>
									<li>宜春</li>
									<li>江西省</li>
									<li>申报过的项目</li>
									<li>已发项目</li>
								</ul>
								<div class="searchBar">
									<input type="text" id="searchKey" placeholder="标题关键字" style="border-radius: 4px; border: 1px solid #e1e1e1;" />
									<img src="${ctx}/static/image/homePage_yc/seach.png" width="15" height="15" onclick="search();">
								</div>
								<input type="hidden" id="type" value="0" />
								<input type="hidden" id="pageNum" value="1" />
								<input type="hidden" id="areaId" value="360000" />
								<input type="hidden" id="declareGrade" value="" />
								<input type="hidden" id="declareStatus" value="" />
							</div>
							<div class="searchKeyBox">
								<div class="searchOptions open">展开</div>
								<div class="searchKeys searchKeys1">
									<div class="searchOptions">
										<span>级别状态</span>
									</div>
									<div class="searchOptions options" id="declareGrade">
										<div class="optionBtn selected" onclick="selectByKey(this,0,4);">全部</div>
										<div class="optionBtn" onclick="selectByKey(this,'国家级',2);">国家级</div>
										<div class="optionBtn" onclick="selectByKey(this,'省级',2);">省级</div>
										<div class="optionBtn" onclick="selectByKey(this,'市级',2);">市级</div>
										<div class="optionBtn" onclick="selectByKey(this,'县级',2);">县级</div>
										<div class="optionBtn" onclick="selectByKey(this,'其他',2);">其他</div>
										<div class="optionBtn" onclick="selectByKey(this,0,3);">申报中</div>
										<div class="optionBtn" onclick="selectByKey(this,2,3);">已公示</div>
										<div class="optionBtn" onclick="selectByKey(this,1,3);">已截止</div>
									</div>
								</div>
								<div class="searchKeys searchKeys2">
									<div class="searchOptions">
										<span>地域</span>
									</div>
									<div class="searchOptions options" id="declareGrade2"></div>
								</div>
							</div>
							<div class="title-items">
								<div class="title-content" id="set0">
									<div id="ycList"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize0"></div>
										<div class="m-style M-box0"></div>
									</div>
								</div>
								<div class="title-content" id="set1" style="display: none;">
									<div id="allList"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize1"></div>
										<div class="m-style M-box1"></div>
									</div>
								</div>
								<div class="title-content" id="set2" style="display: none;">
									<div id="myApplyPro"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize2"></div>
										<div class="m-style M-box2"></div>
									</div>
								</div>
								<div class="title-content" id="set3" style="display: none;">
									<div id="mylist"></div>
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
		<div id="authorityTips" style="display: none;">
			<div>
				<img src="${ctx}/static/image/projectDeclare/headPortrait.png" width="90px;" height="90px;" style="display: block; margin: 25px auto;">
				<div style="margin: 0 auto 30px; color: #aaa; text-align: center;">你当前账号未开通发布项目权限</div>
				<div style="width: 80%; margin: 0 auto;">
					<input type="button" class="button button-raised button_Contral" style="width: 37%;" value="暂不申请">
					<input type="button" class="button button-raised button-caution button_Contral" style="width: 58%;" value="我要申请">
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
var isBox2 = true
var isBox3 = true
var isadd = true
$(function(){
	console.log("rootKind:"+"${rootKind}");
	getArea();
	if ( Number('${entranceId}') == 3609009 ) {
		$('.titleName li:eq(0)').show();
		$('.titleName li:eq(0)').addClass("on").siblings().removeClass("on");
		$('#set0').show().siblings().hide();
		$("#type").val('0');
		$("#areaId").val('360900');
		
		$(".searchKeys #declareGrade2 .optionBtn").removeClass("selected");
		$(".searchKeys #declareGrade2").find(".optionBtn:eq(10)").addClass("selected");
	} else if (Number( '${entranceId}') == 3600009 ) {
		$('.titleName li:eq(0)').hide();
		$('.titleName li:eq(1)').addClass("on").siblings().removeClass("on");
		$('#set1').show().siblings().hide();
		$("#type").val('1');
		$("#areaId").val('360000');
	}
	getInfoList(1);
	$(".nav-content a:eq(4)").addClass("on");
	$(".source-room a").removeClass("on");

	var $l = 0;    //判断是否要展开
	$(".options").each(function(){ $l += $(this).height();})
	if($l < 40){ $(".open").hide();}
	else { $(".searchKeyBox").css("height","45px");}
	
	$(".open").on("click",function() { //展开收起筛选项
		$(this).toggleClass("on");
		var $l = 0;
		$(".options").each(function(){ $l += $(this).height() + 10;})
		if($(this).hasClass("on")) { 
			$(".searchKeyBox").css("height", $l + 'px');
			$(".open").text("收起");
		}
		else { 
			$(".searchKeyBox").css("height","45px");
			$(".open").text("展开");
		}
	})
	$(".titleName li").on("click",function(){          //大项目tab切换
		var $ind = $(this).index();
		if($ind == 0){
			$(".searchBar").show();
			$(".searchKeys1").show();
			$(".searchKeys2").show();
			$("#areaId").val('360900');
			isBox0 = true;
		}else if ($ind == 1){
			$(".searchBar").show();
			$(".searchKeys1").show();
			$(".searchKeys2").show();
			$("#areaId").val('360000');
			isBox1 = true;
		}else {
			if($ind == 2){
				$(".searchBar").hide();
				$(".searchKeys1").hide();
				isBox2 = true;
			}else if($ind == 3){
				$(".searchBar").show();
				$(".searchKeys1").show();
				isBox3 = true;
			}
			$(".searchKeys2").hide();
			$("#areaId").val('360000');
			if ('${accountId}' == '') {
				layer.msg('亲，您还没登录!');
				return;
			}
		}
		$("#declareGrade").val('');
		$("#declareStatus").val('');
		$(".searchKeys .optionBtn").removeClass("selected");   //重置选项
		$(".searchKeys").each(function() {
			if($(this).find(".options").attr("id") == 'declareGrade2') {
				if($ind == 0){
					$(this).find(".optionBtn:eq(10)").addClass("selected");
				}else if($ind == 1){
					$(this).find(".optionBtn:eq(1)").addClass("selected");
				}
			} else { 
				$(this).find(".optionBtn:eq(0)").addClass("selected");
			}
		})
		$(".searchKeys .optionBtn").each(function() {
			var $ind2 = $(this).text().indexOf("(");
			var t = $(this).text().substring(0, $ind2)
			if ($ind2 > -1) {
				$(this).text(t)
			}
		})
		$("#type").val($ind);
		getInfoList(1);
		$(this).addClass("on").siblings().removeClass("on");
		$("#set"+$ind).siblings().fadeOut("fast");
		setTimeout(function(){$("#set"+$ind).fadeIn("fast");},200);
		var $l = 0;    //判断是否要展开
		$(".options").each(function(){ $l += $(this).height();})
		$(".open").removeClass("on").text("展开");
		if($l < 45){ $(".searchKeyBox").css("height","45px"); $(".open").hide();} 
		else { $(".searchKeyBox").css("height","45px"); $(".open").show();}
	});
		
	//回车触发搜索事件
	$("#searchKey").bind('keydown', function(event) {
		if (event.keyCode == "13") {
			search();
		}
	});
});
function search(){
	var type = $('#type').val();
	if(type==0){
		isBox0 = true;
	}else if(type==1){
		isBox1 = true;
	}else if(type==2){
		isBox2 = true;
	}else{
		isBox3 = true;
	}
	getInfoList(1);
}
function authorityTips() { //权限提示弹框
	layer.open({
		type : 1,
		title : false,
		shadeClose : true,
		shade : [ 0 ],
		area : [ '500px', '280px' ],
		closeBtn : 0,
		content : $('#authorityTips')
	});
};
function createProject() {
	location.href = "createProject.html";
}
function getInfoList(pageNum){ //type: 0:全部项目 1:我申报的 2:已发项目
	$('#pageNum').val(pageNum);
 	var type = $('#type').val();
 	var $type = parseInt(type) - 1;
	var pageSize = 10;
	var param = {
		"pageNum":pageNum,
		"pageSize":pageSize,
		"type": $type < 0 ? 0 : $type,
		"areaId": $('#areaId').val(),
		"declareGrade": $('#declareGrade').val(),
		"declareStatus": $('#declareStatus').val(),
		"declareTitle": $('#searchKey').val()
	};
	$.ajax({
		url:"${ctx}/projectDeclare/json/list",
		type:"post",
		data: param,
		dataType:"json",
		success:function(result){
			if(result.code==-1 || result.code==-2){ layer.alert(result.msg);}
			else if(result.code==2){
				if(type == 3){ $('#mylist').html('<div class="noMoreData"><span class="renovateTitle">暂无更多信息</span></div>');}
				if(type == 2){ $('#myApplyPro').html('<div class="noMoreData"><span class="renovateTitle">暂无更多信息</span></div>');}
				if(type == 1){ $('#allList').html('<div class="noMoreData"><span class="renovateTitle">暂无更多信息</span></div>');}
				if(type == 0){ $('#ycList').html('<div class="noMoreData"><span class="renovateTitle">暂无更多信息</span></div>');}
				$(".searchKeys .optionBtn").each(function() {
					var $ind2 = $(this).text().indexOf("(");
					var t = $(this).text().substring(0, $ind2)
					if ($ind2 > -1) {
						$(this).text(t)
					}
				})
			}else{
				var list = result.value;
				var total = result.msg;
				if(type == 0) { $('#ycList').empty();}
				if(type == 1) { $('#allList').empty();}
				if(type == 2) { $('#myApplyPro').empty();}
				if(type == 3) { $('#mylist').empty();}
				if ( 10 < total && pageNum ==1) {
					  if(type==0){
						  if(isBox0){
								 isBox0 = false;
								 showPagination('.M-box0',total,getInfoList,type);
							}
						     $('#pageSize0').show();
							 $('#pageSize0').html('共检索到'+total+' 条数据，每页10条');
					  }else if(type==1){
						  if(isBox1){
								 isBox1 = false;
								 showPagination('.M-box1',total,getInfoList,type);
							}
						  	 $('#pageSize1').show();
							 $('#pageSize1').html('共检索到'+total+' 条数据，每页10条');
					  }else if(type==2){
						  if(isBox2){
								 isBox2 = false;
								 showPagination('.M-box2',total,getInfoList,type);
							}
						     $('#pageSize2').show();
							 $('#pageSize2').html('共检索到'+total+' 条数据，每页10条');
					  }else{
						  if(isBox3){
								 isBox3 = false;
								 showPagination('.M-box3',total,getInfoList,type);
							}
						     $('#pageSize3').show();
							 $('#pageSize3').html('共检索到'+total+' 条数据，每页10条');
					  }
				  }else if(10 >= total && pageNum ==1){
						  if(type==0){
							$('.M-box0').hide();
							$('#pageSize0').hide();
					  }else if(type==1){
							$('.M-box1').hide();
							$('#pageSize1').hide();
					  }else if(type==2){
							$('.M-box2').hide();
							$('#pageSize2').hide();
					  }else{
							$('.M-box3').hide();
							$('#pageSize3').hide();
					  }
				  }
				$(".optionBtn").each(function() {              //给标签加上数量
					if ($(this).hasClass("selected")) {
						var $ind = $(this).text().indexOf("(");
						var t = $(this).text().substring(0, $ind)
						if ($ind > -1) {
							$(this).text(t)
						}
						$(this).text($(this).text() + "(" + total + ")");
					}
				})
				for(var i=0;i<list.length;i++){
					var info = list[i];
					var text = "";
					if(info.declareText != "" && info.declareText != undefined){
						text = info.declareText;
						text = text.replace(/<(table|tr|td|%)[\s\S]*?\/\1>/ig,"");
						text = text.replace(/<[^>]+>/g,"");
					}
					
							  
					var _div =   '<div class="declareDataBar" style="position: relative;">'
						+'<a target="_blank"  href="${ctx}/declare/detail/'+info.declareId+'?entranceId=${entranceId}">'
						+	'<div class="text-box"><div class="text-box_title">';
					if(info.declareGrade=="国家级"){
				  		  _div += '<img src="/XProject/static/image/homePage_yc/level1.png" />';
				 		  }else if(info.declareGrade=="省级"){
							_div += '<img src="/XProject/static/image/homePage_yc/level2.png" />';
							}else if(info.declareGrade=="市级"){
							_div += '<img src="/XProject/static/image/homePage_yc/level3.png" />';
							}else if(info.declareGrade=="县级"){
							_div += '<img src="/XProject/static/image/homePage_yc/level4.png" />';
							}else{
							_div += '<img src="/XProject/static/image/homePage_yc/level5.png" />';
							}

				    _div += '<div class="title-text"><div class="declareTitle">';
					if(info.declareStatus==0){
				  		_div += '<span class="flag flag1">申报中</span><span class="triang triang1"></span>';
			 		} else if( info.declareStatus == 1) {
						_div += '<span class="flag flag2">已截止</span><span class="triang triang2"></span>';
					} else {
						_div += '<span class="flag flag3">已公示</span><span class="triang triang3"></span>';
					}
					var remainTips =nvlStr(info.endDate)==""?nvlStr(info.declareRemark):info.endDate>0?('剩余 ' + info.endDate + ' 天'):info.endDate==0?'今天截止':'';
					_div += info.declareTitle+'</div>'
						+'<div class="declareData">'
						+	'<font>发布时间：'+info.createTimeStr+'</font>'
						+	'<font>项目级别：'+info.declareGrade+'</font>'
						+	'<font>主管单位：'+info.supervisorName+'</font>'
						+	'</div>'
						+'</div></div><div class="declare-content">'+text+'</div></div>'
						+'<div class="text-img">'
						+'	<img src="'+info.declareImage+'">'
						+'	<div class="text-imgTip">'
						+'		<div class="text-imgLimit">' +
						(info.declareStatus == 1? '申报已截止' : info.declareStatus == 0?remainTips:'')
						+'</div>'
						+'	</div>';
						if(info.applyYc == "1"){
							if(info.applyOnline==1){
								_div +='	<div class="declareOperBtn" id="declareOperBtn1" data="'+info.declareId+'">在线申报</div>'
							}else{
								_div +='	<div class="declareOperBtn" id="declareOperBtn2">在线申报</div>'
							}
						}
						+'</div>'
						//+'<div class="timeLimit"><div class=' + (info.endDate==-1? '"timeLimitContGray">申报已截止' : (info.endDate==null?'"timeLimitContGreen">常年有效':('"timeLimitContGreen">剩余<font class="redFont"> ' + info.endDate + '  </font>天'))) + '</div></div>'
						+'</a></div>';
					  
					if(type == 0) { $('#ycList').append(_div);}
					if(type == 1) { $('#allList').append(_div);}
					if(type == 2) { $('#myApplyPro').append(_div);}
					if(type == 3) { $('#mylist').append(_div);}
				}
			}
			
			$("#declareOperBtn1").on('click',function(){
				if('${accountId}'==''){
					tips('亲，您还没有登录');
				}else if('${detail.declareStatus}' == 1){
					layer.msg("该项目已截止申报");
				}else{
					if("${rootKind}"==3){
						var declareId = ($(this).attr('data')).toString();
						onlineDeclare(declareId);
					}else{
						layer.msg("非企业用户不能申报");
					}
				}
	        	return false;
	        });
			
			$("#declareOperBtn2").on('click',function(){
				tips('该申报不允许在线申报，请线下联系！');
				return false;
			});
			
		},
		error:function(){
			tips("请求超时，请稍后重试");
			},
		});
}

function selectByKey(e,val,kind){
	if(kind == 1){
		$("#areaId").val(val);
	}
	if(kind == 2){
		$("#declareGrade").val(val);
		$("#declareStatus").val('');
	}
	if(kind == 3){
		$("#declareStatus").val(val);
		$("#declareGrade").val('');
	}
	if(kind == 4){
		$("#declareStatus").val('');
		$("#declareGrade").val('');
	}
	var type = $('#type').val();
	if(type==0){
		isBox0 = true;
	}else if(type==1){
		isBox1 = true;
	}else if(type==2){
		isBox2 = true;
	}else{
		isBox3 = true;
	}
	$(e).parent().find(".optionBtn").each(function() {
		var $ind = $(this).text().indexOf("(");
		var t = $(this).text().substring(0, $ind)
		if ($ind > -1) {
			$(this).text(t)
		}
	})
	$(e).addClass("selected").siblings().removeClass("selected");
	getInfoList(1);
}

function getArea() {
	var areaList = [ {
		title : "全部",
		value : "-2",
	}, {
		title : "全省",
		value : "360000",
	}, {
		title : "南昌市",
		value : "360100",
	}, {
		title : "景德镇市",
		value : "360200",
	}, {
		title : "萍乡市",
		value : "360300",
	}, {
		title : "九江市",
		value : "360400",
	}, {
		title : "新余市",
		value : "360500",
	}, {
		title : "鹰潭市",
		value : "360600",
	}, {
		title : "赣州市",
		value : "360700",
	}, {
		title : "吉安市",
		value : "360800",
	}, {
		title : "宜春市",
		value : "360900"
	}, {
		title : "抚州市",
		value : "361000"
	}, {
		title : "上饶市",
		value : "361100"
	} ];
	for (var i = 0; i < areaList.length; i++) {
		var map = areaList[i];
		var _div = "";
		if (map.title == '全省') {
			_div += '<div class="optionBtn selected" value=\'' + map.value
					+ '\'  onclick="selectByKey(this,\'' + map.value
					+ '\',1);">'
		} else {
			_div += '<div class="optionBtn" value=\'' + map.value
					+ '\'  onclick="selectByKey(this,\'' + map.value
					+ '\',1);">'

		}
		_div += map.title
		_div += '</div>'
		$('#declareGrade2').append(_div);
	}
}
	function onlineDeclare(declareId){
		$.ajax({
			url:"${urlPath}XOffice/interface/json/projectOnlineInfo/detailProject",
			type:"post",
			data:{
				declareId: declareId,
				rootId:"${rootId}"
			},
			dataType:"json",
			success:function(result){
				if(result.value!=undefined && result.value!="" && result.value!=null){
					console.log("status:"+result.value.status)
					if(result.value.status==0 || result.value.status==2 ||result.value.status==4){
						isadd=true;
					}else{
						isadd=false;
					}
				}else{
					isadd=true;
				}
				if(isadd){
					window.location.href = "${ctx}/projectDeclare/onlineCreate?entranceId=${entranceId}&declareId="+declareId;
				}else{
					layer.msg("您所在企业已提交申报信息，正在审核中，请耐心等待！");
				}
			},
			error:function(){
				tips("请求超时，请稍后重试");
			},
		});
	}
	
	/* 非空字符串 */
	function nvlStr(str){
		if(str==null || str==undefined){
			return "";
		}
		return str;
	}

</script>
</html>
