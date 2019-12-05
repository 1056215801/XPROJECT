<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>企业设置</title>
<%-- <link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"> --%>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<%-- <link type="text/css" rel="stylesheet" href="${ctx}/static/css/style.min.css?v=4.1.0"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0" /> --%>
<link href="${ctx}/static/css/personalCenter/personalCenter.css" rel="stylesheet" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/plugins/iCheck/custom.css" />
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<style>
.company_yjtablish th, .company_yjtablish td {
	text-align: center;
	height: 45px;
	line-height: 45px
}
.menuNav {
    font-weight: normal !important;
}
.company_yjtablish td {
	border-top: 1px solid #f4f4f4;
}
.company_yjtablish th {
	background-color: #F1F1F1;
}
.company_yjtablish {
	border: 1px solid #f4f4f4;
	width: 85%;
}
.default_company {
	cursor: pointer;
	background-color: #FCD4CF;
	border: 1px solid #FA8577;
	color: #F12D2B;
	padding: 5px 5px;
	border-radius: 3px;
	white-space: nowrap;
}
.default_company2 {
	cursor: pointer;
	background-color: #FCD4CF;
	border: 1px solid #FA8577;
	color: #F12D2B;
	padding: 5px 5px;
	border-radius: 3px;
	white-space: nowrap;
}
.default_company_div {
	float: left;
	width: 80%;
	height: 45px;
}
.color_red {
	color: red;
}

