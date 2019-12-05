<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../common/commonPage_front.jsp"%>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>园区经济指标</title>
<link href="${ctx}/static/css/parkDataCenter/yy_bigDataCenter.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/plugins/iCheck/custom.css"/>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/iCheck/icheck.min.js" ></script>
<style type="text/css">
.icheckbox_square-green, .iradio_square-green {
	background: url(${ctx}/static/img/green_0.png) no-repeat;
}
.local-date {
    padding: 0 10px;
    display: inline-block;
    vertical-align: middle;
    border-left: 1px solid;
    font-size: 14px;
    color: #75d5ff;
    line-height: 1;
    font-family: "黑体";
}
.local-date h1 {
    font-size: 24px;
}
.local-date p {
    line-height: 1.5;
}
.btn_set {
	padding: 5px;
	display: block;
	height: 25px;
	width: auto;
	border: 1px solid #BAEDFF;
	border-radius: 5px;
	float: left;
	margin-top: 12px;
	line-height: 17px;
	background-color: #3773B2;
	cursor: pointer;
	margin-left: 10px;
}

.btn_set:hover {
	border: 1px solid #6DCCF6;
	background-color: #6DCCF6;
}

.btn_confirm {
	padding: 5px;
	display: block;
	height: 25px;
	width: auto;
	border: 1px solid #BAEDFF;
	border-radius: 5px;
	float: right;
	margin-top: 12px;
	line-height: 17px;
	background-color: #3773B2;
	cursor: pointer;
}

.btn_confirm:hover {
	border: 1px solid #6DCCF6;
	background-color: #6DCCF6;
}
.data_header {
    height: 79px;
    text-align: center;
    padding-bottom: 18.5px;
    padding-top: 18.5px;
}
</style>
<script>
	/* function fnDate(){
		 var oDiv=document.getElementById("dateBar");
		 var date=new Date();
		 var year=date.getFullYear();
		 var month=date.getMonth();
		 var data=date.getDate();
		 var hours=date.getHours();
		 var minute=date.getMinutes();
		 var second=date.getSeconds();
		 var time="<span style='font-size:14px;'>"+year+"年"+fnW((month+1))+"月"+fnW(data)+"日</span><br /><span style='font-size:26px;'>"+fnW(hours)+":"+fnW(minute)+":"+fnW(second)+"</span>";
		 oDiv.innerHTML=time;
	} */
	function fnW(str){
		str>9?num=str:num="0"+str;
		return num;
	}
	function setTime(){
		var date = new Date();
		var localDate = date.getFullYear() + "年" + (date.getMonth()+1) + "月" + date.getDate() + "日";
		var localSec = date.getSeconds();
		if(localSec<10) { localSec = "0"+localSec} else{ localSec = date.getSeconds()};
		var localTime = date.getHours() + ":" + date.getMinutes() + ':' + localSec;
		$(".local-date p").text(localDate);
		$(".local-date h1").text(localTime);
	};
	$(function(){
		setTime();
		setInterval(setTime,1000)
		$("#btnYear").click(function(){		
	   		var div = $("#yearMenu"); 
			if(div.css("display")=="none"){ 
		  		div.slideDown("fast"); 
			}else{ 
		  		div.slideUp("fast"); 
			} 
	   });
	})	    
