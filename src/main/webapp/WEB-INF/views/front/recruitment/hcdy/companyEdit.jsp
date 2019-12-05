<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>企业信息完善</title>
<link href="${ctx}/static/css/experienceSharing/experienceSharing.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/css/jquery.searchableSelect.css" />
<link href="${ctx}/static/css/logistics/logisticsPlatform.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${ctx}/static/js/jquery.searchableSelect.js"></script>
<style type="text/css">
.searchable-select-holder {
	box-shadow: none;
}
</style>
<script>
	$(function() {
		$('.tabItem').children().eq(0).css({
			'display' : 'none'
		});
		$('.tabItem').children().eq(1).css({
			'display' : 'block'
		});
		$(".tabName ul li").each(
				function() {
					var index = $(this).index();
					$(".tabName ul li").eq(1).addClass("nameClick");
					$(this).click(
							function() {
								$(this).addClass("nameClick").siblings()
										.removeClass("nameClick");
								$(".tabItem>ul").eq(index).stop(true).show()
										.siblings().stop(true).hide();
							});
				});
		$(".tabItem ul li").each(
				function() {
					$(".tabItem ul li").eq(8).addClass("itemClick");
					$(this).click(
							function() {
								$(this).addClass("itemClick").siblings()
										.removeClass("itemClick");
							});
				});
		$(".releaseName ul li").each(
				function() {//页面内容切换控制
					var index = $(this).index();
					$(".releaseName ul li").eq(0).addClass("releaseClick");
					$(this).click(
							function() {
								$(this).addClass("releaseClick").siblings()
										.removeClass("releaseClick");
								$(".releaseItem>div").eq(index).stop(true)
										.show().siblings().stop(true).hide();
							});
				});
	});
</script>

</head>

<body>
	<div class="share_main">
		<div class="project_header">
			<%@ include file="../../common/header.jsp"%>
		</div>
		<div class="release_content">
			<div class="releaseName">
				<ul>
					<li><a href="javascript:;">信息完善</a></li>
				</ul>
				<div style="clear: both;"></div>
			</div>
			<div class="releaseItem">
				<div>
					<div class="release_inputBar">
						<form action="${ctx}/front/recruitment/hcdy/save" id="form" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<input type="hidden" id="organizationId" name="organizationId" value="${rootInfoBean.organizationId}" />
							<input type="hidden" id="pcName" name="pcName" value="${rootInfoBean.organizationName}" />
							<input type="hidden" id="scale" name="scale" />
							<input type="hidden" id="nature" name="nature" />
							<input type="hidden" id="business" name="business" />
							<div id="wanjiBasic">
								<div class="release_input clearfix">
									<font class="redStar">*</font><span class="release_attr">企业名称</span>
									<input type="text" class="inputBox" style="width: 70%;"
										id="positionName" name="positionName" placeholder="请输入职位名称"
										value="${rootInfoBean.organizationName}" readonly="readonly"/>
								</div>
								<div class="release_input clearfix">
									<font class="redStar">*</font> <span class="release_attr">行业类别</span>
									<span style="margin-left: 15px;"> <select
										id="industryTypeP" class="screenRegion" style="width: 25%;"><option
												value="-1">-请选择-</option></select><select id="industryTypeC"
										class="screenRegion" style="width: 25%;" disabled><option
												value="-1">-请选择-</option></select> 
									</span>
								</div>
								<div class="release_input clearfix">
									<font class="redStar">*</font> <span class="release_attr">企业规模</span>
									<div class="searchOptionsRel clearfix" id="scale_S">
										<div class="searchOptions selected" data="12111000"
											onclick="selectTag('scale_S',this)">1-20人</div>
										<div class="searchOptions" data="12112000"
											onclick="selectTag('scale_S',this)">21-50人</div>
										<div class="searchOptions" data="12113000"
											onclick="selectTag('scale_S',this)">51-100人</div>
										<div class="searchOptions" data="12114000"
											onclick="selectTag('scale_S',this)">101-500人</div>
										<div class="searchOptions" data="12115000"
											onclick="selectTag('scale_S',this)">500人以上</div>
										<div style="clear: both;"></div>
									</div>
								</div>
								<div class="release_input clearfix">
									<font class="redStar">*</font> <span class="release_attr">企业性质</span>
									<div class="searchOptionsRel clearfix" id="nature_S">
										<div class="searchOptions selected" data="22184000"
											onclick="selectTag('nature_S',this)">外资（欧美）</div>
										<div class="searchOptions" data="22185000"
											onclick="selectTag('nature_S',this)">外资（非欧美）</div>
										<div class="searchOptions" data="22186000"
											onclick="selectTag('nature_S',this)">合资</div>
										<div class="searchOptions" data="22187000"
											onclick="selectTag('nature_S',this)">国企</div>
										<div class="searchOptions" data="22188000"
											onclick="selectTag('nature_S',this)">民营公司</div>
										<div class="searchOptions" data="22189000"
											onclick="selectTag('nature_S',this)">国内上市公司</div>
										<div class="searchOptions" data="22190000"
											onclick="selectTag('nature_S',this)">事业单位</div>
										<div class="searchOptions" data="22191000"
											onclick="selectTag('nature_S',this)">非盈利机构</div>
										<div class="searchOptions" data="54080000"
											onclick="selectTag('nature_S',this)">股份有限公司</div>
										<div class="searchOptions" data="22192000"
											onclick="selectTag('nature_S',this)">其他性质</div>
										<div style="clear: both;"></div>
									</div>
								</div>
								<div class="release_input clearfix">
									<font class="redStar">*</font><span class="release_attr">企业邮箱</span>
									<input type="text" class="inputBox" style="width: 70%;"
										id="email" name="email" placeholder="请输入邮箱"/>
								</div>
								<div class="release_input clearfix">
									<font class="redStar">*</font><span class="release_attr">手机号码</span>
									<input type="text" class="inputBox" style="width: 70%;"
									onkeyup='onlyNum(this)' onafterpaste='onlyNum(this)' maxlength="11" 
										id="phone" name="phone" placeholder="请输入手机号码"/>
								</div>
								<!-- <div class="release_input clearfix">
									<font class="redStar">*</font><span class="release_attr">账号密码</span>
									<input type="text" class="inputBox" style="width: 70%;"
										id="pwd" name="pwd" placeholder="请输入账号密码" value="888888"/>
								</div> -->
								<input type="hidden" class="inputBox" style="width: 70%;"
										id="pwd" name="pwd" placeholder="请输入账号密码" value="888888"/>
								<div class="release_input clearfix">
									<font class="redStar">*</font><span class="release_attr">企业地址</span>
									<input type="text" class="inputBox" style="width: 70%;"
										id="address" name="address" placeholder="请输入企业地址"/>
								</div>
								<div class="release_input clearfix">
									<font class="redStar">&nbsp;</font><span class="release_attr">用户姓名</span>
									<input type="text" class="inputBox" style="width: 70%;"
										id="userName" name="userName" placeholder="请输入用户姓名"/>
								</div>
								<div class="release_input clearfix">
									<font class="redStar">&nbsp;</font> <span class="release_attr">公司介绍</span>
									<span style="margin-left: 15px;">
										<textarea style="width: 70%;height: 150px;" rows="" cols="" maxlength="1000" id="introduce" name="introduce"></textarea>
									</span>
								</div>
						</form>
						<div style="padding-right: 76px;">
							<input type="button" value="返回" id="returnBtn" onclick="window.location.href='${ctx}/front/recruitment/hcdy/main'"
								class="greenBtnContral" style="background-color: #CCC; margin:0 10px;">
							<input type="button" value="保存" id="saveBtn" onclick="save();"
								class="greenBtnContral">
							<div style="clear: both;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<%@ include file="../../common/footer.jsp"%>