.releaseItem {
	padding: 20px 0;
}
.release_inputBar {
	width:82%;
	margin:20px auto;
}
.release_input {
	margin-bottom:15px;
}
.redStar {
	float:left;
	color:#FF0000;
}
.release_attr {
	float:left;
	margin-left:10px;
	width:56px;
}
.inputBox {
	float:left;
	margin-left:15px;
	border:1px solid #ccc;
}
.selectBox {
	float:left;
	margin-left:15px;
	padding:2px 0;
}
.redTips {
	color:#f14241;
	margin-left:10px;
}
.uploadImgContral {
	float:left;
	margin-left:15px;
}
.uploadImgTips {
	float:left;
	margin-left:15px;
	font-size:12px;
	color:#aaa;
}
</style>
<script>
//获取列表数据
var pageNum = 1;
var isloading = false;
var flag = true;
var companyId = "";
var companName = "";
	$(function() {
		$(".tabName ul li").each(function() {
			var index = $(this).index();
			$(".tabName ul li").eq(0).addClass("nameClick");
			$(this).click(function() {
				$(this).addClass("nameClick").siblings().removeClass("nameClick");
				$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
			});
			$(".default_company").hide();
			$(".default_company_div").hover(function() {
				$(this).find('.default_company').show();
			}, function() {
				$(".default_company").hide();
			});
		});
		$(".tabItem ul li").each(function() {
			$(this).click(function() {
				$(this).addClass("itemClick").siblings().removeClass("itemClick");
			});
		});
		
		//加载地址
		getArea(0, 1);
		$("#province").change(function() {
			getArea($(this).val(), 2);
		});
		$("#city").change(function() {
			getArea($(this).val(), 3);
		});
		//图片附件
		$('#pic_uploads').uploadify(
			{
				'debug' : false,
				'simUploadLimit' : 3,
				'multi' : true,
				'auto' : true,
				'removeCompleted' : true,
				'removeTimeout' : 1,
				'successTimeout' : 99999,
				'formData' : {
					'moduleId':$('#moduleId').val()==undefined ? -1 : $('#moduleId').val(), 
					'remark':$('#attachementRemark').val()==undefined ? '' : $('#attachementRemark').val(),
					'jsessionid' : '${pageContext.session.id}'
				},
				'uploader': '${ctx}/session/attachment/publish' , // 新版
				'swf' : "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
				'overrideEvents' : [ 'onDialogClose', 'onUploadError',
						'onSelectError' ],
				'fileObjName' : 'attachment',
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
				'onUploadStart' : function(file) {
					var myself = this; 
					if(!isSafeFile(file.name )){
						  alert('请选择合法的文件！');
						  myself.cancelUpload(file.id); 
					      $('#' + file.id).remove(); 
					}
				},
				'onSelect' : function(file) {
		
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
								+ $('#pic_uploads').uploadify('settings',
										'queueSizeLimit') + "个文件！");
						break;
					case -110:
						alert("文件 ["
								+ file.name
								+ "] 大小超出系统限制的"
								+ $('#pic_uploads').uploadify('settings',
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
					showPic(obj.attachment);
					$("#imageUrl").val(obj.attachment.attachmentUrl);
					$("#imageAt").val(obj.attachment.attachmentId);
				}
			});
		
		$('#file_uploads').uploadify({
			'debug' : false,
			'simUploadLimit' : 3,
			'multi' : true,
			'auto' : true,
			'removeCompleted' : true,
			'removeTimeout' : 1,
			'successTimeout' : 99999,
			'formData' : {
				'moduleId':$('#moduleId').val()==undefined ? -1 : $('#moduleId').val(), 
				'remark':$('#attachementRemark').val()==undefined ? '' : $('#attachementRemark').val(),
				'jsessionid' : '${pageContext.session.id}'
			},
			 'uploader': '${ctx}/session/attachment/publish' , // 新版
			'swf' : "${ctx}/static/plugins/uploadify3.2/uploadify.swf",
			'overrideEvents' : [ 'onDialogClose',
					'onUploadError', 'onSelectError' ],
			'queueID' : 'fileQueues',
			'fileObjName' : 'attachment',
			'width' : '80',
			'height' : '30',
			'fileTypeDesc' : '支持的格式：',
			'fileTypeExts' : '*.*',
			'fileSizeLimit' : '100MB',
			'buttonText' : '选择文件',
			'queueSizeLimit' : 3,
			'onUploadProgress' : function(file,
					bytesUploaded, bytesTotal,
					totalBytesUploaded, totalBytesTotal) {
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
			'onUploadError' : function(file, errorCode,
					errorMsg) {
				if (errorCode = -280) {

				} else {
					alert('上传失败，请联系管理员2');
				}
			},
			'onCloseError' : function(file, errorCode,
					errorMsg) {
				alert('上传失败，请联系管理员3');
			},
			'onSelectError' : function(file, errorCode,
					errorMsg) {
				switch (errorCode) {
				case -100:
					alert("上传的文件数量已经超出系统限制的"
							+ $('#file_uploads').uploadify(
									'settings',
									'queueSizeLimit')
							+ "个文件！");
					break;
				case -110:
					alert("文件 ["
							+ file.name
							+ "] 大小超出系统限制的"
							+ $('#file_uploads').uploadify(
									'settings',
									'fileSizeLimit')
							+ "大小！");
					break;
				case -120:
					alert("文件 [" + file.name
							+ "] 大小为零，不能上传！");
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
			'onUploadSuccess' : function(file, data,
					response) {
				var obj = JSON.parse(data);
				// alert(data);
				showAtts(obj.attachment);
				
				var urlStr = $("#expAttachment").val() + obj.attachment.attachmentUrl + ",";
				var url = (urlStr.substring(urlStr.length-1)==',')?urlStr.substring(0,urlStr.length-1):urlStr;
				$("#expAttachment").val(url);
				var idStr = $("#attachmentId").val() + obj.attachment.attachmentId + ",";
				var id = (idStr.substring(idStr.length-1)==',')?idStr.substring(0,idStr.length-1):idStr;
				$("#attachmentId").val(id);
			}
		});
	});
	
	function getArea(parentId, type) {
		var provinceId = '${companyInfoBean.provinceId}';
		var areaId = '${companyInfoBean.areaId}';;
		var spaceId = '${companyInfoBean.spaceId}';;
		if(provinceId==null||provinceId=='undefined'||provinceId==''){
			provinceId = 360000;
			areaId = 360100;
			spaceId = 360101; 
		}
		
		$.ajax({
			url : "${ctx}/personalCenter/getArea",
			type : "get",
			data : {
				"parentId" : parentId
			},
			success : function(result) {
				if (result.code == 1) {
					var list = result.value;
					if (type == 1) {
						$("#province").empty();
					} else if (type == 2) {
						$("#city").empty();
					} else if (type == 3) {
						$("#town").empty();
					}

					for (var i = 0; i < list.length; i++) {
						var info = list[i];
						var _div = "";
						if (type == 3) {
							if(info.areaId == spaceId){								
								_div = '<option value="'+info.areaId+'" selected="selected">' + info.areaName + '</option>';
							}else{
								_div = '<option value="'+info.areaId+'">' + info.areaName + '</option>';
							}
									
							$("#town").append(_div);
						} else if (type == 2) {
							if(info.areaId == areaId){								
								_div = '<option value="'+info.areaId+'" selected="selected">' + info.areaName + '</option>';
							}else{
								_div = '<option value="'+info.areaId+'">' + info.areaName + '</option>';
							}
							
							$("#city").append(_div);
						} else {
							if(info.areaId == provinceId){								
								_div = '<option value="'+info.areaId+'" selected="selected">' + info.areaName + '</option>';
							}else{
								_div = '<option value="'+info.areaId+'">' + info.areaName + '</option>';
							}
							
							$("#province").append(_div);
						}
					}

					if (type == 2) {
						getArea($("#city option:selected").val(), 3);
					} else if (type == 1) {
						getArea($("#province option:selected").val(), 2);
					} 
				} else if (result.code == 0) {
					if (type == 1) {
						$("#province").empty();
						$("#city").empty();
						$("#town").empty();
						$("#province").append('<option>省份/自治区</option>');
						$("#city").append('<option>城市/自治州</option>');
						$("#town").append('<option>区/县</option>');
					} else if (type == 2) {
						$("#city").empty();
						$("#town").empty();
						$("#city").append('<option>城市/自治州</option>');
						$("#town").append('<option>区/县</option>');
					} else if (type == 3) {
						$("#town").empty();
						$("#town").append('<option>区/县</option>');
					}
				} else {
					layer.msg(result.msg);
				}
			},
			error : function() {
				layer.msg("地址请求超时，请刷新页面！");
			}
		});
	}
    function picChange(id,name){
    	$('.companyTitle').html(name);
    	$('#organizationId').val(id);
    	companyId = id;
    	$('#orgId').val(companyId);
    	$('.centerContentRight').hide();
    	$('.picRight').show();
		//initJedate();
		getInfoList();
		setTimeout(function() {
			bindScroll();;
		}, 1000);
		
    }
    function goback(){
    	$('.picRight').hide();
    	$('.centerContentRight').show();
    }
	function companyDetail(companyId) {
		window.location.href = "${ctx}/personalCenter/companyDetail?companyId=" + companyId;
	}

	function join(obj) {
		layer.msg("正在建设中，敬请期待...");
	}

	function saveDefaultCompany(companyId) {
		var url = '${url}';
		$.ajax({
			url : "${ctx}/personalCenter/setDefaultCompany",
			type : "get",
			data : {"companyId" : companyId},
			success : function(result) {
				layer.msg(result.msg);
				if (result.code == 1) {
					if (url == 2) {
						window.location.href = "${ctx}/front/recruitment/hcdy/companyEdit";
					} else {
						layer.msg(result.msg);
						setTimeout(function() {
							window.location.reload();
						}, 1000);
					}
				}
			},
			error : function() {
				layer.msg("请求超时，请稍后重试！");
			}
		});
	}

	function saveCommonCompany() {
		
		if(validate()){
			$("#provinceId").val($("#province option:selected").val());
			$("#provinceName").val($("#province option:selected").text());

			$("#areaId").val($("#city option:selected").val());
			$("#areaName").val($("#city option:selected").text());

			$("#spaceId").val($("#town option:selected").val());
			$("#spaceName").val($("#town option:selected").text());

			$("#parentId").val($("#park option:selected").val());
			
			var s1=$("#companyDescription").val() ;
			var s2=$("#positionAddress").val();
			
			$("#companyDescription").val(safeStr(s1)) ;
			$("#positionAddress").val(safeStr(s2));
						
			var url = '${url}';

			$.ajax({
				url : "${ctx}/personalCenter/saveCommonCompany",
				type : "get",
				data : $("#editform").serialize(),
				success : function(result) {
					if (result.code == 1) {
						layer.msg(result.msg);
						
						if (url == 1) {
							layer.confirm(result.msg+'，是否现在去发布园区动态？', {
								btn: ['是', '否'], btn1:function(){
									window.location.href = "${ctx}/expShare/add";
					            }, btn2: function () {
					            	setTimeout(function() {
										window.location.reload();
									}, 1000);
					            },cancel: function(){ 
					            	setTimeout(function() {
										window.location.reload();
									}, 1000);
					            }
					        });
							
						} else if (url == 2){
							layer.confirm(result.msg+'，是否现在完善企业招聘所需信息？', {
								btn: ['是', '否'], btn1:function(){
									window.location.href = "${ctx}/front/recruitment/hcdy/companyEdit";
					            }, btn2: function () {
					            	setTimeout(function() {
										window.location.reload();
									}, 1000);
					            },cancel: function(){ 
					            	setTimeout(function() {
										window.location.reload();
									}, 1000);
					            }
					        });
						} else if (url == 3) {
							layer.confirm(result.msg+'，是否现在去发布产品？', {
								btn: ['是', '否'], btn1:function(){
									window.location.href = "${ctx}/front/showProduct/main?isComplete=true";
					            }, btn2: function () {
					            	setTimeout(function() {
										window.location.reload();
									}, 1000);
					            },cancel: function(){ 
					            	setTimeout(function() {
										window.location.reload();
									}, 1000); 
					            }
					        });
						} else if (url == 4) {
							layer.confirm(result.msg+'是否现在去发布供需？', {
								btn: ['是', '否'], btn1:function(){
									window.location.href = "${ctx}/showSupply/main?isComplete=true";
					            }, btn2: function () {
					            	setTimeout(function() {
										window.location.reload();
									}, 1000);
					            },cancel: function(){ 
					            	setTimeout(function() {
										window.location.reload();
									}, 1000);
					            }
					        });
						} else if (url == 5) {
							layer.confirm(result.msg+'，是否现在去发布产品？', {
								btn: ['是', '否'], btn1:function(){
									window.location.href = "${ctx}/product/list?isComplete=true";
					            }, btn2: function () {
					            	setTimeout(function() {
										window.location.reload();
									}, 1000);
					            },cancel: function(){ 
					            	setTimeout(function() {
										window.location.reload();
									}, 1000); 
					            }
					        });
						} else if (url == 6) {
							layer.confirm(result.msg+'是否现在去发布供需？', {
								btn: ['是', '否'], btn1:function(){
									window.location.href = "${ctx}/supply/list?isComplete=true";
					            }, btn2: function () {
					            	setTimeout(function() {
										window.location.reload();
									}, 1000);
					            },cancel: function(){ 
					            	setTimeout(function() {
										window.location.reload();
									}, 1000);
					            }
					        });
						}else {
							setTimeout(function() {
								window.location.href = "${ctx}/personalCenter/companyEdit";
							}, 1000);
						}

					}else{
						layer.msg(result.msg);
					}
				},
				error : function() {
					layer.msg("请求超时，请稍后重试！");
				}
			});
		}

	}

	function deleteCompany(companyId) {
		layer.confirm("确认删除企业？", function() {
			$.ajax({
				url : "${ctx}/personalCenter/deleteCommonCompany",
				type : "get",
				data : {
					"companyId" : companyId
				},
				success : function(result) {
					layer.msg(result.msg);
					if (result.code == 1) {
						setTimeout(function() {
							window.location.reload();
						}, 1000);
					}
				},
				error : function() {
					layer.msg("请求超时，请稍后重试！");
				}
			});
		}, function() {
			return;
		});

	}

	function editCompany(companyId){
		window.location.href="${ctx}/personalCenter/companyEdit?url=${url}&companyId="+companyId;
	}
	
	function validate() {
		var companyName = $("#companyName").val();
		if (companyName == "" || companyName == null) {
			layer.msg("请填写企业名称！");
			return false;
		}

		var socialCreditNo = $("#socialCreditNo").val();
		
		var companyId = $("#companyId").val();
		if(companyId != "" && companyId != null){
			if (socialCreditNo == "" || socialCreditNo == null) {
				layer.msg("该企业信息不完整，请先联系企业管理员完善企业信息！");
				return false;
			}
		}else{
			if (socialCreditNo == "" || socialCreditNo == null) {
				layer.msg("请填写信用代码！");
				return false;
			}
		}
		
		return true;
	}
	
	function nvlStr(str,value){
		if(str==null || str==undefined || str=="undefined"){
			return value!=null && value!=undefined?value:"";
		}
		return str;
	}
	/* function selHonor(obj) {
		var checkbox = $(obj).find("input").get(0);
		$(checkbox)('toggle');
	} */

	function limitStr(str,i){
		if(str==undefined || str==null){
			return "";
		}else if(str.length>i){
			return str.substring(0,i)+"...";
		}else{
			return str;
		}
	}
	
	function bindScroll() {
		$(window).scroll(
			function() {
				if ($(document).height() - $(this).scrollTop() - $(this).height() < 1) {
					if(flag&&!isloading){
						pageNum++;
						getInfoList();
					}
				}
		});
	}
	function validateCompany(obj){
		var companyName = $(obj).val();
		if(companyName!=null&&companyName!=""){
			$.ajax({
				url:"${ctx}/personalCenter/validateCompany",
				type:"post",
				data:{"companyName":companyName},
				success:function(result){
					if(result.errorCode==1){
						layer.confirm('该企业系统已收录，确认关联？', {
							btn: ['是', '否'], btn1:function(){
								editCompany(result.companyId);
				            }, btn2: function () {
				                $("#companyName").val("");
				                $("#socialCreditNo").val("");
				            },cancel: function(){ 
				            	$("#companyName").val("");
				                $("#socialCreditNo").val("");
				            }
				        });
					}else if(result.errorCode==2){
						layer.msg(result.errorMsg);
						$("#companyName").val("");
			            $("#socialCreditNo").val("");
					}else if(result.errorCode==3){
						layer.msg(result.errorMsg);
						$("#companyName").val("");
			            $("#socialCreditNo").val("");
					}
				},
				error:function(){
					layer.msg("系统异常！");
				}
			});
		}
		
	}
	
	function clearButton(){
		window.location.href="${ctx}/personalCenter/companyEdit"
	}
	
	function getInfoList(i) {
			//$("#loadingBar").fadeIn();
			$.ajax({
				url : "${urlPath}XOffice/interface/json/organizationImage/list",
				type : "post",
				data : {
					"pageNum" : pageNum,
					"pageSize":12,
					"organizationId" : companyId
				},
				dataType : "json",
				success : function(result) {
					console.log()
					if (pageNum == 1) {
						$("#honorList").empty();
						$("#nodataBar").hide();
						$("#endingBar").hide();
					}
					if (result.success) {
						var list = result.list;
						if (list == undefined || list.length == 0) {
							$("#nodataBar").fadeIn();
							$("#loadingBar").hide();
							flag = false;
							$("#content2").show();
							$("#content1").hide();
						} else {
								$("#content1").show();
								for (var i = 0; i < list.length; i++) {
								var info = list[i];
								var _div = "";
								_div += "<div class=\'honor-div\' onclick=\'\' >";
								_div += "  <div class=\'honor-img-div\' style=\'padding:15px;height:80%;\'>";
								if(info.imageUrl){
									_div += "    <img class=\'honor-img\' src=\'"+nvlStr(info.imageUrl)+"\' /></div>";
								}else{
									_div += "    <img class=\'honor-img\' src=\'${ctx}/static/image/activity/activityImage.png\' /></div>";
								}
								_div += "  <div class=\'honor-title-div\' title=\'"+info.imageName+"\'><input type=\'checkbox\' class=\'i-checks\' style=\'float:left;\' value=\'"+nvlStr(info.imageId)+"\'/>";
								_div += "&nbsp;"+limitStr(info.imageName,10)+"&nbsp;<img src=\'${ctx}/static/image/edit.png\' title=\'编辑\' width=\'22\' style=\'cursor:pointer;\' onclick=\'edit(\""+nvlStr(info.imageAt)+"\",\""+nvlStr(info.imageId)+"\",\""+nvlStr(info.imageName)+"\",\""+nvlStr(info.imageUrl)+"\",\""+nvlStr(info.remark)+"\");\'></div></div>";
								$("#honorList").append(_div);
							}
							if (!(pageNum * 12 < result.total)) {
								flag = false;
								isloading = false;
								$("#endingBar").fadeIn();
							}else{
								flag = true;
								isloading = true;
							}
							$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",});
							$("#loadingBar").hide();
						} 
					}
					$("#loadingBar").hide();
					isloading = false;
					$(".contact-box").each(function() {
						animationHover(this, "pulse")
					});
				},
				error : function() {
					layer.msg("系统异常");
					$("#loadingBar").hide();
					isloading = false;
				}
			});
	}
	function add() {
		$('#imageUrl').val('');
		$('#imageAt').val('');
		$('#imageId').val('');
		$('#imageName').val('');
        $('#remark').val('');
        $("#showPicUrl").attr('src', '${ctx}/static/image/activity/activityImage.png');
		layer.open({
			  type: 1,
			  title: false,
			  closeBtn: 1, //不显示关闭按钮
			  shade: [.4],
			  area: ['50%', '60%'],
			  anim: 2,
			  content: $('.releaseItem'), 
			  btn: ['保存','关闭'],
			  yes: function(index, layero){
				  if($('#imageName').val()==''){
					  return layer.msg('请填写图片名称！');
				  } 
				  $('#remark').val(safeStr($('#remark').val()));
				  $('#imageName').val(safeStr($('#imageName').val()));
				  console.log(safeStr($('#imageName').val()))

				  
					$.post("${urlPath}XOffice/interface/json/parkInfo/imageSave?"+$("#saveForm").serialize(),function(result){
						if(result.errorCode==0){
							layer.close(index);
							layer.msg('新增成功！');
							setTimeout(function() {
								pageNum = 1;
								getInfoList();
							}, 1000);
							
						}else{
							layer.msg('系统异常！');
						}
					    
					  }); 
				  
				  
				  //layer.closeAll();
			  },cancel: function(){ 
				  
	          }
		}); 
		
		//location.href = "${ctx}/page/officeOrganization/imageCreate?orgId="+comanyId;
	}
	function showPic(jsonData) {
		$("#showPicUrl").attr('src', jsonData.attachmentUrl);
		$("#showPicUrl").show();
	}
	
	function showAtts(jsonData) {
		var url = "";
		url += '<li id="'+jsonData.attachmentId+'" style="float:none;"><a href="'+jsonData.attachmentUrl+'" target="_blank" >'
				+ jsonData.remoteName
				+ '</a>&nbsp;<a href="javascript:;"  onclick="deleteAtt(\''+jsonData.attachmentId+'\',\''+jsonData.attachmentUrl+'\')">[删除]</a></li> ';
		$('#attList').append(url);
		
	}
	function edit(at,id,name,url,remark) {
		if(!url){
			url = "${ctx}/static/image/activity/activityImage.png";
		}
		$('#imageUrl').val(url);
		$('#imageAt').val(at);
		$('#imageId').val(id);
		$('#imageName').val(name);
        $('#remark').val(remark);
        $("#showPicUrl").attr('src',url);
		$("#showPicUrl").show();
		layer.open({
			  type: 1,
			  title: false,
			  closeBtn: 1, //不显示关闭按钮
			  shade: [.4],
			  area: ['50%', '60%'],
			  anim: 2,
			  content: $('.releaseItem'), 
			  btn: ['保存','关闭'],
			  yes: function(index, layero){
				  if($('#imageName').val()==''){
					  return layer.msg('请填写图片名称！');
				  } 
				  	$.post("${urlPath}XOffice/interface/json/parkInfo/imageSave?"+$("#saveForm").serialize(),function(result){
						if(result.errorCode==0){
							layer.close(index);
							layer.msg('编辑成功！');
							setTimeout(function() {
								pageNum = 1;
								getInfoList();
							}, 1000);
						}else{
							layer.msg('系统异常！');
						}
					    
					  }); 
				 // layer.closeAll();
			  },cancel: function(){ 
				  
	          }
		}); 
		
	}
	function del() {
		var ids = "";
		$("#honorList input:checked").each(function() {
			if(ids!=""){
				ids+=",";
			}
			ids+=$(this).val();
		});
		var items = ids.split(",");
		$("#items").val(items);
		if ($("#items").val() == "") {
			alert("请选择要操作的对象");
		} else {
			 confirm("确定删除选定的记录?", function() {
				 $.ajax({
						url:"${urlPath}/XOffice/interface/json/parkInfo/imageDelete",
						type:"post",
						data:{
							"ids":ids
						},
						dataType:"json",
						success:function(result){
							layer.msg("删除成功！");
							pageNum = 1;
							setTimeout(function() {
								getInfoList();
							}, 1000);
						},
						error : function() {
							layer.msg("地址请求超时，请刷新页面！");
						}
					})
			}); 
		}
	}
	
</script>
</head>

<body>
<div class="center_main">
	 <div class="project_header">
		<%-- <c:if test="${entranceId==3609009 }"  >
		  <%@ include file="../common/bak/header_yc.jsp"%>
		</c:if>
		<c:if test="${entranceId!=3609009  }"  >
		  <%@ include file="../common/header.jsp"%>
		</c:if> --%>
		<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="-1"/>
		<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="个人中心" />
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
	</div> 

	<div class="center_content clearfix">
		<div class="centerContentLeft">
			<div class="menuNav">
				<a href="${ctx}/personalCenter/messageNotification">
					<img src="${ctx}/static/image/personalCenter/message.jpg" width="24" height="24" style="vertical-align: middle;"> 
					<span style="vertical-align: middle; margin-left: 2px;">消息通知</span>
				</a>
			</div>
			<div class="menuNav">
				<a href="javascript:;"> 
					<img src="${ctx}/static/image/personalCenter/setUp.jpg" width="24" height="24"> 
					<span style="margin-left: 2px;">设置</span>
				</a>
				<ul>
					<li><a href="${ctx}/personalCenter/personalInfoEdit">个人信息</a></li>
					<li><a href="${ctx}/personalCenter/accountSecurity">账号安全</a></li>
					<li><a href="${ctx}/personalCenter/accountUpgrade">账号升级</a></li>
					<%-- <li><a href="${ctx}/personalCenter/parkEdit" >园区设置</a></li> --%>
					<li><a href="${ctx}/personalCenter/companyEdit" style="color: #000;">企业设置</a></li>
				</ul>
			</div>
		</div>
		<div class="centerContentRight">
			<form action="${ctx}/personalCenter/saveCommonCompany" method="post" id="editform">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				<input type="hidden" id="provinceId" name="provinceId" value="${companyInfoBean.provinceId}"> 
				<input type="hidden" id="provinceName" name="provinceName" value="${companyInfoBean.provinceName}"> 
				<input type="hidden" id="areaId" name="areaId" value="${companyInfoBean.areaId}"> 
				<input type="hidden" id="areaName" name="areaName" value="${companyInfoBean.areaName}"> 
				<input type="hidden" id="spaceId" name="spaceId" value="${companyInfoBean.spaceId}"> 
				<input type="hidden" id="spaceName" name="spaceName" value="${companyInfoBean.spaceName}"> 
				<input type="hidden" id="parentId" name="parentId">
				<input type="hidden" id="companyId" name="companyId" value="${companyInfoBean.companyId}">
				<input type="hidden" id="createrId" name="createrId" value="${companyInfoBean.createrId}">
				<div class="centerContent">
					<div class="centerTop">企业设置</div>
					<div style="padding: 0 15px 20px;">
						<!-- 创建企业 -->
						<c:choose>
										<c:when test="${companyInfoBean eq null}">
											
										</c:when>
										<c:otherwise>
										
										</c:otherwise>
									</c:choose>
						<div class="company_dataBar">
							<span class="park_dataLeft">创建企业</span>
							<div class="company_establishBar">
								<div class="company_establish clearfix">
									<span class="park_dataLeft"> <span class="redStar">*</span>企业名称：</span> 
									<c:choose>
										<c:when test="${companyInfoBean eq null}">
											<input type="text" placeholder="请输入企业名称" class="company_estInput" id="companyName" name="companyName" maxlength="50" value="${companyInfoBean.companyName}" onblur="validateCompany(this)">
										</c:when>
										<c:otherwise>
											<input type="text" placeholder="请输入企业名称" class="company_estInput" id="companyName" name="companyName" maxlength="50" value="${companyInfoBean.companyName}"  disabled="disabled">
										</c:otherwise>
									</c:choose>
									
									<!-- 企业列表 -->
									<div class="company_establish" style="padding: 10px 0;">
										<c:choose>
											<c:when test="${compTotal==0||compTotal==null||compTotal==''}"><span class="color_red">暂无关联企业</span></c:when>
											<c:otherwise><span class="color_red">已保存${compTotal}家企业</span></c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="company_establish clearfix">
									<span class="park_dataLeft"> <span class="redStar">*</span>信用代码：</span> 
									<c:choose>
										<c:when test="${companyInfoBean eq null}">
											<input type="text" placeholder="请输入18位社会信用代码" class="company_estInput" id="socialCreditNo" name="socialCreditNo" maxlength="18" value="${companyInfoBean.socialCreditNo}">
										</c:when>
										<c:otherwise>
											<input type="text" placeholder="请输入18位社会信用代码" class="company_estInput" id="socialCreditNo" name="socialCreditNo" maxlength="18" value="${companyInfoBean.socialCreditNo}" disabled="disabled">
										</c:otherwise>
									</c:choose>
									
								</div>
								<div class="company_establish clearfix">
									<span class="park_dataLeft">主营业务：</span> 
									<c:choose>
										<c:when test="${companyInfoBean.createrId eq curAccountId || companyInfoBean eq null}">
											<input type="text" placeholder="请输入企业主营业务" class="company_estInput" id="operationMain" name="operationMain" value="${companyInfoBean.operationMain}">
										</c:when>
										<c:otherwise>
											<input type="text" placeholder="请输入企业主营业务" class="company_estInput" id="operationMain" name="operationMain" value="${companyInfoBean.operationMain}" disabled="disabled">
										</c:otherwise>
									</c:choose>
									
								</div>
								<div class="company_establish clearfix">
									<span class="park_dataLeft"> 所在地区： </span>
									<c:choose>
										<c:when test="${companyInfoBean.createrId eq curAccountId || companyInfoBean eq null}">
											<select id="province"><option>省份/自治区</option></select> 
											<select id="city"><option>城市/自治州</option></select> 
											<select id="town"><option>区/县</option></select>
										</c:when>
										<c:otherwise>
											<select id="province" disabled="disabled"><option>省份/自治区</option></select> 
											<select id="city" disabled="disabled"><option>城市/自治州</option></select> 
											<select id="town" disabled="disabled"><option>区/县</option></select>
										</c:otherwise>
									</c:choose>
									
								</div>
								<%-- <div class="company_establish clearfix">
										<span class="park_dataLeft"> 
											<span class="redStar"></span>归属园区：
										</span> 
										<select id="park"><option value="">请选择归属园区</option>
											<c:forEach items="${parkList}" var="park">
												<option value="${park.park_id}">${park.park_name}</option>
											</c:forEach>
										</select>	
									</div> --%>
								<div class="company_establish clearfix">
									<span class="park_dataLeft">详细地址：</span>
									<c:choose>
										<c:when test="${companyInfoBean.createrId eq curAccountId || companyInfoBean eq null}">
											<textarea rows="4" placeholder="建议您如实填写详细地址，例如街道名称，门牌号码，楼层和房间信息" id="positionAddress" name="positionAddress">${companyInfoBean.positionAddress}</textarea>
										</c:when>
										<c:otherwise>
											<textarea rows="4" placeholder="建议您如实填写详细地址，例如街道名称，门牌号码，楼层和房间信息" id="positionAddress" name="positionAddress" disabled="disabled">${companyInfoBean.positionAddress}</textarea>
										</c:otherwise>
									</c:choose>
									
								</div>
								<div class="company_establish clearfix">
									<span class="park_dataLeft">企业网址：</span> 
									<c:choose>
										<c:when test="${companyInfoBean.createrId eq curAccountId || companyInfoBean eq null}">
											<input type="text" placeholder="请输入企业网址" class="company_estInput" id="siteUrl" name="siteUrl" value="${companyInfoBean.siteUrl}">
										</c:when>
										<c:otherwise>
											<input type="text" placeholder="请输入企业网址" class="company_estInput" id="siteUrl" name="siteUrl" value="${companyInfoBean.siteUrl}" disabled="disabled">
										</c:otherwise>
									</c:choose>
									
								</div>
								<div class="company_establish clearfix">
									<span class="park_dataLeft">企业简介：</span>
									<c:choose>
										<c:when test="${companyInfoBean.createrId eq curAccountId || companyInfoBean eq null}">
											<textarea rows="4" placeholder="" id="companyDescription" name="companyDescription">${companyInfoBean.companyDescription}</textarea>
										</c:when>
										<c:otherwise>
											<textarea rows="4" placeholder="" id="companyDescription" name="companyDescription" disabled="disabled">${companyInfoBean.companyDescription}</textarea>
										</c:otherwise>
									</c:choose>
									
								</div>
								<div class="company_establish" style="padding: 10px 0;">
									<input type="button" value="提交" class="buttonContralRed" style="margin-left: 102px;" onclick="saveCommonCompany()">
									<input type="button" value="取消" class="buttonContralGray" onclick="clearButton()">
								</div>
								
								<!-- 企业列表 -->
								<div class="company_establish" style="padding: 10px 0;">
									<c:choose>
										<c:when test="${compTotal==0||compTotal==null||compTotal==''}"><span class="color_red">暂无关联企业</span></c:when>
										<c:otherwise><span class="color_red">已保存${compTotal}家企业</span></c:otherwise>
									</c:choose>
								</div>
								<div class="company_establish clearfix">
										<table class="company_yjtablish picChange">
											<thead>
												<tr>
													<th width="18%">企业名称</th>
													<th width="15%">信用代码</th>
													<th width="15%">主营业务</th>
													<th width="20%">所在地区</th>
													<th width="20%">操作</th>
													<th width="17%">是否默认企业</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${compList}" var="compInfo">
													<tr>
														<td title="${compInfo.companyName}">
															<c:choose>
																<c:when test="${fn:length(compInfo.companyName)>9}">
																	${fn:substring(compInfo.companyName,0,9)}...
																</c:when>
																<c:otherwise>${compInfo.companyName}</c:otherwise>
															</c:choose>
														</td>
														<td>${compInfo.socialCreditNo}</td>
														<td title="${compInfo.operationMain}">
															<c:choose>
																<c:when test="${fn:length(compInfo.operationMain)>6}">
																	 ${fn:substring(compInfo.operationMain,0,6)}...
																</c:when>
																<c:otherwise>${compInfo.operationMain}</c:otherwise>
															</c:choose>
														</td>
														<td>${compInfo.provinceName}${compInfo.areaName}${compInfo.spaceName}</td>
														<td>
															<c:choose>
																<c:when test="${compInfo.systemId==12}">
																	<c:choose>
																		<c:when test="${compInfo.createrId==curAccountId}">
																			<a href="javascript:void(0)" onclick="editCompany('${compInfo.companyId}')">修改</a>
																		</c:when>
																		<c:otherwise>
																			<a href="javascript:void(0)" style="color: #ccc">修改</a>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	<a href="javascript:void(0)" style="color: #ccc">修改</a>
																	
																</c:otherwise>
															</c:choose>
															|<a href="javascript:void(0)" onclick="deleteCompany('${compInfo.companyId}')">删除</a>
															|<a href="javascript:void(0)" onclick="companyDetail('${compInfo.companyId}')">详情</a>
															|<a href="javascript:void(0)" onclick="picChange('${compInfo.companyId}','${compInfo.companyName}')">修改图库</a>
														</td>
														<td>
															<c:choose>
																<c:when test="${info.companyId eq compInfo.companyId}">
																	<div class="default_company_div" style="margin-left: 10px;">
																		<a class="default_company2">默认企业</a>
																	</div>&nbsp;
																</c:when>
																<c:otherwise>
																	<div class="default_company_div">
																		<a class="default_company" onclick="saveDefaultCompany('${compInfo.companyId}')">设为默认企业</a>
																	</div>&nbsp;
																</c:otherwise>
															</c:choose>
															
														</td>
													<%-- 	<td>
															<c:choose>
																<c:when test="${compTotal==0||compTotal==null||compTotal==''}">
																	<span class="color_red">暂无关联企业</span>
																</c:when>
																<c:otherwise>
																	<div class="default_company_div" style="margin-left: 10px;">
																		<a class="default_company2 redColor" href="javascript:;" onclick="picChange('${compInfo.companyId}','${compInfo.companyName}')">修改图库</a>
																	</div>&nbsp;
																</c:otherwise>
															</c:choose>
														</td> --%>
													</tr>	
												</c:forEach>
											</tbody>
										</table>
									</div>
								
							</div>

						</div>
						<!-- 加入企业 -->
						<div class="company_dataBar" style="display: none;">
							<span class="park_dataLeft">加入企业：</span> 
							<span class="company_dataPrompt"></span>
							<div class="company_dataOper" onclick="join(this)">+&nbsp;加入企业</div>
							<div style="clear: both;"></div>

							<div class="company_joinBar" style="display: none">
								<div class="company_join clearfix">
									<span class="park_dataLeft" style="width: 100px;">输入企业邀请码</span>
									<input type="text" placeholder="" class="company_joinInput">
									<span class="company_dataPrompt" style="padding: 2.5px 0;">
										（请找您所在企业的园企智汇管理员查看邀请码，邀请码24个小时内有效） </span>
								</div>
								<div class="company_join" style="padding: 10px 0;">
									<input type="button" value="提交" class="buttonContralRed" style="margin-left: 102px;"> 
									<input type="button" value="取消" class="buttonContralGray">
								</div>
							</div>

							<div style="margin-top: 10px; display: none;"></div>
							<div class="company_dataCont clearfix" style="display: none;">
								<div class="park_dataRight"> 江西融合科技有限责任公司 
									<img src="${ctx}/static/image/personalCenter/delete.png" width="10" height="10" class="deleteOper">
								</div>
								<div class="viewDetails" onclick="companyDetail();">查看详情</div>
								<div class="setDefault">设为默认</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="picRight">
			<form method="post" id="deleteForm">
			<input type="hidden" id="items" name="items"/> 
			<input type="hidden" name="orgId"/> 
			</form>
			<div class="wrapper wrapper-content fadeInRight">
			    <div class="companyTitle"></div>
				<div class="ibox float-e-margins">
					<div class="ibox-content" style="border: none;">
					<div id="content1" style="display: none;">
						<div class="btn-group" id="infoTableToolbars" role="group" style="width: 100%; padding: 0; display: block;">
							<button type="button" class="btn btn-outline btn-default" onclick="add();" title="新增" style="margin-right: 7px;">
								<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;新增
							</button>
							<button type="button" class="btn btn-outline btn-default" onclick="del();" title="删除" style="margin-right: 7px;">
								<i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp;删除
							</button>
							<button type="button" onclick="goback()" class="btn btn-outline btn-default">返回</button>
						</div>
						<div style="clear: both"></div>
						<div class="industry-all" style="margin-top: 0;">
							<div class="industry-all-margin" id="honorList">
							
							</div>
							<div style="clear: both;"></div>
							<div id="loadingBar" class="sk-spinner sk-spinner-wave" hidden>
								<br>
								<div class="sk-rect1"></div>
								<div class="sk-rect2"></div>
								<div class="sk-rect3"></div>
								<div class="sk-rect4"></div>
								<div class="sk-rect5"></div>
							</div>
							<div id="endingBar" class="endingBar">已显示全部数据！</div>
<!-- 								<div id="nodataBar" class="endingBar">暂无数据！</div>
 -->							</div>
						</div>
						<div  id="content2" class="nullData" style="width: 100%;height: 260px;background-color: #F7F7F7;border: 1px solid #1066B3;display: none;">
							<div class="nullDataDiv" style="text-align: center;height: 260px;line-height: 260px;cursor: pointer;" onclick="add();">
								<%-- <img class="nullDataImg" src="${ctx}/static/image/companyAppealInfo/iconNoneIndustry.png" style="margin-top: 50px;">
								<br /> --%>
								<span class="nullDataText" style="font-size: 45px;color: #1066B3;">+新增</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="releaseItem"  style="display:none">
			  	 <form id="saveForm" method="post">
			  	    <input type="hidden" id="imageId" name="imageId"/>
			  	    <input type="hidden" id="imageAt" name="imageAt"/> 
				    <input type="hidden" id="imageUrl" name="imageUrl"/>
				    <input type="hidden" id="organizationId" name="organizationId" />
					<div>
						<div class="release_inputBar">
							<div class="release_input clearfix">
								<font class="redStar">*</font>
								<span class="release_attr">图片名称</span>
								<input type="text" class="inputBox" style="width:81.5%;" id="imageName" name="imageName"/>
							</div>
							<div class="release_input clearfix">
								<font class="clearStar">*</font>
								<span class="release_attr">图片</span>
								<img  src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl" width="100px;" height="100px;" class="uploadImgContral"/>
								<div class="uploadImgTips">
									<div id="pictureUpload">
										<input type="file" data-no-uniform="true" name="attFiles" id="pic_uploads" multiple="true"/>
									</div>
									<p>建议大小1040X484</p>
								</div>
							</div>
							<div class="release_input clearfix">
								<font class="clearStar">*</font>
								<span class="release_attr">图片描述</span>
								<textarea type="text" class="inputBox" placeholder="请输入少于120个文字的描述" style="width:81.5%;" id="remark" name="remark" /></textarea>
							</div>
							<div style="padding-right:76px;">
<!-- 									<input type="button" value="保存" onclick="save('2');" class="greenBtnContral redControl">
 -->									<div style="clear:both;"></div>
							</div>
						</div>
					</div>
					</form>
				</div>	
		 </div>	
	</div>
	<%-- <c:if test="${entranceId==3609009 }"  >
	  <%@ include file="../common/bak/footer_yc.jsp"%>
	</c:if>
	<c:if test="${entranceId!=3609009  }"  >
	  <%@ include file="../common/footer.jsp"%>
	</c:if> --%> 
		
	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
 </body>
</html>