</script>	
</head>
	<body>
		<div class="data_main">
			<form action="" method="post" id="form">
				<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
				<input type="hidden" id="orgId" name="orgId" value="${orgId}"/>
				<input type="hidden" id="year" name="year" value="${year}"/>
				<input type="hidden" id="pkIndexCode" name="pkIndexCode" value="${configInfo.pkIndexCode}"/>
				<input type="hidden" id="pkIndexName" value="${configInfo.pkIndexName}"/>
				<input type="hidden" id="isPkLocalShow" name="isPkLocalShow" value="${configInfo.isPkLocalShow}"/>
			</form>
			<input type="hidden" id="oldYear" value="${year}"/>
			<div class="data_header">
				<!-- <div style=""> -->
					<img src="${configInfo.imageUrl}" height="42px">
				<!-- </div> -->
				<div class="local-date">
					<p>2017年7月20号</p>
					<h1>14:20:50</h1>
				</div>
				<!-- <div style="color: #6DCCF6;border-left: 1px solid #6DCCF6;margin-top: 8px;padding-left: 15px;height: 60px;" id="dateBar" class="dateBar"></div> -->
				<div style="position: absolute;right: 2%;margin-right: 2%;margin-top: 2%;">
					<button id="btnYear" class="dropdownButton" type="button"><span id="yearText">${year}年</span><span class="caret"></span></button>
					<ul id="yearMenu" class="dropdownMenu">
						<c:if test="${year>=2018}">
							<c:forEach varStatus="k" begin="2018" end ="${year}">
								<%-- <li><a href="javascript:;" onclick="selectByYear('${k.index}')">${k.index}年</a></li> --%>
								<li><a href="javascript:;" onclick="selectByYear('${year-k.index+2018}')">${year-k.index+2018}年</a></li>
							</c:forEach>
						</c:if>
					    <li><a href="javascript:;" onclick="selectByYear('2017')">2017年</a></li>
						<li><a href="javascript:;" onclick="selectByYear('2016')">2016年</a></li>
						<li><a href="javascript:;" onclick="selectByYear('2015')">2015年</a></li>
					</ul>
				</div>
			</div>
			<c:choose>
				<c:when test="${typeSize >= 4}">
					<div class="data_content">
						<div style="width: 100%; height: 50px;line-height: 50px;float: left;color:;" id="indexCheckBox">
							<div style="background-color: #AFE7FE;width: 3px;height: 20px;float: left;margin-top: 15px;"></div>
							<span style="float: left; margin-left: 10px; font-size: 22px; color: #AFE7FE;">园区经济指标</span>
							<div id="norm" style="float: left; margin-left: 10px; font-size: 12px; color: #FFFFFF; height: 95%; width: auto; display: none;">
							</div>
							<span id="set_btn" class="btn_set" onclick="setNorm();">
								<img src="${ctx}/static/img/set.png" style="margin-top: -4px;" />&nbsp;指标设置
							</span>
						</div>
						<div style="width: 100%;height: 88%;float: left;">
							<div style="width: 70%;height: 100%;float: left;">
								<div class="clearfix" style="height:22%; margin-bottom:1%;" id="data1"></div>
								
								<div style="height:76%;">
									<div class="dataBar_1">
										<div class="dataBar_1_Left" id="part1" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;" ></div>
										<div class="daraBar_1_Right" id="part2" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;"></div>
										<div style="clear:both;"></div>
									</div>
									<div class="dataBar_1">
										<div class="dataBar_1_Left" id="part3" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;"></div>
										<div class="daraBar_1_Right" id="part4" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;"></div>
										<div style="clear:both;"></div>
									</div>
								</div>
							</div>
							<div style="width: 30%;height: 100%;float: left;">
								<div class="data_contentLeft" style="width: 98%;height: 100%;margin-left: 2%;">
									<div class="dataBar_2_top" id="part5" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
									<div class="dataBar_2_mid" id="part6" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
									<div class="dataBar_2_btm" id="part7" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				<c:when test="${typeSize eq 3}">
					<div class="data_content">
						<div style="width: 100%; height: 50px;line-height: 50px;float: left;color: ; " id="indexCheckBox">
							<div style="background-color: #AFE7FE;width: 3px;height: 20px;float: left;margin-top: 15px;"></div>
							<span style="float: left; margin-left: 10px; font-size: 22px; color: #AFE7FE;">园区经济指标</span>
							<div id="norm" style="float: left; margin-left: 10px; font-size: 12px; color: #FFFFFF; height: 95%; width: auto; display: none;">
							</div>
							<span id="set_btn" class="btn_set" onclick="setNorm();">
								<img src="${ctx}/static/img/set.png" style="margin-top: -4px;" />&nbsp;指标设置
							</span>
						</div>
						<div style="width: 100%;height: 88%;float: left;">
							<div style="width: 70%;height: 100%;float: left;">
								<div class="clearfix" style="height:22%; margin-bottom:1%;" id="data1"></div>
								
								<div style="height:76%;">
									<div class="dataBar_1">
										<div class="dataBar_3_top" id="part1" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;height: 100%;" ></div>
										<div style="clear:both;"></div>
									</div>
									<div class="dataBar_1">
										<div class="dataBar_1_Left" id="part2" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;"></div>
										<div class="daraBar_1_Right" id="part3" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;"></div>
										<div style="clear:both;"></div>
									</div>
								</div>
							</div>
							<div style="width: 30%;height: 100%;float: left;">
								<div class="data_contentLeft" style="width: 98%;height: 100%;margin-left: 2%;">
									<div class="dataBar_2_top" id="part5" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
									<div class="dataBar_2_mid" id="part6" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
									<div class="dataBar_2_btm" id="part7" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				<c:when test="${typeSize eq 2}">
					<div class="data_content">
						<div style="width: 100%; height: 50px;line-height: 50px;float: left;color: ; " id="indexCheckBox">
							<div style="background-color: #AFE7FE;width: 3px;height: 20px;float: left;margin-top: 15px;"></div>
							<span style="float: left; margin-left: 10px; font-size: 22px; color: #AFE7FE;">园区经济指标</span>
							<div id="norm" style="float: left; margin-left: 10px; font-size: 12px; color: #FFFFFF; height: 95%; width: auto; display: none;">
							</div>
							<span id="set_btn" class="btn_set" onclick="setNorm();">
								<img src="${ctx}/static/img/set.png" style="margin-top: -4px;" />&nbsp;指标设置
							</span>
						</div>
						<div style="width: 100%;height: 88%;float: left;">
							<div style="width: 50%;height: 100%;float: left;">
								<div class="clearfix" style="height:22%; margin-bottom:1%;" id="data1"></div>
								
								<div style="height:76%;">
									<div class="dataBar_1">
										<div class="dataBar_3_top" id="part1" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px; height: 100%;" ></div>
										<div style="clear:both;"></div>
									</div>
									<div class="dataBar_1">
										<div class="dataBar_3_btm" id="part2" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0px 0px;height: 100%;"></div>
										<div style="clear:both;"></div>
									</div>
								</div>
							</div>
							<div style="width: 50%;height: 100%;float: left;">
								<div class="data_contentLeft" style="width: 98%;height: 100%;margin-left: 2%;">
									<div class="dataBar_3_top" id="part5" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
									<div class="dataBar_3_btm" id="part6" style="-moz-user-select: none; position: relative; background: rgb(8, 47, 86) none repeat scroll 0% 0%;"></div>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise><div class="data_content">暂无对应匹配模板</div></c:otherwise>
			</c:choose>
		</div>
	<div class="btn_prev" onclick="window.location.href='${ctx}${configInfo.indexUrl}'"></div>
	<div class="btn_next" onclick="nextPage()"></div>
	</body>

