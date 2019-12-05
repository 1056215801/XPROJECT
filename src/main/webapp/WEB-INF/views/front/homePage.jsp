<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>首页</title>
<link href="${ctx}/static/css/personalCenter/homepage.css" rel="stylesheet"/>
<script>
 $(function(){
	getProjectList(0,"");
	 
	$('#searchProject').click(function(){
		getProjectList(0,$('#searchProjectText').val());
	});
	 
    $(".tabName ul li").each(function(){//页面头部模块切换控制
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	$(".tabItem ul li").each(function(){
		/* $(".tabItem ul li").eq(0).addClass("itemClick"); */
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		});
    });
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	$(".searchOptions .optionBtn").click(function(){//标签选择控制
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}else{
			$(this).addClass("selected");
		}
	});
 });
 
 function getProjectList(type,declareTitle){
	$.ajax({
		url:"${ctx}/projectDeclare/json/list",
		type:"get",
		data:{
				"declareTitle":declareTitle,
				"type":type,
				"pageNum":1,
				"pageSize":4
			 },
		dataType:"json",
		success:function(result){
			if(result.code==-1){
				tips("项目列表获取异常！");
			}else if(result.code==2){
				$('#projectList').html('<span class="renovateTitle">暂无更多信息</span>');
			}else{
				$('#projectList').empty();
				var list = result.value;
				for(var i=0;i<list.length;i++){
					var info = list[i];
					var name = info.declareTitle;
					if(name.length>31){
						name = name.substring(0,31)+"...";
					}
					
					var _div = 	'<div class="sb_dataBar">'
								+'<div class="sb_dataTop">'
								+'<div class="sb_title">'+name;
					var time = new Date().getTime() - new Date(info.createTime).getTime();
					if(time<=Number(3*24*3600*1000)){
						_div += '<img src="${ctx}/static/image/personalCenter/new.gif" width="20" height="8" style="vertical-align:middle;">';
					}
					_div += '</div>';
					if(info.declareStatus==0){
				  		div += '<div class="sb_labelGreen">申报中</div>';
				 	}else if(info.declareStatus==1){
						_div += '<div class="sb_labelGray">已截止</div>';
					}else{
						_div += '<div class="sb_labelBlue">已公示</div>';
					}
					_div += '</div>'
							+'<div class="sb_dataBottom">'
							+'<div class="sb_data">'+info.createTimeStr+'&nbsp;&nbsp;'+info.declareGrade+'&nbsp;&nbsp;'+info.supervisorName+'</div>'
							+'<div class="sb_term">';
					if(info.endDate==-1){
						_div +=  '申报已截止';
					}else if(info.endDate==null){
						_div +=  info.declareRemark;
					}else{
						 _div += '距离申报结束还有<font style="font-size:16px; color:#f14342;">'+info.endDate+'</font>天';
					}
					_div += '</div>'
						 +'</div>'
						 +'</div>';
				    $('#projectList').append(_div); 
				}
			}
		},error:function(result){
			tips("项目列表获取异常！");
		},
	});
 }
 
 
 function moreProject(){
	 window.location.href="${ctx}/projectDeclare/main";
 }
 function createProject(){
	 window.location.href="${ctx}/projectDeclare/create";
 }
</script>
</head>

