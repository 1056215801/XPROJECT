<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>回复详情</title>
<link href="${ctx}/static/css/projectDeclare/projectApplication.css"rel="stylesheet" />
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
</head>

<body>
	<div class="project_main">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-nav"><p>回复详情</p><a href="javascript:history.go(-1);">返回列表 ></a></div>
						<div class="artical-content">
							<div class="declareDataBar fz0">
								<div class="declareTitle"></div>
								<div class="declareData">
									<font>回复时间：</font>
									<font>提问人：</font>
								</div>
							</div>
							<div class="main-contents">
								<div class="texts"></div>
							</div>
						</div>
					</div>
	
					<c:import url="/slideSelect" charEncoding="UTF-8">
					 	<c:param name="entranceId" value="${entranceId}" />
					</c:import>
	
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	</div>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script type="text/javascript">
$(function(){
	if('${entranceId}'==3600009){
		$(".nav-content a:eq(6)").addClass("on");
	}else{
		$(".nav-content a:eq(2)").addClass("on");
		$(".second-menu p:eq(1) a:eq(0)").addClass("on");
	}
	$(".source-room a").removeClass("on");
	$(".fr li").eq(5).addClass("on");
	getAskInfo(1,10,"${id}")
	var msg = '${message}';
	if(msg!=null&&msg!=""){
		tips(msg);
		msg=null;
	}
});

function getAskInfo(pageNum,pageSize,askId){ //type: 0:全部问题 1:我的互动 2:我的提问 3：我的回复
	$('#pageNum').val(pageNum);
	$.ajax({
		url:"${urlPath}XOffice/interface/json/question/answerInfo/answerDetail",
		type:"get",
		data:{
				"answerId":askId
			 },
		dataType:"json",
		success:function(result){
			console.log(result);
			var info = result.answerInfo;
			$(".declareTitle").text('问题：'+info.askTitle);
			$(".declareData font:eq(0)").text('回复时间：'+dateToTimeStr(info.createTime,'yyyy-MM-dd hh:mm:ss'));
			$(".declareData font:eq(1)").text('提问人：'+info.accountName);
			var _div = info.answerContent;
			var imgs = info.answerImgUrls.split(",");
			for(var i = 0;i < imgs.length;i++){
				_div+='<img src="'+imgs[i]+'" >'
			}
			$(".texts").html(_div);
		},
		error:function(){
			tips("请求超时，请稍后重试");
			},
	});
	
}
function timestampToTime(timestamp) {
    var date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
    Y = date.getFullYear() + '-';
    M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
    D = date.getDate() + ' ';
    h = date.getHours() + ':';
    m = date.getMinutes() + ':';
    s = date.getSeconds();
    return Y+M+D+h+m+s;
}
	function getIsLogin() {
		var flag = false;
		$.ajax({
				url : "${ctx}/session/account/isLogin",
				type : "get",
				async: false, 
				dataType : "json",
				success : function(result) {
					flag = result.success;
				},
				error : function() {
					tips("请求超时，请稍后重试");
				}
			});
		return flag;
	}
	
	function getTagList() {
		var flag = new Array();
		$.ajax({
				url : "http://test.jx968969.com/XOffice/interface/json/question/tagInfo/tagList",
				type : "post",
				async: false, 
				dataType : "json",
				success : function(data) {
					if(data.success){
						flag = data.tagList;
	    			}
				},
				error : function() {
					tips("请求超时，请稍后重试");
				}
			});
		return flag;
	}
	function typeLevel(list, ids) {
		var str = "";
		var arr = ids.split(",");
		for (var i = 0; i < arr.length; i++) {
			for (var j = 0; j < list.length; j++) {
				if (arr[i].toString() == list[j].tagId.toString()) {
					str += list[j].tagName + "&nbsp;&nbsp;";
				}
			}
		}
		return str;
	}

</script>
</body>
</html>