<script type="text/javascript">
	$(function(){
		/*判断组织id是否有效*/
		var configInfo = ${configInfo};
		if($.isEmptyObject(configInfo)){
			layer.msg('请填写有效组织ID！', {
				shade: 0.5,
				time:100000000
			});
			return;
		}
		
		var pkIndexNum = '${configInfo.pkIndexNum}';
		var pkIndexName = '${configInfo.pkIndexName}';
		var pkIndexCode = '${configInfo.pkIndexCode}';
		/*初始化*/
	//	if(pkIndexNum>4){
			var pkIndexNameArr = pkIndexName.split(",");
			var span = '<span style="float: left;margin-left: 20px;font-size: 14px;color: #AFE7FE;" id="parkIndex">指标选择：';
			for(var i=0;i<pkIndexNameArr.length;i++){
				var value = "";
				for(var j=0;j<parkIndex.length;j++){
					if(parkIndex[j].name==pkIndexNameArr[i]){
						value = parkIndex[j].value;
					}
				}
				if(i<4){					
					span += '&nbsp;&nbsp;<input type="checkbox" class="i-checks" value="'+value+'" data="'+pkIndexNameArr[i]+'" checked/>&nbsp;&nbsp;'+pkIndexNameArr[i];
				}else{
					span += '&nbsp;&nbsp;<input type="checkbox" class="i-checks" value="'+value+'" data="'+pkIndexNameArr[i]+'"/>&nbsp;&nbsp;'+pkIndexNameArr[i];
				}
			}
			var typeSize = '${typeSize}';
			if(typeSize >=4 ){				
				span += '&nbsp;&nbsp;<span class="btn_confirm" onclick="selectByParkIndex()">确认</span>';
			}
			
			$("#norm").append(span);
				
	//	}
		
		/*加载echart图形*/
		loadData(pkIndexName, pkIndexCode);
		
		$(".i-checks").iCheck({
			checkboxClass : "icheckbox_square-green",
			radioClass : "iradio_square-green"
		});
		
	});
	
	function nextPage(){
		if('${orgId}' == '1113') {
			window.location.href='${ctx}${configInfo.indexUrl}'
		} else { window.location.href='${ctx}/front/parkDataCenter/indEconIndicators?orgId=${orgId}'}
	}
	
	function selectByYear(year){
		$("#yearMenu").slideUp("fast");  
		$("#yearText").text(year+"年");
     	$("#year").val(year);
		loadData();
	}
	
	function selectByParkIndex(){
		var count = 0;
		var pkIndex = "";
		
		$("#parkIndex input").each(function(){
			if($(this).is(':checked')){
				count += 1;
				pkIndex += ($(this).attr("data")+",");
			}
		});
		
		if(count==4){
			loadData1(pkIndex, data.data1);
			loadData2(pkIndex, data.data2);
			loadData3(pkIndex, data.data3);
		}else{
			layer.msg("必须选择四项展示！");
		}
		
	}
	
	var data = "";
	function loadData(){
		$.ajax({
			url:"${ctx}/interface/json/dataCenter/pkEconIndicators",
			type:"post",
			data:$("#form").serialize(),
			success:function(result){
				var pkIndexName = $("#pkIndexName").val();
				if(result.success){
					$("#oldYear").val($("#year").val());
					data = result.pkEconData;
					loadData1(pkIndexName, result.pkEconData.data1);
					loadData2(pkIndexName, result.pkEconData.data2);
					loadData3(pkIndexName, result.pkEconData.data3);
				}else{
					layer.msg(result.errorMsg);
					if(result.errorCode==1){
						$("#yearMenu").slideUp("fast");  
						$("#yearText").text($("#oldYear").val()+"年");
					 	$("#year").val($("#oldYear").val());
					}
				}
			},
			error:function(){
				layer.msg("数据获取异常！");
			}
		});
	}
	
	function loadData1(pkIndexName, data){
		var data1Index = null;
		var isPkPctShow = '${configInfo.isPkPctShow}';
		pkIndexName = pkIndexName.split(",");
		$("#data1").empty();
		var typeSize = '${typeSize}';
		if(typeSize>4){
			typeSize = 4;
			data1Index = ["dataBarMagenta","dataBarLightBlue","dataBarNavy","dataBarGreen"];
		}else if(typeSize==3){
			data1Index = ["dataBarMagenta2","dataBarLightBlue2","dataBarNavy2","dataBarGreen2"];
		}else if(typeSize==2){
			data1Index = ["dataBarMagenta3","dataBarLightBlue3","dataBarNavy3","dataBarGreen3"];
		}else{
			data1Index = ["dataBarMagenta","dataBarLightBlue","dataBarNavy","dataBarGreen"];
		}
		
		for(var i=0; i<typeSize; i++){
			var code = "";
			var unit = "";
			var type = "";
			for(var j=0; j<parkIndex.length; j++){
				if(parkIndex[j].name==pkIndexName[i]){
					code = parkIndex[j].value;
					type = parkIndex[j].type;
					unit = parkIndex[j].unit;
				}
			}
			
			var value = code+"_value";
			var percent = code+"_percent";
			
			value = data[value];
			if(type==2){				
				percent = data[percent];
			}
			
			var div = "";
			if(i==3){
				div += '<div class="'+data1Index[i]+'" style="margin-right:0;">'
			}else{
				div += '<div class="'+data1Index[i]+'" >'
			}
			
			div += '<div class="dataBarTitle">'+pkIndexName[i]+'</div>';
			
			if(value!=null&&value!=''&&value!='underfined'){
				div += '<div class="dataBarNum"><font class="yellowFont24">'+value+'</font>'+unit+'</div>';
			}else{
				div += '<div class="dataBarNum"><font class="yellowFont24">--</font></div>';
			}
				
			
			if(isPkPctShow==1){
				if(percent!=null&&percent!=''&&percent!='underfined'){
					div += '<div class="dataBarIncrease">同比增长<font class="yellowFont">'+percent+'</font>%</div>';	
				}
			}
			div += '</div>';
			
			$("#data1").append(div);
		}
	}
	
	function loadData2(pkIndexName, data){
		var partIndex = ["part1","part2","part3","part4"];
		var colorIndex = ["#ce0867","#01c5ff","#feff02","#ff7f50"];
		var typeIndex = ["bar","bar","line","bar"];
		var isPkPctShow = '${configInfo.isPkPctShow}';
		pkIndexName = pkIndexName.split(",");
		
		var typeSize = '${typeSize}';
		if(typeSize>4){
			typeSize = 4;
		}
		for(var i=0; i<typeSize; i++){
			var code = "";
			var type = "";
			var unit = "";
			for(var j=0; j<parkIndex.length; j++){
				if(parkIndex[j].name==pkIndexName[i]){
					code = parkIndex[j].value;
					type = parkIndex[j].type;
					unit = parkIndex[j].unit;
				}
			}
			
			var value = code+"_value";
			var percent = code+"_percent";
			
			value = data[value];
			if(type==2){				
				percent = data[percent];
			}
			
			var myChart = echarts.init(document.getElementById(partIndex[i]));
			var option = "";
			if(isPkPctShow==1){
				option = optionPart2;
			}else{
				option = optionPart1;
			}
			
			option.title.text=pkIndexName[i]+"（"+unit+"）";
			option.series[0].data=value;
			option.series[0].type=typeIndex[i];
			option.series[0].itemStyle.normal.color=colorIndex[i];
			var flag = true;
			if(percent!=null&&percent!=''&&percent!='undefined'){
				for(var j=0; j<percent.length; j++){
					if(percent[j]=='undefined'){
						flag = false;
					}
				}
			}
			
			
			if(isPkPctShow==1&&type==2&&flag==true){
				option.series[1].data=percent;
				option.series[1].type='line';
				option.series[1].itemStyle.normal.color=colorIndex[i];
			}
			
			myChart.setOption(option);
		}
		
	}
	
	
	function loadData3(pkIndexName, data){
		var partIndex = ["part5","part6","part7"];
		var typeIndex = ["line","bar","bar"];
		pkIndexName = pkIndexName.split(",");
		for(var i=0; i<3; i++){
			var code = "";
			var unit = "";
			for(var j=0; j<parkIndex.length; j++){
				if(parkIndex[j].name==pkIndexName[i]){
					code = parkIndex[j].value;
					unit = parkIndex[j].unit;
				}
			}
			
			var value = data[code+"_value"];
			var myChart = echarts.init(document.getElementById(partIndex[i]));
			var option = optionPart3;
			
			option.title.text=pkIndexName[i]+"（"+unit+"）";
			option.yAxis.data=data.yAxis;
			option.series[0].data=value;
			option.series[0].type=typeIndex[i];
			myChart.setOption(option);
		}
	}
	
	function setNorm() {
		$("#set_btn").hide();
		$("#norm").show();
	}
	
	var parkIndex = [
		{
			name:"投产工业企业数",
			value:"tcgyqygs",
			type:"1",
			unit:"个"
		},
		{
			name:"工业销售产值",
			value:"gyxscz",
			type:"2",
			unit:"万元"
		},
		{
			name:"出口交货值",
			value:"ckjhz",
			type:"2",
			unit:"万元"
		},
		{
			name:"资产总计",
			value:"zczj",
			type:"2",
			unit:"万元"
		},
		{
			name:"主营业务收入",
			value:"zyywsr",
			type:"2",
			unit:"万元"
		},
		{
			name:"利润总额",
			value:"lr",
			type:"2",
			unit:"万元"
		},
		{
			name:"从业人员平均人数",
			value:"csgyschd_cyry",
			type:"2",
			unit:"个"
		},
		{
			name:"工业增加值",
			value:"gyzjz",
			type:"2",
			unit:"万元"
		},
		{
			name:"税金总额",
			value:"sj",
			type:"2",
			unit:"万元"
		},
		{
			name:"利税总额",
			value:"ls",
			type:"2",
			unit:"万元"
		},
		{
			name:"园区实际开发面积",
			value:"yqsjkfmj",
			type:"2",
			unit:"平方公里"
		},
		{
			name:"完成基础设施投入",
			value:"wcjcsstr",
			type:"2",
			unit:"万元"
		},
		{
			name:"招商签约资金",
			value:"zsqyzj",
			type:"2",
			unit:"万元"
		},
		{
			name:"亿元以上项目资金",
			value:"yyysxmzj",
			type:"2",
			unit:"万元"
		},
		{
			name:"千万美元以上项目资金",
			value:"qwmyysxmzj",
			type:"2",
			unit:"万元"
		},
		{
			name:"招商实际到位资金",
			value:"zssjdwzj",
			type:"2",
			unit:"万元"
		},
		{
			name:"省外资金",
			value:"swzj",
			type:"2",
			unit:"万元"
		},
		{
			name:"境外资金",
			value:"jwzj",
			type:"2",
			unit:"万元"
		},
		{
			name:"工业固定资产投资额",
			value:"gygdzctze",
			type:"2",
			unit:"万元"
		},
		{
			name:"在建工业个数",
			value:"zjqygs",
			type:"1",
			unit:"个"
		},
		{
			name:"非工企业，企业数",
			value:"fgqy_qys",
			type:"1",
			unit:"个"
		},
		{
			name:"非工企业，非工营业收入",
			value:"fgqy_fgyesr",
			type:"1",
			unit:"万元"
		},
		{
			name:"工业总产值",
			value:"gyzcz",
			type:"2",
			unit:"万元"
		},
		{
			name:"主营业务税金及附加",
			value:"zyywsjjfj",
			type:"2",
			unit:"万元"
		},
		{
			name:"应交增值税",
			value:"yjzzs",
			type:"2",
			unit:"万元"
		}
	];
	
	var optionPart1 = {
			backgroundColor: '#082F56', 
			title : {
		        textStyle:{
		        	color:"#b0e7ff",
		        	fontSize:14
		        },
		        left:15,
		        top:10
		    },
			tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		    	top:'6%',
		    	right: '5%',
				itemWidth:25,
				itemHeight:12,
		        data:[
					{name:'总量',textStyle:{color:"#FCFF00"}}
				]
		    },
		    grid: {
		    	top:'40%',
		    	bottom:'5%',
		    	heigth:'60%',
		        containLabel: true,
		    },
		    xAxis: [
		        {
		            type: 'category',
		            data: ['1-3月','1-6月','1-9月','1-12月'],
		            axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	}
		        }
		    ],
		    yAxis: [
		        {
		            type: 'value',
		            name: '总量',
		            nameTextStyle:{
		            	color: '#5EC9F4'
		            },
		            axisLabel: {
		                formatter: '{value} '
		            },
		            axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	},
		        	splitLine:{
		        		lineStyle:{
		        			opacity:0.2
		        		}
		        	}
		        }
		    ],
		    series: [
		        {
		            name:'总量',
		            type:'bar',
		            data:[0,0,0,0],
		            barWidth:'25%',
		            markPoint : {
		            	symbolSize : 35,
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ],
		                label:{
		            		normal:{
		            			textStyle:{
			            			color:"#fff"
		            			}
		            		}
		            	},
		            	itemStyle:{
		            		normal:{
		            			color:"#799c0c"
		            		}
		            	}
		            },
		            markLine : {
		            	lineStyle:{
			            	normal:{
			            		color:"#FF7F50"
			            	},
			            	emphasis:{
			            		color:'#5EC9F4'
			            	}
			            },
		                data : [
		                    {type : 'average', name: '平均值'}
		                ]
		            },
		            itemStyle:{
		            	normal:{
		            		color:'#FF7F50'
		            	}
		            }
		        }
		    ]
	};
	
	var optionPart2 = {
			backgroundColor: '#082F56', 
			title : {
		        textStyle:{
		        	color:"#b0e7ff",
		        	fontSize:14
		        },
		        left:15,
		        top:10
		    },
			tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		    	top:'6%',
		    	right: '5%',
				itemWidth:25,
				itemHeight:12,
		        data:[
					{name:'总量',textStyle:{color:"#FCFF00"}},
					{name:'同比增量',textStyle:{color:"#FCFF00"}},
				]
		    },
		    grid: {
		    	top:'40%',
		    	bottom:'5%',
		    	heigth:'60%',
		        containLabel: true,
		    },
		    xAxis: [
		        {
		            type: 'category',
		            data: ['1-3月','1-6月','1-9月','1-12月'],
		            axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	}
		        }
		    ],
		    yAxis: [
		        {
		            type: 'value',
		            name: '总量',
		            nameTextStyle:{
		            	color: '#5EC9F4'
		            },
		            axisLabel: {
		                formatter: '{value} '
		            },
		            axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	},
		        	splitLine:{
		        		lineStyle:{
		        			opacity:0.2
		        		}
		        	}
		        },
		        {
		            type: 'value',
		            name: '同比增量',
		            scale: true,
		            axisLabel: {
		                formatter: '{value} %'
		            },
		            axisLine:{
		        		lineStyle:{
		        			color:"#5EC9F4"
		        		}
		        	},
		        	splitLine:{
		        		lineStyle:{
		        			opacity:0.2
		        		}
		        	}
		        }
		    ],
		    series: [
		        {
		            name:'总量',
		            type:'bar',
		            data:[0,0,0,0],
		            barWidth:'25%',
		            markPoint : {
		            	symbolSize : 35,
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ],
		                label:{
		            		normal:{
		            			textStyle:{
			            			color:"#fff"
		            			}
		            		}
		            	},
		            	itemStyle:{
		            		normal:{
		            			color:"#799c0c"
		            		}
		            	}
		            },
		            markLine : {
		            	lineStyle:{
			            	normal:{
			            		color:"#FF7F50"
			            	},
			            	emphasis:{
			            		color:'#5EC9F4'
			            	}
			            },
		                data : [
		                    {type : 'average', name: '平均值'}
		                ]
		            },
		            itemStyle:{
		            	normal:{
		            		color:'#FF7F50'
		            	}
		            }
		        },
		        {
		            name:'同比增量',
		            type:'line',
		            yAxisIndex:1,
		            data:[0,0,0,0],
		            markPoint : {
		            	symbolSize : 35,
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ],
		                label:{
		            		normal:{
		            			textStyle:{
			            			color:"#fff"
		            			}
		            		}
		            	},
		            	itemStyle:{
		            		normal:{
		            			color:"#799c0c"
		            		}
		            	}
		            },
		            markLine : {
		            	lineStyle:{
			            	normal:{
			            		color:"#FF7F50"
			            	},
			            	emphasis:{
			            		color:'#5EC9F4'
			            	}
			            },
		                data : [
		                    {type : 'average', name: '平均值'}
		                ]
		            },
		            itemStyle:{
		            	normal:{
		            		color:'#FF7F50'
		            	}
		            }
		        }
		    ]
	};
	
	var optionPart3 = {
			backgroundColor: '#082F56', 
			title : {
		        textStyle:{
		        	color:"#b0e7ff",
		        	fontSize:14
		        },
		        left:15,
		        top:5
		    },
		    tooltip : {
		        trigger: 'axis'
		    },
		    grid: {
		    	top:'20%',
		    	bottom:'5%',
		    	heigth:'80%',
		    	left:'5%',
		        containLabel: true
		    },
		    xAxis: {
		        type: 'value',
		        axisLine:{
	        		lineStyle:{
	        			color:"#5EC9F4"
	        		}
	        	},
	        	splitLine:{
	        		lineStyle:{
	        			opacity:0.2
	        		}
	        	}
		    },
		    yAxis: {
		        type: 'category',
		        data: [2017, 2016, 2015],
		        axisLine:{
	        		lineStyle:{
	        			color:"#5EC9F4"
	        		}
	        	}
		    },
		    series: [
		        {
		            type: 'bar',
		            data: [0, 0, 0],
		            barWidth:'50%',
		            label:{
		            	normal:{
		            		show:true,
		            		position:'right',
		            		textStyle:{
		            			color:'#FCFF00'
		            		}
		            	}
		            },
		            areaStyle: {
		            	normal: {
		            		opacity: 0.2
		            	}
		            },
		            itemStyle:{
		            	normal:{
		            		color:function(params){
		            			var index = params.dataIndex;//表示当前的数据条的索引
		            		    var alternateNumber = 3;//表示按几种颜色交替出现

		            		    var newColor="";//表示最终显示的颜色
		            		    /**
		            		    自定义的颜色池
		            		    如果颜色池长度不够，将无法取得正确的颜色，所以有必要使
		            		    index的最大值小于colorList.length
		            		    */
		            		    var colorList = ['#18fee1','#18ccff','#0090ff','#E87C25','#27727B',
		            		                     '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
		            		                     '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
		            		                    ];
		            		    //当当前的索引值小于交替值的时候 
		            		    if(index < alternateNumber){
		            		        //取出当前索引值对应的colorList的颜色
		            		        newColor = colorList[index];

		            		    }else{
		            		        /**当当前的索引值大于等于交替值的时候*/
		            		        var rowNumber=Math.floor(index/alternateNumber);//表示当前的数据出现在几次
		            		        //通过表达式计算返回正确的colorList索引
		            		        newColor = colorList[index-rowNumber*alternateNumber];
		            		        
		            		    }

		            		    return colorList[index];
		            		}
		            	}
		            }
		        }
		    ]
		};
	

	/*鼠标滚轮滚动事件*/
	var scrollFunc=function(e){     
	    e=e || window.event; 
	    var orgId = '${orgId}';
	    if(e.wheelDelta){//IE/Opera/Chrome     
	        if(e.wheelDelta>0){
		        window.location.href="${ctx}${configInfo.indexUrl}";
	        }else{ //向下滚动事件 
	    		if('${orgId}' == '1113') {
	    			window.location.href='${ctx}${configInfo.indexUrl}'
	    		} else { window.location.href='${ctx}/front/parkDataCenter/indEconIndicators?orgId=${orgId}'}
			}  
	    }else if(e.detail){//Firefox   
	         if(e.detail<0) { //向上滚动事件  
	        	 window.location.href="${ctx}${configInfo.indexUrl}";
	         }else{ //向下滚动事件 
	     		if('${orgId}' == '1113') {
	    			window.location.href='${ctx}${configInfo.indexUrl}'
	    		} else { window.location.href='${ctx}/front/parkDataCenter/indEconIndicators?orgId=${orgId}'}
	        }  
	    }  
	}
	/*注册事件*/     
	if(document.addEventListener){ document.addEventListener('DOMMouseScroll',scrollFunc,false);}  
	window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome
	
</script>

</html>