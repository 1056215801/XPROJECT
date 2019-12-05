<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div class="col-md-3">
	<div class="fir-floor">
		<div class="publish-btn" onclick="add()">
			<a href="javascript:;">
				<img alt="" src="${ctx}/static/image/homePage_yc/icon-ed.png" width="25">
				<h1>发布</h1>
			</a>
		</div>
	</div>
	<div class="sec-floor">
		<div class="industry-new">
			<h3 class="fz0"><img class="dib" src="${ctx}/static/image/homePage_yc/biao.png"><font class="dib">产业动态</font><a href="${ctx}/industry/list?entranceId=${entranceId}" class="fr">更多</a></h3>
			<div class="news-list" id="news-list"></div>
		</div>
	</div>
	<div class="thd-floor" style="background:#fff;">
		<div class="reports">
            <div class="tabs-container" id="kindTab">
            	<ul class="tab-link fz0"> <!-- 1=对接月报，2=招聘月报 -->
            	 	<li class="on" ><a href="javascript:;">产业招聘月报</a></li>
            	 	<li class=""><a href="javascript:;">产业对接月报</a></li>
            	</ul>
            	<div class="tab-content">
            		<div id="tab-1" class="report-tab on">
                 		<div class="report-list" id="kind2List"></div>
                         <a class="a_kind" href="${ctx}/yc/list?type=2&entranceId=${entranceId}">更多</a>
                  </div>
                  <div id="tab-2" class="report-tab">
                 	 	<div class="report-list" id="kind1List"></div>
                        <a class="a_kind" href="${ctx}/yc/list?type=1&kind=1&entranceId=${entranceId}">更多</a>
                  </div>
            	</div>
            </div>
        </div>
	</div>
	<div class="for-floor">
		<div class="helping" style="padding-bottom:60px;">
			<div class="help-title" onclick="location.href='${ctx}/helpAsk/allList?entranceId=${entranceId}'"><img src="${ctx}/static/image/homePage_yc/helping.png"></div>
			<div class="help-content">
				<div class="help-list" id="help-list">
				</div>
				<a href="${ctx}/helpAsk/add?entranceId=${entranceId}"><img src="${ctx}/static/image/homePage_yc/publish.png">免费发布</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	getIndustryDynamicsNewsList(1,5);//获取产业动态列表
    gatherDataCountViewList(1,3,1)//获取产业对接列表
    gatherDataCountViewList(1,3,2)//获取工业招聘统计列表
    getAskList(1,3)//获取帮你问问列表接口
});
function getIndustryDynamicsNewsList(pageNum,pageSize) {
	$.ajax({
		url : "${urlPath}XOffice/interface/json/columnInfo/getPublicColumnNewsInfoList",
		data : {
			"pageNum" : pageNum,
			"parkId" : "${entranceId}",
			"pageSize" : pageSize,
			"columnId" :  '',
		},
		dataType : "json",
		success : function(result) {
			var map = result.columnInfo;
			var infoList = result.value;
			if(result.total>0){
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var id = info.columnId;
 					var _div = "";
 					_div += '<a href="${ctx}/industry/detail/'+info.newsId+'">'
              		_div += "<div class='item-container'>"
              	    _div += "<font class=\'blueT\'>"+map[id.toString()]+' '+"|  </font>"
              	 	_div += info.newsTitle
              	 	_div += "<font class=\'redT\'>  "
              	 	_div +=  dateToTimeStr(info.createTime,'MM-dd')
              	 	_div += "</font>"
              	 	_div += "</div>"
              	    _div +=  "</a>"
              		$("#news-list").append(_div);
				}
			}else{
				 var _div = "<div id=noData>暂无数据</div>"
				$("#news-list").append(_div);
				$('.industry-new h3>a').hide();
			}
			
		},
		error : function() {
			tips("请求超时，请稍后重试");
		},
	});
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
function gatherDataCountViewList(pageNum,pageSize,kind) {
	$.ajax({
		url : "${urlPath}XOffice/interface/json/gatherDataCount/viewList",
		type : "post",
		data : {
			"pageNum" : pageNum,
			"pageSize" : pageSize,
			"kind" : kind,
		  	"parkId" :"${entranceId eq '3609009'?entranceId:''}",
				},
		dataType : "json",
		success : function(result) {
			if(result.total>0){
				var infoList = result.infoList;
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					var text = info.content;
					text = text.replace(/<(table|tr|td|%)[\s\S]*?\/\1>/ig,"");
					text = text.replace(/<[^>]+>/g,"");
					var _div = "";
              		_div += '<a href="${ctx}/yc/detail?type='+kind+'&entranceId=${entranceId}&id='+info.id+'"><img class=\'dib\' src="'+info.imageUrl+'">'
              		_div +=  "<div class=\'dib\'><h4>"+info.title+"</h4>"
              		_div += "<p>"+text+"</p>"
              		_div += "</div>"
              		_div +=  "</a>"
              		if(kind==1){
              			$("#kind1List").append(_div);
              		}else{
              			$("#kind2List").append(_div);
              		}
				}
			}else{
				var _div = "<div id='noData'>暂无数据</div>";
				if(kind==1){
          			$("#kind1List").append(_div);
          		}else{
          			$("#kind2List").append(_div);
          		}
				$(".reports .report-tab>a").hide();
			}
		},
		error : function() {
			tips("请求超时，请稍后重试");
		},
	});
}
function notNull(data,text){
	if(data && data != 'undefined' && data != null){
		return data;
	}
	else if(text) {
		return text;
	}
	else {
		return "";
	}
}
function getAskList(pageNum,pageSize) {
	$.ajax({
		url : "${urlPath}XOffice/interface/json/question/askInfo/askList",
		type : "post",
		data : {
			"pageNum" : pageNum,
			"pageSize" : pageSize
		},
		dataType : "json",
		success : function(result) {
			var tagList = result.tagList;
			var infoList = result.askList;
			if(result.total>0){
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					if(info.askImgUrls){
						var img = info.askImgUrls.split(",")[0];
					}
					var _div = "";
					 var id = info.askTagIds.split(",")[0];
					 var text;
				 	 for(var j=0;j<tagList.length;j++){
						 var temp = tagList[j];
						 if(temp.tagId==id){
							 text = temp.tagName;
							 break;
						 }
					 }
              		_div += "<a href=\'${ctx}/helpAsk/detail/"+info.askId+"\'>"
              		if(info.askImgUrls){
    					_div +=  "<div class=\'help-infor\'>"
              		}else{
    					_div +=  "<div class=\'help-infor\' style=\'width:100%;\'>"
              		}
					_div += "<h4>"+info.askTitle+"</h4>"
					_div += "<p><img src=\'${ctx}/static/image/homePage_yc/ico@3x.png\'>"+text+"... "+info.browseNum+"阅读 · "+info.answerNum+"回复<span class=\'fr\'>"
					_div += "<img src=\'${ctx}/static/image/homePage_yc/re@3x.png\'>回复</span></p>"
					if(info.askImgUrls){
	 				    _div += "</div><img src=\'"+img+"\'>"
					}
					_div += "</div>"
 			        _div +=  "</a>"
            		$("#help-list").append(_div);
				}
			}else{
				var _div = "<div id=noData>暂无数据</div>"
 				$("#help-list").append(_div);
			}
			
		},
		error : function() {
			tips("请求超时，请稍后重试");
		},
	});
}

</script>
