 <!-- 发改委 -->
 <%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../common/commonPage_front.jsp"%>
<style type="text/css">
.dib { display: inline-block; vertical-align: middle;}
.sev-floor {
    height: 195px;
}
.service-center {
    height: 100%;
    font-size: 0;
}
.service-center .pro-title {
    padding-bottom: 0;
    height: 40px;
}
.service-center .pro-title span {
    position: relative;
    padding: 8px 40px;
    display: inline-block;
    color: #333;
    font-size: 16px;
    -webkit-transition: all .5s 0s;
    transition: all .5s 0s;
    cursor: pointer;
}
.service-center .pro-title span font {
    position: absolute;
    right: -10px;
    top: -5px;
    padding: 0 3px;
    display: block;
    background: #f00;
    line-height: 1.2;
    font-size: 12px;
    border-radius: 6px;
    z-index: 9;
    opacity: 0;
}
.service-center .pro-title a {
	margin-top: 10px;
	font-size: 14px;
}
.service-center .pro-title span:hover {
    background: #0af;
    color: #fff;
}
.service-center .pro-title span.on {
    background: #1A7FC3;
    color: #fff;
}
.service-center .pro-title span.on font { opacity: 1;}
.loop-p {
    margin-left: 10px;
    width: -webkit-calc(100% - 420px);
    width: -moz-calc(100% - 420px);
    width: calc(100% - 420px);
    display: inline-block;
    vertical-align: middle;
    height: 20px;
    overflow: hidden;
    font-size: 14px;
}
.loop-p p {
    white-space: nowrap;
    color: #333;
    text-overflow: ellipsis;
    overflow: hidden;
    height: 20px;
}
.loop-p p::before {
	content: "";
    margin-right: 10px;
    width: 4px;
    height: 4px;
    display: inline-block;
    vertical-align: middle;
    background: #00C0FE;
}
.sev-floor .industry-new {
    padding: 0;
    border: none;
    border-top: 1px solid #999;
}
.sev-floor .industry-new h3 {
    padding: 0 10px;
    margin: 0;
    line-height: 40px;
}
.sev-floor .industry-new h3 a {
    margin-left: 20px;
    color: #1A7FC3;
}
.office-list {
    height: -webkit-calc(100% - 40px);
    height: -moz-calc(100% - 40px);
    height: calc(100% - 40px);
    font-size: 0;
}
.office-list a {
	position: relative;
    margin: 1px;
    display: inline-block;
    height: -webkit-calc(50% - 2px);
    height: -moz-calc(50% - 2px);
    height: calc(50% - 2px);
    width: -webkit-calc(33.33% - 2px);
    width: -moz-calc(33.33% - 2px);
    width: calc(33.33% - 2px);
    background: #f3f3f3;
    font-size: 14px;
    text-align: center;
}
.office-list a:hover { color: #0067CC;}
.office-list .half-a {
    width: -webkit-calc(50% - 2px);
    width: -moz-calc(50% - 2px);
    width: calc(50% - 2px);
}
.office-list div {
	position: absolute;
	top: 50%;
	margin-top: -30px;
	width: 100%;
}
.office-list p {
	margin-top: 10px;
}


</style>
<link href="${ctx}/static/css/login/slider-fgw.css" rel="stylesheet"/>
<div class="col-md-3">
	<div class="fir-floor">
		<div class="publish-btn" onclick="add()">
			<a href="javascript:;">
				<img alt="" src="${ctx}/static/image/homePage_yc/icon-ed.png" width="25">
				<h1>发布</h1>
			</a>
		</div>
	</div>
	 <div class="sev-floor">
		<div class="industry-new">
			<h3 class="fz0">
				<img class="dib" src="${ctx}/static/image/homePage_yc/biao.png"> <font class="dib"> 政务服务</font> <a target="_blank"
					href="http://www.jxzwfww.gov.cn/jxzw/newbusiness/getBusinessIndex.do?receiveNumber=&orgCode=" class="fr">办件查询</a>
			</h3>
			<div class="office-list">
				<a target="_blank" href="http://www.jxzwfww.gov.cn/jxzw/grbs/getGrbsIndex.do?webId=1"><div>
						<img src="${ctx}/static/image/homePage_yc/person-o.png">
						<p>个人办事</p>
					</div></a> <a target="_blank" href="http://www.jxzwfww.gov.cn/jxzw/frbs/getFrbsIndex.do?webId=1"><div>
						<img src="${ctx}/static/image/homePage_yc/lawer-o.png">
						<p>法人办事</p>
					</div></a> <a target="_blank" href="http://www.jxzwfww.gov.cn/jxzw/xzsp/gotoIndex.do?webId=1"><div>
						<img src="${ctx}/static/image/homePage_yc/approve-o.png">
						<p>行政审批</p>
					</div></a> <a target="_blank" class="half-a" href="http://www.jxzwfww.gov.cn/jxzw/ggfw/getGgfwIndex.do?webId=1"><div>
						<img src="${ctx}/static/image/homePage_yc/public-o.png">
						<p>公共服务</p>
					</div></a> <a target="_blank" class="half-a" href="http://www.jxzwfww.gov.cn/jxzw/xzql/gotoxzqlIndex.do?webId=1"><div>
						<img src="${ctx}/static/image/homePage_yc/sun-o.png">
						<p>阳光政务</p>
				</div></a>
			</div>
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
                         <a class="a_kind" id="kind2" href="${ctx}/yc/list?type=2&entranceId=${entranceId}">更多</a>
                  </div>
                  <div id="tab-2" class="report-tab">
                 	 	<div class="report-list" id="kind1List"></div>
                        <a class="a_kind" id="kind1" href="${ctx}/yc/list?type=1&kind=1&entranceId=${entranceId}">更多</a>
                  </div>
            	</div>
            </div>
        </div>
	</div>
	<div class="for-floor">
		<div class="helping" style="padding-bottom:60px;">
			<div class="help-title" onclick="location.href='${ctx}/helpAsk/allList?entranceId=${entranceId}'"><img src="${ctx}/static/image/homePage_yc/helping2.png"></div>
			<div class="help-content">
				<div class="help-list" id="help-list">
				</div>
				<a onclick="publish()" href="javascript:;"><img src="${ctx}/static/image/homePage_yc/publish.png">免费发布</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
/* 	 getIndustryDynamicsNewsList(1,6);//获取企业在线列表
 */	 
    gatherDataCountViewList(1,3,1)//获取产业对接列表
    gatherDataCountViewList(1,3,2)//获取工业招聘统计列表
    getAskList(1,3)//获取帮你问问列表接口
});

