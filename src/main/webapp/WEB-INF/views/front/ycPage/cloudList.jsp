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
<title>企业上云</title>
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
<link href="${ctx}/static/css/experienceSharing/experienceSharing.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/jquery.searchableSelect.css" />
<link href="${ctx}/static/css/experienceSharing/cloud.css" rel="stylesheet"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/select2/select2.min.css" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/js/plugins/fancybox_new/jquery.fancybox.min.css" />
<style>
.select2-container .select2-selection--single .select2-selection__rendered{
	text-align: center;
}
</style>
</head>
<body>
	<div class="project_main">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="-1"/>
		<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="企业上云" />
		<div class="project_content_header">
			<div class="container newNav">
			     <div class="newNavSub">
			     	<img src="${ctx}/static/image/homePage_yc/projectDsc.png" />
			     </div>
			    <div class="newNavSub">
			    	<p class="navTitle">企业上云</p>
			    	<p><font class="projectNum" id="projectNum1">22</font>&nbsp;
				<font id="font1">个</font> &nbsp;&nbsp; <font id="font2">企业云应用</font></p>
			     </div>
			</div>
		</div>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
                        <div class="img_title">
                            <a href="http://www.zhaozhizao.com/" target="_blank"><img src="${ctx}/static/image/homePage_yc/cloud_znzz.jpg"></a>
                            <a href="https://www.zbj.com/tijian/index.html"  target="_blank"><img src="${ctx}/static/image/homePage_yc/cloud_qytj.jpg"></a>
                        </div>
                        <div class="clear"></div>
						<div class="artical-list">
							<div class="titleName">
								<ul>
                                    <li class="on">企业上云申请</li>
                                    <li>企业上云应用服务</li>
								</ul>
							</div>
							<div class="title-items">
                                <div class="title-content" id="set0" >
                                    <div class="artical-content" style="border: none">
                                        <div class="releaseItem">
                                            <div class="application-box application-select noprint" id="application-select" style="display: block;">
                                                <img src="${ctx}/static/image/homePage_yc/apply_01.png">
                                                <div class="application-content">
                                                    <div class="tips-box">
                                                        <p><span style="color: #333;">还未申请上云的企业请点击</span>"立即申请"，</p>
                                                        <p><span style="color: #333;">需要查看、修改申请的企业，请点击</span>"管理我的申请"。</p>
                                                    </div>
                                                    <div>
                                                        <input type="button" value="立即申请" onclick="showpage(1)" class="blueBtnContral">
                                                        <input type="button" value="管理我的申请" onclick="showpage(2)" class="blueBtnContral greenBtnContral">
                                                        <div style="clear:both;"></div>
                                                    </div>
                                                </div>
											</div>
											<div class="application-form noprint" id="application-form" style="display: none;">
												<div>
													<input type="button" value="返回" class="blueBtnContral backBtn" id="back1">
													<input type="button" value="返回" class="blueBtnContral backBtn" id="back2">
													<div style="clear:both;"></div>
												</div>
												<h1>宜春市"企业上云"云资源服务申请表</h1>
												<p class="tipText">* 企业申请上云需如实填写以下内容，并下载《企业上云申请承诺书》盖公章后上传。</p>
												<div class="form-content">
													<form id="cloudForm">
														<input type="hidden" name="applyId" value="" />
														<input type="hidden" id="computerJson" name="computerJson" value="" />
														<table>
															<tr>
																<td class="td15"><span>企业名称</span></td>
																<td class="td85" colspan="6" style="padding: 12px 34px 12px 15px;">
																	<input type="hidden" id="companyName" name="companyName" value="" />
																	<select id="companyId" name="companyId" >
																	</select>
																</td>
															</tr>
															<tr>
																<td class="td15"><span>法人代表</span></td>
																<td class="td35" colspan="2">
																	<input type="text" class="input-content" id="legalPerson" name="legalPerson"  maxlength="32">
																</td>
																<td class="td15" colspan="2"><span>注册时间</span></td>
																<td class="td35" colspan="2">
																	<input id="establishDate" class="form-control layer-date input-content" name="establishDate" readonly/>
																</td>
															</tr>
															<tr>
																<td class="td15"><p>注册资本</p><p>（万元）</p></td>
																<td class="td35" colspan="2">
																	<input type="text" class="input-content pt10" id="registeredCapital" name="registeredCapital" maxlength="18" precision="4">
																</td>
																<td class="td15" colspan="2"><p>上年度纳税额</p><p>（万元）</p></td>
																<td class="td35" colspan="2">
																	<input type="text" class="input-content" id="previousTax" name="previousTax" maxlength="18" precision="4" >
																</td>
															</tr>
															<tr>
																<td class="td15"><span>联系人</span></td>
																<td class="td35" colspan="2">
																	<input type="text" class="input-content" id="contactName" name="contactName" maxlength="32"/>
																</td>
																<td class="td15" colspan="2"><span>所属园区</span></td>
																<td class="td35" colspan="2" style="padding: 12px 33px 12px 16px;">
																	<input type="hidden" id="parkName" name="parkName" value="" />
																	<select id="parkId" name="parkId">
																	</select>
																</td>
															</tr>
															<tr>
																<td class="td15"><span>公司地址</span></td>
																<td class="td85" colspan="6">
																	<input type="text" class="input-content" id="operationAddress" name="operationAddress" style="width:94%;" maxlength="80">
																</td>
															</tr>
															<tr>
																<td class="td15"><span>经营范围</span></td>
																<td class="td85" colspan="6">
																	<textarea type="text" class="input-content" id="operationScope" name="operationScope" style="width:94%;height: 87px; resize:vertical;" maxlength="960"/></textarea>
																</td>
															</tr>
															<tr>
																<td class="td15"><span>系统名称</span></td>
																<td class="td85" colspan="6">
																	<input type="text" class="input-content" id="sysName" name="sysName" style="width:94%;" maxlength="64">
																</td>
															</tr>
															<tr>
																<td class="td15"><span>云资源服务需求</span></td>
																<td class="td85" colspan="6" id="hosts">
																	<div>
																		<input type="button" value="添加主机" id="addHost" class="blueBtnContral addBtn fwn">
																		<div style="clear:both;"></div>
																	</div>
																</td>
															</tr>
															<tr class="h136">
																<input type="hidden" required="required" name="businessImageAt" id="businessImageAt" />
											                    <input type="hidden" name="businessImageUrl" id="businessImageUrl" />
											                    <input type="hidden" required="required" name="taxImageAt" id="taxImageAt" />
										                        <input type="hidden" name="taxImageUrl" id="taxImageUrl" />
										                        <input type="hidden" required="required" name="commitmentAt" id="commitmentAt"  />
										                        <input type="hidden" name="commitmentUrl" id="commitmentUrl" />
																<td class="td15"><span>营业执照</span></td>
																<td class="td35" colspan="2">
																	<a class="fancybox" id="fancybox1" href=""><img  src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl1" width="100px;" height="100px;" class="uploadImgContral"/></a>
																	<p class="uploadtips">*只能上传JPG、PNG格式的图片，图片不能大于2MB。</p>
																	<div class="uploadImgTips">
																		<div id="pictureUpload">
																			<input type="file" data-no-uniform="true" name="imageAt" class="imageAt" id="pic_uploads1" multiple="true"/>
																		</div>	
																	</div>
																</td>
																<td class="td15" colspan="2"><span>纳税证明</span></td>
																<td class="td35" colspan="2">
																	<a class="fancybox" id="fancybox2" href=""><img  src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl2" width="100px;" height="100px;" class="uploadImgContral"/></a>
																	<p class="uploadtips">*只能上传JPG、PNG格式的图片，图片不能大于2MB。</p>
																	<div class="uploadImgTips">
																		<div id="pictureUpload">
																			<input type="file" data-no-uniform="true" name="imageAt" class="imageAt" id="pic_uploads2" multiple="true"/>
																		</div>	
																	</div>
																</td>
															</tr>
															<tr class="h136">
																<td class="td15"><span>企业承诺书</span></td>
																<td class="td85" colspan="6">
																	<a class="fancybox" id="fancybox3" href=""><img  src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl3" width="100px;" height="100px;" class="uploadImgContral"/></a>
																	<p class="uploadtips" style="margin-left: 19%;">*只能上传JPG、PNG格式的图片，图片不能大于2MB。</p>
																	<div class="uploadImgTips">
																		<div id="pictureUpload">
																			<input type="file" data-no-uniform="true" name="imageAt" class="imageAt" id="pic_uploads3" multiple="true"/>
																		</div>	
																	</div>
																	<div class="module-content">
																		<p>《企业上云申请承诺书》模板.doc</p>
																		<iframe style="display:none" id="printIframe1" src="${ctx}/static/image/homePage_yc/pdf3.pdf"></iframe>
																		<input type="button"value="下载" onclick="download(1)" class="loadbtn">
																		<input type="button"value="打印" onclick="preview_new(1)" class="loadbtn">
																		<div class="clearfix"></div>
																	</div>
																</td>
															</tr>
															<tr>
																<td class="td15"><span>手机号</span></td>
																<td class="td35" colspan="2">
																	<input type="text" class="input-content" id="contactPhone" name="contactPhone">
																</td>
																<td class="td15" colspan="2"><span>验证码</span></td>
																<td class="td35" colspan="2">
																	<input type="text" class="input-content" id="verificationCode" name="verificationCode" style="width:46%;">
																	<input type="button" value="获取验证码" id="getcode" class="getcodeBtn">
																	<div style="clear:both;"></div>
																</td>
															</tr>
															<tr id="application-state" class="application-state">
																<td class="td15"><span>申请时间</span></td>
																<td class="td35" colspan="2">
																	<input type="text" class="input-content" id="" name="" value="2018-12-26" style="border: none;text-align: center;" readonly="readonly">
																</td>
																<td class="td15" colspan="2"><span>状态</span></td>
																<td class="td35" colspan="2">
																	<input type="text" class="input-content" id="" name="" value="初审不通过" style="border: none;text-align: center;color:#ff0000;" readonly="readonly">
																</td>
															</tr>
														</table>
													</form>
													<div class="sumbitBtn">
														<input type="button" value="提交申请" onclick="formSubmit()" class="blueBtnContral greenBtnContral sumbitApply" id="sumbitApply" style="float: none;"> 	
														<input type="button" value="确认修改并提交" onclick="" class="blueBtnContral editApply" id="editApply" style="float: none;"> 
														<div style="clear:both;"></div>
													</div>
												</div>
											</div>
                                        </div>	
									</div>
                                </div>
								<div class="title-content" id="set1" style="display: none">
									<div id="allList">
                                        <div class="module">
                                            <h1>企业平台系统上云</h1>
                                            <div class="application_list">
                                                <a href="http://www.zhaozhizao.com/" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_01.png">
                                                    <p>找智造智能制造服务</p>
                                                </a>
                                                <a href="https://www.zbj.com/tijian/index.html" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_02.png">
                                                    <p>猪八戒企业体检服务</p>
                                                </a>
                                                <a href="https://www.ibm.com/" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_03.png">
                                                    <p>IBM智能制造服务</p>
                                                </a>
                                                <a href="https://www.industry.siemens.com.cn/topics/cn/zh/digital-enterprise-suite/Pages/Default.aspx" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_04.png">
                                                    <p>西门子智能制造服务</p>
                                                </a>
                                                <a href="https://cloud.baidu.com/solution/iot/index.html" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_05.png">
                                                    <p>百度物联网服务</p>
                                                </a>
                                                <a href="https://www.huaweicloud.com/solution/manufacturing/" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_06.png">
                                                    <p>华为制造行业服务</p>
                                                </a>
                                                <a href="https://www.intel.cn/content/www/cn/zh/internet-of-things/overview.html" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_07.png">
                                                    <p>英特尔物联网服务</p>
                                                </a>
                                                <a href="https://www.aliyun.com/solution/industry?spm=5176.8267214.592492.39.6f073af25NHoOG" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_08.png">
                                                    <p>阿里云制造服务</p>
                                                </a>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        <div class="module">
                                            <h1>协调办公应用上云</h1>
                                            <div class="application_list">
                                                <a href="https://www.weaver.com.cn/e9/index.html" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_09.png">
                                                    <p>泛微OA</p>
                                                </a>
                                                <a href="http://www.seeyon.com/" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_10.png">
                                                    <p>致远OA</p>
                                                </a>
                                                <a href="https://www.dingtalk.com/" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_11.png">
                                                    <p>钉钉</p>
                                                </a>
                                                <a href="https://work.weixin.qq.com/" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_12.png">
                                                    <p>企业微信</p>
                                                </a>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        <div class="module">
                                            <h1>经济管理应用上云</h1>
                                            <div class="application_list">
                                                <a href="https://www.yonyoucloud.com/product.php?id=1" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_13.png">
                                                    <p>用友账务云</p>
                                                </a>
                                                <a href="http://www.kingdee.com/sem/finance/" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_14.png">
                                                    <p>金蝶账务云</p>
                                                </a>
                                                <a href="https://www.sap.com/china/products/digital-supply-chain/scm.html" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_15.png">
                                                    <p>SAP供应链云</p>
                                                </a>
                                                <a href="http://www.ik3cloud.com/SEM/SCM?Length=3" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_16.png">
                                                    <p>金蝶供应链云</p>
                                                </a>
                                                <a href="https://www.workec.com/" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_17.png">
                                                    <p>EC CRM</p>
                                                </a>
                                                <a href="http://www.yunduoketang.com/CRM.html" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_18.png">
                                                    <p>云朵CRM</p>
                                                </a>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        <div class="module">
                                            <h1>业务运营应用上云</h1>
                                            <div class="application_list">
                                                <a href="https://www.jx968969.com/XProject/product/list?entranceId=3609009" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_19.png">
                                                    <p>产品展销</p>
                                                </a>
                                                <a href="https://www.jx968969.com/XProject/supply/list?entranceId=3609009" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_20.png">
                                                    <p>企业供求</p>
                                                </a>
                                                <a href="https://www.jx968969.com/XProject/yc/list?type=3&entranceId=3609009" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_21.png">
                                                    <p>用工招聘</p>
                                                </a>
                                                <a href="https://www.jx968969.com/XProject/logistics/list?entranceId=3609009" class="application_info" target="_blank">
                                                    <img src="${ctx}/static/image/homePage_yc/cloud_22.png">
                                                    <p>物流服务</p>
                                                </a>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
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
<script src="${ctx}/static/js/plugins/fancybox_new/jquery.fancybox.min.js"></script>
<script src="${ctx}/static/js/plugins/pagination/jquery.pagination.js"></script>
<script src="${ctx}/static/js/plugins/jqprint/jquery.jqprint-0.3.js"></script>  
<script type="text/javascript" src="${ctx}/static/js/jquery.searchableSelect.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/select2/js/select2.full.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/select2/js/zh-CN.js"></script>
<script type="text/javascript" src="${ctx}/static/js/utils/XUtils.js"></script>
<script type="text/javascript">
var isAdopt=true;
var hostnum=0;//初始主机数量为1
$(function(){
	var create = {
				elem : '#establishDate',
				format : 'YYYY-MM-DD',
				event : "focus",
				min :'2015-01-11',//设定最小日期为当前日期
				max :laydate.now(),//最大日期
				istime : false,
				start : laydate.now(0, "YYYY-MM-DD"),
				choose : function(datas) {
					// start.max = datas; //结束日选好后，重置开始日的最大日期
				}
	};
	$("a.fancybox").on("click",function(event){
		if($(this).attr('href')==""){
			event.preventDefault()
		}	
	})
	$("a.fancybox").fancybox({
		'transitionIn' : 'elastic',
		'transitionOut' : 'elastic',
		'speedIn' : 600,
		'speedOut' : 200,
		'overlayShow' : false,
	});
	laydate(create);
    $(".publish-btn").hide();
    $(".fir-floor").show();
	$(".nav-content a").removeClass("on");
	$(".nav-content a:eq(6)").addClass("on");
	$(".source-room a").removeClass("on");
    $(".publish-btn").on('click',function(){
        $(".titleName li").removeClass("on");
        $(".titleName li:first").addClass("on");
        $("#set1").fadeOut("fast");
        setTimeout(function(){$("#set0").fadeIn("fast");},200);
    });
    $(".titleName li").on("click",function(){          //大项目tab切换
		 var $ind = $(this).index() + 1;
	     activityTags =  "";
		 var $ind1 = $(this).index();
		 $(this).addClass("on").siblings().removeClass("on");
		 $("#set"+$ind1).siblings().fadeOut("fast");
		 setTimeout(function(){ $("#set"+$ind1).fadeIn("fast");},200);
	});
	$("#getcode").on("click",function(){
		   $.ajax({
				url:'${urlPath}XOffice/interface/json/companyCloudApply/getCode',
				type:'post',
				data:{
					"contactPhone": $('#contactPhone').val(),
				},
				dataType:'json',
				success:function(data){
				      console.log(data)
				      if(data.success){
				    		var code = $("#getcode");
				    		code.attr("disabled","disabled");
				    		code.css("opacity","0.8");
				    		code.val("重新获取"+"(60s)");
				    	    var time = 60;
				    	    var set=setInterval(function(){
				    	    code.val("重新获取"+"("+--time+"s)");
				    	    }, 1000);
				    	    setTimeout(function(){
				    			code.css("opacity","1");
				    	    	code.attr("disabled",false).val("获取验证码");
				    	    	clearInterval(set);
				    	    }, 60000);
				      }else{
				    	  layer.msg(data.errorMsg);
				      }
				},
				error:function(){
	                layer.msg('系统异常！');
				}
			});
	})
	$("#addHost").on("click",function(event){
		addHost();
	});
	$("#hosts").on("click",".deleteBtn",function(){
		// console.log($(this).index());
		$(this).parent().parent().parent().remove();
		hostnum--;
		for(var i=0;i<hostnum;i++){
			var j=i+1;
			$(".hostmark").eq(i).text(j);
		}
	});
	$("#back1").on('click',function(){
		showpage(4);
	});
	// 图片附件
	$('#pic_uploads1').uploadify(
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
			'fileObjName' : 'attachment',
			'width' : '80',
			'height' : '30',
			'fileTypeDesc' : 'jpg gif png',
			'fileTypeExts' : '*.jpg;*.gif;*.png',
			'fileSizeLimit' : '2MB',
			'buttonText' : '上传营业执照',
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
							+ $('#pic_uploads1').uploadify('settings',
									'queueSizeLimit') + "个文件！");
					break;
				case -110:
					alert("文件 ["
							+ file.name
							+ "] 大小超出系统限制的"
							+ $('#pic_uploads1').uploadify('settings',
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
				showPic(obj.attachment,1);
				$("#businessImageUrl").val(obj.attachment.attachmentUrl);
				$("#businessImageAt").val(obj.attachment.attachmentId);
			},
			'onInit': function () {            
				$("#pic_uploads1-queue").hide();
			},
		});
		$('#pic_uploads2').uploadify(
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
			'fileObjName' : 'attachment',
			'width' : '80',
			'height' : '30',
			'fileTypeDesc' : 'jpg gif png',
			'fileTypeExts' : '*.jpg;*.gif;*.png',
			'fileSizeLimit' : '2MB',
			'buttonText' : '上传纳税证明',
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
							+ $('#pic_uploads1').uploadify('settings',
									'queueSizeLimit') + "个文件！");
					break;
				case -110:
					alert("文件 ["
							+ file.name
							+ "] 大小超出系统限制的"
							+ $('#pic_uploads1').uploadify('settings',
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
				showPic(obj.attachment,2);
				$("#taxImageUrl").val(obj.attachment.attachmentUrl);
				$("#taxImageAt").val(obj.attachment.attachmentId);
			},
			'onInit': function () {            
				$("#pic_uploads2-queue").hide();
			},
		});
		$('#pic_uploads3').uploadify(
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
			'fileObjName' : 'attachment',
			'width' : '80',
			'height' : '30',
			'fileTypeDesc' : 'jpg gif png',
			'fileTypeExts' : '*.jpg;*.gif;*.png',
			'fileSizeLimit' : '2MB',
			'buttonText' : '上传承诺书',
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
							+ $('#pic_uploads1').uploadify('settings',
									'queueSizeLimit') + "个文件！");
					break;
				case -110:
					alert("文件 ["
							+ file.name
							+ "] 大小超出系统限制的"
							+ $('#pic_uploads1').uploadify('settings',
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
				showPic(obj.attachment,3);
				$("#commitmentUrl").val(obj.attachment.attachmentUrl);
				$("#commitmentAt").val(obj.attachment.attachmentId);
			},
			'onInit': function () {            
				$("#pic_uploads3-queue").hide();
			},
		});
		
		initCompanyList();
		initParkList();
});

