function init(){
	var industryType = industryJson.industryList;
	for(var i=0;i<industryType.length;i++){
		if(i>=5){
			var _div = '<div class="searchOptions" data="'+industryType[i].code+'" onclick="getIndustryTypeChild(this,2)">'+industryType[i].name+'<i></i></div>';
			$("#business_resume_p2").append(_div);
		}else{		
			var _div = '<div class="searchOptions" data="'+industryType[i].code+'" onclick="getIndustryTypeChild(this,1)">'+industryType[i].name+'<i></i></div>';
			$("#business_resume_p1").append(_div);
		}
	}
	
	for(var i=0;i<industryType.length;i++){
		if(i>=5){
			var _div = '<div class="searchOptions" data="'+industryType[i].code+'" onclick="getIndustryTypeChild2(this,2)">'+industryType[i].name+'<i></i></div>';
			$("#business_headHunt_p2").append(_div);
		}else{		
			var _div = '<div class="searchOptions" data="'+industryType[i].code+'" onclick="getIndustryTypeChild2(this,1)">'+industryType[i].name+'<i></i></div>';
			$("#business_headHunt_p1").append(_div);
		}
	}
	
	$.ajax({
		url:host+"/json/recruitment/hcdy/getAddress",
		type:"get",
		data:{"parent":""},
		success:function(result){
			for(var i=0;i<result.length;i++){
				if(i<9){
					var _div = '<div class="searchOptions" data="'+result[i].CODE+'" onclick="getAreaChild(this,1)">'+result[i].NAME+'<i></i></div>';
					$("#area_resume_p1").append(_div);
				}else if(i>=10&&i<=19){
					var _div = '<div class="searchOptions" data="'+result[i].CODE+'" onclick="getAreaChild(this,2)">'+result[i].NAME+'<i></i></div>';
					$("#area_resume_p2").append(_div);
				}else{
					var _div = '<div class="searchOptions" data="'+result[i].CODE+'" onclick="getAreaChild(this,3)">'+result[i].NAME+'<i></i></div>';
					$("#area_resume_p3").append(_div);
				}
			}
		},
		error:function(){
			layer.msg("地址加载超时，请刷新重试！");
		}
		
	});
}

/*function moreIndustryType(obj){
	if($("#business_resume_p2").css("display")=="none"){
		$("#business_resume_p2").css("display","block");
		$(obj).text("收起");
		$(obj).next().removeClass("caret_down").addClass("caret_up");
	}else{
		$("#business_resume_p2").css("display","none");
		$(obj).text("更多");
		$(obj).next().removeClass("caret_up").addClass("caret_down");
	}
}*/

function ityzl_SHOW_LOAD_LAYER(){  
    return layer.msg('努力中...', {icon: 16,shade: [0.5, '#f5f5f5'],scrollbar: false,time:100000}) ;  
} 


function getIndustryTypeChild(obj,type){
	if($(obj).hasClass("selected")){
		$("#business_resume_c1").css("display","none");
		$("#business_resume_c2").css("display","none");
		if(type!=0){
			$(obj).removeClass("selected");
			$("#business_resume_c1 .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					$(this).removeClass("selected");
					$(this).children().removeClass("i_contral");
				}
			});
			$("#business_resume_c2 .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					$(this).removeClass("selected");
					$(this).children().removeClass("i_contral");
				}
			});
			$(obj).children().removeClass("i_contral");
		}
	}else{
		$("#business_resume_p1 .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
				$(this).children().removeClass("i_contral");
			}
		});
		$("#business_resume_p2 .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
				$(this).children().removeClass("i_contral");
			}
		});
		
		$(obj).addClass("selected");
		$(obj).children().addClass("i_contral");
		
		if($(obj).attr("data")!=""&&$(obj).attr("data")!=null){
			if(type==1){
				$("#business_resume_c1").css("display","block");
				$("#business_resume_c1").empty();
				$("#business_resume_c2").css("display","none");
				$("#business_resume_c2").empty();
			}else if(type==2){
				$("#business_resume_c1").css("display","none");
				$("#business_resume_c1").empty();
				$("#business_resume_c2").css("display","block");
				$("#business_resume_c2").empty();
			}
			
			for(var i=0;i<industryJson.industryList.length;i++){
				if(industryJson.industryList[i].code==$(obj).attr("data")){
					for(var j=0;j<industryJson.industryList[i].children.length;j++){
						var _div = null;
						if(j==0){
							_div = '<div class="searchOptions selected" data="'+industryJson.industryList[i].children[j].code+'" onclick="selectIndustryTypeChild(this)">'+industryJson.industryList[i].children[j].name+'<i></i></div>';
							
						}else{
							_div = '<div class="searchOptions" data="'+industryJson.industryList[i].children[j].code+'" onclick="selectIndustryTypeChild(this)">'+industryJson.industryList[i].children[j].name+'<i></i></div>';
							
						}
						
						if(type==1){
							$("#business_resume_c1").append(_div);
						}else{
							$("#business_resume_c2").append(_div);
						}
					}
				}
			}
		}else{
			$("#business_resume_c1").css("display","none");
			$("#business_resume_c1").empty();
			$("#business_resume_c2").css("display","none");
			$("#business_resume_c2").empty();
		}
		
		
	}
	$(".personal_listBar").empty();
	getResume(1, 4);
}

