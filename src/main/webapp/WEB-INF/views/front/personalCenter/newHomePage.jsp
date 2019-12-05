<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>首页</title>
<link href="${ctx }/static/css/personalCenter/homepage.css" rel="stylesheet"/>
<link href="${ctx }/static/css/personalCenter/projectHeader.css" rel="stylesheet"/>
<link href="${ctx }/static/css/personalCenter/projectFooter.css" rel="stylesheet"/>
<style type="text/css">
	.cy_dataBar1 {
		float:left;
		width:48%;
		height:175px;
		border-right:1px solid #ccc;
		margin: 2px;
	}
	.home_projectBar{
		height: 400px;
	}
</style>
<link href="${ctx}/static/css/projectDeclare/projectApplication.css"
	rel="stylesheet" />
<link href="${ctx}/static/css/projectDeclare/buttons.css"
	rel="stylesheet" />
	<style type="text/css">
	.declareLabel_blue1 {
    background-color: #45a9e5;
    border-radius: 15px;
    color: #fff;
    font-size: 16px;
    padding: 0 15px;
    position: absolute;
    right: 0;
    bottom: 0;
     }
     
     .declareLabel_green1 {
	position:absolute;
	right:0;
	font-size:16px;
	background-color:#0AD36C;
	border-radius:15px;
	color:#fff;
	padding:0 15px;
	bottom: 0;
}

.declareLabel_gray1 {
	position:absolute;
	right:0;
	font-size:16px;
	background-color:#B3B3B3;
	border-radius:15px;
	color:#fff;
	padding:0 15px;
	bottom: 0;
}

.declareData1 {
	margin-top:10px;
	height:100px;
	position:relative;
}
.declareDataBar1 {
	padding:10px 25px;
	position:relative;
	border-bottom:1px dashed #ccc;
	height:136px;
}
	</style>
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
		})
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(0).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		})
    });
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		})
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
					"pageSize":8
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
						if(name.length>19){
							name = name.substring(0,16)+"...";
						}
						var _div = '<div class="declareDataBar1">'
								  +'<a href="${ctx}/projectDeclare/view?declareId='+info.declareId+'" style="text-decoration:none;">'
								  +'<div style="float:left;">'
								  +'<img src="'+info.declareImage+'" width="200px;" height="100px;">'
								  +'<div style="text-align:center;">';
								  if(info.endDate==-1){
									  _div +=  '申报已截止';
								  }else if(info.endDate==null){
									  _div +=  info.declareRemark;
								  }else{
									  _div += '距离申报结束还有<font style="color:#f14342; font-size:16px;">'+info.endDate+'</font>天';
								  }
						   _div += '</div>'
								  +'</div>'
								  +'<div style="margin-left:220px;">'
								  +'<div class="declareTitle">'+name+'</div>'
								  +'<div class="declareData1">'
								  +'<div style="color:#8A8A8A; float:left;">'
								  +'<div class="declareDataLeft">发布时间：</div>'
								  +'<div class="declareDataRight">'+info.createTimeStr+'</div>'
								  +'<div class="declareDataLeft">项目级别：</div>'
								  +'<div class="declareDataRight">'+info.declareGrade+'</div>'
								  +'<div class="declareDataLeft">主管单位：</div>'
								  +'<div class="declareDataRight">'+info.supervisorName+'</div>';
						 		 if(info.declareStatus==0){
						  		  _div += '<div class="declareLabel_green1">申报中</div>';
						 		  }else if(info.declareStatus==1){
									_div += '<div class="declareLabel_gray1">已截止</div>';
									}else{
									_div += '<div class="declareLabel_blue1">已公示</div>';
									  }
						    _div += '</div>'
						    	    +'<div style="clear:both;"></div>'
								  +'</div>'
								  +'</div>';
						  _div +=  '</a>'
								  +'</div>';
						            $('#projectList').append(_div); 
					
					}
				}
			},error:function(result){
				tips("产品列表获取异常！");
				},
			});
 }
 
 function moreProject(){
	 window.location.href="${ctx}/projectDeclare/main";
 }
 function createProject(){
	 window.location.href="${ctx}/projectDeclare/create";
 }
 function main(){
	 window.location.href="${ctx}/personalCenter/main";
 }
 
 


 

</script>
</head>

