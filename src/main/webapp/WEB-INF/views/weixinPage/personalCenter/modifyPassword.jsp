<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>修改密码</title>
<link href="${ctx}/static/weixin/css/personalCenter/login.css" rel="stylesheet"/>
</head>
<script type="text/javascript">
//异步提交修改密码
function bindPassWord(){
	  var oldPassWord = $('#oldPassWord').val();
	  var newPassWord = $('#newPassWord').val();
	  var repeatPassWord = $('#repeatPassWord').val();
	  var accountId = '${info.accountId}';
	  if(oldPassWord==null || oldPassWord == ""){
		  tips("原始密码不能为空!");
		  return;
	  }
	  if(newPassWord==null || newPassWord == ""){
		  tips("新密码不能为空!");
		  return;
	  }
	  if(repeatPassWord==null || repeatPassWord == ""){
		  tips("确认密码不能为空!");
		  return;
	  }
	  if(repeatPassWord!=newPassWord){
		  tips("两次密码不一致!");
		  return;
	  }
	  
	  $.ajax({
			url:"${ctx}/personalCenter/updatePassWord",
			type:'get',
			data:{
				'oldPassWord':oldPassWord,
				'newPassWord':newPassWord,
				"accountId":accountId
			},
			success:function(result){
				if(result==1){
					 $('#oldPassWord').val("");
					 $('#newPassWord').val("");
					 $('#repeatPassWord').val("");
					 $('#setPassWord').hide();
					 $('#loginPassword').show();
					tips("密码修改成功！");
					setTimeout(function(){window.location.href="${ctx}/auth/page/mobile/weixin/personalInfoBingding";},500);
				}else{
					tips(result);
				}
			},
			error:function(){
				tips("修改异常!");
			}
		});
}
</script>

<body>
	<div class="login_main" id="loginPassword">
		<div class="input_dataBar">
				<div class="input_data">
					<div class="input_dataLeft">原始密码</div>
					<input type="password" placeholder="请输入密码" class="inputContral" id="oldPassWord">
				</div>
				<div class="input_data">
					<div class="input_dataLeft">新密码</div>
					<input type="password" placeholder="请输入新密码" class="inputContral" id="newPassWord">
				</div>
				<div class="input_data">
					<div class="input_dataLeft">确认密码</div>
					<input type="password" placeholder="请再次输入新密码" class="inputContral" id="repeatPassWord">
				</div>
			</div>
			<div style="padding:8px 7px;">
				<input type="button" value="确认修改" class="buttonContral_red" onclick="bindPassWord();">
			</div>
			<div style="padding:0px 7px 10px;">
				<input type="button" value="返&nbsp;回" onClick="javascript:history.back(-1);" class="buttonContral_white">
			</div>
	</div>
</body>
</html>