function selectIndustryTypeChild(obj){
	if($(obj).hasClass("selected")){
//		$(obj).removeClass("selected");
	}else{
		$("#business_resume_c1 .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
			}
		});
		$("#business_resume_c2 .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
			}
		});
		$(obj).addClass("selected");
	}
	$(".personal_listBar").empty();
	getResume(1, 4);
}


function getAreaChild(obj,type){
	if($(obj).hasClass("selected")){
		$("#area_resume_c1").css("display","none");
		$("#area_resume_c2").css("display","none");
		$("#area_resume_c3").css("display","none");
		if(type!=0){
			$(obj).removeClass("selected");
			$(obj).children().removeClass("i_contral");
		}
	}else{

		$("#area_resume_p1 .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
				$(this).children().removeClass("i_contral");
			}
		});
		$("#area_resume_p2 .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
				$(this).children().removeClass("i_contral");
			}
		});
		$("#area_resume_p3 .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
				$(this).children().removeClass("i_contral");
			}
		});
		
		$(obj).addClass("selected");
		$(obj).children().addClass("i_contral");
		
		if($(obj).attr("data")!=""&&$(obj).attr("data")!=null){
			if(type==1){
				$("#area_resume_c1").css("display","block");
				$("#area_resume_c1").empty();
				$("#area_resume_c2").css("display","none");
				$("#area_resume_c2").empty();
				$("#area_resume_c3").css("display","none");
				$("#area_resume_c3").empty();
			}else if(type==2){
				$("#area_resume_c1").css("display","none");
				$("#area_resume_c1").empty();
				$("#area_resume_c2").css("display","block");
				$("#area_resume_c2").empty();
				$("#area_resume_c3").css("display","none");
				$("#area_resume_c3").empty();
			}else if(type==3){
				$("#area_resume_c1").css("display","none");
				$("#area_resume_c1").empty();
				$("#area_resume_c2").css("display","none");
				$("#area_resume_c2").empty();
				$("#area_resume_c3").css("display","block");
				$("#area_resume_c3").empty();
			}
			var parent = $(obj).attr("data");
			$.ajax({
				url:host+"/json/recruitment/hcdy/getAddress",
				type:"get",
				data:{"parent":parent},
				success:function(result){
					for(var i=0;i<result.length;i++){
						var _div = '';
						if(i==0){
							_div = '<div class="searchOptions selected" data="'+result[i].CODE+'" onclick="selectAreaChild(this)">'+result[i].NAME+'<i></i></div>';
							
						}else{
							_div = '<div class="searchOptions" data="'+result[i].CODE+'" onclick="selectAreaChild(this)">'+result[i].NAME+'<i></i></div>';
							
						}
						
						if(type==1){
							$("#area_resume_c1").append(_div);
						}else if(type==2){
							$("#area_resume_c2").append(_div);
						}else{
							$("#area_resume_c3").append(_div);
						}
					}
				},
				error:function(){
					layer.msg("地址加载超时，请刷新重试！");
				}
				
			});
		}else{
			$("#area_resume_c1").css("display","none");
			$("#area_resume_c1").empty();
			$("#area_resume_c2").css("display","none");
			$("#area_resume_c2").empty();
			$("#area_resume_c2").css("display","none");
			$("#area_resume_c2").empty();
			$("#area_resume_c3").css("display","none");
			$("#area_resume_c3").empty();
		}
		
		
	}
	
	$(".personal_listBar").empty();
	getResume(1, 4);
}

