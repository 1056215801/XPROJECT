<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>项目申报</title>
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
<link href="${ctx}/static/css/projectDeclare/projectDetails.css" rel="stylesheet"/>
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
						<div class="artical-nav artical-tab">
							<p class="on">申报项目信息</p>
							<p>公示结果</p>
							<p>申报汇总</p>
							<a href="${ctx}/declare/list?entranceId=${entranceId}">返回列表 ></a>
						</div>
						<div class="artical-content">
							<div class="tab" id="tab0">
								<div class="declareDataBar fz0">
									<div class="text-box_title">
							 	  	   	<c:if test="${detail.declareGrade=='国家级'}">
											<img src="${ctx}/static/image/homePage_yc/level1.png">
							 	  	   	</c:if>
							 	  	   	<c:if test="${detail.declareGrade=='省级'}">
											<img src="${ctx}/static/image/homePage_yc/level2.png">
										</c:if>
							 	  	   	<c:if test="${detail.declareGrade=='市级'}">
											<img src="${ctx}/static/image/homePage_yc/level3.png">
										</c:if>
							 	  	   	<c:if test="${detail.declareGrade=='县级'}">
											<img src="${ctx}/static/image/homePage_yc/level4.png">
										</c:if>
										
										<div class="title-text">
											<div class="declareTitle">
									 	  	   	<c:if test="${detail.declareStatus==0}">
													<span class="flag flag1">申报中</span>
													<span class="triang triang1"></span>
									 	  	   	</c:if>
									 	  	   	<c:if test="${detail.declareStatus==1}">
													<span class="flag flag2">已截止</span>
													<span class="triang triang2"></span>
												</c:if>
									 	  	   	<c:if test="${detail.declareStatus==2}">
													<span class="flag flag3">已公示</span>
													<span class="triang triang3"></span>
												</c:if>
												${detail.declareTitle}
											</div>
											<div class="declareData">
												<font>发布时间：<fmt:formatDate  value="${detail.createTime}" pattern="yyyy年MM月dd日" /></font>
												<font>项目级别：${detail.declareGrade}</font>
												<font>主管单位：${detail.supervisorName}</font>
												<c:choose>
													<c:when test="${detail.applyYc == 1}">
														<ul id="shareBar" class="ycDeclare">
															<li><img onclick="shareToQQFriend(event,'申报')" src="${ctx}/static/image/qq.png" title="分享到QQ"></li>
															<li><img onclick="shareToWx(event)" src="${ctx}/static/image/wx.png" title="分享到微信"></li>
															<li><img onclick="shareToWb(event)" src="${ctx}/static/image/wb.png" title="分享到微博"></li>
															<li><img id='copyTo' src="${ctx}/static/image/cp.png" title="复制链接"></li>
														</ul>
													</c:when>
													<c:otherwise>
														<ul id="shareBar">
															<li><img onclick="shareToQQFriend(event,'申报')" src="${ctx}/static/image/qq.png" title="分享到QQ"></li>
															<li><img onclick="shareToWx(event)" src="${ctx}/static/image/wx.png" title="分享到微信"></li>
															<li><img onclick="shareToWb(event)" src="${ctx}/static/image/wb.png" title="分享到微博"></li>
															<li><img id='copyTo' src="${ctx}/static/image/cp.png" title="复制链接"></li>
														</ul>
													</c:otherwise> 
												</c:choose>
												
											</div>
											<!-- <div class="declareData"><img src="/XProject/static/image/experienceSharing/browseCount.png">240浏览 <img src="/XProject/static/image/experienceSharing/commentCount.png">1评论</div> -->
										</div>
									</div>
									<c:if test="${detail.applyYc == 1}">
										<div class="declareOperBtn" onclick="onlineDeclare()" style="width: 180px; margin-left: 62px;">在线申报</div>
									</c:if>
								</div>
								<div class="main-contents">
									<div class="texts">${detail.declareText}</div>
									<div class="files" id="attList">
										<p>附件：</p>
									</div>
								</div>
							</div>
							<div class="tab" id="tab1">
								<input type="hidden" id="pageNum" value="1" />
								<div class="detail-title">${detail.declareTitle}</div>
								<div class="main-contents">
									<div class="publicities fz0" id="publicityList">
										<div class="publicity-item">
											<h3>test1230是当前哦我等你</h3>
											<p>单位：谁都好方法</p>
											<p>公示时间： 2018-15-15 10:00:21</p>
											<a href="javsacript:;" onclick="checkPublic()">查看详情</a>
										</div>
									</div>
									<div id="getmoreAllActii" style="margin:10px 1.6% 10px;">
										<a href="javascript:void(0)" onClick="getmore(2);" class="renovate">
											<span class="renovateTitle">加载更多</span>
										</a>
									</div>
								</div>
							</div>
							<div class="tab" id="tab2">
								<input type="hidden" id="myPageNumber" value="1" />
								<div class="detail-title">${detail.declareTitle}</div>
								<div class="main-contents">
									<div class="publicities fz0" id="myApplyList">
									</div>
									<div id="myGetmoreAllActi" style="margin:10px 1.6% 10px;">
										<a href="javascript:void(0)" onClick="getmore(3);" class="renovate">
											<span class="renovateTitle">加载更多</span>
										</a>
									</div>
								</div>
							</div>
							<div class="tab" id="tab3">
							</div>
							<div class="displayNone" id="publicityView">
								
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
		<div style="display:none" id="qrcode">     
			<img src='${detail.qrCode}'  width="250px;" height="250px;"/>
	  	    <br>&nbsp;&nbsp;打开微信，点击底部的“发现”
		    <br>&nbsp;&nbsp;使用“扫一扫”即可将网页分享至朋友圈
      </div>
	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	</div>
