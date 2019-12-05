<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<%@ include file="../common/page.jsp"%><!-- 前端分页 -->
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>工业动态</title>
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
<style type="text/css">
	.delBtn{
		position: absolute; 
		right: 0px; 
		top: 132px;
		color:#a0a0a0; 
		font-size:14px;
		z-index: 100;
		cursor:pointer;
	}
	.delBtn img {
		margin-right: 5px;
	}
</style>
</head>

<body>
	<div class="project_main">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<div class="project_content_header">
			<div class="container newNav">
			     <div class="newNavSub">
			     	<img src="${ctx}/static/image/homePage_yc/projectDsc.png" />
			     </div>
			    <div class="newNavSub">
			    	<p class="navTitle">工业动态</p>
			    	<p><font class="projectNum" id="projectNum1">0</font>&nbsp;
				<font id="font1">条</font> &nbsp;&nbsp; <font id="font2">工业动态</font></p>
			     </div>
			</div>
		</div>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-list">
							<div class="titleName">
								<ul>
									<li>宜春</li>
									<li>江西省</li>
									<li>我发布的</li>
								</ul>
								<div class="searchBar">
									<input type="text" id="searchKey" placeholder="标题关键字" style="border-radius: 4px;border: 1px solid #e1e1e1;" /> 
									<img src="${ctx}/static/image/homePage_yc/seach.png" width="15" height="15" onclick="search()">
								</div>
								<input type="hidden" id="type" value="0" />
								<input type="hidden" id="pageNum" value="1" />
								<input type="hidden" id="declareGrade" value="" />
								<input type="hidden" id="areaName" value="" />
								<input type="hidden" id="status" value="1" />
							</div>
							<div class="searchKeyBox">
								<div class="searchOptions open">展开</div>
								<div class="searchKeys searchKeys1">
									<div class="searchOptions"><span>类别</span></div>
									<div class="searchOptions options">
										<c:if test="${expLabel==''||expLabel==undefined}">
												<div class="optionBtn selected" onclick="selectByKey(this,'',1);">全部</div>
											</c:if>
											<c:if test="${expLabel!=''&&expLabel!=undefined}">
												<div class="optionBtn" onclick="selectByKey(this,'',1);">全部</div>
											</c:if>
										<c:forEach items="${labelList }" var="labelList">
											<c:if test="${expLabel==labelList.tagName}">
												<div class="optionBtn selected" onclick="selectByKey(this,'${labelList.tagName}',1);">${labelList.tagName }</div>
											</c:if>
											<c:if test="${expLabel!=labelList.tagName}">
												<div class="optionBtn" onclick="selectByKey(this,'${labelList.tagName}',1);">${labelList.tagName }</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
								<div class="searchKeys searchKeys2">
									<div class="searchOptions"><span>地域</span></div>
									<div class="searchOptions options" id="declareGrade2"></div>
								</div>
								<div class="searchKeys searchKeys3" style="display:none;">
									<div class="searchOptions"><span>状态</span></div>
									<div class="searchOptions options">
									    <div class="optionBtn selected" onclick="selectByKey(this,'',3);">全部</div>
										<div class="optionBtn" onclick="selectByKey(this,2,3);">审核中</div>
										<div class="optionBtn" onclick="selectByKey(this,1,3);">已发布</div>
										<div class="optionBtn" onclick="selectByKey(this,0,3);">未通过审核</div>
									</div>
								</div>
							</div>
							<div class="title-items">
								<div class="title-content" id="set0">
									<div id="ycList"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize0"></div>
										<div class="m-style M-box0"></div>
									</div>
								</div>
								<div class="title-content" id="set1">
									<div id="allList"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize1"></div>
										<div class="m-style M-box1"></div>
									</div>
								</div>
		
								<div class="title-content" id="set2" style="display: none;">
									<div id="mylist"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize2"></div>
										<div class="m-style M-box2"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<c:import url="/slideSelect" charEncoding="UTF-8">
					 	<c:param name="entranceId" value="${entranceId}" />
					</c:import>
				</div>
			</div>
		</div>

	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	</div>