function publish() {
	if('${accountId}' == ''){
		return tips("亲，请先登陆哦！");
	}
	location.href='${ctx}/helpAsk/add?entranceId=${entranceId}';
}

	//企业在线
/* function getIndustryDynamicsNewsList(pageNum,pageSize) {
	 var url = "${urlPath}XOffice/interface/json/companyOnline/list";
	 $.post(url,{pageNum:pageNum,pageSize:pageSize},function(data){
		 if(data.success){
			 companyList = data.list;
			 for(var i = 0;i < data.list.length;i++){
				 hLink = "${urlPath}XOffice/oneApplication?menuId=90020170322172127801119000000019&subMenuId=90020170802165629000046000000003&companyId="+data.list[i].companyId;
				 var _html = "<div class='company-item'>"+
				 				"<img src='"+data.list[i].imageUrl+"'>"+
				 				"<div class='slide-cover'>"+
				 				"<a href='javascript:;' onclick='toLogin(\""+hLink+"\")'><img src='${ctx}/static/image/fgwImage/connectDetail.png'><p>详情</p></a>"+
				 				"<a href='javascript:;' onclick='toLogin()'><img src='${ctx}/static/image/fgwImage/connectLine.png'><p>连线</p></a>"+
				 				"</div>";
				 				"</div>"
				 $("#news-list").append(_html);
			 }
		}else{
			var _div = "<div id=noData>暂无数据</div>"
			$("#news-list").append(_div);
			$('.sec-floor .industry-new h3>a').hide();
		}
	})
} */
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
	  var areaId = "-1";
	    if('${entranceId}' == '3609009'){
	    	areaId = "360900";
	    }
	$.ajax({
		url : "${urlPath}XOffice/interface/json/gatherDataCount/viewList",
		type : "post",
		data : {
			"pageNum" : pageNum,
			"pageSize" : pageSize,
			"kind" : kind,
			"provinceId": '360000',
	  		"areaId" :areaId,
	  		"spaceId": "-1"
				},
		dataType : "json",
		success : function(result) {
			if(result.total>0){
				var infoList = result.infoList;
				for(var i=0;i<infoList.length;i++){
					var info = infoList[i];
					if(info.content){
						var text = info.content;
						text = text.replace(
								/<(table|tr|td|%)[\s\S]*?\/\1>/ig,
								"");
						text = text.replace(/<[^>]+>/g, "");
					}else{
						var text = '';
					}
					var _div = "";
					if(info.viewUrl){
	              		_div += '<a target="_blank" href="'+info.viewUrl+'"'
					}else{
	              		_div += '<a target="_blank" href="${ctx}/yc/detail?type='+kind+'&entranceId=${entranceId}&id='+info.id+'"'
					}
              		_div +=	'><img class=\'dib\' src="'+info.imageUrl+'">'
					_div +=  "<div class=\'dib\'><h4>"+info.title+"</h4>"
              		_div += "<p>"+text+"</p>"
              	/* 	_div += '<span style="font-size:15px;">'+info.browseNum+'次浏览</span>'
					_div += '<span style="font-size:15px;float:right;margin-top:2px;">'+formatCSTDate(info.createTime,'yyyy-MM-dd')+'</span>' */
              		_div += "</div>"
              		_div +=  "</a>"
              		if(kind==1){
              			$("#kind1List").append(_div);
              			$("#kind1").show();
              		}else{
              			$("#kind2List").append(_div);
              			$("#kind1").show();
              		}
				}
			}else{
				var _div = "<div id='noData'>暂无数据</div>";
				if(kind==1){
          			$("#kind1List").append(_div);
          			$("#kind1").hide();
          		}else{
          			$("#kind2List").append(_div);
          			$("#kind2").hide();
          		}
			}
		},
		error : function() {
			tips("请求超时，请稍后重试");
		},
	});
}
// 格式化CST日期的字串
function formatCSTDate(strDate, format) {
	return formatDate(new Date(strDate), format);
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
              		_div += '<a target="_blank" href="${ctx}/helpAsk/detail/'+info.askId+'?entranceId=${entranceId}">'
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
 