</body>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script src="${ctx}/static/plugins/jquery-zclip/jquery.zclip.js"></script> 
<script src="${ctx}/static/js/share.js"></script> 
<script type="text/javascript">
var isadd=true;
$(function(){
	console.log("rootKind:"+"${rootKind}");
	// console.log("accountId:" + "${accountId}");
	// console.log("accountId:" + "${detail.accountId}");
	$(".nav-content a:eq(4)").addClass("on");
	$(".source-room a").removeClass("on");
	$(".fir-floor").show();
	$(".publish-btn h1").text('在线申报');
	
	$(".artical-tab p").on("click",function(){          //大项目tab切换
		 var $ind = $(this).index();
		 $(this).addClass("on").siblings().removeClass("on");
		 $("#tab"+$ind).siblings().fadeOut("fast");
		 setTimeout(function(){ $("#tab"+$ind).fadeIn("fast");},200);
		 if($(this).index() == 2 && '${accountId}' == ''){
			tips("亲，请先登陆哦！");
			$("#myGetmoreAllActi").hide();
		 }
	});
	var msg = '${message}';
	if(msg!=null&&msg!=""){
		tips(msg);
		msg=null;
	}
	if('${detail.atIdList}' != ''){
		getAtts('${detail.atIdList}');
		$("#attList").show();
	}
	
	getPublicityList(1,6);
	if('${accountId}' != ''){
		if("${detail.applyYc}"==1){
			getApplyList_yc();
		}else{
			getApplyList('${detail.declareId}','',1,6,'${accountId}');
		}
	}
});
function getAtts(attIdList){
	 $.ajax({
			url:'${ctx}/login/json/attachment/selectListByAttachmentIdList',
			type:'get',
			data:{'attachmentIdList':attIdList},
			dataType:'json',
			success:function(data){
				var value = JSON.parse(data).attachments;
				if(value==null||value==""){
					$("#attList").hide();
				}
				for(var i = 0;i<value.length;i++){
					$('#attList').append(
							 "<p>附件"+(i+1)+"<a href='"+value[i].downloadUrl+"' target='_blank'>"+value[i].remoteName+"</a></p>"
							);
				}
			},
			error:function(){
				alert("访问后台异常!");
			}
		});
}
function getAtts2(attIdList){
	 $.ajax({
			url:'${ctx}/login/json/attachment/selectListByAttachmentIdList',
			type:'get',
			data:{'attachmentIdList':attIdList},
			dataType:'json',
			success:function(data){
				var value = JSON.parse(data).attachments;
				if(value==null||value==""){
					$("#attList2").hide();
				}
				for(var i = 0;i<value.length;i++){
					$('#attList2').append(
							 "<p>附件"+(i+1)+"<a href='"+value[i].downloadUrl+"' target='_blank'>"+value[i].remoteName+"</a></p>"
							);
				}
			},
			error:function(){
				alert("访问后台异常!");
			}
		});
}
function getPublicityList(pageNum,pageSize){
    var id = '${detail.declareId}';
	$.ajax({
			url:"${ctx}/projectDeclare/json/publicityList",
			type:"get",
			data:{
				"declareId":id,
				"pageNum":pageNum,
				"pageSize":pageSize
			 },
			dataType:"json",
			success:function(result){
				if(pageNum==1){
					 $('#publicityList').empty();
				}
				if(result.code==-1){
					layer.msg(result.msg);
				}else if(result.code==2){
					$('#publicityList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
					$('#getmoreAllActii').hide();
				}else{
					//console.log(result)
					var list = result.value;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div =  '<div class="publicity-item">'
								   +'<h3>'+info.publicityTitle+'</h3>'
								   +'<p>'+info.publicityUnit+'</p>'
								   +'<p>'+dateToTimeStr(info.createTime,'yyyy-MM-dd hh:mm:ss')+'</p>'
								   +'<a href="javascript:void(0);" onclick="checkPublic(0,\''+info.publicityId+'\');">查看详情</a>'
								   +'</div>';
						$('#publicityList').append(_div);   
						if(result.code==0){
							$('#getmoreAllActii').hide();
						}else if(result.code==1){
							$('#getmoreAllActii').show();
						}
					}
				}
			},
			error:function(){
				tips("请求超时，请稍后重试");
			},
	});
}
function getmore(type){
	var status = "";
	if(type==1){
			var pageNum = Number($("#pageNum").val())+1;
			$("#pageNum").val(pageNum);
			 $("#stateBar .details_State").each(function(){
		         if($(this).hasClass("redcolor")){
		        	 if($(this).text()=="待审核"){
		        		 status = 2;
		        	 }
		        	 if($(this).text()=="通过"){
		        		 status = 1;
		        	 }
		        	 if($(this).text()=="不通过"){
		        		 status = 0;
		        	 }
		         }
		     }); 
			
			 //getAuditList('${detail.declareId}',status,pageNum,6,"");
	}else if(type==2){
		 var pageNumber = Number($("#pageNumber").val())+1;
			$("#pageNumber").val(pageNumber);
			getPublicityList(pageNumber,6);
	}else if(type==3){
		var myPageNumber = Number($("#myPageNumber").val())+1;
		var accountId = '${accountId}';
		$("#myPageNumber").val(myPageNumber);
		getApplyList('${detail.declareId}',status,myPageNumber,6,accountId);
	}
}
function checkPublic(type,id){
	 $("#tab3").siblings().fadeOut("fast");
	 setTimeout(function(){ $("#tab3").fadeIn("fast");},200);
	 
	 $.ajax({
		url:"${ctx}/projectDeclare/json/publicityViewById",
		type:"post",
		data:{
				"publicityId":id,
				//"${_csrf.parameterName}":"${_csrf.token}"
		},
		dataType:"json",
		success:function(result){
			var info = result;
				$('#tab3').empty();
				var _div = '<div class="declareDataBar fz0">'
					_div += '<div class="title-text">'
					_div += '<div class="declareTitle">'
					_div += info.publicityTitle
					_div += '</div>'
					_div += '<div class="declareData">'
					_div += '<font>发布时间：'+ dateToTimeStr(info.createTime,'yyyy-MM-dd hh:mm:ss')+'</font>'
					_div += '<font>单位：'+info.publicityUnit+'</font>'
					_div += '</div>'
					_div += '</div>'
					_div += '</div>'
					_div += '<div class="main-contents">'
					_div += '<div class="texts">'+ info.publicityText +'</div>'
					_div += '<a class="return-list" href="javascript:void(0);" onclick="backLink()">返回</a>'
					_div += '<div class="files" id="attList1">'
					_div += '<p>附件：</p>'
					_div += '</div>'
				$('#tab3').html(_div);
				if(info.atIdList){
					getAtts2(info.atIdList);
				}
		},
		error:function(){
			tips("获取详情失败！");
		},
	});
}
function backLink() {
	 $("#tab1").siblings().fadeOut("fast");
	 setTimeout(function(){ $("#tab1").fadeIn("fast");},200);
}
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
function getApplyList(declareId,status,pageNum,pageSize,accountId){//获取申报企业列表
	 
	 $.ajax({
			url:"${ctx}/projectDeclare/json/applylist",
			type:"get",
			data:{
					"declareId":declareId,
					"status":status,
					"pageNum":pageNum,
					"pageSize":pageSize,
					"accountId":accountId
				 },
			dataType:"json",
			success:function(result){
				// console.log(result);
				if(pageNum==1){
					  $('#myApplyList').empty();
				}
				if(result.code==-1){
					layer.msg(result.msg);
				}else if(result.code==2){
						$('#myApplyList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
						$('#myGetmoreAllActi').hide();
				}else if(result.code==-2){
					layer.msg(result.msg);
					$('#myGetmoreAllActi').hide();
				}else{
					var list = result.value;
					var size = result.msg;
					//console.log(result)
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var img = info.atUrlList.split(",");
						var _div = '<div class="publicity-item">'
									+'<h3>' + info.companyName+'</h3>'
									+'<p>联系人：' + info.accountName+'</p>'
									+'<p>联系电话：' + info.accountTel+'</p>';
							if("${detail.applyYc}"!=1){
								_div += '<p>上报附件：该企业上报材料' ;
								if(info.atIdList!=""&&info.atIdList!=null){
									_div += '<font>[<a class="aOper" href="${ctx}/projectDeclare/batchDownload?ids='+info.applyId+'">下载</a>]</font>';
								}else{
									_div += '</p>';
								}
							}
							_div += '<p>上报时间： ' + dateToTimeStr(info.createTime,'yyyy-MM-dd hh:mm:ss')+'</p>';
							if(info.applyStatus==2){
								_div += '<a href="javascript:void(0);">审核中</a>';
					        }else if(info.applyStatus==1){
					        	if(info.auditOrgId == '${detail.supervisorId}'){
									_div += '<a href="javascript:void(0);" class="passed">通过</a>';
					        	}else {
									_div += '<a href="javascript:void(0);">审核中</a>';
					        	}
					        }else {
								_div += '<a href="javascript:void(0);" class="failed">未通过</a>';
					        }
							_div +='</div>';
				    	$('#myApplyList').append(_div);   
						if(result.code==0){
							$('#myGetmoreAllActi').hide();
						}else if(result.code==1){
							$('#myGetmoreAllActi').show();
						}
					}
				}
			},
			error:function(){
				tips("请求超时，请稍后重试");
				},
			});
};

