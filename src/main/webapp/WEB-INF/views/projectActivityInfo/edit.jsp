<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>创建/编辑</title>
<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link href="${ctx}/static/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0"
	rel="stylesheet">
 
<style type="text/css">
.selected {
	background: orange;
}
</style>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
 
<script type="text/javascript" src="${ctx}/static/js/jquery.searchableSelect.js"></script>		
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/jquery.searchableSelect.css" />

</head>

<body class="gray-bg">
	<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="-1"/>
	<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="活动报名" />
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>创建活动</h5><!--  
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a>
							<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#"> <i class="fa fa-wrench"></i></a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="form_basic.html#">选项1</a></li>
								<li><a href="form_basic.html#">选项2</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i></a>
						</div>-->
					</div>
					<div class="ibox-content">
						<form class="form-horizontal" id="form">
						 
							<input type="hidden" id="activityId" name="activityId" value="${projectActivityInfo.activityId}" /> 
							<input type="hidden" id="activityTags" name="activityTags" value="${projectActivityInfo.activityTags}"/> 
							<input type="hidden" id="activityImage" name="activityImage" value="${projectActivityInfo.activityImage}"/>
							<input type="hidden" id="createAccount" name="createAccount" value="${projectActivityInfo.createAccount}"/> 
							<input type="hidden" id="createUser" name="createUser" value="${projectActivityInfo.createUser}"/>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">活动名称</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="activityName" name="activityName" value="${projectActivityInfo.activityName}" 
										placeholder="请输入活动名称" />
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">开始时间</label>
								<div class="col-sm-4">
									<input id="start" class="laydate-icon form-control layer-date" name="start" value="${projectActivityInfo.start}" />
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">结束时间</label>
								<div class="col-sm-4">
									<input id="end" class="laydate-icon form-control layer-date" name="end" value="${projectActivityInfo.end}"/>
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">活动地点</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="activityLocation" name="activityLocation"
										placeholder="请输入详细地址" value="${projectActivityInfo.activityLocation}" />
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">上传海报</label>
								<div class="col-sm-10">
									<div style="float: left;">
										<img alt="" src="${projectActivityInfo.activityImage}" id="showPicUrl" style="width: 100px; height: 100px;" />
									</div>
									<div style="float: left; margin-left: 15px;">
										<p>一张漂亮的海报，能让你的活动锦上添花，带来更多用户报名及增加传播效果，也将影响其在活动被推介的几率。</p>
										<p>图片小于2M ( jpg、gif、png)，尺寸为720*370px</p>
										<input type="file" data-no-uniform="true" name="attFiles" id="file_uploads" multiple="true" />
									</div>
								</div>
							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">选择标签</label>
								<div class="searchOptions col-sm-10" id="require">
									<c:forEach items="${tagList}" var="list">
										<button type="button" class="optionBtn btn btn-outline btn-default" onclick="getTags(this)">${list.tagName}</button>
									</c:forEach>
									<span class="help-block m-b-none">（最少选择一个标签，最多只能选择四个标签 ）</span>
								</div>

							</div>

							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">活动详情</label>
								<div class="col-sm-10">
									<!-- <script id="editors" type="text/plain" style="width: 100%;"></script> -->
									<textarea id="activityDescription" name="activityDescription" class="form-control" style="height: 200px;">${projectActivityInfo.activityDescription}</textarea>
								</div>
							</div>
							<c:if test="${projectActivityInfo==null}">
								<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">人员选择</label>
								<div class="col-sm-10">
									<select class="form-control m-b" id="accountId">
                                        <option value=''>=请选择账号=</option>
											<c:if test="${accountInfoList!=null}">
												<c:forEach items="${accountInfoList}" var="account">
													<option value='${account.accountId}'>${account.accountName}</option>
												</c:forEach>
											</c:if>
                                    </select>
                                    <input type="checkbox" id="selectBtn" name="select2"/>
								</div>
							</div>
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">随机账号</label>
								<div class="col-sm-4">
									<input id="randomId" type="hidden" value="${accountInfoRandom.accountId}" />
									<input id="randomName" class="laydate-icon form-control layer-date" value="${accountInfoRandom.accountName}" />
								</div>
								 
							</div>
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">发布时间</label>
								<div class="col-sm-4">
									<input id="create" class="laydate-icon form-control layer-date" name="create" />
								</div>
							</div>
							</c:if>
							
							
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<input type="button" class="btn btn-primary" onclick="activitySave()" value="发布"/>
									<input type="button" class="btn btn-white" onclick="returnBtn()" value="取消">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<script>
	$(function() {
		//时间控件
		/* var start = {
			elem : '#start', //选择ID为START的input
			event : "focus",
			format : 'YYYY-MM-DD hh:mm', //自动生成的时间格式
		//	min : laydate.now(), //设定最小日期为当前日期
			max : '2099-06-16 23:59', //最大日期
			istime : true, //必须填入时间
			start : laydate.now(0, "YYYY-MM-DD hh:mm"), //设置开始时间为当前时间
			choose : function(datas) {
				  end.min = datas; //开始日选好后，重置结束日的最小日期
				end.start = datas; //将结束日的初始值设定为开始日  
			}
		};
		var end = {
			elem : '#end',
			format : 'YYYY-MM-DD hh:mm',
			event : "focus",
		//	min : laydate.now(),
			max : '2099-06-16 23:59',
			istime : true,
			start : laydate.now(0, "YYYY-MM-DD hh:mm"),
			choose : function(datas) {
				start.max = datas; //结束日选好后，重置开始日的最大日期
			}
		};
		
		var create = {
				elem : '#create',
				format : 'YYYY-MM-DD hh:mm',
				event : "focus",
			//	min : laydate.now(),
				max : '2099-06-16 23:59',
				istime : true,
				start : laydate.now(0, "YYYY-MM-DD hh:mm"),
				choose : function(datas) {
					start.max = datas; //结束日选好后，重置开始日的最大日期
				}
		};
		
		laydate(start);
		laydate(end);
		laydate(create);
		 */
		
		
		var start = {
			    format: 'YYYY-MM-DD hh:mm',
			    minDate: '2015-01-11 23:59:59', //设定最小日期为当前日期
			    //isinitVal:true,
			    //maxDate: $.nowDate(0), //最大日期
			    choosefun: function(elem,datas){
			        end.minDate = datas; //开始日选好后，重置结束日的最小日期
			    }
			};
		 var end = {
				    format: 'YYYY-MM-DD hh:mm',
				    minDate: $.nowDate(0), //设定最小日期为当前日期
				    //isinitVal:true,
				    maxDate: '2019-06-16 23:59:59', //最大日期
				    choosefun: function(elem,datas){
				        start.maxDate = datas; //将结束日的初始值设定为开始日的最大日期
				    }
				};
		 var create = {
				    format: 'YYYY-MM-DD hh:mm:ss',
				    minDate: '2015-06-16 23:59:59', //设定最小日期为当前日期
				    //isinitVal:true,
				    maxDate: $.nowDate(0), //最大日期
				    choosefun: function(elem,datas){
				       
				    }
				};
		 $("#start").jeDate(start);
		 $("#end").jeDate(end);
		 $("#create").jeDate(create);
		//初始化
		initPage();
		
		//初始化已选标签
		initTags('${projectActivityInfo.activityTags}');
		
		//图片附件
		$('#file_uploads').uploadify(
				{
					'debug' : false,
					'simUploadLimit' : 3,
					'multi' : true,
					'auto' : true,
					'removeCompleted' : true,
					'removeTimeout' : 1,
					'successTimeout' : 99999,
					'formData' : {
						'jsessionid' : '${pageContext.session.id}',
						'moduleId':$('#moduleId').val()==undefined ? -1 : $('#moduleId').val(), 
						'remark':$('#attachementRemark').val()==undefined ? '' : $('#attachementRemark').val()
					},
					'uploader': '${ctx}/session/attachment/publish' , // 新版
					'swf' : "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
					'overrideEvents' : [ 'onDialogClose', 'onUploadError',
							'onSelectError' ],
					'queueID' : 'fileQueues',
					'fileObjName':'attachment',
					'width' : '80',
					'height' : '30',
					'fileTypeDesc' : 'jpg gif png',
					'fileTypeExts' : '*.jpg;*.gif;*.png',
					'fileSizeLimit' : '2MB',
					'buttonText' : '上传图片',
					'queueSizeLimit' : 3,
					'onUploadProgress' : function(file, bytesUploaded,
							bytesTotal, totalBytesUploaded, totalBytesTotal) {
						//使用方法见官方说明
					},
					'onSelect' : function(file) {

					},
					'onUploadStart' : function(file) {
						var myself = this; 
						if(!isSafeFile(file.name )){
							  alert('请选择合法的文件！');
							  myself.cancelUpload(file.id); 
						      $('#' + file.id).remove(); 
						}
					},
					'onUploadError' : function(file, errorCode, errorMsg) {
						if (errorCode = -280) {

						} else {
							alert('上传失败，请联系管理员2');
						}
					},
					'onCloseError' : function(file, errorCode, errorMsg) {
						alert('上传失败，请联系管理员3');
					},
					'onSelectError' : function(file, errorCode, errorMsg) {
						switch (errorCode) {
						case -100:
							alert("上传的文件数量已经超出系统限制的"
									+ $('#file_uploads').uploadify('settings',
											'queueSizeLimit') + "个文件！");
							break;
						case -110:
							alert("文件 ["
									+ file.name
									+ "] 大小超出系统限制的"
									+ $('#file_uploads').uploadify('settings',
											'fileSizeLimit') + "大小！");
							break;
						case -120:
							alert("文件 [" + file.name + "] 大小为零，不能上传！");
							break;
						case -130:
							alert("文件 [" + file.name + "] 类型不正确！");
							break;
						}
					},
					//检测FLASH失败调用
					'onFallback' : function() {
						alert("您未安装FLASH控件，无法上传！请安装FLASH控件后再试。");
					},
					'onUploadSuccess' : function(file, data, response) {
						var obj = JSON.parse(data);
						 if(obj.success){
							showPic(obj.attachment);
							$("#activityImage").val(obj.attachment.attachmentUrl);
						 }else{
							 alert('上传失败');
						 }
					}
				});

	});

	function showPic(jsonData) {
		$("#showPicUrl").attr('src', jsonData.attachmentUrl);
		$("#showPicUrl").show();
	}
	
	//初始化标签
	function initTags(tags) {
		var tag = tags.split(",");
		for (var i = 0; i < tag.length; i++) {
			$(".searchOptions .optionBtn").each(function() {
				if ($(this).text() == tag[i]) {
					$(this).addClass("selected");
				}
			});
		}
	}
	
	//获取标签的值并以字符串形式拼接
	function getTags(obj){
		if($(obj).hasClass("selected")){
			$(obj).removeClass("selected");
		}else{
			$(obj).addClass("selected");
		}
		var tags = "";
		var count = 0;
		$(".searchOptions .optionBtn").each(function(){
            if($(this).hasClass("selected")){
            	tags += ($(this).text() + ",");
            	count++;
            }
        });
		if(count<1){
        	layer.msg("请至少选择一项");
        	$(obj).addClass("selected");
        	return;
        }
        if(count>4){
        	layer.msg("最多选择四项");
        	$(obj).removeClass("selected");
        	return;
        }
		$("#activityTags").val(tags);
	}
	
	//发布
	function activitySave(){
		if(validate()){
			$.ajax({
				url:"${ctx}/projectActivity/json/save",
				type:"post",
			 	data:$("#form").serialize(),
			 	dataType:"json",
			 	success:function(result){
			 		if(result.code==1){
			 			layer.msg("发布成功");
			 			setTimeout(function(){
			 				var activityId = '${projectActivityInfo.activityId}';
			 				if(activityId==null||activityId==""){
				 				window.location.href="${ctx}/projectActivityInfo/add";
			 				}else{
			 					window.location.href="${ctx}/projectActivityInfo/list";
			 				}
			 			}, 1000);
			 		}else{
			 			layer.alert(result.msg);
			 		}
			 	},
			 	error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				},
			}); 
		}  
	}
	
	function validate(){
		var activityName = $("#activityName").val();
		if(activityName == ""||activityName == null){
			layer.msg("请输入活动主题");
			return false;
		}
		
		var start = $("#start").val();
		if(start == ""||start == null){
			layer.msg("请选择开始时间");
			return false;
		}
		
		var end = $("#end").val();
		if(end == ""||end == null){
			layer.msg("请选择结束时间");
			return false;
		}
		
		var activityLocation = $("#activityLocation").val();
		if(activityLocation == ""||activityLocation == null){
			layer.msg("请输入活动地址");
			return false;
		}
		
		var activityImage = $("#activityImage").val();
		if(activityImage == ""||activityImage == null){
			layer.msg("请选择图片");
			return false;
		}
		
		var activityTags = $("#activityTags").val();
		if(activityTags == ""||activityTags == null){
			layer.msg("请选择标签");
			return false;
		}
		
		var activityDescription = $("#activityDescription").val();
		if(activityDescription ==""||activityDescription ==null){
			layer.msg("请输入活动详情");
			return false;
		}
		
		
		var startTime = new Date(start.replace(/\-/g, "\/"));
		var  endTime = new Date(end.replace(/\-/g, "\/"));
		if(startTime>=endTime){
			layer.msg("结束时间不能小于开始时间");
			return false;
		} 
		
		var activityId = '${projectActivityInfo.activityId}';
		if(activityId==null||activityId==""){
			var accountId="";
			var createUser="";
			if($('#selectBtn').is(':checked')){
				accountId=$("#accountId").val();
				createUser=$("#accountId option:selected").text();
			}else{
				accountId=$("#randomId").val();
				createUser=$("#randomName").val();
			}
			if(accountId==""||accountId ==null){
				layer.msg("请选择账号"); 
				return false ;
			}else{
				$("#createAccount").val(accountId);
				$("#createUser").val(createUser);
				return true;
			}	
		}
		return true;
	}
	//页面初始化
	function initPage(){
		  $("#accountId").val('${info.accountId}');
		  $("#accountId").searchableSelect();
		 
	}
	
	function returnBtn(){
		window.history.go(-1);
	}
	
	</script>
	
</body>
</html>