function initCompanyList(){
	XUtils.select2({
		id : 'companyId',
		url : '${urlPath}XOffice/interface/json/companyInfo/companyList',
		params : {
			_key : 'companyName',
			_value : 'companyId'
		},
		language: {noResults:'未找到该企业，请联系所在县工信委。'}
	});
	$('#companyId').on(
		'select2:select',
		function(e){
			$("#companyName").val(e.params.data.text);
			var compId = nvlStr(e.params.data.id);
			if (compId != "") {
				$.ajax({
					url : "${urlPath}XOffice/interface/json/officeCompanyInfo/detail",
					type : "post",
					data : {
						"companyId" : compId
					},
					dataType : "json",
					success : function(result){
						if (result.success) {
							var obj = result.value;
							console.log(obj)
							$("#legalPerson").val(nvlStr(obj.legalPerson));
							$("#establishDate").val(
								nvlStr(obj.establishDate) == "" ? "" : formatDate(new Date(obj.establishDate),
									"yyyy-MM-dd"));
							$("#registeredCapital").val(nvlStr(obj.registeredCapital));
							$("#contactName").val(nvlStr(obj.contactName));
							$("#operationAddress").val(nvlStr(obj.operationAddress));
							$("#operationScope").val(nvlStr(obj.operationScope));
							var pId = nvlStr(obj.parkId);
							var pName = nvlStr(obj.parkName);
							if (pId != "") {
								$('#parkId').valueSelete2({
									text : pName,
									id : pId
								});
							}
							$("#parkName").val(pName);
						}
					},
					error : function(){}
				});
			}
		});
	$('#companyId').valueSelete2({
		text : '${info.companyName}',
		id : '${info.companyId}'
	});
}
function initParkList(){
	XUtils.select2({
		id : 'parkId',
		url : '${urlPath}XOffice/interface/json/companyInfo/ycParkList',
		params : {
			_key : 'parkName',
			_value : 'parkId'
		}
	});
	$('#parkId').on('select2:select', function(e){
		$("#parkName").val(e.params.data.text);
	});
	$('#parkId').valueSelete2({
		text : '${info.parkName}',
		id : '${info.parkId}'
	});
}

