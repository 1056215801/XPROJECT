<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>首页</title>
<link href="${ctx}/static/css/investigation/onlineSurvey.css" rel="stylesheet"/>
<link href="${ctx}/static/css/investigation/style_deepred.css" rel="stylesheet" media="screen" />
<link href="${ctx}/static/css/investigation/iCheck/custom.css" rel="stylesheet"/>
<script src="${ctx}/static/js/jquery.nivo.slider.pack_deepred.js"></script>
<script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
<script>
	$(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
</script>
<style>
.tabItem {
	background-color:#f1921c;
	height:40px;
}
.itemClick { background-color:#B76501;}
</style>
<script>
 $(function(){
    $(".tabName ul li").each(function(){//页面头部模块切换控制
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		})
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(2).addClass("itemClick");
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
 })
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
</head>

<body>
<div class="survey_main">
	<%@ include file="../common/header.jsp"%>
	
	<div class="survey_content">
		<div class="bg_" style="margin: 0 auto;z-index: 0;margin-bottom: 10px; position:relative">
			<div class="bg_in_red" style="width: 100%;height: 322px;margin: 0 auto;z-index: 1;">
				 <div id="slider-wrap">
					<div id="slider_top" class="nivoSlider">
					<a  class="nivo-imageLink" href="javascript:;" target="_blank" >
					<img src="images/BAN.jpg" style="height:322px;" /></a>
					<a  class="nivo-imageLink" href="javascript:;" target="_blank" >
					<img src="images/new2.jpg" style="height:322px;" /></a>
					<a  class="nivo-imageLink" href="javascript:;" target="_blank" >
					<img src="images/new3.jpg" style="height:322px;" /></a>
					</div>
				</div>
			</div>
			<div class="displayFrame">
				<div class="displayFrameTitle">快来一起投票吧！</div>
				<div class="displayFrameCont">
					<div>已有<font style="color:#F0FF00;">1757325</font>人注册了江西工业园区微讯</div>
					<div>已有<font style="color:#F0FF00;">1757325</font>个自助调查发布</div>
					<div>已有<font style="color:#F0FF00;">1757325</font>人次参与投票</div>
					<input type="button" value="发布调查" class="displayFrameBtn">
				</div>
			</div>
		</div>
		
		<div style="margin-top:10px;">
			<div class="titleName">
				<ul>
					<li><a href="javascript:;">全部调查</a></li>
					<li><a href="javascript:;">我发布的</a></li>
					<li><a href="javascript:;">我参与的</a></li>
				</ul>
				<div class="searchBar">
					<input type="text" placeholder="标签关键字"/>
					<img src="images/headPortrait.png" width="15px" height="15px;"/>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div class="titleItem">
				<div>
					<div class="searchOptions">
						<div class="optionBtn selected">全部</div>
						<div class="optionBtn">优惠</div>
						<div class="optionBtn">创业</div>
						<div class="optionBtn">公益</div>
						<div class="optionBtn">生活</div>
						<div class="optionBtn">培训课程</div>
						<div class="optionBtn">聚会</div>
						<div class="optionBtn">科技</div>
						<div class="optionBtn">电影</div>
						<div style="clear:both;"></div>
					</div>
					<div class="surveyPictureBar">
						<div class="surveyPicture">
							<img src="images/activitybig.jpg" width="240px;" height="150px;" style="display:block;">
							<div class="surveyPictureTips">关于旭神有多神</div>
						</div>
						<div class="surveyPicture">
							<img src="images/activitybig.jpg" width="240px;" height="150px;" style="display:block;">
							<div class="surveyPictureTips">关于旭神有多神</div>
						</div>
						<div class="surveyPicture">
							<img src="images/activitybig.jpg" width="240px;" height="150px;" style="display:block;">
							<div class="surveyPictureTips">关于旭神有多神</div>
						</div>
						<div class="surveyPicture">
							<img src="images/activitybig.jpg" width="240px;" height="150px;" style="display:block;">
							<div class="surveyPictureTips">关于旭神有多神</div>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="allSurvey">
						<table>
							<tr>
								<td style="width:40%; color:#5e5e5e;">
									>关于“公交车后门的后视装置”的调查
									<img src="images/activitybig.jpg" width="20px;" height="10px;" class="newSur">
								</td>
								<td style="width:10%; color:#f1921c;">进行中</td>
								<td style="width:25%;">
									<img src="images/headPortrait.png" width="15px;" height="15px;" class="headSign">
									参与人气：<font style="color:#f1921c;">23230000</font>人
								</td>
								<td wstyle="width:25%; padding:5px 0;">2016-10-04 00:00 至 2016-10-15 00:00</td>
							</tr>
							<tr>
								<td style="width:40%; color:#5e5e5e;">
									>关于“公交车后门的后视装置”的调查
								</td>
								<td style="width:10%;">已结束</td>
								<td style="width:25%;">
									<img src="images/headPortrait.png" width="15px;" height="15px;" class="headSign">
									参与人气：<font style="color:#f1921c;">23230000</font>人
								</td>
								<td style="width:25%;">2016-10-04 00:00 至 2016-10-15 00:00</td>
							</tr>
						</table>
						<div id="getmoreAllSur" style="margin:10px 1.6% 10px;">
							<a href="javascript:;" onClick="getmore();" class="renovate">
								<span class="renovateTitle">加载更多</span>
							</a>
						</div>
					</div>
				</div>
				
				<div style="display:none;">
					<div class="searchOptions">
						<div class="optionBtn selected">全部</div>
						<div class="optionBtn">进行中</div>
						<div class="optionBtn">已结束</div>
						<div class="optionBtn">草稿箱</div>
						<div style="clear:both;"></div>
					</div>
					<div class="mySurvey">
						<table>
							<tr class="firstTr">
								<th style="width:5%;">
									<div class="i-checks" style="text-align:center;"><input type="checkbox"></div>
								</th>
								<th style="width:40%;">标题</th>
								<th style="width:5%;">状态</th>
								<th style="width:10%;">参与人数（人）</th>
								<th style="width:25%;">调查时间</th>
								<th style="width:15%;">操作</th>
							</tr>
							<tr class="nextTr">
								<td style="width:5%;">
									<div class="i-checks" style="text-align:center;"><input type="checkbox"></div>
								</td>
								<td style="width:40%; color:#5e5e5e;">
									>关于“公交车后门的后视装置”的调查
									<img src="images/activitybig.jpg" width="20px;" height="10px;" class="newSur">
								</td>
								<td style="width:5%; color:#f1921c;">进行中</td>
								<td style="width:10%; color:#f1921c;">23230000</td>
								<td style="width:25%;">2016-10-04 00:00 至 2016-10-15 00:00</td>
								<td style="width:15%; padding:0; text-align:right;">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
								</td>
							</tr>
							<tr class="nextTr">
								<td style="width:5%;">
									<div class="i-checks" style="text-align:center;"><input type="checkbox"></div>
								</td>
								<td style="width:40%; color:#5e5e5e;">
									<font style="color:#1D64F0;">[草稿箱]</font>
									>关于“公交车后门的后视装置”的调查
								</td>
								<td style="width:5%; color:#f1921c;">进行中</td>
								<td style="width:10%; color:#f1921c;">23230000</td>
								<td style="width:25%;">2016-10-04 00:00 至 2016-10-15 00:00</td>
								<td style="width:15%; padding:0; text-align:right;">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
								</td>
							</tr>
						</table>
						<div id="getmoreMyRel" style="margin:10px 1.6% 10px;">
							<a href="javascript:;" onClick="getmore();" class="renovate">
								<span class="renovateTitle">加载更多</span>
							</a>
						</div>
					</div>
				</div>
				
				<div style="display:none;">
					<div class="searchOptions">
						<div class="optionBtn selected">全部</div>
						<div class="optionBtn">进行中</div>
						<div class="optionBtn">已结束</div>
						<div style="clear:both;"></div>
					</div>
					<div class="mySurvey">
						<table>
							<tr class="firstTr">
								<th style="width:5%;">
									<div class="i-checks" style="text-align:center;"><input type="checkbox"></div>
								</th>
								<th style="width:40%;">标题</th>
								<th style="width:5%;">状态</th>
								<th style="width:10%;">参与人数（人）</th>
								<th style="width:25%;">调查时间</th>
								<th style="width:15%;">操作</th>
							</tr>
							<tr class="nextTr">
								<td style="width:5%;">
									<div class="i-checks" style="text-align:center;"><input type="checkbox"></div>
								</td>
								<td style="width:40%; color:#5e5e5e;">
									>关于“公交车后门的后视装置”的调查
									<img src="images/activitybig.jpg" width="20px;" height="10px;" class="newSur">
								</td>
								<td style="width:5%; color:#f1921c;">进行中</td>
								<td style="width:10%; color:#f1921c;">23230000</td>
								<td style="width:25%;">2016-10-04 00:00 至 2016-10-15 00:00</td>
								<td style="width:15%; padding:0; text-align:right;">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
								</td>
							</tr>
							<tr class="nextTr">
								<td style="width:5%;">
									<div class="i-checks" style="text-align:center;"><input type="checkbox"></div>
								</td>
								<td style="width:40%; color:#5e5e5e;">
									<font style="color:#1D64F0;">[草稿箱]</font>
									>关于“公交车后门的后视装置”的调查
								</td>
								<td style="width:5%; color:#f1921c;">进行中</td>
								<td style="width:10%; color:#f1921c;">23230000</td>
								<td style="width:25%;">2016-10-04 00:00 至 2016-10-15 00:00</td>
								<td style="width:15%; padding:0; text-align:right;">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
									<img src="images/activitybig.jpg" width="25px;" height="25px;" class="operSurvey">
								</td>
							</tr>
						</table>
						<div id="getmoreMyPar" style="margin:10px 1.6% 10px;">
							<a href="javascript:;" onClick="getmore();" class="renovate">
								<span class="renovateTitle">加载更多</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	
	 <%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>