<body>
<div class="home_main">
		<%@ include file="../common/header.jsp"%>
	<%-- <div class="header_tab">
		<div class="tabItem" style="background-color:#f14342;">
			<ul>
				<li><a href="${ctx}/projectDeclare/main">项目申报</a></li>
				<li><a href="${ctx}/projectActivity/main">活动报名</a></li>
				<li><a href="${ctx}/investigation/main">在线调查</a></li>
			</ul>
			<ul style="display: none;">
				<li><a href="javascript:;">办公</a></li>
				<li><a href="javascript:;">审计</a></li>
			</ul>
		</div>  
	</div>--%>
	
	<img src="${ctx}/static/image/personalCenter/gg.jpg" width="100%" height="300" style="display:block;">
	<div class="home_content">
		<div class="home_projectBar">
			<img src="${ctx}/static/image/personalCenter/wul.jpg" width="233" height="357" class="home_imgContral">
			<img src="${ctx}/static/image/personalCenter/wul1.jpg" width="361" height="357" class="home_imgContral">
			<div class="home_projectData">
				<div class="home_projectDataTop">
					<input type="text" placeholder="找项目" class="searchBox" id="searchProjectText">
					<input type="button" value="搜&nbsp;索" class="searchBtn" id="searchProject">
					<div class="releaseOper" onclick="createProject();">>发项目</div>
					<div class="moreOper" onclick="moreProject();">更多></div>
				</div>
				<div id="projectList1" style="overflow:auto;height:316px;">
				<div style="margin:0 5px; height:136px;" id="projectList">
					
					
				</div>
				<div id="projectList2" style="margin:0 5px;"></div>
				</div>
				<!-- <script type="text/javascript">
				 var speed=30;
				 var colee2=document.getElementById("projectList2");
				 var colee1=document.getElementById("projectList");
				 var colee=document.getElementById("projectList1");
				 colee2.innerHTML=colee1.innerHTML; //克隆colee1为colee2
				 function Marquee1(){
				 	//当滚动至colee1与colee2交界时
				 	if(colee2.offsetTop-colee.scrollTop<=10){//0需要数据量大于页面承载数的2.5倍，否则设置为总长(根据不同方向需要的长宽)的1.5倍
				 	 colee.scrollTop-=colee1.offsetHeight; //colee跳到最顶端
				 	}else{
				 	 colee.scrollTop++
				 	}
				 }
				 var MyMar1=setInterval(Marquee1,speed)//设置定时器
				 //鼠标移上时清除定时器达到滚动停止的目的
				 colee.onmouseover=function() {clearInterval(MyMar1)}
				 //鼠标移开时重设定时器
				 colee.onmouseout=function(){MyMar1=setInterval(Marquee1,speed)}
				</script> -->
			</div>
			<div style="clear:both;"></div>
		</div>
		
		<!-- 活动 -->
		<div class="home_projectBar">
			<img src="${ctx}/static/image/personalCenter/cy.jpg" width="233" height="400" class="home_imgContral">
			<img src="${ctx}/static/image/personalCenter/cy1.jpg" width="361" height="400" class="home_imgContral">
			<div class="home_projectData">
				<div class="home_projectDataTop">
					<input type="text" placeholder="找活动" class="searchBox" id="activityName">
					<input type="button" value="搜&nbsp;索" class="searchBtn" id="activitySearch">
					<a class="releaseOper" href="${ctx}/projectActivity/create">>发布活动</a>
					<a class="moreOper" href="${ctx}/projectActivity/main">更多></a>
				</div>
				<div id="a1" style="overflow: hidden;height: 350px;" >
					<div id="activityList" ></div>
					<div id="a2"></div>
				</div>
				<script type="text/javascript">
				var speed1=30;
				var a2=document.getElementById("a2");
				var a=document.getElementById("activityList");
				var a1=document.getElementById("a1");
				a2.innerHTML=a.innerHTML; //克隆colee1为colee2
				function Marquee1(){
					//当滚动至colee1与colee2交界时
					if(a2.offsetTop-a1.scrollTop<=0){//0需要数据量大于页面承载数的2.5倍，否则设置为总长(根据不同方向需要的长宽)的1.5倍
					 a1.scrollTop-=a.offsetHeight; //colee跳到最顶端
					}else{
					 a1.scrollTop++;
					}
				}
				var MyMar1=setInterval(Marquee1,speed1);//设置定时器;
				//鼠标移上时清除定时器达到滚动停止的目的
				a1.onmouseover=function() {clearInterval(MyMar1);};
				//鼠标移开时重设定时器
				a1.onmouseout=function(){MyMar1=setInterval(Marquee1,speed1);};
				</script>
			</div>
			<div style="clear:both;"></div>
		</div>
		
		<!-- 调查 -->
		<div class="home_projectBar">
			<img src="${ctx}/static/image/personalCenter/gx.jpg" width="233" height="400" class="home_imgContral">
			<img src="${ctx}/static/image/personalCenter/gx1.jpg" width="361" height="400" class="home_imgContral">
			<div class="home_projectData">
				<div class="home_projectDataTop">
					<input type="text" placeholder="找调查" class="searchBox" id="investigationName">
					<input type="button" value="搜&nbsp;索" class="searchBtn" id="investigationSearch">
					<!-- <a class="releaseOper">>发供需</a> -->
					<a class="moreOper" href="${ctx}/investigation/main">更多></a>
				</div>
				<div style="overflow: hidden;height: 350px;" id="i1">
					<div style="margin:0 5px;" id="investigationList"></div>
					<div id="i2"></div>
				</div>
				<script type="text/javascript" >
				var speed2=30;
				var i2=document.getElementById("i2");
				var i=document.getElementById("investigationList");
				var i1=document.getElementById("i1");
				i2.innerHTML=i.innerHTML; //克隆colee1为colee2
				function Marquee2(){
					//当滚动至colee1与colee2交界时
					if(i2.offsetTop-i1.scrollTop<=0){//0需要数据量大于页面承载数的2.5倍，否则设置为总长(根据不同方向需要的长宽)的1.5倍
					 i1.scrollTop-=i.offsetHeight; //colee跳到最顶端
					}else{
						i1.scrollTop++;
					}
				}
				var MyMar2=setInterval(Marquee2,speed2);//设置定时器;
				//鼠标移上时清除定时器达到滚动停止的目的
				i1.onmouseover=function() {clearInterval(MyMar2);};
				//鼠标移开时重设定时器
				i1.onmouseout=function(){MyMar2=setInterval(Marquee2,speed2);};
				</script>
			</div>
			<div style="clear:both;"></div>
		</div>
		
	</div>
	
	<div class="project_footer">
		<div class="copyright">
			<div class="copyrightLeft">
				<div>
					<span>关于我们</span>&nbsp;<span>联系我们</span>&nbsp;<span>法律条款</span>&nbsp;<span>开放平台</span>
				</div>
				<div class="font12" style="margin-top:30px;">
					<div>Copyright @ 2016 - 2020 CloudCommunity Inc.All Rights Reserved.Powered by 融合科技</div>
					<div>江西融合科技有限责任公司 赣ICP备16003961号-1</div>
				</div>
			</div>
			<div class="copyrightRight">
				<div style="float:left;">
					<div class="font12">
						<div class="alignRight">扫描二维码加入</div>
						<div class="alignRight">微信公众号：1232434</div>
					</div>
					<div class="copyrightTel">
						<img src="${ctx}/static/image/personalCenter/phone.png" width="20px;" height="20px;">
						<span class="font16">服务热线</span>
						<span class="font26" style="margin-left:5px;">968969</span>
					</div>
				</div>
				<img src="${ctx}/static/image/personalCenter/new2.jpg" width="100px" height="100px;" class="QRcodeImg">
				<div style="clear:both;"></div>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
