<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${ctx}/static/css/recruitment/employmentService.css" rel="stylesheet"/>
<!-- buttons -->
<link href="${ctx}/static/css/recruitment/buttons.css" rel="stylesheet"/>
</head>

<body>
<div class="employment_main">
	<div class="project_header">
		<%@ include file="../../common/header.jsp"%>
	</div>
	<input type="hidden" id="page_index" value="1">
	<div class="employment_content">
		<div class="employment_imageBar">
			<img src="${ctx}/static/image/recruitment/beijing.jpg" width="100%">
			<div class="employment_imageCont">
				<div class="employment_imageColumn">
					<span class="employment_imageData">
						<div>本周新增</div>
						<div><font class="yellowFont font24">45</font></div>
						<div>职位</div>
					</span>
					<img src="${ctx}/static/image/recruitment/img1.png" width="120">
				</div>
				<div class="employment_imageColumn">
					<span class="employment_imageData">
						<div>上月/季</div>
						<div>成功招聘</div>
						<div><font class="yellowFont font24">182</font>人</div>
					</span>
					<img src="${ctx}/static/image/recruitment/img2.png" width="120">
				</div>
				<div class="employment_imageColumn">
					<span class="employment_imageData">
						<div>服务企业</div>
						<div><font class="yellowFont font24">16</font>个</div>
					</span>
					<img src="${ctx}/static/image/recruitment/img3.png" width="120">
				</div>
			</div>
		</div>
		
		<div class="employment_cont clearfix">
			<div class="employment_contLeft">
				<div class="titleName clearfix">
					<ul>
						<li><a href="javascript:;">人才库</a></li>
						<li><a href="javascript:;">人才经纪人</a></li>
						<!-- <li><a href="javascript:;">我发布的</a></li> -->
					</ul>
				</div>
				<div class="titleItem">
					<div>
						<!-- <div class="personal_searchBar">
							<div class="searchBar clearfix">
								<input type="text" placeholder="" class="searchInput">
								<div class="searchBtn">搜索</div>
							</div>
						</div> -->
						<div>
							<div class="screen_typeBar clearfix">
								<div class="screen_name">所属行业：</div>
								<div class="screen_type" id="business_resume">
									<div class="screen_item" id="business_resume_p1">
										<div class="searchOptions selected" data="" onclick="getIndustryTypeChild(this,0)">不限</div>
									</div>
									<div class="item_detail" id="business_resume_c1" style="display: none;">
									</div>
									<div class="screen_item" id="business_resume_p2">
									</div>
									<div class="item_detail" id="business_resume_c2" style="display: none;">
									</div>
								</div>
								<!-- <div class="screen_more">
									<span class="redFont" onclick="moreIndustryType(this)">更多</span>
									<span class="caret_down"></span>
								</div> -->
							</div>
							<div class="screen_typeBar clearfix">
								<div class="screen_name">所在城市：</div>
								<div class="screen_type" id="area_resume">
									<div class="screen_item" id="area_resume_p1">
										<div class="searchOptions selected" data="" onclick="getAreaChild(this,0)">不限</div>
									</div>
									<div class="item_detail" id="area_resume_c1" style="display: none;"></div>
									
									<div class="screen_item" id="area_resume_p2">
									</div>
									<div class="item_detail" id="area_resume_c2" style="display: none;"></div>
									
									<div class="screen_item" id="area_resume_p3">
									</div>
									<div class="item_detail" id="area_resume_c3" style="display: none;"></div>
								</div>
								<!-- <div class="screen_more">
									<span class="redFont">更多</span>
									<span class="caret_down"></span>
								</div> -->
							</div>
							<div class="screen_typeBar clearfix">
								<div class="screen_name">年薪范围：</div>
								<div class="screen_type">
									<div class="screen_item" id="salary_resume">
										<div class="searchOptions selected" data="" onclick="selectResumeClick('salary_resume',this)">不限</div>
										<div class="searchOptions" data="53960000" onclick="selectResumeClick('salary_resume',this)">5万以下<i></i></div>
										<div class="searchOptions" data="22530000" onclick="selectResumeClick('salary_resume',this)">5-8万<i></i></div>
										<div class="searchOptions" data="22520000" onclick="selectResumeClick('salary_resume',this)">8-12万<i></i></div>
										<div class="searchOptions" data="53970000" onclick="selectResumeClick('salary_resume',this)">12-15万<i></i></div>
										<div class="searchOptions" data="12021000" onclick="selectResumeClick('salary_resume',this)">15-20万<i></i></div>
										<div class="searchOptions" data="12022000" onclick="selectResumeClick('salary_resume',this)">20-25万<i></i></div>
										<div class="searchOptions" data="53950000" onclick="selectResumeClick('salary_resume',this)">25-30万<i></i></div>
										<div class="searchOptions" data="12023000" onclick="selectResumeClick('salary_resume',this)">30-40万<i></i></div>
										<div class="searchOptions" data="12025000" onclick="selectResumeClick('salary_resume',this)">40-50万<i></i></div>
										<div class="searchOptions" data="12026000" onclick="selectResumeClick('salary_resume',this)">50-100万<i></i></div>
										<div class="searchOptions" data="12027000" onclick="selectResumeClick('salary_resume',this)">100万以上<i></i></div>
									</div>
								</div>
							</div>
							<div class="screen_typeBar clearfix">
								<div class="screen_name">工作经验：</div>
								<div class="screen_type">
									<div class="screen_item" id="workYear_resume">
										<div class="searchOptions selected" data="" onclick="selectResumeClick('workYear_resume',this)">不限</div>
										<div class="searchOptions" data="12050000" onclick="selectResumeClick('workYear_resume',this)">应届生<i></i></div>
										<div class="searchOptions" data="12051000" onclick="selectResumeClick('workYear_resume',this)">1年<i></i></div>
										<div class="searchOptions" data="12052000" onclick="selectResumeClick('workYear_resume',this)">1-3年<i></i></div>
										<div class="searchOptions" data="12053000" onclick="selectResumeClick('workYear_resume',this)">3-5年<i></i></div>
										<div class="searchOptions" data="12054000" onclick="selectResumeClick('workYear_resume',this)">5-10年<i></i></div>
										<div class="searchOptions" data="21770000" onclick="selectResumeClick('workYear_resume',this)">10年以上<i></i></div>
									</div>
								</div>
							</div>
						</div>
						<div class="personal_screenBar clearfix">
							<span class="personal_screen_title">共为你找到<font class="blueFont" id="resumeTotal">5000+</font>份简历</span>
							<select onchange="selectResumeChange(this)" id="diploma_resume">
								<option value="">学历要求不限</option>
								<option value="12019000">高中及以下</option>
								<option value="12086000">大专</option>
								<option value="12087000">本科</option>
								<option value="12088000">硕士</option>
								<option value="12089000">博士</option>
								<option value="15393000">MBA</option>
								<option value="15394000">EMBA</option>
							</select>
							<select id="sex_resume" onchange="selectResumeChange(this)">
								<option value="">性别不限</option>
								<option value="男">男</option>
								<option value="女">女</option>
							</select>
							<input type="text" class="form-control" id="age_resume" placeholder="年龄范围（例：18,30）" onblur="selectResumeBlur(this)">
							
						</div>
						<!-- 简历列表 -->
						<div class="personal_listBar"></div>
						
						<div style="margin:10px 0;background-color: rgb(247, 247, 247);" id="resumeMore">
							<a href="javascript:void(0);" class="renovate">
								<span class="renovateTitle">加载更多</span>
							</a>
						</div>
					</div>
					
					<!-- 经纪人 -->
					<div style="display:none;">
						<!-- <div class="agent_searchBar">
							<div class="searchBar clearfix">
								<input type="text" placeholder="" class="searchInput">
								<div class="searchBtn">搜索</div>
							</div>
						</div> -->
						<div>
							<div class="screen_typeBar clearfix">
								<div class="screen_name">擅长行业：</div>
								<div class="screen_type" id="business_headHunt">
									<div class="screen_item" id="business_headHunt_p1">
										<div class="searchOptions selected" data="" onclick="getIndustryTypeChild2(this,0)">不限</div>
									</div>
									<div class="item_detail" id="business_headHunt_c1" style="display: none;">
									</div>
									<div class="screen_item" id="business_headHunt_p2">
									</div>
									<div class="item_detail" id="business_headHunt_c2" style="display: none;">
									</div>
								</div>
								<!-- <div class="screen_more">
									<span class="redFont">更多</span>
									<span class="caret_down"></span>
								</div> -->
							</div>
							<div class="screen_typeBar clearfix">
								<div class="screen_name">工作经验：</div>
								<div class="screen_type">
									<div class="screen_item" id="workYear_headHunt">
										<div class="searchOptions selected" data="" onclick="selectHeadHuntClick('workYear_headHunt',this)">不限</div>
										<div class="searchOptions" data="12050000" onclick="selectHeadHuntClick('workYear_headHunt',this)">应届生<i></i></div>
										<div class="searchOptions" data="12051000" onclick="selectHeadHuntClick('workYear_headHunt',this)">1年<i></i></div>
										<div class="searchOptions" data="12052000" onclick="selectHeadHuntClick('workYear_headHunt',this)">1-3年<i></i></div>
										<div class="searchOptions" data="12053000" onclick="selectHeadHuntClick('workYear_headHunt',this)">3-5年<i></i></div>
										<div class="searchOptions" data="12054000" onclick="selectHeadHuntClick('workYear_headHunt',this)">5-10年<i></i></div>
										<div class="searchOptions" data="21770000" onclick="selectHeadHuntClick('workYear_headHunt',this)">10年以上<i></i></div>
									</div>
								</div>
							</div>
						</div>
						<div class="agent_screenBar clearfix">
							<span class="agent_screen_title">共为你找到<font class="orangeFont" id="headHuntTotal">0</font>名经纪人</span>
						</div>
						<div class="agent_listBar"></div>
						<div id="headHuntMore" style="margin:10px 0;">
							<a href="javascript:void(0);" class="renovate">
								<span class="renovateTitle">加载更多</span>
							</a>
						</div>
					</div>
					
					<div style="display:none;">
						<div class="searchOptionWrap clearfix">
							<div class="optionBtn optionSelected" onclick="mylist(this)" data="" style="cursor: pointer;" id="all">全部</div>
							<div class="optionBtn" onclick="mylist(this)" data="1" style="cursor: pointer;">已发布职位</div>
							<div class="optionBtn" onclick="mylist(this)" data="0" style="cursor: pointer;">已下线职位</div>
							<div class="optionBtn" onclick="mylist(this)" data="2" style="cursor: pointer;" id="draft">草稿箱</div>
						</div>
						<div class="myRecruit_listBar" id="mylist"></div>
					</div>
				</div>
			</div>	
			<div class="employment_contRight">
				<%-- <div class="buttonBar">
					<button class="button button-raised buttonContral" onclick="window.location.href='${ctx}/front/recruitment/hcdy/publish'">
						<img src="${ctx}/static/image/recruitment/zhiwei.png" width="30" height="30" class="buttonImg">发布职位
					</button>
				</div> --%>
				<div class="sideBar">
					<div class="side_top">
						<div class="side_title">上月招聘需求情况</div>
						<!--<div class="side_more">更多></div>-->
					</div>
					<div class="side_cont" style="background-color:#F9F9F9;">
						<div class="progressBar">
							<span class="progress_name">互联网/IT/通信</span>
							<span class="progress_strip_green" style="width:220px;"></span>
							<span class="progress_num_green">556</span>
						</div>
						<div class="progressBar">
							<span class="progress_name">交通/贸易/物流</span>
							<span class="progress_strip_green" style="width:200px;"></span>
							<span class="progress_num_green">502</span>
						</div>
						<div class="progressBar">
							<span class="progress_name">房地产/建筑物业</span>
							<span class="progress_strip_green" style="width:180px;"></span>
							<span class="progress_num_green">469</span>
						</div>
						<div class="progressBar">
							<span class="progress_name">能源/化工/环保</span>
							<span class="progress_strip_blue" style="width:160px;"></span>
							<span class="progress_num_blue">413</span>
						</div>
						<div class="progressBar">
							<span class="progress_name">服务/中介</span>
							<span class="progress_strip_blue" style="width:140px;"></span>
							<span class="progress_num_blue">347</span>
						</div>
						<div class="progressBar">
							<span class="progress_name">汽车/机械/制造</span>
							<span class="progress_strip_blue" style="width:120px;"></span>
							<span class="progress_num_blue">294</span>
						</div>
						<div class="progressBar">
							<span class="progress_name">制药/医疗</span>
							<span class="progress_strip_purple" style="width:100px;"></span>
							<span class="progress_num_purple">256</span>
						</div>
						<div class="progressBar">
							<span class="progress_name">政府/农林牧渔</span>
							<span class="progress_strip_purple" style="width:80px;"></span>
							<span class="progress_num_purple">202</span>
						</div>
						<div class="progressBar">
							<span class="progress_name">消费品</span>
							<span class="progress_strip_purple" style="width:60px;"></span>
							<span class="progress_num_purple">167</span>
						</div>
						<div class="progressBar">
							<span class="progress_name">广告/传媒/教育/文化</span>
							<span class="progress_strip_purple" style="width:40px;"></span>
							<span class="progress_num_purple">112</span>
						</div>
						<div class="progressBar">
							<span class="progress_name">金融</span>
							<span class="progress_strip_purple" style="width:20px;"></span>
							<span class="progress_num_purple">37</span>
						</div>
					</div>
				</div>	
				<img src="${ctx}/static/image/recruitment/advert.jpg" width="100%" style="margin:10px 0;">
				<div class="sideBar">
					<div class="side_top">
						<div class="side_title">成功使用企业</div>
						<!--<div class="side_more">更多></div>-->
					</div>
					<div class="side_cont" style="padding:7px 10px;">
						<c:forEach items="${companyList}" var="companyInfo">
							<div class="enterpriseBar">
								<img src="${ctx}/static/image/recruitment/headPortrait.png" width="70" style="border-radius:50%;">
								<span class="enterprise_cont">
									<div class="enterprise_name">${companyInfo.company}</div>
									<div>招聘成功职位：<font class="redFont font14">${companyInfo.total_count}</font>个</div>
								</span>
							</div>
						</c:forEach>
					</div>
				</div>	
			</div>	
		</div>
	</div>
	<iframe src="" style="display: none;" id="hclogin" name="hclogin">
	
	</iframe>
	<%@ include file="../../common/footer.jsp"%>