function selectAreaChild(obj){
	if($(obj).hasClass("selected")){
//		$(obj).removeClass("selected");
	}else{
		$("#area_resume_c1 .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
			}
		});
		$("#area_resume_c2 .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
			}
		});
		$("#area_resume_c3 .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
			}
		});
		$(obj).addClass("selected");
	}
	$(".personal_listBar").empty();
	getResume(1, 4);
}



function selectResumeClick(id, obj){
	$("#"+id+" .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}
	});
	$(obj).addClass("selected");
	
	$(".personal_listBar").empty();
	getResume(1, 4);
}

function selectResumeChange(obj){
	$(".personal_listBar").empty();
	getResume(1, 4);
}


function selectResumeBlur(obj){
	$(".personal_listBar").empty();
	getResume(1, 4);
}

//简历
function getResume(page_index, page_size){
	$("#resumeMore").hide();
	
	var business = "";
	var area = "";
	
	var diploma = $("#diploma_resume").val();
	var sex = $("#sex_resume").val();
	var age = $("#age_resume").val();
	if(age!=null&&age!=''){
		age=age.replace("，",",");
	}
	
	var salary = "";
	var work_year = "";
	
	$("#business_resume .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			if(business==null||business==""){
				business = $(this).attr("data");
			}else{
				if(business.length<$(this).attr("data").length){				
					business = $(this).attr("data");
				}
			}
		}
	});
	
	$("#area_resume .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			if(area==null||area==""){
				area = $(this).attr("data");
			}else{
				if($(this).parent().hasClass("item_detail")){				
					area = $(this).attr("data");
				}
			}
		}
	});
	
	$("#salary_resume .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			salary = $(this).attr("data");
		}
	});
	
	$("#workYear_resume .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			work_year = $(this).attr("data");
		}
	});
	
	
	$.ajax({
		url:host+"/json/recruitment/hcdy/getResume",
		type:"post",
		data:{
			"business":business,
			"area":area,
			"salary":salary,
			"diploma":diploma,
			"age":age,
			"sex":sex,
			"work_year":work_year,
			"page_index":page_index,
			"page_size":page_size
		},
		dataType:"json",
		beforeSend:function(){
			index = ityzl_SHOW_LOAD_LAYER(); 
	    },
		success:function(result){
			layer.close(index);
			if(result.errorCode==0){
				var list = result.value.resumeList;
				var pageTotal = result.value.pageTotal;
				var count = result.value.count;
				$("#resumeTotal").text(count);
				if(list.length==0&&page_index==1){
					$(".personal_listBar").append('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
				}else{
					if(page_index<pageTotal){
						$("#resumeMore").show();
						$("#page_index").val(Number(page_index)+1);
					}
					
					for(var i=0;i<list.length;i++){
						var info = list[i];
						
						var _div = '<div class="personal_list_content clearfix">'
							+'<div class="list_headPortrait">';
						if(info.head_portrait!=null&&info.head_portrait!=""){
							_div += '<img src=\'http://'+info.head_portrait+'\' width="100" height="100" style="border-radius:50%;">';
						}else{
							if(info.sex=='男'){
								_div += '<img src="'+host+'/static/image/recruitment/rcf_tx.png" width="100" height="100" style="border-radius:50%;">';
							}else{								
								_div += '<img src="'+host+'/static/image/recruitment/rcf_tx1.png" width="100" height="100" style="border-radius:50%;">';
							}
						}
						_div += '<img src="'+host+'/static/image/recruitment/vip.png" width="25" class="vip">';
							_div += '</div>'
							+'<div class="list_containe">'
							+'<div class="clearfix">'
							+'<div class="list_name">'+info.name+'</div>'
							+'<div class="list_time">'+info.age+'</div>'
							+'<div class="list_time">&nbsp;&nbsp;'+info.sex+'</div>'
							+'<div class="list_time">&nbsp;&nbsp;'+info.update_date+'</div>'
							+'<div class="list_view" style="cursor: pointer;" onclick="openUrl(\''+info.pc_url+'\')">看简历</div>'
							+'</div>'
							+'<div class="clearfix">'
							+'<span>学历：</span>'
							+'<span>'+info.diploma+'</span>'
							+'</div>'
							+'<div class="clearfix">'
							+'<span>当前位置：</span>'
							+'<span>'+info.location+'</span>'
							+'</div>'
							+'<div class="clearfix">'
							+'<span>工作经验：</span>'
							+'<span>'+(info.work_year=='None'?'':info.work_year)+'</span>'
							+'</div>'
							+'<div class="clearfix">'
							+'<span class="veralign_top">工作经历：</span>'
							+'<span class="inlineblock">';
						var workList = info.workList;
						for(var m=0;m<workList.length;m++){
							_div += '<div>'+workList[i].work_date+'&nbsp;|&nbsp;'+workList[i].companye+'&nbsp;|&nbsp;'+workList[i].position+'</div>';
						}
						_div += '</span>'
							+'</div>'
							+'</div>'
							+'</div>';
						$(".personal_listBar").append(_div);
					}
				}
				
				
			}else{
				layer.msg(result.errorMsg);
			}
		},
		error:function(){
			layer.msg("加载超时，请稍后重试！");
		}
	});
}

