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
<title>产业动态</title>
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
			    	<p class="navTitle">产业动态</p>
			    	<p><font class="projectNum" id="projectNum1">0</font>&nbsp;
				<font id="font1">条</font> &nbsp;&nbsp; <font id="font2">产业动态</font></p>
			     </div>
			</div>
		</div>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-list">
							<div class="titleName clearfix">
								<ul>
									<li class="on">全部动态</li>
								</ul>
							</div>
							<div class="searchKeyBox">
								<div class="searchOptions open">展开</div>
								<div class="searchKeys">
									<div class="searchOptions" id="declareGrade">
										<div class="optionBtn selected" value="" onclick="selectByKey(this,'');">全部</div>
									</div>
									<div style="clear: both;"></div>
								</div>
							</div>
							<div class="title-items">
								<input type="hidden" id="pageNum" value="1" />
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
var isBox0 = true
var columnId = "";
$(function(){
	/* $(".nav-content a").removeClass("on");
	$(".nav-content a:eq(1)").addClass("on") */;
	$(".second-menu li:eq(0) a:eq(1)").addClass("on");
	$(".source-room a").removeClass("on");
	$(".source-room a:eq(5)").addClass("on");
	$(".fr li").eq(1).addClass("on");
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
	getInfoList(1,10,'');
	var msg = '${message}';
	if(msg!=null&&msg!=""){
		tips(msg);
		msg=null;
	}
});
	
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
 function getInfoList(pageNum,pageSize){ 
	$('#pageNum').val(pageNum);
	$.ajax({
		url : "${urlPath}XOffice/interface/json/columnInfo/getPublicColumnNewsInfoList",
		data : {
			"pageNum" : pageNum,
			"parkId" : "${entranceId}",
			"pageSize" : pageSize,
			"columnId" : columnId ,
		},
		dataType : "json",
		success:function(result){
          	$('#allList').empty();
			var map = result.columnInfo;
			if(pageNum == 1&& isAdd == false){
				for(var key in map){
						var _div = "";
						_div += '<div class="optionBtn" value=\''+key+'\' onclick="selectByKey(this,\''+key+'\');">'
						_div += map[key]
						_div += '</div>'
						$('#declareGrade').append(_div);
					}
				isAdd = true;
			}
			
			$('.projectNum').text(result.total);
			var infoList = result.value;
			var number = 0;
			if(result.total>0){
		 		for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var id = info.columnId;
					var text = info.newsContent;
					text = text.replace(/<(table|tr|td|%)[\s\S]*?\/\1>/ig,"");
					text = text.replace(/<[^>]+>/g,"");
					var _div =   '<div class="declareDataBar">'
	 					_div += '<a target="_blank" href="${ctx}/industry/detail/'+info.newsId+'?entranceId=${entranceId}">'
	 					if(info.imageUrl){
	 						_div +=	'<div class="text-box"><div class="text-box_title">';
	 					}else{
	 						_div +=	'<div class="text-box" style="width:100%;"><div class="text-box_title">';
	 					}		
				    	for(var key in map){
				    		if(info.columnId == key){
				    			if(key == '90020180505100129800054000000001'){
					    			_div += '<img src="${ctx}/static/image/homePage_yc/zhengcewj.jpg">';
				    			}else if(key == '90020180528141721800058000000001'){
				    				_div += '<img src="${ctx}/static/image/homePage_yc/lidian.jpg">';
				    			}else if(key == '90020180528141731800058000000002'){
				    				_div += '<img src="${ctx}/static/image/homePage_yc/zhongyi.jpg">';
				    			}
				    		}
				    	}
				    	_div += '<div class="title-text">';
				    	_div += '<div class="declareTitle">';
						_div += info.newsTitle+'</div>'
						+'<div class="declareData">'
						+	'<font>发布时间：'+dateToTimeStr(info.createTime,'yyyy-MM-dd')+'</font></div>'
						+'</div></div><div class="declare-content">'+text+'</div></div>'
						if(info.imageUrl){
						 _div += '<img src="'+info.imageUrl+'">'+'</a></div>';
						}else{
							_div += '</a></div>';
						}
						
		           		 $('#allList').append(_div);
				} 
	       		$(".optionBtn").each(function(){
					if($(this).hasClass("selected")){
						if(result.total!=0&&pageNum == 1){
							 var $ind = $(this).text().indexOf("(");
							 var t = $(this).text().substring(0,$ind)
							 if($ind > -1){ $(this).text(t)}
							$(this).text($(this).text() + "("+result.total+")");
						}
					}
				})
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
				$('.M-box0').hide();
				$('#pageSize0').hide();
				$('#allList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
			}
			
		},
		error:function(){
			tips("请求超时，请稍后重试");
			},
		});
}
function selectByKey(obj,id){
	 columnId = id;
	 $(".searchKeys .optionBtn").each(function(){
		 var $ind = $(this).text().indexOf("(");
		 var t = $(this).text().substring(0,$ind)
		 if($ind > -1){ $(this).text(t)}
		 isBox0 = true;
	 })
	$(".searchKeys .optionBtn").removeClass("selected");
	$(obj).addClass("selected");
	getInfoList(1,10); 
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
 function getmore(){
	var pageNum = Number($("#pageNum").val())+1;
	var columnId = "";
	 $("#declareGrade .optionBtn").each(function(){
         if($(this).hasClass("selected")){
        	 columnId = $(this).val();
         }
     }); 
 	 getInfoList(pageNum,10,columnId);
 
 }
 
 
</script>
</html>
<!-- ç±»å1 -->