</div>
<script src="${ctx}/static/plugins/underscore/underscore-min.js"></script>
<script src="${ctx}/static/plugins/backbone/backbone-min.js"></script>
<script src="${ctx}/static/plugins/knockout/knockout.min.js"></script>
<script src="${ctx}/static/plugins/knockback/knockback.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/recruitment/hcdyMain.js"></script>
<script type="text/javascript" src="${ctx}/static/js/recruitment/hcdyIndustry.js"></script>
<script>
 $(function(){
	$('.tabItem').children().eq(0).css({'display':'none'});
	$('.tabItem').children().eq(1).css({'display':'block'});
    $(".tabName ul li").each(function(){//页面头部模块切换控制
		var index=$(this).index();
		$(".tabName ul li").eq(1).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		})
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(8).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		})
    });
	$(".header_WeChat").click(function(){		
    	var div = $(".WeChatQRcode"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
		}else{ 
	  		div.slideUp("fast"); 
		} 
    });
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();

			if(index==0){
				$("#page_index").val("1");
				$(".personal_listBar").empty();
				getResume(1, 4);
			}else if(index==1){
				$("#page_index").val("1");
				$(".agent_listBar").empty();
				getHeadHunt(1, 5);
			}else if(index==2){
				$("#page_index").val("1");
				$(".mylist").empty();
				$("#all").click();
			}
			
		});
    });
 });
</script>
<script type="text/javascript">
	var host = '${ctx}';
	$(function(){
		$("#resumeMore").click(function(){
			var page_index = $("#page_index").val();
			getResume(page_index, 4);
		});
		
		$("#headHuntMore").click(function(){
			var page_index = $("#page_index").val();
			getHeadHunt(page_index, 5);
		});
		init();
		
		var pageType = '${pageType}';
		$(".titleName ul li").eq(pageType).addClass("titleClick");
		$(".titleName ul li").eq(pageType).click();
	});
</script>
</body>
</html>
