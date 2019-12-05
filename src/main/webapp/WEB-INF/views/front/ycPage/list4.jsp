<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>园区招聘</title>
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
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
			    	<p class="navTitle">园区招聘</p>
			    	<p>
			    	<font class="projectNum" id="projectNum1"></font>&nbsp; <font id="font1">个</font>  &nbsp;&nbsp; <font id="font2">企业</font>
					&nbsp;&nbsp;&nbsp;&nbsp;<font class="projectNum" id="projectNum2"></font>&nbsp;<font>条</font>&nbsp;&nbsp;<font>企业招聘信息</font>
					&nbsp;&nbsp;&nbsp;&nbsp;<font class="projectNum" id="projectNum3"></font>&nbsp; <font id="font3">个</font>  &nbsp;&nbsp;
					 <font id="font4">岗位</font>
					</p>
			     </div>
			</div>
		</div>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-list">
							<input type="hidden" id="type" value="0" />
							<input type="hidden" id="pageNum" value="1" />
							<div class="searchKeys searchKeys1" >
								<div class="searchOptions" id="declareStatus">
<!-- 									<font>年份</font>
 -->									<div class="optionBtn selected"  value="" onclick="selectByKey(this,1);">全部</div>
 										<div class="optionBtn" id="currentYear" onclick="selectByKey(this,1);"></div>
										<div class="optionBtn" id="lastYear" onclick="selectByKey(this,1);"></div>
								</div>
								<div style="clear: both;"></div>
							</div>
							<div class="title-items">
								<!-- <div class="title-content" id="set0">
									<div id="ycList">
	
									</div>
									<div id="getmoreYc" class="renovate">
										<a href="javascript:void(0);" onClick="getmore();"> 
											<span class="renovateTitle">加载更多</span>
										</a>
									</div>
								</div> -->
								<div class="title-content" id="set1">
									<div id="allList"></div>
									<div id="getmoreAll" class="renovate">
										<a href="javascript:void(0);" onClick="getAllmore();"> 
											<span class="renovateTitle">加载更多</span>
										</a>
									</div>
								</div>
							<!-- 	 <div class="title-content" id="set2" style="display: none;">
									<div id="mylist"></div>
									<div id="getmoreAllActiii" class="renovate">
										<a href="javascript:void(0);" onClick="getmore();"> 
											<span class="renovateTitle">加载更多</span>
										</a>
									</div>
								</div> - -->
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
<script type="text/javascript">
var searchList;
var areaId = '';
var year = "";
$(function(){
	getSearchList();
	$(".nav-content a").removeClass("on");
	$(".nav-content a:eq(2)").addClass("on");
	$(".second-menu p:eq(0) a:eq(1)").addClass("on");
	 $(".searchKeys1 .optionBtn").removeClass("selected");
	 $(".searchKeys1 .optionBtn:eq(0)").addClass("selected");
	 $(".source-room a").removeClass("on");
	$(".source-room a:eq(11)").addClass("on");
	 $(".searchKeys1 .optionBtn").each(function(){
		 if($(this))
		 var $ind = $(this).text().indexOf("(");
		 var t = $(this).text().substring(0,$ind)
		 if($ind > -1){ $(this).text(t)}
	 })
		
 	/* $(".titleName li").on("click",function(){          //大项目tab切换
 		$('#pageNum').val(1);
		 var $ind = $(this).index();
 	     var year = "";
 	     var  parkId = "";
 	      if($ind==0){
 	    	areaId = 360900;
 	     }else{
 	    	areaId = "";
 	     } 
		 $('#type').attr('value',$ind);
		 $(".searchKeys1 .optionBtn").removeClass("selected");
		 $(".searchKeys1 .optionBtn:eq(0)").addClass("selected");
		 $(".searchKeys2 .optionBtn").removeClass("selected");
		 $(".searchKeys2 .optionBtn:eq(0)").addClass("selected");
		 $(".searchKeys1 .optionBtn").each(function(){
			 if($(this))
			 var $ind = $(this).text().indexOf("(");
			 var t = $(this).text().substring(0,$ind)
			 if($ind > -1){ $(this).text(t)}
		 })
	 	 $(".searchKeys2 .optionBtn1").each(function(){
		 var $ind = $(this).text().indexOf("(");
		 var t = $(this).text().substring(0,$ind)
		 if($ind > -1){ $(this).text(t)}
		 })
		 $(this).addClass("on").siblings().removeClass("on");
		 $("#set"+$ind).siblings().fadeOut("fast");
		 setTimeout(function(){$("#set"+$ind).fadeIn("fast");},200);
		 getInfoList(1,10,"",areaId,"");

	});  */
	getInfoList(1,10,'','');
	
	var msg = '${message}';
	if(msg!=null&&msg!=""){
		tips(msg);
		msg=null;
	}
});
function getSearchList(){
	 var date=new Date;
	 var year=date.getFullYear();
	 $('#currentYear').html(year);
	 $('#currentYear').attr('value',year);
	 $('#lastYear').html(year-1);
	 $('#lastYear').attr('value',year-1);
/* 	$.ajax({
		url : "${urlPath}XOffice/interface/json/recruitManageInfo/areaCount",
		type : "post",
		data : {
			"areaId": searchId
		},
		dataType : "json",
		success : function(result) {
			var self = this;
			if(result.success){
				searchList = result.historyList.searchList;
				for(var i=0; i<searchList.length;i++){
					var list = searchList[i];
					var _div = "";
					_div += '<div class="optionBtn" value=\''+list.parkId+'\' onclick="selectByKey(this,2);">'
					_div += list.parkName
					_div += '</div>'
					$('#declareGrade').append(_div);
				}
				
			}else{
				layer.alert("系统异常");
			}
		},
		error : function() {
			layer.alert("系统异常");
		}
	}); */
}
function getInfoList(pageNum,pageSize,time,areaId){
	var type = 1;
	$('#pageNum').val(pageNum);
		$.ajax({
   			url : "${urlPath}XOffice/interface/json/recruitInfo/recruitList",
			type : "post",
			data : {
				"time": time,
	 			"areaId": areaId,
            	"pageNum":pageNum,
    			"pageSize":pageSize,
			},
			dataType : "json",
			success : function(result) {
				var infoList = result.value;
				var count = result.count;
				if(count.total1&&count.total2&&count.total3){
					$('#projectNum1').text(count.total1);	
					$('#projectNum2').text(count.total2);	
					$('#projectNum3').text(count.total3);
					$('#projectNum1').show();
					$('#projectNum2').show();	
					$('#projectNum3').show();
					$('#font1').show();
					$('#font2').show();	
					$('#font3').show();
					$('#font4').show();
					
				}else{
					$('#projectNum1').hide();
					$('#projectNum2').text(result.total);	
					$('#projectNum3').hide();
					$('#font1').hide();
					$('#font2').hide();	
					$('#font3').hide();
					$('#font4').hide();
				}
				if(infoList.length>0){
					if(type==0&&pageNum==1){
					 	$('#ycList').empty();
				    }else if(type==1&&pageNum==1){
					 	$('#allList').empty();
				    }
					for(var i=0;i<infoList.length;i++){
						var info = infoList[i];
						var text = '';
						text = text.replace(/<(table|tr|td|%)[\s\S]*?\/\1>/ig,"");
						text = text.replace(/<[^>]+>/g,"");
						var _div =   '<div class="declareDataBar">'
							   if(info.recruitUrl){
								   _div += '<a href="'+info.recruitUrl+'" target="_blank">'
							    }else{
							    	_div += '<a target="_blank" href="${ctx}/yc/detail?type=3&id='+info.parkId+'&time='+info.recruitTime+'&entranceId=${entranceId}">'
							    }
/* 							+'<a href="">'
 */							+	'<div class="text-box"><div class="text-box_title">';
					    	_div += '<div class="title-text"><div class="declareTitle">';
							_div += info.recruitTitle+'</div>'
							+'<div class="declareData">'
							+ '<font>发布时间：'+dateToTimeStr(info.recruitTime,'yyyy-MM-dd')+'</font>'
							+ '<font>所属园区：'+info.parkName+'</font>'
							+  '</div>'
							+'</div></div><div class="declare-content">'+text+'</div></div>'
							 _div += '</a></div>';
							if(type==0){
								$('#ycList').append(_div);
							}else{
								$('#allList').append(_div);
							}
							 
					}
			 		$(".searchKeys1 .optionBtn").each(function(){
						if($(this).hasClass("selected")){
							if(result.total!=0&&pageNum == 1){
								 var $ind = $(this).text().indexOf("(");
								 var t = $(this).text().substring(0,$ind)
								 if($ind > -1){ $(this).text(t)}
								$(this).text($(this).text() + "("+result.total+")");
							}
						}
					})
					if(pageNum*10<result.total){
						if(type==0){
							$('#getmoreYc').show();
						}else{
							$('#getmoreAll').show();
						}
					}else{
						if(type==0){
							$('#getmoreYc').hide();
						}else{
							$('#getmoreAll').hide();
						}
					}
				}else{
					if(type==0){
						$('#ycList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
						$('#getmoreYc').hide();
					}else{
						$('#allList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
						$('#getmoreAll').hide();
					}

				}
			},
			error : function() {
				layer.alert("系统异常");
			}
		});
	}

function authorityTips() { //权限提示弹框
	layer.open({
		type : 1,
		title : false,
		shadeClose : true,
		shade : [ 0 ],
		area : [ '500px', '280px' ],
		closeBtn : 0,
		content : $('#authorityTips')
	});
};

function selectByKey(obj,kind){
	$(obj).addClass("selected").siblings().removeClass("selected");
	 year = $(obj).attr('value');
	var type =   $('#type').val();
		 $('#allList').empty();
		 $(".searchKeys1 .optionBtn").each(function(){
			 var $ind = $(this).text().indexOf("(");
			 var t = $(this).text().substring(0,$ind)
			 if($ind > -1){ $(this).text(t)}
		 })
	 getInfoList(1,10, year,''); 
}
 
/*  function getmore(){
	 var pageNum = Number($("#pageNum").val())+1;
	 getInfoList(pageNum,10,year,areaId,parkId); 
 } */
 function getAllmore(){
	 var pageNum = Number($("#pageNum").val())+1;
	 getInfoList(pageNum,10,year,''); 
 }
 
</script>
</html>
