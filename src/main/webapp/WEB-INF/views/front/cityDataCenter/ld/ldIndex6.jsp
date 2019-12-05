<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/liData/ldHomePage.css"/>
<link  href="${ctx}/static/css/pagination/pager.css" rel="stylesheet" />
<title>产学研</title>
<style>

</style>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
<%-- 	<div class="nav">
		<div class="nav-text"><img src="${ctx}/static/image/liData/line.png"><font>锂电产学研</font><img class="rotate" src="${ctx}/static/image/liData/line.png"></div>
		<div class="return" onclick="location.href='${ctx}/front/ldDataCenter/index/1'"><img src="${ctx}/static/image/liData/back.png"><font>返回首页</font></div>
	</div> --%>
	<div class="container-fluid content2 container-fluid-new">
		<input type="hidden" id="kindId" value=""/>
		<div class="main">
		<div class="pro-left">
				<ul class="production" style="position: relative;">
					<li class="first-li" id="li0">
						<div class="product-type" id="product0">锂电专家</div>
					</li>
					<li class="first-li" id="li1">
						<div class="product-type" id="product1">科研机构</div>
					</li>
					<li class="first-li" id="li2"> 
						<div class="product-type" id="product2">产业峰会</div>
					</li>
				</ul>
 				<div class="seachView">
				     <div class="searchBar">
				        <div class="subBar">
				        	<input type="text" class="searchInput" id="searchKey" name="searchKey" placeholder="请输入关键字">
				     		<a><img width="20" href="javascript:;" onclick="goSearch()" src="${ctx}/static/image/liData/search.png"></a>
				        </div>
				     </div>
					 <div class="hotSearch" style="display:none;">
					 	<div class="subHot1">热门搜索：</div>
					 	<div class="subHot2" id="sub1">
					 		<span>锂离子电池</span>
					 		<span>锂硫电池</span>
			 		 		<span>锂空气电池</span>
					 		<span>电解液</span>
					 		<span>三元材料电池</span>
					 		<span>电池隔膜</span>
					 		<span>全固态电解质</span>
					 	</div>
					 	<div class="subHot2" id="sub2" style="display:none;">
					 		<span>石墨烯</span>
					 		<span>新能源汽车</span>
					 		<span>智能制造</span>
					 		<span>电源技术</span>
					 		<span>固体氧化物燃料电池</span>
				 		    <span>锂离子电池</span>
				 		    <span>电池极片精密挤压双面涂布</span>
					 	</div>
					 	<div class="subHot2" id="sub3" style="display:none;">
					 		<span>石墨</span>
					 		<span>动力电池 </span>
					 		<span>动力电池回收</span>
					 		<span>先进复合材料</span>
					 		<span>新能源汽车</span>
					 	</div>
					 </div>
					 <div class="totalSearch" id="total1">
					    <span>为您找到</span><font class="redT"></font><span>个符合条件的</span><span id="searchType"></span>
					 </div>
					  <div class="totalSearch" id="total2">
					    <span>对不起!没有搜到符合条件的内容</span>
					 </div>
					 <div class="cancleSearch" style="display:none;">
					 	<a href="javascript:;" onclick="canlceSearch()"><img width="15" style="margin-right:5px;" src="${ctx}/static/image/liData/cancle.png"><font>返回</font></a>
					 </div>
				</div>
			</div>
			<div class="pro-right boxStyle">
			   <div class="outsideBox otherOutsideBox">
				  		<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
					<div class="artical-box sicence-box">
					</div>
			   </div>
				<div  class="artical-foot science-foot">
				<div class="record"><font class="fffont" id="record"></font></font></div>
				<div class="page_search">
						<ul class="pagination" id="page">
						</ul>
						<div class="pageJump">
							<span>跳转到</span>
							<input type="text"/>
							<span>页</span>
							<button type="button" class="button">确定</button>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script> 
