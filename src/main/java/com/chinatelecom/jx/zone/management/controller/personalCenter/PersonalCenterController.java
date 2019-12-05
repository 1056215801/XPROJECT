package com.chinatelecom.jx.zone.management.controller.personalCenter;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.HtmlUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.account.bind.bean.AccountBindBean;
import com.chinatelecom.jx.zone.account.bind.proxy.IAccountBindBeanProxy;
import com.chinatelecom.jx.zone.account.bind.service.IAccountBindBeanService;
import com.chinatelecom.jx.zone.account.image.bean.AccountImageBean;
import com.chinatelecom.jx.zone.account.image.service.IAccountImageBeanService;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.account.login.log.bean.AccountLoginLogBean;
import com.chinatelecom.jx.zone.account.login.log.bean.AccountLoginLogBeanExample;
import com.chinatelecom.jx.zone.account.login.log.bean.AccountLoginLogBeanExample.Criteria;
import com.chinatelecom.jx.zone.account.login.log.service.IAccountLoginLogBeanService;
import com.chinatelecom.jx.zone.account.msg.bean.AccountMsgBean;
import com.chinatelecom.jx.zone.account.msg.service.IAccountMsgBeanService;
import com.chinatelecom.jx.zone.account.passwd.service.IUpdateAccountPasswdService;
import com.chinatelecom.jx.zone.account.weixin.bean.AccountWeixinBean;
import com.chinatelecom.jx.zone.account.weixin.proxy.IAccountWeixinBeanProxy;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.captcha.helper.SignatureShortMessageCaptchaCacheHelper;
import com.chinatelecom.jx.zone.company.info.bean.CompanyInfoBean;
import com.chinatelecom.jx.zone.company.info.service.ICompanyInfoBeanService;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.investigationInfo.InvestigationInfoMainBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareUpgradeBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.investigationInfo.IInvestigationInfoMainService;
import com.chinatelecom.jx.zone.management.service.personalCenter.IPersonalCenterService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityInfoService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareInfoService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareUpgradeService;
import com.chinatelecom.jx.zone.organization.info.bean.OrganizationInfoBean;
import com.chinatelecom.jx.zone.organization.info.proxy.IOrganizationInfoBeanProxy;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jfinal.kit.StrKit;

@Controller
public class PersonalCenterController extends BaseController {
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private IAccountImageBeanService accountImageBeanService;
	@Autowired
	private IUpdateAccountPasswdService updateAccountPasswdService;
	@Autowired
	private IAccountBindBeanProxy accountBindBeanProxy;
	@Autowired
	private IAccountBindBeanService accountBindBeanService;
	@Autowired
	private IAccountLoginLogBeanService accountLoginLogBeanService;
	@Autowired
	private IAccountWeixinBeanProxy accountWeixinBeanProxy;
	@Autowired
	private SignatureShortMessageCaptchaCacheHelper signatureShortMessageCaptchaCacheHelper;
	@Autowired
	private IProjectDeclareInfoService projectDeclareInfoService;
	@Autowired
	private IAccountMsgBeanService accountMsgBeanService;
	@Autowired
	private IProjectActivityInfoService projectActivityInfoService;
	@Autowired
	private IInvestigationInfoMainService iInvestigationInfoMainService;
	@Autowired
	private IPersonalCenterService personalCenterService;
	@Autowired
	private IProjectDeclareUpgradeService projectDeclareUpgradeService;
	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper;
	@Autowired
	private IOrganizationInfoBeanProxy organizationInfoBeanProxy;
	@Autowired
	private ICompanyInfoBeanService companyInfoBeanService;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	// 企业编辑
	/**
	 * 
	 * @param url 1：园区动态 2：怀才当遇  3：产业对接 4：要素共享
	 */
	@RequestMapping(value = "/personalCenter/companyEdit")
	public String companyEdit(
			@RequestParam(value = "url", required = false)String url,
			@RequestParam(value = "companyId", required = false)BigDecimal companyId,
			Model model, HttpServletRequest request) {
		try {
			BigDecimal accountId = getCurrentAccountId();
			if (accountId == null) {
				// 获取不到用户ID，一律跳登录页
				return "/session/page/login/index";
			} else {
				// 获取默认企业
				CompanyInfoBean info = personalCenterService.selectDefaultCompanyForVisitor(accountId);
				// 获取常用企业列表
				List<JSONObject> companyList = personalCenterService.selectCompanyListByAccountId(accountId);

				model.addAttribute("companyInfoBean", companyInfoBeanService.selectByPrimaryKey(companyId));
				model.addAttribute("info", info);
				model.addAttribute("compList", companyList);
				model.addAttribute("compTotal", companyList.size());
				model.addAttribute("isVisitor", personalCenterService.isVisitor());
				model.addAttribute("parkList", personalCenterService.parkList());
				model.addAttribute("url", url);
				model.addAttribute("curAccountId", getCurrentAccountId());
				if (isMobileDevice(request)) {
					return "/weixinPage/personalCenter/companyEdit";
				} else {
					return "/front/personalCenter/companyEdit";
				}

			}
		} catch (Exception ex) {
			logger.error("获取企业详细信息失败，详细原因；" + ex.getMessage(), ex);
			return "redirect:/error/404";
		}

	}

