<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>内容详情</title>
<link href="${ctx}/static/css/investigation/surveyDetails.css" rel="stylesheet"/>
<link href="${ctx}/static/css/investigation/iCheck/custom.css" rel="stylesheet"/>
<link href="${ctx}/static/css/investigation/buttons.css" rel="stylesheet"/>

<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
 <link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
 <link href="${ctx}/static/css/animate.min.css" rel="stylesheet">
 <link href="${ctx}/static/css/plugins/summernote/summernote.css" rel="stylesheet">
 <link href="${ctx}/static/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
 <link href="${ctx}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
 <!-- 单选框复选框引用 -->
 <link href="${ctx}/static/css/plugins/iCheck/custom.css" rel="stylesheet">
<style>
.tabItem {
	background-color:#f1921c;
	height:40px;
}
.itemClick { background-color:#B76501;}
.button_Contral {
	margin:50px 1% 0;
	text-align:center;
	-moz-border-radius: 20px;
    -webkit-border-radius: 20px;
    border-radius:20px;
	font-weight:bold;
}
</style>

<style>
     .droppable-active{background-color:#ffe!important}.tools a{cursor:pointer;font-size:80%}.form-body .col-md-6,.form-body .col-md-12{min-height:400px}
 	
 	input[type="number"]{-moz-appearance:textfield;}
 	
 	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button{
	    -webkit-appearance: none !important;
	    margin: 0; 
	}
 </style>

<style type="text/css">
	.btn-success {
		background: orange;
	}
</style>
<script>
$(document).ready(function(){
	$(".i-checks").iCheck({
		checkboxClass:"icheckbox_square-green",
		radioClass:"iradio_square-green",
		});

});

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
 });

</script>
<script type="text/javascript">
	$(function(){
		if('${infoBean.status}' == -1){
			layer.open({
				type: 1,
				title:false,
				shadeClose: true,
				shade: [0],
				area:['500px','250px'],
				closeBtn:0,
				content: $('#surveyEnd')
			}); 
		}
	});
	
	function submitForm(){
		var f = document.getElementById("inputform");
		if('${infoBean.status}'== -1){
			layer.open({
				type: 1,
				title:false,
				shadeClose: true,
				shade: [0],
				area:['500px','250px'],
				closeBtn:0,
				content: $('#surveyEnd')
			}); 
		}else{
			layer.confirm("提交后结果不可更改，确认？",function(){
				f.submit();
			},function(){return;});
			
		}
		return false;
	}
	function returnBtn(){
		window.location.href="${ctx}/investigation/main";
	}
</script>
</head>

