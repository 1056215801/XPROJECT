<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>活动报名</title>
<link href="${ctx}/static/css/activity/activityRegistration.css" rel="stylesheet"/>
<link href="${ctx}/static/css/style_deepred.css" rel="stylesheet" media="screen" />
<script src="${ctx}/static/js/jquery.nivo.slider.pack_deepred.js"></script>
<script>
 $(function(){
    $(".tabName ul li").each(function(){
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(2).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		});
    });
	$(".titleName ul li").each(function(){
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
		});
    });
	
	$(".titName ul li").each(function(){
		var index=$(this).index();
		$(".titName ul li").eq(0).addClass("titClick");
		$(this).click(function(){
			$(this).addClass("titClick").siblings().removeClass("titClick");
		});
    });
 });
 $(window).load(function() {
   $('#slider_top').nivoSlider({
	    directionNav: false,
	    captionOpacity: 0 ,
	    controlNav: true,
	    boxCols: 8,
	    boxRows: 4,
	    slices: 15,
	    effect:'random',
	    animSpeed: 500,
	    pauseTime: 3000 });
 });
</script>
<script type="text/javascript">
	$(function(){
		getActivityList(1,1,"","");
		$("#type").val(1);
	});
	
	function getActivityList(pageNum,type,activityName,tags){
		$.ajax({
			url:"${ctx}/projectActivity/json/activityList",
			type:"get",
			data:{
					"pageNum":pageNum,
					"fastQuery":1,
					"type":type,
					"activityName":activityName,
					"activityTags":tags,
					"statusArray":[0,1].toString()
				 },
			dataType:"json",
			success:function(result){
				var arr = "";
				if(result.code==-1){
					layer.alert(result.msg);
				}else if(result.code==-2){
					layer.msg(result.msg);
				}else if(result.code==2){
					$(".searchOptions .optionBtn").each(function(){
			            if($(this).hasClass("selected")){
			            	if($(this).text().indexOf("(")!=-1){
			            		$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
			            	}
			            }
			        }); 
					$(".activityBar").append('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
				}else{
					var list = result.value;
					arr = result.msg.split(",");
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div = '<div class="activityCont">'
						+'<div style="position: relative;">'
						+'<img src='+info.activityImage+' width="362px;" height="186px;"onclick="activityDetails(\''+info.activityId+'\')" style="cursor:pointer;"/>'/* width="100%;" height="120px;" */
						+'<div class="activity-tagBox">'
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
						+'</div>'
						+'<div class="activityCont_title">';
						
						if(info.activityName.length<=14){
							_div += '<div class="activityCont_text">'+info.activityName+'</div>';
						}else{
							_div += '<div class="activityCont_text" title="'+info.activityName+'">'+info.activityName.substring(0,14)+'...</div>';
						}
						
						if(type==2){
							if(info.status==1){
								_div += '<div id="'+info.activityId+'" class="activityBtn registrationIn">报名中</div>'
								+ '<input type="button" value="用户通知" class="registrationIn noticeBtn" style="cursor:pointer;" onclick="notice(\''+info.activityId+'\',\''+info.activityName+'\')">';
							}else{
								_div += '<div id="'+info.activityId+'" class="activityBtn registrationIn hasEnded">已结束</div>';
							}
							
						}else{
							if(info.status==1){
								_div += '<div id="'+info.activityId+'" class="activityBtn registrationIn">报名中</div>';
							}else{
								_div += '<div id="'+info.activityId+'" class="activityBtn registrationIn hasEnded">已结束</div>';
							}
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
						if(info.activityLocation.length<=25){
							_div += '<span>'+info.activityLocation+'</span>';
						}else{
							_div += '<span title="'+info.activityLocation+'">'+info.activityLocation.substring(0,24)+'...</span>';
						}
						_div += '</div>'
						+'</div>';
						$(".activityBar").append(_div);
					}
					$(".activityBar").append('<div style="clear:both;"></div>');
					
					$(".searchOptions .optionBtn").each(function(){
				        if($(this).hasClass("selected")){
				        	if($(this).text().indexOf("(")!=-1){
				        		$(this).text($(this).text().substring(0,$(this).text().indexOf("("))+"("+arr[1]+")");
			            	}else{
			            		$(this).text($(this).text()+"("+arr[1]+")");
			            	}
				        }
				   	}); 
				}
				if(result.code==1){
					$("#getMore").show();	
				}else{
					$("#getMore").hide();	
					$("#activityName").val(arr[0]);
				}
				
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				layer.msg("请求超时，请稍后重试");
			}
		});
	}

	function queryBySearchKey(obj,kind){
		$("#pageNum").val(1);
		if($(obj).hasClass("optionBtn")){
			if($(obj).hasClass("selected")){
				$(obj).removeClass("selected");
				if($(this).text().indexOf("(")!=-1){
					$(obj).text($(obj).text().substring(0,$(obj).text().indexOf("(")));
				}
			}else{
				$(".searchOptions .optionBtn").each(function(){
		            if($(this).hasClass("selected")){
		            	if($(this).text().indexOf("(")!=-1){
		            		$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
		            	}
		            	$(this).removeClass("selected");
		            }
		        }); 
				$(obj).addClass("selected");
			}
		}
		$(".activityBar").empty();	
		getActivityList(1,$("#type").val(),$("#activityName").val(),getTags());		
	}
	
	function queryByAccount(type){
		$("#type").val(type);
		$("#pageNum").val(1);
		$(".activityBar").empty();
		$(".searchOptions .optionBtn").each(function(){
            if($(this).hasClass("selected")){
            	if($(this).text().indexOf("(")!=-1){
            		$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
            	}
            	$(this).removeClass("selected");            		
            }
        });
		$("#all").addClass("selected");
		$("#activityName").val("");
		getActivityList(1,type,$("#activityName").val(),getTags());
	}
	
	function getMore(){
		var pageNum = Number($("#pageNum").val())+1;
		$("#pageNum").val(pageNum);
		getActivityList(pageNum,$("#type").val(),$("#activityName").val(),getTags());
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
	
	function activityDetails(activityId){
		window.location.href="${ctx}/projectActivity/details/"+activityId;
	}
	
	function notice(activityId,activityName){
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
</script>

</head>

<body>
<div class="activity_main">
	<input type="hidden" id="pageNum" value="1"/>
	<input type="hidden" id="type" value=""/>
	<div class="project_header">
	    <%@ include file="../common/header.jsp"%>
	</div>
	
	<div class="activity_content">
		<div class="projectSearchBar">
			<div class="dataStatistics">
				<font style="color: #f14241; font-size: 24px; font-weight: bold; margin-right: 5px;">${activityCount}</font>项活动
			</div>
			<div class="dataStatistics">
				<font style="color: #f14241; font-size: 24px; font-weight: bold; margin-right: 5px;">${activityLiveCount}</font>项正在进行
			</div>
			<div class="projectSearch">
				<input type="text" placeholder="标题关键字" id="activityName" style="border-radius: 4px;border: 1px solid #e1e1e1;">
					<img src="${ctx}/static/image/product/sea.png" width="20px;" height="20px;" onclick="queryBySearchKey(this)">
			</div>
			<div style="clear: both;"></div>
		</div>
		
		<div style="margin-top: 10px;">
			<div class="titleName">
				<ul>
					<li><a href="javascript:;" onclick="queryByAccount('1')">全部活动</a></li>
					<li><a href="javascript:;" onclick="queryByAccount('2')">我发布的</a></li>
					<li><a href="javascript:;" onclick="queryByAccount('3')">我参与的</a></li>
				</ul>
				<a href="${ctx}/projectActivity/create" class="releaseActivity">
					<img src="${ctx}/static/image/activity/activityCreate.png" width="20px;" height="20px;"/>
					<span>发布活动</span>
				</a>
				<div style="clear:both;"></div>
			</div>
			<div class="tiitleItem">
				<div>
					<div class="searchOptions">
						<div id="all" class="optionBtn selected" onclick="queryBySearchKey(this,'2')">全部</div>
						<c:forEach items="${tagList}" var="tags">
							<div class="optionBtn" onclick="queryBySearchKey(this,'1')">${tags.tagName}</div>
						</c:forEach>
						<%-- <div class="searchBar">
							<input type="text" id="activityName" placeholder="按活动名称搜索" value=""/>
							<img src="${ctx}/static/image/activity/search.png" width="15px" height="15px;" onclick="queryBySearchKey(this)"/>
						</div> --%>
						<div style="clear:both;"></div>
					</div>
					<div class="activityBar">
						
					</div>
					<div id="getMore" style="margin:0 7px 10px;">
						<a href="javascript:void(0);" onclick="getMore();" class="renovate">
							<span class="renovateTitle">加载更多</span>
						</a>
					</div>
				</div>

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
	
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>