</body>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script src="${ctx}/static/js/plugins/pagination/jquery.pagination.js"></script> 
<script type="text/javascript">
var isBox0 = true
var isBox1 = true;
var isBox2 = true
$(function(){
	getArea();
	if ('${entranceId}' == '3609009') {
		$(".searchKeys2").hide();
		$(".searchKeys3").hide();
		$('.titleName li:eq(0)').show().addClass("on").siblings().removeClass("on");
		$('#set0').show().siblings().hide();
		$("#type").val('0');
		$("#areaName").val('宜春');
		getInfoList(1);
	} else {
		$(".searchKeys3").hide();
		$('.titleName li:eq(0)').hide();
		$('.titleName li:eq(1)').addClass("on").siblings().removeClass("on");
		$('#set1').show().siblings().hide();
		$("#type").val('1');
		$("#areaName").val('');
		getInfoList(1);
	}
	if('${entranceId}'==3609009){
		$(".nav-content a:eq(3)").addClass("on");
	}
	$(".source-room a").removeClass("on");
	$(".source-room a:eq(5)").addClass("on");
	$(".fir-floor").show();
	$(".publish-btn h1").text('动态发布')
	$(".fr li").eq(1).addClass("on");

	var $l = 0;    //判断是否要展开
	$(".options").each(function(){ $l += $(this).height();})
	if($l < 40){ $(".open").hide();}
	else { $(".searchKeyBox").css("height","45px");}
	
	$(".open").on("click",function() { //展开收起筛选项
		$(this).toggleClass("on");
		var $l = 0;
		$(".options").each(function(){ $l += $(this).height() + 10;})
		if($(this).hasClass("on")) { 
			$(".searchKeyBox").css("height", $l + 'px');
			$(".open").text("收起");
		}
		else { 
			$(".searchKeyBox").css("height","45px");
			$(".open").text("展开");
		}
	})
	$(".titleName li").on("click",function(){          //大项目tab切换
		var $ind = $(this).index();
	    if($ind==2){
			if ('${accountId}' == '') {
				layer.msg('亲，您还没登录!');
				return;
			}
	    	$('.searchKeys1').hide();
	    	$('.searchKeys2').hide();
    	 	$('.searchKeys3').show();
	 		$("#declareGrade").val('');
	 		$("#status").val('');
			$("#areaName").val('');
			isBox2 = true;
	    }else if($ind==1){
	    	$('.searchKeys1').show();
	    	$('.searchKeys2').show();
	    	$('.searchKeys3').hide();
	 		$("#declareGrade").val('');
	 		$("#status").val('1');
			$("#areaName").val('');
			isBox1 = true;
	    } else {
	    	$('.searchKeys1').show();
	    	$('.searchKeys2').hide();
	    	$('.searchKeys3').hide();
	 		$("#status").val('');
	 		$("#declareGrade").val('');
			$("#areaName").val('宜春');
			isBox0 = true;
	    }
		$(".searchKeys .optionBtn").removeClass("selected");   //重置选项
		$(".searchKeys").each(function() {
			$(this).find(".optionBtn:eq(0)").addClass("selected");
		})
		$(".searchKeys .optionBtn").each(function() {
			var $ind2 = $(this).text().indexOf("(");
			var t = $(this).text().substring(0, $ind2)
			if ($ind2 > -1) {
				$(this).text(t)
			}
		})
		$("#type").val($ind);
		getInfoList(1);

		var $l = 0;    //判断是否要展开
		$(".options").each(function(){$l += $(this).height();})
		$(".open").removeClass("on").text("展开");
		if($l < 45){ $(".searchKeyBox").css("height","45px"); $(".open").hide();} 
		else { $(".searchKeyBox").css("height","45px"); $(".open").show();}
		
		$(this).addClass("on").siblings().removeClass("on");
		$("#set"+$ind).siblings().fadeOut("fast");
		setTimeout(function(){ $("#set"+$ind).fadeIn("fast");},200);
	});
	//回车触发搜索事件
	$("#searchKey").bind('keydown', function(event) {
		if (event.keyCode == "13") {
			search();
		}
	});
});
function search(){
	var type = $('#type').val();
	if(type==0){
		isBox0 = true;
	}else if(type==1){
		isBox1 = true;
	}else{
		isBox2 = true;
	}
	getInfoList(1);
}
function add(){
	if('${accountId}'==''){
		tips('亲，您还没有登录');
		return;
	}else{
  		window.location.href = "${ctx}/experience/add?entranceId=${entranceId}";
  }
	
}	
function getInfoList(pageNum){
 	var type = $('#type').val();
 	var $type = parseInt(type) - 1;
	var pageSize = 10;
	var param = {
				"pageNum": pageNum,
				"pageSize": pageSize,
				"expTitle": $("#searchKey").val(),
				"expLabel": $("#declareGrade").val(),
				"status": $("#status").val(),
				"areaName": $("#areaName").val(),
				"type": $type < 0 ? 0 : $type
	}
	$.ajax({
		url:"${ctx}/expShare/json/list",
		type:"get",
		data: param,
		dataType:"json",
		success:function(result){
			if(result.code==-1 || result.code==-2){ layer.alert(result.msg);}
			else if(result.code==2){
				  if(type==0){
						$('.M-box0').hide();
						$('#pageSize0').hide();
				  }else if(type==1){
						$('.M-box1').hide();
						$('#pageSize1').hide();
				  }else{
						$('.M-box2').hide();
						$('#pageSize2').hide();
				  }
				if(type == 2){ $('#mylist').html('<div class="noMoreData"><span class="renovateTitle">暂无更多信息</span></div>');}
				if(type == 1){ $('#allList').html('<div class="noMoreData"><span class="renovateTitle">暂无更多信息</span></div>');}
				if(type == 0){ $('#ycList').html('<div class="noMoreData"><span class="renovateTitle">暂无更多信息</span></div>');}
				$(".searchKeys .optionBtn").each(function() {
					var $ind2 = $(this).text().indexOf("(");
					var t = $(this).text().substring(0, $ind2)
					if ($ind2 > -1) {
						$(this).text(t)
					}
				})
				$('#projectNum1').text('0');
			}
			else{
				var list = result.value;
				var total = result.msg;
				  if ( 10 < total && pageNum ==1) {
					  if(type==0){
						  if(isBox0){
								 isBox0 = false;
								 showPagination('.M-box0',total,getInfoList,type);
							}
						     $('#pageSize0').show();
							 $('#pageSize0').html('共检索到'+total+' 条数据，每页10条');
					  }else if(type==1){
						  if(isBox1){
								 isBox1 = false;
								 showPagination('.M-box1',total,getInfoList,type);
							}
						  	 $('#pageSize1').show();
							 $('#pageSize1').html('共检索到'+total+' 条数据，每页10条');
					  }else{
						  if(isBox2){
								 isBox2 = false;
								 showPagination('.M-box2',total,getInfoList,type);
							}
							 $('#pageSize2').show();
							 $('#pageSize2').html('共检索到'+total+' 条数据，每页10条');
					  }
				  }else if(10 >= total && pageNum ==1){
						  if(type==0){
							$('.M-box0').hide();
							$('#pageSize0').hide();
					  }else if(type==1){
							$('.M-box1').hide();
							$('#pageSize1').hide();
					  }else{
							$('.M-box2').hide();
							$('#pageSize2').hide();
					  }
				  }
				$('#projectNum1').text(total);
					if(type == 0) { $('#ycList').empty();}
					if(type == 1) { $('#allList').empty();}
					if(type == 2) { $('#mylist').empty();}
					$(".optionBtn").each(function() {              //给标签加上数量
						if ($(this).hasClass("selected")) {
							var $ind = $(this).text().indexOf("(");
							var t = $(this).text().substring(0, $ind)
							if ($ind > -1) {
								$(this).text(t)
							}
							$(this).text($(this).text() + "(" + total + ")");
						}
					})
				for(var i=0;i<list.length;i++){
					var info = list[i];
					var text = info.expText.replace(/<[^>]+>/g,"").replace(/&nbsp;/g,"").replace(/&ldquo;/g,"“").replace(/&rdquo;/g,"”");
			    	text = jQuery.trim(text);
			    	if(text!=""&&text!=null&&text.length>77){
			    		text = text.substring(0,74)+"...";
			    	}
					var _div =   '<div class="declareDataBar" style="position: relative;">'
						+'<div onclick="toDetail(\''+info.expId+'\',\''+type+'\')" style="cursor: pointer;">'
						+	'<div class="text-box">';
				    _div += '<div class="title-text"><div class="declareTitle">';
				    if(type==1){
						if(info.status==0){
					  		_div += '<span class="flag flag2">未通过</span><span class="triang triang2"></span>';
					 		}else if(info.status==1){
							_div += '<span class="flag flag1">已发布</span><span class="triang triang1"></span>';
							}else{
							_div += '<span class="flag flag3">审核中</span><span class="triang triang3"></span>';
							}
				    }
					_div += info.expTitle+'</div>'
							
						+'<div class="declareData">'
						+	'<font>发布时间：'+dateToTimeStr(info.createTime,"yyyy-MM-dd")+'</font>'
						+	'<font>发布单位：'+info.expUnit+'</font>'
						+	'<font>地址：'+info.provinceName+' '+notNull(info.areaName)+'</font></div>'
						+'</div><div class="declare-content">'+text+'</div></div>'
						+'<img src="'+info.expImage+'" width="180" height="110">';
						if(type==2){
							_div += '<div class="delBtn" onclick="deleteOper(\''+info.expId+'\');"><img src="${ctx}/static/image/homePage_yc/delete.png" width="14"><span>删除</span></div>'
						}
						+'</div></div>';

					if(type == 0) { $('#ycList').append(_div);}
					if(type == 1) { $('#allList').append(_div);}
					if(type == 2) { $('#mylist').append(_div);}
				}
				//jquery阻止冒泡和默认行为
				$(".delBtn").on('click',function(){
			         return false;
			    });
			}
		},
		error:function(){
			//tips("请求超时，请稍后重试");
		},
	});
}
function toDetail(expId,type){
	window.open("${ctx}/experience/detail/"+expId+"?type="+type+"&entranceId=${entranceId}", "_blank");
}
function deleteOper(expId){
	confirm('确认删除？', function(){
	$.ajax({
		url:"${ctx}/expShare/json/delete",
		type:"get",
		data:{
			"ids":expId
		},
		dataType:"json",
		success:function(result){
			$("#status .optionBtn").each(function(){
		        if($(this).hasClass("selected")){
		        	if($(this).text().indexOf("(")!=-1){
		        		status =$(this).text().substring(0,$(this).text().indexOf("("));
					}else{
						status = $(this).text();
					}
		        };
		    }); 
			
			//expTitle = $('#expTitle').val();
			getInfoList(1);	
		},error:function(){
			layer.alert("删除异常！");
		}
	});
	},function(){});
}
function selectByKey(e,val,kind){
	if(kind == 1){
		$("#declareGrade").val(val);
		isBox1 = true;
	}
	if(kind == 2){
		$("#areaName").val(val);
	}
	if(kind == 3){
		$("#status").val(val);
	}
	var type = $('#type').val();
	if(type==0){
		isBox0 = true;
	}else if(type==1){
		isBox1 = true;
	}else{
		isBox2 = true;
	}
	$(e).parent().find(".optionBtn").each(function() {
		var $ind = $(this).text().indexOf("(");
		var t = $(this).text().substring(0, $ind)
		if ($ind > -1) {
			$(this).text(t)
		}
	})
	$(e).addClass("selected").siblings().removeClass("selected");
	getInfoList(1);
}

