<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>我申报的</title>
<link href="${ctx}/static/weixin/css/projectDeclare/myApplication.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet"/>
<script>
 $(function(){
 	$(".viewMore").click(function(){ 
		var ul = $("#viewMore ul"); 
		if(ul.css("display")=="none"){ 
			ul.slideDown("fast"); 
		}else{ 
			ul.slideUp("fast"); 
		} 
	}); 
	$("#viewMore ul li a").click(function(){
		$("#viewMore ul").hide(); 
	});
	
	/* 异步加载我申报的 */
	getMyApplicationList();
	
	$('#tbox').hide();//隐藏小火箭
	$('#getMore').hide();//隐藏加载更多
	$("#proList").hide();//隐藏暂无数据
	
 })
 
  	/* 异步加载我申报的*/
  	pageNumber = 1;
	function getMyApplicationList() {
		$.ajax({
			url : "${ctx}/projectDeclare/json/list",
			type : "post",
			data : $('#getListForm').serialize(),
			dataType : "json",
			success : function(result) {
				var list = result.value;
				if (result.code == 1 || result.code == 0) {
					for (var i = 0; i < list.length; i++) {
						var info = list[i];
						var endDate;
						if (info.endDate == null) {
							endDate == info.declareRemark;
						}
						var _divList = '<div class="myAppliDataBar" onclick="viewDetails(\''+info.declareId+'\');">'
							+'<div style="float:left;"><div class="myAppliTimeLimit">'
							+'<div class='
							+ (endDate==-1?'"myAppliTimeLimitContGray">申报截止':(endDate==null?'"myAppliTimeLimitContRed">常年有效':'"myAppliTimeLimitContRed">剩余 '+endDate+'天'))
							+'</div></div><div class='
							+ (info.declareStatus==0?"myAppliStateGreen>申报中":info.declareStatus==1?"myAppliStateGray>已截止":"myAppliStateBlue>已公示")
							+'</div></div><div style="margin-left:25%; padding:5% 0;">'	
							+'<div class="myAppliTitle">'	
							+ (info.declareTitle==null?"&nbsp;":info.declareTitle)
							+'</div><div class="myAppliData" style="margin:5px;border:0;padding:0;">'
							+'<div class="myAppliDataLeft">发布时间：</div>'
							+'<div class="myAppliDataRight">'
							+ (info.createTimeStr==null?"&nbsp;":info.createTimeStr)
							+'</div><div class="myAppliDataLeft">项目级别：</div>'
							+'<div class="myAppliDataRight">'
							+ (info.declareGrade==null?"&nbsp;":info.declareGrade)
							+'</div><div class="myAppliDataLeft">主管单位：</div>'
							+'<div class="myAppliDataRight">'
							+ (info.supervisorName==null?"&nbsp;":info.supervisorName)
							+'</div></div></div></div>';
						$("#myApplicationList").append(_divList);
					}
					$("#proList").hide();
					if(list.length>3){
						$("#getMore").show();
					}else{
						$("#getMore").hide();
					}
				} else if (result.code == 2) {
					$("#proList").show();
				} else if (result.code == -2){
					layer.msg("亲，您还没有登录");
					$("#proList").show();
				}
				if (result.code != 1) {
					$('#getMore').hide();
				} else {
					$('#getMore').show();
				}
				
			},
			error : function() {
				layer.alert("系统异常");
			}
		});
	}
	 /* 加载更多 */
	function getMore() {
		pageNumber++;
		$('#pageNumber').val(pageNumber);
		getMyApplicationList();
	}
	 
	/* 查看详情 */
	function viewDetails(declareId){
		$('#detailsForm').attr("action","${ctx}/projectDeclare/weixin/view/"+declareId);
		$("#detailsForm").submit();
	}
</script>
</head>

<body>
<form id="getListForm">
	<input type='hidden' name='pageNumber' id='pageNumber' value='1'></input>
	<input type='hidden' name='type' value='1'></input>
	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
</form>
<form id="detailsForm" action="${ctx}/projectDeclare/weixin/view" method="post">
	<input type='hidden' name='detailsType' value='"myApplication"'></input>
	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"></input>
</form>
<div class="myAppli_main">
	<div class="fixed_top">
		<img src="${ctx}/static/weixin/images/projectDeclare/myApplyPro0.png" width="15px;" height="15px;">
		<span>我申报的</span>
	</div>
	<div class="myAppli_content">
		<div style="margin-top:60px;"></div>
		<div class="myAppliCont">
			<div id="myApplicationList"></div>
		</div>
		
		<div style="text-align: center;">
			<span id="proList" class="renovateTitle">暂无数据</span>
		</div>
	</div>
	
	<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
	<div id="tbox">
		<a id="gotop" href="#top"></a>
	</div>
	
	<div class="navigationBar">
		<ul>
			<li><a href="${ctx}/auth/page/mobile/weixin/projectDeclare/weixin/main">
					<div class="navImage"><img src="${ctx}/static/weixin/images/projectDeclare/findprojected.png" width="20px;" height="20px;" style=" margin-top: 6%"/></div>
					<div class="navTitle">找项目</div>
				</a></li>
			<li><a href="${ctx}/projectDeclare/weixin/publicityList">
					<div class="navImage"><img src="${ctx}/static/weixin/images/projectDeclare/resultShow.png" width="20px;" height="20px;" style=" margin-top: 6%"/></div>
					<div class="navTitle">结果公示</div>
				</a></li>
			<li><a href="javascript:;" class="viewMore">
					<div class="navImage"><img src="${ctx}/static/weixin/images/projectDeclare/redMore.png" width="20px;" height="20px;" style=" margin-top: 6%"/></div>
					<div class="navTitle">更多服务</div>
				</a></li>
		</ul>
		<div id="viewMore">
			<ul style="margin-top:-95px;"> 
				<li style="border-bottom:1px solid #E6E6E6;"><a href="${ctx}/projectDeclare/weixin/myListPro" >已发项目</a></li> 
				<li style="border-bottom:1px solid #E6E6E6;"><a href="${ctx}/projectDeclare/weixin/myListApplyPro" >我的申报</a></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>