function getApplyList_yc(){//获取申报企业列表
	 if("${detail.accountId}"=="${accountId}"){
		$.ajax({
			url:"${urlPath}XOffice/interface/json/projectOnlineInfo/list",
			type:"post",
			data:{
				declareId:"${detail.declareId}",
			},
			dataType:"json",
			success:function(result){
				
				$('#myApplyList').empty();
				if(result.list != undefined && result.list != null && result.list != ""){
					var info = result.list;
					$('#myGetmoreAllActi').hide();
					for(var i=0;i<info.length;i++){
						if(info[i].status!=0){
							var _div = '<div class="publicity-item">'
										+'<h3>' + info[i].rootName+'</h3>'
										+'<p>联系人：' + info[i].contactInfo+'</p>'
										+'<p>联系电话：' + info[i].contactPhone+'</p>'
										+'<p>上报时间： ' + dateToTimeStr(info[i].createTime,'yyyy-MM-dd hh:mm:ss')+'</p>'
										+'<p>上报详情： <a class="aOper detailBtn" data="'+info[i].rootId+'" href="javascript:;">详情</a>&nbsp;&nbsp;'
										if(info.accountId == "${accountId}"){
											if(info[i].status==0 || info[i].status==1 || info[i].status==2 || info[i].status==4){
												_div+='<a class="aOper editBtn" data="'+info[i].rootId+'" href="javascript:;">编辑</a>'
											}
											_div+='<a class="aOper exportBtn" data="'+info.rootId+'" dataValue="'+info.logId+'" href="javascript:;">导出</a>'
										}
									_div+='</p>';
							if(info[i].status ==1 || info[i].status ==3){
								_div += '<a href="javascript:void(0);">审核中</a>';
							}else if(info[i].status ==5){
								_div += '<a href="javascript:void(0);" class="passed">通过</a>';
							}else  if(info[i].status ==2 || info[i].status ==4){
								_div += '<a href="javascript:void(0);" class="failed">未通过</a>';
							}
							_div +='</div>';
							$('#myApplyList').append(_div);
						}
					}
				}else{
					$('#myApplyList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
					$('#myGetmoreAllActi').hide();
				}
			},
			error:function(){
				tips("请求超时，请稍后重试");
			},
		});
	 }else{
		$.ajax({
			url:"${urlPath}XOffice/interface/json/projectOnlineInfo/detailProject",
			type:"post",
			data:{
				// rootId:"90020180314182233800039000001655"
				declareId:"${detail.declareId}",
				rootId:"${rootId}"
			},
			dataType:"json",
			success:function(result){
				console.log(result)
				$('#myApplyList').empty();
				$('#myGetmoreAllActi').hide();
				if(result.value != undefined && result.value != null && result.value != "" && result.value.status!=0){
					var info = result.value;
					var _div = '<div class="publicity-item">'
							+'<h3>' + info.rootName+'</h3>'
							+'<p>联系人：' + info.contactInfo+'</p>'
							+'<p>联系电话：' + info.contactPhone+'</p>'
							+'<p>上报时间： ' + dateToTimeStr(info.createTime,'yyyy-MM-dd hh:mm:ss')+'</p>'
							+'<p>上报详情： <a class="aOper detailBtn" data="'+info.rootId+'" href="javascript:;">详情</a>&nbsp;&nbsp;'
							if(info.accountId == "${accountId}"){
								if(info.status==0 || info.status==1 || info.status==2 || info.status==4){
									_div+='<a class="aOper editBtn" data="'+info.rootId+'" href="javascript:;">编辑</a>&nbsp;&nbsp;'
								}
								_div+='<a class="aOper exportBtn" data="'+info.rootId+'" dataValue="'+info.logId+'" href="javascript:;">导出</a>'
							}
						_div+='</p>';
					if(info.status ==1 || info.status ==3){
						_div += '<a href="javascript:void(0);">审核中</a>';
					}else if(info.status ==5){
						_div += '<a href="javascript:void(0);" class="passed">通过</a>';
					}else  if(info.status ==2 || info.status ==4){
						_div += '<a href="javascript:void(0);" class="failed">未通过</a>';
					}
					_div +='</div>';
					$('#myApplyList').append(_div);
				}else{
					$('#myApplyList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
				}
			},
			error:function(){
				tips("请求超时，请稍后重试");
			},
		});
	 }
	 $("#myApplyList").on("click",'.detailBtn',function(){
		if("${detail.accountId}"=="${accountId}"){
			var declareId = '${detail.declareId}';
			var rootId=($(this).attr('data')).toString();
			// console.log(($(this).attr('data')).toString());
			window.open("${ctx}/projectDeclare/onlineDetail?entranceId=${entranceId}&declareId="+declareId+"&rootId="+rootId);
		 }else{
			var declareId = '${detail.declareId}'
			window.open("${ctx}/projectDeclare/onlineDetail?entranceId=${entranceId}&declareId="+declareId);
		 }
	 });
	 $("#myApplyList").on("click",'.editBtn',function(){
		if("${detail.accountId}"=="${accountId}"){
			var declareId = '${detail.declareId}';
			var rootId=($(this).attr('data')).toString();
			// console.log(($(this).attr('data')).toString());
			window.open("${ctx}/projectDeclare/onlineCreate?entranceId=${entranceId}&declareId="+declareId+"&rootId="+rootId);
		 }else{
			var declareId = '${detail.declareId}'
			window.open("${ctx}/projectDeclare/onlineCreate?entranceId=${entranceId}&declareId="+declareId);
		 }
	 });
	 $("#myApplyList").on("click",'.exportBtn',function(){
		 var logId = $(this).attr('dataValue').toString();
		 window.open("${urlPath}XOffice/interface/json/projectOnlineInfo/downloadWord?logId="+logId)
	 });
};
 function add(){
	if('${accountId}'==''){
		tips('亲，您还没有登录');
		return;
	}else if('${detail.declareStatus}' == 1){
		layer.msg("该项目已截止申报");
	}else if('${detail.applyOnline ne 1}'=='true'){
		layer.msg("该申报不允许在线申报，请线下联系！");
	}else{
		if("${detail.applyYc}" == 1){
			if("${rootKind}"==3){
				isAddDeclare();
			}else{
				layer.msg("非企业用户不能申报");
			}
		}else{
			location.href = "${ctx}/declare/add?declareId=${detail.declareId}&entranceId=${entranceId}";
		}
	}
	 //tips("敬请期待，或通过微信端发布");
	 //console.log("${ctx}/declare/add?declareId=${detail.declareId}");
 }
 
 function publicityView(type,id) {
	 if(type==0){
	 $('#publicityView').show();
	 $('#publicityCreate').hide();
	 $('#pubList').hide();
	 getPublicityView(0,id);
	 }else if(type==1){
		 $(".titleName ul li").each(function(){
			 if($(this).hasClass("titleClick")){
				 $(this).removeClass("titleClick");
			 }
			 if($(this).text()=='公示结果'){
				 $(this).addClass("titleClick");
			    var a = $(this).index();
			    $(".titleItem>div").eq(a).stop(true).show().siblings().stop(true).hide();
			 }
		 });
		 if('${projectDeclareInfo.declareStatus}'==1 ){
			 $('#publicityView').hide();
			 $('#pubList').hide();
					 $("#publicityCreate").hide(); 
					 $("#noPublicity").show();
		 }else if('${projectDeclareInfo.declareStatus}'==2){
			 $('#publicityView').show();
			 $('#publicityCreate').hide();
			 $('#pubList').hide();
			 $('#noPublicity').hide();
			 getPublicityView(1,id);
		 }
		
	 }
 }
 
 function getPublicityView(type,id){
	 if(type==0 ||type == 2 || type == 3){
		 $.ajax({
				url:"${ctx}/projectDeclare/json/publicityViewById",
				type:"post",
				data:{
						"publicityId":id,
						"${_csrf.parameterName}":"${_csrf.token}"
					 },
				dataType:"json",
				success:function(result){
					var info = result;
					if(type==3){
						$('#declareId').val(info.declareId);
						$('#publicityTitle').val(info.publicityTitle);
						tinyMCE.get('publicityText').setContent(info.publicityText);
						$('#atUrlList').val(info.atUrlList);
						$('#atIdList').val(info.atIdList);
						$('#publicityId').val(info.publicityId);
						 $('#publicityView').hide();
						 $('#publicityCreate').show();
						 $('#pubList').hide();
					}else{
						 $('#publicityView').empty();
						 
							var _div = '<div style="padding:15px 18px;">'
							           + '<div style="float:right; position:relative; top:5px;">'
									   + '<span class="font12">一键分享</span>'
									   + '<a title="分享给QQ好友" onclick="shareToQQFriend(event,"项目")" href="javascript:;"><img src="${ctx}/static/image/qq.png"style="margin-left:5px;"></a>'
									   + '<a title="分享到微信" onclick="shareToWx(event)" href="javascript:;"><img src="${ctx}/static/image/wx.png" style="margin-left:5px;"></a>'
								       + '<a title="分享到微博" onclick="shareToWb(event)" href="javascript:;"><img src="${ctx}/static/image/wb.png" style="margin-left:5px;"></a>'
								       + '<a title="复制链接"  id="copyTo"   href="javascript:;"><img src="${ctx}/static/image/cp.png" style="margin-left:5px;"></a>'
							           + '</div>'
									   + '<div style="clear:both;"></div>'
									   + '</div>'
									   + '<div style="width:90%; margin:0 auto;">'
									 /*   + '<div class="publicityTitle">中华人民共和国工业和信息化部</div>' 
									   + '<div style="border-bottom:2px solid #f14241; margin:1px auto; width:80%;"></div>'*/
									   + '<div style="text-align:center;">'
								       + info.publicityTitle
									   + '</div>'
									   + '<div style="width:70%;margin: 0 auto;">'
									   + '<div style="text-align:left;">'
								       + info.publicityText
								       + '<div id="getPubAtts">附件：'
				       			       + '</div>'
									   + '</div>'
									   + '</div>'
									   + '<div style="text-align:right;">'
								       + info.publicityUnit
									   + '</div>'
									   + '<div style="text-align:right;">'
								       + getTime(info.createTime)
								      
									   + '</div>'
									  
				       			   	   + '<div style="padding:50px 0 100px; text-align:center;">';
				       			   	   if(type==2){
				       			   		_div += '<div style="padding-right:65px;">'
										     +'<input type="button" value="确认发布" class="redBtnContral" onclick="savePre(\''+id+'\',\''+info.declareId+'\');">'
										     +'<input type="button" value="再次编辑" class="grayBtnContral" onclick="getPublicityView(3,\''+id+'\');">'
										     +'<div style="clear:both;"></div>'
									         +'</div>';
				       			   	   }else if(type==0){
				       			   		 if('${pubView}'==null || '${pubView}'==""){
					       			   	   _div += '<input type="button" class="button button-raised button_Contral" onclick="publicityType(2);" style="width:180px;" value="返回">';
					       			   	   }
				       			   	   }
				       			   	  
				       			   	_div +=  ' <div style="clear:both;"></div>'
				       			       + '  </div>'
								       + '</div>';
							$('#publicityView').html(_div);
							$('#noPublicity').hide();
							getAtts(info.atIdList);
					}
					
				},
				error:function(){
					tips("获取详情失败！");
					},
				});
	 }else{
		 $.ajax({
				url:"${ctx}/projectDeclare/json/publicityView",
				type:"post",
				data:{
						"declareId":id,
						"${_csrf.parameterName}":"${_csrf.token}"
					 },
				dataType:"json",
				success:function(result){
					 $('#publicityView').empty();
					 
					var info = result;
					var _div = '<div style="padding:15px 18px;">'
					           + '<div style="float:right; position:relative; top:5px;">'
							   + '<span class="font12">一键分享</span>'
							   + '<a title="分享给QQ好友" onclick="shareToQQFriend(event,"项目")" href="javascript:;"><img src="${ctx}/static/image/qq.png"style="margin-left:5px;"></a>'
							   + '<a title="分享到微信" onclick="shareToWx(event)" href="javascript:;"><img src="${ctx}/static/image/wx.png" style="margin-left:5px;"></a>'
						       + '<a title="分享到微博" onclick="shareToWb(event)" href="javascript:;"><img src="${ctx}/static/image/wb.png" style="margin-left:5px;"></a>'
						       + '<a title="复制链接"  id="copyTo"   href="javascript:;"><img src="${ctx}/static/image/cp.png" style="margin-left:5px;"></a>'
					           + '</div>'
							   + '<div style="clear:both;"></div>'
							   + '</div>'
							   + '<div style="width:90%; margin:0 auto 100px;">'
							   + '<div class="publicityTitle">中华人民共和国工业和信息化部</div>'
							   + '<div style="border-bottom:2px solid #f14241; margin:1px auto; width:80%;"></div>'
							   + '<div style="text-align:center;">'
						       + info.publicityTitle
							   + '</div>'
							   + '<div style="width:70%;margin: 0 auto;">'
							   + '<div style="text-align:left;">'
						       + info.publicityText
						       + '<div id="getPubAtts">附件：'
				       			 + '</div>'
							   + '</div>'
							   + '</div>'
							   + '<div style="text-align:right;">'
						       + info.publicityUnit
							   + '</div>'
							   + '<div style="text-align:right;">'
						       + getTime(info.createTime)
						       
							   + '</div>'
							 
						       + '</div>';
					$('#publicityView').html(_div);
					getAtts(info.atIdList);
				},
				error:function(){
					tips("获取详情失败！");
					},
				});
	 }
 }
 	
	function onlineDeclare(){
		if('${accountId}'==''){
			tips('亲，您还没有登录');
			return;
		}else if('${detail.declareStatus}' == 1){
			layer.msg("该项目已截止申报");
		}else if('${detail.applyOnline ne 1}'=='true'){
			layer.msg("该申报不允许在线申报，请线下联系！");
		}else{
			if("${rootKind}"==3){
				isAddDeclare();
			}else{
				layer.msg("非企业用户不能申报");
			}
		}
	}
	function isAddDeclare(){
		var declareId = '${detail.declareId}';
		$.ajax({
			url:"${urlPath}XOffice/interface/json/projectOnlineInfo/detailProject",
			type:"post",
			data:{
				declareId: declareId,
				rootId:"${rootId}"
			},
			dataType:"json",
			success:function(result){
				// console.log("${rootId}")
				console.log(result);
				if(result.value!=undefined && result.value!="" && result.value!=null){
					// console.log("status:"+result.value.status)
					if(result.value.status==0 || result.value.status==2 ||result.value.status==4){
						isadd=true;
					}else{
						isadd=false;
					}
				}else{
					isadd=true;
				}
				if(isadd){
					window.location.href = "${ctx}/projectDeclare/onlineCreate?entranceId=${entranceId}&declareId="+declareId;
				}else{
					layer.msg("您所在企业已提交申报信息，正在审核中，请耐心等待！");
				}
			},
			error:function(){
				tips("请求超时，请稍后重试");
			},
		});
	}
</script>
</html>