</div>

</body>
<link href="${ctx}/static/css/activity/activityRegistration.css" rel="stylesheet"/>
<link href="${ctx}/static/css/activity/style_deepred.css" rel="stylesheet" media="screen" />
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
					"pageSize":10,
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
						var _div = '<div class="cy_dataBar1">'
						+'<div style="position: relative;">'
						+'<img src='+info.activityImage+' width="100%" height="100px;"onclick="activityDetails(\''+info.activityId+'\')" style="cursor:pointer;"/>'/* width="100%;" height="120px;" */
						/* +'<div class="activity-tagBox">'
						+'<i class="icon-bg"></i>'
						+'<ul>';
						var tag = info.activityTags.split(",");
						if(tag!=""&&tag!=null){
							for(var j=0;j<tag.length;j++){
								if(tag[j]!=""&&tag[j]!=null){
									_div += '<li>'+tag[j]+'</li>';
								}
							}
						}
						_div += '</ul>'
						+'<div class="tag-bg"></div>'
						+'</div>' */
						+'<div class="activityCont_title">';
						
						if(info.activityName.length<=13){
							_div += '<div class="activityCont_text">'+info.activityName+'</div>';
						}else{
							_div += '<div class="activityCont_text" title="'+info.activityName+'">'+info.activityName.substring(0,12)+'...</div>';
						}
						
						if(info.status==1){
							_div += '<div id="'+info.activityId+'" class="activityBtn registrationIn">报名中</div>';
						}else{
							_div += '<div id="'+info.activityId+'" class="activityBtn registrationIn hasEnded">已结束</div>';
						}
						
						_div += '<div style="clear:both;"></div>'
						+'</div>'
						+'<div class="activityCont_data">'
						+'	<img src="${ctx}/static/image/activity/time.png" width="10px;" height="10px;">&nbsp;'
						+'	<span>'
						+'	'+info.start+'至'
						+'	'+info.end+''
						+'</div>'
						+'<div class="activityCont_data">'
						+'	<img src="${ctx}/static/image/activity/location.png" width="10px;" height="10px;">&nbsp;';
						if(info.activityLocation.length<=18){
							_div += '<span>'+info.activityLocation+'</span>';
						}else{
							_div += '<span title="'+info.activityLocation+'">'+info.activityLocation.substring(0,17)+'...</span>';
						}
						_div += '</div>'
						+'</div>';
						$("#activityList").append(_div);
					}
					$("#activityList").append('<div style="clear:both;"></div>');
					
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
				"pageSize":10,
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
						var _div = '<div class="cy_dataBar1"><img src='+info.extend1+' width="100%;" height="150px;" style="display:block;cursor:pointer;" onclick="detail(\''+info.id+'\')">'
						+' <div class="surveyPictureTips">'+info.investigationName+'</div></div>';
						$("#investigationList").append(_div);
						
					}
					$("#investigationList").append('<div style="clear:both;"></div>');
						
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