</body>
<script type="text/javascript" src="${ctx}/static/js/recruitment/hcdyIndustry.js"></script>
<script type="text/javascript">
$(function(){
	var rootInfoBean = '${rootInfoBean}';
	if(rootInfoBean==null||rootInfoBean==""){
		layer.msg("请先完善个人企业信息！");
		setTimeout(function(){
			window.location.href='${ctx}/personalCenter/companyEdit?url=2';
		},2000);
	}
	
	
	industryType();
	
	$("#industryTypeP").change(function(){
		$("#industryTypeC").empty();
		$("#industryTypeC").append('<option value="-1">-请选择-</option>');
		if($(this).val()==-1){
			$("#industryTypeC").attr("disabled","disabled");
		}else{
			$("#industryTypeC").removeAttr("disabled");
			
			for(var i=0;i<industryJson.industryList.length;i++){
				if(industryJson.industryList[i].code==$(this).val()){
					for(var j=0;j<industryJson.industryList[i].children.length;j++){
						var _option = '<option value="'+industryJson.industryList[i].children[j].code+'">'+industryJson.industryList[i].children[j].name+'</option>';
						$("#industryTypeC").append(_option);
					}
				}
			}
		}
	});
	
	
});

//标签选择
function selectTag(id, obj){
	$("#"+id+" .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}
	});
	$(obj).addClass("selected");
}

//发布保存
function save(){
	if(validate()){
		$.ajax({
			url:"${ctx}/json/recruitment/hcdy/createCompany",
			type:"post",
			data:$("#form").serialize(),
			success:function(result){
				if(result.errorCode==0){
					layer.msg("保存成功！");
					setTimeout(function(){
						window.location.href="${ctx}/front/recruitment/hcdy/publish";
					},1000);
				}else{
					layer.msg("保存失败，错误代码："+result.errorMsg);
				}
			},
			error:function(){
				layer.msg("系统加载超时，请稍后重试！");
			}
		});
		 
	} 
}

//校验
function validate(){
	var business = $("#industryTypeP option:selected").val();
	if(business==-1){
		layer.msg("请选择行业类别！");
		return false;
	}else{
		business = $("#industryTypeC option:selected").val();
		if(business==-1){
			business = $("#industryTypeP option:selected").val();
		}
		$("#business").val(business);
	}
	
	$("#scale_S .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			$("#scale").val($(this).attr("data"));
		}
	});
	
	$("#nature_S .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			$("#nature").val($(this).attr("data"));
		}
	});
	
	
	var email = $("#email").val();
	if(email==null||email==""){
		layer.msg("请输入企业邮箱！");
		return false;
	}
	
	var phone = $("#phone").val();
	if(phone==null||phone==""){
		layer.msg("请输入手机号码！");
		return false;
	}
	
	var pwd = $("#pwd").val();
	if(pwd==null||pwd==""){
		layer.msg("请输入账号密码！");
		return false;
	}
	
	var address = $("#address").val();
	if(address==null||address==""){
		layer.msg("请输入企业地址！");
		return false;
	}
	
	return true;

}

//行业类别
function industryType(){
	var industryType = industryJson.industryList;
	for(var i=0;i<industryType.length;i++){
		var _option = '<option value="'+industryType[i].code+'">'+industryType[i].name+'</option>';
		$("#industryTypeP").append(_option);
	}
}

</script>
</html>