function showPic(jsonData,num) {
	$("#showPicUrl"+num).attr('src', jsonData.attachmentUrl);
	$("#fancybox"+num).attr('href', jsonData.attachmentUrl);
	$("#showPicUrl"+num).show();
}
function showAtts(jsonData) {
		var url = "";
		url += '<li id="'+jsonData.attachmentId+'" style="float:none;"><a href="'+jsonData.attachmentUrl+'" target="_blank" >'
				+ jsonData.remoteName
				+ '</a>&nbsp;<a href="javascript:;"  onclick="deleteAtt(\''+jsonData.attachmentId+'\',\''+jsonData.attachmentUrl+'\')">[删除]</a></li> ';
		$('#attList').append(url);
		
	}
//初始化附件
function initAttr(attIdList){
		$.ajax({
			url:'${ctx}/login/json/attachment/selectListByAttachmentIdList',
			type:'get',
			data:{'attachmentIdList':attIdList},
			dataType:'json',
			success:function(data){
				var value = JSON.parse(data).attachments;
				for(var i = 0;i<value.length;i++){
					var info = value[i];
					var url = "";
					url += '<li id="'+info.attachmentId+'" style="float: none;"><a href="'+info.attachmentUrl+'" target="_blank" >'
							+ info.remoteName
							+ '</a>&nbsp;<a href="javascript:;"  onclick="deleteAtt(\''+info.attachmentId+'\',\''+info.attachmentUrl+'\')">[删除]</a></li> ';
					$('#attList').append(url);
					
				}
			},
			error:function(){
				alert("访问后台异常!");
			}
		});
	}
