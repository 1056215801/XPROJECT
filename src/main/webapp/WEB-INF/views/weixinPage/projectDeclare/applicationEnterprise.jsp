<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_mobile.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>申报企业</title>
<link href="${ctx}/static/weixin/css/projectDeclare/applicationEnterprise.css" rel="stylesheet"/>
<script src="${ctx}/static/weixin/js/jquery.js"></script>
</head>
<script>
	$(function() {
		var url = location.search; //获取url中"?"符后的字串
	    var theRequest = new Object();
		if(url.indexOf("myDeclareId") != -1){
			$('#back_a').attr("href","${ctx}/projectDeclare/weixin/view/"+url.split("myDeclareId=")[1]);
			$('#accountId').val("1");
		}else if (url.indexOf("?") != -1) {
	    	$('#back_a').attr("href","${ctx}/projectDeclare/weixin/view/"+url.split("declareId=")[1]);
	        var str = url.substr(1);
	        declareId = str.split("=")[1];
	        $('#declareId').val(declareId);
	    }
		
	    /* 异步获取项目信息（统计） */
		//getProjectInfo();
	    
		$('#type').val("");
		changeType(0);
		
		$('#tbox').hide();//隐藏小火箭
		$('#getMore').hide();//隐藏加载更多
		
	})
	
	 function getApplyComp(){
		 $('#projectList').empty();
		 getApplyList(1,10,"");
	 }
	 function getmyApplyComp(){
		 $('#projectList').empty();
		 getApplyList(1,10,"1");
	 }
	
	 /* 异步获取项目信息（统计） */
	  function getProjectInfo(){
		 $.ajax({
				url:"${ctx}/projectDeclare/json/list",
				type:"get",
				data:$('#getListForm').serialize(),
				dataType:"json",
				success:function(result){
					var info = result.value[0];
					if(result.code==1 || result.code == 0 ){
						$('#projectTitle').html(info.declareTitle);
						$('#num1').html(info.applyCount);
						$('#num2').html(info.auditingApplyCount);
						$('#num3').html(info.auditedApplyCount);
					}else{
						layer.msg("获取数据失败");
					}
				},
				error:function(){
					layer.alert("系统异常");
				}
		 });
	 }

	 
	 
	 
	 
	/* 异步获取申报企业 */
	pageNumber=1;
	function getApplyList(){//获取申报企业列表
	 $.ajax({
			url:"${ctx}/projectDeclare/json/applylist",
			type:"post",
			data:$('#getListForm').serialize(),
			dataType:"json",
			success:function(result){
				
				var list = result.value;
				if (result.code == 1 || result.code == 0) {
					for (var i = 0; i < list.length; i++) {
						var info = list[i];
						var newTime = formatCSTDate(new Date(info.createTime),"yyyy-MM-dd");
						var _divList= '<div class="enterprise_data">'
							+'<div class="enterprise_dataTitle">'
							+ info.companyName
							+'</div><div class="enterprise_dataAttr">联系人：'
							+ info.accountName
							+'&nbsp;&nbsp;'
							+ info.accountTel
							+'</div><div class="enterprise_dataAttr">'
							+'<div class="enterprise_dataTime">'
							+ newTime
							+'</div>';
						if(info.applyStatus==0){
							_divList+='<div class="enterprise_dataStateGray">未通过</div>';
						}else if(info.applyStatus==1){
							_divList+='<div class="enterprise_dataStateRed">通过</div>';
						}else{
							_divList+='<div class="enterprise_dataStateBlue">待审核</div>';
						}
						_divList+='<div style="clear:both;"></div></div></div>';
						$("#projectList").append(_divList);
					}
					$("#proList").hide();
				} else if (result.code == 2) {
					$("#proList").show();
				} else {
					$("#proList").hide();
					layer.msg("获取数据失败");
				}
				if (result.code != 1) {
					$('#getMore').hide();
				} else {
					$('#getMore').show();
				}
			},
			error:function(){
				layer.alert("系统异常");
			}
	 });
 }
	/* 加载更多 */
	function getMore() {
		pageNumber++;
		$('#pageNum').val(pageNumber);
		getMyApplicationList();
	}
	
	
	/* 搜索供需类型 */
	currentType = 0;//0全部 1待审核 2通过 3未通过
	function changeType(i) {
		$("#projectList").empty();
		$('#typeBtn_' + currentType).removeClass("select_oper");
		currentType = i;
		$('#typeBtn_' + i).addClass("select_oper");
		$('#status').val(i==0?"":3-i);
		$('#pageNum').val(1);
		/* 异步获取申报企业 */
		getApplyComp();
	}
	
	//格式化CST日期的字串
    function formatCSTDate(strDate,format){
      return formatDate(new Date(strDate),format);
    }
	 //格式化日期,
    function formatDate(date,format){
      var paddNum = function(num){
        num += "";
        return num.replace(/^(\d)$/,"0$1");
      }
      //指定格式字符
      var cfg = {
         yyyy : date.getFullYear() //年 : 4位
        ,yy : date.getFullYear().toString().substring(2)//年 : 2位
        ,M  : date.getMonth() + 1  //月 : 如果1位的时候不补0
        ,MM : paddNum(date.getMonth() + 1) //月 : 如果1位的时候补0
        ,d  : date.getDate()   //日 : 如果1位的时候不补0
        ,dd : paddNum(date.getDate())//日 : 如果1位的时候补0
        ,hh : date.getHours()  //时
        ,mm : date.getMinutes() //分
        ,ss : date.getSeconds() //秒
      }
      format || (format = "yyyy-MM-dd hh:mm:ss");
      return format.replace(/([a-z])(\1)*/ig,function(m){return cfg[m];});
    } 