//经纪人

function getIndustryTypeChild2(obj,type){
	if($(obj).hasClass("selected")){
		$("#business_headHunt_c1").css("display","none");
		$("#business_headHunt_c2").css("display","none");
		if(type!=0){
			$(obj).removeClass("selected");
			$("#business_headHunt_c1 .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					$(this).removeClass("selected");
					$(this).children().removeClass("i_contral");
				}
			});
			$("#business_headHunt_c2 .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					$(this).removeClass("selected");
					$(this).children().removeClass("i_contral");
				}
			});
			$(obj).children().removeClass("i_contral");
		}
	}else{
		$("#business_headHunt_p1 .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
				$(this).children().removeClass("i_contral");
			}
		});
		$("#business_headHunt_p2 .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
				$(this).children().removeClass("i_contral");
			}
		});
		
		$(obj).addClass("selected");
		$(obj).children().addClass("i_contral");
		
		if($(obj).attr("data")!=""&&$(obj).attr("data")!=null){
			if(type==1){
				$("#business_headHunt_c1").css("display","block");
				$("#business_headHunt_c1").empty();
				$("#business_headHunt_c2").css("display","none");
				$("#business_headHunt_c2").empty();
			}else if(type==2){
				$("#business_headHunt_c1").css("display","none");
				$("#business_headHunt_c1").empty();
				$("#business_headHunt_c2").css("display","block");
				$("#business_headHunt_c2").empty();
			}
			
			for(var i=0;i<industryJson.industryList.length;i++){
				if(industryJson.industryList[i].code==$(obj).attr("data")){
					for(var j=0;j<industryJson.industryList[i].children.length;j++){
						var _div = null;
						if(j==0){
							_div = '<div class="searchOptions selected" data="'+industryJson.industryList[i].children[j].code+'" onclick="selectIndustryTypeChild2(this)">'+industryJson.industryList[i].children[j].name+'<i></i></div>';
						}else{
							_div = '<div class="searchOptions" data="'+industryJson.industryList[i].children[j].code+'" onclick="selectIndustryTypeChild2(this)">'+industryJson.industryList[i].children[j].name+'<i></i></div>';
						}
						
						if(type==1){
							$("#business_headHunt_c1").append(_div);
						}else{
							$("#business_headHunt_c2").append(_div);
						}
					}
				}
			}
		}else{
			$("#business_headHunt_c1").css("display","none");
			$("#business_headHunt_c1").empty();
			$("#business_headHunt_c2").css("display","none");
			$("#business_headHunt_c2").empty();
		}
		
		
	}
	$(".agent_listBar").empty();
	getHeadHunt(1, 5);
}

function selectIndustryTypeChild2(obj){
	if($(obj).hasClass("selected")){
//		$(obj).removeClass("selected");
	}else{
		$("#business_headHunt_c1 .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
			}
		});
		$("#business_headHunt_c2 .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
			}
		});
		$(obj).addClass("selected");
	}
	$(".agent_listBar").empty();
	getHeadHunt(1, 5);
}



function selectHeadHuntClick(id, obj){
	$("#"+id+" .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}
	});
	$(obj).addClass("selected");
	
	$(".agent_listBar").empty();
	getHeadHunt(1, 5);
}

