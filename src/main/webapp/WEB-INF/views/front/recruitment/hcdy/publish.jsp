<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>发布职位</title>
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
					<li><a href="javascript:;">发布职位</a></li>
				</ul>
				<div style="clear: both;"></div>
			</div>
			<div class="releaseItem">
				<div>
					<div class="release_inputBar">
						<form action="${ctx}/front/recruitment/hcdy/save" id="form" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<input type="hidden" id="id" name="id" value="${info.id}" />
							<input type="hidden" id="positionId" name="positionId" value="${info.positionId}" />
							<input type="hidden" id="type" name="type" value="${info.type}" />
							<!-- 行业类别 -->
							<input type="hidden" id="industryType" name="industryType" value="${info.industryType}" />
							<input type="hidden" id="industryTypeName" name="industryTypeName" value="${info.industryTypeName}" />
							<!-- 工作性质 -->
							<input type="hidden" id="workNature" name="workNature" value="${info.workNature}" />
							<input type="hidden" id="workNatureName" name="workNatureName" value="${info.workNatureName}" />
							<!-- 工作地点 -->
							<input type="hidden" id="workArea" name="workArea" value="${info.workArea}">
							<input type="hidden" id="workAreaName" name="workAreaName" value="${info.workAreaName}">
							<!-- 薪资 -->
							<input type="hidden" id="pay" name="pay" value="${info.pay}">
							<input type="hidden" id="payName" name="payName" value="${info.payName}">
							<!-- 工作年限 -->
							<input type="hidden" id="workYear" name="workYear" value="${info.workYear}">
							<input type="hidden" id="workYearName" name="workYearName" value="${info.workYearName}">
							<!-- 学历 -->
							<input type="hidden" id="diploma" name="diploma" value="${info.diploma}">
							<input type="hidden" id="diplomaName" name="diplomaName" value="${info.diplomaName}">
							
							<input type="hidden" id="positionTags" name="positionTags" value="${info.positionTags}">
							
							<input type="hidden" id="operationType" name="operationType" value="1">
							
							<div id="wanjiBasic">
								<div class="release_input clearfix">
									<font class="redStar">*</font><span class="release_attr">职位名称</span>
									<input type="text" class="inputBox" style="width: 25%;"
										id="positionName" name="positionName" placeholder="请输入职位名称"
										value="${info.positionName}" />
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
									<font class="redStar">*</font> <span class="release_attr">工作性质</span>
									<div class="searchOptionsRel clearfix" id="workNature_S">
										<div class="searchOptions selected" data="12044000"
											onclick="selectTag('workNature_S',this)">全职</div>
										<div class="searchOptions" data="12045000"
											onclick="selectTag('workNature_S',this)">兼职</div>
											<div class="searchOptions" data="12046000"
											onclick="selectTag('workNature_S',this)">实习</div>
										<div style="clear: both;"></div>
									</div>
								</div>
								<div class="release_input clearfix">
									<font class="redStar">*</font> <span class="release_attr">工作地点</span>
									<span style="margin-left: 15px;"> <select
										id="workAreaP" class="screenRegion" style="width: 25%;"><option
												value="-1">-请选择-</option></select><select id="workAreaC"
										class="screenRegion" style="width: 25%;" disabled><option
												value="-1">-请选择-</option></select> 
									</span>
								</div>
								<div class="release_input clearfix">
									<font class="redStar">*</font> <span class="release_attr">职位描述</span>
									<span style="margin-left: 15px;">
										<textarea style="width: 70%;height: 150px;" rows="" cols="" maxlength="1000" id="describe" name="describe">${info.describe}</textarea>
									</span>
								</div>
								<div class="release_input clearfix">
									<font class="redStar">*</font> <span class="release_attr" maxlength="1000">职位要求</span>
									<span style="margin-left: 15px;">
										<textarea style="width: 70%;height: 150px;" rows="" cols="" id="demand" name="demand">${info.demand}</textarea>
									</span>
								</div>
								<div class="release_input clearfix">
									<font class="redStar">*</font><span class="release_attr">招聘人数</span>
									<input type="text" class="inputBox" style="width: 25%;"
										id="count" name="count" placeholder="请输入招聘人数" 
										onkeyup='onlyNum(this)' onafterpaste='onlyNum(this)' maxlength="6"
										value="${info.count}" />
								</div>
								<div class="release_input clearfix">
									<font class="redStar">*</font> <span class="release_attr">薪资</span>
									<div class="searchOptionsRel clearfix" id="pay_S">
										<div class="searchOptions selected" data="53960000"
											onclick="selectTag('pay_S',this)">5万以下</div>
										<div class="searchOptions" data="22530000"
											onclick="selectTag('pay_S',this)">5-8万</div>
										<div class="searchOptions" data="22520000"
											onclick="selectTag('pay_S',this)">8-12万</div>
										<div class="searchOptions" data="53970000"
											onclick="selectTag('pay_S',this)">12-15万</div>
										<div class="searchOptions" data="12021000"
											onclick="selectTag('pay_S',this)">15-20万</div>
										<div class="searchOptions" data="12022000"
											onclick="selectTag('pay_S',this)">20-25万</div>
										<div class="searchOptions" data="53950000"
											onclick="selectTag('pay_S',this)">25-30万</div>
										<div class="searchOptions" data="12023000"
											onclick="selectTag('pay_S',this)">30-40万</div>
										<div class="searchOptions" data="12025000"
											onclick="selectTag('pay_S',this)">40-50万</div>
										<div class="searchOptions" data="12026000"
											onclick="selectTag('pay_S',this)">50-100万</div>
										<div class="searchOptions" data="12027000"
											onclick="selectTag('pay_S',this)">100万以上</div>
										<div style="clear: both;"></div>
									</div>
								</div>
								<div class="release_input clearfix">
									<font class="redStar">&nbsp;</font> <span class="release_attr">工作年限</span>
									<div class="searchOptionsRel clearfix" id="workYear_S">
										<div class="searchOptions" data="12050000"
											onclick="selectTag('workYear_S',this)">应届生</div>
										<div class="searchOptions" data="12051000"
											onclick="selectTag('workYear_S',this)">1年</div>
										<div class="searchOptions" data="12052000"
											onclick="selectTag('workYear_S',this)">1-3年</div>
										<div class="searchOptions" data="12053000"
											onclick="selectTag('workYear_S',this)">3-5年</div>
										<div class="searchOptions" data="12054000"
											onclick="selectTag('workYear_S',this)">5-10年</div>
										<div class="searchOptions" data="21770000"
											onclick="selectTag('workYear_S',this)">10年以上</div>
										<div style="clear: both;"></div>
									</div>
								</div>
								<div class="release_input clearfix">
									<font class="redStar">&nbsp;</font><span class="release_attr">年龄要求</span>
									<input type="text" class="inputBox" style="width: 25%;"
										id="ageYear" name="ageYear" placeholder="请输入年龄要求"
										maxlength="5" value="${info.ageYear}" />
									<span>(例：18到30岁，为18,30)</span>
								</div>
								<div class="release_input clearfix">
									<font class="redStar">&nbsp;</font> <span class="release_attr">学历要求</span>
									<div class="searchOptionsRel clearfix" id="diploma_S">
										<div class="searchOptions" data="12019000"
											onclick="selectTag('diploma_S',this)">高中及以下</div>
										<div class="searchOptions" data="12086000"
											onclick="selectTag('diploma_S',this)">大专</div>
										<div class="searchOptions" data="12087000"
											onclick="selectTag('diploma_S',this)">本科</div>
										<div class="searchOptions" data="12088000"
											onclick="selectTag('diploma_S',this)">硕士</div>
										<div class="searchOptions" data="12089000"
											onclick="selectTag('diploma_S',this)">博士</div>
										<div class="searchOptions" data="15393000"
											onclick="selectTag('diploma_S',this)">MBA</div>
										<div class="searchOptions" data="15394000"
											onclick="selectTag('diploma_S',this)">EMBA</div>
										<div style="clear: both;"></div>
									</div>
								</div>
								<div class="release_input clearfix">
									<font class="redStar">*</font><span class="release_attr">联系人姓名</span>
									<input type="text" class="inputBox" style="width: 25%;"
										id="contactName" name="contactName" placeholder="请输入联系人姓名"
										maxlength="32" value="${info.contactName}" />
								</div>
								<div class="release_input clearfix">
									<font class="redStar">*</font><span class="release_attr">联系人当前职位</span>
									<input type="text" class="inputBox" style="width: 25%;"
										id="contactPost" name="contactPost" placeholder="请输入联系人当前职位"
										maxlength="32" value="${info.contactPost}" />
								</div>
								<div class="release_input clearfix">
									<font class="redStar">*</font><span class="release_attr">联系人电话</span>
									<input type="text" class="inputBox" style="width: 25%;"
										id="contactPhone" name="contactPhone" placeholder="请输入联系人电话"
										maxlength="32" value="${info.contactPhone}" />
								</div>
								<div class="release_input clearfix">
									<font class="redStar">*</font><span class="release_attr">联系	邮箱</span>
									<input type="text" class="inputBox" style="width: 25%;"
										id="contactEmail" name="contactEmail" placeholder="请输入联系人邮箱"
										maxlength="32" value="${info.contactEmail}" />
								</div>
								<div class="release_input clearfix">
									<font class="redStar"></font><span class="release_attr">福利标签</span>
									<div class="searchOptionsRel clearfix" id="tag_S">
										<div class="searchOptions" 
											onclick="selectTags(this)">五险一金</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">年底双薪</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">包吃包住</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">带薪年假</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">免费班车</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">节日福利</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">绩效奖金</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">交通补助</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">餐补</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">通讯补贴</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">高温补贴</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">员工旅游</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">定期体检</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">医疗保险</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">交通补助</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">年终分红</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">弹性工作</div>
										<div class="searchOptions" 
											onclick="selectTags(this)">房补</div>
										<div style="clear: both;"></div>
									</div>
								</div>
								<%-- <div class="release_input clearfix">
									<font class="redStar"></font><span class="release_attr">职位类别</span>
									<input type="text" class="inputBox" style="width: 25%;"
										id="positionCategories" name="positionCategories" placeholder="请输入联系人邮箱"
										maxlength="32" value="${info.positionCategories}" />
								</div> --%>
								<div class="release_input clearfix">
									<font class="redStar">&nbsp;</font><span class="release_attr">截止时间</span>
									<input type="text" class="inputBox" style="width: 25%;"
										id="deadLineStr" name="deadLineStr" placeholder="请选择截止时间"
										maxlength="32" value='<fmt:formatDate value="${info.deadLine}" pattern="yyyy-MM-dd"/>' />
								</div>
						</form>
						<div style="padding-right: 76px;">
							<input type="button" value="返回" id="returnBtn" onclick="window.history.go(-1)"
								class="greenBtnContral" style="background-color: #CCC; margin:0 10px;">
							<c:if test="${info.positionId==null}">
								<input type="button" value="保存草稿" id="draftBtn" onclick="save('2');"
									class="greenBtnContral" style="background-color: grey; margin:0 10px;">
							</c:if>
							<input type="button" value="发布" id="saveBtn" onclick="save('1');"
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
	var isReg = '${isReg}';
	if(isReg=='false'){
		/* layer.confirm("确认去注册账号？",function(){
			window.location.href="${ctx}/front/recruitment/hcdy/companyEdit";
		},btn2:function(){
			window.location.href="${ctx}/front/recruitment/hcdy/main";
		}); */
		
		layer.confirm('确认完善信息？', {               
            btn: ['确定', '再想想']
           , btn1:function(){
                 window.location.href = "${ctx}/front/recruitment/hcdy/companyEdit";
            }
            , btn2: function () {
                 window.location.href = "${ctx}/front/recruitment/hcdy/main";
            },cancel: function(){ 
            	window.location.href = "${ctx}/front/recruitment/hcdy/main";
            }
            });
		
	}
	
	var isUpper = '${isUpper}';
	if(isUpper=='false'){
		layer.msg("亲，您发布数达到上限，请先下线个别职位！");
	}
	
	
	industryType();
	workArea();
	
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
	
	$("#workAreaP").change(function(){
		$("#workAreaC").empty();
		$("#workAreaC").append('<option value="-1">-请选择-</option>');
		if($(this).val()==-1){
			$("#workAreaC").attr("disabled","disabled");
		}else{
			$("#workAreaC").removeAttr("disabled");
			var parent = $(this).val();
			$.ajax({
				url:"${ctx}/json/recruitment/hcdy/getAddress",
				type:"get",
				data:{"parent":parent},
				success:function(result){
					for(var i=0;i<result.length;i++){
						var _option = '<option value="'+result[i].CODE+'">'+result[i].NAME+'</option>';
						$("#workAreaC").append(_option);
					}
				},
				error:function(){
					layer.msg("地址加载超时，请刷新重试！");
				}
				
			});
		}
	});
	var id = '${info.id}';
	if(id!=null&&id!=""){
		setTimeout(function(){
			init();
		},1);
	}
	
	
	var time = {
			elem : '#deadLineStr',
			format : 'YYYY-MM-DD',
			event : "focus",
			min : laydate.now(),
			max : '2099-06-16 23:59',
		//	istime : true,
			start : laydate.now(0, "YYYY-MM-DD"),
			
	};
	laydate(time);
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

