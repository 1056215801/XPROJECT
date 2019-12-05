<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>已发项目</title>
<link href="${ctx}/static/weixin/css/projectDeclare/haveSendProject.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet"/>
<script>
 
 $(function(){
 	$(".search").click(function(){ 
		var div = $("#dropdown"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
			$(".search").addClass("colorDeep");
		}else{ 
	  		div.slideUp("fast"); 
			$(".search").removeClass("colorDeep");
		} 
	}); 
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
	
	//异步加载已发项目
	$('#pageNum').val(1);
	getAlreadyList();
	
    $('#tbox').hide();//隐藏小火箭
    $('#getMore').hide();//隐藏加载更多
    $("#proList").hide();//隐藏暂无数据
	
 })
 
 //异步加载已发项目列表
 var pageNum = 1;
 function getAlreadyList() {
		$.ajax({
			url : "${ctx}/projectDeclare/json/list",
			type : "post",
			data : $('#getListForm').serialize(),
			dataType : "json",
			success : function(result) {
				 if(result.code==-1){
					 $("#proList").hide();
					layer.alert(result.msg);
				}else if(result.code==2){
					$("#proList").show();
				}else{
					var list = result.value;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _divList = '<div class="haveSendDataBar" onclick="viewDetails(\''+info.declareId+'\')">'
						+'<div style="float:left;"><div class="haveSendTimeLimit">'
						+'<div class='
						+ (info.endDate==-1?'"haveSendTimeLimitContGray">申报截止':(info.endDate==null?'"haveSendTimeLimitContRed">常年有效':'"haveSendTimeLimitContRed">剩余'+info.endDate+'天'))
						+'</div></div><div class='
						+ (info.declareStatus==0?"haveSendStateGreen>申报中":info.declareStatus==1?"haveSendStateGray>已截止":"haveSendStateBlue>已公示")
						+'</div></div><div style="margin-left:25%; padding:5% 0;">'	
						+'<div class="haveSendTitle">'
						+ info.declareTitle 
						+'</div><div class="haveSendData" style="margin:5px;border:0;padding:0;">'
						+'<div class="haveSendDataLeft">申报企业：</div>'
						+'<div class="haveSendDataRight"><font style="color:#f14342;">'
						+ info.applyCount
						+'</font>家</div><div class="haveSendDataLeft">待审核：</div>'
						+'<div class="myAppliDataRight"><font style="color:#f14342;">'
						+ info.auditingApplyCount
						+'</font>家</div><div class="haveSendDataLeft">通过审核：</div>'
						+'<div class="myAppliDataRight"><font style="color:#f14342;">'
						+ info.auditedApplyCount
						+'</font>家</div></div></div></div>';
					$("#AlreadyList").append(_divList);
					}
					$("#proList").hide();
					}if (result.code != 1) {
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
		pageNum ++;
		$('#pageNum').val(pageNum);
		getAlreadyList();
	}
	 
	/* 查看详情 */
	function viewDetails(declareId){
		$('#detailsForm').attr("action","${ctx}/projectDeclare/weixin/view/"+declareId);
		$("#detailsForm").submit();
	}
</script>
</head>
<body>
<form  id="getListForm" action="" method="post">
	<input type='hidden' name='pageNum' id='pageNum' value='1'></input>
	<input type='hidden' name='type' value='2'></input>
	<input type='hidden' name='pageSize' id='pageSize' value="5"></input>
	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
</form>
<form id="detailsForm" action="" method="post">
	<input type='hidden' name='detailsType' value='"haveSendProject"'></input>
	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
</form>
<div class="haveSend_main">
	<div class="fixed_top">
		<img src="${ctx}/static/weixin/images/projectDeclare/myPro0.png" width="15px;" height="15px;">
		<span>已发项目</span>
	</div>
	
	<div class="haveSend_content">
		<div style="margin-top:60px;"></div>
		<div class="haveSendCont">
		<div id="AlreadyList"></div>
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
			<li>
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