<body>
<div class="home_main">
	<div class="project_header">
		<%@ include file="common/header.jsp"%>
	</div>
	<img src="${ctx}/static/image/personalCenter/gg.jpg" width="100%" style="display:block;">
	<div class="home_content">
		<div class="home_projectBar">
			<img src="${ctx}/static/image/personalCenter/sb.jpg" width="211" height="359" class="home_imgContral">
			<img src="${ctx}/static/image/personalCenter/sb1.jpg" width="363" height="359" class="home_imgContral">
			<div class="home_projectData">
				<div class="home_projectDataTop">
					<input type="text" placeholder="找申报" class="searchBox" id="searchProjectText">
					<input type="button" value="搜&nbsp;索" class="searchBtn" id="searchProject">
					<div class="releaseOper">
						<img src="${ctx}/static/image/personalCenter/arrow.jpg" style="vertical-align:middle;">
						<span style="vertical-align:middle;" onclick="createProject();">发项目</span>
					</div>
					<div class="moreOper" onclick="moreProject();">更多></div>
				</div>
				<div style="margin:0 5px;" id="projectList">
				<!-- 	<div class="sb_dataBar">
						<div class="sb_dataTop">
							<div class="sb_title">测试项目申报</div>
							<div class="sb_labelGreen">申报中</div>
						</div>
						<div class="sb_dataBottom">
							<div class="sb_data">2016年11月07日&nbsp;&nbsp;市级&nbsp;&nbsp;省工信委</div>
							<div class="sb_term">距离申报结束还有<font style="font-size:16px; color:#f14342;">18</font>天</div>
						</div>
					</div>
					<div class="sb_dataBar">
						<div class="sb_dataTop">
							<div class="sb_title">测试项目申报</div>
							<div class="sb_labelBlue">已公示</div>
						</div>
						<div class="sb_dataBottom">
							<div class="sb_data">2016年11月07日&nbsp;&nbsp;市级&nbsp;&nbsp;省工信委</div>
							<div class="sb_term">申报已截止</div>
						</div>
					</div>
					<div class="sb_dataBar">
						<div class="sb_dataTop">
							<div class="sb_title">下达2016年第二批省重点建设项目计划下达2016年第二批省重...</div>
							<div class="sb_labelGreen">申报中</div>
						</div>
						<div class="sb_dataBottom">
							<div class="sb_data">2016年11月07日&nbsp;&nbsp;市级&nbsp;&nbsp;省工信委</div>
							<div class="sb_term">常年有效</div>
						</div>
					</div>
					<div class="sb_dataBar">
						<div class="sb_dataTop">
							<div class="sb_title">测试项目申报</div>
							<div class="sb_labelGreen">申报中</div>
						</div>
						<div class="sb_dataBottom">
							<div class="sb_data">2016年11月07日&nbsp;&nbsp;市级&nbsp;&nbsp;省工信委</div>
							<div class="sb_term">距离申报结束还有<font style="font-size:16px; color:#f14342;">18</font>天</div>
						</div>
					</div> -->
					
				</div>
			</div>
			<div style="clear:both;"></div>
		</div>
		
		<div class="home_projectBar">
			<img src="${ctx}/static/image/personalCenter/hd.jpg" width="211" height="359" class="home_imgContral">
			<img src="${ctx}/static/image/personalCenter/hd1.jpg" width="363" height="359" class="home_imgContral">
			<div class="home_projectData">
				<div class="home_projectDataTop">
					<input type="text" placeholder="找活动" class="searchBox" id="activityName">
					<input type="button" value="搜&nbsp;索" class="searchBtn" id="activitySearch">
					<div class="releaseOper">
						<img src="${ctx}/static/image/personalCenter/arrow.jpg" style="vertical-align:middle;">
						<span style="vertical-align:middle;" onclick="window.location.href='${ctx}/projectActivity/create'">发活动</span>
					</div>
					<div class="moreOper" onclick="window.location.href='${ctx}/projectActivity/main'">更多></div>
				</div>
				<div style="margin:9.8px 5px;" id="activityList"></div>
			</div>
			<div style="clear:both;"></div>
		</div>
		
		<div class="home_projectBar">
			<img src="${ctx}/static/image/personalCenter/dc.jpg" width="211" height="359" class="home_imgContral">
			<img src="${ctx}/static/image/personalCenter/dc1.jpg" width="363" height="359" class="home_imgContral">
			<div class="home_projectData">
				<div class="home_projectDataTop">
					<input type="text" placeholder="找调查" class="searchBox" id="investigationName">
					<input type="button" value="搜&nbsp;索" class="searchBtn" id="investigationSearch">
					<div class="releaseOper">
						<!-- <img src="${ctx}/static/image/personalCenter/arrow.jpg" style="vertical-align:middle;">
						<span style="vertical-align:middle;">发调查</span> -->
					</div>
					<div class="moreOper" onclick="window.location.href='${ctx}/investigation/main'">更多></div>
				</div>
				<div style="margin:9.8px 5px;" id="investigationList"></div>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
	<%@ include file="common/footer.jsp"%>
