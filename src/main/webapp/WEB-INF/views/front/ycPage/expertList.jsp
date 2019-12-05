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
<title>专家服务</title>
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
			    	<p class="navTitle">专家服务</p>
			    	<p><font class="projectNum" id="projectNum1">0</font>&nbsp;
				<font id="font1">个</font> &nbsp;&nbsp; <font id="font2">专家</font></p>
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
									<li class="on" id="li1">全部专家</li>
								</ul>
								<div class="searchBar">
									<input type="text" id="searchKey" name="searchKey" placeholder="标题关键字" style="border-radius: 4px;border: 1px solid #e1e1e1;"/>
									<img src="${ctx}/static/image/homePage_yc/seach.png" width="15" onclick="search()">
								</div>
								<input type="hidden" id="type" value="0" />
								<input type="hidden" id="pageNum" value="1" />
							</div>
							<div class="searchKeyBox">
								<div class="searchKeys searchKeys1">
									<div class="searchOptions"><span>类别</span></div>
									<div class="searchOptions options" id="declareGrade1">
										<div class="optionBtn selected" value="" onclick="selectByKey(this,'');">全部</div>
									</div>
									<div class="searchOptions open">展开</div>
								</div>
								<div class="searchKeys searchKeys2" >
									<div class="searchOptions"><span>地域</span></div>
									<div class="searchOptions options" id="declareGrade2"></div>
								</div>
							</div>	
							<div class="title-items">
								<div class="title-content" id="set0">
									<div id="allList">
									</div>
									<div class="fz0">
										<div class="pageSize" id="pageSize0"></div>
										<div class="m-style M-box0"></div>
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
var isAdd = false;
var columnId = "";
var areaId = '';
var isBox0 = true;
$(function(){
	if('${entranceId}'==3600009){
		$(".nav-content a:eq(3)").addClass("on");
		$("#thirdMenu p:eq(2) a:eq(0)").addClass("on");
	}else{
		$(".nav-content a:eq(2)").addClass("on");
		$(".second-menu p:eq(2) a:eq(0)").addClass("on");
	}
	$(".source-room a").removeClass("on");
	getTypeList();
	getInfoList(1,10,'');
	getArea();
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
function selectByKey2(obj, id) {
	$("#pageNum").val("1")
	var pageNum = Number($("#pageNum").val());
	$(".searchKeys2 .optionBtn").removeClass("selected");
	$(".searchKeys2 .optionBtn").each(function() {
		var $ind = $(this).text().indexOf("(");
		var t = $(this).text().substring(0, $ind)
		if ($ind > -1) {
			$(this).text(t)
		}
		isBox0 = true;
	})
	$(obj).addClass("selected");
	areaId = id;
	$("#declareGrade2 .optionBtn").each(function() {
		if ($(this).hasClass("selected")) {
		}
		isBox0 = true;

	});
	getInfoList(pageNum, 10);
}
function search(){
	isBox0 = true;
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
function getTypeList(){
	$.ajax({
		url : "${urlPath}XOffice/interface/json/accurateAssistance/expertTypeList",
		type : "post",
		data : '',
		dataType : "json",
		success:function(result){
			var list = result.list;
			if(result.success){
				for(var i = 0;i<list.length;i++){
					var _div = '<div class="optionBtn" onclick="selectByKey(this,\''+list[i].valueId+'\');">'+list[i].valueName+'</div>';
					$('#declareGrade1').append(_div);
				}
			}
		}
	})
	
}
 function getInfoList(pageNum,pageSize){ 
	$('#pageNum').val(pageNum);
	if (areaId == '360000') {
		areaId = ''
	};
	$.ajax({
		url : "${urlPath}XOffice/interface/json/assistExpertInfo/list",
		type : "post",
		data : {
			"pageNum" : pageNum,
			"pageSize" : pageSize,
 			"areaId" : areaId,
 			"typeId" : columnId,
 			"expertName": $('#searchKey').val()
		},
		dataType : "json",
		success:function(result){
          	$('#allList').empty();
			var infoList = result.list;
			$('#projectNum1').text(result.total);
			if(result.total>0){
		 		for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var text = "";
					if(info.introduction){
						text = info.introduction;
						text = text.replace(/<(table|tr|td|%)[\s\S]*?\/\1>/ig,"");
						text = text.replace(/<[^>]+>/g,"");
					}
					var _div =   '<div class="declareDataBar expert-item">'
						+'<a  target="_blank" href="${ctx}/expert/detail/'+info.expertId+'?entranceId=${entranceId}">'
						+	'<div class="text-box"><div class="text-box_title">';
				    	_div += '<div class="title-text"><div class="declareTitle">';
						_div += info.expertName+'</div>'
						+'<div class="declareData">'
						+	'<font>级别：'+(info.dutyLevel==undefined?'暂无':info.dutyLevel)+'</font>'
						+	'<font>类别：'+(info.typeName==undefined?'暂无':info.typeName)+'</font>'
						+	'<font>专长：'+(info.expertise==undefined?'暂无':info.expertise)+'</font>'
						+'</div>'
						+'</div></div><div class="declare-content">'+text+'</div></div>'
						if(info.imageUrl){
						 _div += '<div class="img-box" style="background-image:url('+info.imageUrl+')"></div>'+'</a></div>';
						}else{
							_div += '</a></div>';
							$('.declareDataBar').css('width','100%');
						}
						
		           		 $('#allList').append(_div);
				} 
		 		$(".optionBtn").each(function() {
					if ($(this).hasClass("selected")&& pageNum == 1) {
							var $ind = $(this).text().indexOf("(");
							var t = $(this).text().substring(0, $ind)
							if ($ind > -1) {
								$(this).text(t)
							}
							$(this).text($(this).text() + "("+ result.total+ ")");

							}
						})
			 		setTimeout(function() {
							$(".options").each(function(){
								if($(this).height() < 40){
									$(this).siblings(".open").hide();
								}
							})
						}, 500);  
	       		if ( 10 < result.total && pageNum ==1) {
					if(isBox0){
						 isBox0 = false;
						 showPagination('.M-box0',result.total,getInfoList);
					}
					$('#pageSize0').show();
					$('#pageSize0').html('共检索到'+result.total+' 条数据，每页10条');
				} else if(10 >= result.total && pageNum ==1){
					$('.M-box0').hide();
					$('#pageSize0').hide();
				}
			}else{
				$(".optionBtn").each(function() {
					var $ind = $(this).text().indexOf("(");
					var t = $(this).text().substring(0, $ind)
					if ($ind > -1) {
					$(this).text(t)
					}
					$(this).text($(this).text());
				});
				$('#allList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
				$('.M-box0').hide();
				$('#pageSize0').hide();
			}
			
		},
		error:function(){
			//tips("请求超时，请稍后重试");
			},
		});
}
function selectByKey(obj,id){
	columnId = id
	$(".searchKeys1 .optionBtn").removeClass("selected");
	$(".searchKeys1 .optionBtn").each(function() {
		var $ind = $(this).text().indexOf("(");
		var t = $(this).text().substring(0, $ind)
		if ($ind > -1) {
			$(this).text(t)
		}
		isBox0 = true;
	})
	$(obj).addClass("selected");
	$("#declareGrade1 .optionBtn").each(function() {
		if ($(this).hasClass("selected")) {
		}
		isBox0 = true;
	});
	getInfoList(1, 10);
}
 function dateToTimeStr(str,fmatter){
	  return formatDate(new Date(str), fmatter);
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
</script>
</html>
<!-- ç±»å1 -->