function selectTags(obj){
	if($(obj).hasClass("selected")){
		$(obj).removeClass("selected");
	}else{
		$(obj).addClass("selected");
	}
}

//编辑的时候初始化数据
function init(){
	var workNature = $("#workNature").val();
	var pay = $("#pay").val();
	var workYear = $("#workYear").val();
	var diploma = $("#diploma").val();
	var positionTags = $("#positionTags").val();
	$("#workNature_S .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}
		if($(this).attr("data")==workNature){
			$(this).addClass("selected");
		}
	});
	$("#pay_S .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}
		if($(this).attr("data")==pay){
			$(this).addClass("selected");
		}
	});
	
	$("#workYear_S .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}
		if($(this).attr("data")==workYear){
			$(this).addClass("selected");
		}
	});
	
	$("#diploma_S .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}
		if($(this).attr("data")==diploma){
			$(this).addClass("selected");
		}
	});
	$("#tag_S .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}
		if(positionTags.indexOf($(this).text())!=-1){
			$(this).addClass("selected");
		}
	});
	
	//行业
	var industryType = $("#industryType").val();
	if(industryType.length>5){
		var industryType_P = industryType.substring(0,5);
		$("#industryTypeP option").each(function(){
			if($(this).val()==industryType_P){
				$(this).attr("selected",true);
				$("#industryTypeC").empty();
				$("#industryTypeC").append('<option value="-1">-请选择-</option>');
				$("#industryTypeC").removeAttr("disabled");
				
				for(var i=0;i<industryJson.industryList.length;i++){
					if(industryJson.industryList[i].code==industryType_P){
						for(var j=0;j<industryJson.industryList[i].children.length;j++){
							var _option = '<option value="'+industryJson.industryList[i].children[j].code+'">'+industryJson.industryList[i].children[j].name+'</option>';
							$("#industryTypeC").append(_option);
						}
					}
				}
				$("#industryTypeC option").each(function(){
					if($(this).val()==industryType){
						$(this).attr("selected",true);
					}
				});
			}
		});
	}else{
		$("#industryTypeP option").each(function(){
			if($(this).val()==industryType){
				$(this).attr("selected",true);
				$("#industryTypeC").removeAttr("disabled");
			}
		});
	}
	
	//地址
	var workArea = $("#workArea").val();
	$.ajax({
		url:"${ctx}/json/recruitment/hcdy/getAddressByCode",
		type:"get",
		data:{"code":workArea},
		success:function(result){
			if(result[0].PARENT==10000000){
				$("#workAreaP option").each(function(){
					if($(this).val()==result[0].CODE){
						$(this).attr("selected",true);
						$("#workAreaC").removeAttr("disabled");
					}
				});
			}else{
				$("#workAreaP option").each(function(){
					if($(this).val()==result[0].PARENT){
						$(this).attr("selected",true);
						$("#workAreaC").removeAttr("disabled");
					}
				});
				
				$("#workAreaC").empty();
				$("#workAreaC").append('<option value="-1">-请选择-</option>');
				$("#workAreaC").removeAttr("disabled");
				$.ajax({
					url:"${ctx}/json/recruitment/hcdy/getAddress",
					type:"get",
					data:{"parent":result[0].PARENT},
					success:function(result1){
						for(var i=0;i<result1.length;i++){
							var _option = '<option value="'+result1[i].CODE+'">'+result1[i].NAME+'</option>';
							$("#workAreaC").append(_option);
						}
						
						$("#workAreaC option").each(function(){
							if($(this).val()==result[0].CODE){
								$(this).attr("selected",true);
							}
						});
					},
					error:function(){
						layer.msg("地址加载超时，请刷新重试！");
					}
					
				});
				
				
			}
		},
		error:function(){
			layer.msg("地址加载超时，请刷新重试！");
		}
		
	});
	
}