function getHeadHunt(page_index, page_size){
	var business = "";
	var work_year = "";
	
	$("#headHuntMore").hide();
	
	var business = "";
	var area = "";
	
	$("#business_headHunt .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			if(business==null||business==""){
				business = $(this).attr("data");
			}else{
				if(business.length<$(this).attr("data").length){				
					business = $(this).attr("data");
				}
			}
		}
	});
	
	$("#workYear_headHunt .searchOptions").each(function(){
		if($(this).hasClass("selected")){
			work_year = $(this).attr("data");
		}
	});
	
	$.ajax({
		url:host+"/json/recruitment/hcdy/getHeadHunt",
		type:"post",
		data:{
			"business":business,
			"work_year":work_year,
			"page_index":page_index,
			"page_size":page_size
		},
		dataType:"json",
		beforeSend:function(){
			index = ityzl_SHOW_LOAD_LAYER(); 
	    },
		success:function(result){
			layer.close(index);
			if(result.errorCode==0){
				var list = result.value.headhuntList;
				var pageTotal = result.value.pageTotal;
				var count = result.value.count;
				$("#headHuntTotal").text(count);
				if(list.length==0&&page_index==1){
					$(".agent_listBar").append('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
				}else{
					if(page_index<pageTotal){
						$("#headHuntMore").show();
						$("#page_index").val(Number(page_index)+1);
					}
					
					for(var i=0;i<list.length;i++){
						var info = list[i];
						
						var _div = '<div class="agent_list_content clearfix" data-bind="foreach:list" style="cursor: pointer;" onclick="openUrl(\''+info.pc_url+'\')">'
							+'<div class="list_headPortrait" onclick="openUrl(\''+info.pc_url+'\')">';
							
						if(info.head_portrait!=null&&info.head_portrait!=""){
							_div += '<img src="http://'+info.head_portrait+'" width="100" height="100" style="border-radius:50%;">';
						}else{
							if(info.sex=='男'){
								_div += '<img src="'+host+'/static/image/recruitment/Agent_male.png" width="100" height="100" style="border-radius:50%;">';
							}else{
								_div += '<img src="'+host+'/static/image/recruitment/Agent_female.png" width="100" height="100" style="border-radius:50%;">';
							}
						}
							
						_div += '<img src="'+host+'/static/image/recruitment/vip.png" width="25" class="vip">'
							+'</div>'
							+'<div class="list_containe">'
							+'<div class="clearfix">'
							+'<div class="list_name">'+info.name+'</div>'
							+'<div class="list_tip">南昌市 | '+(info.work_year=='None'?'':info.work_year)+'</div>'
							+'<div class="list_evaluate">'+info.praise_rate+'%</div>'
							+'<div class="list_evaluateTitle">好评率</div>'
							+'</div>'
							+'<div class="clearfix">'
							+'<span>擅长行业：</span>'
							+'<span>'+info.business+'</span>'
							+'</div>'
							+'<!-- <div class="clearfix">'
							+'<span>服务项目：</span>'
							+'<span>合伙服务咨询</span>'
							+'</div> -->'
							+'<div class="clearfix">'
							+'<span>已接受&nbsp;<font class="orangeFont font18">'+info.entrust_count+'</font>&nbsp;份委托简历</span>'
							+'</div>'
							+'<div class="list_record">'
							+'<div class="clearfix">'
							+'<span>响应时间：</span>'
							+'<span><font class="blueFont font18">'+info.response_time+'</font></span>'
							+'</div>'
							+'<div class="clearfix">'
							+'<span>服务人次：</span>'
							+'<span>'+info.serve_count+'</span>'
							+'</div>'
							+'</div>'
							+'</div>'
							+'</div>';
						
						$(".agent_listBar").append(_div);
					}
				}
				
				
			}
		},
		error:function(){
			layer.msg("加载超时，请稍后重试！");
		}
	});
	
}