	// 企业详细
	@RequestMapping(value = "/personalCenter/companyDetail")
	public String companyDetail(@RequestParam(value = "companyId") BigDecimal companyId, Model model,
			HttpServletRequest request) {
		try {
			CompanyInfoBean companyInfoBean = companyInfoBeanService.selectByPrimaryKey(companyId);
			model.addAttribute("companyInfoBean", companyInfoBean);
		} catch (Exception ex) {
			logger.error("获取企业详细信息失败，详细原因；" + ex.getMessage(), ex);
			return "redirect:/error/404";
		}
		if (isMobileDevice(request)) {
			return "/weixinPage/personalCenter/companyDetails";
		} else {
			return "/front/personalCenter/companyDetails";
		}
	}

	// 园区编辑
	@RequestMapping(value = "/personalCenter/parkEdit")
	public String parkEdit(Model model, HttpServletRequest request) {
		try {
			BigDecimal accountId = getCurrentAccountId();
			if (accountId == null) {
				// 跳转到登录页
				return "/session/page/login/index";
			} else {
				BigDecimal parkId = getCurrentParkId();
				model.addAttribute("isMobile", isMobileDevice(request));
				if (parkId != null)
					model.addAttribute("defaultPark", getParkNameById(parkId));
				else
					model.addAttribute("defaultPark", "暂未设置默认园区");
				// 加载默认园区列表
				List<?> parkList = new ArrayList<>();
				parkList = personalCenterService.selectCommonParkListForVisitor(getCurrentAccountId());

				model.addAttribute("parkList", parkList.size() == 0 ? null : parkList);
				model.addAttribute("isVisitor", personalCenterService.isVisitor());
			}
			if (isMobileDevice(request)) { // 手机端
				return "/weixinPage/personalCenter/parkEdit";
			} else { // PC端
				return "/front/personalCenter/parkEdit";
			}
		} catch (Exception ex) {
			logger.error("园区编辑页面加载失败，详细原因：" + ex.getMessage(), ex);
			return "redirect:/error/404";
		}

	}

	// 园区选择 parkType 1:默认园区 2：常用园区
	@RequestMapping(value = "/personalCenter/parkSelect")
	public String parkSelect(@RequestParam(value = "parkType") Integer parkType,
			@RequestParam(value = "areaId", required = false) BigDecimal areaId, Model model,
			HttpServletRequest request) {
		try {
			if (parkType == 1) {
				// 账户归属组织
				BigDecimal parkId = getCurrentParkId();
				// 加载默认园区列表
				if (parkId != null)
					model.addAttribute("defaultPark", getParkNameById(parkId));
				else
					model.addAttribute("defaultPark", "暂未设置默认园区");
				// 常用园区列表
				List<?> parkList = new ArrayList<>();
				parkList = personalCenterService.selectCommonParkListForVisitor(getCurrentAccountId());

				model.addAttribute("parkList", parkList.size() == 0 ? null : parkList);
				if (isMobileDevice(request))
					return "/weixinPage/personalCenter/parkEditDefault";
				else
					return "/front/personalCenter/parkEditDefault";
			} else {
				List<?> commonParkList = new ArrayList<>();
				commonParkList = personalCenterService.selectCommonParkListForVisitor(getCurrentAccountId());

				List<?> areaList = personalCenterService.selectAllAreaListByParentIdAndAreaKind(new BigDecimal(360000),
						(short) 3);

				List<?> parkList = new ArrayList<>();
				parkList = personalCenterService.selectParkListForVisitor(null, areaId);

				model.addAttribute("commonParkList", commonParkList.size() == 0 ? null : commonParkList);
				model.addAttribute("areaList", areaList);
				model.addAttribute("parkList", parkList);
				model.addAttribute("areaId", areaId);
				if (isMobileDevice(request))
					return "/weixinPage/personalCenter/parkEditCommon";
				else
					return "/front/personalCenter/parkEditCommon";
			}
		} catch (Exception ex) {
			logger.error("园区编辑选择页面加载失败，详细原因：" + ex.getMessage(), ex);
			return "redirect:/error/404";

		}
	}

