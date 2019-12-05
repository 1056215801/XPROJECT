<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/liData/homePage.css"/>
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
		<div class="container-fluid content2">
		<div class="main">
		<div class="pro-left">
				<ul class="production">
				</ul>
			</div>
			<div class="pro-right noBackImg">
				<div class="artical-box">
				</div>
				<div  class="artical-foot">
					 <input type="hidden" id="pageNum" value="1"/>
					 <input type="hidden" id="firstPage" value="1"/>
					 <input type="hidden" id="lastPage" value=""/>
					<div class="record"><font class="fffont" id="record"></font> <font id="font1"></font><font class="fffont" id="font2"></font></div>
					<div class="page-links">
						<div class="page-link">
							<a href="javascript:;" onclick="first()">首页</a>
							<a href="javascript:;" onclick="pre()">上一页</a>
							<a href="javascript:;" onclick="next()">下一页</a>
							<a href="javascript:;" onclick="last()">尾页</a>
						</div>
						<div class="pageTo">
							跳转到
							<select class="select" onchange="changePage(this.options[this.options.selectedIndex].value)">
							</select>
							页
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/liData.js"></script>
<script type="text/javascript">
var typeId = "";
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
	});
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
						 getliNewsInfoListById(1,5,info.id,i);
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
	function changePage(e){
		$('#pageNum').val(e)
		getliNewsInfoListById(e,5,typeId)
	}
	function first(){
		var pageNum = $('#pageNum').val();
		if($('#pageNum').val()!=1){
			getliNewsInfoListById(1,5,typeId)
		}
	}
	function pre(){
		var pageNum = $('#pageNum').val();
		if(pageNum!=1){
			pageNum --;
			getliNewsInfoListById(pageNum,5,typeId)
		}
	}
	function next(){
		var pageNum = $('#pageNum').val();
		if(pageNum!=$('#lastPage').val()){
			pageNum ++;
			getliNewsInfoListById(pageNum,5,typeId)
		}
	}
	function last(){
		var pageNum = $('#lastPage').val();
		if($('#pageNum').val()!=pageNum){
			getliNewsInfoListById(pageNum,5,typeId)
			$('#pageNum').val($('#lastPage').val());
		}
	}
	function selectByKey(obj,id){
		isChange = true;
		$('.select').empty();
		$('#pageNum').val('1')
		$(obj).parent().addClass("on").siblings().removeClass("on");
		typeId = id;
		getliNewsInfoListById(1,5,id)
		
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
				"status": '1'
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.list;
				$('#record').text("共"+result.total+"条记录");
				var allPage = Math.ceil(result.total/5);
				$('#lastPage').val(allPage);
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
					var t = formatCSTDate(info.createTime,"yyyy-MM-dd");
					_div += '<a class="artical-link" onclick="getDetail(\''+ info.id + '\')">'
					_div +=	'<div class="artical-item middle-pic">'
					_div += '<h2>'+info.title+'</h2>'
					_div += '<div class="artical-infor">'
					if(tagsList.length>0){
						_div +=	'<div class="tags">'
						for(var j=0;j<tagsList.length;j++){
							_div += '<span>'+tagsList[j]+'</span>';
						}
						_div +=	'</div>'
					}
					_div +=	'<p><font>'+(info.source==undefined?'':info.source)+'</font><font>'+t+'</font></p>'
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
		window.open("${ctx}/front/ldDataCenter/index/5?id="+id+'&typeId='+typeId,"_blank")
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
