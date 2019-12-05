<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>在线调查</title>
<link href="${ctx}/static/css/investigation/onlineSurvey.css" rel="stylesheet"/>
<link href="${ctx}/static/css/investigation/style_deepred.css" rel="stylesheet" media="screen" />
<link href="${ctx}/static/css/investigation/iCheck/custom.css" rel="stylesheet"/>
<script src="${ctx}/static/js/jquery.nivo.slider.pack_deepred.js"></script>
<script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>

<script>
	$(document).ready(function(){
		$(document).ready(function(){
			$(".i-checks").iCheck({
				checkboxClass:"icheckbox_square-green",
				radioClass:"iradio_square-green"
			});
		});
	});
</script>
<style>
.tabItem {
	background-color:#f1921c;
	height:40px;
}
.itemClick { background-color:#B76501;}
.displayNone{display:none;}
tr td{
	text-align: center;
}
body .reportBar{border-radius:10px!important;}
.returnBtn {
	width:100px;
	border:1px solid #E6E6E6;
	background-color:#F2F2F2;
	color:#000;
	padding:4px 0;
	margin-right:5px;
	float:right;
}
.sendBtn {
	width:100px;
	border:1px solid #F04444;
	background-color:#F04444;
	color:#fff;
	padding:4px 0;
	margin-right:15px;
	float:right;
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
			});
	    });
		$(".tabItem ul li").each(function(){
			$(".tabItem ul li").eq(2).addClass("itemClick");
			$(this).click(function(){
				$(this).addClass("itemClick").siblings().removeClass("itemClick");
			});
	    });
		$(".titleName ul li").each(function(){//页面内容切换控制
			var index=$(this).index();
			$(".titleName ul li").eq(0).addClass("titleClick");
			$(this).click(function(){
				$(this).addClass("titleClick").siblings().removeClass("titleClick");
				$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
			});
	    });
		
	 });
	 $(window).load(function() {
	   $('#slider_top').nivoSlider({
		    directionNav: false,
		    captionOpacity: 0 ,
		    controlNav: true,
		    boxCols: 8,
		    boxRows: 4,
		    slices: 15,
		    effect:'random',
		    animSpeed: 500,
		    pauseTime: 3000 });
	 });