	// 园区保存
	@RequestMapping(value = "/personalCenter/parkSave")
	public String parkSave(@RequestParam(value = "parkType") Integer parkType,
			@RequestParam(value = "newParkInfo") String[] newParkInfo, RedirectAttributes redirectAttributes,
			Model model, HttpServletRequest request) {
		try {
			int rst = 0;
			if (parkType == 1) {
				BigDecimal organIzationId = organizationIdSessionHelper.getOrganizationIdBySessionAttribute();
				BigDecimal rootId = organizationIdSessionHelper.getRootIdBySessionAttribute();
				Map<String, BigDecimal> paramMap = new HashMap<>();
				paramMap.put("accountId", getCurrentAccountId());
				paramMap.put("newOrganizationId", new BigDecimal(newParkInfo[0]));
				paramMap.put("newRootId", new BigDecimal(newParkInfo[1]));
				paramMap.put("organizationId", organIzationId);
				paramMap.put("rootId", rootId);
				paramMap.put("id", new BigDecimal(seq.getNextSeqIdToBigInteger()));
				rst = personalCenterService.updateAccountOrganizationInfoForVisitor(paramMap);
			} else {
				if (newParkInfo.length != 0) {
					for (int i = 0; i < newParkInfo.length; i++) {
						String[] str = newParkInfo[i].split("-");
						rst = personalCenterService.insertCommonPark(seq.getNextSeqIdToBigDecimal(),
								getCurrentAccountId(), new BigDecimal(str[0]), new BigDecimal(str[1]));
					}
				}
			}
			redirectAttributes.addFlashAttribute("message", rst == 1 ? "设置成功！" : "设置失败！");
			return "redirect:/personalCenter/parkEdit";
		} catch (Exception ex) {
			logger.error("园区设置保存失败，详细原因：" + ex.getMessage(), ex);
			return "redirect:/error/404";
		}
	}

