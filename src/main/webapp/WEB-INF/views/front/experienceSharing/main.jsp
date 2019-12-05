<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>园区动态-首页</title>
<link href="${ctx}/static/css/experienceSharing/experienceSharing.css" rel="stylesheet"/>
<link href="${ctx}/static/css/login/buttons.css" rel="stylesheet"/>
<link href="${ctx}/static/css/activity/style_deepred.css" rel="stylesheet" media="screen" />
<style>
#slider_top {width:784px!important;}
.nivo-imageLink {width:784px!important;}
.nivo-controlNav {right:46%; bottom:25px;}
</style>
</head>

<body>
<div class="share_main">
	<div class="project_header">
	    <%@ include file="../common/header.jsp"%>
	</div>
	
	<div class="share_content">
		<div class="share_contentTop clearfix">
			<div style="float:left; width: 784px; z-index: 0; margin-bottom: 10px;">
				<div style="width: 784px; height: 350px; z-index: 1;">
					 <div id="slider-wrap">
						<div id="slider_top" class="nivoSlider">
						<a  class="nivo-imageLink" href="http://mp.weixin.qq.com/s/ox3Ye4aIoyPHDtZvsubCqQ" style="height:350px;" target="_blank" >
						<img src="${ctx}/static/image/experienceSharing/expImg20180419.jpg" style="height:350px;" /></a>
						<a  class="nivo-imageLink" href="http://mp.weixin.qq.com/s?__biz=MzIwMTk4ODQ2Mg==&mid=2247484202&idx=1&sn=23d3bb04941f24411cfb848e6632d498&chksm=96e4c32ba1934a3d8171de3147189ad2d3d42a9b6dc5d0ac24be8dbd98104363099ae6508f52&mpshare=1&scene=23&srcid=0305MivugIJ3owecjKddJt8f#rd" style="height:350px;" target="_blank" >
						<img src="${ctx}/static/image/experienceSharing/expImg1.jpg" style="height:350px;" /></a>
						<%-- <a  class="nivo-imageLink" href="javascript:void(0);" target="_blank" style="height:350px;" >
						<img src="${ctx}/static/image/experienceSharing/qdys.jpg" style="height:350px;" /></a> --%>
						<%-- <a  class="nivo-imageLink" href="http://www.jx968969.com/XProject/front/showProduct/main" style="height:350px;" target="_blank" >
						<img src="${ctx}/static/image/experienceSharing/settleds67.jpg" style="height:350px;" /></a> --%>
						<a  class="nivo-imageLink" href="javascript:void(0);" target="_blank" style="height:350px;" >
						<img src="${ctx}/static/image/experienceSharing/smartIndustry.jpg" style="height:350px;" /></a>
						<a  class="nivo-imageLink" href="javascript:void(0);" target="_blank" style="height:350px;" >
						<img src="${ctx}/static/image/experienceSharing/greenPark.jpg" style="height:350px;" /></a>
						</div>
					</div>
				</div>
			</div>
			<div class="classify">
				<!-- <div class="classify_top clearfix">
					<div class="classify_title">园区动态</div>
				</div> -->
				<div class="classify_middle">
					<table>
						<tr>
							<td style="border-left:0; border-top:0;">
							<a href="#searchContent" onclick="selectByLabel('降成本优环境');">
								<img src="${ctx}/static/image/experienceSharing/reduce.png">
								<div class="middleTitle">降成本优环境</div>
							</a>
							</td>
							<td style="border-top:0;">
							<a href="#searchContent" onclick="selectByLabel('两化融合');">
								<img src="${ctx}/static/image/experienceSharing/cityIndustry.png">
								<div class="middleTitle">两化融合</div>
							</a>
							</td>
							<td style="border-top:0;">
							<a href="#searchContent" onclick="selectByLabel('智慧园区');">
								<img src="${ctx}/static/image/experienceSharing/wisdomPark.png">
								<div class="middleTitle">智慧园区</div>
							</a>
							</td>
							<td style="border-right:0; border-top:0;">
							<a href="#searchContent" onclick="selectByLabel('园区管理');">
								<img src="${ctx}/static/image/experienceSharing/parkManage.png">
								<div class="middleTitle">园区管理</div>
							</a>
							</td>
						</tr>
						<tr>
							<td style="border-left:0;">
							<a href="#searchContent" onclick="selectByLabel('产业集群');">
								<img src="${ctx}/static/image/experienceSharing/industry.png">
								<div class="middleTitle">产业集群</div>
							</a>
							</td>
							<td style="">
							<a href="#searchContent" onclick="selectByLabel('节能减排');">
								<img src="${ctx}/static/image/experienceSharing/efficient.png">
								<div class="middleTitle">节能减排</div>
							</a>
							</td>
							<td style="">
							<a href="#searchContent" onclick="selectByLabel('安全生产');">
								<img src="${ctx}/static/image/experienceSharing/security.png">
								<div class="middleTitle">安全生产</div>
							</a>
							</td>
							<td style="border-right:0;">
							<a href="#searchContent" onclick="selectByLabel('党群建设');">
								<img src="${ctx}/static/image/experienceSharing/party.png">
								<div class="middleTitle">党群建设</div>
							</a>
							</td>
						</tr>
						<tr>
							<td style="border-left:0;">
							<a href="#searchContent" onclick="selectByLabel('智能制造');"> 
								<img src="${ctx}/static/image/experienceSharing/manufacture.png">
								<div class="middleTitle">智能制造</div>
							</a>
							</td>
							<td style="">
							<a href="#searchContent" onclick="selectByLabel('公共服务');">
								<img src="${ctx}/static/image/experienceSharing/service.png">
								<div class="middleTitle">公共服务</div>
							</a>
							</td>
							<td style="">
							<a href="#searchContent" onclick="selectByLabel('产城融合');">
								<img src="${ctx}/static/image/experienceSharing/twoIntegration.png">
								<div class="middleTitle">产城融合</div>
							</a>
							</td>
							<td style="border-right:0;">
							<a href="#searchContent" onclick="selectByLabel('它山之石');">
								<img src="${ctx}/static/image/experienceSharing/itsMountain.png">
								<div class="middleTitle">它山之石</div>
							</a>
							</td>
						</tr>
					</table>
				</div>
				<div class="classify_bottom">
					<img src="${ctx}/static/image/experienceSharing/advertisement1.jpg" width="315" height="91">
				</div>
			</div>
		</div>
		<input type="hidden" id="pageNum" value=""/>
		<input type="hidden" id="pageNum1" value=""/>
		<div id="searchContent" class="share_contentBottom clearfix">
			<div class="share_contLeft">
				<div class="titleName clearfix">
					<ul>
						<li onclick="main();"><a href="javascript:;">全部动态</a></li>
						<li onclick="mylist();"><a href="javascript:;">我发布的</a></li>
						<!-- 动态菜单栏，菜单切换位置 -->
						<!-- <li target="http://www.baidu.com"><a href="javascript:;">百度</a></li>
						<li target="http://www.163.com"><a href="javascript:;">网易</a></li> -->
					</ul>
					<div class="searchBar">
						<input type="text" placeholder="标签关键字" id="expTitle" style="border-radius: 4px;border: 1px solid #e1e1e1;"/>
						<img src="${ctx}/static/image/product/sea.png" width="20" height="20" onclick="selectByKey('',6);"/>
					</div>
				</div>
				<div class="titleItem">
					<div>
						<div class="searchOptions clearfix">
						<div class="searchOptions" style="float: left;">
							<span style="display: block;margin: 0px 7px 5px 0;padding: 2px 7px;">级别</span>
						</div>
						<div class="optionBtn selected" id="all" onclick="selectByKey(this,1);">全部</div>
						<span id="label">
							<c:forEach items="${labelList }" var="labelList">
							<div class="optionBtn" onclick="selectByKey(this,2);">${labelList.tagName }</div>
							</c:forEach>
						</span>
						<div style="float: left; width:100%;margin-bottom: 15px;" >
							<div class="searchOptions" style="float: left;">
								<span style="display: block;margin: 5px 7px 5px 0;padding: 2px 7px;">地域</span>
							</div>
							<div class="searchOptions" id="areaList">
								<span id="areaName" style="display:block;">
									<div class="optionBtn" onclick="selectByKey(this,3);">全省</div>
									<div class="optionBtn" onclick="selectByKey(this,3);">南昌</div>
									<div class="optionBtn" onclick="selectByKey(this,3);">九江</div>
									<div class="optionBtn" onclick="selectByKey(this,3);">赣州</div>
									<div class="optionBtn" onclick="selectByKey(this,3);">抚州</div>
									<div class="optionBtn" onclick="selectByKey(this,3);">宜春</div>
									<div class="optionBtn" onclick="selectByKey(this,3);">吉安</div>
									<div class="optionBtn" onclick="selectByKey(this,3);">上饶</div>
									<div class="optionBtn" onclick="selectByKey(this,3);">景德镇</div>
									<div class="optionBtn" onclick="selectByKey(this,3);">鹰潭</div>
									<div class="optionBtn" onclick="selectByKey(this,3);">萍乡</div>
								</span>
							</div>
							<div style="clear: both;"></div>
						</div>
						</div>
						<div>
						<div  id="allList">
							
							</div>
							<div id="getmoreAllActi" style="margin:10px 0;background-color: rgb(247, 247, 247);">
								<a href="javascript:void(0);"  class="renovate" id="moreAllList">
									<span class="renovateTitle" >加载更多</span>
								</a>
							</div>
						</div>
					</div>
					
					<div id="my" style="display:none;">
						<div class="searchOptions clearfix">
							<div class="optionBtn selected" id="allStatus" onclick="selectByKey(this,4);">全部</div>
							<span id="status">
							<div class="optionBtn" onclick="selectByKey(this,5);">审核中</div>
							<div class="optionBtn" onclick="selectByKey(this,5);">已发布</div>
							<div class="optionBtn" onclick="selectByKey(this,5);">未通过审核</div>
							</span>
						</div>
						<div>
						<div id="myList">
							<%-- <div class="shareDataBar clearfix">
								<div style="float:left;">
									<img src="${ctx}/static/image/experienceSharing/banner_1.jpg" width="200" height="116" style="display:block;">
								</div>
								<div style="margin-left:220px;">
									<div class="shareTitle">先进园区动态平台</div>
									<div class="shareTime">[2016-11-02]</div>
									<div class="shareContent">先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进经平台</div>
									<div class="share_companyName">
										<img src="${ctx}/static/image/experienceSharing/headPortrait.png" width="15" height="15">
										<span>江西省融合科技有限责任公司</span>
									</div>
									<div class="clearfix">
										<div class="share_address">
											<img src="${ctx}/static/image/experienceSharing/headPortrait.png" width="15" height="15">
											<span>江西&nbsp;南昌</span>
										</div>
										<a href="javascript:;" class="deleteOper">X&nbsp;删除</a>
										<div class="share_stateBlue">审核中</div>
									</div>
								</div>
								<img src="${ctx}/static/image/experienceSharing/recommend.png" width="47px;" height="47px;" class="recommendItem">
							</div>
							<div class="shareDataBar clearfix">
								<div style="float:left;">
									<img src="${ctx}/static/image/experienceSharing/banner_1.jpg" width="200" height="116" style="display:block;">
								</div>
								<div style="margin-left:220px;">
									<div class="shareTitle">先进园区动态平台先进园区动态平台先进...</div>
									<div class="shareTime">[2016-11-02]</div>
									<div class="shareContent">先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进经平台</div>
									<div class="share_companyName">
										<img src="${ctx}/static/image/experienceSharing/headPortrait.png" width="15" height="15">
										<span>江西省融合科技有限责任公司</span>
									</div>
									<div class="clearfix">
										<div class="share_address">
											<img src="${ctx}/static/image/experienceSharing/headPortrait.png" width="15" height="15">
											<span>江西&nbsp;南昌</span>
										</div>
										<a href="javascript:;" class="deleteOper">X&nbsp;删除</a>
										<div class="share_stateGreen">已发布</div>
									</div>
								</div>
								<img src="${ctx}/static/image/experienceSharing/recommend.png" width="47px;" height="47px;" class="recommendItem">
							</div>
							<div class="shareDataBar clearfix">
								<div style="float:left;">
									<img src="${ctx}/static/image/experienceSharing/banner_1.jpg" width="200" height="116" style="display:block;">
								</div>
								<div style="margin-left:220px;">
									<div class="shareTitle">先进园区动态平台</div>
									<div class="shareTime">[2016-11-02]</div>
									<div class="shareContent">先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进园区动态平台先进经平台</div>
									<div class="share_companyName">
										<img src="${ctx}/static/image/experienceSharing/headPortrait.png" width="15" height="15">
										<span>江西省融合科技有限责任公司</span>
									</div>
									<div class="clearfix">
										<div class="share_address">
											<img src="${ctx}/static/image/experienceSharing/headPortrait.png" width="15" height="15">
											<span>江西&nbsp;南昌</span>
										</div>
										<a href="javascript:;" class="deleteOper">X&nbsp;删除</a>
										<div class="share_stateGray">未通过审核</div>
									</div>
								</div>
							</div> --%>
							</div>
							
							<div id="getmoreAllActi" style="margin:10px 0;">
								<a href="javascript:void(0);"  class="renovate" id="moreMyList">
									<span class="renovateTitle" >加载更多</span>
								</a>
							</div>
						</div>
					</div>
					
					<!-- 动态菜单栏，iframe位置 -->
					<!-- <div style="display:none;">
						<iframe id="frame_content1" onload="changeFrameHeight1();" src="" allowtransparency="true" style="background-color=transparent" title="test" frameborder="0" width="100%" scrolling="no">
						您的浏览器不支持嵌入式框架，或者当前配置为不显示嵌入式框架。
						</iframe>
					</div>
					<script>
					function changeFrameHeight1(){
					    var iframe= document.getElementById("frame_content1"); 
					    iframe.height=document.documentElement.clientHeight;
					}
					window.onresize=function(){  
					     changeFrameHeight1();  
					}
					</script>
					<div style="display:none;">
						<iframe id="frame_content2" onload="changeFrameHeight2();" src="" allowtransparency="true" style="background-color=transparent" title="test" frameborder="0" width="100%" scrolling="no">
						您的浏览器不支持嵌入式框架，或者当前配置为不显示嵌入式框架。
						</iframe>
					</div>
					<script>
					function changeFrameHeight2(){
					    var iframe= document.getElementById("frame_content2"); 
					    iframe.height=document.documentElement.clientHeight;
					}
					window.onresize=function(){  
					     changeFrameHeight2();  
					}
					</script> -->
				</div>
			</div>
			<div class="share_contRight">
				<div class="buttonBar">
					<button class="button button-raised buttonContral" onClick="shareExperience();">
						<img src="${ctx}/static/image/experienceSharing/release.png" width="30px;" height="30px;" class="buttonImg">发布动态
					</button>
				</div>
				<div class="share_rightDataBar">
					<div class="share_rightTop">
						<div class="share_rightTitle">精选内容</div>
						<!-- <div class="share_rightContMore">更多></div> -->
					</div>
					<div style="padding:7px 15px;">
					<c:forEach items="${infoList }" var="infoList">
					<a href="javascript:;" onclick="view('${infoList.expId}','0')">
					<div class="share_rightCont">
							<img src="${infoList.expImage }" width="90" height="50" style="float:left;">
							<div style="margin-left:100px; line-height:1.4; min-height: 59px;">
								${infoList.expTitle}
							</div>
						</div>
					</a>
					</c:forEach>
					</div>
				</div>
				<img src="${ctx}/static/image/experienceSharing/advertisement2.jpg" width="340" height="110" class="linkImg">
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</div>
<script src="${ctx}/static/js/jquery.nivo.slider.pack_deepred.js"></script>
<script>
 $(function(){

    $('#slider_top').nivoSlider({
		directionNav: false,
		captionOpacity: 0 ,
		controlNav: true,
		boxCols: 8,
		boxRows: 4,
		slices: 15,
		effect:'random',
		animSpeed: 500,
		pauseTime: 3000 
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
		$(".tabItem ul li").eq(0).addClass("itemClick");
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
	
	getList("","",1,4,0,1,"");
	
	$('#moreAllList').click(function(){
		var pageNum = Number($("#pageNum").val())+1;
		var title = $('#expTitle').val();
		var label = "";
		var areaName = "";
		$("#label .optionBtn").each(function(){
	         if($(this).hasClass("selected")){
	        	 label = $(this).text().substr(0, $(this).text().indexOf('('));
	         };
	     }); 
		$("#areaName .optionBtn").each(function(){
	         if($(this).hasClass("selected")){
	        	 areaName = $(this).text().substr(0, $(this).text().indexOf('('));
	         };
	     }); 
	   getList(title,label,pageNum,4,0,1,areaName);
	});
	$('#moreMyList').click(function(){
		var pageNum1 = Number($("#pageNum1").val())+1;
		var title = $('#expTitle').val();
		var status = null;
		
		$("#status .optionBtn").each(function(){
	         if($(this).hasClass("selected")){
	        	 if($(this).text().indexOf('(')!=-1){
	        	     status = $(this).text().substr(0, $(this).text().indexOf('('));
	        	 }else{
	        		 status = $(this).text();
	        	 }
	        	 if(label=="审核中"){
	        		 status = 2;
	        	 }
	        	 if(label=="已发布"){
	        		 status = 1;
	        	 }
	        	 if(label=="未通过审核"){
	        		 status = 0;
	        	 }
	        
	         };
	     }); 
	   getList(title,"",pageNum1,3,1,status,"");
	});
	var msg = '${message}';
	if(msg!=null&&msg!=""){
		tips(msg);
		msg=null;
	}   
	//动态菜单栏，依据之前的table切换，采用iframe改进
	/* $(".titleName ul li").click(function(){
		var link = $(this).attr("target");
		$("#frame_content1").attr("src",link);
		$("#frame_content2").attr("src",link);
	}); */
 });
 /* function selectLink(){
	 var link = $("#selectLink").parent().attr("target");
	 //alert(link);
	 $("#frame_content1").attr("src",link);
 } */
 function shareExperience(){
 	location.href="${ctx}/expShare/add";
 }
 function getList(expTitle,expLabel,pageNum,pageSize,type,status,areaName){
	 if(type==0){
	 $('#pageNum').val(pageNum);
	 }else if(type==1){
		 $('#pageNum1').val(pageNum);
	 }
	 
	 if("全省"==areaName){
		 areaName = "";
	 }
	 $.ajax({
			url:"${ctx}/expShare/json/list",
			type:"get",
			data:{
				"pageNum":pageNum,
				"pageSize":pageSize,
				"expTitle":expTitle,
				"expLabel":expLabel,
				"status":status,
				"areaName":areaName,
				"type":type
			},
			dataType:"json",
			success:function(result){
				console.log(result)
				if(result.code==-1){
					layer.msg(result.msg);
				}else if(result.code==2){
					if(type==0){
						$("#label .optionBtn").each(function(){
					     	if($(this).hasClass("selected")){
					        	if($(this).text().indexOf("(")!=-1){
					        		$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					        	}
					     	} 
						});
						if($('#all').text().indexOf("(")!=-1){
			        		$('#all').text($('#all').text().substring(0,$('#all').text().indexOf("(")));
			        	}
						$('#allList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
					    $('#moreAllList').hide();
					}else{
						$("#status .optionBtn").each(function(){
					    	if($(this).hasClass("selected")){
					        	if($(this).text().indexOf("(")!=-1){
					        		$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					        	}
					    	} 
						});
						if($('#allStatus').text().indexOf("(")!=-1){
			        		$('#allStatus').text($('#allStatus').text().substring(0,$('#allStatus').text().indexOf("(")));
			        	}
					    $('#myList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
						$('#moreMyList').hide();
					}
				}else if(result.code==-2){
					$("#status .optionBtn").each(function(){
				        if($(this).hasClass("selected")){
				        	if($(this).text().indexOf("(")!=-1){
				        		$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
				        	}
				    	} 
					});
					if($('#allStatus').text().indexOf("(")!=-1){
		        		$('#allStatus').text($('#allStatus').text().substring(0,$(this).text().indexOf("(")));
		        	}
					$('#myList').empty();
					layer.msg(result.msg);
					$('#moreMyList').hide();
				}else{
					var list = result.value;
					if(type==1){
					$("#status .optionBtn").each(function(){
			        	if($(this).hasClass("selected")){
			            	if($(this).text().indexOf("(")!=-1){
								$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
							}
			            	$(this).text($(this).text()+"("+result.msg+")");
			            }
			        }); 
					if($('#allStatus').hasClass("selected")){
						if($('#allStatus').text().indexOf("(")!=-1){
							$('#allStatus').text($('#allStatus').text().substring(0,$('#allStatus').text().indexOf("(")));
						}
		            	$('#allStatus').text($('#allStatus').text()+"("+result.msg+")");
		            }
					}else if(type==0){
						$("#label .optionBtn").each(function(){
				            if($(this).hasClass("selected")){
				            	if($(this).text().indexOf("(")!=-1){
									$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
								}
				            	$(this).text($(this).text()+"("+result.msg+")");
				            }
				        }); 
						$("#areaName .optionBtn").each(function(){
				            if($(this).hasClass("selected")){
				            	if($(this).text().indexOf("(")!=-1){
									$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
								}
				            	$(this).text($(this).text()+"("+result.msg+")");
				            }
				        }); 
						if($('#all').hasClass("selected")){
							if($('#all').text().indexOf("(")!=-1){
								$('#all').text($('#all').text().substring(0,$('#all').text().indexOf("(")));
							}
			            	$('#all').text($('#all').text()+"("+result.msg+")");
			            }
					}
			    
			    if(pageNum==1){
					if(type==0){
						$('#allList').empty();
					}else{
						$('#myList').empty();
					}
			    }
				
			    for(var i = 0;i<list.length;i++){
			    	var info = list[i];
			    	var text = info.expText.replace(/<[^>]+>/g,"").replace(/&nbsp;/g,"").replace(/&ldquo;/g,"“").replace(/&rdquo;/g,"”");
			    	text = jQuery.trim(text);
			    	if(text!=""&&text!=null&&text.length>77){
			    		text = text.substring(0,74)+"...";
			    	}
			  		var _div = '<a href="javascript:;" onclick="view(\''+info.expId+'\',\''+type+'\')">'
			  			      +'<div class="shareDataBar clearfix">'
				     		  +'<div style="float:left;">'
					 		  +'<img src="'+info.expImage+'" width="200" height="116" style="display:block;">'
					 		  +'</div>'
				     		  +'<div style="margin-left:220px;">';
				    if(info.expTitle.length>19){
				    	_div += '<div class="shareTitle" title='+info.expTitle+'>'+info.expTitle.substring(0,20)+'...</div>';
				    }else{
				    	_div += '<div class="shareTitle" title='+info.expTitle+'>'+info.expTitle+'</div>';
				    }
				     _div += '<div class="shareTime">[&nbsp;'+getTime(info.createTime)+']</div>'
					 		  +'<div class="shareContent">'+text+'</div>' 
					 		  + '<div class="share_companyName">'
						      +'<img src="${ctx}/static/image/experienceSharing/enterCount.png" width="12" height="12" style="margin-right:7px;">'
						      +'<span>'+info.expUnit+'</span>'
							  +'</div>'
						      +'<div class="clearfix">'
							  +'<div class="share_address">'
							  +'<img src="${ctx}/static/image/experienceSharing/location.png" width="12" height="12" style="margin-right:7px;">';
								  
					if(info.areaName==null||info.areaName==""){
						if(info.provinceName==null||info.provinceName==""){
							_div += '<span>暂无地址信息</span>';
						}else{
						_div += '<span>'+info.provinceName+'</span>';
						}
					}else{
						_div += '<span>'+info.provinceName+'&nbsp;'+info.areaName+'</span>';
					}
								  
					_div += '</div>';
				    if(type==0){
						_div += '<div class="share_comment">'
						  +'<img src="${ctx}/static/image/experienceSharing/commentCount.png" width="12" height="12" style="margin-right:7px;">'
						  +'<span>'+info.commentCount+'评论</span>'
						  +'</div>'
					      +'<div class="share_browse">'
						  +'<img src="${ctx}/static/image/experienceSharing/browseCount.png" width="12" height="12" style="margin-right:7px;">'
						  +'<span>'+info.browseCountEdit+'浏览</span>'
					      +'</div>';
					}else{
						_div += '<a href="javascript:;" class="deleteOper" onclick="del(\''+info.expId+'\');">X&nbsp;删除</a>';
						if(info.status==0){
							_div += '<div class="share_stateGray">未通过审核</div>';
						}else if(info.status==1){
							_div +=  '<div class="share_stateGreen">已发布</div>';
						}else if(info.status==2){
							_div += '<div class="share_stateBlue">审核中</div>';
						}
					}
					_div +='</div>'
						 +'</div>';
					if(info.isTop==1){
						_div +='<img src="${ctx}/static/image/experienceSharing/recommend.png" width="47px;" height="47px;" class="recommendItem">';
					} 
					_div +='</div>'
					     +'</a>';
								 
					if(type==0){
						$('#allList').append(_div);
					}else{
						$('#myList').append(_div);
					}
					if(result.code==0){
						$('#moreAllList').hide();
						$('#moreMyList').hide();
					}else if(result.code==1){
						$('#moreAllList').show();
						$('#moreMyList').show();
					}
			      }
				}
			},error:function(){
				layer.alert("请求超时，请稍后重试");
			},
	 });
 }
	 
 function getTime(time) {
		var date = new Date(time);
		Y = date.getFullYear() + '-';
		M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
				.getMonth() + 1)
				+ '-';
		D = (date.getDate() < 10 ?( '0' + date.getDate() ) : date.getDate() ) + ' ';
		h = (date.getHours() < 10 ?( '0' + date.getHours() ) : date.getHours() ) + ':';
		m = (date.getMinutes() < 10 ?( '0' + date.getMinutes() ) : date.getMinutes() ) + ':';
		s = (date.getSeconds() < 10 ?( '0' + date.getSeconds() ) : date.getSeconds() );
		return (Y + M + D );
 }
 function mylist() {
	 getList("","",1,3,1,null,"");
 }
 function selectByKey(obj,kind) { //kind 1:所有分享全部 2:所有分享标签 3:所有分享地区 4：我的全部 5：我的状态
	var expTitle = "";
    var label = "";
    var areaName = "";
    var status = null;
	if(kind==1){
		if($(obj).hasClass("selected")){
			if($(obj).text().indexOf("(")!=-1){
				$(obj).text($(obj).text().substring(0,$(obj).text().indexOf("(")));
			}
			$(obj).removeClass("selected");
		}else{
			$("#label .optionBtn").each(function(){
		        if($(this).hasClass("selected")){
		        	if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
		        	$(this).removeClass("selected");
		        };
		    }); 
			$("#areaName .optionBtn").each(function(){
		        if($(this).hasClass("selected")){
		        	if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
		        	$(this).removeClass("selected");
		        };
		    }); 
			$(obj).addClass("selected");
		    $('#expTitle').val("");
		 }
		 
		 getList("","",1,4,0,1,"");
	}else if(kind==2){
		if($(obj).hasClass("selected")){
			if($(obj).text().indexOf("(")!=-1){
				$(obj).text($(obj).text().substring(0,$(obj).text().indexOf("(")));
			}
			$(obj).removeClass("selected");
		}else{
			$("#label .optionBtn").each(function(){
		        if($(this).hasClass("selected")){
		        	if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
		        	$(this).removeClass("selected");
		        };
		    }); 
			$("#areaName .optionBtn").each(function(){
		        if($(this).hasClass("selected")){
		        	if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
		        	areaName = $(this).text();
		        };
		    }); 
			$(obj).addClass("selected");
			if($('#all').hasClass("selected")){
				if($('#all').text().indexOf("(")!=-1){
					$('#all').text($('#all').text().substring(0,$('#all').text().indexOf("(")));
				}
			    $('#all').removeClass("selected");
			}
			if( $(obj).text().indexOf('(')!=-1){
    			label = $(obj).text().substring(0, $(obj).text().indexOf('('));
			}else{
				label = $(obj).text();
			}
		}
		
		expTitle = $('#expTitle').val();	
		 
		getList(expTitle,label,1,4,0,1,areaName);
	}else if(kind==3){
		if($(obj).hasClass("selected")){
			if($(obj).text().indexOf("(")!=-1){
				$(obj).text($(obj).text().substring(0,$(obj).text().indexOf("(")));
			}
			$(obj).removeClass("selected");
		}else{
			$("#areaName .optionBtn").each(function(){
		    	if($(this).hasClass("selected")){
		        	if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
		        	$(this).removeClass("selected");
		        };
		        $("#label .optionBtn").each(function(){
			    	if($(this).hasClass("selected")){
			        	if($(this).text().indexOf("(")!=-1){
							$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
						}
			        	label = $(this).text();
			        };
			    });
				 $(obj).addClass("selected");
				 
				/* if($('#all').hasClass("selected")){
					if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
					$('#all').removeClass("selected");
				} */
				if($(obj).text().indexOf('(')!=-1){
					areaName = $(obj).text().substring(0, $(obj).text().indexOf('('));
				}else{
					areaName = $(obj).text();
				}
		 	});
		
		expTitle = $('#expTitle').val();	
		getList(expTitle,label,1,4,0,1,areaName);
		}
	 }else if(kind==4){
		if($(obj).hasClass("selected")){
			if($(obj).text().indexOf("(")!=-1){
				$(obj).text($(obj).text().substring(0,$(obj).text().indexOf("(")));
			}
			$(obj).removeClass("selected");
		}else{
			$("#status .optionBtn").each(function(){
		        if($(this).hasClass("selected")){
		        	if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
		        	$(this).removeClass("selected");
		        };
		    }); 
			 
			$(obj).addClass("selected");
		    $('#expTitle').val("");
		}
		 
		getList("","",1,3,1,null,"");
	 }else if(kind==5){
		if($(obj).hasClass("selected")){
			if($(obj).text().indexOf("(")!=-1){
				$(obj).text($(obj).text().substring(0,$(obj).text().indexOf("(")));
			}
			$(obj).removeClass("selected");
		}else{
			$("#status .optionBtn").each(function(){
				if($(this).hasClass("selected")){
			    	if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
			        	$(this).removeClass("selected");
			    };
			}); 
				 
				$(obj).addClass("selected");
				 
			if($('#allStatus').hasClass("selected")){
				if($('#allStatus').text().indexOf("(")!=-1){
					$('#allStatus').text($('#allStatus').text().substring(0,$('#allStatus').text().indexOf("(")));
				}
				$('#allStatus').removeClass("selected");
			}
			if($(obj).text().indexOf('(')!=-1){
    			status = $(obj).text().substr(0, $(this).text().indexOf('('));
			}else{
				status = $(obj).text();
			}
			if(status=="审核中"){
        		status = 2;
        	}
        	if(status=="已发布"){
        		status = 1;
        	}
        	if(status=="未通过审核"){
        		status = 0;
        	}
		}
		expTitle = $('#expTitle').val();
		getList(expTitle,"",1,3,1,status,"");
	}else if(kind==6){
		if($("#my").css("display")=='none'){
			$("#label .optionBtn").each(function(){
		        if($(this).hasClass("selected")){
		        	if($(this).text().indexOf("(")!=-1){
						label =	$(this).text().substring(0,$(this).text().indexOf("("));
					}else{
						label =	$(this).text();
					}
		        };
		    }); 
			$("#areaName .optionBtn").each(function(){
		        if($(this).hasClass("selected")){
		        	if($(this).text().indexOf("(")!=-1){
						areaName =$(this).text().substring(0,$(this).text().indexOf("("));
					}else{
						areaName =$(this).text();
					}
		        };
		    });
			expTitle = $('#expTitle').val();
			getList(expTitle,label,1,4,0,1,areaName);		
		}else{
			$("#status .optionBtn").each(function(){
		        if($(this).hasClass("selected")){
		        	if($(this).text().indexOf("(")!=-1){
		        		status =$(this).text().substring(0,$(this).text().indexOf("("));
					}else{
						status = $(this).text();
					}
		        };
		    }); 
			if(status=="审核中"){
        		status = 2;
        	}
        	if(status=="已发布"){
        		status = 1;
        	}
        	if(status=="未通过审核"){
        		status = 0;
        	}
			
			expTitle = $('#expTitle').val();
			getList(expTitle,"",1,3,1,status,"");	
		}
	}
 }
	 
 function selectByLabel(kind){
	$(".titleName ul li").each(function(){
		if($(this).hasClass("titleClick")){
			$(this).removeClass("titleClick");
		}
		$(".titleName ul li").eq(0).addClass("titleClick"); 
	});
	$(".titleItem>div").eq(0).stop(true).show().siblings().stop(true).hide();
	 
	$("#label .optionBtn").each(function(){
        if($(this).hasClass("selected")){
        	if($(this).text().indexOf("(")!=-1){
				$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
			}
        	$(this).removeClass("selected");
        };
       	if($(this).text()==kind){
       		$(this).addClass("selected");
       	}
    }); 
	if($('#all').hasClass("selected")){
		if($('#all').text().indexOf("(")!=-1){
			$('#all').text($('#all').text().substring(0,$('#all').text().indexOf("(")));
		}
		   $('#all').removeClass("selected");
		}
	$('#expTitle').val("");
	getList("",kind,1,4,0,1,"");
 }
 function main(){
	$("#label .optionBtn").each(function(){
		if($(this).hasClass("selected")){
        	if($(this).text().indexOf("(")!=-1){
				$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
			}
        	$(this).removeClass("selected");
        };
    }); 
	$("#areaName .optionBtn").each(function(){
		if($(this).hasClass("selected")){
        	if($(this).text().indexOf("(")!=-1){
				$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
			}
        	$(this).removeClass("selected"); 
        };
    });
	if(!$('#all').hasClass("selected")){
		$('#all').addClass("selected");
	}
	getList("","",1,4,0,1,"");
 }
	 
 function del(id){
	confirm('确认删除？', function(){
	$.ajax({
		url:"${ctx}/expShare/json/delete",
		type:"get",
		data:{
			"ids":id
		},
		dataType:"json",
		success:function(result){
			tips(result);
				$("#status .optionBtn").each(function(){
			        if($(this).hasClass("selected")){
			        	if($(this).text().indexOf("(")!=-1){
			        		status =$(this).text().substring(0,$(this).text().indexOf("("));
						}else{
							status = $(this).text();
						}
			        };
			    }); 
				
				expTitle = $('#expTitle').val();
				getList(expTitle,"",1,3,1,status,"");	
		},error:function(){
			layer.alert("删除异常！");
		}
	});
	},function(){});  
 }
	 
 function view(id,type){
	 window.location.href="${ctx}/expShare/view/"+id+"?type="+type;
 }
</script>
</body>
</html>