//发布保存
function save(operationType){
	$("#operationType").val(operationType);
	if(operationType==1){
		$("#saveBtn").attr("disabled","disabled");
	}else{
		$("#draftBtn").attr("disabled","disabled");
	}
	
	if(validate()){
		$.ajax({
			url:"${ctx}/json/recruitment/hcdy/jsonSave",
			type:"post",
			data:$("#form").serialize(),
			success:function(result){
				layer.msg(result.msg);
				if(result.code==0){
					setTimeout(function(){
						window.location.href="${ctx}/front/recruitment/hcdy/main?pageType=2";
					},1000);
				}else{
					if(operationType==1){
						$("#saveBtn").removeAttr("disabled");
					}else{
						$("#draftBtn").removeAttr("disabled");
					}
					
				}
			},
			error:function(){
				layer.msg("系统加载超时，请稍后重试！");
			}
		});
		 
	}else{
		if(operationType==1){
			$("#saveBtn").removeAttr("disabled");
		}else{
			$("#draftBtn").removeAttr("disabled");
		}
	} 
}

//校验
function validate(){
		var positionName = $("#positionName").val();
		if(positionName==null||positionName==""){
			layer.msg("请输入职位名称！");
			return false;
		}
		
		var industryType = $("#industryTypeP option:selected").val();
		if(industryType==-1){
			layer.msg("请选择行业类别！");
			return false;
		}else{
			industryType = $("#industryTypeC option:selected").val();
			$("#industryTypeName").val($("#industryTypeC option:selected").text());
			if(industryType==-1){
				industryType = $("#industryTypeP option:selected").val();
				$("#industryTypeName").val($("#industryTypeP option:selected").text());
			}
			$("#industryType").val(industryType);
			
		}
		
		$("#workNature_S .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$("#workNature").val($(this).attr("data"));
				$("#workNatureName").val($(this).text());
			}
		});
		
		var workArea = $("#workAreaP option:selected").val();
		var workAreaName = $("#workAreaP option:selected").text();
		if(workArea==-1){
			layer.msg("请选择工作地点！");
			return false;
		}else{
			workArea = $("#workAreaC option:selected").val();
			workAreaName = $("#workAreaC option:selected").text();
			if(workArea==-1){
				workArea = $("#workAreaP option:selected").val();
				workAreaName = $("#workAreaP option:selected").text();
			}
			$("#workArea").val(workArea);
			$("#workAreaName").val(workAreaName);
		}
		
		
		var describe = $("#describe").val();
		if(describe==null||describe==""){
			layer.msg("请输入职位描述！");
			return false;
		}
		
		var count = $("#count").val();
		if(count==null||count==""){
			layer.msg("请输入招聘人数！");
			return false;
		}
		
		$("#pay_S .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$("#pay").val($(this).attr("data"));
				$("#payName").val($(this).text());
			}
		});
		
		$("#workYear_S .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$("#workYear").val($(this).attr("data"));
				$("#workYearName").val($(this).text());
			}
		});
		
		$("#diploma_S .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$("#diploma").val($(this).attr("data"));
				$("#diplomaName").val($(this).text());
			}
		});
		
		var contactName = $("#contactName").val();
		if(contactName==null||contactName==""){
			layer.msg("请输入联系人姓名！");
			return false;
		}
		
		var contactPost = $("#contactPost").val();
		if(contactPost==null||contactPost==""){
			layer.msg("请输入联系人当前职位！");
			return false;
		}
		
		var contactPhone = $("#contactPhone").val();
		if(contactPhone==null||contactPhone==""){
			layer.msg("请输入联系人电话！");
			return false;
		}
		
		var contactEmail = $("#contactEmail").val();
		if(contactEmail==null||contactEmail==""){
			layer.msg("请输入联系邮箱！");
			return false;
		}
		
		
		
		var tags = "";
		$("#tag_S .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				tags += ($(this).text()+",");
			}
		});
		$("#positionTags").val(tags);
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

//地址字典
function workArea(){
	$.ajax({
		url:"${ctx}/json/recruitment/hcdy/getAddress",
		type:"get",
		data:{"parent":""},
		success:function(result){
			for(var i=0;i<result.length;i++){
				var _option = '<option value="'+result[i].CODE+'">'+result[i].NAME+'</option>';
				$("#workAreaP").append(_option);
			}
		},
		error:function(){
			layer.msg("地址加载超时，请刷新重试！");
		}
		
	});
}

</script>
</html>
