<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>活动报名</title>
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
			<div class="container">
				<img src="${ctx}/static/image/homePage_yc/projectDsc.png"/>
				&nbsp;&nbsp;&nbsp;&nbsp;<font class="projectNum">${activityCount}</font>&nbsp; 项  &nbsp;&nbsp; 活动
				&nbsp;&nbsp;&nbsp;&nbsp;<font class="projectNum">${activityLiveCount}</font>&nbsp; 项  &nbsp;&nbsp; 正在进行
			</div>
		</div>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-list">
							<div class="titleName">
								<ul>
									<li class="on">全部项目</li>
									<li>我申报的</li>
									<li>已发项目</li>
								</ul>
								<input type="hidden" id="type" value="1" />
								<input type="hidden" id="pageNum" value="1" />
							</div>
							<div class="searchKeys">
								<div class="searchOptions" id="allKey">
									<div class="optionBtn selected" onclick="selectByKey(this,2);">全部</div>
								</div>
								<div class="searchOptions" id="declareGrade">
									<c:forEach items="${tagList}" var="tags">
										<div class="optionBtn" onclick="selectByKey(this,'1')">${tags.tagName}</div>
									</c:forEach>
								</div>
								<div style="clear: both;"></div>
							</div>
							<div class="title-items">
								<div class="title-content" id="set0">
									<div id="allList">
										<div class="declareDataBar">
											<a href="/XProject/projectDeclare/view?declareId=ID" style="text-decoration: none;">
												<div style="float: right;">
													<img src="" width="200px;" height="121px;">
												</div>
												<div style="margin-right: 220px;">
													<img class="levelImg" src="${ctx}/static/image/homePage_yc/level1.png" />
													<div class="declareTitle" style="margin-left: 60px;height: 60px;">
														<span class="flag">已截止</span><span class="triang"></span>项目申报项目申报项目申报项目申报2017年江西省级工业设计中心名单公示
													</div>
													<div class="declareData">
														<div class="declareBox" >
															<div class="declareDiv">
																<div class="declareTit">发布时间：</div>
																<div class="declareCon">2018年03月23日</div>
																<div class="clear"></div>
															</div>
															<div class="declareDiv">
																<div class="declareTit">项目级别：</div>
																<div class="declareCon">国家级</div>
																<div class="clear"></div>
															</div>
															<div class="declareDiv">
																<div class="declareTit">主管单位：</div>
																<div class="declareCon">江西省工信委</div>
																<div class="clear"></div>
															</div>
															<div class="clear"></div>
														</div>
													</div>
													<div class="clear"></div>
												</div>
												<div style="margin-right: 220px;">
													富文本内容富文本内容富文本内容富文本内容富文本内容富文本内容富文本内容富文本内容富文本内容富文本内容富文本内容富文本内容
												</div>
												<div class="clear"></div>
											</a>
										</div>
	
									</div>
									<div id="getmoreAllActi" class="renovate">
										<a href="javascript:void(0);" onClick="getmore();"> 
											<span class="renovateTitle">加载更多</span>
										</a>
									</div>
								</div>
		
								<div class="title-content" id="set1" style="display: none;">
									<div id="myApplyPro"></div>
									<div id="getmoreAllActii" class="renovate">
										<a href="javascript:void(0);" onClick="getmore();"> 
											<span class="renovateTitle">加载更多</span>
										</a>
									</div>
								</div>
		
								<div class="title-content" id="set2" style="display: none;">
									<div id="mylist"></div>
									<div id="getmoreAllActiii" class="renovate">
										<a href="javascript:void(0);" onClick="getmore();"> 
											<span class="renovateTitle">加载更多</span>
										</a>
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

		<div id="authorityTips" style="display: none;">
			<div>
				<img src="${ctx}/static/image/projectDeclare/headPortrait.png"
					width="90px;" height="90px;"
					style="display: block; margin: 25px auto;">
				<div style="margin: 0 auto 30px; color: #aaa; text-align: center;">你当前账号未开通发布项目权限</div>
				<div style="width: 80%; margin: 0 auto;">
					<input type="button" class="button button-raised button_Contral"
						style="width: 37%;" value="暂不申请"> <input type="button"
						class="button button-raised button-caution button_Contral"
						style="width: 58%;" value="我要申请">
				</div>
			</div>
		</div>

	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	</div>