function formSubmit(){
   	if($('#companyName').val()==''){
		 layer.msg("请填写企业名称！");
		 return;
	} 
	if($('#legalPerson').val()==''){
		 layer.msg("请填写法人代表！");
		 return;
	}
    
	if($('#establishDate').val()==''){
		 layer.msg("请选择注册时间！");
		 return;
	}
	if($('#registeredCapital').val()==''){
		 layer.msg("请填写注册资本！");
		 return;
	}
    if($('#previousTax').val()==''){
		 layer.msg("请填写上年度纳税额！");
		 return;
	}
	if($('#contactName').val()==''){
		 layer.msg("请填写联系人！");
		 return;
	}
	if($('#parkId').val()==''){
		 layer.msg("请填写所属园区！");
		 return;
	}
	
	
	if($('#operationAddress').val()==''){
		 layer.msg("请填写公司地址！");
		 return ;
	}
	if($('#operationScope').val()==''){
		 layer.msg("请填写经营范围！");
		 return false;
	}
	if($('#sysName').val()==''){
		 layer.msg("请填写系统名称！");
		 return false;
	} 
	var items = [];
	$("#hosts .host-content").each(function(){
		var item = {};
		var index = $(this).index();
		console.log(index)
		if($(this).find('.purpose').val()==''){
			return layer.msg('请填主机'+index+'的业务用途！');
		}
		if($(this).find('.port').val()==''){
			return layer.msg('请填主机'+index+'的端口号！');
		}
		if($(this).find('.remark').val()==''){
			return layer.msg('请填主机'+index+'的备注！');
		}
		item.purpose = $(this).find('.purpose').val();
		item.system = $(this).find('.system option:selected').text();
		var cpuAndMemory = $(this).find('.cpuAndMemory option:selected').val();
		var arr = cpuAndMemory.split('+');
		item.cpu = arr[0];
		item.memory = arr[1];
		item.hardDisk = $(this).find('.hardDisk option:selected').val();
		item.network = $(this).find('.network option:selected').val();
		item.port = $(this).find('.port').val();
		item.remark = $(this).find('.remark').val();
 		items.push(item);
	});
	$("#computerJson").val(JSON.stringify(items));
 	if($('#contactPhone').val()==''){
		 layer.msg("请输入手机号！");
		 return ;
	}
	if($('#verificationCode').val()==''){
		 layer.msg("请输入正确的6位数验证码！");
		 return ;
	}else{
		if($('#verificationCode').val().length!=6){
			 layer.msg("请输入正确的6位数验证码！");
			 return ;
		}
	}  
	if($('#businessImageAt').val()==''){
		 layer.msg("请上传营业执照！");
		 return ;
	}
	if($('#taxImageAt').val()==''){
		 layer.msg("请上传纳税证明！");
		 return ;
	}
	if($('#commitmentAt').val()==''){
		 layer.msg("请上传承诺书！");
		 return ;
	} 
	
	console.log($("#cloudForm").serialize());
    $.ajax({
			url:'${urlPath}XOffice/interface/json/companyCloudApply/save',
			type:'post',
			data:$("#cloudForm").serialize(),
			dataType:'json',
			success:function(data){
				console.log(data);
                if(data.errorCode==0){
                        layer.confirm('您的企业上云申请提交成功，请耐心等待审核。', {
                        btn: ['确定'], btn1:function(){
                        	 window.location.reload()
                        }, btn2: function () {
                            // preview(1,data.applyId);
                        },cancel: function(){ 
                        	 window.location.reload()
                        }
		            }); 
                }else{
                    layer.msg(data.errorMsg);
                }
                
			},
			error:function(){
                layer.msg('系统异常！');
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
function createProject() {
	location.href = "createProject.html";
}
function dateToTimeStr(str,fmatter){
	  return formatDate(new Date(str), fmatter);
	}
	// 格式化日期,
function formatDate(date, format) {
		var paddNum = function(num) {
			num += "";
			return num.replace(/^(\d)$/, "0$1");
		}
		// 指定格式字符
		var cfg = {
			yyyy : date.getFullYear(), // 年 : 4位
			yy : date.getFullYear().toString().substring(2),// 年 : 2位
			M : date.getMonth() + 1, // 月 : 如果1位的时候不补0
			MM : paddNum(date.getMonth() + 1), // 月 : 如果1位的时候补0
			d : date.getDate(), // 日 : 如果1位的时候不补0
			dd : paddNum(date.getDate()),// 日 : 如果1位的时候补0
			hh : paddNum(date.getHours()), // 时
			mm : paddNum(date.getMinutes()), // 分
			ss : paddNum(date.getSeconds())
		// 秒
		}
		format || (format = "yyyy-MM-dd hh:mm:ss");
		return format.replace(/([a-z])(\1)*/ig, function(m) {
			return cfg[m];
		});
	}
	//添加主机
	function addHost(){
			var _div='';
			++hostnum;
			
			_div+='<div class="host-content">'
			+'<div class="host-name">'
			+'<p>'
			+'<span>主机</span><span class="hostmark">'+hostnum+'</span>';
			if(hostnum>1){
				_div+='<a class="deleteBtn"><img src="${ctx}/static/image/homePage_yc/apply_03.png"></a>';
			}
			_div+='</p>'									
			+'</div>'							
			+'<div class="host-info">'			
			+'<div class="line">'
			+'<span>业务用途</span>'
			+'<input type="text" class="input-content purpose" style="width: 30.5%;" maxlength="128">'
			+'<span class="pl35">操作系统</span>'
			+'<select class="input-content system" style="width:37.5%; margin-left: 7px;">'
			+'<option value="centos">centos 各主流版本</option>'
			+'<option value="ubuntu">ubuntu 各主流版本</option>'
			+'<option value="WindowsServer2008">Windows Server 2008</option>'
			+'<option value="WindowsServer2012">Windows Server 2012</option>'
			+'<option value="WindowsServer2016">Windows Server 2016</option>'			
			+'</select>'
			+'</div>'
			+'<div class="line">'														
			+'<span style="letter-spacing: 7px;">云主机</span>'
			+'<select class="input-content cpuAndMemory" style="width: 30.5%;margin-left: -1px;">'
			+'<option value="1+4">1核+4GB</option>'
			+'<option value="2+4">2核+4GB</option>'
			+'<option value="2+6">2核+6GB</option>'
			+'<option value="2+8">2核+8GB</option>'
			+'<option value="4+4">4核+4GB</option>'
			+'<option value="4+8">4核+8GB</option>'
			+'<option value="4+16">4核+16GB</option>'
			+'<option value="4+32">4核+32GB</option>'
			+'<option value="8+8">8核+8GB</option>'
			+'<option value="8+16">8核+16GB</option>'
			+'<option value="8+32">8核+32GB</option>'
			+'<option value="8+64">8核+64GB</option>'
			+'<option value="12+16">12核+16GB</option>'
			+'<option value="16+16">16核+16GB</option>'
			+'<option value="16+32">16核+32GB</option>'
			+'<option value="16+64">16核+64GB</option>'
			+'<option value="16+128">16核+128GB</option>'
			+'<option value="28+64">28核+64GB</option>'
			+'<option value="32+32">32核+32GB</option>'
			+'<option value="32+64">32核+64GB</option>'
			+'<option value="32+128">32核+128GB</option>'
			+'</select>'
			+'<span style="padding-left: 35px;letter-spacing: 7px;">云硬盘</span>'
			+'<select class="input-content hardDisk" style="width: 37.5%;margin-left: -1px;">'
			+'<option value="0">系统盘40GB+数据盘100GB</option>'
			+'<option value="1">系统盘40GB+数据盘100GB+数据库盘500GB</option>'
			+'</select>'
			+'</div>'													
			+'<div class="line">'
			+'<span>网络需求</span>'
			+'<select class="input-content network" style="width: 31%;">'
			+'<option value="0">互联网接入</option>'
			+'<option value="1">专线接入</option>'
			+'</select>'										
			+'<span class="pl35">开放端口</span>'
			+'<input type="text" class="input-content port"   placeholder="多个端口之间用英文逗号隔开。" style="width: 37.5%;" maxlength="256">'
			+'</div>'
			+'<div class="line">'
			+'<span style="letter-spacing: 29px;">备注</span>'
			+'<input type="text" class="input-content remark" style="width: 86.7%;margin-left: -24px;" maxlength="256">'															
			+'</div>'
			+'</div>'
			+'<div class="clearfix"></div>'
			+'</div>';
			$("#hosts").append(_div);
	}
	//打印摸板
    function preview_new(flag){
        if(flag==1){
            $("#printIframe1")[0].contentWindow.print(); 
        }
    }
	//下载
    function download(flag){
        if(flag==1){
            window.open("https://www.jx968969.com/AttachmentPortal/interface/json/attachment/download?attachmentId=90020181226161031360002000004052",'_self')
        }
    }
	//跳转各模块
	function showpage(flag){
		if(flag==1){
			//点击立即申请，进入填写申请表单模块
			$("#application-form").removeClass("application-edit");
			$("#application-form").addClass("application-create");
			$("#application-form").siblings().hide();
			$("#application-form").show();
			$("#sumbitApply").show();
			$("#editApply").hide();
			$("#back1").show();
			$("#back2").hide();
			addHost();
		}else if(flag==2){
			//点击管理我的申请，进入搜索模块
			window.open('${ctx}/cloud/Edit?entranceId=3609009','_self')
			// $("#application-search").siblings().hide();
			// $("#application-search").show();
		}else if(flag==4){
			//返回申请选择
			$(".input-content").val('');
			$(".searchable-select-holder").val('');
			$(".imageAt").val('');
			$('.uploadImgContral').attr('src','${ctx}/static/image/activity/activityImage.png');
			$("#application-select").siblings().hide();
			$("#application-select").show();
		}
	}
	 /* 非空字符串 */
    function nvlStr(str){
    	if(str==null || str==undefined){
    		return "";
    	}
    	return str;
    }
</script>
</html>