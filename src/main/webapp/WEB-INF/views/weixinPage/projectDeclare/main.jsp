<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>找项目</title>
<link href="${ctx}/static/weixin/css/projectDeclare/projectApplication.css" rel="stylesheet"/>
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet"/>
<script>
	var pageNumber = 1;
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
			hideAllDropdown();
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
		$('#pageNum').val(1);
		getproductList();

		$('#tbox').hide();//隐藏小火箭
		$('#getMore').hide();//隐藏加载更多
		$("#proList").hide();//隐藏暂无数据

	})

	/* 异步加载找项目列表  */
	function getproductList() {
		$.ajax({
			url : "${ctx}/projectDeclare/json/list",
			type : "post",
			data : $('#list').serialize(),
			dataType : "json",
			success : function(result) {
				//code:0为没有下一页、2为没数据、-1为报错
				if(result.code == -1){
					$("#proList").hide();
					layer.msg("获取数据失败");
				}else if(result.code==2){
					$("#proList").show();
					if (pageNumber == 1) {
						$(".projectCont").empty();
					}
				}else if(result.code==-2){
					$(".projectCont").empty();
					$("#proList").show();
					layer.msg(result.msg);
				}else{
					var list = result.value;
					if (pageNumber == 1) {
						$(".projectCont").empty();
					}
					for (var i = 0; i < list.length; i++) {
						var info = list[i];
						if ($('#type').val() == 4 && info.endDate == null) {
							continue;
						}
						var _divList = '<div class="projectDataBar" onclick="viewDetails(\''+info.declareId+'\')">';
						_divList += '<div style="float:left;">';
						_divList += '<div class="projectTimeLimit"><div class=';
						_divList += ((info.endDate==-1? '"projectTimeLimitContGray">申报截止' : (info.endDate==null?'"projectTimeLimitContRed">常年有效':('"projectTimeLimitContRed">剩余' + info.endDate + '天'))) + '</div>');
						_divList += '</div>';
						_divList += ('<div class=' + (info.declareStatus==0?"projectStateGreen>申报中":info.declareStatus==1?"projectStateGray>已截止":"projectStateBlue>已公示") + '</div>');
						_divList += '</div>';
						_divList += '<div style="margin-left:25%; padding:7px 0;">';
						_divList += ('<div class="projectTitle">' + info.declareTitle + '</div>');
						_divList += '<div class="projectData">';
						_divList += '<div class="projectDataLeft">发布时间：</div>'
						_divList += ('<div class="projectDataRight">' + (info.createTimeStr==null?"&nbsp;":info.createTimeStr) + '</div>');
						_divList += '<div class="projectDataLeft">项目级别：</div>';
						_divList += ('<div class="projectDataRight">' + (info.declareGrade==null?"&nbsp;":info.declareGrade) + '</div>');
						_divList += '<div class="projectDataLeft">主管单位：</div>';
						_divList += ('<div class="projectDataRight">' + (info.supervisorName==null?"&nbsp;":info.supervisorName) + '</div>');
						_divList += '</div>';
						_divList += '</div>';
						_divList += '<div style="clear:both;"></div>';
						if(info.isRecommend==1){
							_divList += '<img src="${ctx}/static/weixin/images/projectDeclare/recommend.png" width="47px;" height="47px;" class="recommendItem">';
						}
						_divList += '</div>';
						$(".projectCont").append(_divList);
					}
					$("#proList").hide();
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

	function optionbtnClick(title) {
		$(".optionBtn").each(function(index, item) {
			$(item).removeClass("selected");
		});
		$(title).addClass("selected");
		var str = $(title).text();
		if (str == '不限') {
			$('#declareGrade').val('');
			$('#declareStatus').val('');
			$('#declareTitle').val('');
		}
		var s = $(title).attr('value');
		if (s == -1) {
			$('#declareGrade').val($(title).text());
			$('#declareStatus').val('');
			$('#declareTitle').val('');
		} else {
			$('#declareGrade').val('');
			$('#declareStatus').val(s);
			$('#declareTitle').val('');
		}
		hideAllDropdown();
		pageNumber = 1;
		$('#pageNum').val(pageNumber);
		getproductList();
	}

	function queryByKey(key) {
		$('#declareTitle').val(key);
		pageNumber = 1;
		$('#pageNum').val(pageNumber);
		getproductList();
	}

	/* 加载更多 */
	function getMore() {
		pageNumber ++;
		$('#pageNum').val(pageNumber);
		getproductList();
	}

	/**
	 **隐藏所有下拉框
	 */
	function hideAllDropdown() {
		$(".hidebg").hide();
		$(".search").removeClass("colorDeep");
		$("#dropdown").slideUp("fast");
	}
	
	/* 查看详情 */
	function viewDetails(declareId){
		$('#detailsForm').attr("action","${ctx}/projectDeclare/weixin/view/"+declareId);
		$("#detailsForm").submit();
	}

	/* 到期提醒 */
	function borClick(bor) {
		$(".project_oper").each(function(index, item) {
			$(item).removeClass("selected");
		});
		$(bor).addClass("selected");
		var v = $(bor).attr("value");
		if (v == 0) {
			$('#type').val('0');
		} else if (v == 1) {
			$('#type').val('3');
		} else {
			$('#type').val('4');
		}
		pageNumber = 1;
		$('#pageNum').val(pageNumber);
		getproductList();
	}
</script>
</head>

<body>
<form id="list">
	<input type='hidden' name='pageNum' id='pageNum' value='1'></input>
	<input type='hidden' name='pageSize' id='pageSize' value='5'></input>
	<input type='hidden' name='type' id='type' value='0'></input>
	<input type='hidden' name='declareTitle' id='declareTitle'></input>
	<input type='hidden' name='declareGrade' id='declareGrade'></input>
	<input type='hidden' name='declareStatus' id='declareStatus'></input>
<%-- 	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>   --%>
</form>
<form id="detailsForm" action="" method="post">
	<input type='hidden' name='detailsType' value='"projectApplication"'></input>
	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
</form>
<div class="hidebg"></div>
<div class="project_main">
	<div class="project_content">
		<div class="searchBar">
			<div class="search">
				<img src="${ctx}/static/weixin/images/activity/sort.png" width="28px;" height="28px;" style="margin:10px 12px;"/>
			</div>
			<input type="search" class="searchInput" onClick="hideAllDropdown();" onsearch="queryByKey(this.value);" placeholder="请输入搜索关键字"/>
			<div class="message">
				<img src="${ctx}/static/weixin/images/activity/message.png" width="28px;" height="28px;" style="margin:10px 12px;"/>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div id="dropdown">
			<div class="dropdownContent">
				<div class="optionBtn selected" onClick="optionbtnClick(this);">不限</div>
				<div class="optionBtn" value='-1' onClick="optionbtnClick(this);">国家级</div>
				<div class="optionBtn" value='-1' onClick="optionbtnClick(this);">省级</div>
				<div class="optionBtn" value='-1' onClick="optionbtnClick(this);">市级</div>
				<div class="optionBtn" value='-1' onClick="optionbtnClick(this);">县级</div>
				<div class="optionBtn" value='0' onClick="optionbtnClick(this);">申报中</div>
				<div class="optionBtn" value='2' onClick="optionbtnClick(this);">已公示</div>
				<div class="optionBtn" value='1' onClick="optionbtnClick(this);">已结束</div>
				<div style="clear:both;"></div>
			</div>
		</div>
		
		<div style="margin-top:55px;"></div>
		<div class="project_operBar">
			<div style="width:15%;" class="project_oper borRight selected" onClick="borClick(this);" value="0">全部</div>
			<div style="width:25%;" class="project_oper borRight" onClick="borClick(this);" value="1">最新项目</div>
			<div style="width:25%;" class="project_oper borRight" onClick="borClick(this);" value="2">到期提醒</div>
			<div style="clear:both;"></div>
		</div>
		<!-- <div style="margin-top:2px;"></div> -->
		<div class="projectCont">
		</div>
	</div>

	<div class="myAppli_content">
		<div style="margin-top:10px;"></div>
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
					<div class="navImage"><img src="${ctx}/static/weixin/images/projectDeclare/findproject.png" width="20px;" height="20px;" style=" margin-top: 6%"/></div>
					<div class="navTitle">找项目</div>
				</a></li>
			<li><a href="${ctx}/projectDeclare/weixin/publicityList">
					<div class="navImage"><img src="${ctx}/static/weixin/images/projectDeclare/resultShow.png" width="20px;" height="20px;" style=" margin-top: 6%"/></div>
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
				<li><a href="${ctx}/projectDeclare/weixin/myListApplyPro" >我的申报</a></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>
