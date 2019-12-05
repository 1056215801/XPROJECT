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
<title>袁州医药园智慧园区大数据平台</title>
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
/* .index{
  height: -webkit-calc(100% - 96px);
  height: calc(100% - 96px);  width:  100%;
  position: relative;
  background: url(${ctx}/static/image/cityDataCenter/yzyy/index1.png) no-repeat center;
  background-size: 100% 100%;
} */
.gray-bg {
    background: url(${ctx}/static/image/cityDataCenter/yzyy/bg1.png) no-repeat center;
    background-size: 100% 100%;
}
</style>
<body class="gray-bg">
 	<%@ include file="header.jsp"%>
 	<input type="hidden" id="companyId" name="companyId" value="${empty companyId?'90020180314182240800039000001686':companyId}">
    <div class="content fz0">
    	<div class="spanStyle" style="width: 25%;">
    		<div class="blockStyle" style="height: 55%;">
    			<div class="tabHeadlineBar">
					<span class="tabHeadline"><i></i><span>园区概况</span></span>
					<img src="${ctx}/static/image/cityDataCenter/yzyy/decorate.png">
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
									<span class="tabCaption">级别</span>
								</div>
								<div class="tabContBar">
									<i></i>
									<span class="tabDataName" id="span0">园区</span>
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
								<div class="tabContBar" >
									<i></i>
									 <span class="tabDataName contBar" id="contBar1">
										<span class="tabDataValue" style="font-size:30px;" id="span1"></span>
										<span class="tabDataUnit" style="top: 5px;">平方公里</span>
									 </span>
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
									<span class="tabCaption">企业数量</span>
								</div>
							   <div class="tabContBar" >
									<i></i>
									 <span class="tabDataName contBar" id="contBar2">
										<span class="tabDataValue" style="font-size:30px;" id="span2"></span>
										<span class="tabDataUnit" style="top: 5px;">家</span>
									 </span>
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
									<span class="tabCaption">从业人员</span>
								</div>
							   <div class="tabContBar" >
									<i></i>
									 <span class="tabDataName contBar" id="contBar3">
										<span class="tabDataValue" style="font-size:30px;" id="span3"></span>
										<span class="tabDataUnit" style="top: 5px;">人</span>
									 </span>
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
									<span class="tabCaption">工业总产值</span>
								</div>
								<div class="tabContBar" >
									<i></i>
									 <span class="tabDataName contBar" id="contBar4">
										<span class="tabDataValue" style="font-size:30px;" id="span4"></span>
										<span class="tabDataUnit" style="top: 5px;">亿元</span>
									 </span>
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
									<span class="tabCaption">主营业务收入</span>
								</div>
								<div class="tabContBar" >
									<i></i>
									 <span class="tabDataName contBar" id="contBar5">
										<span class="tabDataValue" style="font-size:30px;" id="span5"></span>
										<span class="tabDataUnit" style="top: 5px;">亿元</span>
									 </span>
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
									<span class="tabCaption">利润总额</span>
								</div>
								<div class="tabContBar" >
									<i></i>
									 <span class="tabDataName contBar" id="contBar6">
										<span class="tabDataValue" style="font-size:30px;" id="span6"></span>
										<span class="tabDataUnit" style="top: 5px;">亿元</span>
									 </span>
								</div>
							</div>
						</div>
					</div>
				</div>
    		</div>
    		<div class="blockStyle" style="height: calc(45% - 10px);">
    			<div class="tabHeadlineBar">
					<span class="tabHeadline"><i></i><span>投资产业分布</span></span>
					<img src="${ctx}/static/image/cityDataCenter/yzyy/decorate.png">
				</div>
				<div class="tabContBar">
					<div class="outsideBox">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
						<div id="indexMap1" class="mapContent">
						</div>
					</div>
				</div>
    		</div>
    	</div>
    	<div class="spanStyle" style="width: calc(50% - 10px);">
    	    <div class="blockStyle" style="height: 80%; overflow: hidden;">
    	    	<img class="bg-table" src="${ctx}/static/image/cityDataCenter/yzyy/table.png">
    	    	<div class="zhui-box">
    	    		<div class="zhui">
    	    			<img src="${ctx}/static/image/cityDataCenter/yzyy/sanjiao.png">
    	    			<img src="${ctx}/static/image/cityDataCenter/yzyy/sanjiao.png">
    	    			<img src="${ctx}/static/image/cityDataCenter/yzyy/sanjiao.png">
    	    			<img src="${ctx}/static/image/cityDataCenter/yzyy/sanjiao.png">
    	    			<img src="${ctx}/static/image/cityDataCenter/yzyy/shadow.png">
    	    		</div>
	    	    	<div class="zi">
	    	    		<div class="left-zi"><p>医药产业</p><img src="${ctx}/static/image/cityDataCenter/yzyy/lines1.png"></div>
	    	    		<div class="left-zi"><p>服装针织产业</p><img src="${ctx}/static/image/cityDataCenter/yzyy/lines1.png"></div>
	    	    		<div class="left-zi"><p>化工产业</p><img src="${ctx}/static/image/cityDataCenter/yzyy/lines1.png"></div>
	    	    		<div class="right-zi"><p>机电产业</p><img src="${ctx}/static/image/cityDataCenter/yzyy/lines2.png"></div>
	    	    		<div class="right-zi"><p>建材产业</p><img src="${ctx}/static/image/cityDataCenter/yzyy/lines2.png"></div>
	    	    		<div class="right-zi"><p>食品产业</p><img src="${ctx}/static/image/cityDataCenter/yzyy/lines2.png"></div>
	    	    	</div>
    	    	</div>
    	    </div>
   	      	<div class="blockStyle" style="height: calc(20% - 10px);">
   	         	<div class="tabHeadlineBar">
					<span class="tabHeadline"><i></i><span>企业统计</span><span class="tabDataUnit" style="top:2px;">（单位：家）</span></span>
					<img src="${ctx}/static/image/cityDataCenter/yzyy/decorate.png">
				</div>
				<div class="tabContBar">
					<div class="outsideBox">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
						<div id="indexMap2" class="qytj">
						   	<div class="qytj-item">
								<img src="${ctx}/static/image/cityDataCenter/ycNew2/electric-bg1.png">
								<div class="qytj-infor">
									<h1 class="yellowT" id="t1"></h1>
									<p>医药企业</p>
								</div>
							</div>
								<div class="qytj-item">
								<img src="${ctx}/static/image/cityDataCenter/ycNew2/electric-bg2.png">
								<div class="qytj-infor">
									<h1 class="yellowT" id="t2"></h1>
									<p>非工企业</p>
								</div>
							</div>
								<div class="qytj-item">
								<img src="${ctx}/static/image/cityDataCenter/ycNew2/electric-bg2.png">
								<div class="qytj-infor">
									<h1 class="yellowT" id="t3"></h1>
									<p>规上企业</p>
								</div>
							</div>
								<div class="qytj-item">
								<img src="${ctx}/static/image/cityDataCenter/ycNew2/electric-bg2.png">
								<div class="qytj-infor">
									<h1 class="yellowT" id="t4"></h1>
									<p>上市企业</p>
								</div>
							</div>
								<div class="qytj-item">
								<img src="${ctx}/static/image/cityDataCenter/ycNew2/electric-bg2.png">
								<div class="qytj-infor">
									<h1 class="yellowT" id="t5"></h1>
									<p>两化融合企业</p>
								</div>
							</div>
						</div>
					</div>
	    	     </div>
    	     </div>
    	</div>
    	<div class="spanStyle" style="width: calc(25% - 10px);">
    		<div class="blockStyle" style="height: 55%;">
    			<div class="tabHeadlineBar">
					<span class="tabHeadline"><i></i><span>企业概况</span></span>
					<img src="${ctx}/static/image/cityDataCenter/yzyy/decorate.png">
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
								<div class="tabContBar" style="cursor: pointer;" onclick="choiceCompany()">
									<i></i>
									<span class="tabDataName" id="span7"></span>
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
									<span class="tabCaption">所属产业</span>
								</div>
								<div class="tabContBar" id="contBar8">
									<i></i>
									<span class="tabDataName" id="span8" style="margin-left:-5px;"></span>
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
									<span class="tabCaption">主营业务收入</span>
								</div>
								 <div class="tabContBar" >
									<i></i>
									 <span class="tabDataName contBar" id="contBar9">
										<span class="tabDataValue" style="font-size:30px;" id="span9"></span>
										<span class="tabDataUnit" style="top: 5px;">万元</span>
									 </span>
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
									<span class="tabCaption">上缴税金</span>
								</div>
							    <div class="tabContBar" >
									<i></i>
									 <span class="tabDataName contBar" id="contBar10">
										<span class="tabDataValue" style="font-size:30px;" id="span10"></span>
										<span class="tabDataUnit" style="top: 5px;">万元</span>
									 </span>
								</div>
							</div>
						</div>
					</div>
				</div>
    		</div>
    		<div class="blockStyle" style="height: calc(45% - 10px);">
    			<div class="tabHeadlineBar">
					<span class="tabHeadline"><i></i><span>企业分布</span></span>
					<img src="${ctx}/static/image/cityDataCenter/yzyy/decorate.png">
				</div>
				<div class="tabContBar">
					<div class="outsideBox">
						<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
						<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
						<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
						<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
						<div id="indexMap3" class="mapContent">
						</div>
					</div>
				</div>
    		</div>
    	</div>
   </div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts-gl.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/yzyyData.js"></script>
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
	
	$(".head .tab>a:eq(0)").addClass("on");
	loadData(0,'');
})
function loadData(type,companyId){
 	var url = "${OfficeUrl}XOffice/interface/json/yuanZhouPharma/homePage";
	$.ajax({
  		url : url,
		type : "post", 
		data : {
			"companyId":$('#companyId').val()
		},
		dataType : "json",
		success : function(result) {
			console.log(result)
			if(result.success){
				var parkInfo = result.parkInfo;
				if(parkInfo==null || parkInfo==undefined){
					$('#contBar4').html('未公布');
				}else{
					$('#span0').text('省级');
// 					if(parkInfo.parkKind==0){
// 						$('#span0').text('一般省级');
// 					}else if(parkInfo.parkKind==1){
// 						$('#span0').text('国家级');
// 					}else if(parkInfo.parkKind==2){
// 						$('#span0').text('重点省级');
// 					}else if(parkInfo.parkKind==9){
// 						$('#span0').text('筹备中');
// 					}else{
// 						$('#contBar0').html('未公布');
// 					}

					if(parkInfo.landSquare){
						$('#span1').text(parkInfo.landSquare);
					}else{
						$('#contBar1').html('未公布');
					}
					$('#span2').text(parkInfo.compNum);
					$('#span3').text(parkInfo.cyryNum);
					if(parkInfo.gyzczValue){
						$('#span4').text(parkInfo.gyzczValue);
					}else{
						$('#contBar4').html('未公布');
					}
					$('#span5').text(parkInfo.zyywsrValue);
					$('#span6').text(parkInfo.lrValue);
				}
				
				if(result.companyInfo){
					var companyInfo = result.companyInfo;
				    if(companyInfo.organizationName){
						$('#span7').text(companyInfo.organizationName);
				    }else{
						$('#span7').html('未公布');
				    }
				    if(companyInfo.typeName){
						$('#span8').text(companyInfo.typeName);
				    }else{
						$('#contBar8').html('未公布');
				    }
				    if(companyInfo.zyywsrValue){
						$('#span9').text(companyInfo.zyywsrValue);
					}else{
						$('#contBar9').html('未公布');
					}
				    if(companyInfo.sjValue){
						$('#span10').text(companyInfo.sjValue);
					}else{
						$('#contBar10').html('未公布');
					}
				}else{
					$('#span7').html('未公布');
					$('#contBar8').html('未公布');
					$('#contBar9').html('未公布');
					$('#contBar10').html('未公布');
				}
				var d1 = [];
				var d2 = [];
				//此处先用假数据，后续改为接口数据
// 				for(var i=0;i<result.industrylist.length;i++){
// 					 var temp = result.industrylist[i];
// 					 var industry = {};
// 					 industry.name = temp.TITLE;
// 					 industry.value = (temp.COUNTS/10000).toFixed(2);
// 					 d1.push(industry);
// 				}
				
				var tmpD1 = ["投产项目","停产、半停产项目","在建项目","停建项目","待建项目","拟退出项目"];
				var tmpD2 = [161.2,16.7,94.1,19.4,29.5,16.5];
				for(var i=0;i<tmpD1.length;i++){
					 var t1 = tmpD1[i];
					 var industry = {};
					 industry.name = tmpD1[i];
					 industry.value = tmpD2[i];
					 d1.push(industry);
				}
				
				
				for(var i=0;i<result.companyNumlist.length;i++){
					 var temp = result.companyNumlist[i];
					 var company = {};
					 company.name = temp.typeName;
					 company.value = temp.compNum;
					 d2.push(company);
				}
				rankPie(d2,result.compNum,'家','indexMap3','企业总数（家）');
				
				//此处先用假数据，后续改为接口数据
				rankPie(d1,337.4,'亿元','indexMap1','总投资（亿元）');
// 				rankPie(d1,(result.ztzSum/10000).toFixed(1),'亿元','indexMap1','总投资（亿元）');
				
				var companyCount = result.companyCount;
				$('#t1').text(companyCount.isMedicine);
				$('#t2').text(companyCount.isNonIndustry);
				$('#t3').text(companyCount.isStandard);
				$('#t4').text(companyCount.isQuoted);
				$('#t5').text(companyCount.isTwoIntegration);
			}else{
				alert(result.errorMsg);
			}
		},
		error : function() {
		},
	});
}
function choiceCompany(){
	layer.open({
		type: 2,
		title: false,
		shadeClose: true,
		shade: 0.3,
		area: ['900px', '675px'],
		content: '${ctx}/front/page/companyInfo/frame?parkId=32914188&treeType=park&index=1' //iframe的url
	}); 
};
</script>
</html>