</div>
</body>
<script type="text/javascript">
	$(function(){
		getActivityList(1,1,"","");
		getList(1,1,"",[-1,1]);
	
		$("#activitySearch").click(function(){
			var searchKey = $("#activityName").val();
			if(searchKey==null||searchKey==""){
				layer.msg("请输入搜索内容");
				return;
			}
			getActivityList(1,1,searchKey,"");
		});
		
		$("#investigationSearch").click(function(){
			var searchKey = $("#investigationName").val();
			if(searchKey==null||searchKey==""){
				layer.msg("请输入搜索内容");
				return;
			}
			getList(1,1,searchKey,[-1,1]);
		});
	}); 
	function getActivityList(pageNum,type,activityName,tags){
		$("#activityList").empty();
		$.ajax({
			url:"${ctx}/projectActivity/json/activityList",
			type:"post",
			data:{
					"pageNum":pageNum,
					"pageSize":8,
					"type":type,
					"activityName":activityName,
					"activityTags":tags,
					'${_csrf.parameterName}':'${_csrf.token}'
				 },
			dataType:"json",
			success:function(result){
				if(result.code==-1){
					layer.alert(result.msg);
				}else if(result.code==2){
					$("#activityList").append('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">亲，暂无您查询的内容！</span></div>');
				}else{
					var list = result.value;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div = '<div class="hd_dataBar">'
							+'<div class="hd_arrow">></div>';
							
						if(info.activityName.length>28){
							_div += '<div class="hd_title" title="'+info.activityName+'" onclick="activityDetails(\''+info.activityId+'\')" style="cursor:pointer;">'+info.activityName.substring(0,27)+'...';
						}else{
							_div += '<div class="hd_title" title="'+info.activityName+'" onclick="activityDetails(\''+info.activityId+'\')" style="cursor:pointer;">'+info.activityName;
						}
							
						var time = new Date().getTime() - new Date(info.createTime).getTime();
						if(time<=Number(3*24*3600*1000)){
							_div += '<img src="${ctx}/static/image/personalCenter/new.gif" width="20" height="8" style="vertical-align:middle;">';
						}
						_div += '</div>';
						if(info.status==1){
							_div += '<div class="hd_stateRed">进行中</div>';
						}else{
							_div += '<div class="hd_stateGray">已结束</div>';
						}
							
						_div += '</div>';
						
						$("#activityList").append(_div);
					}
					
				}
				
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
	
	
	//获取调查列表
	function getList(pageNum,type,investigationName,status){
		$("#investigationList").empty();
		$.ajax({
			url:"${ctx}/investigation/json/list",
			type:"post",
			data:{
				"pageNum":pageNum,
				"pageSize":8,
				"type":type,
				"investigationName":investigationName,
				"statusArray":status.toString(),
				'${_csrf.parameterName}':'${_csrf.token}'
			},
			dataType:"json",
			success:function(result){
				if(result.code==-1){
					layer.alert(result.msg);
				}else if(result.code==2){
					$("#investigationList").append('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">亲，暂无您查询的内容！</span></div>');
				}else{
					var list = result.value;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div = '<div class="dc_dataBar">'
							+'<div class="dc_arrow">></div>'
							+'<div class="dc_titleBar" title="'+info.investigationName+'" onclick="detail(\''+info.id+'\')" style="cursor:pointer;">';
							
						if(info.investigationName.length>20){
							_div += '<div class="dc_title">'+info.investigationName.substring(0,19)+'...';
						}else{
							_div += '<div class="dc_title">'+info.investigationName;
						}
							
						var time = new Date().getTime() - new Date(info.publishTime).getTime();
						if(time<=Number(3*24*3600*1000)){
							_div += '<img src="${ctx}/static/image/personalCenter/new.gif" width="20" height="8" style="vertical-align:middle;">';
						}
						_div += '</div></div>';	
						
						if(info.status==1){
							_div += '<div class="dc_stateYellow">进行中</div>';
						}else if(info.status==-1){
							_div += '<div class="dc_stateGray">已结束</div>';
						}
						_div += '<div class="dc_numberBar">'
							+'<img src="${ctx}/static/image/personalCenter/headsmall.png" width="15" height="15" style="vertical-align:middle;">'
							+'<div class="dc_number">参与人气：<font style="color:#f1921c;">'+info.totalCount+'</font>人</div>'
							+'</div>'
							+'</div>';
							
						$("#investigationList").append(_div);
					}
				}
					
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			} 
			
		}); 
	}
	
	function activityDetails(activityId){
		window.location.href="${ctx}/projectActivity/details/"+activityId;
	}
	
	//填写详情可编辑
	function detail(id){
		window.location.href="${ctx}/investigation/createInfo/"+id;
	}
</script>

</html>
