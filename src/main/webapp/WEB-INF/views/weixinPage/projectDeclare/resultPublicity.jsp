<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>结果公示</title>
<link href="${ctx}/static/weixin/css/projectDeclare/resultPublicity.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet"/>
<script>
	pageNumber = 1;
	 $(function(){
 	$(".search").click(function(){
			var div = $("#dropdown"); 
			if(div.css("display")=="none"){
				hideAllDropdown();
				$(".hidebg").show();
				div.slideDown("fast"); 
				$(".search").addClass("colorDeep");
			}else{ 
				hideAllDropdown();
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
	
	getPublicList(1,"");
	$('#tbox').hide();
	$('#getmore').hide();
	$("#noDataList").hide();
	
 })
 /* 异步加载结果公示 */
	pubilcCount = 0;
 	function getPublicList(pageNum,searchKey){
	 $.ajax({
			//url:"${ctx}/projectDeclare/json/list",
			url:"${ctx}/projectDeclare/json/publicityByOpen",
			type:"post",
			data:{
				/* "pageNum":pageNum,
				"pageSize":4,
				"type":0,
				"declareGrade":searchKey,
				"declareStatus":2,
				"declareTitle":"" */
				"publicityTitle":searchKey
			 },
			dataType : "json",
		 	success:function(result){
		 		var list = result.value;
		 		if (pageNumber == 1) {
		 			$(".publicityCont").empty();
		 		}
		 		if (result.code == 1 || result.code == 0) {
		 			for (var i = 0; i < list.length; i++) {
					var info = list[i];
					var _divList = '<a href="javascript:void(0)" onclick="view(\''+info.publicityId+'\',\''+info.declareId+'\')" style="text-decoration: none;">'
						+ '<div class="publicityDataBar">'
						/* + '<div style="float:left;"><div class="publicityTimeLimit">'
						+ '<div class="projectTimeLimitContRed">'
						+ (info.endData==null?"常年有效":info.endData)
						+ '</div></div><div class="publicityStateBlue">已公示</div></div>' */
						+ '<div style="padding: 15px 8px; margin: 0 7px; border-bottom: 1px solid #e6e6e6;">'
						+ '<div class="publicityTitle">'
						+ info.publicityTitle
						+ '</div><div class="publicityData"><div class="publicityDataLeft">'
						+ '公示时间：</div><div class="publicityDataRight">'
						+ getTime(info.createTime)
						+ '</div>'
						/* + '<div class="publicityDataLeft">'
						+ '项目级别：</div><div class="publicityDataRight"><font style="color:#f14342;">'
						+ info.declareGrade
						+ '</font>&nbsp;</div>'
						+ '<div class="publicityDataLeft">'
						+ '主管单位：</div><div class="publicityDataRight">'
						+ (info.supervisorName==null?"&nbsp;":info.supervisorName)
						+ '</div>' */
						+ '</div></div>'
						+ '</div><div style="clear:both;"></div></div></a>';
						$(".publicityCont").append(_divList);
					}
		 			$("#noDataList").hide();
		 		}else if(result.code == 2){
		 			$("#noDataList").show();
		 		}else{
		 			$("#noDataList").show();
		 			layer.msg("获取数据失败");
		 		}
		 		
		 		if (result.code != 1) {
					$('#getmore').hide();
				} else {
					$('#getmore').show();
				}
		 	},

			error : function() {
				layer.msg("系统异常");
			}
	 });
 }

 	
 	/* 加载更多 */
	function getmore() {
		pageNumber++;
// 		$('#pageNum').val(pageNumber);
	 	getPublicList(pageNumber,"");
	}
//公示详情
	function view(id,declareId){
		$('#detailsForm').attr("action","${ctx}/projectDeclare/weixin/publicityView?publicityId="+id+"&declareId="+declareId);
		$("#detailsForm").submit();
	}
 
 	function queryByKey(key) {
// 		$('#declareTitle').val(key);
		pageNumber = 1;
		$('#pageNum').val(pageNumber);
		getPublicList(1,key);
	}
 
//  	function optionBtnClick(option) {
//  		$('.optionBtn').each(function(index, item) {
//  			$(item).removeClass("selected");
//  		});
//  		$(option).addClass("selected");
//  		var str = $(option).text();
//  		if (str == '不限') {
//  			$('#declareGrade').val('');
//  			$('#declareTitle').val('');
//  		} else {
//  			$('#declareGrade').val(str);
//  			$('#declareTitle').val('');
//  		}
//  		hideAllDropdown();
// 		pageNumber = 1;
// 		$('#pageNum').val(pageNumber);
// 		getPublicList(1,"");
//  	}

	/**
	 **隐藏所有下拉框
	 */
	function hideAllDropdown() {
		$(".hidebg").hide();
		$(".search").removeClass("colorDeep");
		$("#dropdown").slideUp("fast");
	}

	function searchClick() {
		hideAllDropdown();
	}
	
	/* 年月日转换方法*/
	function getTime(time) { 
		var date = new Date(time);
		Y = date.getFullYear() ;
		M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
				.getMonth() + 1);
		D = (date.getDate() < 10 ?( '0' + date.getDate() ) : date.getDate() ) + ' ';
		h = (date.getHours() < 10 ?( '0' + date.getHours() ) : date.getHours() ) + ':';
		m = (date.getMinutes() < 10 ?( '0' + date.getMinutes() ) : date.getMinutes() ) + ':';
		s = (date.getSeconds() < 10 ?( '0' + date.getSeconds() ) : date.getSeconds() );
		return (Y +"年"+ M +"月"+ D +"日" );
	}
 
</script>
</head>

<body>
<!-- <form id="publicListForm"> -->
<!-- 	<input type='hidden' name='pageNum' id="pageNum" value=1></input> -->
<!-- 	<input type='hidden' name='pageSize' value='4'></input> -->
<!-- 	<input type='hidden' name='declareGrade' id='declareGrade'></input> -->
<!-- 	<input type='hidden' name='declareTitle' id='declareTitle'></input> -->
<!-- 	<input type='hidden' name='declareStatus' id='declareStatus' value='2'></input> -->
<%-- 	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/> --%>
<!-- </form> -->
<form id="detailsForm" action="" method="post">
	<input type='hidden' name='detailsType' value='"resultPublicity"'></input>
	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
</form>
<div class="hidebg"></div>
<div class="publicity_main">
	<div class="publicity_content">
		<div class="searchBar">
			<div class="search" style="display:none">
				<img src="${ctx}/static/weixin/images/activity/sort.png" width="28px;" height="28px;" style="margin:10px 12px;"/>
			</div>
			<input type="search" class="searchInput" onsearch="queryByKey(this.value);" onClick="searchClick();" placeholder="请输入搜索关键字"/>
			<div class="message">
				<img src="${ctx}/static/weixin/images/activity/message.png" width="28px;" height="28px;" style="margin:10px 12px;"/>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div id="dropdown">
			<div class="dropdownContent">
				<div class="optionBtn selected" onClick="optionBtnClick(this)">不限</div>
				<div class="optionBtn" onClick="optionBtnClick(this)">国家级</div>
				<div class="optionBtn" onClick="optionBtnClick(this)">省级</div>
				<div class="optionBtn" onClick="optionBtnClick(this)">市级</div>
				<div class="optionBtn" onClick="optionBtnClick(this)">县级</div>
				<div style="clear:both;"></div>
			</div>
		</div>

		<div style="margin-top:60px;"></div>
		<div class="publicityCont">
		</div>
		<div style="text-align: center;">
			<span id="noDataList" class="renovateTitle">暂无数据</span>
		</div>
	</div>
	
	<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
		<div id="tbox">
			<a id="gotop" href="#top"></a>
		</div>
	
	<div class="navigationBar">
		<ul>
			<%-- <li><a href="${ctx}/personalCenter/weixin/main">
					<div class="navImage"><img src="${ctx}/static/weixin/images/personalCenter/shou.png" width="20px;" height="20px;" style=" margin-top: 6%"/></div>
					<div class="navTitle" style="margin-top: 8%;font-size: 12px">首页</div>
				</a></li> --%>
			<li><a href="${ctx}/auth/page/mobile/weixin/projectDeclare/weixin/main">
					<div class="navImage"><img src="${ctx}/static/weixin/images/projectDeclare/findprojected.png" width="20px;" height="20px;" style=" margin-top: 6%"/></div>
					<div class="navTitle">找项目</div>
				</a></li>
			<li><a href="${ctx}/projectDeclare/weixin/publicityList">
					<div class="navImage"><img src="${ctx}/static/weixin/images/projectDeclare/resultShowed.png" width="20px;" height="20px;" style=" margin-top: 6%"/></div>
					<div class="navTitle">结果公示</div>
				</a></li>
			<li><a href="javascript:;" class="viewMore">
					<div class="navImage"><img src="${ctx}/static/weixin/images/logistics/more.png" width="20px;" height="20px;" style=" margin-top: 6%"/></div>
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
