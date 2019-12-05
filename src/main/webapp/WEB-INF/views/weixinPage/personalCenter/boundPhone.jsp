<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>绑定手机</title>
<link href="${ctx}/static/weixin/css/personalCenter/login.css" rel="stylesheet"/>
</head>
<script type="text/javascript">
$(function(){
	$("#setTime").hide(); //初始化隐藏 60秒倒计时的重新获取短信验证码
	/* $("#imgContral").hide(); //隐藏是否验证码正确的打勾图标 */
})
//异步提交手机号码修改
function bindingMobilePhone(){
	  var phoneNum = $('#phoneNumber').val();
	  var identifyingCode = $('#identifyingCode').val();
	  var accountId = '${info.accountId}';
	  var phone = /^1([38]\d|4[57]|5[0-35-9]|7[06-8]|8[89])\d{8}$/;
	  if(phoneNum==null || phoneNum == ""){
		  tips("手机号不能为空!");
		  return;
	  }
	  if(identifyingCode==null || identifyingCode == ""){
		  tips("验证码不能为空!");
		/*   $("#imgContral").hide(); */
		  return;
	  }
	   if(!phone.test(phoneNum)){
			layer.open({
				type: 1,
				title:false,
				shadeClose: true,
				shade: [0.3],
				area:['400px','150px'],
				closeBtn:0,
				content: $('#mobilePhoneVer')
			});
			return;
	  } 
	  $.ajax({
			url:"${ctx}/personalCenter/bindingMobilePhone",
			type:'get',
			data:{
				'phoneNum':phoneNum,
				'identifyingCode':identifyingCode,
				"accountId":accountId
			},
			dataType:'json',
			success:function(result){
				if(result==1){
			   $('#phoneNumber').val("");
			   $('#identifyingCode').val("");
			    tips("绑定成功！");
				}else if(result==-1){
					tips("绑定异常！");
				}else{
					tips(result);
				}
			},
			error:function(){
				tips("绑定异常!");
			}
		});
	  
  }
  
//弹窗提醒，手机号码格式是否真确
function mobilePhoneVer(){
 	layer.open({
		type: 1,
		title:false,
		shadeClose: true,
		shade: [0.3],
		area:['400px','150px'],
		closeBtn:0,
		content: $('#mobilePhoneVer')
	});
 };
 
//校验输入手机号是否合法并且异步获取手机验证码
function getIdentifyingCode(){
	  var phoneNum = $('#phoneNumber').val();
	  var phone = /^1([38]\d|4[57]|5[0-35-9]|7[06-8]|8[89])\d{8}$/;
	  /* var phone = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;*/
	  if(phoneNum==null || phoneNum == ""){
		  tips("手机号不能为空!");
		  return;
	  }
	  if(!phone.test(phoneNum)){
			layer.open({
				type: 1,
				title:false,
				shadeClose: true,
				shade: [0.3],
				area:['400px','150px'],
				closeBtn:0,
				content: $('#mobilePhoneVer')
			});
			return;
	  } 
	  $.ajax({
			url:"${ctx}/session/json/shortMessageCaptcha",
			type:'get',
			data:{'mobilePhone':phoneNum},
			dataType:'json',
			success:function(result){
				$("#getCode").hide();
				if(result.success==true){
					tips("验证码已发送到您的手机上,请注意查收!");
					/* 60秒倒计时的重新获取短信验证码 */
					$('.getIdentifyingCode').css({color:'#ccc'});
					$('.getIdentifyingCode').css({border:'1px solid #ccc'});
					var time = 60;
					var t = setInterval(function(){
						time--;
						$("#setTime").show();
						/* $("#imgContral").show(); */
						if(time==0){
							$('.getIdentifyingCode').css({color:'#f00'});
							$('.getIdentifyingCode').css({border:'1px solid #f00'});
							$("#getCode").show();
							$("#setTime").hide();
							/* $("#imgContral").hide(); */
							window.clearInterval(t);	
						}else{
							$("#setTime").text(time+"秒重新发送");
						}
					}, 1000);
				}else{
					tips("发送失败!");
				}
			},
			error:function(){
				tips("发送异常!");
			}
		});
}

</script>
<body>
	<div class="login_main" >
		<div>
			<div class="input_dataBar">
				<div class="input_data">
					<div class="input_dataLeft">手机号</div>
					<input type="text" placeholder="请输入手机号" class="inputContral" id="phoneNumber" maxlength="11">
					<div class="obtainVerification" style="color:#f00;float: right;border:1px solid #f00;" onclick="getIdentifyingCode();" id="getCode">获取验证码</div>
					<div id="setTime" class="obtainVerification" style="color:#ccc;"></div>
				</div>
				<div class="input_data">
					<div class="input_dataLeft">验证码</div>
					<input type="text" placeholder="请输入短信验证码" class="inputContral" id="identifyingCode" maxlength="4">
					<%-- <img src="${ctx}/static/weixin/images/personalCenter/check.png" width="15px;" height="15px;" id="imgContral" class="imgContral"> --%>
				</div>
			</div>
			<div style="padding:8px 7px;">
				<input type="button" value="绑&nbsp;定" class="buttonContral_red" onclick="bindingMobilePhone();">
			</div>
			<div style="padding:0px 7px 10px;">
				<input type="button" value="返&nbsp;回" onClick="javascript:history.back(-1);" class="buttonContral_white">
			</div>
		</div>
	</div>
	<div id="mobilePhoneVer" style="display:none; text-align:center; margin:30px 0;">
		<img src="${ctx}/static/image/personalCenter/headPortrait.png" width="70px" height="70px" style="vertical-align:middle;">
		<span style="vertical-align:middle; font-weight:bold; margin-left:20px;">请输入有效手机号码</span>
	</div>
</body>
</html>
