package com.chinatelecom.jx.zone.management.controller.expShare;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.HtmlUtils;

import com.chinatelecom.jx.bean.EntryBean;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.bean.SeqIdType;
import com.chinatelecom.jx.zone.company.info.bean.CompanyInfoBean;
import com.chinatelecom.jx.zone.company.info.service.ICompanyInfoBeanService;
import com.chinatelecom.jx.zone.government.info.bean.GovernmentInfoBean;
import com.chinatelecom.jx.zone.government.info.service.IGovernmentInfoBeanService;
import com.chinatelecom.jx.zone.management.bean.expBrowse.ExpBrowseLogBean;
import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityCommentBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityTagBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.expBrowse.IExpBrowseLogService;
import com.chinatelecom.jx.zone.management.service.expShare.IExpShareInfoService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityCommentService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityTagService;
import com.chinatelecom.jx.zone.management.util.MyBeanUtils;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.organization.info.bean.OrganizationInfoBean;
import com.chinatelecom.jx.zone.organization.info.proxy.IOrganizationInfoBeanProxy;
import com.chinatelecom.jx.zone.park.info.bean.ParkInfoBean;
import com.chinatelecom.jx.zone.park.info.service.IParkInfoBeanService;
import com.chinatelecom.jx.zone.sm.helper.SubmitThirdSmHelper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
public class ExpShareInfoInterfaceController extends BaseController {
	
	@Autowired(required = true)@Qualifier("primaryKeySeq")
	protected SeqIdType primaryKeySeq;
	@Autowired
	private IExpShareInfoService expShareInfoService;
	@Autowired
	private IProjectActivityTagService tagService;
	@Autowired
	private IExpBrowseLogService expBrowseLogService;
	@Autowired
	private IProjectActivityCommentService projectActivityCommentService;
	@Autowired
	private IOrganizationInfoBeanProxy organizationInfoBeanProxy;
	@Autowired
	private IParkInfoBeanService parkInfoBeanService;
	@Autowired
	private ICompanyInfoBeanService companyInfoBeanService;
	@Autowired
	private IGovernmentInfoBeanService governmentInfoBeanService;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private SubmitThirdSmHelper submitThirdSmHelper;
	
	/*园区动态标签*/
	private static final Integer EXP_TAG_KIND = 202;
	private static final Logger logger = LoggerFactory.getLogger(ExpShareInfoInterfaceController.class);
	
	
	/**
	 * 动态列表、我的列表
	 * expTitle 标题
	 * expLabel 标签
	 * accountId 账号id
	 */
	@RequestMapping(value="/interface/json/expShareInfo/list")
	public String list(
			@RequestParam(value = "expTitle", required = false)String expTitle,
			@RequestParam(value = "expLabel", required = false)String expLabel,
			@RequestParam(value = "accountId", required = false)BigDecimal accountId,
			@RequestParam(value = "areaName", required = false)String areaName,
			@RequestParam(value = "provinceName", required = false)String provinceName,
			@ModelAttribute("page") Page<ExpShareInfoBean> page, 
			HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if (page.getPageSize() == 0) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数pageSize未设置！");
				return "jsonView";
			}
			
