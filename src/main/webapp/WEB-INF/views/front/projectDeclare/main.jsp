<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>项目申报</title>
<link href="${ctx}/static/css/projectDeclare/projectApplication.css"rel="stylesheet" />
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<script src="${ctx}/static/weixin/js/layer-v2.4/layer.js"></script>
<style>
.buttonContral { /*发布新项目按钮控制*/
	width: 95%;
	height: 70px;
	border-radius: 7px;
	color: #f14241;
	font-size: 26px;
	font-weight: bold;
	padding: 10px 0;
}

.button_Contral { /*权限提示弹框按钮控制*/
	margin: 10px 1% 0;
	text-align: center;
	border-radius: 20px;
	font-weight: bold;
}
</style>
<script>
 $(function(){
    $(".tabName ul li").each(function(){//页面头部模块切换控制
		var index=$(this).index();
		$(".tabName ul li").eq(0).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		})
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(1).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		})
    });
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
		})
    });
	
 })
 function authorityTips(){ //权限提示弹框
 	layer.open({
		type: 1,
		title:false,
		shadeClose: true,
		shade: [0],
		area:['500px','280px'],
		closeBtn:0,
		content: $('#authorityTips')
	});
 };
 function createProject(){
 	location.href="createProject.html";
 }
</script>
<script type="text/javascript">
$(function(){
	getInfoList(1,10,0,"","","");
	$("#allKey .optionBtn").click(function(){
	if($(this).hasClass("selected")){
		if($(this).text().indexOf("(")!=-1){
			$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
		}
			$(this).removeClass("selected");
		}else{
		 $("#declareStatus .optionBtn").each(function(){
	            if($(this).hasClass("selected")){
	            	if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
	            	$(this).removeClass("selected");
	            }
	        }); 
		 $("#declareGrade .optionBtn").each(function(){
	            if($(this).hasClass("selected")){
	            	if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
	            	$(this).removeClass("selected");
	            }
	        });
		 $(this).addClass("selected");
	}
	});
	
	$("#declareGrade .optionBtn").click(function(){//标签选择控制
		
		if($(this).hasClass("selected")){
			if($(this).text().indexOf("(")!=-1){
				$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
			}
			$(this).removeClass("selected");
		}else{
			$("#declareGrade .optionBtn").each(function(){
	            if($(this).hasClass("selected")){
	            	if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
	            	$(this).removeClass("selected");
	            }
	        }); 
			$("#allKey .optionBtn").each(function(){
	            if($(this).hasClass("selected")){
	            	if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
	            	$(this).removeClass("selected");
	            }
	        }); 
			$("#declareStatus .optionBtn").each(function(){
	            if($(this).hasClass("selected")){
	            	if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
	            	$(this).removeClass("selected");
	            }
	        }); 
		$(this).addClass("selected");
		}
	});
	
	$("#declareStatus .optionBtn").click(function(){//标签选择控制
		if($(this).hasClass("selected")){
			if($(this).text().indexOf("(")!=-1){
				$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
			}
			$(this).removeClass("selected");
		}else{
			$("#declareStatus .optionBtn").each(function(){
	            if($(this).hasClass("selected")){
	            	if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
	            	$(this).removeClass("selected");
	            }
	        }); 
			$("#allKey .optionBtn").each(function(){
	            if($(this).hasClass("selected")){
	            	if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
	            	$(this).removeClass("selected");
	            }
	        }); 
			$("#declareGrade .optionBtn").each(function(){
	            if($(this).hasClass("selected")){
	            	if($(this).text().indexOf("(")!=-1){
						$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
					}
	            	$(this).removeClass("selected");
	            }
	        }); 
			$(this).addClass("selected");
		}
	});
	
	var msg = '${message}';
	if(msg!=null&&msg!=""){
		tips(msg);
		msg=null;
	}
});

