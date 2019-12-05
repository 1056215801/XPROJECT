<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/cityDataCenter/gxwHomePage.css"/>
<title>南昌国家高新技术产业开发区大数据</title>
</head>
<style>
html,body {
  height: 100%;
  width:  100%;
  margin: 0;
  font-size: 0;
}
.layui-layer-btn .layui-layer-btn0{
   font-size: 14px;
}
.gray-bg {
    background: url(${ctx}/static/image/cityDataCenter/gx/bg1.png) no-repeat center;
    background-size: 100% 100%;
}
</style>
<body class="gray-bg">
	<form action="" method="post" id="form">
		<input type="hidden" id="orgId" name="orgId" value="360000">
		<input type="hidden" id="region" name="region" value="江西省">
		<input type="hidden" id="companyId" name="companyId" value="${companyId}">
	</form>
 	<%@ include file="header.jsp"%>
    <div class="content fz0">
    	<div class="spanStyle" style="width: 25%;">
    		<div class="blockStyle" style="height: 55%;">
    			<div class="tabHeadlineBar">
					<span class="tabHeadline"><i></i><span>南昌高新区统计信息</span></span>
					<img src="${ctx}/static/image/cityDataCenter/gx/decorate.png">
				</div>
				<div class="tabContBar">
					<div class="blockStyle" style="height: 25%;">
						<div class="spanStyle">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">开发区名称</span>
								</div>
								<div class="tabContBar">
									<i></i>
									<span class="tabDataName">南昌国家高新技术产业开发区</span>
								</div>
							</div>
						</div>
					</div>
					<div class="blockStyle" style="height: calc(25% - 5px);">
						<div class="spanStyle" style="width: 50%;">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">规划面积</span>
								</div>
								<div class="tabContBar">
									<i></i>
									<span class="tabDataValue">70</span>
									<span class="tabDataUnit">平方公里</span>
								</div>
							</div>
						</div>
						<div class="spanStyle" style="width: calc(50% - 5px);">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">企业总数</span>
								</div>
								<div class="tabContBar">
									<i></i>
									<span class="tabDataValue">6000</span>
									<span class="tabDataUnit">家</span>
								</div>
							</div>
						</div>
					</div>
					<div class="blockStyle" style="height: calc(25% - 5px);">
						<div class="spanStyle" style="width: 50%;">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">固定资产投资</span>
								</div>
								<div class="tabContBar">
									<i></i>
									<span class="tabDataValue">12.5%</span>
								</div>
							</div>
						</div>
						<div class="spanStyle" style="width: calc(50% - 5px);">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">规模工业增加值</span>
								</div>
								<div class="tabContBar">
									<i></i>
									<span class="tabDataValue">10.1%</span>
								</div>
							</div>
						</div>
					</div>
					<div class="blockStyle" style="height: calc(25% - 5px);">
						<div class="spanStyle" style="width: 50%;">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">财政总收入</span>
								</div>
								<div class="tabContBar">
									<i></i>
									<span class="tabDataValue">1029912</span>
									<span class="tabDataUnit">万元</span>
								</div>
							</div>
						</div>
						<div class="spanStyle" style="width: calc(50% - 5px);">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">规模以上主营业务收入</span>
								</div>
								<div class="tabContBar">
									<i></i>
									<span class="tabDataValue">1419.48</span>
									<span class="tabDataUnit">亿元</span>
								</div>
							</div>
						</div>
					</div>
				</div>
    		</div>
    		<div class="blockStyle" style="height: calc(45% - 10px);">
    			<div class="tabHeadlineBar">
					<span class="tabHeadline"><i></i><span>产城融合</span></span>
					<img src="${ctx}/static/image/cityDataCenter/gx/decorate.png">
				</div>
				<div class="tabContBar">
					<div class="outsideBox">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
						<img src="${ctx}/static/image/cityDataCenter/gx/ccrh.png" width="100%" height="100%" style="padding: 10px;">
					</div>
				</div>
    		</div>
    	</div>
    	<div class="spanStyle" style="width: calc(50% - 10px);"></div>
    	<div class="spanStyle" style="width: calc(25% - 10px);">
    		<div class="blockStyle" style="height: 55%;">
    			<div class="tabHeadlineBar">
					<span class="tabHeadline"><i></i><span>规上企业</span></span>
					<img src="${ctx}/static/image/cityDataCenter/gx/decorate.png">
				</div>
				<div class="tabContBar">
					<div class="blockStyle" style="height: 25%;">
						<div class="spanStyle">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">企业名称</span>
								</div>
								<div class="tabContBar cp" onclick="choiceCompany()">
									<i></i>
									<span class="tabDataName" id="companyName"></span>
									<span class="eject_caret"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="blockStyle" style="height: calc(25% - 5px);">
						<div class="spanStyle">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">所属行业</span>
								</div>
								<div class="tabContBar">
									<i></i>
									<span class="tabDataName" id="industryTypeParkName"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="blockStyle" style="height: calc(25% - 5px);">
						<div class="spanStyle">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">企业性质</span>
								</div>
								<div class="tabContBar">
									<i></i>
									<span class="tabDataName" id="issueStateName"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="blockStyle" style="height: calc(25% - 5px);">
						<div class="spanStyle">
							<div class="outsideBox">
								<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
								<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
								<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
								<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
								<div class="tabCaptionBar">
									<span class="tabCaption">经营范围</span>
								</div>
								<div class="tabContBar">
									<i></i>
									<span class="tabDataNameSm" id="operationScope"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
    		</div>
    		<div class="blockStyle" style="height: calc(45% - 10px);">
    			<div class="tabHeadlineBar">
					<span class="tabHeadline"><i></i><span>产业集群</span></span>
					<img src="${ctx}/static/image/cityDataCenter/gx/decorate.png">
				</div>
				<div class="tabContBar">
					<div class="outsideBox">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
						<div class="productBar">
							<div class="bubbleBar blueBu">
								<i></i>
								<span class="bubbleCont">
									<img src="${ctx}/static/image/cityDataCenter/gx/dsj.png">
									<div class="bubbleName">大数据<br>及新一代信息技术</div>
								</span>
							</div>
							<div class="bubbleBar yellowBu">
								<i></i>
								<span class="bubbleCont">
									<img src="${ctx}/static/image/cityDataCenter/gx/dzxx.png">
									<div class="bubbleName">电子信息</div>
								</span>
							</div>
							<div class="bubbleBar redBu">
								<i></i>
								<span class="bubbleCont">
									<img src="${ctx}/static/image/cityDataCenter/gx/xcl.png">
									<div class="bubbleName">新材料</div>
								</span>
							</div>
							<div class="bubbleBar greenBu">
								<i></i>
								<span class="bubbleCont">
									<img src="${ctx}/static/image/cityDataCenter/gx/znzb.png">
									<div class="bubbleName">智能装备<br>及新能源新产业</div>
								</span>
							</div>
							<div class="bubbleBar purpleBu">
								<i></i>
								<span class="bubbleCont">
									<img src="${ctx}/static/image/cityDataCenter/gx/swyy.png">
									<div class="bubbleName">生物医药</div>
								</span>
							</div>
							<div class="bubbleBar lilacColourBu">
								<i></i>
								<span class="bubbleCont">
									<img src="${ctx}/static/image/cityDataCenter/gx/hk.png">
									<div class="bubbleName">航空</div>
								</span>
							</div>
							<div class="product" id="products"></div>
						</div>
					</div>
				</div>
    		</div>
    	</div>
   </div>