</script>
<body>
<form id="getListForm">
	<input type='hidden' name='pageNum' id='pageNum' value='1'></input>
	<input type='hidden' name='pageSize' value='10'></input>
	<input type='hidden' name='declareId' id='declareId' value=''></input>
	<input type='hidden' name='accountId' id='accountId' value=''></input>
	<input type='hidden' name='type' id='type' value='0'></input>
	<input type='hidden' name='status' id='status' value=''></input>
	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
</form>
<div class="enterprise_main">
	<div class="enterprise_content">
	<!-- <div class="projectCont"></div> -->
		<div class="enterpriseDataBar" style="padding:18px 15px;">
			<div id="projectTitle" class="projectTitle" style="padding: 8px;">&nbsp;</div>
			<div class="projectData">
				<div class="projectDataLeft">申报企业：</div>
				<div class="projectDataRight"><font id="num1" style="color:#f14342;">&nbsp;${auditNum}&nbsp;</font>家</div>
				<div class="projectDataLeft">待审核：</div>
				<div class="projectDataRight"><font id="num2" style="color:#f14342;">&nbsp;${noPassNum}&nbsp;</font>家</div>
				<div class="projectDataLeft">通过审核：</div>
				<div class="projectDataRight"><font id="num3" style="color:#f14342;">&nbsp;${passNum}&nbsp;</font>家</div>
			</div>
			<div style="clear:both;"></div>
			<img src="../../static/weixin/images/projectDeclare/recommend.png" width="47px;" height="47px;" class="recommendItem">
		</div>
		<div class="info_top">
			<div class="info_title">申报企业</div>
		</div>
		<div class="project_operBar">
			<div id="typeBtn_0" style="width:15%;" class="project_oper borRight select_oper" onclick="changeType(0);">全部</div>
			<div id="typeBtn_1" style="width:20%;" class="project_oper borRight" onclick="changeType(1);">待审核</div>
			<div id="typeBtn_2" style="width:15%;" class="project_oper borRight" onclick="changeType(2);">通过</div>
			<div id="typeBtn_3" style="width:20%;" class="project_oper borRight" onclick="changeType(3);">未通过</div>
			<div style="width:28%;" class="project_oper"></div>
			<div style="clear:both;"></div>
		</div>
		<div style="background-color:#fff;">
			<div class="enterprise_dataBar">
				<div id="projectList"></div>
			</div>
			
			<div style="text-align: center;">
				<span id="proList" class="renovateTitle">暂无数据</span>
			</div>
		</div>
	</div>
	
			<!-- 手机端下拉加载更多 getMore -->
			<%@ include file="../common/getMore.jsp"%>
	<div id="tbox">
		<a id="gotop" href="#top"></a>
	</div>
	
	<div class="fixed_bottom">
		<a id="back_a" href="javascript:history.go(-1);">
			<img src="../../static/weixin/images/projectDeclare/return.png" width="20px;" height="20px;" class="returnBtn"/>
		</a>
		<div class="bottom_operation tipsBar">
			<div class="tipsLeft">温馨提示：</div>
			<div class="tipsRight">审核企业、下载企业上报资料请登录电脑端进行查看操作</div>
		</div>
		<div style="clear:both;"></div>
	</div>
</div>
</body>
</html>