</script>
<script type="text/javascript">
	$(function(){
		if('${type}'!=null&&'${type}'!=""){
			$("#type").val('${type}');
		}else{
			$("#type").val(1);
		}
		$(".mySurvey").hide();
		$("#draf").addClass("displayNone");
		getList(1,1,"",[-1,1]);
		
		if('${type}'==2){
			$(".surveyPictureBar").hide();	
			$(".allSurveyTable").hide();
			$("#mySurvey1").show();
			$("#draf").removeClass("displayNone");
			
			var index=$("#released").index();
			$("#released").parent().addClass("titleClick").siblings().removeClass("titleClick");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
			$("#type").val(2);
			getList(1,2,"",[-1,0,1]); 
		}else if('${type}'==3){
			$(".surveyPictureBar").hide();	
			$(".allSurveyTable").hide();
			$("#mySurvey2").show();
			
			var index=$("#attended").index();
			$("#attended").parent().addClass("titleClick").siblings().removeClass("titleClick");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
			getList(1,3,"",[-1,1]); 
			
		}
	});

	//获取调查列表
	function getList(pageNum,type,investigationName,status){
		$.ajax({
			url:"${ctx}/investigation/json/list",
			type:"post",
			data:{
				"pageNum":pageNum,
				"type":type,
				"investigationName":investigationName,
				"statusArray":status.toString(),
				'${_csrf.parameterName}':'${_csrf.token}'
			},
			dataType:"json",
			success:function(result){
				if(result.code==-1){
					layer.alert(result.msg);
				}else if(result.code==2){
					$("#getMore").hide();
					layer.msg(result.msg);
				}else{
					var list = result.value;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div = "";
						if(type==1){
							if(i<4&&pageNum==1){
								_div = '<div class="surveyPicture"><img src='+info.extend1+' width="270px;" height="168.75px;" style="display:block;cursor:pointer;" onclick="detail(\''+info.id+'\')">'
									+' <div class="surveyPictureTips">'+info.investigationName+'</div></div>';
								$(".surveyPictureBar").append(_div);
							}else{
								_div = '<tr>'
									+'<td style="width:40%; color:#5e5e5e;cursor:pointer; text-align: left" onclick="detail(\''+info.id+'\')">'
									+'<font style="color:#ccc;">>&nbsp;</font>'+info.investigationName
							//		+'<img src="${ctx}/static/image/investigation/activitybig.jpg" width="20px;" height="10px;" class="newSur">'
									+'</td>';
									if(info.status==1){
										_div += '<td style="width:10%; color:#f1921c;">进行中</td>';
									}else{
										_div += '<td style="width:10%; color:#f1921c;">已结束</td>';	
									}
									_div += '<td style="width:25%; text-align: left;">'
									+'<img src="${ctx}/static/image/investigation/enterCount.png" width="15px;" height="15px;" class="headSign">'
									+'参与人气：<font style="color:#f1921c;">'+info.totalCount+'</font>人'
									+'</td>'
									+'<td style="width:25%; padding:5px 0;">'+getTime(info.publishTime)+' 至  '+(info.endTime==null?"-":getTime(info.endTime))+' </td>'
									+'</tr>';
								
								$(".allSurveyTable").append(_div);
							}
						}else{
							if(i==0&&pageNum==1){
								_div += '<tr class="firstTr">'
									/* +'<th style="width:5%;">'
									+'<div class="i-checks" style="text-align:center;"><input type="checkbox"></div>'
									+'</th> '*/
									+'<th style="width:40%;">标题</th>'
									+'<th style="width:5%;">状态</th>'
									+'<th style="width:10%;">参与人数（人）</th>'
									+'<th style="width:25%;">调查时间</th>'
									+'<th style="width:15%;">操作</th>'
									+'</tr>';
							}
							
							_div += '<tr class="nextTr">'
								/* +'<td style="width:5%;">'
								+'<div class="i-checks" style="text-align:center;"><input type="checkbox"></div>'
								+'</td>' */
								+'<td style="width:40%; color:#5e5e5e; text-align: left">';
								
								if(info.status==0){
									_div += '<font style="color:#1D64F0;">[草稿箱]</font>';
								}
								
								_div += '<font style="color:#ccc;"></font><font style="margin-left:13px;">'+info.investigationName+'<font>'
							//	+'<img src="${ctx}/static/image/investigation/activitybig.jpg" width="20px;" height="10px;" class="newSur">'
								+'</td>';
								if(info.status==1){
									_div += '<td style="width:5%; color:#f1921c;">进行中</td>';
								}else if(info.status==0){
									_div += '<td style="width:5%; color:#f1921c;">草稿</td>';	
								}else{
									_div += '<td style="width:5%; color:#f1921c;">已结束</td>';
								}
								_div += '<td style="width:10%; color:#f1921c;">'+info.totalCount+'</td>'
								+'<td style="width:25%;">'+getTime(info.publishTime==null?info.createTime:info.publishTime)+' 至  '+(info.endTime==null?"-":getTime(info.endTime))+'</td>'
								+'<td style="width:15%;">';
								if(type==2){
									if(info.status==0){
									//	_div += '<img src="${ctx}/static/image/investigation/edit.png" width="20px;" height="20px;" class="operSurvey" style="cursor:pointer;" title="编辑" onclick="edit(\''+info.id+'\')">';
									}else{
										_div += '<img src="${ctx}/static/image/investigation/count2.png" width="20px;" height="20px;" class="operSurvey" title="统计" style="cursor:pointer;" onclick="detailResult(\''+info.id+'\')">';
									}
									
									_div += '<img src="${ctx}/static/image/investigation/downLoad.png" width="20px;" height="20px;" class="operSurvey" title="下载" style="cursor:pointer;" onclick="downLoad(\''+info.id+'\')">'
									+'<img src="${ctx}/static/image/investigation/copy.png" width="20px;" height="20px;" class="operSurvey" title="复制" style="cursor:pointer;" onclick="copy(\''+info.formId+'\',\''+info.id+'\')">'
									+'<img src="${ctx}/static/image/investigation/delete.png" width="20px;" height="20px;" class="operSurvey" title="删除" style="cursor:pointer;" onclick="del(\''+info.id+'\')">';
								}else{
									
									if(info.iscount==1){
										_div += '<img src="${ctx}/static/image/investigation/count2.png" width="20px;" height="20px;" class="operSurvey" title="统计" style="cursor:pointer;" onclick="detailResult2(\''+info.id+'\')">';
									}
									
									_div += '<img src="${ctx}/static/image/investigation/detail.png" width="20px;" height="20px;" class="operSurvey" style="cursor:pointer;" title="详情" onclick="view(\''+info.id+'\')">'; 
								}
								_div += '</td></tr>';
							
							if(type==2){
								$("#mySurveyTable1").append(_div);	
							}else{
								$("#mySurveyTable2").append(_div);								
							}
						}
						
						$(".searchOptions .optionBtn").each(function(){
					        if($(this).hasClass("selected")){
					        	if($(this).text().indexOf("(")!=-1){
					        		$(this).text($(this).text().substring(0,$(this).text().indexOf("("))+"("+result.msg+")");
				            	}else{
				            		$(this).text($(this).text()+"("+result.msg+")");
				            	}
					        }
					   	}); 
					}
					$(".surveyPictureBar").append('<div style="clear:both;"></div>');
					
					if(result.code==1){
						$("#getMore").show();	
					}else{
						$("#getMore").hide();	
					}	
				}
					
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			} 
			
		}); 
	}
	
	//按标签、调查名搜索
	function queryBySearchKey(obj){
		$("#pageNum").val(1);
		if($(obj).hasClass("optionBtn")){
			if($(obj).hasClass("selected")){
				$(obj).removeClass("selected");
				if($(obj).text().indexOf("(")!=-1){
					$(obj).text($(obj).text().substring(0,$(obj).text().indexOf("(")));
				}
			}else{
				$(".searchOptions .optionBtn").each(function(){
		            if($(this).hasClass("selected")){
		            	if($(this).text().indexOf("(")!=-1){
		            		$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
		            	}
		            	$(this).removeClass("selected");
		            }
		        }); 
				$(obj).addClass("selected");
			}
		}else{
			
			$(".searchOptions .optionBtn").each(function(){
	            if($(this).hasClass("selected")){
	            	if($(this).text().indexOf("(")!=-1){
	            		$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
	            	}
	            	$(this).removeClass("selected");
	            }
	        }); 
			
			var searchKey = $("#investigationName").val();
			if(searchKey == null || searchKey == ""){
				layer.msg("请输入搜索内容");
				return;
			}
		}
		selectDiv($("#type").val());
		getList(1,$("#type").val(),$("#investigationName").val(),getStatus());		
	}
	
	//按全部、我发布、我参与搜索
	function queryByAccount(type){
		$("#type").val(type);
		$("#pageNum").val(1);

		selectDiv(type);
		
		$(".searchOptions .optionBtn").each(function(){
	        if($(this).hasClass("selected")){
	        	if($(this).text().indexOf("(")!=-1){
	        		$(this).text($(this).text().substring(0,$(this).text().indexOf("(")));
	        	}
	        	$(this).removeClass("selected");            		
	        }
	    });
		$("#all").addClass("selected");
		$("#investigationName").val("");
		getList(1,type,$("#investigationName").val(),getStatus());
	}
	
	//加载更多数据
	function getMore(){
		var pageNum = Number($("#pageNum").val())+1;
		$("#pageNum").val(pageNum);
		getList(pageNum,$("#type").val(),$("#investigationName").val(),getStatus());
	}
	
	//获取标签对应状态值
	function getStatus(){
		var status = "";
		var count = 0;
		$(".searchOptions .optionBtn").each(function(){
	        if($(this).hasClass("selected")){
	        	var content = $(this).text();
            	count++;
            	if(content.indexOf("(")!=-1){
            		content = $(this).text().substring(0,$(this).text().indexOf("("));
            	}
            	if(content=="全部"){
            		if($("#type").val()==2){
        	    		status = [-1,0,1];
        	    	}else{
        		    	status = [-1,1];
        	    	}
        		}else if(content=="进行中"){
        			status = [1];
        		}else if(content=="已结束"){
        			status = [-1];
        		}else if(content=="草稿箱"){
        			status = [0];
        		}
	        }
	   	});  
	    if(count==0){
	    	if($("#type").val()==2){
	    		status = [-1,0,1];
	    	}else{
		    	status = [-1,1];
	    	}
	    }       	
		return status;
	}
	//div切换
	function selectDiv(type){
		if(type==1){
			$(".surveyPictureBar").show().empty();	
			$(".allSurveyTable").show().empty();
			$("#mySurvey1").hide();
			$("#mySurvey2").hide();
			$("#draf").addClass("displayNone");
		}else if(type==2){
			$(".surveyPictureBar").hide();	
			$(".allSurveyTable").hide();
			$("#mySurvey1").show();
			$("#mySurvey2").hide();
			$("#mySurveyTable1").empty();
			$("#mySurveyTable2").empty();
			$("#draf").removeClass("displayNone");
		}else if(type==3){
			$(".surveyPictureBar").hide();	
			$(".allSurveyTable").hide();
			$("#mySurvey1").hide();
			$("#mySurvey2").show();
			$("#mySurveyTable2").empty();
			$("#mySurveyTable1").empty();
			$("#draf").addClass("displayNone");
		}
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
	
	//checkbook全选
	function selectAll(){
		
	}
	
	//填写详情可编辑
	function detail(id){
		window.location.href="${ctx}/investigation/createInfo/"+id;
	}
	
	//创建调查
	function create(){
		window.location.href="${ctx}/investigation/create";
	}
	
	//统计详情
	function detailResult(id){
		window.location.href="${ctx}/investigation/statisticsDetailResult/"+id;
	}
	
	function detailResult2(id){
		window.location.href="${ctx}/investigation/statisticsDetailResult2/"+id;
	}
	
	//删除
	function del(ids){
		layer.confirm('确认删除？',function(){
			$.ajax({
				url:"${ctx}/investigation/json/delete",
				type:"get",
				data:{
					"items":ids
				},
				dataType:"json",
				success:function(result){
					if(result.code==1){
						layer.msg(result.msg);
						$("#mySurveyTable1").empty();
						getList(1,$("#type").val(),$("#investigationName").val(),getStatus());
					}else{
						layer.alert(result.msg);
					}
				},
				error:function(XMLHttpRequest, textStatus, errorThrown){
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			}); 
		},function(){return;});
		
	}
	
	//复制
	function copy(formId,id){
		$("#formId").val(formId);
		$("#id").val(id);
		layer.open({
			type: 1,
			title:false,
			shadeClose: true,
			skin: 'reportBar',
			shade: [0],
			area:['400px','180px'],
			offset:['200px','600px'],
			closeBtn:0,
			content: $('#reportBar'),
		});
	}
	
	function sendBtn(){
		var name = $("#name").val();
		var id = $("#id").val();
		var formId = $("#formId").val();
		if(name==null||name==""){
			layer.msg("请输入新调查名称");
			return;
		}
		$.ajax({
			url:"${ctx}/investigation/json/copy",
			type:"get",
			data:{
				"id":id,
				"formId":formId,
				"name":name
			},
			dataType:"json",
			success:function(result){
				var code = result.jsonValue.code;
				var msg = result.jsonValue.msg;
				if(code==1){
					layer.closeAll();
					layer.msg("复制成功");
					$("#mySurveyTable1").empty();
					getList(1,2,"",getStatus());
				}else{
					layer.alert(msg);
				}
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
	
	function returnBtn(){
		layer.closeAll();
	}
	//下载
	function downLoad(id){
		window.location.href='${ctx}/investigation/downloadInfoByExcel?id='+id;
	}
	
	//编辑
	function edit(id){
		window.location.href="${ctx}/investigation/create/"+id;
	}
	
	//查看
	function view(id){
		window.location.href="${ctx}/investigation/detailResult/"+id;
	}
	
</script>
</head>

<body>
<div class="survey_main">
	<%@ include file="../common/header.jsp"%>
	
	<div class="survey_content">
		<div class="bg_" style="margin: 0 auto;z-index: 0;margin-bottom: 10px; position:relative">
			<div class="bg_in_red" style="width: 100%;height: 367px;margin: 0 auto;z-index: 1;">
				 <div id="slider-wrap">
					<div id="slider_top" class="nivoSlider">
					<a  class="nivo-imageLink" href="javascript:;" target="_blank" style="width:100%; height:367px;">
					<img src="${ctx}/static/image/investigation/PC.jpg" style="width:100%; height:367px;"/></a>
					<a  class="nivo-imageLink" href="javascript:;" target="_blank" style="width:100%; height:367px;">
					<img src="${ctx}/static/image/investigation/banner.jpg" style="width:100%; height:367px;"/></a>
					<a  class="nivo-imageLink" href="javascript:;" target="_blank" style="width:100%; height:367px;">
					<img src="${ctx}/static/image/investigation/PC.jpg" style="width:100%; height:367px;"/></a>
					</div>
				</div>
			</div>
			<div class="displayFrame">
				<div class="displayFrameTitle">快来一起投票吧！</div>
				<div class="displayFrameCont">
					<div style="padding:0 5px;">已有<font style="color:#F0FF00;">1757325</font>人注册了江西工业园区微讯</div>
					<div style="padding:0 5px;">已有<font style="color:#F0FF00;">1757325</font>个自助调查发布</div>
					<div style="padding:0 5px;">已有<font style="color:#F0FF00;">1757325</font>人次参与投票</div>
					<input type="button" value="发布调查" class="displayFrameBtn" onclick="create()">
				</div>
			</div>
		</div>
		
		<div style="margin-top:10px;">
		<input type="hidden" id="pageNum" name="pageNum" value="1">
		<input type="hidden" id="type" name="type" >
			<div class="titleName">
				<ul>
					<li><a href="javascript:;" onclick="queryByAccount('1')">全部调查</a></li>
					<li><a href="javascript:;" onclick="queryByAccount('2')" id="released">我发布的</a></li>
					<li><a href="javascript:;" onclick="queryByAccount('3')" id="attended">我参与的</a></li>
				</ul>
				<div class="searchBar">
					<input type="text" placeholder="按调查名搜索" id="investigationName" />
					<img src="${ctx}/static/image/activity/search.png" width="15px" height="15px;" onclick="queryBySearchKey(this)"/>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div class="titleItem">
				<div>
					<div class="searchOptions">
						<div id="all" class="optionBtn selected" onclick="queryBySearchKey(this)">全部</div>
						<div class="optionBtn" onclick="queryBySearchKey(this)">进行中</div>
						<div class="optionBtn" onclick="queryBySearchKey(this)">已结束</div>
						<div id="draf" class="optionBtn" onclick="queryBySearchKey(this)" >草稿箱</div>
						<div style="clear:both;"></div>
					</div>
					<div class="surveyPictureBar"></div>
					<div class="allSurvey">
						<table class="allSurveyTable"></table>
					</div>
					
					<div class="mySurvey" id="mySurvey1">
						<table id="mySurveyTable1"></table>
					</div>
					
					<div class="mySurvey" id="mySurvey2">
						<table id="mySurveyTable2"></table>
					</div>
					
					<div id="getMore" style="margin:0 10px 10px;">
						<a href="javascript:void(0);" onclick="getMore();" class="renovate">
							<span class="renovateTitle">加载更多</span>
						</a>
					</div>
				</div>
				
			</div>
		</div>	
		
	</div>
	
	<div id="reportBar" style="display:none; padding:14px 20px 10px;">
		<input type="hidden" id="id">
		<input type="hidden" id="formId">
		<div style="margin-top:5px;">
			请输入新调查名称：
		</div>
		<div style="margin-top:5px;">
			<input type="text" id="name" rows="4" style="width:355px;"max="25">
		</div>
		<br/>
		<div style="padding:10px 5px;">
			<input type="button" value="确定" onclick="sendBtn()" class="sendBtn" style="cursor:pointer;">
			<input type="button" value="关闭" onclick="returnBtn()" class="returnBtn" style="cursor:pointer;">
			<div style="clear:both;"></div>
		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>
</div>	
</body>
</html>