	// 个人信息编辑
	@RequestMapping(value = "/personalCenter/personalInfoEdit")
	public String personalInfoEdit(HttpServletRequest request, Model model) {
		try {
			BigDecimal accountId = getCurrentAccountId();
			AccountInfoBean info = accountInfoBeanProxy.selectByPrimaryKey(accountId);
			AccountImageBean imageInfo = accountImageBeanService.selectFirstByAccountIdAndImageType(accountId,
					(short) 10);
			model.addAttribute("info", info);
			model.addAttribute("accountId", accountId);
			model.addAttribute("imageInfo", imageInfo);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		/*
		ExpShareInfoBean b1=expShareInfoService.selectById(new BigDecimal("90020180625140853808093000000004"));
		ExpShareInfoBean b2=expShareInfoService.selectById(new BigDecimal("90020180625141036808093000000005"));
		b1.setExpText( StringEscapeUtils.unescapeXml(b1.getExpText()) );
		expShareInfoService.updateById(b1);
		b2.setExpText( StringEscapeUtils.unescapeXml(b2.getExpText()) );
		expShareInfoService.updateById(b2);
		System.out.println("============done===============");*/
		
		return "/front/personalCenter/personalInformation";
	}

	// 账号安全
	@RequestMapping(value = "/personalCenter/accountSecurity")
	public String accountSecurity(HttpServletRequest request, Model model) {
		try {
			BigDecimal accountId = getCurrentAccountId();
			AccountInfoBean info = accountInfoBeanProxy.selectByPrimaryKey(accountId);
			AccountImageBean imageInfo = accountImageBeanService.selectFirstByAccountIdAndImageType(accountId,
					(short) 10);
			AccountBindBean bindInfo = null;
			List<AccountBindBean> list0 =accountBindBeanService
					.selectListByAccountIdAndSystemIdAndOpenIdSearchKey(accountId, new BigDecimal(-1), "") ;
			if(!list0.isEmpty()){
				bindInfo =list0.get(0);
			}
			AccountLoginLogBeanExample example = new AccountLoginLogBeanExample();
			example.setOrderByClause("CREATE_TIME DESC");
			Criteria criteria = example.createCriteria();
			criteria.andAccountIdEqualTo(accountId);
			List<AccountLoginLogBean> list = accountLoginLogBeanService.selectByExample(example);
			if (list.size() != 0) {
				AccountLoginLogBean logInfo = list.get(0);
				model.addAttribute("logInfo", logInfo);
			}
			List<AccountWeixinBean> weixinList = accountWeixinBeanProxy
					.selectListByAccountIdAndOpenIdAndAppIdAndUnionIdAndNickName(accountId, null, null, null, null);
			if (weixinList.size() != 0) {
				model.addAttribute("weixinInfo", weixinList.get(0));
			}
			model.addAttribute("bindInfo", bindInfo);
			model.addAttribute("info", info);
			model.addAttribute("imageInfo", imageInfo);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/front/personalCenter/accountSecurity";
	}

	// 消息通知
	@RequestMapping(value = "/personalCenter/messageNotification")
	public String messageNotification(ServletRequest request, @ModelAttribute(value = "page") Page<AccountMsgBean> page,
			Model model) {
		BigDecimal accountId = getCurrentAccountId();
		model.addAttribute("accountId", accountId);
		model.addAttribute("date", new Date().getTime() - 7 * 24 * 3600 * 1000);
		return "/front/personalCenter/messageNotification";
	}

	// 消息详细
	@RequestMapping(value = "/personalCenter/messageView")
	public String messageView(@RequestParam(value = "msgId") BigDecimal msgId, Model model) {
		try {
			AccountMsgBean accountMsgBean = accountMsgBeanService.selectByPrimaryKey(msgId);
			model.addAttribute("accountMsgBean", accountMsgBean);
			accountMsgBean.setStatus((short) 1);
			accountMsgBeanService.updateByPrimaryKeySelective(accountMsgBean);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/front/personalCenter/messageDetails";
	}

	// 账号升级
	@RequestMapping(value = "/personalCenter/accountUpgrade")
	public String accountUpgrade(HttpServletRequest request, Model model) {
		try {
			AccountBindBean  bindInfo =null ;
			BigDecimal accountId = getCurrentAccountId();
			AccountInfoBean info = accountInfoBeanProxy.selectByPrimaryKey(accountId);
			AccountImageBean imageInfo = accountImageBeanService.selectFirstByAccountIdAndImageType(accountId,
					(short) 10);
			List<AccountBindBean> list0=accountBindBeanService
					.selectListByAccountIdAndSystemIdAndOpenIdSearchKey(accountId, new BigDecimal(-1), null) ;
			if(!list0.isEmpty()){
				  bindInfo =  list0.get(0);
			}
			// 判断账号是否已升级成为政务用户
			String isUpgrade = "0";
			ProjectDeclareUpgradeBean bean = new ProjectDeclareUpgradeBean();
			bean.setAccountId(getCurrentAccountId());
			List<ProjectDeclareUpgradeBean> list = projectDeclareUpgradeService.queryByCond(bean);
			if (list.size() > 0 && list.get(0).getType() == 1) {
				isUpgrade = "1";
			} else if (list.size() == 0) {
				BigDecimal rootId = organizationIdSessionHelper.getRootIdBySessionAttribute();
				OrganizationInfoBean organizationInfo = organizationInfoBeanProxy.selectByPrimaryKey(rootId);
				if (organizationInfo.getOrganizationKind() == 1 || organizationInfo.getOrganizationKind() == 2) {
					isUpgrade = "1";
				}
			}

			model.addAttribute("isUpgrade", isUpgrade);
			model.addAttribute("bindInfo", bindInfo);
			model.addAttribute("info", info);
			model.addAttribute("imageInfo", imageInfo);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		if (isMobileDevice(request)) { // 手机端
			return "/weixinPage/personalCenter/accountUpgrade";
		} else { // PC端
			return "/front/personalCenter/accountUpgrade";
		}
	}

	/**
	 * -----------------------------------------------------------------------
	 * 通用异步方法
	 * -----------------------------------------------------------------------
	 */
	/**
	 * 地址
	 */
	@RequestMapping(value = "/personalCenter/getArea", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean getArea(@RequestParam(value = "parentId") BigDecimal parentId) {
		ResultBean resultBean = new ResultBean();
		try {
			resultBean = personalCenterService.selectAreaInfo(parentId);
		} catch (Exception ex) {
			logger.error("获取地址信息失败，详细原因：" + ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("地址获取失败！");
			ex.printStackTrace();
		}
		return resultBean;
	}

	/**
	 * 校验企业信息是否重复
	 */
	@RequestMapping(value = "/personalCenter/validateCompany")
	public String validateCompany(
			@RequestParam(value = "companyName") String companyName, ModelMap modelMap) {
		try {
			String sql = "select company_id, creater_id from t_company_info where company_name = ?";
			List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{companyName});
			
			if(!list.isEmpty()){
				String sql2 = "select * from t_account_organization where account_id = ? and organization_id = ?";
				List<Map<String, Object>> list2 = jdbcTemplate.queryForList(sql2, new Object[]{getCurrentAccountId(), list.get(0).get("COMPANY_ID")});
				
				BigDecimal createrId = new BigDecimal(list.get(0).get("CREATER_ID").toString());
				if(!list2.isEmpty()&&!(createrId.equals(getCurrentAccountId()))){
					modelMap.addAttribute("success", true);
					modelMap.addAttribute("errorCode", 2);
					modelMap.addAttribute("errorMsg", "请不要重复关联【"+companyName+"】！");
					return "jsonView";
				}
				
				if(!list2.isEmpty()&&(createrId.equals(getCurrentAccountId()))){
					modelMap.addAttribute("success", true);
					modelMap.addAttribute("errorCode", 3);
					modelMap.addAttribute("errorMsg", "您已创建该企业！");
					return "jsonView";
				}
				
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "该名称已被占用！");
				modelMap.addAttribute("companyId", list.get(0).get("COMPANY_ID"));
				
			}else{
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "该名称无企业使用！");
			}
			
		} catch (Exception ex) {
			logger.error("获取地址信息失败，详细原因：" + ex.getMessage(), ex);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", ex);
		}
		return "jsonView";
	}
	
	
	/**
	 * 保存企业信息
	 */
	@RequestMapping(value = "/personalCenter/saveCommonCompany", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean saveCommonCompany(
			@RequestParam(value = "parentId", required = false) BigDecimal parentId,
			@ModelAttribute(value = "companyInfoBean") CompanyInfoBean companyInfoBean) {
		ResultBean resultBean = new ResultBean();
		try {
			if (parentId == null) {
				if (companyInfoBean.getSpaceId() != null) {
					parentId = companyInfoBean.getSpaceId();
				} else {
					if (companyInfoBean.getAreaId() != null) {
						parentId = companyInfoBean.getAreaId();
					} else {
						parentId = companyInfoBean.getProvinceId();
					}
				}
			}
			
			if(companyInfoBean.getCompanyId()==null){//新增企业
				/*
				 * 判断企业信息是否重复
				 */
				String sql = "select company_id from t_company_info where company_name = ?";
				List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{companyInfoBean.getCompanyName()});
				
				if(!list.isEmpty()){
					resultBean.setCode(0);
					JSONObject jo = new JSONObject();
					jo.put("companyId", list.get(0).get("COMPANY_ID"));
					resultBean.setJsonValue(jo);
					return resultBean;
				}
				companyInfoBean.setCompanyDescription(HtmlUtils.htmlEscape(companyInfoBean.getCompanyDescription()));
				companyInfoBean.setPositionAddress(HtmlUtils.htmlEscape(companyInfoBean.getPositionAddress()));
				companyInfoBean.setCreaterId(getCurrentAccountId());
				companyInfoBean.setCompanyId(seq.getNextSeqIdToBigDecimal());
				companyInfoBean.setCreaterName(getCurrentAccountName());
				companyInfoBean.setContactName(getCurrentAccountName());
				companyInfoBean
						.setContactPhone(accountInfoBeanProxy.selectByPrimaryKey(getCurrentAccountId()).getContactPhone());
				resultBean = personalCenterService.saveCompanyInfoForVisitor(parentId, companyInfoBean);
			}else{
				if(getCurrentAccountId().equals(companyInfoBean.getCreaterId())){ //编辑企业
					resultBean = personalCenterService.updateCompanyInfo(parentId, companyInfoBean);
				}else{ //关联企业
					resultBean = personalCenterService.connectCompanyInfo(getCurrentAccountId(), companyInfoBean.getCompanyId());
				}
			}
			
			
		} catch (Exception ex) {
			logger.error("保存创建企业信息失败，详细原因：" + ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("企业创建失败！");
		}
		return resultBean;
	}

	/**
	 * 删除常用企业信息
	 */
	@RequestMapping(value = "/personalCenter/deleteCommonCompany", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean deleteCommonCompany(@RequestParam(value = "companyId") BigDecimal companyId) {
		ResultBean resultBean = new ResultBean();
		try {
			resultBean = personalCenterService.deleteCommonCompanyForVisitor(getCurrentAccountId(), companyId);
		} catch (Exception ex) {
			logger.error("删除企业失败，详细原因：" + ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("删除企业失败！");
		}
		return resultBean;
	}

	/**
	 * 设置默认企业
	 */
	@RequestMapping(value = "/personalCenter/setDefaultCompany", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean setDefaultCompany(@RequestParam(value = "companyId") BigDecimal companyId) {
		ResultBean resultBean = new ResultBean();
		try {
			resultBean = personalCenterService.saveDefaultCompanyInfoForVisitor(getCurrentAccountId(), companyId);
		} catch (Exception ex) {
			logger.error("设置默认企业失败，详细原因：" + ex.getMessage(), ex);
			resultBean.setMsg("设置默认企业失败！");
		}
		return resultBean;
	}

	/**
	 * 删除常用园区
	 */

	@RequestMapping(value = "/personalCenter/deleteCommonPark", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean deleteCommonPark(@RequestParam(value = "organizationId") BigDecimal organizationId) {
		ResultBean resultBean = new ResultBean();
		try {
			resultBean = personalCenterService.deleteCommonParkForVisitor(getCurrentAccountId(), organizationId);
		} catch (Exception ex) {
			logger.error("删除账号常用园区失败，详细原因：" + ex.getMessage(), ex);
		}
		return resultBean;
	}

	/*
	 * 解除微信绑定
	 */

	@RequestMapping(value = "/personalCenter/removeBinding", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String removeBinding(ServletRequest request, Model model) {
		String str = "-1";
		try {
			BigDecimal accountId = getCurrentAccountId();
			List<AccountWeixinBean> weixinList = accountWeixinBeanProxy
					.selectListByAccountIdAndOpenIdAndAppIdAndUnionIdAndNickName(accountId, null, null, null, null);
			for (AccountWeixinBean bean : weixinList) {
				bean.setAccountId(new BigDecimal(-1));
				InvokeInfoBean<Integer> rst = accountWeixinBeanProxy.validateUpdateByPrimaryKeySelective(bean);
				if (logger.isTraceEnabled()) {
					logger.trace("解除微信绑定API调用完毕，bean：" + JSON.toJSONString(bean) + "，rst：" + JSON.toJSONString(rst));
				}
				if (rst.isSuccess()) {
					str = "1";
				} else {
					str = "-1";
					break;
				}
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			str = "-1";
		}
		return str;
	}

	/*
	 * 修改密码
	 */
	@RequestMapping(value = "/personalCenter/updatePassWord", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String updatePassWord(ServletRequest request, @RequestParam(value = "newPassWord") String newPassWord,
			@RequestParam(value = "oldPassWord") String oldPassWord, Model model) {
		String str = "";
		try {
			BigDecimal accountId = getCurrentAccountId();
			InvokeInfoBean<Integer> invoke = updateAccountPasswdService
					.changeAccountPasswdByAccountIdAndOrganizationIdAndRootIdUsingNewAccountPasswd(accountId,
							new BigDecimal(0), new BigDecimal(0), oldPassWord, newPassWord); // 组织ID和单位ID暂时先写死，后续修改成用户的组织ID
			if (invoke.isSuccess() == true) {
				str = "1";
			} else {
				str = invoke.getErrorMsg();
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			str = "-1";
		}
		return str;
	}

	/*
	 * 绑定手机号
	 */
	@RequestMapping(value = "/personalCenter/bindingMobilePhone", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String bindingMobilePhone(ServletRequest request, @RequestParam(value = "phoneNum") String phoneNumber,
			@RequestParam(value = "identifyingCode") String identifyingCode, Model model) {
		String str = "";
		try {
			BigDecimal accountId = getCurrentAccountId();
			InvokeInfoBean<Boolean> invoke = signatureShortMessageCaptchaCacheHelper
					.validateCacheSignatureShortMessageCaptcha(phoneNumber, identifyingCode);
			List<AccountBindBean> list = accountBindBeanService
					.selectListByAccountIdAndSystemIdAndOpenIdSearchKey(accountId, new BigDecimal(-1), null);
			List<AccountBindBean> phoneList = accountBindBeanService
					.selectListByAccountIdAndSystemIdAndOpenIdSearchKey(null, BigDecimal.valueOf(-1), phoneNumber);
			AccountBindBean bean = new AccountBindBean();
			InvokeInfoBean<Integer> invoke1 = new InvokeInfoBean<Integer>();
			if (invoke.isSuccess() == true) {
				if (phoneList.size() > 0) {
					str = "该手机号已被绑定！";
				} else {
					if (list.size() == 0) {
						bean.setBindId(seq.getNextSeqIdToBigDecimal());
						bean.setAccountId(accountId);
						bean.setSystemId(new BigDecimal(-1));
						bean.setOpenId(phoneNumber);
						bean.setCreateTime(new Timestamp(new Date().getTime()));
						invoke1 = accountBindBeanProxy.validateInsertSelective(bean, true);
					} else {
						bean = list.get(0);
						bean.setOpenId(phoneNumber);
						invoke1 = accountBindBeanProxy.validateUpdateByPrimaryKeySelective(bean);
					}
					if (invoke1.isSuccess()) {
						str = "1";
					} else {
						str = invoke1.getErrorMsg();
					}
				}
			} else {
				str = invoke.getErrorMsg();
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			str = "-1";
		}
		return str;
	}

	// 个人信息保存  
	@RequestMapping(value = "/personalCenter/personalInfosave", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String save(HttpServletRequest request,
			@ModelAttribute(value = "accountInfoBean") AccountInfoBean accountInfoBean,
			@ModelAttribute(value = "accountImageBean") AccountImageBean accountImageBean,
			@RequestParam(value = "birthdayStr", required = false) String birthdayStr, Model model) {
		String str = "1";
		try {
			if (StrKit.notBlank(birthdayStr)) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				accountInfoBean.setBirthday(sdf.parse(birthdayStr));
			}
			accountInfoBean.setAccountId(getCurrentAccountId());
			AccountInfoBean ab=accountInfoBeanProxy.selectByPrimaryKey(accountInfoBean.getAccountId());
			accountInfoBean.setContactPhone(ab.getContactPhone()); //加上联系电话，否则会失去绑定无法登陆
			accountInfoBeanProxy.validateUpdateByPrimaryKey(accountInfoBean);
			AccountImageBean b = accountImageBeanService
					.selectFirstByAccountIdAndImageType(accountInfoBean.getAccountId(), (short) 10);
			//图片路径防止xss攻击，去除双引号 ,单引号 , 去除onerror
			//accountImageBean.setImageUrl(accountImageBean.getImageUrl().replaceAll("(?i)(onerror)", " ") );
			String s=accountImageBean.getImageUrl().replaceAll("\"", "");
			s=s.replaceAll("'", "");
			s=s.replaceAll("(?i)(onerror)", " ");
			accountImageBean.setImageUrl(s);
			if (b == null) {
				accountImageBean.setImageType((short) 10);
				accountImageBeanService.insertSelective(accountImageBean);
			} else {
				accountImageBeanService.updateByPrimaryKeySelective(accountImageBean);
			}

			request.getSession().setAttribute("accountName", accountInfoBean.getAccountName());
			request.getSession().setAttribute("headImage",
					accountImageBean == null ? "" : accountImageBean.getImageUrl());
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			str = "0";
		}
		return str;
	}

	// 消息通知列表异步
	@RequestMapping(value = "/personalCenter/json/messageNotification", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonMessageNotification(ServletRequest request,
			@RequestParam(value = "status", required = false) Short status, // status不传
			// 为全部
			// 0为未读
			// 1为已读
			@ModelAttribute(value = "page") Page<AccountMsgBean> page, Model model) {
		ResultBean resultBean = new ResultBean();
		try {
			BigDecimal accountId = getCurrentAccountId();
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			if (status != null) {
				page = (Page<AccountMsgBean>) accountMsgBeanService.selectByAccountIdAndStatusAndSearchKey(accountId,
						status, "");
			} else {
				page = (Page<AccountMsgBean>) accountMsgBeanService.selectByAccountIdAndStatusAndSearchKey(accountId,
						null, "");

			}
			if (page.getTotal() == 0) {
				resultBean.setCode(2);
				return resultBean;
			}

			if (page.getTotal() > (page.getPageNum() * page.getPageSize())) {
				resultBean.setCode(1);
			} else {
				resultBean.setCode(0);
			}
			List<AccountMsgBean> list = new ArrayList<>();
			for (AccountMsgBean bean : page) {
				list.add(bean);
			}
			resultBean.setValue(list);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resultBean.setCode(-1);
			resultBean.setMsg("获取列表失败！");
		}
		return resultBean;
	}

	/**
	 * -----------------------------------------------------------------------
	 * 微信同步方法
	 * -----------------------------------------------------------------------
	 */

	// 个人信息修改
	@RequestMapping(value = "/personalCenter/weixin/personalInfoEdit")
	public String weixinEdit(ServletRequest request, Model model) {
		try {
			BigDecimal accountId = getCurrentAccountId();
			AccountInfoBean info = accountInfoBeanProxy.selectByPrimaryKey(accountId);
			// 头像信息
			AccountImageBean imageInfo = accountImageBeanService.selectFirstByAccountIdAndImageType(accountId,
					(short) 10);
			model.addAttribute("info", info);
			model.addAttribute("imageInfo", imageInfo);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/weixinPage/personalCenter/modifyPerInfo";
	}

	// 个人中心绑定
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/auth/page/mobile/weixin/personalInfoBingding")
	public String weixinPersonalInfoBingding(ServletRequest request, Model model) {
		try {
			BigDecimal accountId = getCurrentAccountId();
			AccountInfoBean info = accountInfoBeanProxy.selectByPrimaryKey(accountId);
			// 头像信息
			AccountImageBean imageInfo = accountImageBeanService.selectFirstByAccountIdAndImageType(accountId,
					(short) 10);
			List<AccountBindBean> list = accountBindBeanService
					.selectListByAccountIdAndSystemIdAndOpenIdSearchKey(accountId, new BigDecimal(-1), "");
			// 手机绑定信息
			if (list.size() != 0) {
				AccountBindBean bindInfo = list.get(0);
				model.addAttribute("bindInfo", bindInfo);
			}
			model.addAttribute("info", info);
			model.addAttribute("imageInfo", imageInfo);

			// 默认园区
			model.addAttribute("isVisitor", personalCenterService.isVisitor());
			BigDecimal parkId = getCurrentParkId();
			if (parkId != null)
				model.addAttribute("defaultPark", getParkNameById(parkId));
			else
				model.addAttribute("defaultPark", "暂未设置默认园区");
			// 默认企业
			CompanyInfoBean companyInfoBean = personalCenterService
					.selectDefaultCompanyForVisitor(getCurrentAccountId());
			if (companyInfoBean != null) {
				model.addAttribute("defaultCompany", companyInfoBean.getCompanyName());
			} else {
				model.addAttribute("defaultCompany", "暂未设置默认企业");
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/weixinPage/personalCenter/personalCenter";
	}

	// 手机绑定
	@RequestMapping(value = "/personalCenter/weixin/bindingMobile")
	public String bindingMobile(ServletRequest request, Model model) {
		BigDecimal accountId = getCurrentAccountId();
		model.addAttribute("accountId", accountId);
		return "/weixinPage/personalCenter/boundPhone";
	}

	// 消息通知
	@RequestMapping(value = "/personalCenter/weixin/messageNotification")
	public String weixinMessageNotification(

	) {

		return "/weixinPage/personalCenter/messageCenter";
	}

	// 消息详情
	@RequestMapping(value = "/personalCenter/weixin/messageView")
	public String weixinMessageView(@RequestParam(value = "msgId") BigDecimal msgId, Model model) {
		try {
			AccountMsgBean accountMsgBean = accountMsgBeanService.selectByPrimaryKey(msgId);
			model.addAttribute("accountMsgBean", accountMsgBean);
			accountMsgBean.setStatus((short) 1);
			accountMsgBeanService.updateByPrimaryKeySelective(accountMsgBean);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/weixinPage/personalCenter/messageDetails";
	}

	// 修改密码
	@RequestMapping(value = "/personalCenter/weixin/updatePassWord")
	public String updatePassWord(ServletRequest request, Model model) {
		BigDecimal accountId = getCurrentAccountId();
		model.addAttribute("accountId", accountId);
		return "/weixinPage/personalCenter/modifyPassword";
	}

	// 首页
	@RequestMapping(value = "/personalCenter/weixin/main")
	public String weixinMain(ServletRequest request, Model model) {
		try {
			BigDecimal accountId = getCurrentAccountId();
			ProjectDeclareInfoBean projectDeclareInfo = new ProjectDeclareInfoBean();
			projectDeclareInfo.setAccountId(accountId);

			ProjectActivityInfoBean projectActivityInfoBean = new ProjectActivityInfoBean();
			projectActivityInfoBean.setAccountId(accountId);
			int activityCount = projectActivityInfoService.queryTotalSize(projectActivityInfoBean);

			InvestigationInfoMainBean investigationInfoMainBean = new InvestigationInfoMainBean();
			int investigationCount = iInvestigationInfoMainService.queryTotalSize(investigationInfoMainBean);

			// 项目申报已发数量
			model.addAttribute("projectDeclareCount",projectDeclareInfoService.countByCondNotPreview(projectDeclareInfo));
			model.addAttribute("activityCount", activityCount);
			model.addAttribute("investigationCount", investigationCount);
			model.addAttribute("accountId", accountId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/weixinPage/personalCenter/homepage";
	}
}
