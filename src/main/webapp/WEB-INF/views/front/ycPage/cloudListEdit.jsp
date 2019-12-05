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
											<div class="application-box application-search noprint" id="application-search" style="display: block;">
												<img src="${ctx}/static/image/homePage_yc/apply_01.png">
												<a class="btn-close" id="btn-close" href="javascript:;"><img src="${ctx}/static/image/homePage_yc/close_btn.png"></a>
                                                <div class="application-content">
                                                    <div class="tips-box">
                                                        <p>* 请输入您在申请上云时，给您发的通知短信中的申请号。</p>
													</div>
													<div class="release_input clearfix">
                                                        <span class="release_attr">申请号</span>
                                                        <input type="text" class="inputBox" id="apply_number" name="apply_number" style="width:50.5%;"/>
													</div>
													<div class="release_input clearfix">
                                                        <span class="release_attr">手机号</span>
                                                        <input type="text" class="inputBox" id="phonenumber" name="phonenumber" style="width:50.5%;"/>
                                                    </div>
                                                    <div>
                                                        <input type="button" value="确认" onclick="showpage(3)" class="blueBtnContral sureBtn" />
                                                        <div style="clear:both;"></div>
                                                    </div>
                                                </div>
											</div>
											<div class="application-form noprint" id="application-form" style="display: none;">
												<div>
													<input type="button" value="返回" class="blueBtnContral backBtn" id="back2">
													<div style="clear:both;"></div>
												</div>
												<h1>宜春市"企业上云"云资源服务申请表</h1>
												<div class="history-info">
													<a href="javasript:;" class="showBtn showAllHsitory" id="showAllHsitory">
															<img src="${ctx}/static/image/homePage_yc/apply_04.png">
													</a>
													<a href="javasript:;" class="showBtn hideAllHsitory" id="hideAllHsitory" style="display: none;">
															<img src="${ctx}/static/image/homePage_yc/apply_05.png">
													</a>
												</div>
												<div class="form-content">
													<form id="cloudForm">
														<input type="hidden" id="applyId" name="applyId" value="" />
														<input type="hidden" id="computerJson" name="computerJson" value="" />
														<input type="hidden" id="verificationCode" name="verificationCode" value="" />
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
																	<input id="establishDate" class="form-control layer-date input-content" name="establishDate" placeholder="请选择时间" readonly/>
																</td>
															</tr>
															<tr>
																<td class="td15"><p>注册资本</p><p>（万元）</p></td>
																<td class="td35" colspan="2">
																	<input type="text" class="input-content pt10" id="registeredCapital" name="registeredCapital" maxlength="18" precision="4">
																</td>
																<td class="td15" colspan="2"><p>上年度纳税额</p><p>（万元）</p></td>
																<td class="td35" colspan="2">
																	<input type="text" class="input-content" id="previousTax" name="previousTax" maxlength="18" precision="4">
																</td>
															</tr>
															<tr>
																<td class="td15"><span>联系人</span></td>
																<td class="td35" colspan="2">
																	<input type="text" class="input-content" id="contactName" name="contactName" maxlength="32">
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
																	<textarea type="text" class="input-content" id="operationScope" name="operationScope" maxlength="960" style="width:94%;min-height: 87px; resize:vertical;"/></textarea>
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
																<td class="td85" colspan="6">
																	<input type="text" class="input-content" id="contactPhone" name="contactPhone" style="border: none;" readonly/>
																</td>
																
															</tr>
															<tr id="application-state" class="application-state">
																<td class="td15"><span>申请时间</span></td>
																<td class="td35" colspan="2">
																	<input type="text" class="input-content" id="createTime" style="border: none;text-align: center;" readonly="readonly">
																</td>
																<td class="td15" colspan="2"><span>状态</span></td>
																<td class="td35" colspan="2">
																	<input type="text" class="input-content" id="status"  style="border: none;text-align: center;color:#ff0000;" readonly="readonly">
																</td>
															</tr>
														</table>
													</form>
													<div class="sumbitBtn">
														<input type="button" value="提交申请" onclick="" class="blueBtnContral greenBtnContral sumbitApply" id="sumbitApply" style="float: none;"> 	
														<input type="button" value="确认修改并提交" onclick="formSubmit()" class="blueBtnContral editApply" id="editApply" style="float: none;"> 
														<div style="clear:both;"></div>
													</div>
												</div>
											</div>
											<div class="application-form application-look" id="application-look" style="display: none;">
													<div class="noprint">
														<input type="button" value="返回" onclick="showpage(2)" class="blueBtnContral backBtn noprint">
														<div style="clear:both;"></div>
													</div>
													<h1>宜春市"企业上云"云资源服务申请表</h1>
													<div class="history-info noprint">
														<a href="javasript:;" class="showBtn showAllHsitory" id="showAllHsitory">
																<img src="${ctx}/static/image/homePage_yc/apply_04.png">
														</a>
														<a href="javasript:;" class="showBtn hideAllHsitory" id="hideAllHsitory" style="display: none;">
																<img src="${ctx}/static/image/homePage_yc/apply_05.png">
														</a>
													</div>
													<div class="form-content">
														<form id="cloudForm-look">
															<table>
																<tr>
																	<td class="td15"><span>企业名称</span></td>
																	<td class="td85" colspan="6">
																		<textarea type="text" class="input-content" id="companyName-look" name="companyName-look"  style="width:94%; resize:none;"readonly></textarea>
																	</td>
																</tr>
																<tr>
																	<td class="td15"><span>法人代表</span></td>
																	<td class="td35" colspan="2">
																		<textarea type="text" class="input-content" id="legalPerson-look" name="legalPerson-look" style="resize:none;"readonly></textarea>
																	</td>
																	<td class="td15" colspan="2"><span>注册时间</span></td>
																	<td class="td35" colspan="2">
																		<textarea id="establishDate-look" class="input-content" name="establishDate-look"style="text-align: center;resize:none;"readonly></textarea>
																	</td>
																</tr>
																<tr>
																	<td class="td15"><p>注册资本</p><p>（万元）</p></td>
																	<td class="td35" colspan="2">
																		<textarea type="text" class="input-content pt10" id="registeredCapital-look" name="registeredCapital-look" style="resize:none;"readonly></textarea>
																	</td>
																	<td class="td15" colspan="2"><p>上年度纳税额</p><p>（万元）</p></td>
																	<td class="td35" colspan="2">
																		<textarea type="text" class="input-content" id="previousTax-look" name="previousTax-look" style="resize:none;"readonly></textarea>
																	</td>
																</tr>
																<tr>
																	<td class="td15"><span>联系人</span></td>
																	<td class="td35" colspan="2">
																		<textarea type="text" class="input-content" id="contactName-look" name="contactName-look"style="resize:none;"readonly></textarea>
																	</td>
																	<td class="td15" colspan="2"><span>所属园区</span></td>
																	<td class="td35" colspan="2">
																		<textarea class="input-content" id="parkName-look" name="parkName-look" style="resize:none;"readonly></textarea>
																	</td>
																</tr>
																<tr>
																	<td class="td15"><span>公司地址</span></td>
																	<td class="td85" colspan="6">
																		<textarea type="text" class="input-content" id="operationAddress-look" name="operationAddress-look" style="width:94%; resize:none;"readonly></textarea>
																	</td>
																</tr>
																<tr>
																	<td class="td15"><span>经营范围</span></td>
																	<td class="td85" colspan="6">
																		<textarea type="text" class="input-content" id="operationScope-look" name="operationScope-look" style="width:94%;height: 87px; resize:none;"readonly></textarea>
																	</td>
																</tr>
																<tr>
																	<td class="td15"><span>系统名称</span></td>
																	<td class="td85" colspan="6">
																		<textarea type="text" class="input-content" id="sysName-look" name="sysName-look" style="width:94%; resize:none;"readonly></textarea>
																	</td>
																</tr>
																<tr>
																	<td class="td15"><span>云资源服务需求</span></td>
																	<td class="td85" colspan="6" id="hostList">
																	</td>
																</tr>
																<tr class="h136 noprint">
																	<td class="td15"><span>营业执照</span></td>
																	<td class="td35" colspan="2">
																		<a class="fancybox" id="fancybox4" href=""><img  src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl4" width="100px;" height="100px;" class="uploadImgContral"/></a>
																	</td>
																	<td class="td15" colspan="2"><span>纳税证明</span></td>
																	<td class="td35" colspan="2">
																		<a class="fancybox" id="fancybox5" href=""><img  src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl5" width="100px;" height="100px;" class="uploadImgContral"/></a>
																	</td>
																</tr>
																<tr class="h136 noprint">
																	<td class="td15"><span>企业承诺书</span></td>
																	<td class="td85" colspan="6">
																		<a class="fancybox" id="fancybox6" href=""><img  src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl6" width="100px;" height="100px;" class="uploadImgContral"/></a>
																	</td>
																</tr>
																<tr>
																	<td class="td15"><span>手机号</span></td>
																	<td class="td85" colspan="6">
																		<textarea type="text" class="input-content" id="contactPhone-look" name="contactPhone-look"  style="resize:none;" readonly></textarea>
																	</td>
																</tr>
																<tr id="application-state" class="application-state">
																	<td class="td15"><span>申请时间</span></td>
																	<td class="td35" colspan="2">
																		<textarea type="text" class="input-content" id="createTime-look" name="" value="" style="border: none;text-align: center;resize:none;" readonly></textarea>
																	</td>
																	<td class="td15" colspan="2"><span>状态</span></td>
																	<td class="td35" colspan="2">
																		<textarea type="text" class="input-content" id="status-look" value="" style="border: none;text-align: center;color:#0000FF;resize:none;" readonly></textarea>
																	</td>
																</tr>
															</table>
														</form>
														<div class="sumbitBtn noprint">
															<input type="button" value="打印" onclick="preview()" class="blueBtnContral" style="float: none;"> 	
															<div style="clear:both;"></div>
														</div>
													</div>
											</div>
                                        </div>	
									</div>
									<div style="page-break-after:always;"></div>
									<div class="printpics" style="page-break-after:always;">
										<h1>营业执照</h1>
										<img  src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl7" width="100%;" class=""/>
									</div>
									<div class="printpics" style="page-break-after:always;">
										<h1>纳税证明</h1>
										<img  src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl8" width="100%;" class=""/>
									</div>
										<div class="printpics" style="page-break-after:always;">
										<h1>企业申请承诺书</h1>
										<img  src="${ctx}/static/image/activity/activityImage.png" id="showPicUrl9" width="100%;" class=""/>
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
<script type="text/javascript" src="${ctx}/static/plugins/select2/js/select2.full.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/select2/js/zh-CN.js"></script>
<script type="text/javascript" src="${ctx}/static/js/utils/XUtils.js"></script>
<script type="text/javascript">
var isAdopt = true;
var hostnum=1;//初始主机数量为1
var companyName = "";
var companyId = "";
var parkId = "";
var parkName = "";
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
	laydate(create);
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
  /*   $(".publish-btn h1").text('企业上云申请');
    $(".publish-btn").removeAttr("onclick"); */
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
	$("#btn-close").on("click",function(){
		window.open('${ctx}/cloud/list?entranceId=3609009','_self')
	});
	$(".history-info").on("click",".showAllHsitory",function(){
		$(".history-info").css("height","100%");
		$(".showAllHsitory").hide();
		$(".hideAllHsitory").show();
	});
	$(".history-info").on("click",".hideAllHsitory",function(){
		$(".history-info").css("height","40px");
		$(".showAllHsitory").show();
		$(".hideAllHsitory").hide();
	});
	$("#hosts").on("click","#addHost",function(event){
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
	$("#back2").on('click',function(){
		showpage(2);
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
		setTimeout(function(){ 
			initCompanyList();
			initParkList();
		}, 1000);
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
								$("#parkName").val(pName);
							}
						}
					},
					error : function(){}
				});
			}
		});
	$('#companyId').valueSelete2({
		text : companyName,
		id : companyId
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
		text : parkName,
		id : parkId
	});
	
}