</body>
<script src="${ctx}/static/js/dataCenter/ycAnimate.js"></script>
<script type="text/javascript">
$(function(){
	//分辨率过低提示
	if(width<1440&&(sessionStorage.isgood==0 ||sessionStorage.isgood == null||sessionStorage.isgood==undefined)){
		   layer.confirm('您的电脑分辨率过低，为了保证最优的展现效果建议您更换为1920x1080（或1600x900、1440X900）分辨率。'+'\n'+'<a target="blank" href="https://jingyan.baidu.com/article/3ea5148904ad9c52e61bbac2.html">如何设置分辨率?</a>', {
         btn: ['确定','取消'], title:"提示" , btn1:function(index){
      	   sessionStorage.isgood = 1 ;
      	   layer.close(index);
         }, btn2: function (index) {
      	   sessionStorage.isgood = 0 ;
      	   layer.close(index);
         },cancel: function(){ 
      	   sessionStorage.isgood = 0 ;
         }
       });
	}
	
 	var tabIndex = '${tabIndex}';
	$(".head .tab>a:eq(0)").addClass("on");
	
	if($('#companyId').val() == "" || $('#companyId').val() == undefined){
		$('#companyId').val("201411131526138080227")
	}
	
	getCompanyData2();
	
	var bubble = '';
	for(var a=0;a<10;a++){
		bubble += '<a class="color1" href="#" style="width: 45px; height: 45px;">';
		bubble += '</a>';
	}
	for(var b=0;b<10;b++){
		bubble += '<a class="color2" href="#" style="width: 35px; height: 35px;">';
		bubble += '</a>';
	}
	for(var c=0;c<10;c++){
		bubble += '<a class="color3" href="#" style="width: 40px; height: 40px;">';
		bubble += '</a>';
	}
	for(var d=0;d<10;d++){
		bubble += '<a class="color4" href="#" style="width: 25px; height: 25px;">';
		bubble += '</a>';
	}
	$("#products").html(bubble);
	animat();
})
function choiceCompany(){
	layer.open({
		type: 2,
		title: false,
		shadeClose: true,
		shade: 0.3,
		area: ['900px', '675px'],
		content: '${ctx}/front/page/companyInfo/frame?parkId=1058&treeType=park&index=1' //iframe的url
	}); 
};
function getCompanyData2(){
	$.ajax({
		url : "${OfficeUrl}XOffice/interface/json/companyInfo/companyPortrait",
		type : "post",
		data : {
			"companyId" : $('#companyId').val()
		},
		success : function(result) {
			console.log($('#companyId').val())
			console.log(result)
			if (result.success) {
				//企业信息数据
				if(result.companyInfo.companyName != "" &&  result.companyInfo.companyName != undefined){
					$("#companyName").text(result.companyInfo.companyName);
				}
				if(result.companyInfo.industryTypeParkName != "" &&  result.companyInfo.industryTypeParkName != undefined){
					$("#industryTypeParkName").text(result.companyInfo.industryTypeParkName);
				}else {
					$("#industryTypeParkName").text("暂未录入");
				}
				if(result.companyInfo.issueStateName != "" &&  result.companyInfo.issueStateName != undefined){
					$("#issueStateName").text(result.companyInfo.issueStateName);
				}else {
					$("#issueStateName").text("暂未录入");
				}
				if(result.companyInfo.operationScope != "" &&  result.companyInfo.operationScope != undefined){
					$("#operationScope").text(result.companyInfo.operationScope);
					$("#operationScope").attr("title",result.companyInfo.operationScope);
				}else {
					$("#operationScope").text("暂未录入");
				}
			}
		},
		error : function() {
			layer.msg("数据获取异常！");
		}
	})
}
</script>
</html>
