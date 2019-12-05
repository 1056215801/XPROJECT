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
<title>锂电大数据中心</title>
<style>

</style>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
<%-- 	<div class="nav">
		<div class="nav-text"><img src="${ctx}/static/image/liData/line.png"><font>锂电动态</font><img class="rotate" src="${ctx}/static/image/liData/line.png"></div>
		<div class="return" onclick="location.href='${ctx}/front/ldDataCenter/index/1'"><img src="${ctx}/static/image/liData/back.png"><font>返回首页</font></div>
	</div> --%>
		<div class="container-fluid content2 container-fluid-new">
		<div class="main">
		<div class="pro-left">
				<ul class="production">
				</ul>
					<div class="seachView">
				     <div class="searchBar">
				        <div class="subBar">
				        	<input type="text" class="searchInput" id="searchKey" name="searchKey" placeholder="请输入关键字">
				     		<a><img width="20" href="javascript:;" onclick="goSearch()" src="${ctx}/static/image/liData/search.png"></a>
				        </div>
				     </div>
				</div>
			</div>
			<div class="pro-right  boxStyle" style="padding:0;">
				 <div class="outsideBox otherOutsideBox">
			  		<img class="corner lt" src="${ctx}/static/image/cityDataCenter/yc/left_top_radius.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/yc/right_top_radius.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/yc/left_bottom_radius.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/yc/right_bottom_radius.png">
					<div class="artical-box">
					</div>
			   </div>
				<div  class="artical-foot">
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
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script> 
<script src="${ctx}/static/js/plugins/pagination/pager.js"></script> 
<script type="text/javascript">
var typeId = "";
var isPage = true;
var isChange = true;
	$(function () {	
		getMap();
		$(".product-type").on("click",function(){
			$(this).parent().addClass("on").siblings().removeClass("on");
			$(this).parent().siblings().find(".product-item").slideUp();
			$(this).siblings(".product-item").slideDown();
		})
		$(".second-li").on("click",function(){
			$(".second-li").removeClass("on")
			$(this).addClass("on");
		})
		getLiNewsType();
		$("#searchKey").bind('keydown', function(event) {
			if (event.keyCode == "13") {
				goSearch();
			}
		});
	});
	function goSearch (){
		isPage = true;
		getliNewsInfoListById(1,6,typeId);
	}
	function getLiNewsType(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liNewsType/list",
			type : "post",
			data : {
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.list;
			 	for(var i=0;i<3;i++){
					var info = infoList[i];
					var _div = "";
					if('${type}'==i){
						 getliNewsInfoListById(1,6,info.id,i);
						 typeId = info.id;
 						_div += '<li class="first-li on">'
						_div += '<div class="product-type" onclick="selectByKey(this,'+info.id+');">'+info.typeName+'</div>'
						_div +=	'</li>'
					}else{
						_div += '<li class="first-li">'
						_div += '<div class="product-type" onclick="selectByKey(this,'+info.id+');">'+info.typeName+'</div>'
						_div +=	'</li>'
					}
					$('.production').append(_div);
				} 
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
	}
	function selectByKey(obj,id){
		isChange = true;
		isPage = true;
		$('.select').empty();
		$('#pageNum').val('1')
		$(obj).parent().addClass("on").siblings().removeClass("on");
		typeId = id;
		getliNewsInfoListById(1,6,id)
		
	}
	function getliNewsInfoListById(pageNum,pageSize,id){
		$('.artical-box').empty();
		$('#pageNum').val(pageNum);
		 $('#font1').text($('#pageNum').val());
		$('.select').val($('#pageNum').val());
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liNewsInfo/list",
			type : "post",
			data : {
				"typeIds": id,
				"pageNum" : pageNum,
				"pageSize" : pageSize,
				"status": '1',
				"title": $('#searchKey').val(),
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
							getliNewsInfoListById(n,pageSize,id);
						}
					});
					isPage = false;
				}
				if(result.total==0){
					$('#font1').text('0');
				}else{
					if(isChange){
						for (i=1;i<allPage+1;i++){
							var _div = "";
							_div += '<option onclick="selectPage('+i+')">'+i+'</option>';
							$('.select').append(_div)
						}
						isChange = false;
					}
				}
				$('#font2').text('/'+allPage+'页');
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var _div = "";
					var tagsList = [];
					if(info.tags){
						 tagsList = info.tags.split(",");
					}
					var t1 = formatCSTDate(info.createTime,"yyyy-MM");
					var t2 = formatCSTDate(info.createTime,"dd");
					_div += '<a class="artical-link" onclick="getDetail(\''+ info.id + '\')">'
					_div += '<span class="artical-date"><h3>'+t2+'</h3><h5>'+t1+'</h5></span>'
					_div +=	'<div class="artical-item">'
					_div += '<h2>'+info.title+'</h2>'
					_div += '<div class="artical-infor">'
					if(tagsList.length>0){
						_div +=	'<div class="tags">'
						for(var j=0;j<tagsList.length;j++){
							_div += '<span>'+tagsList[j]+'</span>';
						}
						_div +=	'</div>'
					}
					_div +=	'<p><font>'+(info.source==undefined?'':info.source)+'</font></p>'
					_div += '</div>'
					_div +=	'</div>'
					_div += '</a>'
					$('.artical-box').append(_div);
				}
				if(result.total == 0){
					var _div = "<div id='noData'>暂无数据</div>";
					$('.artical-box').append(_div);
				}
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			}
		});
	}
	function getDetail(id){
		window.open("${ctx}/front/cityDataCenter/ycLdIndex/5?id="+id+'&typeId='+typeId,"_blank")
	}
	function getMap() {
		
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
