<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>开发区动态</title>
<link href="${ctx}/static/weixin/css/experienceSharing/experienceSharing.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/navigationBar.css" rel="stylesheet" />

<script src="${ctx}/static/weixin/js/modernizr-custom-v2.7.1.js"></script>
<script src="${ctx}/static/weixin/js/jquery-finger-v0.1.0.js"></script>
<link href="${ctx}/static/weixin/css/flickerplate.css" rel="stylesheet">
<script src="${ctx}/static/weixin/js/flickerplate.js"></script>
<script>
	$(function() {
		/* 显示下拉列表 */
		$(".search").click(function() {
			hideAllDropdown();
			if ($("#dropdown").css("display") == "none") {
				$("#dropdown").slideDown("fast");
				$(".search").addClass("colorDeep");
				$(".hidebg").show();
			}
		});
		
		$(".viewMore").click(function() {
			var ul = $("#viewMore ul");
			if (ul.css("display") == "none") {
				ul.slideDown("fast");
			} else {
				ul.slideUp("fast");
			}
		});
		$("#viewMore ul li a").click(function() {
			$("#viewMore ul").hide();
		});
		
		$('.flicker-example').flicker();
		
		getList(1,"","");
		
		/* 按类型搜索数据 */
		$(".optionBtn").each(function(index,item){
			 $(item).click(function(){
				 $(".optionBtn").each(function(index,item){
					 $(item).removeClass("selected");
				 });
				 $(item).addClass("selected");
				 var str =  $(item).text();
				 if(str == '全部'){
					 type="";
					 page=1;
				 }else{
					 type = str;
					 page=1;
				 }
				 getList(page,key,type);
				 hideAllDropdown();
			 });
		 });
		
		if(${!empty message}){
			layer.msg("${message}")
		}
	})
	
	/* 收起下拉列表 */
	function hideAllDropdown() {
		$(".hidebg").hide();
		$(".search").removeClass("colorDeep");
		$("#dropdown").slideUp("fast");
	}
	
	/* 异步获取经验列表 */
	page = 1;
	key = "";
	type = "";
	function ityzl_SHOW_LOAD_LAYER(){  
        return layer.msg('努力中...', {icon: 16,shade: [0.5, '#f5f5f5'],scrollbar: false,time:100000}) ;  
    } 
	function getList(pageNum,searchKey,type) {
		$.ajax({
					url : "${ctx}/expShare/json/list",
					type : "get",
					data : {
						"type" : 0,
						"pageNum": pageNum,
						"pageSize": 5,
						"expLabel":type,
						"expTitle":searchKey,
						"status":1
					},
					dataType : "json",
					beforeSend:function(){
						index = ityzl_SHOW_LOAD_LAYER(); 
				    },
					success : function(result) {
						layer.close(index);
						if (pageNum == 1) {
							$("#shareList").empty();
						}
						if (result.code == -1 || result.code == 2) {
							$("#proList").show();
						} else {
							$("#proList").hide();
							var list = result.value;
							
							for (var i = 0; i < list.length; i++) {
								var info = list[i];
								var expUnit = info.expUnit;
								if(expUnit.length>=11){
									expUnit = expUnit.substring(0,10)+'...';
								}
								var _div = "";
								_div += "	<a href=\'${ctx}/experienceSharing_fgw/weixin/detail/";
								_div += info.expId;
								_div += "	\'>";
								_div += "	<div class=\'shareCont\'>";
								_div += "    <div class=\'shareContTop clearfix\'>";
								_div += "      <img src=\'";
								_div += info.expImage==null?"${ctx}/static/weixin/images/experienceSharing/banner_1.jpg":info.expImage;
								_div += "\' width=\'110\' height=\'69\' class=\'shareContTopLeft\'>";
								_div += "      <div class=\'shareContTopRight\'>";
								_div += "        <div class=\'shareContTitle\'>";
								_div += info.expTitle==null?"&nbsp;":info.expTitle;
								_div += "		 </div>";
								_div += "        <div class=\'shareContPosition\'>";
								_div += "          <div>";
								_div += "            <img src=\'${ctx}/static/weixin/images/experienceSharing/enterCount.png\' width=\'12\' height=\'12\'>";
								_div += "            <span>";
								_div += info.expUnit==null?"&nbsp;":expUnit;
								_div += "			 </span></div>";
								_div += "          <div>";
								_div += "            <img src=\'${ctx}/static/weixin/images/experienceSharing/location.png\' width=\'12\' height=\'12\' style=\'position:relative;top:1px;\'>";
								_div += "            <span>";
								_div += info.provinceName==null?"&nbsp;":info.provinceName;
								_div += "&nbsp;";
								_div += info.areaName==null?"&nbsp;":info.areaName;
								_div += "			 </span></div>";
								_div += "        </div>";
								_div += "      </div>";
								_div += "    </div>";
								_div += "    <div class=\'shareContBottom clearfix\'>";
								_div += "      <div style=\'float: left;\'>";
								_div += "        <img src=\'${ctx}/static/weixin/images/experienceSharing/eye.png\' width=\'12\' height=\'12\'>";
								_div += "        <span>";
								_div += info.browseCountEdit==null?"0":info.browseCountEdit;
								_div += "		 浏览</span></div>";
								_div += "      <div style=\'float: right; width: 72px; text-align:right;\'>";
								_div += "        <img src=\'${ctx}/static/weixin/images/experienceSharing/talk.png\' width=\'12\' height=\'12\'>";
								_div += "        <span>";
								_div += info.commentCount==null?"0":info.commentCount;
								_div += "		 评论</span></div>";
								_div += "    </div>";
								if(info.isTop==1){
									_div += "    <img src=\'${ctx}/static/weixin/images/experienceSharing/recommend.png\' width=\'45\' height=\'45\' class=\'recommendItem\'>";
								}
								_div += "	</div></a>";
								$("#shareList").append(_div);
							}
						}
						if (result.code == 1) {
							//加载更多
							$("#getMore").show();
						}else{
							$("#getMore").hide();
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						layer.msg("网络异常");
					}
				});
	}
	
	/* 加载更多 */
	function getMore(){
		page++;
		getList(page,key,type);
	}
	
	

	/* 按名称搜索数据 */
	function searchResult(str){
		key = str;
		page = 1;
		getList(page,key,type);
	}
</script>
</head>
<body>
	<!-- 下拉列表半透明背景 -->
	<div class="hidebg"></div>

	<div class="share_main">
		<div class="share_content">
			<div class="searchBar clearfix">
				<div class="search">
					<img src="${ctx}/static/weixin/images/experienceSharing/sort.png" width="28" height="28" style="margin: 10px 12px;" />
				</div>
				<input type="search" class="searchInput" onSearch="searchResult(this.value);" placeholder="关键字"/>
				<div class="message">
					<img src="${ctx}/static/weixin/images/experienceSharing/message.png" width="28" height="28" style="margin: 10px 12px;" />
				</div>
			</div>
			<div id="dropdown">
				<div class="dropdownContent">
					<div class="optionBtn selected">全部</div>
					<c:forEach items="${labelList}" var="item">
				    	<div class="optionBtn">${item.tagName}</div>
					</c:forEach>
				</div>
			</div>

			<div style="margin-top: 50px;"></div>
			<div class="flicker-example" data-block-text="false" style="height: 120px; margin-bottom: 10px;">
				<ul>
					<%-- <li onclick="location.href='http://www.jx968969.com/XProject/expShare/view/90020170816164121000092000000003?type=0'" style="background-image: url(${ctx}/static/weixin/images/experienceSharing/online_m.jpg); background-size: 100% 120px;"></li>
				    <li onclick="location.href='${ctx}/expShare/view/90020170725163030000092000000024?type=0'"   style="background-image: url(${ctx}/static/weixin/images/experienceSharing/bigdata_mobile.jpg); background-size: 100% 120px;"></li>
					<li onclick="location.href='http://c.eqxiu.com/s/Mcjox1yo'" style="background-image: url(${ctx}/static/weixin/images/experienceSharing/business_m.jpg); background-size: 100% 120px;"></li>
					<li onclick="location.href='http://q.eqxiu.com/s/1bT83ApS'" style="background-image: url(${ctx}/static/weixin/images/experienceSharing/helping_01.jpg); background-size: 100% 120px;"></li> --%>
					<li onclick="location.href='javascript:void(0);'" style="background-image: url(${ctx}/static/weixin/images/experienceSharing/settleds67_mobile.jpg); background-size: 100% 120px;"></li>
				    <li onclick="location.href='http://www.jx968969.com/XWeixin/static/weixinHtml/map/industryMap.html'"   style="background-image: url(${ctx}/static/weixin/images/experienceSharing/smartIndustry_mobile.jpg); background-size: 100% 120px;"></li>
					<li onclick="location.href='javascript:void(0);'" style="background-image: url(${ctx}/static/weixin/images/experienceSharing/greenParK_mobile.jpg); background-size: 100% 120px;"></li>
				</ul>
			</div>

			<div id="shareList">
			
			</div>
			<div style="text-align: center;">
				<span id="proList" class="renovateTitle"></span>
			</div>
			
			
			<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
		
	</div>
		<div id="tbox" onclick="location.href='#top';"></div>
		<div class="navigationBar">
			<ul>
				<li><a href="${ctx}/auth/page/mobile/weixin/experienceSharing_fgw/weixin/main">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/experienceSharing/exp_red.png" width="20" height="20" style="margin-top: 6%;"/>
					</div>
					<div class="navTitle">开发区动态</div>
				</a></li>
				<li><a href="${ctx}/experienceSharing_fgw/weixin/add">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/experienceSharing/share.png" width="20" height="20" style="margin-top: 6%;"/>
					</div>
					<div class="navTitle">分享动态</div>
				</a></li>
				<li><a href="javascript:;" class="viewMore">
					<div class="navImage">
						<img src="${ctx}/static/weixin/images/experienceSharing/more.png" width="20" height="20" style="margin-top: 6%;"/>
					</div>
					<div class="navTitle">更多服务</div>
				</a></li>
			</ul>
			<div id="viewMore">
				<ul style="margin-top: -43px;">
					<li style="border-bottom: 1px solid #E6E6E6;"><a href="${ctx}/experienceSharing_fgw/weixin/myShare">我发布的</a></li>
					<!-- <li><a href="http://www.jx968969.com/XWeixin/static/weixinHtml/personCenter/main.html">个人中心</a></li>
				 -->
				</ul>
			</div>
		</div>
	</div>
</body>
</html>