			if (page.getPageNum() == 0) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数pageNum未设置！");
				return "jsonView";
			}
			
			ExpShareInfoBean infoBean = new ExpShareInfoBean();
			if(StringUtil.checkNotNull(expTitle)){
				infoBean.setExpTitle(HtmlUtils.htmlUnescape(expTitle));
			}
			
			if(StringUtil.checkNotNull(expLabel)){
				infoBean.setExpLabel(expLabel);
			}
			
			if(accountId==null){
				infoBean.setStatus((short)1);
			}else{
				infoBean.setAccountId(accountId);
			}
			
			if(StringUtil.checkNotNull(areaName)){
				infoBean.setAreaName(HtmlUtils.htmlUnescape(areaName));
			}
			
			if(StringUtil.checkNotNull(provinceName)){
				infoBean.setProvinceName(HtmlUtils.htmlUnescape(provinceName));
			}
			
			infoBean.setOrderByClause("create_time desc");
			
			/*获取动态标签*/
			ProjectActivityTagBean tagBean = new ProjectActivityTagBean();
			tagBean.setStatus((short) 1);
			tagBean.setKind(EXP_TAG_KIND);
			tagBean.setOrderByClause("SORT_GRADE ASC");
			List<ProjectActivityTagBean> tagList = tagService.queryByCond(tagBean);
			
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ExpShareInfoBean>)expShareInfoService.queryByCond(infoBean);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取列表成功！");
			modelMap.addAttribute("tagList", tagList);
			modelMap.addAttribute("viewList", page.getResult());
			modelMap.addAttribute("total", page.getTotal());
			
		}catch (Exception e) {
			logger.error("【园区动态】list出现异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常！");
		}
		return "jsonView";
	}
	
	/**
	 * 详情
	 * expId 动态id 必传
	 * accountId 账号id
	 * accountName 账号名称
	 * ipAddress IP地址
	 */
	@RequestMapping(value="/interface/json/expShareInfo/view")
	public String view(
			@RequestParam(value = "expId", required = false)BigDecimal expId,
			@RequestParam(value = "accountId", required = false)BigDecimal accountId,
			@RequestParam(value = "accountName", required = false)String accountName,
			@RequestParam(value = "ipAddress", required = false)String ipAddress,
			HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if (expId == null) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数expId未设置！");
				return "jsonView";
			}
			
			ExpShareInfoBean infoBean = expShareInfoService.selectById(expId);
			/*增加浏览量总数*/
			Integer count = 0;
			if(StringUtil.checkNotNull(infoBean.getBrowseCount())){
				count = Integer.parseInt(infoBean.getBrowseCount())+1;
			}else{
				count ++ ;
			}
			infoBean.setBrowseCount(count.toString());
			Integer count2 = 0;
			if(StringUtil.checkNotNull(infoBean.getBrowseCountEdit())){
				count2 = Integer.parseInt(infoBean.getBrowseCountEdit())+1;
			}else{
				count2 ++ ;
			}
			infoBean.setBrowseCountEdit(count2.toString());
			expShareInfoService.updateById(infoBean);
			/*增加浏览日志*/
			ExpBrowseLogBean expBrowseLog = new ExpBrowseLogBean();
			expBrowseLog.setLogId(primaryKeySeq.getNextSeqIdToBigDecimal());
			expBrowseLog.setExpId(expId);
			if(accountId==null){
				expBrowseLog.setType((short) 0);
			}else{
				expBrowseLog.setType((short) 1);
				expBrowseLog.setBrowseId(accountId);
				expBrowseLog.setBrowseName(accountName);
			}
			expBrowseLog.setBrowseIp(ipAddress);
			expBrowseLog.setCreateTime(new Timestamp(System.currentTimeMillis()));
			expBrowseLogService.insert(expBrowseLog);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取列表成功！");
			modelMap.addAttribute("infoBean", infoBean);
			
		}catch (Exception e) {
			logger.error("【园区动态】view出现异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常！");
		}
		return "jsonView";
	}
	
	
	/**
	 * 删除
	 * expId 动态id
	 */
	@RequestMapping(value="/interface/json/expShareInfo/delete")
	public String delete(
			@RequestParam(value = "expId", required = false)BigDecimal expId,
			HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if (expId == null) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数expId未设置！");
				return "jsonView";
			}
			
			int rst = expShareInfoService.deleteById(expId);
			
			modelMap.addAttribute("success", rst > 0 ? true : false);
			modelMap.addAttribute("errorCode", rst > 0 ? 0 : 1);
			modelMap.addAttribute("errorMsg", rst > 0 ? "删除成功！" : "删除失败！");
			
		}catch (Exception e) {
			logger.error("【园区动态】delete出现异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常！");
		}
		return "jsonView";
	}
	
	
	/**
	 * 新增
	 * expId 动态id
	 * accountId 账号id
	 */
	@RequestMapping(value="/interface/json/expShareInfo/edit")
	public String edit(
			@RequestParam(value = "expId", required = false)BigDecimal expId,
			@RequestParam(value = "accountId", required = false)BigDecimal accountId,
			HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			/*标签*/
			ProjectActivityTagBean tagBean = new ProjectActivityTagBean();
			tagBean.setStatus((short) 1);
			tagBean.setKind(EXP_TAG_KIND);
			tagBean.setOrderByClause("SORT_GRADE ASC");
			List<ProjectActivityTagBean> tagList = tagService.queryByCond(tagBean);
			
			/*分享单位列表*/
			List<OrganizationInfoBean> orgList = organizationInfoBeanProxy
					.selectFirstGradeListByAccountIdAndRootIdAndSystemIdArrayAndOrganizationNameSearchKey(accountId, null, null, null);
			List<OrganizationInfoBean> newOrgList = new ArrayList<OrganizationInfoBean>();
			if(!orgList.isEmpty()){
				for(OrganizationInfoBean bean : orgList){
					OrganizationInfoBean organizationInfoBean = 
							organizationInfoBeanProxy.selectUnitByOrganizationId(bean.getOrganizationId());
					if(organizationInfoBean!=null&&organizationInfoBean.getOrganizationKind()!=null&&
							organizationInfoBean.getOrganizationKind()==2||
							organizationInfoBean.getOrganizationKind()==3||
							organizationInfoBean.getOrganizationKind()==1){					
						newOrgList.add(organizationInfoBean);
					}
				}
			}
			
			ExpShareInfoBean infoBean = new ExpShareInfoBean();
			if(expId!=null){
				infoBean = expShareInfoService.selectById(expId);
			}
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "加载编辑页面成功！");
			modelMap.addAttribute("tagList", tagList);
			modelMap.addAttribute("orgList", newOrgList);
			modelMap.addAttribute("infoBean", infoBean);
			
		}catch (Exception e) {
			logger.error("【园区动态】edit出现异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常！");
		}
		return "jsonView";
	}
	
	
	/**
	 * 预览
	 * @param infoBean
	 * @param response
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/interface/json/expShareInfo/preView")
	public String preView(
			@ModelAttribute(value = "infoBean") ExpShareInfoBean infoBean,
			HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			int rst = 0;
			if(infoBean.getExpId()==null){
				BigDecimal expId = primaryKeySeq.getNextSeqIdToBigDecimal();
				infoBean.setExpId(expId);
				infoBean.setBrowseCount("0");
				infoBean.setBrowseCountEdit("0");
				infoBean.setCommentCount("0");
				infoBean.setQrCode(createQrcode("experienceSharing/weixin/detail/"+expId,null));
				OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy
						.selectByPrimaryKey(infoBean.getUnitId());
				infoBean.setExpUnit(organizationInfoBean.getOrganizationName());

				if(organizationInfoBean.getOrganizationKind()==2){
					ParkInfoBean parkInfoBean = parkInfoBeanService
							.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
					infoBean.setProvinceName(parkInfoBean.getProvinceName());
					infoBean.setAreaName(parkInfoBean.getAreaName());
					infoBean.setUnitType((short)0);
				}else if(organizationInfoBean.getOrganizationKind()==3){
					CompanyInfoBean companyInfoBean = companyInfoBeanService
							.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
					infoBean.setProvinceName(companyInfoBean.getProvinceName());
					infoBean.setAreaName(companyInfoBean.getAreaName());
					infoBean.setUnitType((short)1);
				}else if(organizationInfoBean.getOrganizationKind()==1){
					GovernmentInfoBean governmentInfoBean = governmentInfoBeanService.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
					infoBean.setProvinceName(governmentInfoBean.getProvinceName());
					infoBean.setAreaName(governmentInfoBean.getAreaName());
					infoBean.setUnitType((short)2);
				}
				infoBean.setCreateTime(new Timestamp(System.currentTimeMillis()));
				infoBean.setStatus((short) 3);
				rst = expShareInfoService.insert(infoBean);
				modelMap.addAttribute("expId", expId);
			}else{
				ExpShareInfoBean record = expShareInfoService.selectById(infoBean.getExpId());
				if(infoBean.getUnitId()!=null){
					OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy
							.selectByPrimaryKey(infoBean.getUnitId());
					infoBean.setExpUnit(organizationInfoBean.getOrganizationName());

					if(organizationInfoBean.getOrganizationKind()==2){
						ParkInfoBean parkInfoBean = parkInfoBeanService
								.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
						infoBean.setProvinceName(parkInfoBean.getProvinceName());
						infoBean.setAreaName(parkInfoBean.getAreaName());
						infoBean.setUnitType((short)0);
					}else if(organizationInfoBean.getOrganizationKind()==3){
						CompanyInfoBean companyInfoBean = companyInfoBeanService
								.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
						infoBean.setProvinceName(companyInfoBean.getProvinceName());
						infoBean.setAreaName(companyInfoBean.getAreaName());
						infoBean.setUnitType((short)1);
					}else if(organizationInfoBean.getOrganizationKind()==1){
						GovernmentInfoBean governmentInfoBean = governmentInfoBeanService.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
						infoBean.setProvinceName(governmentInfoBean.getProvinceName());
						infoBean.setAreaName(governmentInfoBean.getAreaName());
						infoBean.setUnitType((short)2);
					}
				}
				infoBean.setStatus((short) 3);
				MyBeanUtils.copyProperties(infoBean, record);
				rst = expShareInfoService.updateById(record);
				modelMap.addAttribute("expId", infoBean.getExpId());
			}
			
			modelMap.addAttribute("success", rst > 0 ? true : false);
			modelMap.addAttribute("errorCode", rst > 0 ? 0 : 1);
			modelMap.addAttribute("errorMsg", rst > 0 ? "保存成功！" : "保存失败！");
			
		}catch (Exception e) {
			logger.error("【园区动态】preView出现异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常！");
		}
		return "jsonView";
	}
	
	/**
	 * 保存
	 * expTitle 动态标题
	 * unitId 单位id
	 * imageId 海报id
	 * expImage 海报url 
	 * expLabel 标签
	 * expText 内容
	 * accountId 账号id
	 * accountName 账号名称
	 * attachmentId 附件id
	 * expAttachment 附件url
	 * 
	 */
	@RequestMapping(value="/interface/json/expShareInfo/save")
	public String save(
			@ModelAttribute(value = "infoBean") ExpShareInfoBean infoBean,
			HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			int rst = 0;
			if(infoBean.getExpId()==null){
				BigDecimal expId = primaryKeySeq.getNextSeqIdToBigDecimal();
				infoBean.setExpId(expId);
				infoBean.setBrowseCount("0");
				infoBean.setBrowseCountEdit("0");
				infoBean.setCommentCount("0");
				infoBean.setQrCode(createQrcode("experienceSharing/weixin/detail/"+expId,null));
				OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy
						.selectByPrimaryKey(infoBean.getUnitId());
				infoBean.setExpUnit(organizationInfoBean.getOrganizationName());

				if(organizationInfoBean.getOrganizationKind()==2){
					ParkInfoBean parkInfoBean = parkInfoBeanService
							.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
					infoBean.setProvinceName(parkInfoBean.getProvinceName());
					infoBean.setAreaName(parkInfoBean.getAreaName());
					infoBean.setUnitType((short)0);
				}else if(organizationInfoBean.getOrganizationKind()==3){
					CompanyInfoBean companyInfoBean = companyInfoBeanService
							.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
					infoBean.setProvinceName(companyInfoBean.getProvinceName());
					infoBean.setAreaName(companyInfoBean.getAreaName());
					infoBean.setUnitType((short)1);
				}else if(organizationInfoBean.getOrganizationKind()==1){
					GovernmentInfoBean governmentInfoBean = governmentInfoBeanService.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
					infoBean.setProvinceName(governmentInfoBean.getProvinceName());
					infoBean.setAreaName(governmentInfoBean.getAreaName());
					infoBean.setUnitType((short)2);
				}
				infoBean.setCreateTime(new Timestamp(System.currentTimeMillis()));
				infoBean.setStatus((short) 2);
				rst = expShareInfoService.insert(infoBean);
			}else{
				ExpShareInfoBean record = expShareInfoService.selectById(infoBean.getExpId());
				if(infoBean.getUnitId()!=null){
					OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy
							.selectByPrimaryKey(infoBean.getUnitId());
					infoBean.setExpUnit(organizationInfoBean.getOrganizationName());

					if(organizationInfoBean.getOrganizationKind()==2){
						ParkInfoBean parkInfoBean = parkInfoBeanService
								.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
						infoBean.setProvinceName(parkInfoBean.getProvinceName());
						infoBean.setAreaName(parkInfoBean.getAreaName());
						infoBean.setUnitType((short)0);
					}else if(organizationInfoBean.getOrganizationKind()==3){
						CompanyInfoBean companyInfoBean = companyInfoBeanService
								.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
						infoBean.setProvinceName(companyInfoBean.getProvinceName());
						infoBean.setAreaName(companyInfoBean.getAreaName());
						infoBean.setUnitType((short)1);
					}else if(organizationInfoBean.getOrganizationKind()==1){
						GovernmentInfoBean governmentInfoBean = governmentInfoBeanService.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
						infoBean.setProvinceName(governmentInfoBean.getProvinceName());
						infoBean.setAreaName(governmentInfoBean.getAreaName());
						infoBean.setUnitType((short)2);
					}
				}
				infoBean.setStatus((short) 2);
				MyBeanUtils.copyProperties(infoBean, record);
				rst = expShareInfoService.updateById(record);
			}
			
			/*发送短信*/
			List<EntryBean<String, String>> list = new ArrayList<>();
			EntryBean<String, String> entryBean1 = new EntryBean<>();
			entryBean1.setKey("18070075115");
			entryBean1.setValue("江海");
			list.add(entryBean1);
			
			EntryBean<String, String> entryBean2 = new EntryBean<>();
			entryBean2.setKey("18679172311");
			entryBean2.setValue("徐桢");
			list.add(entryBean2);
			
			EntryBean<String, String> entryBean3 = new EntryBean<>();
			entryBean3.setKey("18070075530");
			entryBean3.setValue("赵丽霞");
			list.add(entryBean3);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String platformName = expShareInfoService.getPlatformName(new BigDecimal("3600009"));
			String smsContent = "["+platformName+"]您好，"+sdf.format(System.currentTimeMillis())+"，您有一个待审批园区动态，标题【"+infoBean.getExpTitle()+"】，请及时处理！ ";
			InvokeInfoBean<BigDecimal> msgRst =  submitThirdSmHelper.validateSubmitContactSimpleSmJob(new BigDecimal(3600009),
					new BigDecimal("201611281649570000002"), new BigDecimal(3600009), new BigDecimal(21), (short) 2, (short) 1, smsContent,
					new Timestamp(System.currentTimeMillis()), null, list, (short) 2, "127.0.0.1",
					(short) 1, new Timestamp(System.currentTimeMillis()));
			
			if(!msgRst.isSuccess()){
				modelMap.addAttribute("message", msgRst.getErrorMsg());
			}
			
			modelMap.addAttribute("success", rst > 0 ? true : false);
			modelMap.addAttribute("errorCode", rst > 0 ? 0 : 1);
			modelMap.addAttribute("errorMsg", rst > 0 ? "保存成功！" : "保存失败！");
		}catch (Exception e) {
			logger.error("【园区动态】save出现异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常！");
		}
		return "jsonView";
	}
	
	
	/**
	 * 获取评论列表
	 * expId 动态id
	 * accountId 账号id
	 */
	@RequestMapping(value="/interface/json/expShareInfo/commentList")
	public String commentList(
			@RequestParam(value = "expId", required = false)BigDecimal expId,
			@RequestParam(value = "accountId", required = false)BigDecimal accountId,
			@ModelAttribute("page") Page<ProjectActivityCommentBean> page, 
			HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if (expId == null) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数expId未设置！");
				return "jsonView";
			}
			
			if (page.getPageSize() == 0) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数pageSize未设置！");
				return "jsonView";
			}
			
			if (page.getPageNum() == 0) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数pageNum未设置！");
				return "jsonView";
			}
			
			ProjectActivityCommentBean commentBean = new ProjectActivityCommentBean();
			commentBean.setActivityId(expId);
			commentBean.setKind(EXP_TAG_KIND);
			commentBean.setOrderByClause("A.COMMENT_TIME DESC");
			
			if(accountId!=null){
				commentBean.setCommentAccount(accountId);
			}
			
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectActivityCommentBean>)projectActivityCommentService
					.queryByCommentAccount(commentBean);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取列表成功！");
			modelMap.addAttribute("commentList", page.getResult());
			modelMap.addAttribute("total", page.getTotal());
			
		}catch (Exception e) {
			logger.error("【园区动态】commentList出现异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常！");
		}
		return "jsonView";
	}
	
	
	/**
	 * 发布评论
	 * activityId 动态id
	 * commentAccount 回复人id
	 * commentContent 回复内容
	 * replyId 回复的评论id
	 * 
	 * 
	 */
	@RequestMapping(value="/interface/json/expShareInfo/commentSave")
	public String commentSave(
			@ModelAttribute(value = "commentBean") ProjectActivityCommentBean commentBean,
			HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if (commentBean.getActivityId() == null) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数activityId未设置！");
				return "jsonView";
			}
			
			if (commentBean.getCommentAccount() == null) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数commentAccount未设置！");
				return "jsonView";
			}
			
			if (commentBean.getCommentContent() == null) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数commentContent未设置！");
				return "jsonView";
			}
			
			commentBean.setCommentId(primaryKeySeq.getNextSeqIdToBigDecimal());
			if(StringUtil.checkNotNull(commentBean.getReplyId())){
				ProjectActivityCommentBean record = projectActivityCommentService
						.selectById(commentBean.getReplyId());
				commentBean.setReplyAccount(record.getCommentAccount());
				commentBean.setReplayUser(record.getCommentUser());
			}
			
			if(StringUtil.checkNotNull(commentBean.getCommentAccount())){
				AccountInfoBean accountInfoBean = accountInfoBeanProxy.selectByPrimaryKey(commentBean.getCommentAccount());
				String accountNick = null;
				if(StringUtil.checkNotNull(accountInfoBean.getAccountNick())){
					accountNick = accountInfoBean.getAccountNick();
				}else{
					accountNick = accountInfoBean.getAccountName();
				}
				commentBean.setCommentUser(accountNick);
			}
			
			commentBean.setSortGrade(100);
			commentBean.setCommentTime(new Timestamp(System.currentTimeMillis()));
			commentBean.setCreateTime(new Timestamp(System.currentTimeMillis()));
			commentBean.setKind(EXP_TAG_KIND);
			
			int rst = projectActivityCommentService.insert(commentBean);
			
			if(rst > 0 && commentBean.getKind()==202){
				ExpShareInfoBean record = expShareInfoService.selectById(commentBean.getActivityId());
				if(record!=null){
					record.setCommentCount((Integer.parseInt(record.getCommentCount())+1)+"");
					expShareInfoService.updateById(record);
				}
			}
			
			
			modelMap.addAttribute("success", rst > 0 ? true : false);
			modelMap.addAttribute("errorCode", rst > 0 ? 0 : 1);
			modelMap.addAttribute("errorMsg", rst > 0 ? "发表评论成功！" : "发表评论失败！");
			
		}catch (Exception e) {
			logger.error("【园区动态】commentSave出现异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常！");
		}
		return "jsonView";
	}
	
	/**
	 * 删除评论
	 * commentId 评论id
	 */
	@RequestMapping(value="/interface/json/expShareInfo/commentDelete")
	public String commentDelete(
			@RequestParam(value = "commentId", required = false)BigDecimal commentId,
			HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if (commentId == null) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数commentId未设置！");
				return "jsonView";
			}
			
			ProjectActivityCommentBean commentBean = projectActivityCommentService.selectById(commentId);
			
			int rst = projectActivityCommentService.deleteById(commentId);
			
			if(rst > 0 && commentBean.getKind()==(int)EXP_TAG_KIND){
				ExpShareInfoBean record = expShareInfoService.selectById(commentBean.getActivityId());
				if(record!=null&&record.getCommentCount()!=null){
					record.setCommentCount((Integer.parseInt(record.getCommentCount())-1)< 0 ? "0" : (Integer.parseInt(record.getCommentCount())-1)+"");
					expShareInfoService.updateById(record);
				}
			}
			
			modelMap.addAttribute("success", rst > 0 ? true : false);
			modelMap.addAttribute("errorCode", rst > 0 ? 0 : 1);
			modelMap.addAttribute("errorMsg", rst > 0 ? "删除成功！" : "删除失败！");
			
		}catch (Exception e) {
			logger.error("【园区动态】commentDelete出现异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常！");
		}
		return "jsonView";
	}
}