<body>
<div class="details_main">
	<%@ include file="../common/header.jsp"%>
	
	<div class="details_content">
		<div class="details_cont">
			<div class="details_title">${infoBean.investigationName}</div>
			<div class="details_top">
				<div>
					<img src="${ctx}/static/image/activity/time.png" width="15px" height="15px" class="img_contral_t1" style="float:left;">
					<div style="float:left; margin-left:5px;">
						<fmt:formatDate value="${infoBean.publishTime}" pattern="yyyy-MM-dd HH:mm"/>至
						<c:choose>
							<c:when test="${infoBean.endTime==null}">
								-
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${infoBean.endTime}" pattern="yyyy-MM-dd HH:mm"/>	
							</c:otherwise>
						</c:choose>
					</div>
					
					<div style="float:right; margin-left:20px;">阅读：${browseLogCount}</div>
					<div style="float:right;">发布人：${infoBean.accountName}</div>
					<div style="clear:both;"></div>
				</div>
				<div style="margin-top:5px;">
					<img src="${ctx}/static/image/activity/enterCount.png" width="15px" height="15px" class="img_contral_t4" style="float:left;">
					<div style="float:left; margin-left:5px;">
						参与人气：<font style="color:#f1921c; font-size:16px; font-weight:bold;">${joinCount}</font>人
					</div>
					
					<div style="float:right; position:relative; top:5px;">
						<span class="font12 span_contral_b-2" style="color:#5e5e5e;">一键分享</span>
						<a title="分享给QQ好友" onclick="shareToQQFriend(event,'调查')" href="javascript:;"><img src="${ctx}/static/image/qq.png" style="margin-left:5px;"></a>
						<a title="分享到微信" onclick="shareToWx(event)" href="javascript:;"><img src="${ctx}/static/image/wx.png" style="margin-left:5px;"></a>
						<a title="分享到微博" onclick="shareToWb(event)" href="javascript:;"><img src="${ctx}/static/image/wb.png" style="margin-left:5px;"></a>
						<a title="复制链接"  id='copyTo'   href="javascript:;"><img src="${ctx}/static/image/cp.png" style="margin-left:5px;"></a>
					</div>
					<div style="clear:both;"></div>
				</div>
			</div>
			<div style="margin:20px auto 0; width:940px;">
				<img src="${infoBean.extend1}" width="940px" height="450px;">
			</div>
			<div style="padding:0 40px;color:#000;">
				<div style="margin:20px 0;"></div>
				<!-- <div style="margin-top:10px;">
					<div class="survey_subject">1、你的性别是？（单选）</div>
					<div class="i-checks" style="margin:5px 0 0 20px;">
						<input type="radio" value="option1" name="Q1" style="margin-right:5px;">
						<span style="margin-left:5px;">男</span>
					</div>
					<div class="i-checks" style="margin:5px 0 0 20px;">
						<input type="radio" checked="" value="option2" name="Q1" style="margin-right:5px;">
						<span style="margin-left:5px;">女</span>
					</div>
					
					<div class="survey_subject">4、您或您身边的人对于下面若干选项有没有曾受过不平等待遇的呢？（多选）</div>
					<div class="i-checks" style="margin:5px 0 0 20px;">
						<input type="checkbox" value="option1" name="Q4" style="margin-right:5px;">
						<span style="margin-left:5px;">受教育权利</span>
					</div>
					<div class="i-checks" style="margin:5px 0 0 20px;">
						<input type="checkbox" value="option2" name="Q4" style="margin-right:5px;">
						<span style="margin-left:5px;">就业权利</span>
					</div>
					<div class="i-checks" style="margin:5px 0 0 20px;">
						<input type="checkbox" value="option2" name="Q4" style="margin-right:5px;">
						<span style="margin-left:5px;">道德绑架</span>
					</div>
					<div class="i-checks" style="margin:5px 0 0 20px;">
						<input type="checkbox" value="option2" name="Q4" style="margin-right:5px;">
						<span style="margin-left:5px;">性别歧视</span>
					</div>
					<div class="i-checks" style="margin:5px 0 0 20px;">
						<input type="checkbox" value="option2" name="Q4" style="margin-right:5px;">
						<span style="margin-left:5px;">社会政治参与度</span>
					</div>
					<div class="i-checks" style="margin:5px 0 0 20px;">
						<input type="checkbox" value="option2" name="Q4" style="margin-right:5px;">
						<span style="margin-left:5px;">经济收入及福利</span>
					</div>
					<div class="i-checks" style="margin:5px 0 0 20px;">
						<input type="checkbox" value="option2" name="Q4" style="margin-right:5px;">
						<span style="margin-left:5px;">财产继承</span>
					</div>
					<div class="i-checks" style="margin:5px 0 0 20px;">
						<input type="checkbox" value="option2" name="Q4" style="margin-right:5px;">
						<span style="margin-left:5px;">其他</span>
						<input type="text" placeholder="请输入" style="margin-left:5px;">
					</div>
				</div>
				
			</div>
			<div style="border-bottom:2px dashed #ccc; margin-top:20px;"></div>
			<div style="padding:0 40px;">
				<div class="survey_subject">5、问答：你认为什么是原因导致我国男女不平等的现状？</div>
				<textarea rows="4" class="textareContral" placeholder="这里输入内容"></textarea>
				<div style="width:42%; margin:0 auto;">
					<input type="button" class="button button-raised button_Contral" style="width:37%;" value="返回">
					<input type="button" class="button button-raised button-highlight button_Contral" style="width:58%;" onClick="surveyEnd();" value="提交">
				</div>
			</div> -->
			<c:set var="num" value="1"/>
			<div style="margin-top:10px;" class="col-sm-12">
				<form action="${ctx}/investigation/saveInfo" method="post" name="inputform" id="inputform">
					<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
					<input type="hidden" name="formId" value="${infoBean.formId}"/>
					<c:forEach items="${lstProinst}" var="item" varStatus="k">
                		<div class="form-group draggable ui-draggable dropped" style="position:static;" id="item${k.index+1}">
                       	<c:if test="${item.inputType!='line'}">
	                        <div class="col-sm-12 survey_subject">${num}、${item.inputTitle}：</div>
	                        <div class="col-sm-12">
	                        <c:set var="num" value="${num+1}"/>
                       	</c:if>
                       	<c:if test="${item.inputType=='line'}">
                       		<div class="col-sm-12">
                       	</c:if>
                 		<!-- 文本框 -->
                 		<c:if test="${item.inputType=='text'}">
                        	<input type="text" name="${item.filedName}" value="${(item.inputValue==null||item.inputValue=='')?input.defaultValue:item.inputValue}" class="form-control" placeholder="请输入${item.dataFormat=='email'?'邮箱格式':item.dataFormat=='phone'?'手机号码格式':item.dataFormat=='tel'?'固定电话格式':item.dataFormat=='code'?'邮政编码格式':''}文本">
                 		</c:if>
                 		<!-- 密码框 -->
                 		<c:if test="${item.inputType=='password'}">
                        	<input type="password" class="form-control" name="${item.filedName}"  value="${(item.inputValue==null||item.inputValue=='')?input.defaultValue:item.inputValue}"  placeholder="请输入密码">
                 		</c:if>
                 		<!-- 数值 -->
                 		<c:if test="${item.inputType=='number'}">
                        	<input type="text" class="form-control" name="${item.filedName}" placeholder="请输入数值" value="<fmt:formatNumber minFractionDigits="${item.precision}" maxFractionDigits="${item.precision}" value="${(item.inputValue==null||item.inputValue=='')?input.defaultValue:item.inputValue}"/>">
                 		</c:if>
                 		<c:if test="${item.inputType=='textarea'}">
                        	<textarea class="form-control" rows="4" style="margin:10px 0 0 20px;width:70%;" name="${item.filedName}" placeholder="请输入文本">${(item.inputValue==null||item.inputValue=='')?input.defaultValue:item.inputValue}</textarea>
                 		</c:if>
                 		<c:if test="${item.inputType=='richtext'}">
                        	<script name="${item.filedName}" id="editors${k.index+1}" type="text/plain" class="editorsSzc"></script>
                 		</c:if>
                 		<c:if test="${item.inputType=='radio'}">
                        	<div class="radio i-checks">
                           	<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
	                            <label id="item${k.index+1}_lab${j.index+1}" style="margin-bottom:10px;"><input type="radio" value="${it}" name="${item.filedName}"  ${fn:contains(item.inputValue,it)?'checked':''}> <i></i> 
	                            <font>${it}
	                            <c:if test="${it=='其他'}">&nbsp;<input type="text" name="${item.filedName}_other" value="${item.otherInputValue}" style="border:0px;border-bottom:solid 1px;background-color:transparent;"></c:if>
	                            </font>
	                            </label>
	                            <br/>
                           	</c:forEach>
                        	</div>
                 		</c:if>
                 		<c:if test="${item.inputType=='checkbox'}">
                           	<div class="checkbox i-checks">
                           	<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
	                            <label id="item${k.index+1}_lab${j.index+1}" style="margin-bottom:10px;"><input type="checkbox" value="${it}" name="${item.filedName}" ${fn:contains(item.inputValue,it)?'checked':''}> <i></i> 
	 							<font>
	                            ${it}
	                            <c:if test="${it=='其他'}">&nbsp;<input type="text" name="${item.filedName}_other" value="${item.otherInputValue}" style="border:0px;border-bottom:solid 1px;background-color:transparent;"></c:if>
	                            </font>
								</label>
								<br/>
                            </c:forEach>
                        	</div>
                 		</c:if>
                 		<c:if test="${item.inputType=='select'}">
                        	<select class="form-control" name="${item.filedName}">
                           		<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
                               		<option id="item${k.index+1}_opt${j.index+1}" ${fn:contains(item.inputValue,it)?'selected':''}>${it}</option>
                               	</c:forEach>
                        	</select>
                 		</c:if>
                 		<c:if test="${item.inputType=='selectmore'}">
                        	<select class="form-control" multiple="" name="${item.filedName}">
                            	<c:forEach items="${fn:split(item.options,'_:')}" var="it" varStatus="j">
                              		<option id="item${k.index+1}_opt${j.index+1}" ${fn:contains(item.inputValue,it)?'selected':''}>${it}</option>
                              	</c:forEach>
                        	</select>
                 		</c:if>
                 		<c:if test="${item.inputType=='date'}">
                        	<input name="${item.filedName}" class="form-control layer-date laydate-icon" value="${(item.inputValue==null||item.inputValue=='')?input.defaultValue:item.inputValue}" placeholder="单击选择时间" onclick="laydate({istime: true, format: '${item.dataFormat=='ymdhms'?'YYYY-MM-DD hh:mm:ss':item.dataFormat=='ymdhm'?'YYYY-MM-DD hh:mm':item.dataFormat=='ymd'?'YYYY-MM-DD':item.dataFormat=='ym'?'YYYY-MM':'YYYY-MM-DD hh:mm:ss'}'})">
                 		</c:if>
                 		<c:if test="${item.inputType=='hidden'}">
                        	<input type="hidden" name="${item.filedName}"/>
                 		</c:if> 
                 		<c:if test="${item.inputType=='file'}">
                        	<div style="margin-top:6px;"> 
					        	<input type="file" data-no-uniform="true" id="fileUploads_item${k.index+1}"  multiple="true" >
					        	<span id="fileQueues_item${k.index+1}" ></span> 
					        </div>
					 		<div id="attList_item${k.index+1}" ></div>
							<input type="hidden" id="attIds_item${k.index+1}" name="${item.filedName}" value="${item.inputValue}" />
                 		</c:if>
                 		<c:if test="${item.inputType=='subform'}">
                        	<p class="form-control-static" id="subform">请选择需引用的表单</p>
                 		</c:if>
                 		<c:if test="${item.inputType=='line'}">
                 			<span class="help-block m-b-none">${item.promptMsg}</span>
                        	<div class="hr-line-${item.dataFormat=='dashed'?'dashed':'solid'}" id="line"></div>
                 		</c:if>
                 		<c:if test="${item.inputType!='line'}">
                 			<span class="help-block m-b-none">${item.promptMsg}</span>
                 		</c:if>
                   		</div>
                	</div>
                </c:forEach>
            	</form>
			</div>
            <div style="width:42%; margin:0 auto;">
				<input type="button" class="button button-raised button_Contral" style="width:37%;" value="返回" onclick="returnBtn();">
				<input type="button" class="button button-raised button-highlight button_Contral" style="width:58%;" onclick="submitForm();" value="提交">
			</div>
		</div>
		
	</div>
	
	<div id="surveyEnd" style="display:none;">
		<div style="font-size:22px; font-weight:bold; text-align:center; margin:75px auto 0; width:242px;">对不起，该调查已结束！</div>
		<div style="margin:0 auto; width:242px;">你可以参与“江西工业园区微讯”平台其他调查。</div>
	</div>
	
	 
	<div style="display:none" id="qrcode">     
		<img src='${infoBean.qrCode}'  width="250px;" height="250px;"/>
		<br>&nbsp;&nbsp;打开微信，点击底部的“发现”
		<br>&nbsp;&nbsp;使用“扫一扫”即可将网页分享至朋友圈
  	</div>