<script src="${ctx}/static/js/plugins/pagination/pager.js"></script> 
<script type="text/javascript">
var isChange = true;
var isPage = true;
var type = "";
	$(function () {	
		if('${type}'==0||'${type}'==''){
			$('#li0').addClass("on").siblings().removeClass("on");
			getAssistExpertInfoList(1,8,0);
			type = 0;
		}else if('${type}'==1){
			$('#li1').addClass("on").siblings().removeClass("on");
			getLiScienceType(1,0);
			type = 1;
		}else if('${type}'==2){
			$('#li2').addClass("on").siblings().removeClass("on");
			getIndustrialImage(1,6,0);
			type = 2;
		}
	 	$(".product-type").on("click",function(){
	 		isPage = true;
	 		$('.totalSearch').hide();
	 		$('.hotSearch').show();
	 		$('#searchKey').val('');
	 		$('.select').empty();
			$('.artical-box').empty();
			$('#pageNum').val('1')
	 		var text = $(this).text();
			$(this).parent().addClass("on").siblings().removeClass("on");
			$(this).parent().siblings().find(".product-item").slideUp();
			$(this).siblings(".product-item").slideDown();
			isChange = true;
			 $('.artical-box').empty();
			 $('.hotSearch').hide();
			if(text.indexOf('锂电专家')!=-1 ){
				type = 0;
				getAssistExpertInfoList(1,8,0);
				$('#sub1').show();
				$('#sub2').hide();
				$('#sub3').hide();
			}else if(text.indexOf('科研机构') !=-1){
				type = 1;
				getLiScienceType(1,0);
				$('#sub2').show();
				$('#sub1').hide();
				$('#sub3').hide();
			}else if(text.indexOf('产业峰会') !=-1){
				type = 2;
				isPage = true;
				getIndustrialImage(1,6,0);
				$('#sub3').show();
				$('#sub1').hide();
				$('#sub2').hide();
			}
		}) 
	  	$(".seachView").on("mouseenter",function(){
	  		$(this).css("height","280px");
	  		$('.hotSearch').show();
	  		$('.cancleSearch').show();

		});
		$(".seachView").on("mouseleave",function(){
	  		$(this).css("height","60px");
	  		$('.hotSearch').hide();
	  		$('.cancleSearch').hide();
	  		$('.totalSearch').hide();
		});  
		$(".second-li").on("click",function(){
			$(".second-li").removeClass("on")
			$(this).addClass("on");
		})
		$(".subHot2 span").on("click",function(){
			$('#searchKey').val($(this).text());
			goSearch();
		})
		$("#searchKey").bind('keydown', function(event) {
			if (event.keyCode == "13") {
				goSearch();
			}
		});
	});
	function goSearch(){
		isPage = true;
		if(type==0){
			getAssistExpertInfoList(1,8,1);
		}else if(type==1){
			getLiScienceType(1,1);
		}else{
			getIndustrialImage(1,6,1);
		}
	}
	function showSearchView(){
		$('#searchKey').val('');
		$('.seachView').show();
		if(type==0){
			$('#sub1').show();
			$('#sub2').hide();
			$('#sub3').hide();
		}else if(type==1){
			$('#sub2').show();
			$('#sub1').hide();
			$('#sub3').hide();
		}else{
			$('#sub3').show();
			$('#sub2').hide();
			$('#sub1').hide();
		}
	}
	function canlceSearch(){
		$('#searchKey').val('')
		$('.totalSearch').hide();
	 	$('.hotSearch').show(); 
		if(type==0){
			getAssistExpertInfoList(1,8,0);
		}else if(type==1){
			getLiScienceType(1,0);
		}else{
			getIndustrialImage(1,6,0);
		}
	}
	function getIndustrialImage(pageNum,pageSize,type){
		 $('.artical-box').empty();
		 $('#pageNum').val(pageNum);
		 $('.select').val($('#pageNum').val());
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liIndustrySummit/list",
			type : "post",
			data : {
				"pageNum": pageNum,
			    "pageSize": pageSize,
			    "status": '1',
				"title" : $('#searchKey').val()
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.list;
				$('#record').text("共 "+result.total+" 条信息");
				var allPage = Math.ceil(result.total/6);
				if(allPage>1){
					$('.pageJump').show();
				}else{
					$('.pageJump').hide();
				}
				if(isPage){
					Page({
						num:allPage,			//页码数
						startnum:1,				//指定页码
						elem:$('#page'),		//指定的元素
						callback:function(n){	//回调函数
							getIndustrialImage(n,6,0);
						}
					});
					isPage = false;
				}
				if(type==1){
				   $('.hotSearch').hide();
				}
				if(result.total==0){
					if(type==1){
						$('#total1').hide();
						$('#total2').show()
					}
				}else{
					if(type==1){
						$('#total1').show();
						$('#total2').hide()
						$('#total1 font').text(result.total);
						$('#total1 #searchType').text('峰会');
					 }				
					if(isChange){
						for (i=1;i<allPage+1;i++){
							var _div = "";
							_div += '<option>'+i+'</option>';
							$('.select').append(_div)
						}
						isChange = false;
					}
				}
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var _div = "";
					var text = "";
					_div += '<a class="dib expert-a" target="_blank" href="'+info.url+'">'
					if(info.imageUrl){
						_div +=	 '<div class="expert-pic industrial-pic" style="background-image:url('+info.imageUrl+')">'
					}else{
						_div +=	'<div class="expert-pic industrial-pic" style="background-image:url(${ctx}/static/image/activity/activityImage.png)">'
					}
					_div += '</div>'
					_div += '<div class="expert-infor">'
					_div += '<p class="industrial-p" title="'+info.title+'">'+info.title+'</p>'
					_div += '</div>'
					_div +='</a>'
				    $('.artical-box').append(_div);
				} 
				if(result.total == 0){
					var _div = "<div id='noData'>暂无数据</div>";
				    $('.artical-box').append(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
		
		
	}
	function getLiScienceType(pageNum,type){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/serviceInstitutionInfo/kindList",
			type : "post",
			data : {
				"kindName": "锂电",
			    "type": '1',
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.kindList;
				if(infoList.length>0){
					for(var i=0;i<infoList.length;i++){
						var list = infoList[i];
						if(list.kindName=="锂电"){
							$('#kindId').val(list.kindId);
							break;
						}
					}
					getLiScienceList(pageNum,6,type);
				}else{
					$('#product1').text("科研机构(0)");
					var _div = "<div id='noData'>暂无数据</div>";
					$(".artical-box").append(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function getLiScienceList(pageNum,pageSize,type) {
		 $('.artical-box').empty();
		 if($('#kindId').val()==''||$('#kindId').val()==undefined){
			var _div = "<div id='noData'>暂无数据</div>";
			$(".artical-box").append(_div);
			return;
		}
		 $('#pageNum').val(pageNum);
		 $('.select').val($('#pageNum').val());
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/serviceInstitutionInfo/list", 
			type : "post",
			data : {	
				"pageNum" : pageNum,
				"pageSize" : pageSize,
  			 	"serviceKindId" : $('#kindId').val(),
  			 	"type": '1',
 			 	"orderByClause" : "create_time desc",
			 	"searchKey" : $('#searchKey').val()
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.value;
				$('#record').text("共 "+result.total+" 条信息");
				var allPage = Math.ceil(result.total/6);
				if(allPage>1){
					$('.pageJump').show();
				}else{
					$('.pageJump').hide();
				}
				if(isPage){
					Page({
						num:allPage,			//页码数
						startnum:1,				//指定页码
						elem:$('#page'),		//指定的元素
						callback:function(n){	//回调函数
							getLiScienceList(n,6,0);
						}
					});
					isPage = false;
				}
				if(type==1){
					$('.hotSearch').hide();
				}
				if(result.total==0){
					if(type==1){
						$('#total1').hide();
						$('#total2').show()
					}
				}else{
					if(type==1){
						$('#total1').show();
						$('#total2').hide()
						$('#total1 font').text(result.total);
						$('#total1 #searchType').text('机构');
					}
					if(isChange){
						for (i=1;i<allPage+1;i++){
							var _div = "";
							_div += '<option>'+i+'</option>';
							$('.select').append(_div)
						}
						isChange = false;
					}
				}
	 			for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var _div = "";
					var text = "";
					if(info.researchDirection){
						text = info.researchDirection;
						text = text.replace(/<(table|tr|td|%)[\s\S]*?\/\1>/ig,"");
						text = text.replace(/<[^>]+>/g,"");
					}
					_div += '<a class="dib expert-a" target="_blank" href="${ctx}/yc/detail?type=5&entranceId=${entranceId}&id='+info.id+'">'
					if(info.logoUrl){
						_div +=	 '<div class="expert-pic" style="background-image:url('+info.logoUrl+')">'
					}else{
						_div +=	'<div class="expert-pic" style="background-image:url(${ctx}/static/image/homePage_yc/kyjg1.png)">'
					}
					_div += '</div>'
					_div += '<div class="expert-infor">'
					_div += '<h3 class="science-h3">'+info.institutionName+'</h3>'
					if(text!=''){
						_div += '<p class="science-p"><font class="white-font">【科研方向】</font>'+text+'</p>'
					}else{
						_div += '<p class="science-p">'+text+'</p>'
					}
					_div += '</div>'
					_div +='</a>'
				    $('.artical-box').append(_div);
				} 
				if(result.total == 0){
					var _div = "<div id='noData'>暂无数据</div>";
				    $('.artical-box').append(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function getAssistExpertInfoList(pageNum,pageSize,type) {
		 $('.artical-box').empty();
		 $('#pageNum').val(pageNum);
		 $('.select').val($('#pageNum').val());
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/assistExpertInfo/list",
			type : "post",
			data : {
				"pageNum" : pageNum,
				"pageSize" : pageSize,
			 	"typeId" : "90020180925100647002193000000001",
			 	"searchKey" : $('#searchKey').val()
 		},
			dataType : "json",
			success : function(result) {
				var infoList = result.list;
				$('#record').text("共 "+result.total+" 条信息");
				if(type==1){
					$('.hotSearch').hide();
				}
				var allPage = Math.ceil(result.total/8);
				if(allPage>1){
					$('.pageJump').show();
				}else{
					$('.pageJump').hide();
				}
				if(isPage){
					Page({
						num:allPage,			//页码数
						startnum:1,				//指定页码
						elem:$('#page'),		//指定的元素
						callback:function(n){	//回调函数
							getAssistExpertInfoList(n,8,0);
						}
					});
					isPage = false;
				}
				if(result.total==0){
					if(type==1){
						$('#total1').hide();
						$('#total2').show()
					}
				}else{
					if(type==1){
						$('#total1').show();
						$('#total2').hide()
						$('#total1 font').text(result.total);
						$('#total1 #searchType').text('专家');
					}
					if(isChange){
						for (i=1;i<allPage+1;i++){
							var _div = "";
							_div += '<option>'+i+'</option>';
							$('.select').append(_div)
						}
						isChange = false;
					}
				}
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var _div = "";
					_div += '<a class="dib expert-a ldExpert-a" target="_blank" href="${ctx}/expert/detail/'+info.expertId+'?entranceId=3609009"><div class="middle-pic">'
					if(info.imageUrl){
						_div +=	 '<div class="expert-pic" style="background-image:url('+info.imageUrl+')">'
					}else{
						_div +=	 '<div class="expert-pic" style="background-image:url(${ctx}/static/image/homePage_yc/headPortrait.png)">'
					}
					_div += '</div>'
					_div += '<div class="expert-infor">'
					_div += '<h3>'+info.expertName+'</h3>'
				    _div += '<p><font class="white-font">【专长】</font>'+(info.expertise==undefined?'':info.expertise)+'</p>'
					_div += '</div>'
					_div += '</div>'
					_div +='</a>'
				    $('.artical-box').append(_div);
				}
				if(result.total == 0){
					var _div = "<div id='noData'>暂无数据</div>";
				    $('.artical-box').append(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	// 格式化CST日期的字串
	function formatCSTDate(strDate, format) {
		return formatDate(new Date(strDate), format);
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