//我发布的
function mylist(obj){
	
	$("#mylist").empty();
	
	$(".searchOptionWrap .optionBtn").each(function(){
		if($(this).hasClass("optionSelected")){
			$(this).removeClass("optionSelected");
			if($(this).text().indexOf("(")!=-1){				
				$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
			}
		}
	})
	$(obj).addClass("optionSelected");
	if(!$(obj).hasClass("optionSelected")){		
	}
	
	var positionStatus = $(obj).attr("data");

	$.ajax({
		url:host+"/json/recruitment/hcdy/logList",
		type:"get",
		data:{"positionStatus":positionStatus},
		success:function(result){
			
			if(result.code==0){
				if(result.value!=null&&result.value!=""){
					$(obj).text($(obj).text()+"("+result.value.length+")");
					for(var i=0;i<result.value.length;i++){
						var info = result.value[i];
						var _div = '<div class="myRecruit_list_content clearfix">'
								+'<div class="list_headPortrait" onclick="detail(\''+info.id+'\')" style="cursor: pointer;">'
								+'<img src="'+host+'/static/image/recruitment/headPortrait.png" width="100" height="100" style="border-radius:50%;">'
								+'<img src="'+host+'/static/image/recruitment/vip.png" width="25" class="vip">'
								+'</div>'
								+'<div class="list_containe" onclick="detail(\''+info.id+'\')" style="cursor: pointer;">'
								+'<div class="clearfix">'
								+'<div class="list_name">'+info.positionName+'</div>'
								+'<div class="list_salary">年薪'+info.payName+'</div>'
								+'</div>'
								+'<div class="clearfix">'
								+'<span>'+info.rootName+'&nbsp;&nbsp;</span>'
								+'<span>'+info.industryTypeName+'</span>'
								+'</div>'
								+'<div class="clearfix">'
								+'<span style="color:#5e5e5e;">';
						if(info.workYearName==null||info.workYearName==""){
							_div += '<span>经验不限</span>&nbsp;|&nbsp;';
						}else{
							if(info.workYearName=='应届生'){
								_div += '<span>'+info.workYearName+'</span>&nbsp;|&nbsp;';
							}else{
								_div += '<span>'+info.workYearName+'工作经验</span>&nbsp;|&nbsp;';
							}
							
						}
						
						if(info.diplomaName==null||info.diplomaName==""){
							_div += '<span>学历不限</span>&nbsp;|&nbsp;';
						}else{
							_div += '<span>'+info.diplomaName+'</span>&nbsp;|&nbsp;';
						}
								
								
						_div += '<img src="'+host+'/static/image/recruitment/map.png">&nbsp;<span class="font13">'+info.workAreaName+'</span>'
								+'</span>'
								+'</div>'
								+'<div class="clearfix">'
//								+'<span>您当前有&nbsp;<font class="redFont font18">30</font>&nbsp;份简历待处理</span>'
								+'</div>'
								+'<div class="list_time2">'+getTime(info.createTime)+'</div>'
								+'</div>';
						if(info.positionStatus==2){
							_div += '<div class="deleteOper"><img src="'+host+'/static/image/recruitment/delete.png" width="15" style="cursor:pointer;" onclick="del(\''+info.id+'\',this)"></div></div>';
						}else{
							_div += '</div>';
						}
						$("#mylist").append(_div);
					}
					
				}else{
					$("#mylist").append('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
				}
			}else{
				layer.msg(result.msg);
			}
		},
		error:function(){
			layer.msg("加载超时，请稍后");
		}
	});
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
	m = (date.getMinutes() < 10 ?( '0' + date.getMinutes() ) : date.getMinutes() );
	/* s = (date.getSeconds() < 10 ?( '0' + date.getSeconds() ) : date.getSeconds() ); */
	return (Y + M + D + h + m );
}


function detail(id){
	window.location.href=host+"/front/recruitment/hcdy/detail?id="+id;
}

function del(id,obj){
	layer.confirm("确认删除？",function(){
		$.ajax({
			url:host+"/json/recruitment/hcdy/delete",
			type:"get",
			data:{"id":id},
			success:function(result){
				layer.msg(result.msg);
				if(result.code==0){
					$(obj).parent().parent().remove();
					
					var str = $("#draft").text();
					var num = str.substring(str.indexOf("(")+1,str.indexOf(")"));
					if(num>1){
						$("#draft").text("草稿箱("+(Number(num)-1)+")");								
					}else{
						$("#draft").text("草稿箱");	
					}
				}
			},
			error:function(){
				layer.msg("系统超时，请刷新重试！");
			}
		});
	},function(){return;});
	
}

function openUrl(url){
	$.ajax({
		url:host+"/json/recruitment/hcdy/hcdyLogin",
		type:"post",
		success:function(result){
			if(result.errorCode==0){
				window.hclogin.location.href = "http://"+result.value.pc_url;
				setTimeout(function(){
					window.open('http://'+url, '_blank');
				}, 1000);
			}else{
				window.open('http://'+url, '_blank');
			}
		},
		error:function(){
			layer.msg("系统加载超时，请刷新重试！");
		}
	});
}

