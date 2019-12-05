<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>统计报表</title>
<link href="${ctx}/static/css/investigation/statisticalReport.css" rel="stylesheet"/>
<link href="${ctx}/static/css/investigation/buttons.css" rel="stylesheet"/>
<!-- 引入 Echarts -->
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<style>
.tabItem {
	background-color:#f1921c;
	height:40px;
}
.itemClick { background-color:#B76501;}
.button_Contral {
	-moz-border-radius: 20px;
    -webkit-border-radius: 20px;
    border-radius:20px;
	text-align:center;
	font-weight:bold;
}
.displayNo {
	display:none;
}
</style>
<script>
 $(function(){
	 getList($("#id").val(),"1","null");
    $(".tabName ul li").each(function(){//页面头部模块切换控制
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
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	$(".searchOptions .optionBtn").click(function(){//标签选择控制
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}else{
			$(this).addClass("selected");
		}
	});
	$(".tableBtn").click(function(){ 
		if($(".personnelList").hasClass("displayNo")){
			$(".personnelList").removeClass("displayNo");
			$(".dataList").addClass("displayNo");
			$("#joinPersonTable .nextTr").remove();
			getJoinPersonDataList("1","","");
		}else {
			$(".personnelList").addClass("displayNo");
			$(".dataList").removeClass("displayNo");
			$("#dataTable .nextTr").remove();
			getDataList("1","","");
		}
	}); 
 });
 function viewQADetails(){
 	layer.open({
		type: 1,
		title:false,
		shadeClose: true,
		shade: [0],
		area:['600px','250px'],
		closeBtn:0,
		content: $('#viewQADetails')
	});
 };
 
//获取调查列表
function getList(id,pageNum,obj){
	$("div.paging .pagingValue").removeAttr("style");//去除第一页、第二页高亮显示
	if(obj != "null"){
		$(obj).attr("style","background-color:#D8D8D8;");//单击哪个，哪个高亮
	}else{
		$("div.paging .pagingValue").eq(0).attr("style","background-color:#D8D8D8;");//默认第一页选中
	}
	
	$("#itemDiv").html("");
	//标题序号
	var n = (pageNum - 1)*2+1;
	$("#num").val(n);
	$.ajax({
		url:"${ctx}/investigation/json/getStatisticsDetailResult",
		type:"get",
		data:{
			"pageNum":pageNum,
			"id":id
		},
		dataType:"json",
		success:function(result){
			if(result.code==-1){
				layer.alert(result.msg);
			}else if(result.code==2){
				//$("#getMore").hide();
				layer.msg(result.msg);
			}else{
				var total = result.jsonValue1;
				if(pageNum==1){
					$("#countStart").val(result.jsonValue2.start);
					$("#countEnd").val(result.jsonValue2.end);
				}else{
					//TODO 开放时间查询则在这赋值
				}
				
				$("#itemNum").html(result.msg);
				$("#itemNum1").html(result.msg);
				$("#browseNum").html(total.countBrowse);
				$("#browseNum3").html(total.countBrowse);
				$("#inputNum").html(total.countExampleSum);
				$("#inputNum1").html(total.countExampleSum);
				$("#inputNum3").html(total.countExampleSum);
				$("#inputNumOfPc").html(total.countExamplePc);
				$("#inputNumOfMobile").html(total.countExampleWx);
				$("#inputPercent").html((Number(total.countExampleSum)/Number(total.countBrowse)*100).toFixed(2)+"%");
				$("#inputPercent1").html((Number(total.countExampleSum)/Number(total.countBrowse)*100).toFixed(2)+"%");
				$("#inputPercent3").html((Number(total.countExampleSum)/Number(total.countBrowse)*100).toFixed(2)+"%");
				var list = result.value;
				var num = Number($("#num").val());
				var resultMap = result.jsonValue;
				for(var i=0; i<list.length;i++){
					var item = list[i];
					var _div = "";
					if(item.inputType=='text'){
						_div += "<!-- 文本框 -->";
						_div += " <div class=\"survey_subject\">"+num+"、"+item.inputTitle+"</div>";
						num++;
						_div += "<div class=\"survey_optionBar\">";
						_div += "<div class=\"survey_option\" style=\"margin-left: 25px;\">";
						_div += "<img src=\"${ctx}/static/image/investigation/headPortrait.png\" width=\"20px\" height=\"20px\" style=\"vertical-align:middle;\">";
						_div += "<span style=\"vertical-align:middle; color:#37B0FF;cursor: pointer;\" onclick=\"queryDetailByInputId('"+item.inputId+"')\">查看详细填写结果</span>";
						_div += "</div>";
						_div += "</div>";
						_div += "<div style=\"text-align:right\">";
						_div += "<font style=\"color:#37B0FF; font-size:24px; font-weight:bold;\">"+item.inputTrue+"</font>人作答("+item.examplePrc+"%)";
						_div += "</div>";
					}
					if(item.inputType=='password'){
						_div += "<!-- 密码框 -->";
						_div += " <div class=\"survey_subject\">"+num+"、"+item.inputTitle+"</div>";
						num++;
						_div += "<div class=\"survey_optionBar\">";
						_div += "<div class=\"survey_option\" style=\"margin-left: 25px;\">";
						_div += "<img src=\"${ctx}/static/image/investigation/headPortrait.png\" width=\"20px\" height=\"20px\" style=\"vertical-align:middle;\">";
						_div += "<span style=\"vertical-align:middle; color:#37B0FF;\">查看详细填写结果</span>";
						_div += "</div>";
						_div += "</div>";
						_div += "<div style=\"text-align:right\">";
						_div += "<font style=\"color:#37B0FF; font-size:24px; font-weight:bold;\">"+item.inputTrue+"</font>人作答("+item.examplePrc+"%)";
						_div += "</div>";
					}
					if(item.inputType=='number'){
						_div += "<!-- 数值 -->";
						_div += "<div class=\"survey_subject\">"+num+"、"+item.inputTitle+"</div>";
						num++;
						_div += "<div class=\"survey_optionBar\">";
						_div += "<div class=\"survey_option\" style=\"margin-left: 25px;\">";
						_div += "<img src=\"${ctx}/static/image/investigation/headPortrait.png\" width=\"20px\" height=\"20px\" style=\"vertical-align:middle;\">";
						_div += "<span style=\"vertical-align:middle; color:#37B0FF;cursor: pointer;\" onclick=\"queryDetailByInputId('"+item.inputId+"')\">查看详细填写结果</span>";
						_div += "</div>";
						_div += "</div>";
						_div += "<div style=\"text-align:right\">";
						_div += "<font style=\"color:#37B0FF; font-size:24px; font-weight:bold;\">"+item.inputTrue+"</font>人作答("+item.examplePrc+"%)";
						_div += "</div>";
					}
					if(item.inputType=='textarea'){
						_div += "<div class=\"survey_subject\">"+num+"、"+item.inputTitle+"</div>";
						num++;
						_div += "<div class=\"survey_optionBar\">";
						_div += "<div class=\"survey_option\" style=\"margin-left: 25px;\">";
						_div += "<img src=\"${ctx}/static/image/investigation/headPortrait.png\" width=\"20px\" height=\"20px\" style=\"vertical-align:middle;\">";

						_div += "<span style=\"vertical-align:middle; color:#37B0FF;cursor: pointer;\" onclick=\"queryDetailByInputId('"+item.inputId+"')\">查看详细填写结果</span>";

						_div += "</div>";
						_div += "</div>";
						_div += "<div style=\"text-align:right\">";
						_div += "<font style=\"color:#37B0FF; font-size:24px; font-weight:bold;\">"+item.inputTrue+"</font>人作答("+item.examplePrc+"%)";
						_div += "</div>";
					}
					if(item.inputType=='richtext'){
						_div += "<div class=\"survey_subject\">"+num+"、"+item.inputTitle+"</div>";
						num++;
						_div += "<div class=\"survey_optionBar\">";
						_div += "<div class=\"survey_option\" style=\"margin-left: 25px;\">";
						_div += "<img src=\"${ctx}/static/image/investigation/headPortrait.png\" width=\"20px\" height=\"20px\" style=\"vertical-align:middle;\">";
						_div += "<span style=\"vertical-align:middle; color:#37B0FF;cursor: pointer;\" onclick=\"queryDetailByInputId('"+item.inputId+"')\">查看详细填写结果</span>";
						_div += "</div>";
						_div += "</div>";
						_div += "<div style=\"text-align:right\">";
						_div += "<font style=\"color:#37B0FF; font-size:24px; font-weight:bold;\">"+item.inputTrue+"</font>人作答("+item.examplePrc+"%)";
						_div += "</div>";
					}
					if(item.inputType=='radio'){
						_div += "<div class=\"survey_subject\">"+num+"、"+item.inputTitle+"（单选）</div>";
						num++;
						_div += "<div class=\"survey_optionBar\">";
						var optionsStr = item.options.split("_:");//选项
						for(var j = 0; j < optionsStr.length; j++){
							if(optionsStr[j] != ""){
								var key = item.inputId+optionsStr[j];
								_div += "<div class=\"survey_option\">";
								_div += "<div style=\"float:left;\">"+optionsStr[j]+"</div>";
								_div += "<div class=\"survey_dataStrip\">";
								_div += "<div class=\"survey_sum\">"+(Number(resultMap[key].split("_")[0]))+"</div>";
								_div += "<div class=\"survey_percentageStrip\" style=\"width:"+(Number(resultMap[key].split("_")[1]))/100*240+"px; background-color:#37B0FF;\"></div>";
								_div += "<div class=\"survey_percentage\">"+(Number(resultMap[key].split("_")[1]).toFixed(2))+"%</div><!--240px为100%-->";
								_div += "<div style=\"clear:both;\"></div>";
								_div += "</div>";
								_div += "<div style=\"clear:both;\"></div>";
								_div += "</div>";
							}
						}
						_div += "</div>";
						_div += "<div style=\"text-align:right\">";
						_div += "<font style=\"color:#37B0FF; font-size:24px; font-weight:bold;\">"+item.inputTrue+"</font>人作答("+item.examplePrc+"%)";
						_div += "</div>";
					}
					if(item.inputType=='checkbox'){
						_div += "<div class=\"survey_subject\">"+num+"、"+item.inputTitle+"（多选）</div>";
						num++;
						_div += "<div class=\"survey_optionBar\">";
						var optionsStr = item.options.split("_:");//选项
						for(var j = 0; j < optionsStr.length; j++){
							if(optionsStr[j] != ""){
								var key = item.inputId+optionsStr[j];
								_div += "<div class=\"survey_option\">";
								_div += "<div style=\"float:left;\">"+optionsStr[j]+"</div>";
								_div += "<div class=\"survey_dataStrip\">";
								_div += "<div class=\"survey_sum\">"+(Number(resultMap[key].split("_")[0]))+"</div>";
								_div += "<div class=\"survey_percentageStrip\" style=\"width:"+(Number(resultMap[key].split("_")[1]))/100*240+"px; background-color:#37B0FF;\"></div>";
								_div += "<div class=\"survey_percentage\">"+(Number(resultMap[key].split("_")[1]).toFixed(2))+"%</div><!--240px为100%-->";
								_div += "<div style=\"clear:both;\"></div>";
								_div += "</div>";
								_div += "<div style=\"clear:both;\"></div>";
								_div += "</div>";
							}
						}
						_div += "</div>";
						_div += "<div style=\"text-align:right\">";
						_div += "<font style=\"color:#37B0FF; font-size:24px; font-weight:bold;\">"+item.inputTrue+"</font>人作答("+item.examplePrc+"%)";
						_div += "</div>";
					}
					if(item.inputType=='select'){
						_div += "   <div class=\"survey_subject\">"+num+"、"+item.inputTitle+"（单选）</div>";
						num++;
						_div += "<div class=\"survey_optionBar\">";
						var optionsStr = item.options.split("_:");//选项
						for(var j = 0; j < optionsStr.length; j++){
							if(optionsStr[j] != ""){
								var key = item.inputId+optionsStr[j];
								_div += "<div class=\"survey_option\">";
								_div += "<div style=\"float:left;\">"+optionsStr[j]+"</div>";
								_div += "<div class=\"survey_dataStrip\">";
								_div += "<div class=\"survey_sum\">"+(Number(resultMap[key].split("_")[0]))+"</div>";
								_div += "<div class=\"survey_percentageStrip\" style=\"width:"+(Number(resultMap[key].split("_")[1]))/100*240+"px; background-color:#37B0FF;\"></div>";
								_div += "<div class=\"survey_percentage\">"+(Number(resultMap[key].split("_")[1]).toFixed(2))+"%</div><!--240px为100%-->";
								_div += "<div style=\"clear:both;\"></div>";
								_div += "</div>";
								_div += "</div>";
								_div += "<div style=\"clear:both;\"></div>";
							}
						}
						_div += "</div>";
						_div += "<div style=\"text-align:right\">";
						_div += "<font style=\"color:#37B0FF; font-size:24px; font-weight:bold;\">"+item.inputTrue+"</font>人作答("+item.examplePrc+"%)";
						_div += "</div>";
					}
					if(item.inputType=='selectmore'){
						_div += "   <div class=\"survey_subject\">"+num+"、"+item.inputTitle+"（多选）</div>";
						num++;
						_div += "<div class=\"survey_optionBar\">";
						var optionsStr = item.options.split("_:");//选项
						for(var j = 0; j < optionsStr.length; j++){
							if(optionsStr[j] != ""){
								var key = item.inputId+optionsStr[j];
								_div += "<div class=\"survey_option\">";
								_div += "<div style=\"float:left;\">"+optionsStr[j]+"</div>";
								_div += "<div class=\"survey_dataStrip\">";
								_div += "<div class=\"survey_sum\">"+(Number(resultMap[key].split("_")[0]))+"</div>";
								_div += "<div class=\"survey_percentageStrip\" style=\"width:"+(Number(resultMap[key].split("_")[1]))/100*240+"px; background-color:#37B0FF;\"></div>";
								_div += "<div class=\"survey_percentage\">"+(Number(resultMap[key].split("_")[1]).toFixed(2))+"%</div><!--240px为100%-->";
								_div += "<div style=\"clear:both;\"></div>";
								_div += "</div>";
								_div += "</div>";
								_div += "<div style=\"clear:both;\"></div>";
							}
						}
						_div += "</div>";
						_div += "<div style=\"text-align:right\">";
						_div += "<font style=\"color:#37B0FF; font-size:24px; font-weight:bold;\">"+item.inputTrue+"</font>人作答("+item.examplePrc+"%)";
						_div += "</div>";
					}
					if(item.inputType=='date'){
						_div += "<div class=\"survey_subject\">"+num+"、"+item.inputTitle+"</div>";
						num++;
						_div += "<div class=\"survey_optionBar\">";
						_div += "<div class=\"survey_option\" style=\"margin-left: 25px;\">";
						_div += "<img src=\"${ctx}/static/image/investigation/headPortrait.png\" width=\"20px\" height=\"20px\" style=\"vertical-align:middle;\">";
						_div += "<span style=\"vertical-align:middle; color:#37B0FF;cursor: pointer;\" onclick=\"queryDetailByInputId('"+item.inputId+"')\">查看详细填写结果</span>";
						_div += "</div>";
						_div += "</div>";
						_div += "<div style=\"text-align:right\">";
						_div += "<font style=\"color:#37B0FF; font-size:24px; font-weight:bold;\">"+item.inputTrue+"</font>人作答("+item.examplePrc+"%)";
						_div += "</div>";
					}
					if(item.inputType=='hidden'){}
					if(item.inputType=='file'){
						_div += "<div class=\"survey_subject\">"+num+"、"+item.inputTitle+"</div>";
						num++;
						_div += "<div class=\"survey_optionBar\">";
						_div += "<div class=\"survey_option\" style=\"margin-left: 25px;\">";
						_div += "<div id=\"attList_item${k.index+1}\" ></div>";
						_div += "</div>";
						_div += "</div>";
						_div += "<div style=\"text-align:right\">";
						_div += "<font style=\"color:#37B0FF; font-size:24px; font-weight:bold;\">"+item.inputTrue+"</font>人作答("+item.examplePrc+"%)";
						_div += "</div>";
					}
					if(item.inputType=='subform'){
						_div += "<p class=\"form-control-static\" id=\"subform\">请选择需引用的表单</p>";
					}
					if(item.inputType=='line'){
						_div += "<div style=\"border-bottom:2px "+item.dataFormat+" #ccc; margin-top:5px;\"></div>";
					}
					$("#itemDiv").append(_div);
				}
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
			alert(XMLHttpRequest.readyState);
			alert(textStatus);
		} 
	}); 
}

//获取走势图
function getCountData(){
	var id =$("#id").val();
	//标题序号
	$.ajax({
		url:"${ctx}/investigation/json/getInvestigationCountData",
		type:"get",
		data:{
			"id":id
		},
		dataType:"json",
		success:function(result){
			if(result.code==-1){
				layer.alert(result.msg);
			}else if(result.code==2){
				layer.msg(result.msg);
			}else{
				var countObj = result.jsonValue;
				//将json数据转换为数组
				var dateStr = countObj.dateStr.split(',');
				var inputNum = countObj.inputNum.split(',');
				var browseNum = countObj.browseNum.split(',');
				var inputNumPc = countObj.inputNumPc.split(',');
				var inputNumMobile = countObj.inputNumMobile.split(',');
				var inputPercent = countObj.inputPercent.split(',');
				//加载统计图
				loadEcharts(dateStr,inputNum,browseNum,inputNumPc,inputNumMobile,inputPercent);
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
			alert(XMLHttpRequest.readyState);
			alert(textStatus);
		} 
	}); 
}

//获取数据列表
function getDataList(pageNum,start,end){
	var id =$("#id").val();
	//标题序号
	$.ajax({
		url:"${ctx}/investigation/json/getInvestigationDataList",
		type:"get",
		data:{
			"pageNum":pageNum,
			"id":id,
			"start":start,
			"end":end
		},
		dataType:"json",
		success:function(result){
			if(result.code==-1){
				layer.alert(result.msg);
			}else if(result.code==2){
				layer.msg(result.msg);
			}else{
				//展示列表数据
				var _div = "";
				var list = result.value;
				for(var i = 0; i < list.length; i++){
					var info = list[i];
					_div += "<tr class=\"nextTr\">";
					_div += "<td style=\"width:20%;\">"+info.createday+"</td>";
					_div += "<td style=\"width:15%;\">"+info.countExampleSum+"</td>";
					_div += "<td style=\"width:15%;\">"+info.countBrowse+"</th>";
					_div += "<td style=\"width:15%;\">"+info.countExamplePc+"</td>";
					_div += "<td style=\"width:15%;\">"+info.countExampleWx+"</td>";
					_div += "<td style=\"width:20%;\">"+info.examplePrc+"%</td>";
				//	_div += "<td style=\"width:10%;padding:0;\">";
				//	_div += "<img src=\"${ctx}/static/image/activity/activitybig.jpg\" width=\"25px;\" height=\"25px;\" class=\"operSurvey\">";
				//	_div += "</td>";
					_div += "</tr>";
				}
				$("#dataTable").append(_div);
				pageNum++;
				$("#pageNumOfCountData").val(pageNum);
				$("#getmoreData").show();
				if(result.code==0){
					$("#getmoreData").hide();
				}
				$("#trendStart").val(result.jsonValue.start);
				$("#trendEnd").val(result.jsonValue.end);
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
			alert(XMLHttpRequest.readyState);
			alert(textStatus);
		} 
	}); 
}

//获取数据列表
function getJoinPersonDataList(pageNum,start,end){
	var id =$("#id").val();
	//标题序号
	$.ajax({
		url:"${ctx}/investigation/json/getJoinPersonData",
		type:"get",
		data:{
			"pageNum":pageNum,
			"id":id,
			"start":start,
			"end":end
		},
		dataType:"json",
		success:function(result){
			if(result.code==-1){
				layer.alert(result.msg);
			}else if(result.code==2){
				layer.msg(result.msg);
			}else{
				//展示列表数据
				var _div = "";
				var list = result.value;
				for(var i = 0; i < list.length; i++){
					var info = list[i];
					_div += "<tr class=\"nextTr\">";
					_div += "<td style=\"width:20%; text-align:left;\">";
					_div += "<img src=\"${ctx }/static/image/investigation/enterCount.png\" width=\"15px\" height=\"15px;\" class=\"headImg\">";
					_div += "<span class=\"headName\">"+info.accountName+"</span>";
					_div += "</td>";
					_div += "<td style=\"width:30%;\">"+getTime(info.createTime)+"</td>";
					_div += "<td style=\"width:30%;\">"+info.ipAddress+"</th>";
					_div += "<td style=\"width:20%;\">"+(info.source==1?"PC电脑端":"移动微信端")+"</td>";
					_div += "</tr>";
				}
				
				$("#trendStart").val(result.jsonValue.start);
				$("#trendEnd").val(result.jsonValue.end);
				$("#joinPersonTable").append(_div);
				pageNum++;
				$("#pageNumOfJoinPerson").val(pageNum);
				$("#getmorePersonnel").show();
				if(result.code==0){
					$("#getmorePersonnel").hide();
				}
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
			alert(XMLHttpRequest.readyState);
			alert(textStatus);
		} 
	}); 
}

function queryDetailByInputId(inputId){
	//显示DIV
	var index=$("#detailLi").index();
	$("#detailLi").addClass("titleClick").siblings().removeClass("titleClick");
	$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
	//更换栏目图标
	$("#titleName1").attr("src","${ctx}/static/image/investigation/count3.png");
	$("#titleName2").attr("src","${ctx}/static/image/investigation/shuju1.png");
	$("#titleName3").attr("src","${ctx}/static/image/investigation/qushi.png");
	//清空原有的内容
	$("#QADetailsTable").html("");
	getQADetails(1,$("#id").val(),inputId);
}

//切换栏目 主题
function changeLabel(v){
	if(v == "1"){//统计报表
		$("#titleName1").attr("src","${ctx}/static/image/investigation/count4.png");
		$("#titleName2").attr("src","${ctx}/static/image/investigation/shuju.png");
		$("#titleName3").attr("src","${ctx}/static/image/investigation/qushi.png");
		getList($("#id").val(),"1","null");
	}else if(v == "2"){//详细数据
		$("#titleName1").attr("src","${ctx}/static/image/investigation/count3.png");
		$("#titleName2").attr("src","${ctx}/static/image/investigation/shuju1.png");
		$("#titleName3").attr("src","${ctx}/static/image/investigation/qushi.png");
		$("#QADetailsTable").html("");

		getQADetails(1,$("#id").val(),"");

		
	}else if(v == "3"){//走势图
		$("#dataTable .nextTr").remove();
		getCountData();//曲线图 和数据量
		getDataList("1","","");
		$("#titleName1").attr("src","${ctx}/static/image/investigation/count3.png");
		$("#titleName2").attr("src","${ctx}/static/image/investigation/shuju.png");
		$("#titleName3").attr("src","${ctx}/static/image/investigation/qushi1.png");
	}
}

function loadEcharts(dateStr,inputNum,browseNum,inputNumPc,inputNumMobile,inputPercent){
	var myChart = echarts.init(document.getElementById('main'));
    var option = {
    	    tooltip: {
    	        trigger: 'axis'
    	    },
    	    legend: {
    	        data:['数据量','浏览量','PC端数据量','移动端数据量','填写率'],
    	        bottom:'10'
    	    },
    	    toolbox: {
    	        show: true,
    	        feature: {
    	            dataZoom: {
    	                yAxisIndex: 'none'
    	            },
    	            dataView: {readOnly: false},
    	            magicType: {type: ['line', 'bar']},
    	            restore: {},
    	            saveAsImage: {}
    	        }
    	    },
    	    xAxis:  {
    	        type: 'category',
    	        boundaryGap: false,
    	        data: dateStr
    	    },
    	    yAxis: {
    	        type: 'value',
    	    },
    	    series: [
    	        {
    	            name:'数据量',
    	            type:'line',
    	            data:inputNum
    	        },
    	        {
    	            name:'浏览量',
    	            type:'line',
    	            data:browseNum
    	        },
    	        {
    	            name:'PC端数据量',
    	            type:'line',
    	            data:inputNumPc
    	        },
    	        {
    	            name:'移动端数据量',
    	            type:'line',
    	            data:inputNumMobile
    	        },
    	        {
    	            name:'填写率',
    	            type:'line',
    	            data:inputPercent
    	        }
    	    ]
    	};
    myChart.setOption(option);
}

function selectQuestion(){
	$("#QADetailsTable").empty();
	$("#title").text($("#questionItem option:selected").text());
	getQADetails(1,'${infoBean.id}',$("#questionItem").val());
}
//获取问题作答记录
function getQADetails(pageNum,id,inputId){
	$("#getMoreMyPar").hide();	
	$.ajax({
		url:"${ctx}/investigation/json/getQuestionItem",
		type:"get",
		data:{
		//	"start":start,
		//	"end":end,
			"pageNum":pageNum,
			"id":id,
			"inputId":inputId
		},
		success:function(result){
			var list1 = result.jsonArrayValue;
			var list2 = result.value;
			$("#questionItem").empty();
			if(list1==null||list1==""){
				layer.msg("暂无文本输入选项");
				return;
			}
			for(var j=0;j<list1.length;j++){
				var info1 = list1[j];
				var _option = "";
				if(info1.id==inputId){
					_option += '<option value="'+info1.id+'" selected>'+(j+1)+'、'+info1.inputTitle+'</option>';					
				}else{
					_option += '<option value="'+info1.id+'">'+(j+1)+'、'+info1.inputTitle+'</option>';
				}
				if(j==0&&inputId==""){
					$("#title").text((j+1)+'、'+info1.inputTitle);
				}
				$("#questionItem").append(_option);
			}
			if(pageNum==1){
				$("#detailsStart").val(result.jsonValue1.start);
				$("#detailsEnd").val(result.jsonValue1.end);
				
			}else{
				//TODO 开放时间查询则在这赋值
				
			}
			
			
			if(result.code==-1){
				layer.alert(reuslt.msg);
			}else if(result.code==2){
				layer.msg("暂无填写信息");
			}else{
				for(var i=0;i<list2.length;i++){
					var info2 = list2[i];
					var _div = "";
					if(pageNum==1&&i==0){
						_div += '<tr class="firstTr">'
							+'<th style="width:20%;">用户名</th>'
							+'<th style="width:60%;">内容摘要</th>'
							+'<th style="width:20%;">时间</th>'
							+'</tr>';
					}
					
					_div += '<tr class="firstTr">'
						+'<th style="width:20%;">'+info2.accountName+'</th>'
						+'<th style="width:60%;">'+info2.inputValue+'</th>'
						+'<th style="width:20%;">'+getTime(info2.createTime)+'</th>'
						+'</tr>';
					$("#QADetailsTable").append(_div);	
				}
				if(result.code==1){
					$("#getMoreMyPar").show();	
				}else{
					$("#getMoreMyPar").hide();	
				}
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
			alert(XMLHttpRequest.readyState);
			alert(textStatus);
		}
	});
}

function getMoreMyPar(){
	var pageNum = Number($("#pageNum1").val())+1;
	$("#pageNum1").val(pageNum);
	getQADetails(pageNum,$("#id").val(),$("#questionItem").val());
}
function getMoreOfCountData(){
	getDataList($("#pageNumOfCountData").val(),$("#trendStart").val(),$("#trendEnd").val());
}
function getMoreOfJoinPersonData(){
	getJoinPersonDataList($("#pageNumOfJoinPerson").val(),$("#trendStart").val(),$("#trendEnd").val());
}
//long类型时间转换
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
	return (Y + M + D + h + m + s);
}

function search(v){
	if(v==3){
		var start = $("#trendStart").val();
		var end = $("#trendEnd").val();
		if(start!=null&&start!=""&&end!=null&&end!=""){
			if(start>end){
				layer.msg("开始时间不能大于结束时间");
				return false;
			}
		}
		if($(".personnelList").hasClass("displayNo")){
			$("#dataTable .nextTr").remove();
			getDataList(1,start,end);
		}else{
			$("#joinPersonTable .nextTr").remove();
			getJoinPersonDataList(1,start,end);
		}
	}else if(v==2){
		layer.msg("此功能暂未开放");
	}else{
		layer.msg("此功能暂未开放");
	}
}

function returnPage(type){
	if('${type}'==3){
		$("#type").val(3);
	}
	$("#form").attr("action","${ctx}/investigation/main").submit();
}

</script>
</head>

<body>
<form action="" method="post" id="form">
	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
	<input type="hidden" id="type" name="type" value="2">
</form>
<div class="statistical_main">
	<%@ include file="../common/header.jsp"%>
		
	</div>
	
	<div class="statistical_content">
		<div class="titleName">
			<ul>
				<li onclick="changeLabel('1');" style="cursor: pointer;"><img src="${ctx}/static/image/investigation/count4.png" width="25px" height="25px" class="img_Contral" id="titleName1">
					<a href="javascript:void(0)">统计报表</a></li>
				<li onclick="changeLabel('2');" style="cursor: pointer;" id="detailLi"><img src="${ctx}/static/image/investigation/shuju.png" width="25px" height="25px" class="img_Contral" id="titleName2">
					<a href="javascript:void(0)">详细数据</a></li>
				<li onclick="changeLabel('3');" style="cursor: pointer;"><img src="${ctx}/static/image/investigation/qushi.png" width="25px" height="25px" class="img_Contral" id="titleName3">
					<a href="javascript:void(0)">走势图</a></li>
			</ul>
			<a href="javascript:void(0);" style="text-decoration:none;" onclick="returnPage('2')">
				<div class="returnPage">返回上一页&nbsp;&nbsp;></div>
			</a>
			<div style="clear:both;"></div>
		</div>
		<div class="titleItem">
			<div id="div1">
				<div class="statistical_dataBar">
					<div class="statistical_dataTop">
						<input id="countStart" class="laydate-icon form-control layer-date" style="float:left;"disabled="disabled" >
						<div class="connect">至</div>
						<input id="countEnd" class="laydate-icon form-control layer-date" style="float:left;"disabled="disabled" >&nbsp;&nbsp;
						<!-- <a href="javascript:search('1');" class="button button-raised button-highlight button_Contral" >查询</a> -->
						<a href="javascript:search('1');" class="searchBtn" >查询</a>
						<button class="button_contral" onclick="window.location.href='${ctx}/investigation/downloadInfoByExcel?id=${infoBean.id}'">
							<img src="${ctx}/static/image/investigation/downLoad.png" width="20px" height="20px">
							<span>数据下载</span>
						</button>
						<img src="${ctx}/static/image/investigation/delete.png" width="20px" height="20px" class="oper_contral" title="删除">
						<img src="${ctx}/static/image/investigation/copy.png" width="20px" height="20px" class="oper_contral" title="复制">
						<img src="${ctx}/static/image/investigation/print.png" width="20px" height="20px" class="oper_contral" title="打印">
						<div style="clear:both;"></div>
					</div>
					<div class="statistical_cont">
						<input type="hidden" name="id" id="id" value="${infoBean.id}"/>
						<input type="hidden" id="num" value="1"/>
						<div class="statistical_title">${infoBean.investigationName}</div>
						<div class="statisticalBlock">
							<div class="statisticalBlockCont">
								<div class="statisticalBlockAttr">调查项目</div>
								<div class="statisticalBlockValue" id="itemNum"></div>
							</div>
							<div class="statisticalBlockCont">
								<div class="statisticalBlockAttr">数据量</div>
								<div class="statisticalBlockValue" id="inputNum">${totalCount.countExampleSum}</div>
							</div>
							<div class="statisticalBlockCont">
								<div class="statisticalBlockAttr">浏览量</div>
								<div class="statisticalBlockValue" id="browseNum">${totalCount.countBrowse}</div>
							</div>
							<div class="statisticalBlockCont">
								<div class="statisticalBlockAttr">填写率</div>
								<div class="statisticalBlockValue" id="inputPercent">${totalCount.countExampleSum/totalCount.countBrowse*100}%</div>
							</div>
							
							<div style="clear:both;"></div>
						</div>
						<div style="border-bottom:2px dashed #ccc; margin-top:5px;"></div>
						<div class="paging">
							<div class="pagingValue" style="background-color:#D8D8D8;" onclick="getList('${infoBean.id}',1,this);">
								<img src="${ctx}/static/image/investigation/page.png" width="20px" height="20px">
								<span>第一页</span>
							</div>
							<div class="pagingValue" onclick="getList('${infoBean.id}',2,this);">
								<img src="${ctx}/static/image/investigation/page.png" width="20px" height="20px">
								<span>第二页</span>
							</div>
							<div style="clear:both;"></div>
						</div>
						<div style="padding:0 40px;">
							<div style="margin:20px 0;">此处添加调查描述</div>
							<c:set var="num" value="1"/>
							<div style="margin-top:10px;" id="itemDiv">
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" id="pageNumOfCountData" value="1"/><!-- 数据列表 -->
			<input type="hidden" id="pageNumOfJoinPerson" value="1"/><!-- 参与人员 -->
			<div style="display:none;" id="div2">
			<input type="hidden" id="pageNum1" value="1"/>
				<div class="statistical_dataBar">
					<div class="statistical_dataTop">
						<input id="detailsStart" class="laydate-icon form-control layer-date" style="float:left;"disabled="disabled">
						<div class="connect">至</div>
						<input id="detailsEnd" class="laydate-icon form-control layer-date" style="float:left;"disabled="disabled">
						&nbsp;&nbsp;
						<!-- <a href="javascript:search('2');" class="button button-raised button-highlight button_Contral" >查询</a> -->
						<a href="javascript:search('2');" class="searchBtn" >查询</a>
						<button class="button_contral" onclick="window.location.href='${ctx}/investigation/downloadInfoByExcel?id=${infoBean.id}'">
							<img src="${ctx}/static/image/investigation/downLoad.png" width="20px" height="20px">
							<span>数据下载</span>
						</button>
						<img src="${ctx}/static/image/investigation/delete.png" width="20px" height="20px" class="oper_contral" title="删除">
						<img src="${ctx}/static/image/investigation/copy.png" width="20px" height="20px" class="oper_contral" title="复制">
						<img src="${ctx}/static/image/investigation/print.png" width="20px" height="20px" class="oper_contral" title="打印">
						<div style="clear:both;"></div>
					</div>
					<div class="statistical_cont">
						<div style="padding:15px 0;">
							请选择问题：
							<select style="width:270px;" onchange="selectQuestion()" id="questionItem"></select>
						</div>
						<div id="title" style="font-weight:bold; padding:10px 0;"></div>
						<div class="statisticalBlock">
							<div class="statisticalBlockCont">
								<div class="statisticalBlockAttr">调查项目</div>
								<div class="statisticalBlockValue" id="itemNum1"></div>
							</div>
							<div class="statisticalBlockCont">
								<div class="statisticalBlockAttr">数据量</div>
								<div class="statisticalBlockValue" id="inputNum1"></div>
							</div>
							<div class="statisticalBlockCont">
								<div class="statisticalBlockAttr">填写率</div>
								<div class="statisticalBlockValue" id="inputPercent1"></div>
							</div>
							
							<div style="clear:both;"></div>
						</div>
						<div style="border-bottom:2px dashed #ccc; margin-top:5px;"></div>
						<div class="QADetails" style="">
							<table id="QADetailsTable"></table>
							<div id="getMoreMyPar" style="margin:10px 40px;">
								<a href="javascript:;" onclick="getMoreMyPar();" class="renovate">
									<span class="renovateTitle">加载更多</span>
								</a>
							</div>
						</div>
						
					</div>
					
				</div>
			</div>
			
			<div style="display:none;" id="div3">
				<div class="statistical_dataBar">
					<div class="statistical_dataTop">
						<input id="trendStart" class="laydate-icon form-control layer-date" style="float:left;" name="start">
						<div class="connect">至</div>
						<input id="trendEnd" class="laydate-icon form-control layer-date" style="float:left;" name="end">
						&nbsp;&nbsp;
						<!-- <a href="javascript:search('3');" class="button button-raised button-highlight button_Contral" >查询</a> -->
						<a href="javascript:search('3');" class="searchBtn" >查询</a>
						<button class="button_contral" onclick="window.location.href='${ctx}/investigation/downloadInfoByExcel?id=${infoBean.id}'">
							<img src="${ctx}/static/image/investigation/downLoad.png" width="20px" height="20px">
							<span>数据下载</span>
						</button>
						<img src="${ctx}/static/image/investigation/delete.png" width="20px" height="20px" class="oper_contral" title="删除">
						<img src="${ctx}/static/image/investigation/copy.png" width="20px" height="20px" class="oper_contral" title="复制">
						<img src="${ctx}/static/image/investigation/print.png" width="20px" height="20px" class="oper_contral" title="打印">
						<div style="clear:both;"></div>
					</div>
					<div class="statistical_cont">
						<div class="statistical_title">${infoBean.investigationName}</div>
						<div class="statisticalBlock">
							<div class="statisticalBlockCont">
								<div class="statisticalBlockAttr">数据量</div>
								<div class="statisticalBlockValue" id="inputNum3">2324</div>
							</div>
							<div class="statisticalBlockCont">
								<div class="statisticalBlockAttr">浏览量</div>
								<div class="statisticalBlockValue" id="browseNum3">354565</div>
							</div>
							<div class="statisticalBlockCont">
								<div class="statisticalBlockAttr">PC端数据量</div>
								<div class="statisticalBlockValue" id="inputNumOfPc">1334</div>
							</div>
							<div class="statisticalBlockCont">
								<div class="statisticalBlockAttr">移动端数据量</div>
								<div class="statisticalBlockValue" id="inputNumOfMobile">5454</div>
							</div>
							<div class="statisticalBlockCont">
								<div class="statisticalBlockAttr">填写率</div>
								<div class="statisticalBlockValue" id="inputPercent3">10%</div>
							</div>
							
							<div style="clear:both;"></div>
						</div>
						<div style="border-bottom:2px dashed #ccc; margin-top:5px;"></div>
						<div class="cartogram">
							<div class="cartogramTop">
								<select style="padding:5px;">
									<option>显示全部数据</option>
								</select>
							</div>
							<div id="main" style="width: 600px; height: 400px;">
							</div>
						</div>
						
						<div class="dataList">
							<div style="position:relative">
								<div class="tableType">当前为数据列表:</div>
								<div class="tableTime">2016-10-13&nbsp;至&nbsp;2016-10-15</div>
								<input type="button" value="参与填写人员" class="tableBtn">
								<div style="clear:both;"></div>
							</div>
							<table style="" id="dataTable">
								<tr class="firstTr">
									<th style="width:20%;">日期</th>
									<th style="width:15%;">数据量</th>
									<th style="width:15%;">浏览量</th>
									<th style="width:15%;">PC端数据量</th>
									<th style="width:15%;">移动终端数据量</th>
									<th style="width:20%;">填写率</th>
									<!-- <th style="width:10%;">操作</th> -->
								</tr>
								<!-- 这里拼入列表数据 -->
							</table>
							<div id="getmoreData" style="margin:10px 0;">
								<a href="javascript:;" onClick="getMoreOfCountData();" class="renovate">
									<span class="renovateTitle">加载更多</span>
								</a>
							</div>
						</div>
						
						<div class="personnelList displayNo">
							<div style="position:relative">
								<div class="tableType">当前为人员列表:</div>
								<div class="tableTime">2016-10-13&nbsp;至&nbsp;2016-10-15</div>
								<input type="button" value="数据列表" class="tableBtn">
								<div style="clear:both;"></div>
							</div>
							<table style="" id="joinPersonTable">
								<tr class="firstTr">
									<th style="width:30%;">填写人</th>
									<th style="width:30%;">日期</th>
									<th style="width:20%;">IP地址</th>
									<th style="width:20%;">终端</th>
								</tr>
								<!-- 插入参与人员数据 -->
							</table>
							<div id="getmorePersonnel" style="margin:10px 0;">
								<a href="javascript:;" onClick="getMoreOfJoinPersonData();" class="renovate">
									<span class="renovateTitle">加载更多</span>
								</a>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>	
		
	</div>
	
	<div id="viewQADetails" class="viewQADetails" style="display:none;">
		<div class="viewQADetailsDataBar">
			<div class="viewQADetailsData">用户：李明</div>
			<div class="viewQADetailsData">PC端</div>
			<div class="viewQADetailsData">IP:192.168.1.1</div>
			<div class="viewQADetailsData">2016-10-13 10:10:09</div>
			<div style="clear:both;"></div>
		</div>
		<div style="padding:0 15px;">
			<div class="viewQADetailsSubject">5、问答：你认为什么是原因导致我国男女不平等的现状？</div>
			<textarea rows="4" class="textareContral" disabled="disabled"></textarea>
		</div>
		<div style="text-align:center; margin-top:10px;">
			<input type="button" class="button button-raised button-highlight button_Contral" style="width:180px;" value="关闭">
		</div>
	</div>
	
	 <%@ include file="../common/footer.jsp"%>
	<script>
	 var countStart={
		elem:"#countStart",
		format:"YYYY-MM-DD",
		//min:laydate.now(),
		max:"2099-06-16 23:59:59",
		istime:true,
		istoday:false,
		choose:function(datas){
		//	end.min=datas;
		//	end.start=datas; 
		}
	 };
	 var countEnd={
		elem:"#countEnd",
		format:"YYYY-MM-DD",
		//min:laydate.now(),
		max:"2099-06-16 23:59:59",
		istime:true,
		istoday:false,
		choose:function(datas){
		//	start.max=datas;
		}
	 };
	 laydate(countStart);laydate(countEnd);
	</script>
	<script> 
	 var detailsStart={
		elem:"#detailsStart",
		format:"YYYY-MM-DD",
		//min:laydate.now(),
		max:"2099-06-16 23:59:59",
		istime:true,
		istoday:false,
		choose:function(datas){
		//	end.min=datas;end.start=datas;
		}};
	 var detailsEnd={
		elem:"#detailsEnd",
		format:"YYYY-MM-DD",
		//min:laydate.now(),
		max:"2099-06-16 23:59:59",
		istime:true,
		istoday:false,
		choose:function(datas){
		//	start.max=datas;
		}};
	 laydate(detailsStart);laydate(detailsEnd);	
	</script>
	<script> 
	 var trendStart={
		elem:"#trendStart",
		format:"YYYY-MM-DD",
		//min:laydate.now(),
		max:"2099-06-16 23:59:59",
		istime:true,
		istoday:false,
		choose:function(datas){
		//	end.min=datas;end.start=datas;
		}};
	 var trendEnd={
		elem:"#trendEnd",
		format:"YYYY-MM-DD",
		//min:laydate.now(),
		max:"2099-06-16 23:59:59",
		istime:true,
		istoday:false,
		choose:function(datas){
			//start.max=datas;
		}};
	 laydate(trendStart);laydate(trendEnd);	
	</script>

</body>
</html>
