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
<title>活动报名</title>
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
<style type="text/css">
	.noticeBtn{
		position: absolute; 
		right: 0px; 
		top: 132px;
		color:#1b75d2; 
		font-size:14px;
		cursor: pointer;
	}
	.noticeBtn img {
		margin-right: 5px;
	}
	
	.titName {
		padding:0 5px 4px;
	}
	.titName ul{list-style-type:none; position:relative; top:3px; margin-left:5px;}  
	.titName ul li{float:left; text-align:center; margin-right:15px; padding:0 3px; border:1px solid #ccc; padding:1px 12px;}
	.titName ul li a{text-decoration:none;}
	.titClick { background-color:#1B75D2; border:1px solid #1B75D2;}
	.titClick a { color:#fff;}
	.noticeInput {
		padding:13px 3px 7px;
	}
	.noticeInput textarea {
		width:98%;
	}
	.returnBtn {
		width:100px;
		border:1px solid #E6E6E6;
		background-color:#F2F2F2;
		color:#000;
		padding:4px 0;
		margin-right:5px;
		float:right;
	}
	.sendBtn {
		width:100px;
		border:1px solid #1B75D2;
		background-color:#1B75D2;
		color:#fff;
		padding:4px 0;
		margin-right:15px;
		float:right;
	}
</style>
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
			    	<p class="navTitle">活动报名</p>
			    	<p>
			    	<font class="projectNum">${activityCount}</font>&nbsp;<font>项</font>&nbsp;&nbsp; <font>活动</font>
					&nbsp;&nbsp;&nbsp;&nbsp;<font class="projectNum">${activityLiveCount}</font>&nbsp;<font>项</font> &nbsp;&nbsp;<font> 正在进行</font> 
					</p>
			     </div>
			</div>
		</div>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-list">
							<div class="titleName">
								<ul>
									<li class="on">全部活动</li>
									<li>我发布的</li>
									<li>我参与的</li>
								</ul>
								<div class="searchBar">
									<input type="text" id="searchKey" name="searchKey" placeholder="标题关键字" style="border-radius: 4px;border: 1px solid #e1e1e1;"/>
									<img src="${ctx}/static/image/homePage_yc/seach.png" width="15" onclick="search()">
								</div>
								<input type="hidden" id="type" value="1" />
								<input type="hidden" id="pageNum" value="1" />
							</div>
							<div class="searchKeyBox">
								<div class="searchOptions open">展开</div>
								<div class="searchKeys">
									<div class="searchOptions"><span>分类</span></div>
									<div class="searchOptions options" id="declareGrade">
										<div class="optionBtn selected" onclick="selectByKey(this,'',2);">全部</div>
										<c:forEach items="${tagList}" var="tags">
											<div class="optionBtn" onclick="selectByKey(this,'1')">${tags.tagName}</div>
										</c:forEach>
									</div>
								</div>
							</div>	
							<div class="title-items">
								<div class="title-content" id="set0">
									<div id="allList"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize0"></div>
										<div class="m-style M-box0"></div>
									</div>
								</div>
								<div class="title-content" id="set1" style="display: none;">
									<div id="myApplyPro"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize1"></div>
										<div class="m-style M-box1"></div>
									</div>
								</div>
		
								<div class="title-content" id="set2" style="display: none;">
									<div id="mylist"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize2"></div>
										<div class="m-style M-box2"></div>
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
		
		<div id="messageNotice" style="display:none;">
			<input type="hidden" id="noticeType" value="1"/>
			<input type="hidden" id="name" />
			<input type="hidden" id="id" />
			<div style="padding:5px 15px;">给所有参与“<span class="activityName"></span>”活动的用户发送如下消息：</div>
				<div style="background-color:#fff; padding:0 10px;">
					<div class="titName">
						<ul>
							<li><a href="javascript:;" onclick="noticeType('1')">活动变更</a></li>
							<li><a href="javascript:;" onclick="noticeType('2')">活动取消</a></li>
						</ul>
					<div style="clear:both;"></div>
				</div>
				<div class="titItem">
					<div class="noticeInput">
						<textarea rows="4" >亲，你报名参加的活动有变更，变更内容为XXXX</textarea>
					</div>
				</div>
			</div>
			<div style="padding:10px 5px;">
				<input type="button" value="发送" onclick="sendBtn()" class="sendBtn" style="cursor:pointer;">
				<input type="button" value="关闭" onclick="returnBtn()" class="returnBtn" style="cursor:pointer;">
				<div style="clear:both;"></div>
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
var activityName = "";
var activityTags = "";
var isBox0 = true;
var isBox1 = true;
var isBox2 = true;
$(function(){
	$(".nav-content a:eq(5)").addClass("on");
	$(".fir-floor").show();
	$(".publish-btn h1").text('活动发布');
	var $l = 0;    //判断是否要展开
	$(".options").each(function(){ $l += $(this).height();})
	if($l < 40){ $(".open").hide();}
	else { $(".searchKeyBox").css("height","45px");}
	
	$(".open").on("click",function() { //展开收起筛选项
		$(this).toggleClass("on");
		var $l = 0;
		$(".options").each(function(){ $l += $(this).height() + 10;})
		if($(this).hasClass("on")) { 
			$(".searchKeyBox").css("height", $l + 'px');
			$(".open").text("收起");
		}
		else { 
			$(".searchKeyBox").css("height","45px");
			$(".open").text("展开");
		}
	})
	$(".titleName li").on("click",function(){          //大项目tab切换
		 var $ind = $(this).index() + 1;
	     if($ind==1){
	    	 isBox0 = true;
	     }else if($ind==2){
	    	 isBox1 = true;
	     }else{
	    	 isBox2 = true;
	     }
	     activityTags =  "";
		 var $ind1 = $(this).index();
		 $(".searchKeys .optionBtn").removeClass("selected");
		 $(".searchKeys .optionBtn:eq(0)").addClass("selected");
		 $(".optionBtn").each(function(){
			 var $ind2 = $(this).text().indexOf("(");
			 var t = $(this).text().substring(0,$ind2)
			 if($ind2 > -1){ $(this).text(t)}
		 })
		 $("#type").val($ind);
		 getInfoList(1,10,$ind,'','');
		 
		 $(this).addClass("on").siblings().removeClass("on");
		 $("#set"+$ind1).siblings().fadeOut("fast");
		 setTimeout(function(){ $("#set"+$ind1).fadeIn("fast");},200);
	});
	getInfoList(1,10,1,"","");
	var $l = 0;    //判断是否要展开
	$(".options").each(function(){ $l += $(this).height();})
	$(".open").removeClass("on").text("展开");
	if($l < 45){ $(".searchKeyBox").css("height","45px"); $(".open").hide();} 
	else { $(".searchKeyBox").css("height","45px"); $(".open").show();}
	$(".titName ul li").each(function(){
		var index=$(this).index();
		$(".titName ul li").eq(0).addClass("titClick");
		$(this).click(function(){
			$(this).addClass("titClick").siblings().removeClass("titClick");
		});
    });
	//回车触发搜索事件
	$("#searchKey").bind('keydown', function(event) {
		if (event.keyCode == "13") {
			search();
		}
	});
});

function getInfoList(pageNum,pageSize,type){ //type: 0:全部项目 1:我申报的 2:已发项目
	$('#pageNum').val(pageNum);
	$.ajax({
		url:"${ctx}/projectActivity/json/activityList",
		type:"get",
		data:{
				"pageNum":pageNum,
				"pageSize":pageSize,
				"type":type,
				"activityTags":activityTags,
				"activityName":activityName,
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
			}else if(result.code==-2){
				layer.msg(result.msg);
				if(type==1&&pageNum==1){
				 	$('#allList').empty();
			    }else if(type==2&&pageNum==1){
				  	$('#myApplyPro').empty();
			    }else if(type==3&&pageNum==1){
				  	$('#mylist').empty();
			    }
			}else{
				var list = result.value;
				var total = result.msg.split(",");
				$(".optionBtn").each(function() {              //给标签加上数量
					if ($(this).hasClass("selected")) {
						var $ind = $(this).text().indexOf("(");
						var t = $(this).text().substring(0, $ind)
						if ($ind > -1) {
							$(this).text(t)
						}
						$(this).text($(this).text() + "(" + total[1] + ")");
					}
				})
				if(type==1){
					 	$('#allList').empty();
				    }else if(type==2){
					  	$('#myApplyPro').empty();
				    }else if(type==3){
					  	$('#mylist').empty();
				    }
				 
				for(var i=0;i<list.length;i++){
					var info = list[i];
					var text = info.activityDescription;
					text = text.replace(/<(table|tr|td|%)[\s\S]*?\/\1>/ig,"");
					text = text.replace(/<[^>]+>/g,"");
							  
					var _div =   '<div class="declareDataBar" style="position: relative;">'
						+'<div onclick="toDetail(\''+ info.activityId + '\')" style="cursor: pointer;">'
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
						+	'<font>分类：'+info.activityTags.slice(0,info.activityTags.length-1)+'</font>'
						+	'<font>活动地址：'+info.activityLocation+'</font></div>'
						+'</div><div class="declare-content">'+text+'</div></div>'
						+'<img src="'+info.activityImage+'" width="180" height="110">';
						if(type==2 && info.status==1){
							_div += '<div class="noticeBtn" onclick="notice(this,\''+info.activityId+'\',\''+info.activityName+'\')"><img src="${ctx}/static/image/homePage_yc/notice.png" width="14"><span>发送用户通知</span></div>'
						}
						+'</div></div>';
					  
					  if(type==1){
			            $('#allList').append(_div); 
					  }else if(type==2){
						  $('#myApplyPro').append(_div); 
					  }else{
						  $('#mylist').append(_div); 
					  }
				}
				  if ( 10 < total[1] && pageNum ==1) {
					  if(type==1){
						  if(isBox0){
								 isBox0 = false;
								 showPagination('.M-box0',total[1],getInfoList,type);
							}
						     $('#pageSize0').show();
							 $('#pageSize0').html('共检索到'+total[1]+' 条数据，每页10条');
					  }else if(type==2){
						  if(isBox1){
								 isBox1 = false;
								 showPagination('.M-box1',total[1],getInfoList,type);
							}
						     $('#pageSize1').show();
							 $('#pageSize1').html('共检索到'+total[1]+' 条数据，每页10条');
					  }else{
						  if(isBox2){
								 isBox2 = false;
								 showPagination('.M-box2',total[1],getInfoList,type);
							}
						     $('#pageSize2').show();
							 $('#pageSize2').html('共检索到'+total[1]+' 条数据，每页10条');
					  }
				  }else if(10 >= total[1] && pageNum ==1){
						  if(type==1){
							$('.M-box0').hide();
							$('#pageSize0').hide();
					  }else if(type==2){
							$('.M-box1').hide();
							$('#pageSize1').hide();
					  }else{
							$('.M-box2').hide();
							$('#pageSize2').hide();
					  }
				  }
				//jquery阻止冒泡和默认行为
				$(".noticeBtn").on('click',function(){
			         return false;
			    });
			}
		},
		error:function(){
			// tips("请求超时，请稍后重试");
			}, 
		});
}
function toDetail(activityId){
	window.open("${ctx}/activity/detail/"+activityId+"?entranceId="+'${entranceId}',"_blank");
}
function notice(e,activityId,activityName){
	$(".activityName").text(activityName);
	$("#name").val(activityName);
	$("#id").val(activityId);
	$(".noticeInput").children(":first").val("亲，你报名参加的["+activityName+"]活动有变更，变更内容为XXXX");
	layer.open({
		type: 1,
		title:false,
		shadeClose: true,
		shade: [0],
		area:['500px','250px'],
		closeBtn:0,
		content: $('#messageNotice')
	});
}

function noticeType(type){
	$("#noticeType").val(type);
	var activityName = $("#name").val();
	if(type==1){
		$(".noticeInput").children(":first").val("亲，你报名参加的["+activityName+"]活动有变更，变更内容为XXXX");
	}else{
		$(".noticeInput").children(":first").val("亲，你报名参加的["+activityName+"]活动已取消");
	}
}

function sendBtn(){
	var notice = $(".noticeInput").children(":first").val();
	var activityId = $("#id").val();
	var type = $("#noticeType").val();
	if(notice =="" || notice == null){
		layer.msg("变更内容不能为空");
	}else{
		if(type == 1){
			noticeSave(notice,activityId,type);
		}else{
			layer.confirm("通知发送后活动将结束，确认？",function(){
				noticeSave(notice,activityId,type);
			},function(){return;});
		}
		
	} 
}

function noticeSave(notice,activityId,type){
	$.ajax({
		url:"${ctx}/projectActivity/json/noticeSave",
		type:"post",
		data:{
			"type":type,
			"activityId":activityId,
			"msgContent":notice,
			'${_csrf.parameterName}':'${_csrf.token}'
		},
		dataType:"json",
		success:function(result){
			layer.closeAll();
			if(result.code==1){
				layer.msg(result.msg);					
			}else if(result.code==2){
				if(!$("#"+activityId).hasClass("hasEnded")){
					$("#"+activityId).addClass("hasEnded");		
					$("#"+activityId).text("已结束");
					$("#"+activityId).next().remove();
				}
				layer.msg(result.msg);		
			}else if(result.code==-2){
				layer.msg(result.msg);
			}else{
				layer.alert(result.msg);		
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			layer.msg("请求超时，请稍后重试");
		}
	}); 
}

function returnBtn(){
	layer.closeAll();
}

function getTags(){
	var tags = "";
	$(".searchOptions .optionBtn").each(function(){
        if($(this).hasClass("selected")){
        	if($(this).text().indexOf("(")!=-1){
        		tags += ($(this).text().substring(0,$(this).text().indexOf("("))+",");
        	}else{
        		tags += ($(this).text()+",");
        	}
        }
   	});  
	if(tags=="全部,"||tags==""){
		tags = "";
		$(".searchOptions .optionBtn").each(function(){
			if($(this).text().indexOf("(")!=-1){
        		tags += ($(this).text().substring(0,$(this).text().indexOf("("))+",");
        	}else{
        		tags += ($(this).text()+",");
        	}
        }); 			
	}
	return tags;
}
function selectByKey(obj,kind){
	 $('#allList').empty();
	 $('#myApplyPro').empty();
	 $('#mylist').empty();
	 var type =   $('#type').val();
     if(type==1){
    	 isBox0 = true;
     }else if(type==2){
    	 isBox1 = true;
     }else{
    	 isBox2 = true;
     }
	 $(".searchKeys .optionBtn").removeClass("selected");
	 $(".optionBtn").each(function(){
		 var $ind = $(this).text().indexOf("(");
		 var t = $(this).text().substring(0,$ind)
		 if($ind > -1){ $(this).text(t)}
	 })
	 $(obj).addClass("selected");
	 activityTags = getTags();
	 getInfoList(1,10,type);
}
function search(){
	 $(".optionBtn").each(function(){
		 var $ind = $(this).text().indexOf("(");
		 var t = $(this).text().substring(0,$ind)
		 if($ind > -1){ $(this).text(t)}
	 })
	var type = $('#type').val();
	if(type==1){
		isBox0 = true;
	}else if(type==2){
		isBox1 = true;
	}else{
		isBox2 = true;
	}
	activityName = $('#searchKey').val();
	 getInfoList(1,10,$("#type").val());
}
 function add(){
	if('${accountId}' == ''){
		return tips("亲，请先登陆哦！");
	}
	location.href='${ctx}/activity/add?entranceId='+'${entranceId}';
 }
</script>
</html>
