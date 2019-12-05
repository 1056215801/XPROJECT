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
<title>产业招聘月报</title>
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
			    	<p class="navTitle">产业招聘月报</p>
			    	<p><font class="projectNum" id="projectNum1">0</font>&nbsp;
					<font id="font1">条</font> &nbsp;&nbsp; <font id="font2">产业招聘月报</font></p>
			     </div>
			</div>
		</div>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-list">
							<input type="hidden" id="pageNum" value="1" />
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
var  kind;
var isBox0 = true
$(function(){
	if('${entranceId}'==3600009){
		$(".nav-content a:eq(2)").addClass("on");
		$(".second-menu li:eq(2) a:eq(2)").addClass("on");
	}else{
		$(".nav-content a:eq(1)").addClass("on");
	}
	$(".source-room a").removeClass("on");
	$(".source-room a:eq(8)").addClass("on");
	getInfoList(1,10,2);
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
 function getInfoList(pageNum,pageSize,kind){ //type: 1:产业对接月报 2:产业招聘月报
	$('#pageNum').val(pageNum);
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
			"kind" : '2',
			"provinceId": '360000',
	  		"areaId" :areaId,
	  		"spaceId": "-1"

			},
		dataType : "json",
		success:function(result){
			$('#allList').empty();
			var infoList = result.infoList;
			$('#projectNum1').text(result.total);
			if(result.total>0){
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
					var _div =   '<div class="declareDataBar">'
						if(info.viewUrl){
		              		_div += '<a target="_blank" href="'+info.viewUrl+'">'
						}else{
							_div +='<a target="_blank" href="${ctx}/yc/detail?type=2&id='+info.id+'&entranceId=${entranceId}">'
						}
						_div +=	'<div class="text-box"><div class="text-box_title">';
				    	_div += '<div class="declareTitle">';
						_div += info.title+'</div>'
						+'<div class="declareData">'
						+	'<font>发布时间：'+dateToTimeStr(info.createTime,'yyyy-MM-dd')+'</font></div>'
						+'</div><div class="declare-content">'+text+'</div></div>'
						if(info.imageUrl){
							 _div += '<img src="'+info.imageUrl+'">'+'</a></div>';
							}else{
								_div += '</a></div>';
							}
						$('#allList').append(_div);
				}
				if (1 * 10 < result.total && pageNum ==1) {
					if(isBox0){
						 isBox0 = false;
						 showPagination('.M-box0',result.total,getInfoList,kind);
					}
					 $('#pageSize0').show();
					 $('#pageSize0').html('共检索到'+result.total+' 条数据，每页10条');
			} else if(1 * 10 >= result.total && pageNum ==1){
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
			//tips("请求超时，请稍后重试");
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
 function getmore(){
	var pageNum = Number($("#pageNum").val())+1;
 	 getInfoList(pageNum,10,kind);
 }
</script>
</html>
<!-- ç±»å1 -->