function getArea() {
	var areaList = [ {
		title : "全省",
		value : "",
	}, {
		title : "南昌",
		value : "南昌",
	}, {
		title : "景德镇",
		value : "景德镇",
	}, {
		title : "萍乡",
		value : "萍乡",
	}, {
		title : "九江",
		value : "九江",
	}, {
		title : "新余",
		value : "新余",
	}, {
		title : "鹰潭",
		value : "鹰潭",
	}, {
		title : "赣州",
		value : "赣州",
	}, {
		title : "吉安",
		value : "吉安",
	}, {
		title : "宜春",
		value : "宜春"
	}, {
		title : "抚州",
		value : "抚州"
	}, {
		title : "上饶",
		value : "上饶"
	} ];
	for (var i = 0; i < areaList.length; i++) {
		var map = areaList[i];
		var _div = "";
		if (map.title == '全省') {
			_div += '<div class="optionBtn selected" value=\'' + map.value
					+ '\'  onclick="selectByKey(this,\'' + map.value + '\',2);">'
		} else {
			_div += '<div class="optionBtn" value=\'' + map.value
					+ '\'  onclick="selectByKey(this,\'' + map.value + '\',2);">'

		}
		_div += map.title
		_div += '</div>'
		$('#declareGrade2').append(_div);
	}
}
</script>
</html>
