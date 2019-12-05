<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html class="ha">
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
<body class="gray-bg ha">
	<%@ include file="header.jsp"%>
<%-- 	<div class="nav">
		<div class="nav-text"><img src="${ctx}/static/image/liData/line.png"><font>动态详情</font><img class="rotate" src="${ctx}/static/image/liData/line.png"></div>
	</div> --%>
	<div class="container content2">
		<div class="artical-nav">
			<p>动态详情</p>
			<a  href="javascript:;" onclick="window.close();">返回列表 </a>
		</div>
		<div class="artical artical-pb70">
		  	<div class="artical-title">
		  		 <h2></h2>
			</div> 
			<div class="artical-tagsItem">
					<div class="artical-item">
						<div class="artical-infor">
							<div class="tags">
							</div>
							<p><font id="font1"></font><font id="font2"></font></p>
						</div>
					</div>
				</div>
			<div class="artical-box">
			   <div class="box-detail">
			   	   <p></p>
			   </div>
			</div> 
			<div  class="artical-foot nopaddingTop">
			     <div class="targetLink">
				     <div class="subTaget" id="preTaget">
				     	<span>上一篇：</span>
				     </div>
				     <div class="subTaget" id="nextTaget">
				     	<span>下一篇：</span>
				     </div>
			     </div>
			     <div class="cancle-btn">
			     	 <a>
				       <img src="${ctx}/static/image/liData/cancle.png" width="15" style="margin-right: 5px;">
				       <span style="margin-right: 15px;" onclick="window.close();">关闭</span>
			    	 </a>	
			     </div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/liData.js"></script>
<script type="text/javascript">
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
		getDetail();
	}); 
	function getDetail(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/liNewsInfo/detail",
			type : "post",
			data : {
				id: "${id}",
				"typeId": "${typeId}"
			},
			dataType : "json",
			success : function(result) {
				console.log(result)
				var detail = result.value;
				if(detail.preId){
					$('#preTaget').append('<a href="${ctx}/front/ldDataCenter/index/5?id='+detail.preId+'">'+detail.preTitle+'</a>')
				}else{
					$('#preTaget').hide();
				}
				if(detail.nextId){
					$('#nextTaget').append('<a href="${ctx}/front/ldDataCenter/index/5?id='+detail.nextId+'">'+detail.nextTitle+'</a>')

				}else{
					$('#nextTaget').hide();
				}
				$('.artical-title h2').text(detail.title);
				$('#font1').text(detail.source);
				var time = formatCSTDate(detail.createTime,"yyyy-MM-dd");
				$('#font2').text(time);
				var tagsList = [];
				if(detail.tags){
					var tagsList = detail.tags.split(",");
					if(tagsList.length>0){
						for(var j=0;j<tagsList.length;j++){
							var _div = "";
							_div += '<span>'+tagsList[j]+'</span>';
							$('.tags').append(_div);
						}
					}
				}
				$('.box-detail p').append(detail.content);
			},
			error : function() {
				//tips("请求超时，请稍后重试");
			},
		});
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