</body>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script type="text/javascript">
$(function(){
	$(".nav-content a").removeClass("on");
	$(".nav-content a:eq(5)").addClass("on");
	$(".titleName li").on("click",function(){          //大项目tab切换
		 var $ind = $(this).index() + 1;

		 $(".searchKeys .optionBtn").removeClass("selected");
		 $(".searchKeys .optionBtn:eq(0)").addClass("selected");
		 $(".optionBtn").each(function(){
			 var $ind2 = $(this).text().indexOf("(");
			 var t = $(this).text().substring(0,$ind2)
			 if($ind2 > -1){ $(this).text(t)}
		 })
		 $("#type").val(ind);
		 getInfoList(1,10,$ind,'','');
		 
		 $(this).addClass("on").siblings().removeClass("on");
		 $("#set"+$ind).siblings().fadeOut("fast");
		 setTimeout(function(){$("#set"+$ind).fadeIn("fast");},200);
	});
	getInfoList(1,10,1,"","");
	
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
function getInfoList(pageNum,pageSize,type,declareGrade,declareTitle){ //type: 0:全部项目 1:我申报的 2:已发项目
	$('#pageNum').val(pageNum);
	$.ajax({
		url:"${ctx}/projectActivity/json/activityList",
		type:"get",
		data:{
				"pageNum":pageNum,
				"pageSize":pageSize,
				"type":type,
				"activityTags":declareGrade,
				"activityName":declareTitle,
				"statusArray":[0,1].toString()
			 },
		dataType:"json",
		success:function(result){
			if(result.code==-1){
				layer.alert(result.msg);
			}else if(result.code==2){
				if(type==1){
					 $('#allList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
				    }else if(type==2){
					  $('#myApplyPro').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
				  }else if(type==3){
					  $('#mylist').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
				  }
				$('#getmoreAllActi').hide();
				$('#getmoreAllActii').hide();
				$('#getmoreAllActiii').hide();
			}else if(result.code==-2){
				layer.msg(result.msg);
				$('#getmoreAllActi').hide();
				$('#getmoreAllActii').hide();
				$('#getmoreAllActiii').hide();
			}else{
				var list = result.value;
				var total = result.msg.split(",");
				$(".optionBtn").each(function(){
					if($(this).hasClass("selected")){
						$(this).text($(this).text() + "("+total[1]+")");
					}
				})
				if(type==1&&pageNum==1){
					 	$('#allList').empty();
				    }else if(type==2&&pageNum==1){
					  	$('#myApplyPro').empty();
				    }else if(type==3&&pageNum==1){
					  	$('#mylist').empty();
				    }
				 
				for(var i=0;i<list.length;i++){
					var info = list[i];
					var text = info.activityDescription;
					text = text.replace(/<(table|tr|td|%)[\s\S]*?\/\1>/ig,"");
					text = text.replace(/<[^>]+>/g,"");
							  
					var _div =   '<div class="declareDataBar">'
						+'<a href="${ctx}/projectDeclare/view?declareId='+info.activityId+'">'
						+	'<div class="text-box">';
				    _div += '<div class="title-text"><div class="declareTitle">';
					if(info.status==1){
				  		_div += '<span class="flag flag1">报名中</span><span class="triang triang1"></span>';
				 		}else{
						_div += '<span class="flag flag2">已结束</span><span class="triang triang2"></span>';
						}
					_div += info.activityName+'</div>'
							
						+'<div class="declareData">'
						+	'<font>活动时间：'+info.start+'至'+info.end+'</font>'
						+	'<font>活动地址：'+info.activityLocation+'</font></div>'
						+'</div><div class="declare-content">'+text+'</div></div>'
						+'<img src="'+info.activityImage+'">'+'</a></div>';
					  
					  if(type==1){
			            $('#allList').append(_div); 
					  }else if(type==2){
						  $('#myApplyPro').append(_div); 
					  }else{
						  $('#mylist').append(_div); 
					  }
							  
					if(result.code==0){
						$('#getmoreAllActi').hide();
						$('#getmoreAllActii').hide();
						$('#getmoreAllActiii').hide();
					}else if(result.code==1){
						$('#getmoreAllActi').show();
						$('#getmoreAllActii').show();
						$('#getmoreAllActiii').show();
					}
				}
			}
		},
		error:function(){
			tips("请求超时，请稍后重试");
			},
		});
}

function selectByKey(obj,kind){
	 $('#allList').empty();
	 $('#myApplyPro').empty();
	 $('#mylist').empty();
	 var declareStatus = null;
	 var declareGrade = null;
	 var declareTitle = $('#declareTitle').val();
	 var type =   $('#type').val();
	 $(".searchKeys .optionBtn").removeClass("selected");
	 $(".optionBtn").each(function(){
		 var $ind = $(this).text().indexOf("(");
		 var t = $(this).text().substring(0,$ind)
		 if($ind > -1){ $(this).text(t)}
	 })
	 $(obj).addClass("selected");
	 getInfoList(1,10,type,kind,"");
}
 
 function getmore(){
	var pageNum = Number($("#pageNum").val())+1;
	var declareStatus = null;
	 var declareGrade = null;
	 var declareTitle = $('#declareTitle').val();
	 $("#declareStatus .optionBtn").each(function(){
         if($(this).hasClass("selected")){
        	 if($(this).text().substr(0, $(this).text().indexOf('('))=="申报中"){
        		 declareStatus = 0;
        	 }
        	 if($(this).text().substr(0, $(this).text().indexOf('('))=="已截止"){
        		 declareStatus = 1;
        	 }
        	 if($(this).text().substr(0, $(this).text().indexOf('('))=="已公示"){
        		 declareStatus = 2;
        	 }
         }
     }); 
	 $("#declareGrade .optionBtn").each(function(){
		 if($(this).hasClass("selected")){
			 declareGrade = $(this).text().substr(0, $(this).text().indexOf('('));
         }
	 });
	 getInfoList(pageNum,10,$("#type").val(),declareGrade,declareTitle);
 }
 
 function add(){
	 $.ajax({
			url:"${ctx}/projectDeclare/isUpgrade",
			type:"get",
			success:function(result){
				 if(result==0){
					confirm('您尚未升级成政府用户，是否去升级？', function(index) {
						 window.location.href="${ctx}/projectDeclare/upgradeCreate";
					},function(){});  
				}else if(result==2){
					tips('您已提交升级申请，请耐心等待审核结果！');
				}else if(result==1){
					 window.location.href="${ctx}/projectDeclare/create";
				}else if(result==3){
					tips('请先登录！');
				} 
            },
			error:function(){
				layer.alert("创建异常！");
				},
			});
 }
</script>
</html>
