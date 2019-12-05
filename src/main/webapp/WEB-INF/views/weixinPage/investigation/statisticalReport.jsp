<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>统计报表</title>
<link href="${ctx}/static/weixin/css/investigation/statisticalReport.css" rel="stylesheet" />
<link href="${ctx}/static/weixin/css/iCheck/custom.css" rel="stylesheet" />
<script src="${ctx}/static/weixin/js/iCheck/icheck.min.js"></script>
</head>
<style>

</style>
<script>
$(function(){
	getList("${infoBean.id}",1);
	$('#getMore').hide();
	
	/* radio样式 */
	$(".i-checks").iCheck({
		disabledCheckboxClass : "icheckbox_square-green hideCheckBox",
		disabledRadioClass : "iradio_square-green hideCheckBox"
	});
	
})
	//获取调查列表
	pageNumber = 1;
	num = 1;
	function getList(id,pageNum){
		//标题序号
		var n = (pageNum - 1)*2+1;
		var startDate = $('#countStart').val()==null?"":$('#countStart').val();
		var endDate = $('#countEnd').val()==null?"":$('#countEnd').val();
		$.ajax({
			url:"${ctx}/investigation/json/getStatisticsDetailResult",
			type:"get",
			data:{
				"pageNum":pageNum,
				"id":id,
				"pageSize":10,
				"startDate":startDate,
				"endDate":endDate
			},
			dataType:"json",
			success:function(result){
				if(pageNum==1){
					$("#reportDeatails").empty();
				}
				if(result.code==-1){
					layer.alert(result.msg);
				}else if(result.code==2){
					layer.msg(result.msg);
				}else{
					var total = result.jsonValue1;
					if(total.countBrowse!="" && total.countBrowse!=null &&total.countBrowse!=0){
						$("#browseNum").html(total.countBrowse);//数据量
						if(total.countExampleSum!="" && total.countExampleSum!=null){
							$("#inputNum").html(total.countExampleSum);//浏览量
						}else{
							$("#inputNum").html("0");
						}
						var percent = (Number(total.countExampleSum)/Number(total.countBrowse)*100).toFixed(2);
						if(percent!="" && percent!=null){
							$("#inputPercent").html(percent+"%");//填写率
						}else{
							$("#inputPercent").html("0%");
						}
					}else{
						$("#browseNum").html("0");
						$("#inputNum").html("0");
						$("#inputPercent").html("0%");
					}
					
					var list = result.value;
					var resultMap = result.jsonValue;
					var colors = ["#37B0FF","#78CBFF","#B3E2FF","#FF8500","#FFA749","#FFC17E","#39D800","#FF567A"];
					for(var i=0; i<list.length;i++){
						var item = list[i];
						var _div = "";
						if(item.inputType=='radio'){//单选
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
									_div += "<div class=\"survey_percentageStrip\" style=\"width:"+(Number(resultMap[key].split("_")[1]))/100*100+"px; background-color:"+colors[j%8]+";\"></div>";
									_div += "<div class=\"survey_percentage\">"+(Number(resultMap[key].split("_")[1]))+"%</div>";
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
									_div += "<div class=\"survey_percentageStrip\" style=\"width:"+(Number(resultMap[key].split("_")[1]))/100*100+"px; background-color:"+colors[j%8]+";\"></div>";
									_div += "<div class=\"survey_percentage\">"+(Number(resultMap[key].split("_")[1]))+"%</div>";
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
						if(item.inputType=='text'){
							_div += "<div class=\"survey_subject\">"+num+"、"+item.inputTitle+"</div>";
							num++;
							_div += "<div class=\"survey_optionBar\">";
							_div += "<div class=\"survey_option\" style=\"margin-left: 10px;\" onclick=\"viewQuestionDetails('"+item.inputId+"',"+item.inputTrue+");\">";
							_div += "<img src=\"${ctx}/static/weixin/images/investigation/list.png\" width=\"20px\" height=\"20px\" style=\"vertical-align:middle;\">";
							_div += "<span style=\"vertical-align:middle; color:#37B0FF; margin-left:5px;\">查看详细填写结果</span>";
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
							_div += "<div class=\"survey_option\" style=\"margin-left: 10px;\" onclick=\"viewQuestionDetails('"+item.inputId+"',"+item.inputTrue+");\">";
							_div += "<img src=\"${ctx}/static/weixin/images/investigation/list.png\" width=\"20px\" height=\"20px\" style=\"vertical-align:middle;\">";
							_div += "<span style=\"vertical-align:middle; color:#37B0FF; margin-left:5px;\">查看详细填写结果</span>";
							_div += "</div>";
							_div += "</div>";
							_div += "<div style=\"text-align:right\">";
							_div += "<font style=\"color:#37B0FF; font-size:24px; font-weight:bold;\">"+item.inputTrue+"</font>人作答("+item.examplePrc+"%)";
							_div += "</div>";
						}
						$("#reportDeatails").append(_div);
					}
				}
				if (result.code != 1) {
					$('#getMore').hide();
				} else {
					$('#getMore').show();
				}
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
				alert("网络异常");
			} 
		}); 
	}
	/* 加载更多 */
	function getMore() {
		pageNumber++;
		getList("${infoBean.id}",pageNumber);
	}
	
	/* 查看文本题回答详情 */
	function viewQuestionDetails(inputId,num){
		if(num>0){
			$('#inputId').val(inputId);
			$('#surveyId').val("${infoBean.id}");
			$("#detailsForm").submit();
		}else{
			layer.msg("这道题无人回答");
		}
	}
	
</script>
<body>
	<!-- 查看文本题详情传参 -->
	<form id="detailsForm" action="${ctx}/investigation/weixin/questionDetails" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type='hidden' name='inputId' id='inputId' value=''></input>
		<input type='hidden' name='surveyId' id='surveyId' value=''></input>
	</form>

	<div class="statistical_main">
		<div class="statistical_content">
			<!-- 问卷概况 -->
			<div class="surveyDataBar">
				<div class="surveyTitle">${infoBean.getInvestigationName()}</div>
				<div class="surveyDataContral">
					<div style="float: left; margin-right: 20px;">发布人：${infoBean.getAccountName()}</div>
					<div style="float: left;">阅读：${browseLogCount}</div>
					<div style="clear: both;"></div>
				</div>
				<div class="surveyDataContral">
					<img src="${ctx}/static/weixin/images/activity/time.png" width="15px" height="15px" style="vertical-align: middle;"> <span
						style="vertical-align: middle;"> <fmt:formatDate value="${infoBean.getPublishTime()}" pattern="yyyy-MM-dd HH:mm" /> 至
						<fmt:formatDate value="${infoBean.getEndTime()}" pattern="yyyy-MM-dd HH:mm" />
					</span>
				</div>
				<div style="position: relative; padding: 5px 0;">
					<img src="${ctx}/static/weixin/images/activity/applyname.png" width="15px" height="15px" style="vertical-align: middle;">
					<span class="surveyPop">参与人气<font style="color: #f1921c;">${joinCount}</font>人
					</span>
					<div class="surveyStateYellow">进行中</div>
				</div>
			</div>

			<!-- 时间段 -->
			<div class="surveyDataBar" style="padding: 7px 3%;">
				<div style="float: left; font-weight: bold;">数据统计时间段</div>
				<div style="float: right;">
					<input id="countStart" class="laydate-icon form-control layer-date" value="<fmt:formatDate value="${infoBean.getPublishTime()}" pattern="yyyy-MM-dd" />" style="float: left; width: 40%;" disabled="disabled">
					<div class="connect" style="width: 4%; text-align: center;">至</div>
					<input id="countEnd" class="laydate-icon form-control layer-date" value="<fmt:formatDate value="${infoBean.getEndTime()}" pattern="yyyy-MM-dd" />" style="float: left; width: 40%" disabled="disabled">
				</div>
				<div style="clear: both;"></div>
			</div>
			
			<!-- 统计结果 -->
			<div class="surveyDataBar" style="padding: 0;">
				<div class="statisticalBlock">
					<div class="statisticalBlockCont">
						<div class="statisticalBlockAttr">数据量</div>
						<div class="statisticalBlockValue" id="inputNum"></div>
					</div>
					<div class="statisticalBlockCont">
						<div class="statisticalBlockAttr">浏览量</div>
						<div class="statisticalBlockValue" id="browseNum"></div>
					</div>
					<div class="statisticalBlockContLast">
						<div class="statisticalBlockAttr">填写率</div>
						<div class="statisticalBlockValue" id="inputPercent"></div>
					</div>
				</div>
			</div>
			
			
			<div class="surveyDataBar" style="padding-bottom: 5px;">
				<!-- 数据详情 -->
				<div id="reportDeatails"></div>
				
				<!-- 手机端下拉加载更多 getMore -->
				<%@ include file="../common/getMore.jsp"%>
			</div>
			
			<!-- 小火箭 -->
			<div id="tbox" onclick="location.href='#top';"></div>
		</div>
	</div>
	<!-- 返回前页 -->
	<a href="${ctx}/investigation/weixin/myList?se=2"> <img src="${ctx}/static/weixin/images/investigation/return.png" width="40px"
		height="40px" style="position: fixed; top: 3px; right: 5px;">
	</a>
	</div>
</body>
</html>
