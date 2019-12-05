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
<title>园区招聘</title>
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
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
			    	<p class="navTitle">园区招聘</p>
			    	<p>
			    	<font class="projectNum" id="projectNum1"></font>&nbsp; <font id="font1">个</font>  &nbsp;&nbsp; <font id="font2">企业</font>
					&nbsp;&nbsp;&nbsp;&nbsp;<font class="projectNum" id="projectNum2"></font>&nbsp;<font>条</font>&nbsp;&nbsp;<font>企业招聘信息</font>
					&nbsp;&nbsp;&nbsp;&nbsp;<font class="projectNum" id="projectNum3"></font>&nbsp; <font id="font3">个</font>  &nbsp;&nbsp;
					 <font id="font4">岗位</font>
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
									<li class="on" id="li1">宜春</li>
									<li id="li2">全省</li>
								</ul>
								<div class="searchBar">
									<input type="text" id="searchKey" name="searchKey" placeholder="标题关键字" style="border-radius: 4px;border: 1px solid #e1e1e1;"/>
									<img src="${ctx}/static/image/homePage_yc/seach.png" width="15" onclick="search()">
								</div>
								<input type="hidden" id="type" value="0" />
								<input type="hidden" id="pageNum" value="1" />
							</div>
							<div class="searchKeyBox">
								<div class="searchKeys searchKeys1" >
									<div class="searchOptions"><span>年份</span></div>
									<div class="searchOptions options" id="declareStatus">
	 									<div class="optionBtn selected"  value="" onclick="selectByKey(this,1);">全部</div>
	 										<div class="optionBtn" id="currentYear" onclick="selectByKey(this,1);"></div>
											<div class="optionBtn" id="lastYear" onclick="selectByKey(this,1);"></div>
									</div>
									<div class="searchOptions open">展开</div>
								</div>
								<div class="searchKeys searchKeys2">
									<div class="searchOptions"><span>园区</span></div>
									<div class="searchOptions options" id="declareGrade">
	 									<div class="optionBtn selected"  value="" onclick="selectByKey(this,2);">全部</div>
									</div>
								</div>
								<div class="searchKeys searchKeys3" style="display: none">
									<div class="searchOptions"><span>地域</span></div>
									<div class="searchOptions options" id="declareGrade2"></div>
								</div>
							</div>	
							<div class="title-items">
								<div class="title-content" id="set0">
									<div id="ycList">
	
									</div>
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
var searchList;
var areaId = 360900;
var year = "";
var parkId = "";
var recruitTitle = "";
var time = "";
var isBox0 = true
var isBox1 = true
$(function(){
	console.log('${entranceId}')
	getSearchList();
	if('${entranceId}'==3600009){
		$(".nav-content a:eq(3)").addClass("on");
		$("#thirdMenu p:eq(0) a:eq(1)").addClass("on");
	}else{
		$(".nav-content a:eq(2)").addClass("on");
		$(".second-menu p:eq(0) a:eq(1)").addClass("on");
	};
	$(".nav-content a").removeClass("on");
	$(".source-room a").removeClass("on");
	$(".source-room a:eq(11)").addClass("on");
	 var entranceId = '${entranceId}';
	if(entranceId==3609009){
		areaId = 360900;
	}else{
		areaId = "";
	}
	if ('${entranceId}' == '3609009') {
		$('#li1').show();
		$("#li2").removeClass("on");
		$("#li1").addClass("on");
		$('#set0').show();
		$("#type").val('0');
		$('.searchKeys2').show();
		$('.searchKeys3').hide();
	} else {
		$('#li1').hide();
		$("#li1").removeClass("on");
		$("#li2").addClass("on");
		$('#set0').hide();
		$('#set1').show();
		$("#type").val('1');
		$('.searchKeys2').hide();
		$('.searchKeys3').show();
	}	
	if($(".searchKeyBox").height() < 40){$(".open").hide();}        //判断是否要展开
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
	//加载地址
		getArea();
 	$(".titleName li").on("click",function(){          //大项目tab切换
 		$('#pageNum').val(1);
		 var $ind = $(this).index();
 	      if($ind==0){
 	    	areaId = 360900;
 			$('.searchKeys2').show();
 			$('.searchKeys3').hide();
 			var isBox0 = true;
 			time = "";
 	     }else{
 	    	areaId = "";
 			$('.searchKeys2').hide();
 			$('.searchKeys3').show();
 			parkId = "";
 			time = "";
 			var isBox1 = true
 	     } 
		 $('#type').attr('value',$ind);
		 $(".searchKeys1 .optionBtn").removeClass("selected");
		 $(".searchKeys1 .optionBtn:eq(0)").addClass("selected");
		 $(".searchKeys2 .optionBtn").removeClass("selected");
		 $(".searchKeys3 .optionBtn").removeClass("selected");
		 $(".searchKeys3 .optionBtn:eq(0)").addClass("selected");
		 $(".searchKeys2 .optionBtn:eq(0)").addClass("selected");
		 $(".searchKeys1 .optionBtn").each(function(){
			 if($(this))
			 var $ind = $(this).text().indexOf("(");
			 var t = $(this).text().substring(0,$ind)
			 if($ind > -1){ $(this).text(t)}
		 })
	 	 $(".searchKeys2 .optionBtn1").each(function(){
		 var $ind = $(this).text().indexOf("(");
		 var t = $(this).text().substring(0,$ind)
		 if($ind > -1){ $(this).text(t)}
		 })
		 $(this).addClass("on").siblings().removeClass("on");
		 $("#set"+$ind).siblings().fadeOut("fast");
		 setTimeout(function(){$("#set"+$ind).fadeIn("fast");},200);
		 getInfoList(1,10);
		var $l = 0;    //判断是否要展开
		$(".options").each(function(){$l += $(this).height() + 10;
		})
		$(".open").removeClass("on").text("展开");
		if($l < 40){$(".open").hide();} 
		else { $(".searchKeyBox").css("height","45px"); $(".open").show();}
	}); 
	getInfoList(1,10);
	
	var msg = '${message}';
	if(msg!=null&&msg!=""){
		tips(msg);
		msg=null;
	}
	//回车触发搜索事件
	$("#searchKey").bind('keydown', function(event) {
		if (event.keyCode == "13") {
			search();
		}
	});
});
function getArea() {
	var areaList = [ {
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
					+ '\'  onclick="selectByKey2(this,' + map.value
					+ ');">'
		} else {
			_div += '<div class="optionBtn" value=\'' + map.value
					+ '\'  onclick="selectByKey2(this,' + map.value
					+ ',2);">'

		}
		_div += map.title
		_div += '</div>'
		$('#declareGrade2').append(_div);
	}

}
function getSearchList(){
	 var date=new Date;
	 var year=date.getFullYear();
	 $('#currentYear').html(year);
	 $('#currentYear').attr('value',year);
	 $('#lastYear').html(year-1);
	 $('#lastYear').attr('value',year-1);
	 var searchId = '${entranceId}';
		if(searchId==3609009){
			searchId = 360900;
	}
	$.ajax({
		url : "${urlPath}XOffice/interface/json/recruitManageInfo/areaCount",
		type : "post",
		data : {
			"areaId": searchId
		},
		dataType : "json",
		success : function(result) {
			var self = this;
			if(result.success){
				searchList = result.historyList.searchList;
				for(var i=0; i<searchList.length;i++){
					var list = searchList[i];
					var _div = "";
					_div += '<div class="optionBtn" value=\''+list.parkId+'\' onclick="selectByKey(this,2);">'
					_div += list.parkName
					_div += '</div>'
					$('#declareGrade').append(_div);
				}
				
			}else{
				layer.alert("系统异常");
			}
		},
		error : function() {
			layer.alert("系统异常");
		}
	});
}
function getInfoList(pageNum,pageSize){
	if (areaId == '360000') {
		areaId = '';
	}
	$('#pageNum').val(pageNum);
		$.ajax({
    		url : "${urlPath}XOffice/interface/json/recruitInfo/recruitList",
			type : "post",
			data : {
				"time": time,
				"recruitTitle":recruitTitle,
	 			"areaId": areaId,
                "parkId": parkId,
            	"pageNum":pageNum,
    			"pageSize":pageSize,
			},
			dataType : "json",
			success : function(result) {
/* 				console.log(result)
 */				var infoList = result.value;
				var count = result.count;
				if(count.total1&&count.total2&&count.total3){
					$('#projectNum1').text(count.total1);	
					$('#projectNum2').text(count.total2);	
					$('#projectNum3').text(count.total3);
					$('#projectNum1').show();
					$('#projectNum2').show();	
					$('#projectNum3').show();
					$('#font1').show();
					$('#font2').show();	
					$('#font3').show();
					$('#font4').show();
					
				}else{
					$('#projectNum1').hide();
					$('#projectNum2').text(result.total);	
					$('#projectNum3').hide();
					$('#font1').hide();
					$('#font2').hide();	
					$('#font3').hide();
					$('#font4').hide();
				}
				var type = $('#type').val();
				if(type==0){
				 	$('#ycList').empty();
			    }else if(type==1){
				 	$('#allList').empty();
			    }
				if(infoList.length>0){
					for(var i=0;i<infoList.length;i++){
						var info = infoList[i];
						var text = '';
						text = text.replace(/<(table|tr|td|%)[\s\S]*?\/\1>/ig,"");
						text = text.replace(/<[^>]+>/g,"");
						var _div =   '<div class="declareDataBar min-height">'
							   if(info.recruitUrl){
								   _div += '<a href="'+info.recruitUrl+'" target="_blank">'
							    }else{
							    	_div += '<a target="_blank" href="${ctx}/yc/detail?type=3&id='+info.parkId+'&time='+info.recruitTime+'&entranceId=${entranceId}">'
							    }
						     _div+= '<div class="text-box"><div class="text-box_title">';
					    	_div += '<div class="title-text"><div class="declareTitle">';
							_div += info.recruitTitle+'</div>'
							+'<div class="declareData">'
							+ '<font>发布时间：'+dateToTimeStr(info.recruitTime,'yyyy-MM-dd')+'</font>'
							+ '<font>所属园区：'+info.parkName+'</font>'
							+  '</div>'
							if(info.recruitDetail){
								_div +='<div class="declareData">'
								_div += '<font>招聘岗位：'+info.recruitDetail+'</font>'
								_div += '</div>'
							}
							+'</div></div><div class="declare-content">'+text+'</div></div>'
							 _div += '</a></div>';
							if(type==0){
								$('#ycList').append(_div);
							}else{
								$('#allList').append(_div);
							}
					}
					if(10<result.total&&pageNum==1){
						if(type==0){
							if(isBox0){
								 isBox0 = false;
								 showPagination('.M-box0',result.total,getInfoList,type);
								}
							$('#pageSize0').show();
							$('#pageSize0').html('共检索到'+result.total+' 条数据，每页10条');
						}else{
							if(isBox1){
								 isBox1 = false;
								 showPagination('.M-box1',result.total,getInfoList,type);
							}
							$('#pageSize1').show();
							$('#pageSize1').html('共检索到'+result.total+' 条数据，每页10条');
						}
					}else if(10 >= result.total && pageNum ==1){
						if(type==0){
							$('.M-box0').hide();
							$('#pageSize0').hide();
						}else{
							$('.M-box1').hide();
							$('#pageSize1').hide();
						}
					}
				}else{
					if(type==0){
						$('.M-box0').hide();
						$('#pageSize0').hide();
						$('#ycList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
					}else{
						$('.M-box1').hide();
						$('#pageSize1').hide();
						$('#allList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
					}

				}
			},
			error : function() {
				layer.alert("系统异常");
			}
		});
	}
function search(){
	recruitTitle = $('#searchKey').val();
	var type = $('#type').val();
	if(type==0){
		isBox0 = true;
	}else{
		isBox1 = true;
	}
	 getInfoList(1,10);
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

function selectByKey(obj,kind){
	$(obj).addClass("selected").siblings().removeClass("selected");
	var type =   $('#type').val();
	 if(kind==1){
		 $('#ycList').empty();
		 $(".searchKeys1 .optionBtn").each(function(){
			 var $ind = $(this).text().indexOf("(");
			 var t = $(this).text().substring(0,$ind)
			 if($ind > -1){ $(this).text(t)}
		 })
		 time = $(obj).attr('value');
		 isBox0 = true;
	}else{
		 $('#allList').empty();
		 $(".searchKeys2 .optionBtn").each(function(){
			 var $ind = $(this).text().indexOf("(");
			 var t = $(this).text().substring(0,$ind)
			 if($ind > -1){ $(this).text(t)}
		 })
		  parkId = $(obj).attr('value');
		 isBox0 = true;
	}
	 getInfoList(1,10); 
}
function selectByKey2(obj, id) {
	$("#pageNum").val("1")
	var pageNum = Number($("#pageNum").val());
	var type = $('#type').val();
	$(".searchKeys3 .optionBtn").removeClass("selected");
	$(".searchKeys3 .optionBtn").each(function() {
		var $ind = $(this).text().indexOf("(");
		var t = $(this).text().substring(0, $ind)
		if ($ind > -1) {
			$(this).text(t)
		}
		 isBox1 = true;
	})
	$(obj).addClass("selected");
	areaId = id;
	$("#declareGrade2 .optionBtn").each(function() {
		if ($(this).hasClass("selected")) {
		}
		 isBox1 = true;
	});
	 getInfoList(pageNum,10); 
}
 
</script>
</html>