</div>
<%@ include file="../common/footer.jsp"%>
</div>

	<script src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx}/static/js/jquery-ui-1.10.4.min.js"></script>
    <script src="${ctx}/static/js/plugins/beautifyhtml/beautifyhtml.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/contabs-tab.js"></script> 
    <!-- 富文本编辑器引用 -->
    <script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js" charset="utf-8"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.js" charset="utf-8"></script>
	<!-- 单选框复选框引用 -->
	<script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/plugins/jquery-zclip/jquery.zclip.js"></script> 
	<script type="text/javascript" src="${ctx}/static/js/share.js"></script> 
	<!-- 上传 -->
	<script src="${ctx}/static/js/uploadFilesAndPics_uploadify.js"></script>
	<script>
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
    </script>
    <!-- 富文本编辑器引用 -->
    <script>
		var ue =null ;
		$(function() {
			UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
			UE.Editor.prototype.getActionUrl = function(action) {
			    if (action == 'uploadvideo' || action == 'uploadscrawl' || action == 'uploadimage'  ) {
			        return '${ctx}/uploadimage';
			    } else {
			        return this._bkGetActionUrl.call(this, action);
			    }
			}	
			   ue = UE.getEditor('editors');
			   ue.addListener("ready", function () {
				    //ue.setContent( "000000000000000");
			   });
			   
			   $("div.col-md-12 .editorsSzc").each(function(){
				   ue = UE.getEditor($(this).attr("id"));
				   ue.addListener("ready", function () {
				   });
			   });
		});   
	</script> 
	<script type="text/javascript">
	$(function() {
		$("#inputDiv input:file").each(function(){
			var strId = $(this).attr("id");
			var divId = "_"+strId.split("_")[1];
			registerUploadFilesComm("fileUploads"+divId,30,80,"选择文件","${ctx}/login/json/attachment/publish","${ctx}/static/plugins/uploadify3.2/uploadify.swf","fileQueues"+divId,"attIds"+divId,"attList"+divId);
		});
	});
	
	function showAtts(jsonData){
		 var url="" ;
		 url+="<li id='"+jsonData.attachment.attachmentId+"'><a href='"+ jsonData.attachment.attachmentUrl+"' target='_blank' title='下载'>"+ jsonData.attachment.remoteName+"</a>&nbsp;<a href='javascript:;' style='color:black' onclick='deleteAtt(this)'>[删除]</a></li> ";
		 $('#attList').append(url) ;
	}
	</script> 
</body>
</html>