function showPic(jsonData,num) {
	if(jsonData.attachmentUrl){
		$("#showPicUrl"+num).attr('src', jsonData.attachmentUrl);
		$("#fancybox"+num).attr('href', jsonData.attachmentUrl);
	}else{
		$("#showPicUrl"+num).attr('src', jsonData);
		$("#fancybox"+num).attr('href', jsonData);
	}
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
	//打印
	function preview(){
		jQuery.browser={};
		(function(){
			jQuery.browser.msie=false; 
			jQuery.browser.version=0;
			if(navigator.userAgent.match(/MSIE ([0-9]+)./)){ 
				jQuery.browser.msie=true;
				jQuery.browser.version=RegExp.$1;
			}
		})();
		$('#set0').jqprint({ importCSS: true});
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
		if(flag==2){
			//点击管理我的申请，进入搜索模块
			$(".input-content").val('');
			$(".searchable-select-holder").val('');
			$(".imageAt").val('');
			$('.uploadImgContral').attr('src','${ctx}/static/image/activity/activityImage.png');
			$("#application-search").siblings().hide();
			$("#application-search").show();
		}else if(flag==3){
			//点击确认，进入编辑申请单模块
			   $.ajax({
					url:'${urlPath}XOffice/interface/json/companyCloudApply/detail',
					type:'post',
					data:{
						"contactPhone": $('#phonenumber').val(),
						"code": $('#apply_number').val()	
					},
					dataType:'json',
					success:function(data){
					      console.log(data)
 					      if(data.success){
 				    	  var detail = data.value;                        
					    		if(detail.status==2){
									isAdopt=true;
									$("#application-form").removeClass("application-create");
									$("#application-form").addClass("application-edit");
									$("#application-form").siblings().hide();
									$("#application-form").show();
									$("#sumbitApply").hide();
									$("#editApply").show();
									$("#back2").show();
									$("#back1").hide();
								}else{
									isAdopt=false;
									$("#application-look").siblings().hide();
									$("#application-look").show();
								}
					    		getCloudDetai(detail.applyId);
								//90020181228154551800030000000004 90020181228103048800030000000001 90020181227093943808030000000001 
								if(isAdopt){
									setTimeout(function(){ 
										initCompanyList();
										initParkList();
									}, 1000);
								}
					    		
					      }else{
					    	  layer.msg(data.errorMsg);
					      } 
					},
					error:function(){
		                layer.msg('系统异常！');
					}
				});
		}else if(flag==4){
			//返回申请选择
			window.open('${ctx}/cloud/list?entranceId=3609009','_self')
		}
	}
	function getCloudDetai(id){
		   $.ajax({
				url:'${urlPath}XOffice/interface/json/companyCloudApply/detail',
				type:'post',
				data:{
					"applyId": id,
				},
				dataType:'json',
				success:function(data){
					console.log(data);
	                if(data.errorCode==0){
	                	var detail = data.value;
	                	companyId  = detail.companyId;
	                	companyName  = detail.companyName;
	                	parkId  = detail.parkId;
	                	parkName  = detail.parkName;
	                	if(isAdopt){
	                		$('#applyId').val(detail.applyId)
	                	  	$('#companyId').val(detail.companyId?detail.companyId:'');
		                	$('#companyName').val(detail.companyName?detail.companyName:'');
		                	$('#legalPerson').val(detail.legalPerson?detail.legalPerson:'');
		                	$('#establishDate').val(detail.establishDate?formatCSTDate(detail.establishDate,'yyyy-MM-dd'):'');
		                	$('#contactName').val(detail.contactName?detail.contactName:'');
		                	$('#operationAddress').val(detail.operationAddress?detail.operationAddress:'');
		                	$('#operationScope').val(detail.operationScope?detail.operationScope:'');
		                	$('#registeredCapital').val(detail.registeredCapital?detail.registeredCapital:'');
		                	$('#previousTax').val(detail.previousTax?detail.previousTax:'');
		                	$('#sysName').val(detail.sysName?detail.sysName:'');
		                	$('#contactPhone').val(detail.contactPhone?detail.contactPhone:'');
		                	$('#verificationCode').val(detail.verificationCode?detail.verificationCode:'');
		                	$('#parkSelect option:selected').val(detail.parkName?detail.parkName:'');
		                	$('#parkName').val(detail.parkName?detail.parkName:'');
		                	$('#parkId').val(detail.parkId?detail.parkId:'');
		                	$('#createTime').val(detail.createTime?formatCSTDate(detail.createTime,'yyyy-MM-dd hh:mm'):'');
							$('#verificationCode').val(detail.verificationCode);
							var status=detail.status;
							if(detail.status==2){
								//1待初审 2初审未通过 3待复审 4复审未通过 5审核通过
								isAdopt=true;
								status='初审未通过';
							}
							$('#status').val(status);

		                	//审核记录拼接
		                	if(detail.recordList.length>0){
								$('.history-info').html('');
		                		var div = "";
								div +='<a href="javasript:;" class="showBtn showAllHsitory" id="showAllHsitory">'
								div +='<img src="${ctx}/static/image/homePage_yc/apply_04.png"></a>'
								div +='	<a href="javasript:;" class="showBtn hideAllHsitory" id="hideAllHsitory" style="display: none;">'
								div +='<img src="${ctx}/static/image/homePage_yc/apply_05.png"></a>'
										
		                		for (var i=detail.recordList.length-1;i>=0;i--){
			                		var info = detail.recordList[i];
									if(info.status==1){
										div += '<div class="history-box">'+'<p style="color:#019900;"><span>'+formatCSTDate(info.createTime,'yyyy-MM-dd hh:mm')+'</span>'
									}else{
										div += '<div class="history-box">'+'<p><span>'+formatCSTDate(info.createTime,'yyyy-MM-dd hh:mm')+'</span>'
									}
									div +=	'<span>'+(info.rootId=="3609009"?'复审':'初审')+(info.status==1?'通过':'未通过')+'</span>'
									div +='<span>'+info.rootName+' ( '+info.accountName+'  '+info.contactPhone+')</span></p>'
									div +=  '<p style="color:#333"><span style="margin-left: 18.5%; margin-right: 10px;">审核意见:</span><span>'+info.content+'</span></p></div>'
			                	}
			                	$('.history-info').append(div);
		                	}else{
		                		$('.history-info a').hide();
		                	}
		                	//主机拼接
		                	 var _div = "";
							 $('#hosts').html('');
							 _div+='<div>'
							 +'<input type="button" value="添加主机" id="addHost" class="blueBtnContral addBtn fwn">'
							 +'<div style="clear:both;"></div></div>'
							hostnum=detail.computerList.length;
		                	for (var i=0;i<detail.computerList.length;i++){
		                		var info = detail.computerList[i];
		                		var index = i+1;
		                		_div += '<div class="host-content">'
								if(index!=1){
									_div +=	'<div class="host-name"><p><span>主机</span><span class="hostmark">'+index+'</span><a class="deleteBtn"><img src="${ctx}/static/image/homePage_yc/apply_03.png"></a></p></div>'
								}else{
									_div +=	'<div class="host-name"><p><span>主机</span><span class="hostmark">'+index+'</span></p></div>'
								
								}
		                		_div +=	'<div class="host-info">'
		                		_div +=	 '<div class="line">'
		                		_div +=	 '<span>业务用途</span>'
		                		_div +=	 '<input type="text" class="input-content purpose" value="'+info.purpose+'"  style="width: 30.5%;" maxlength="128">'
		                		_div +=	'<span class="pl35">操作系统</span>'
		                		_div +=	'<select class="input-content system" style="width:37.5%; margin-left: 7px;">'
		                		_div +=	'<option  '+(info.system=="centos 各主流版本"?'selected':'')+'>centos 各主流版本</option>'
		                		_div +=	 '<option  '+(info.system=="ubuntu 各主流版本"?'selected':'')+'>ubuntu 各主流版本</option>'
		                		_div +=	 '<option  '+(info.system=="Windows Server 2008"?'selected':'')+'>Windows Server 2008</option>'
		                		_div +=	 '<option  '+(info.system=="Windows Server 2012"?'selected':'')+'>Windows Server 2012</option>'
		                		_div +	 '<option  '+(info.system=="Windows Server 20162"?'selected':'')+'>Windows Server 2016</option>'
		                		_div +=	'</select></div>'
		                		_div +=	 '<div class="line">'
		                		_div +=	'<span style="letter-spacing: 7px;">云主机</span>'
		                		var cpuAndMemory = info.cpu+"+"+info.memory;
		                		_div +=	 '<select class="input-content cpuAndMemory" style="width: 30.5%;margin-left: -1px;">'
		                		_div +=	'<option value="1+4"  '+(cpuAndMemory=="1+4"?'selected':'')+'>1核+4GB</option>'
	                			_div +=	'<option value="2+4" '+(cpuAndMemory=="2+4"?'selected':'')+'>2核+4GB</option>'
	                			_div +=	'<option value="2+6" '+(cpuAndMemory=="2+6"?'selected':'')+'>2核+6GB</option>'
	                			_div +=	'<option value="2+8" '+(cpuAndMemory=="2+8"?'selected':'')+'>2核+8GB</option>'
								_div +=	'<option value="4+4" '+(cpuAndMemory=="4+4"?'selected':'')+'>4核+4GB</option>'
								_div +=	'<option value="4+8" '+(cpuAndMemory=="4+8"?'selected':'')+'>4核+8GB</option>'
								_div +=	'<option value="4+16" '+(cpuAndMemory=="4+16"?'selected':'')+'>4核+16GB</option>'
								_div +=	 '<option value="4+32" '+(cpuAndMemory=="4+32"?'selected':'')+'>4核+32GB</option>'
								_div +=	 '<option value="8+8" '+(cpuAndMemory=="8+8"?'selected':'')+'>8核+8GB</option>'
								_div +=	 '<option value="8+16" '+(cpuAndMemory=="8+16"?'selected':'')+'>8核+16GB</option>'
								_div +=	 '<option value="8+32" '+(cpuAndMemory=="8+32"?'selected':'')+'>8核+32GB</option>'
								_div +=	 '<option value="8+64" '+(cpuAndMemory=="8+64"?'selected':'')+'>8核+64GB</option>'
								_div +=	 '<option value="12+16" '+(cpuAndMemory=="12+16"?'selected':'')+'>12核+16GB</option>'
							    _div +=	'<option value="16+16" '+(cpuAndMemory=="16+16"?'selected':'')+'>16核+16GB</option>'
							    _div +=	 '<option value="16+32" '+(cpuAndMemory=="16+32"?'selected':'')+'>16核+32GB</option>'
							    _div +=	 '<option value="16+64" '+(cpuAndMemory=="16+64"?'selected':'')+'>16核+64GB</option>'
							    _div +=	 '<option value="16+128" '+(cpuAndMemory=="16+128"?'selected':'')+'>16核+128GB</option>'
							    _div +=	'<option value="28+64" '+(cpuAndMemory=="28+64"?'selected':'')+'>28核+64GB</option>'
							    _div +=	'<option value="32+32" '+(cpuAndMemory=="32+32"?'selected':'')+'>32核+32GB</option>'
							    _div +=	 '<option value="32+64" '+(cpuAndMemory=="32+64"?'selected':'')+'>32核+64GB</option>'
							    _div +=	 '<option value="32+128" '+(cpuAndMemory=="32+128"?'selected':'')+'>32核+128GB</option>'
							    _div +=	 '</select>'
							    _div +=	'<span style="padding-left: 35px;letter-spacing: 7px;">云硬盘</span>'
							    _div +=	 '<select class="input-content hardDisk"  style="width: 37.5%;margin-left: -1px;">'
							    _div +=	 '<option value="0" '+(info.hardDisk=="0"?'selected':'')+'>系统盘40G+数据盘100G</option>'
							    _div +=	'<option value="1" '+(info.hardDisk=="1"?'selected':'')+'>系统盘40GB+数据盘100GB+数据库盘500GB</option>'
							    _div +=	 '</select></div><div class="line"><span>网络需求</span>'
							    _div +=	  '<select class="input-content network" style="width: 31%;">'
							    _div +=	  '<option value="0" '+(info.network=="0"?'selected':'')+'>互联网接入</option>'
							    _div +=	'<option value="1" '+(info.network=="1"?'selected':'')+'>专线接入</option>'
							    _div +=	'</select><span class="pl35">开放端口</span>'
							    _div +=	 '<input type="text" class="input-content port"  placeholder="多个端口之间用英文逗号隔开。" value="'+info.port+'" style="width: 37.5%;" maxlength="256">'
							    _div +=	 '</div>'
							    _div +=	'<div class="line">'
							    _div +=	'<span style="letter-spacing: 29px;">备注</span>'
							    _div +=	 '<input type="text" class="input-content remark" value="'+info.remark+'" style="width: 86.7%;margin-left: -24px;" maxlength="256">'
							    _div +=	'</div></div><div class="clearfix"></div></div>'
		                	}
		                	$('#hosts').append(_div);
							//三个附件
		                	$('#businessImageAt').val(detail.businessImageAt?detail.businessImageAt:'');
		                	$('#businessImageUrl').val(detail.businessImageUrl?detail.businessImageUrl:'');
		                	$('#commitmentAt').val(detail.commitmentAt?detail.commitmentAt:'');
		                	$('#commitmentUrl').val(detail.commitmentUrl?detail.commitmentUrl:'');
		                	$('#taxImageAt').val(detail.taxImageAt?detail.taxImageAt:'');
		                	$('#taxImageUrl').val(detail.taxImageUrl?detail.taxImageUrl:'');
		                	showPic(detail.businessImageUrl,1);
		                	showPic(detail.taxImageUrl,2);
		                	showPic(detail.commitmentUrl,3);
		                	
	                	}else{
							//查看
							$('#companyName-look').val(detail.companyName?detail.companyName:'');
		                	$('#legalPerson-look').val(detail.legalPerson?detail.legalPerson:'');
		                	$('#establishDate-look').val(detail.establishDate?formatCSTDate(detail.establishDate,'yyyy-MM-dd'):'');
		                	$('#contactName-look').val(detail.contactName?detail.contactName:'');
		                	$('#operationAddress-look').val(detail.operationAddress?detail.operationAddress:'');
		                	$('#operationScope-look').val(detail.operationScope?detail.operationScope:'');
		                	$('#registeredCapital-look').val(detail.registeredCapital?detail.registeredCapital:'');
		                	$('#previousTax-look').val(detail.previousTax?detail.previousTax:'');
		                	$('#sysName-look').val(detail.sysName?detail.sysName:'');
		                	$('#contactPhone-look').val(detail.contactPhone?detail.contactPhone:'');
		                	$('#parkName-look').val(detail.parkName?detail.parkName:'');
		                	$('#createTime-look').val(detail.createTime?formatCSTDate(detail.createTime,'yyyy-MM-dd hh:mm'):'');

		                	$('#companyName-look').text(detail.companyName?detail.companyName:'');
		                	$('#legalPerson-look').text(detail.legalPerson?detail.legalPerson:'');
		                	$('#establishDate-look').text(detail.establishDate?formatCSTDate(detail.establishDate,'yyyy-MM-dd'):'');
		                	$('#contactName-look').text(detail.contactName?detail.contactName:'');
		                	$('#operationAddress-look').text(detail.operationAddress?detail.operationAddress:'');
		                	$('#operationScope-look').text(detail.operationScope?detail.operationScope:'');
		                	$('#registeredCapital-look').text(detail.registeredCapital?detail.registeredCapital:'');
		                	$('#previousTax-look').text(detail.previousTax?detail.previousTax:'');
		                	$('#sysName-look').text(detail.sysName?detail.sysName:'');
		                	$('#contactPhone-look').text(detail.contactPhone?detail.contactPhone:'');
		                	$('#parkName-look').text(detail.parkName?detail.parkName:'');
		                	$('#createTime-look').text(detail.createTime?formatCSTDate(detail.createTime,'yyyy-MM-dd hh:mm'):'');

							var status=detail.status;
							if(detail.status==1){
								status='待初审';
							}else if(detail.status==3){
								status='待复审';
							}else if(detail.status==4){
								status='复审未通过';
							}else if(detail.status==5){
								status='审核通过';
							}
							$('#status-look').text(status);
							$('#status-look').val(status);
							//审核记录拼接
		                	if(detail.recordList.length>0){
								// console.log(detail.recordList.length);
								$('.history-info').html('');
		                		var div = "";
								div +='<a href="javasript:;" class="showBtn showAllHsitory" id="showAllHsitory">'
								div +='<img src="${ctx}/static/image/homePage_yc/apply_04.png"></a>'
								div +='	<a href="javasript:;" class="showBtn hideAllHsitory" id="hideAllHsitory" style="display: none;">'
								div +='<img src="${ctx}/static/image/homePage_yc/apply_05.png"></a>'
								if(detail.recordList.length==1){
									$('.history-info a').hide();
								}
		                		for (var i=detail.recordList.length-1;i>=0;i--){
			                		var info = detail.recordList[i];
									if(info.status==1){
										div += '<div class="history-box">'+'<p style="color:#019900;"><span>'+formatCSTDate(info.createTime,'yyyy-MM-dd hh:mm')+'</span>'
									}else{
										div += '<div class="history-box">'+'<p><span>'+formatCSTDate(info.createTime,'yyyy-MM-dd hh:mm')+'</span>'
									}
									div +=	'<span>'+(info.rootId=="3609009"?'复审':'初审')+(info.status==1?'通过':'未通过')+'</span>'
									div +='<span>'+info.rootName+' ( '+info.accountName+'  '+info.contactPhone+')</span></p>'
									div +=  '<p style="color:#333"><span style="margin-left: 18.5%; margin-right: 10px;">审核意见:</span><span>'+info.content+'</span></p></div>'
			                	}
			                	$('.history-info').append(div);
		                	}else{
								$('.history-info').html('');
								var div = "";
			                		div += '<p style="text-align:center;"><span style="margin-right:0;">暂无审核记录</span></p>'
		                		$('.history-info').append(div);
								$('.history-info a').hide();
		                	}
							//主机拼接
							var _div = "";
							$('#hostList').html('');
		                	for (var i=0;i<detail.computerList.length;i++){
		                		var info = detail.computerList[i];
		                		var index = i+1;
		                		_div += '<div class="host-content">'
		                		_div +=	'<div class="host-name"><p><span>主机</span><span class="hostmark">'+index+'</span></p></div>'
		                		_div +=	'<div class="host-info">'
		                		_div +=	 '<div class="line">'
		                		_div +=	 '<span>业务用途:</span>'
		                		_div +=	 '<input type="text" class="input-content purpose" value="'+info.purpose+'"  style="width: 22.5%;;" readonly>'
		                		_div +=	'<span style="padding-left: 9px;">操作系统:</span>'
		                		_div +=	'<input type="text" class="input-content system" style="width: 48%;" value="'+info.system+'" readonly>'
		                		_div +=	 '</div><div class="line">'
		                		_div +=	'<span>云主机:</span>'
		                		var cpuAndMemory = info.cpu+'核+'+info.memory+'GB';
		                		_div +=	 '<input  type="text" class="input-content cpuAndMemory" style="width:20%;" value="'+cpuAndMemory+'" readonly>'
		                		_div +=	'<span class="pl35">云硬盘:</span>'
								if(info.hardDisk==0){
									var hardDisk='系统盘40GB+数据盘100GB'
								}else {
									var hardDisk='系统盘40GB+数据盘100GB+数据库盘500GB'
								}
							    _div +=	 '<input type="text" class="input-content hardDisk"  style="width: 51%;"value="'+hardDisk+'" readonly>'
							    _div +=	 '</div><div class="line"><span>网络需求:</span>'
								if(info.network==0){
									var network='互联网接入'
								}else {
									var network='专线接入'
								}
							    _div +=	 '<input class="input-content network" style="width: 18%;"value="'+network+'" readonly>'
							    _div +=	'<span class="pl35">开放端口:</span>'
							    _div +=	 '<input type="text" class="input-content port" value="'+info.port+'" style="width: 48.5%;" readonly>'
							    _div +=	 '</div>'
							    _div +=	'<div class="line">'
							    _div +=	'<span>备注:</span>'
							    _div +=	 '<input type="text" class="input-content remark" value="'+info.remark+'" style="width: 89.5%;" readonly>'
							    _div +=	'</div></div><div class="clearfix"></div></div>'
		                	}
		                	$('#hostList').append(_div);
							//附件查看
							showPic(detail.businessImageUrl,4);
		                	showPic(detail.taxImageUrl,5);
		                	showPic(detail.commitmentUrl,6);
							showPic(detail.businessImageUrl,7);
		                	showPic(detail.taxImageUrl,8);
		                	showPic(detail.commitmentUrl,9);
						}
	                }else{
	                    layer.msg(data.errorMsg);
	                }
	                
				},
				error:function(){
	                layer.msg('系统异常！');
				}
			});
	}
	// 格式化CST日期的字串
	function formatCSTDate(strDate, format) {
		return formatDate(new Date(strDate), format);
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
	 /* 非空字符串 */
    function nvlStr(str){
    	if(str==null || str==undefined){
    		return "";
    	}
    	return str;
    }
</script>
</html>