function getInfoList(pageNum,pageSize,type,declareGrade,declareStatus,declareTitle,areaId){ //type: 0:全部项目 1:我申报的 2:已发项目
	$('#pageNum').val(pageNum);
	if(declareGrade!=null && declareGrade!= '' && declareGrade.indexOf("(")!=-1){
		declareGrade = declareGrade.substring(0,declareGrade.indexOf("("));
	}
	if(declareStatus!=null && declareStatus!= '' && declareStatus.indexOf("(")!=-1){
		declareStatus = declareStatus.substring(0,declareStatus.indexOf("("));
	}
	 if(declareStatus=="申报中"){
	 		 declareStatus =0;
	  	 }
	 	 if(declareStatus=="已截止"){
			 declareStatus = 1;
		 }
		 if(declareStatus=="已公示"){
			 declareStatus = 2;
		}
	$.ajax({
		url:"${ctx}/projectDeclare/json/list",
		type:"post",
		data:{
				"pageNum":pageNum,
				"pageSize":pageSize,
				"fastQuery":1,
				"type":type,
				"declareGrade":declareGrade,
				"declareStatus":declareStatus,
				"declareTitle":declareTitle,
				"areaId":areaId
			 },
		dataType:"json",
		success:function(result){
			if(result.code==-1){
				layer.alert(result.msg);
			}else if(result.code==2){
				if(type==0){
					$("#declareStatus .optionBtn").each(function(){
				         if($(this).hasClass("selected")){
				        	 if($(this).text().indexOf("(")!=-1){
				        		 $(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
				         }
				       } 
					 });
					$("#declareGrade .optionBtn").each(function(){
				         if($(this).hasClass("selected")){
				        	 if($(this).text().indexOf("(")!=-1){
				        		 $(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
				         }
				       } 
					 });
					 $("#allKey .optionBtn").each(function(){
				         if($(this).hasClass("selected")){
				        	 if($(this).text().indexOf("(")!=-1){
				        		 $(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
				         }
				       } 
					 });
					 $("#areaList .optionBtn").each(function(){
				         if($(this).hasClass("selected")){
				        	 if($(this).text().indexOf("(")!=-1){
				        		 $(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
				         }
				       } 
					 });
					
					 $('#allList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
				    }else if(type==1){
					  $('#myApplyPro').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
				  }else if(type==2){
					  $('#mylist').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
				  }
				$('#getmoreAllActi').hide();
				$('#getmoreAllActii').hide();
				$('#getmoreAllActiii').hide();
			}else if(result.code==-2){
				layer.msg(result.msg);
				$('#getmoreAllActi').hide();
				$('#getmoreAllActii').hide();
				$('#getmoreAllActiii').hide();
			}else{
				var list = result.value;
				$("#declareStatus .optionBtn").each(function(){
		            if($(this).hasClass("selected")){
		            	if($(this).text().indexOf("(")!=-1){
							$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
						}
		            	$(this).text($(this).text()+"("+result.msg+")");
		            }
		        }); 
				$("#allKey .optionBtn").each(function(){
		            if($(this).hasClass("selected")){
		            	if($(this).text().indexOf("(")!=-1){
							$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
						}
		            	$(this).text($(this).text()+"("+result.msg+")");
		            }
		        }); 
				$("#declareGrade .optionBtn").each(function(){
		            if($(this).hasClass("selected")){
		            	if($(this).text().indexOf("(")!=-1){
							$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
						}
		            	$(this).text($(this).text()+"("+result.msg+")");
		            }
		        }); 
				$("#areaList .optionBtn").each(function(){
		            if($(this).hasClass("selected")){
		            	if($(this).text().indexOf("(")!=-1){
							$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
						}
		            	$(this).text($(this).text()+"("+result.msg+")");
		            }
		        }); 
							if(type==0&&pageNum==1){
								 $('#allList').empty();
							    }else if(type==1&&pageNum==1){
								  $('#myApplyPro').empty();
							  }else if(type==2&&pageNum==1){
								  $('#mylist').empty();
							  }
				 
				for(var i=0;i<list.length;i++){
					var info = list[i];
					var _div = '<div class="declareDataBar">'
							  +'<a href="${ctx}/projectDeclare/view?declareId='+info.declareId+'" style="text-decoration:none;">'
							  +'<div style="float:left;">'
							  +'<img src="'+info.declareImage+'" width="200px;" height="111px;">'
							  +'<div style="text-align:center;">';
							  if(info.endDate==-1){
								  _div +=  '申报已截止';
							  }else if(info.endDate==null){
								  _div +=  info.declareRemark == null ? "": info.declareRemark;
							  }else{
								  if(info.endDate==0){
									  _div += '<font style="color:#f14241; font-size:16px;">今天截止</font>';
								  }else{
									  _div += '距离申报结束还有<font style="color:#f14241; font-size:16px;">'+info.endDate+'</font>天';
								  }
							  }
					   _div += '</div>'
							  +'</div>'
							  +'<div style="margin-left:220px;">'
							  +'<div class="declareTitle">'+info.declareTitle+'</div>'
							  +'<div class="declareData">'
							  +'<div style="color:#8A8A8A; float:left;">'
							  +'<div class="declareDataLeft">发布时间：</div>'
							  +'<div class="declareDataRight">'+info.createTimeStr+'</div>'
							  +'<div class="declareDataLeft">项目级别：</div>'
							  +'<div class="declareDataRight">'+info.declareGrade+'</div>'
							  +'<div class="declareDataLeft">主管单位：</div>'
							  +'<div class="declareDataRight">'+info.supervisorName+'</div>'
							  +'</div>';
					 		 if(info.declareStatus==0){
					  		  _div += '<div class="declareLabel_green">申报中</div>';
					 		  }else if(info.declareStatus==1){
								_div += '<div class="declareLabel_gray">已截止</div>';
								}else{
								_div += '<div class="declareLabel_blue">已公示</div>';
								  }
					    _div += '<div style="clear:both;"></div>'
							  +'</div>'
							  +'</div>'
							  +'<div style="clear:both;"></div>';
							  if(info.isRecommend==1&&type==0){
								  _div += '<img src="${ctx}/static/image/projectDeclare/recommend.png" width="47px;" height="47px;" class="recommendItem">';
							  }
					  _div +=  '</a>'
							  +'</div>';
							  if(type==0){
					            $('#allList').append(_div); 
							  }else if(type==1){
								  $('#myApplyPro').append(_div); 
							  }else{
								  $('#mylist').append(_div); 
							  }
							  
					if(result.code==0){
						$('#getmoreAllActi').hide();
						$('#getmoreAllActii').hide();
						$('#getmoreAllActiii').hide();
					}else if(result.code==1){
						$('#getmoreAllActi').show();
						$('#getmoreAllActii').show();
						$('#getmoreAllActiii').show();
					}
				}
			}
		},
		error:function(){
			tips("请求超时，请稍后重试");
			},
		});
}

 function selectByKey(obj,kind){
		 $('#allList').empty();
		 $('#myApplyPro').empty();
		 $('#mylist').empty();
	 var declareStatus = null;
	 var declareGrade = null;
	 var areaId = null;
	 var declareTitle = $('#declareTitle').val();
	 var type =   $('#type').val();
	 $("#areaList .optionBtn").each(function(){
		 if($(this).hasClass("selected")){
			 areaId = $(this).attr("value");
		 }
	 });
	 if(kind==0){
		 getInfoList(1,10,0,"","",declareTitle,areaId);
	 }else{
		 if(type==0){
			 if(kind==1){
		
				 if(!$(obj).hasClass("selected")){
					 declareGrade = $(obj).text();
				 }
				/*  $("#declareStatus .optionBtn").each(function(){
	    		     if($(this).hasClass("selected")){
	   			     	 if($(this).text()=="申报中"){
	     		   		 declareStatus = 0;
	     		   	 }
	      		  	 if($(this).text()=="已截止"){
	       		 		 declareStatus = 1;
	       		 	 }
	       		 	 if($(this).text()=="已公示"){
	        				 declareStatus = 2;
	        			 }
	       		  }
	   		  }); */ 
			 }
			 if(kind==2){
				 if(!$(obj).hasClass("selected")){
        			 declareStatus = $(obj).text();
				 }
			 }
			 if(kind==3){
				 $("#declareStatus .optionBtn").each(function(){
	   		      if($(this).hasClass("selected")){
	   		    	declareStatus = $(obj).text();
	       		  }
	   		  }); 
				 $("#declareGrade .optionBtn").each(function(){
					 if($(this).hasClass("selected")){
						 declareGrade = $(this).text();
	      			   }
				 });
			 }
			 getInfoList(1,10,0,declareGrade,declareStatus,declareTitle,areaId);
			 }
	 }
			 if(type==1){
	  		 getInfoList(1,10,1,"","",declareTitle,areaId);
			 }
			 if(type==2){
			   getInfoList(1,10,2,"","",declareTitle,areaId);
			 }
	}
 
 function searchByArea(obj){
	 $('#allList').empty();
	 $('#myApplyPro').empty();
	 $('#mylist').empty();
		 var areaId = null;
		 var declareStatus = "";
		 var declareGrade = "";
		 var declareTitle = $('#declareTitle').val();
		 if(!$(obj).hasClass("selected")){
			 areaId = $(obj).attr("value");
			 $("#areaList .optionBtn").each(function(){
				  if($(this).hasClass("selected")){
					  $(this).removeClass("selected");
					  if($(this).text().indexOf("(")!=-1){
			        		 $(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
			         }
		  		  }
			  }); 
			 $("#areaList .optionBtn").each(function(){
				  if($(this).text()==$(obj).text()){
					  $(this).addClass("selected");
		  		  }
			  }); 
		 }else{
			 $(obj).removeClass("selected");
			 if($(obj).text().indexOf("(")!=-1){
        		 $(obj).text($(obj).text().substring(0,$(obj).text().indexOf("(")));
      	   }
		 }
		 $("#declareStatus .optionBtn").each(function(){
  		      if($(this).hasClass("selected")){
      		 	 if($(this).text()=="申报中"){
      		 		 declareStatus = 0;
     		  	 }
      		 	 if($(this).text()=="已截止"){
       				 declareStatus = 1;
       			 }
       			 if($(this).text()=="已公示"){
       				 declareStatus = 2;
       			 }
      		  }
  		  }); 
			 $("#declareGrade .optionBtn").each(function(){
				 if($(this).hasClass("selected")){
					 declareGrade = $(this).text();
     			   }
			 });
		 
		 getInfoList(1,10,0,declareGrade,declareStatus,declareTitle,areaId);
	 
	 
 }
 
 function setType(type){
	
    $('#type').val(type);
    if(type==0){
    	  $('.projectSearch').show();
       
        $("#declareGrade .optionBtn").each(function(){
            if($(this).hasClass("selected")){
            	$(this).removeClass("selected");
            	 if($(this).text().indexOf("(")!=-1){
	        		 $(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
	         }
            }
        }); 
   	 $("#declareStatus .optionBtn").each(function(){
            if($(this).hasClass("selected")){
            	$(this).removeClass("selected");
            	 if($(this).text().indexOf("(")!=-1){
	        		 $(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
	         }
            }
            
        }); 
   		$("#allKey .optionBtn").each(function(){
            if(!$(this).hasClass("selected")){
            	$(this).addClass("selected");
            }
        }); 
   		$("#areaList .optionBtn").each(function(){
   		 	if($(this).hasClass("selected")){
         		$(this).removeClass("selected");
         		 if($(this).text().indexOf("(")!=-1){
	        		 $(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
	         }
        	 }
   		 	if($(this).text().indexOf("全部")!=-1){
   		 	$(this).addClass("selected");
   		 	}
        }); 
   		
	  }else if(type==1){
		  $('.projectSearch').hide();
	  }else{
		  $('.projectSearch').hide();
		 
	  }
    getInfoList(1,10,type,'','','');
 }
 
 function getmore(){
	var pageNum = Number($("#pageNum").val())+1;
	var declareStatus = null;
	 var declareGrade = null;
	 var declareTitle = $('#declareTitle').val();
	 $("#declareStatus .optionBtn").each(function(){
         if($(this).hasClass("selected")){
        	 if($(this).text().substr(0, $(this).text().indexOf('('))=="申报中"){
        		 declareStatus = 0;
        	 }
        	 if($(this).text().substr(0, $(this).text().indexOf('('))=="已截止"){
        		 declareStatus = 1;
        	 }
        	 if($(this).text().substr(0, $(this).text().indexOf('('))=="已公示"){
        		 declareStatus = 2;
        	 }
         }
     }); 
	 $("#declareGrade .optionBtn").each(function(){
		 if($(this).hasClass("selected")){
			 declareGrade = $(this).text().substr(0, $(this).text().indexOf('('));
         }
	 });
	 getInfoList(pageNum,10,$("#type").val(),declareGrade,declareStatus,declareTitle);
 }
 
 function add(){
	 $.ajax({
			url:"${ctx}/projectDeclare/isUpgrade",
			type:"get",
			success:function(result){
				 if(result==0){
					confirm('您尚未升级成政府用户，是否去升级？', function(index) {
						 window.location.href="${ctx}/projectDeclare/upgradeCreate";
					},function(){});  
				}else if(result==2){
					tips('您已提交升级申请，请耐心等待审核结果！');
				}else if(result==1){
					 window.location.href="${ctx}/projectDeclare/create";
				}else if(result==3){
					tips('请先登录！');
				} 
            },
			error:function(){
				layer.alert("创建异常！");
				},
			});
 }

 function morePublicity(){
	 $("#declareGrade .optionBtn").each(function(){
         if($(this).hasClass("selected")){
        	 if($(this).text().indexOf("(")!=-1){
     			$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
     		}
         	$(this).removeClass("selected");
         }
     }); 
	 $("#declareStatus .optionBtn").each(function(){
         if($(this).hasClass("selected")){
        	 if($(this).text().indexOf("(")!=-1){
     			$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
     		}
         	$(this).removeClass("selected");
         }
         if($(this).text()=="已公示"){
        	 $(this).addClass("selected");
         }
     }); 
		$("#allKey .optionBtn").each(function(){
         if($(this).hasClass("selected")){
        	 if($(this).text().indexOf("(")!=-1){
     			$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
     		}
         	$(this).removeClass("selected");
         }
     }); 
	 $('#allList').empty();
	 getInfoList(1,10,0,"",2,"");
 }
</script>
</head>

<body>
	<div class="project_main">
		<div class="project_header">
			<%@ include file="../common/header.jsp"%>
			
		</div>

		<div class="project_content">
			<div class="projectSearchBar">
				<div class="dataStatistics">
					<font style="color: #f14241; font-size: 24px; font-weight: bold; margin-right: 5px;">${countApplying}</font>项&nbsp;正在申报
				</div>
				<div class="dataStatistics">
					<font style="color: #f14241; font-size: 24px; font-weight: bold; margin-right: 5px;">${countPulicity }</font>项&nbsp;申报已公示
				</div>
				<div class="projectSearch">
					<input type="text" placeholder="标题关键字" id="declareTitle" style="border-radius: 4px;border: 1px solid #e1e1e1;"> 
					<img src="${ctx}/static/image/product/sea.png" width="20px;" height="20px;" onclick="selectByKey(this,3);">
				</div>
				<div style="clear: both;"></div>
			</div>
			<div style="margin-top: 10px;">
				<div class="project_contLeft">
					<div class="titleName">
						<ul>
							<li onclick="setType(0);"><a href="javascript:;" >全部项目</a></li>
							<li  onclick="setType(1);"><a href="javascript:;">我申报的</a></li>
							<li  onclick="setType(2);"><a href="javascript:;">已发项目</a></li>
							<input type="hidden" id="type" value="0" />
							<input type="hidden" id="pageNum" value="1" />
						</ul>
						<div style="clear: both;"></div>
					</div>
					<div class="titleItem">
						<div>
							<div class="searchOptions" style="float: left;">
								<span style="display: block;margin: 0px 7px 5px 0;padding: 2px 7px;">级别</span>
							</div>
							<div class="searchOptions" id="allKey">
								<div class="optionBtn selected" onclick="selectByKey(this,0);">全部</div>
							</div>
							<div class="searchOptions" id="declareGrade">
								<div class="optionBtn" onclick="selectByKey(this,1);">国家级</div>
								<div class="optionBtn" onclick="selectByKey(this,1);">省级</div>
								<div class="optionBtn" onclick="selectByKey(this,1);">市级</div>
								<div class="optionBtn" onclick="selectByKey(this,1);">县级</div>
								<div class="optionBtn" onclick="selectByKey(this,1);">其他</div>
							</div>
							<div class="searchOptions" id="declareStatus">	
								<div class="optionBtn" onclick="selectByKey(this,2);">申报中</div>
								<div class="optionBtn" onclick="selectByKey(this,2);">已公示</div>
								<div class="optionBtn" onclick="selectByKey(this,2);">已截止</div>
							</div>
							<c:if test="${entryStatus==false }">
							<div style="float: left; width:100%;margin-bottom: 15px;" >
								<div class="searchOptions" style="float: left;">
									<span style="display: block;margin: 5px 7px 5px 0;padding: 2px 7px;">地域</span>
								</div>
								<div class="searchOptions" id="areaList">
									<div class="optionBtn selected" onclick="searchByArea(this)">全部</div>
									<c:forEach items="${areaList }" var="obj">
										<div class="optionBtn" onclick="searchByArea(this);" value="${obj.organizationId }">${obj.organizationName }</div>
									</c:forEach>
								</div>
								<div style="clear: both;"></div>
							</div>
							</c:if>
							<c:if test="${entryStatus==true && zoneLevel=='area'}">
							<div style="float: left; width:100%;margin-bottom: 15px;" >
								<div class="searchOptions" style="float: left;">
									<span style="display: block;margin: 5px 7px 5px 0;padding: 2px 7px;">地域</span>
								</div>
								<div class="searchOptions" id="areaList">
									<div class="optionBtn" onclick="searchByArea(this);">全部</div>
									<div class="optionBtn" onclick="searchByArea(this);" value="360000">省级发布</div>
									<div class="optionBtn" onclick="searchByArea(this);" value="${areaId}">本市发布</div>
								</div>
								<div style="clear: both;"></div>
							</div>
							</c:if>
							<div style="clear: both;"></div>
							<div id="allList" style="border: 1px solid #e6e6e6;">
								
							</div>
							<div id="getmoreAllActi" style="margin: 10px 0;">
								<a href="javascript:void(0);" onClick="getmore();"
									class="renovate"> <span class="renovateTitle">加载更多</span>
								</a>
							</div>
						</div>

						<div style="display: none;">
							<div id="myApplyPro" style="border: 1px solid #e6e6e6;">
								

							</div>
							<div id="getmoreAllActii" style="margin: 10px 0;">
								<a href="javascript:void(0);" onClick="getmore();"
									class="renovate"> <span class="renovateTitle">加载更多</span>
								</a>
							</div>
						</div>

						<div style="display: none;">
							<div id="mylist" style="border: 1px solid #e6e6e6;">
								

							</div>
							<div id="getmoreAllActiii" style="margin: 10px 0;">
								<a href="javascript:void(0);" onClick="getmore();"
									class="renovate"> <span class="renovateTitle">加载更多</span>
								</a>
							</div>
						</div>
					</div>

				</div>

				<div class="project_contRight">
					<div class="buttonBar" style="display:none;">
						<button class="button button-raised buttonContral" onClick="add();" style="font-family: 'Microsoft YaHei'">
							<img src="${ctx}/static/image/projectDeclare/release.png" width="30px;" height="30px;" class="imgContral">发布新项目
						</button>
					</div>
					<div class="project_rightDataBar">
						<div class="project_rightTop">
							<div class="project_rightTitle">项目公示</div>
							<div class="project_rightContMore" onclick="morePublicity();">更多></div>
						</div>
						<div style="padding: 5px;">
						<c:forEach items="${publicityList }" var="publicity">
							<div class="project_rightCont">
								<div class="dotContral">
									<div class="dot"></div>
								</div>
								<div style="margin-left: 15px;"><a href="${ctx}/projectDeclare/view?publicityView=1&publicityId=${publicity.publicityId }&declareId=${publicity.declareId}">${publicity.publicityTitle }</a></div>
							</div>
						</c:forEach>
						</div>
					</div>
					<div class="project_rightDataBar">
						<div class="project_rightTop">
							<div class="project_rightTitle">热门申报</div>
							<!-- <div class="project_rightContMore">更多></div> -->
						</div>
						<div style="padding: 7px 15px;">
						<c:forEach items="${infoList }" var="info">
							<div class="project_rightCont" style="margin-top:5px;">
								 <img src="${info.declareImage }"
									width="90px;" height="50px;" style="float: left;"> 
								<div style="margin-left: 100px; line-height: 1.4;min-height:55px;" >
									<a href="${ctx}/projectDeclare/view?declareId=${info.declareId}">${info.declareTitle}</a></div>
							</div>
						</c:forEach>
						</div>
					</div>
				</div>

				<div style="clear: both;"></div>
			</div>

		</div>

		<div id="authorityTips" style="display: none;">
			<div>
				<img src="${ctx}/static/image/projectDeclare/headPortrait.png"
					width="90px;" height="90px;"
					style="display: block; margin: 25px auto;">
				<div style="margin: 0 auto 30px; color: #aaa; text-align: center;">你当前账号未开通发布项目权限</div>
				<div style="width: 80%; margin: 0 auto;">
					<input type="button" class="button button-raised button_Contral"
						style="width: 37%;" value="暂不申请"> <input type="button"
						class="button button-raised button-caution button_Contral"
						style="width: 58%;" value="我要申请">
				</div>
			</div>
		</div>

	 <%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>
