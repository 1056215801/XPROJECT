package com.chinatelecom.jx.zone.management.controller.expShare;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import com.jfinal.kit.StrKit;
import com.chinatelecom.jx.bean.EntryBean;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.company.info.bean.CompanyInfoBean;
import com.chinatelecom.jx.zone.company.info.service.ICompanyInfoBeanService;
import com.chinatelecom.jx.zone.government.info.bean.GovernmentInfoBean;
import com.chinatelecom.jx.zone.government.info.service.IGovernmentInfoBeanService;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.browseLog.BrowseLogMainBean;
import com.chinatelecom.jx.zone.management.bean.expBrowse.ExpBrowseLogBean;
import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareInfoBean;
import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareLabelBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityTagBean;
import com.chinatelecom.jx.zone.management.service.browseLog.IBrowseLogMainService;
import com.chinatelecom.jx.zone.management.service.expBrowse.IExpBrowseLogService;
import com.chinatelecom.jx.zone.management.service.expShare.IExpShareInfoService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityTagService;
import com.chinatelecom.jx.zone.management.util.MyBeanUtils;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.organization.info.bean.OrganizationInfoBean;
import com.chinatelecom.jx.zone.organization.info.proxy.IOrganizationInfoBeanProxy;
import com.chinatelecom.jx.zone.park.info.bean.ParkInfoBean;
import com.chinatelecom.jx.zone.park.info.service.IParkInfoBeanService;
import com.chinatelecom.jx.zone.sm.helper.SubmitThirdSmHelper;

@Controller
public class ExpShareFrontController extends BaseController {
	@Autowired
	private IExpShareInfoService expShareInfoService;
	@Autowired
	private IExpBrowseLogService expBrowseLogService;
	@Autowired
	private IProjectActivityTagService projectActivityTagService;
	@Autowired
	private IOrganizationInfoBeanProxy organizationInfoBeanProxy;
	@Autowired
	private IParkInfoBeanService parkInfoBeanService;
	@Autowired
	private ICompanyInfoBeanService companyInfoBeanService;
	@Autowired
	private IGovernmentInfoBeanService governmentInfoBeanService;
	@Autowired
	private IBrowseLogMainService browseLogMainService;
	@Autowired
	private SubmitThirdSmHelper submitThirdSmHelper;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	/**
	 * -----------------------------------------------------------------
	 *                      平台端同步方法
	 * -----------------------------------------------------------------
	 */

	/**
	 * 主页
	 * @param expShareInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShare/main")
	public String list(
			@ModelAttribute("expShareInfo") ExpShareInfoBean expShareInfo, 
			@ModelAttribute("page") Page<ExpShareInfoBean> page, Model model) {
		try {
			//热门园区动态
			expShareInfo.setOrderByClause("BROWSE_COUNT DESC");
			expShareInfo.setStatus((short) 1);
			PageHelper.startPage(1, 5);
			page = (Page<ExpShareInfoBean>) expShareInfoService.queryByCond(expShareInfo);
			model.addAttribute("infoList", page.getResult());
			model.addAttribute("labelList", getTags()); //标签列表
			model.addAttribute("accountId", getCurrentAccountId());
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}

		return "/front/experienceSharing/main";
	}

	/**
	 * 新增 
	 * @param expId
	 * @param pageNum
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShare/add")
	public String create(
			@RequestParam(value = "pageNum",defaultValue = "1") int pageNum, 
			Model model, ServletRequest request) {
		try {
			//标签列表
			List<ProjectActivityTagBean> tagList = getTags();
			//分享单位列表
			List<OrganizationInfoBean> organizationList = organizationInfoBeanProxy
					.selectFirstGradeListByAccountIdAndRootIdAndSystemIdArrayAndOrganizationNameSearchKey(getCurrentAccountId(), null, null, null);
			List<OrganizationInfoBean> newOrganizationList = new ArrayList<OrganizationInfoBean>();
			for(OrganizationInfoBean bean : organizationList){
				OrganizationInfoBean organizationInfoBean = 
						organizationInfoBeanProxy.selectUnitByOrganizationId(bean.getOrganizationId());
				if(organizationInfoBean.getOrganizationKind()==2||
						organizationInfoBean.getOrganizationKind()==3||organizationInfoBean.getOrganizationKind()==1){					
					newOrganizationList.add(organizationInfoBean);
				}
				
			}
			
			if(newOrganizationList.size()>0){
				model.addAttribute("organizationList", newOrganizationList);
			}
			model.addAttribute("tagList", tagList);
			model.addAttribute("expShareInfo", new ExpShareInfoBean());
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "/front/experienceSharing/shareExperience";
	} 
	/**
	 * 编辑
	 * @param expId
	 * @param pageNum
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShare/edit")
	public String create(
			@RequestParam(value = "expId" ) BigDecimal expId,
			@RequestParam(value = "pageNum",defaultValue = "1") int pageNum, 
			Model model, ServletRequest request) {
		try {
			ExpShareInfoBean expShareInfo = expShareInfoService.selectById(expId);
			//标签列表
			List<ProjectActivityTagBean> tagList = getTags();

			//分享单位列表
			List<OrganizationInfoBean> organizationList = organizationInfoBeanProxy
					.selectFirstGradeListByAccountIdAndRootIdAndSystemIdArrayAndOrganizationNameSearchKey(getCurrentAccountId(), null, null, null);
			List<OrganizationInfoBean> newOrganizationList = new ArrayList<OrganizationInfoBean>();
			for(OrganizationInfoBean bean : organizationList){
				OrganizationInfoBean organizationInfoBean = 
						organizationInfoBeanProxy.selectUnitByOrganizationId(bean.getOrganizationId());
				if(organizationInfoBean.getOrganizationKind()==2||
						organizationInfoBean.getOrganizationKind()==3||organizationInfoBean.getOrganizationKind()==1){					
					newOrganizationList.add(organizationInfoBean);
				}
				
			}
			if(newOrganizationList.size()>0){
				model.addAttribute("organizationList", newOrganizationList);
			}
			
			model.addAttribute("tagList", tagList);
			model.addAttribute("expShareInfo", expShareInfo);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "/front/experienceSharing/shareExperience";
	}

	/**
	 * 预览
	 * @param expId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/expShare/preview")
	public String preview(@RequestParam(value = "expId") BigDecimal expId,Model model){
		try{
			ExpShareInfoBean expShareInfo = expShareInfoService.selectById(expId);
			model.addAttribute("expShareInfo",expShareInfo);
		}catch(Exception ex){
			logger.error("获取预览失败，"+ex.getMessage(),ex);
			return "redirect:/error/404";
		}
		return "/front/experienceSharing/sharePreview";
	}


	/**
	 * 保存操作
	 * @param expShareInfo
	 * @param pageNum
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShare/save")
	public String save(
			@ModelAttribute(value = "expShareInfo") ExpShareInfoBean expShareInfo, 
			@RequestParam(value = "isPreview",required=false) String isPreview,
			@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
			@RequestParam(value = "isFwpg", required = false) Integer isFwpg,
			@RequestParam(value = "entranceId", required = false) BigDecimal entranceId,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		try {
			int rst = 0;
			if(expShareInfo.getExpId()==null){
				BigDecimal expId = seq.getNextSeqIdToBigDecimal();
				expShareInfo.setExpId(expId);
				expShareInfo.setAccountId(getCurrentAccountId());
				expShareInfo.setAccountName(getCurrentAccountName());
				expShareInfo.setBrowseCount("0");
				expShareInfo.setBrowseCountEdit("0");
				expShareInfo.setCommentCount("0");
				expShareInfo.setQrCode(createQrcode("experienceSharing/weixin/detail/"+expId,null));
				OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy
						.selectByPrimaryKey(expShareInfo.getUnitId());
				expShareInfo.setExpUnit(organizationInfoBean.getOrganizationName());

				if(organizationInfoBean.getOrganizationKind()==2){
					ParkInfoBean parkInfoBean = parkInfoBeanService
							.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
					expShareInfo.setProvinceName(parkInfoBean.getProvinceName());
					expShareInfo.setAreaName(parkInfoBean.getAreaName());
					expShareInfo.setUnitType((short)0);
				}else if(organizationInfoBean.getOrganizationKind()==3){
					CompanyInfoBean companyInfoBean = companyInfoBeanService
							.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
					expShareInfo.setProvinceName(companyInfoBean.getProvinceName());
					expShareInfo.setAreaName(companyInfoBean.getAreaName());
					expShareInfo.setUnitType((short)1);
				}else if(organizationInfoBean.getOrganizationKind()==1){
					GovernmentInfoBean governmentInfoBean = governmentInfoBeanService.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
					expShareInfo.setProvinceName(governmentInfoBean.getProvinceName());
					expShareInfo.setAreaName(governmentInfoBean.getAreaName());
					expShareInfo.setUnitType((short)2);
				}
				expShareInfo.setCreateTime(new Timestamp(new Date().getTime()));
				if(StrKit.isBlank(isPreview)){
					expShareInfo.setStatus((short) 2);
					rst = expShareInfoService.insert(expShareInfo);
					String str = "提交成功！待审核";
					redirectAttributes.addFlashAttribute("message", str);
				}else{
					expShareInfo.setStatus((short) 3);
					rst = expShareInfoService.insert(expShareInfo);
				}
			}else{//编辑
				ExpShareInfoBean record = expShareInfoService.selectById(expShareInfo.getExpId());
				if(expShareInfo.getUnitId()!=null){
					OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy
							.selectByPrimaryKey(expShareInfo.getUnitId());
					expShareInfo.setExpUnit(organizationInfoBean.getOrganizationName());

					if(organizationInfoBean.getOrganizationKind()==2){
						ParkInfoBean parkInfoBean = parkInfoBeanService
								.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
						expShareInfo.setProvinceName(parkInfoBean.getProvinceName());
						expShareInfo.setAreaName(parkInfoBean.getAreaName());
						expShareInfo.setUnitType((short)0);
					}else if(organizationInfoBean.getOrganizationKind()==3){
						CompanyInfoBean companyInfoBean = companyInfoBeanService
								.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
						expShareInfo.setProvinceName(companyInfoBean.getProvinceName());
						expShareInfo.setAreaName(companyInfoBean.getAreaName());
						expShareInfo.setUnitType((short)1);
					}else if(organizationInfoBean.getOrganizationKind()==1){
						GovernmentInfoBean governmentInfoBean = governmentInfoBeanService.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
						expShareInfo.setProvinceName(governmentInfoBean.getProvinceName());
						expShareInfo.setAreaName(governmentInfoBean.getAreaName());
						expShareInfo.setUnitType((short)2);
					}
				}
				expShareInfo.setCreateTime(new Timestamp(new Date().getTime()));
				if(StrKit.isBlank(isPreview)){
					expShareInfo.setStatus((short) 2);
					MyBeanUtils.copyProperties(expShareInfo, record);
					rst = expShareInfoService.updateById(record);
					String str = "提交成功！待审核";
					redirectAttributes.addFlashAttribute("message", str);
				}else{
					MyBeanUtils.copyProperties(expShareInfo, record);
					rst = expShareInfoService.updateById(record);
				}
			}
			
			if(expShareInfo.getStatus()==2&&rst>0){
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
				String smsContent = "["+platformName+"]您好，"+sdf.format(System.currentTimeMillis())+"，您有一个待审批园区动态，标题【"+expShareInfo.getExpTitle()+"】，请及时处理！ ";
				InvokeInfoBean<BigDecimal> msgRst =  submitThirdSmHelper.validateSubmitContactSimpleSmJob(new BigDecimal(3600009),
						new BigDecimal("201611281649570000002"), new BigDecimal(3600009), new BigDecimal(21), (short) 2, (short) 1, smsContent,
						new Timestamp(System.currentTimeMillis()), null, list, (short) 2, "127.0.0.1",
						(short) 1, new Timestamp(System.currentTimeMillis()));
				
				if(!msgRst.isSuccess()){
					redirectAttributes.addFlashAttribute("message", msgRst.getErrorMsg());
				}
			}
			
		} catch (Exception ex) {
			String str = "提交失败！";
			redirectAttributes.addFlashAttribute("message", str);
			logger.error("园区动态保存失败，"+ex.getMessage(),ex);
			return "redirect:/error/404";
		}
		
		if(isFwpg==null) {
			if(!StrKit.isBlank(isPreview)){
				model.addAttribute("expShareInfo",expShareInfo);
				return "redirect:/expShare/preview?expId="+expShareInfo.getExpId();
			}else{
				return "redirect:/expShare/main" ;			
			}
		}else {
			//TODO
			if(!StrKit.isBlank(isPreview)){
				model.addAttribute("expShareInfo",expShareInfo);
				return "redirect:/experience/preview?expId="+expShareInfo.getExpId();
			}else{
				return "redirect:/experience/list?entranceId="+entranceId;			
			}
		}
	}

	/**
	 * 查看详细 PC
	 * @param expId
	 * @param pageNum
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/expShare/view/{expId}")
	public String view(
			@PathVariable(value = "expId") BigDecimal expId,
			@RequestParam(value = "type") String type,
			HttpServletRequest request,Model model) {
		try {
			if(isMobileDevice(request)){
				return "redirect:/experienceSharing/weixin/detail/"+expId;
			}
			ExpShareInfoBean expShareInfo = expShareInfoService.selectById(expId);
		//	if(expShareInfo.getAccountId()!=getCurrentAccountId() || getCurrentAccountId()==null){
				if(expShareInfo.getStatus()==1){
					//增加浏览量总数
					Integer count = Integer.parseInt(expShareInfo.getBrowseCount())+1;
					expShareInfo.setBrowseCount(count.toString());
					Integer count2 = Integer.parseInt(expShareInfo.getBrowseCountEdit())+1;
					expShareInfo.setBrowseCountEdit(count2.toString());
					expShareInfoService.updateById(expShareInfo);
				}
				//增加浏览日志
				BrowseLogMainBean browseLogMainBean = new BrowseLogMainBean();
				browseLogMainBean.setId(seq.getNextSeqIdToBigDecimal());
				browseLogMainBean.setAccountId(getCurrentAccountId());
				browseLogMainBean.setRelatedId(expId);
				browseLogMainBean.setSource("t_exp_share_info");
				browseLogMainBean.setCreateTime(new Timestamp(new Date().getTime()));
				browseLogMainService.insert(browseLogMainBean);
		//	}	
			
			model.addAttribute("expShareInfo",expShareInfo);
			model.addAttribute("type",type);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "/front/experienceSharing/experienceDetails";
	}

	@RequestMapping(value = "/expShare/delete")
	public String delete(
			@RequestParam(value = "expId")BigDecimal expId,
			RedirectAttributes redirectAttributes,Model model){
		try {
			int rst = expShareInfoService.deleteById(expId);
			redirectAttributes.addFlashAttribute("message", rst==1?"删除成功！":"删除失败！");
		} catch (Exception ex) {
			logger.error("删除园区动态失败，"+ex.getMessage(),ex);
			return "redirect:/error/404";
		}
		return "redirect:/expShare/main";
	}

	/**
	 * -----------------------------------------------------------------
	 *                     微信端同步方法
	 * -----------------------------------------------------------------
	 */
	/**
	 * 园区动态首页
	 * @return
	 */
	@RequestMapping(value = "/auth/page/mobile/weixin/experienceSharing/weixin/main")
	public String main(
			@ModelAttribute("expShareInfo") ExpShareInfoBean expShareInfo, 
			@ModelAttribute("page") Page<ExpShareInfoBean> page, Model model) {
		try {
			//热门园区动态
			expShareInfo.setOrderByClause("BROWSE_COUNT DESC");
			expShareInfo.setStatus((short) 1);
			PageHelper.startPage(1, 5);
			List<ExpShareInfoBean> infoList = expShareInfoService.queryByCond(expShareInfo);
			model.addAttribute("infoList", infoList);
			model.addAttribute("labelList", getTags()); //标签列表
			model.addAttribute("accountId", getCurrentAccountId());
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404"; 
		}
		return "weixinPage/experienceSharing/main";
	}

	/**
	 * 我的列表
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing/weixin/myShare")
	public String myShare(
			@ModelAttribute("expShareInfo") ExpShareInfoBean expShareInfo, 
			@ModelAttribute("page") Page<ExpShareInfoBean> page, Model model){
		try {
			//热门园区动态
			expShareInfo.setOrderByClause("BROWSE_COUNT DESC");
			expShareInfo.setAccountId(getCurrentAccountId());
			expShareInfo.setStatus((short) 1);
			PageHelper.startPage(1, 5);
			List<ExpShareInfoBean> infoList = expShareInfoService.queryByCond(expShareInfo);

			model.addAttribute("infoList", infoList);
			model.addAttribute("labelList", getTags()); //标签列表
			model.addAttribute("accountId", getCurrentAccountId());
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "weixinPage/experienceSharing/myShare";
	}

	/**
	 * 我的列表登录跳转
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing/weixin/myShare/add")
	public String myShareLogin(
			@ModelAttribute("expShareInfo") ExpShareInfoBean expShareInfo, 
			@ModelAttribute("page") Page<ExpShareInfoBean> page, Model model){
		return "redirect:/experienceSharing/weixin/myShare";
	}
	
	/**
	 * 登录重定向到详情
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing/weixin/add/detail/{expId}")
	public String addDetail(
			@PathVariable(value = "expId")BigDecimal expId, Model model){
		return "redirect:/experienceSharing/weixin/detail/"+expId;
	}
	
	
	/**
	 * 详情 wiexin
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing/weixin/detail/{expId}")
	public String detail(
			@PathVariable(value = "expId")BigDecimal expId
			,HttpServletRequest request,Model model){
		try {
			if(!isMobileDevice(request)){
				return "redirect:/expShare/view/"+expId+"?type=0";
			}
			
			ExpShareInfoBean expShareInfo = expShareInfoService.selectById(expId);
			
			if(expShareInfo==null){
				return "redirect:/error/404";
			}
			
			Boolean isCurrentAccount = true;
//			if(expShareInfo.getAccountId()!=getCurrentAccountId() || getCurrentAccountId()==null){
				//增加浏览量总数
				Integer count = Integer.parseInt(expShareInfo.getBrowseCount())+1;
				expShareInfo.setBrowseCount(count.toString());
				Integer count2 = Integer.parseInt(expShareInfo.getBrowseCountEdit())+1;
				expShareInfo.setBrowseCountEdit(count2.toString());
				expShareInfoService.updateById(expShareInfo);
				//增加浏览日志
				ExpBrowseLogBean expBrowseLog = new ExpBrowseLogBean();
				expBrowseLog.setLogId(seq.getNextSeqIdToBigDecimal());
				expBrowseLog.setExpId(expShareInfo.getExpId());
				if(getCurrentAccountId()==null){
					expBrowseLog.setType((short) 0);
				}else{
					expBrowseLog.setType((short) 1);
					expBrowseLog.setBrowseId(getCurrentAccountId());
					expBrowseLog.setBrowseName(getCurrentAccountName());
				}
				expBrowseLog.setBrowseIp(getIpAddr(request));
				expBrowseLog.setCreateTime(new Timestamp(new Date().getTime()));
				expBrowseLogService.insert(expBrowseLog);
				isCurrentAccount = false;
	//		}
			
			model.addAttribute("curAccountId",getCurrentAccountId());
			model.addAttribute("isCurrentAccount",isCurrentAccount);
			model.addAttribute("expShareInfo",expShareInfo);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "weixinPage/experienceSharing/experienceDetails";
	}
	
	/**
	 * 详情登录跳转
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing/weixin/detail/add/{expId}")
	public String detailLogin(
			@PathVariable(value = "expId") String expId,
			Model model, ServletRequest request) {
		return "redirect:/experienceSharing/weixin/detail/"+expId+"?main=1";
	}
	
	
	/**
	 * 新增 
	 * @param expId
	 * @param pageNum
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing/weixin/add")
	public String createExp(
			@RequestParam(value = "pageNum",defaultValue = "1") int pageNum, 
			Model model, ServletRequest request) {
		try {
			ExpShareLabelBean expShareLabelBean = new ExpShareLabelBean();
			expShareLabelBean.setOrderByClause("LABEL_SORT ASC");
			//标签列表
			List<ProjectActivityTagBean> tagList = getTags();
			
			List<OrganizationInfoBean> organizationList = organizationInfoBeanProxy
					.selectFirstGradeListByAccountIdAndRootIdAndSystemIdArrayAndOrganizationNameSearchKey(getCurrentAccountId(), null, null, null);
			List<OrganizationInfoBean> newOrganizationList = new ArrayList<OrganizationInfoBean>();
			for(OrganizationInfoBean bean : organizationList){
				OrganizationInfoBean organizationInfoBean = 
						organizationInfoBeanProxy.selectUnitByOrganizationId(bean.getOrganizationId());
				if(organizationInfoBean.getOrganizationKind()==2||
						organizationInfoBean.getOrganizationKind()==3||organizationInfoBean.getOrganizationKind()==1){					
					newOrganizationList.add(organizationInfoBean);
				}
				
			}
			model.addAttribute("tagList", tagList);
			model.addAttribute("organizationList", newOrganizationList);
			model.addAttribute("expShareInfo", new ExpShareInfoBean());
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "weixinPage/experienceSharing/shareExperience";
	} 

	/**
	 * 编辑
	 * @param expId
	 * @param pageNum
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing/weixin/edit")
	public String createExp(
			@RequestParam(value = "expId" ) BigDecimal expId,
			@RequestParam(value = "pageNum",defaultValue = "1") int pageNum, 
			Model model, ServletRequest request) {
		try {
			ExpShareInfoBean expShareInfo = expShareInfoService.selectById(expId);
			ExpShareLabelBean expShareLabelBean = new ExpShareLabelBean();
			expShareLabelBean.setOrderByClause("LABEL_SORT ASC");
			//标签列表
			List<ProjectActivityTagBean> tagList = getTags();

			//分享单位列表
			List<OrganizationInfoBean> organizationList = organizationInfoBeanProxy
					.selectFirstGradeListByAccountIdAndRootIdAndSystemIdArrayAndOrganizationNameSearchKey(getCurrentAccountId(), null, null, null);
			
			List<OrganizationInfoBean> newOrganizationList = new ArrayList<OrganizationInfoBean>();
			for(OrganizationInfoBean bean : organizationList){
				OrganizationInfoBean organizationInfoBean = 
						organizationInfoBeanProxy.selectUnitByOrganizationId(bean.getOrganizationId());
				if(organizationInfoBean.getOrganizationKind()==2||
						organizationInfoBean.getOrganizationKind()==3||organizationInfoBean.getOrganizationKind()==1){					
					newOrganizationList.add(organizationInfoBean);
				}
				
			}
			
			model.addAttribute("tagList", tagList);
			model.addAttribute("organizationList", newOrganizationList);
			model.addAttribute("expShareInfo", expShareInfo);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "weixinPage/experienceSharing/shareExperience";
	}
	/**
	 * 保存操作
	 * @param expShareInfo
	 * @param pageNum
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing/weixin/save")
	public String saveExp(
			@ModelAttribute(value = "expShareInfo") ExpShareInfoBean expShareInfo, 
			@RequestParam(value = "isPreview",required=false) String isPreview,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		try {
			int rst = 0;
			if(expShareInfo.getExpId()==null){
				BigDecimal expId = seq.getNextSeqIdToBigDecimal();
				expShareInfo.setExpId(expId);
				expShareInfo.setAccountId(getCurrentAccountId());
				expShareInfo.setAccountName(getCurrentAccountName());
				expShareInfo.setBrowseCount("0");
				expShareInfo.setBrowseCountEdit("0");
				expShareInfo.setCommentCount("0");
				expShareInfo.setQrCode(createQrcode("experienceSharing/weixin/detail/"+expId,null));
				OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy
						.selectByPrimaryKey(expShareInfo.getUnitId());
				expShareInfo.setExpUnit(organizationInfoBean.getOrganizationName());

				if(organizationInfoBean.getOrganizationKind()==2){
					ParkInfoBean parkInfoBean = parkInfoBeanService
							.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
					expShareInfo.setProvinceName(parkInfoBean.getProvinceName());
					expShareInfo.setAreaName(parkInfoBean.getAreaName());
					expShareInfo.setUnitType((short)0);
				}else if(organizationInfoBean.getOrganizationKind()==3){
					CompanyInfoBean companyInfoBean = companyInfoBeanService
							.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
					expShareInfo.setProvinceName(companyInfoBean.getProvinceName());
					expShareInfo.setAreaName(companyInfoBean.getAreaName());
					expShareInfo.setUnitType((short)1);
				}else if(organizationInfoBean.getOrganizationKind()==1){
					GovernmentInfoBean governmentInfoBean = governmentInfoBeanService.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
					expShareInfo.setProvinceName(governmentInfoBean.getProvinceName());
					expShareInfo.setAreaName(governmentInfoBean.getAreaName());
					expShareInfo.setUnitType((short)2);
				}
				expShareInfo.setCreateTime(new Timestamp(new Date().getTime()));
				if(StrKit.isBlank(isPreview)){
					expShareInfo.setStatus((short) 2);
					rst = expShareInfoService.insert(expShareInfo);
					String str = "提交成功！待审核";
					redirectAttributes.addFlashAttribute("message", str);
				}else{
					expShareInfo.setStatus((short) 3);
					rst = expShareInfoService.insert(expShareInfo);
				}
			}else{//编辑
				ExpShareInfoBean record = expShareInfoService.selectById(expShareInfo.getExpId());
				if(expShareInfo.getUnitId()!=null){
					OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy
							.selectByPrimaryKey(expShareInfo.getUnitId());
					expShareInfo.setExpUnit(organizationInfoBean.getOrganizationName());

					if(organizationInfoBean.getOrganizationKind()==2){
						ParkInfoBean parkInfoBean = parkInfoBeanService
								.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
						expShareInfo.setProvinceName(parkInfoBean.getProvinceName());
						expShareInfo.setAreaName(parkInfoBean.getAreaName());
						expShareInfo.setUnitType((short)0);
					}else if(organizationInfoBean.getOrganizationKind()==3){
						CompanyInfoBean companyInfoBean = companyInfoBeanService
								.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
						expShareInfo.setProvinceName(companyInfoBean.getProvinceName());
						expShareInfo.setAreaName(companyInfoBean.getAreaName());
						expShareInfo.setUnitType((short)1);
					}else if(organizationInfoBean.getOrganizationKind()==1){
						GovernmentInfoBean governmentInfoBean = governmentInfoBeanService.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
						expShareInfo.setProvinceName(governmentInfoBean.getProvinceName());
						expShareInfo.setAreaName(governmentInfoBean.getAreaName());
						expShareInfo.setUnitType((short)2);
					}
				}
				expShareInfo.setCreateTime(new Timestamp(new Date().getTime()));
				if(StrKit.isBlank(isPreview)){
					expShareInfo.setStatus((short) 2);
					MyBeanUtils.copyProperties(expShareInfo, record);
					rst = expShareInfoService.updateById(record);
					String str = "提交成功！待审核";
					redirectAttributes.addFlashAttribute("message", str);
				}else{
					MyBeanUtils.copyProperties(expShareInfo, record);
					rst = expShareInfoService.updateById(record);
				}
			}
			
			if(expShareInfo.getStatus()==2&&rst>0){
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
				String smsContent = "["+platformName+"]您好，"+sdf.format(System.currentTimeMillis())+"，您有一个待审批园区动态，标题【"+expShareInfo.getExpTitle()+"】，请及时处理！ ";
				InvokeInfoBean<BigDecimal> msgRst =  submitThirdSmHelper.validateSubmitContactSimpleSmJob(new BigDecimal(3600009),
						new BigDecimal("201611281649570000002"), new BigDecimal(3600009), new BigDecimal(21), (short) 2, (short) 1, smsContent,
						new Timestamp(System.currentTimeMillis()), null, list, (short) 2, "127.0.0.1",
						(short) 1, new Timestamp(System.currentTimeMillis()));
				
				if(!msgRst.isSuccess()){
					redirectAttributes.addFlashAttribute("message", msgRst.getErrorMsg());
				}
			}
		} catch (Exception ex) {
			logger.error("园区动态保存失败，"+ex.getMessage(),ex);
			return "redirect:/error/404";
		}
		if(!StrKit.isBlank(isPreview)){
			model.addAttribute("expShareInfo",expShareInfo);
			return "redirect:/experienceSharing/weixin/preview?expId="+expShareInfo.getExpId();
		}else{
			return "redirect:/auth/page/mobile/weixin/experienceSharing/weixin/main" ;			
		}
	}
	
	/**
	 * 预览
	 * @param expId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing/weixin/preview")
	public String previewExp(@RequestParam(value = "expId") BigDecimal expId,Model model){
		try{
			ExpShareInfoBean expShareInfo = expShareInfoService.selectById(expId);
			model.addAttribute("expShareInfo",expShareInfo);
		}catch(Exception ex){
			logger.error("获取预览失败，"+ex.getMessage(),ex);
			return "redirect:/error/404";
		}
		return "weixinPage/experienceSharing/sharePreview";
	}
	
	/**
	 * 删除
	 * @param expId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing/weixin/delete")
	public String deleteExp(
			@RequestParam(value = "expId")BigDecimal expId,
			RedirectAttributes redirectAttributes,Model model){
		try {
			int rst = expShareInfoService.deleteById(expId);
			redirectAttributes.addFlashAttribute("message", rst==1?"删除成功！":"删除失败！");
		} catch (Exception ex) {
			logger.error("删除园区动态失败，"+ex.getMessage(),ex);
			return "redirect:/error/404";
		}
		return "redirect:/experienceSharing/weixin/myShare";
	}
	
	/**
	 * -----------------------------------------------------------------
	 *                      通用异步方法
	 * -----------------------------------------------------------------
	 */

	/**
	 * 异步查看列表
	 */
	@RequestMapping(value = "/expShare/json/list", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean list(
			@ModelAttribute(value = "expShareInfo") ExpShareInfoBean expShareInfo, 
			@RequestParam(value = "type") int type,//0:全部 1:我发布的 
			Page<ExpShareInfoBean> page,
			Model model
			){
		ResultBean resultBean = new ResultBean();
		try {
			if(type==1){
				if(getCurrentAccountId()==null){
					resultBean.setCode(-2);
					resultBean.setMsg("亲，您还没有登录");
					return resultBean;
				}
				expShareInfo.setAccountId(getCurrentAccountId());
			}
			expShareInfo.setOrderByClause("IS_TOP DESC,CREATE_TIME DESC");
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ExpShareInfoBean>) expShareInfoService.queryByCond(expShareInfo);


			List<ExpShareInfoBean> list = new ArrayList<ExpShareInfoBean>(); 
			for(ExpShareInfoBean bean : page){
				list.add(bean);
			}
			if(page.getTotal()==0){
				resultBean.setCode(2);
				return resultBean;
			}

			if(page.getTotal()>(page.getPageNum()*page.getPageSize())){
				resultBean.setCode(1);
			}else{
				resultBean.setCode(0);
			}
			resultBean.setValue(list);
			resultBean.setMsg(page.getTotal()+"");
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return resultBean;
	}


	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/expShare/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String delete(
			@RequestParam(value="ids") String ids,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		String str = "";
		try {
			String[] idsStr = ids.split(",");
			for(int i = 0;i<idsStr.length;i++){
				expShareInfoService.deleteById(new BigDecimal(idsStr[i]));
			}
			str = "删除成功！";
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			str = "删除失败！";
		}
		return str;

	}

	/**
	 * -------------------------------------------------------------------
	 *                            接口
	 * -------------------------------------------------------------------
	 */

	/**
	 * 审核
	 * @param inspectBean
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/json/expShare/audit")
	public String audit(@RequestParam(value="expId") BigDecimal expId,
			@RequestParam(value="audit") Short audit,
			@RequestParam(value="isTop") Short isTop,
			@RequestParam(value="topTime",required=false) String topTime,
			ModelMap modelMap){
		try{
			ExpShareInfoBean expShareInfo = expShareInfoService.selectById(expId);
			expShareInfo.setStatus(audit);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			expShareInfo.setIsTop(isTop);
			if(audit==1&&isTop==1){
				expShareInfo.setTopTime(sdf.parse(topTime));
			}
			expShareInfo.setExpId(expId);
			int rst = expShareInfoService.updateById(expShareInfo);
			
			if(rst>0){
				/*发送短信*/
				List<EntryBean<String, String>> list = new ArrayList<>();
				EntryBean<String, String> entryBean = new EntryBean<>();
				AccountInfoBean accountInfoBean = accountInfoBeanProxy.selectByPrimaryKey(expShareInfo.getAccountId());
				if (accountInfoBean != null && StringUtil.checkNotNull(accountInfoBean.getContactPhone())) {
					entryBean.setKey(accountInfoBean.getContactPhone());
					entryBean.setValue(accountInfoBean.getAccountName());
					list.add(entryBean);
					
					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String platformName = expShareInfoService.getPlatformName(new BigDecimal("3600009"));
					String smsContent = "["+platformName+"]"+accountInfoBean.getAccountName()+"您好，"+sdf2.format(System.currentTimeMillis())+"，园区动态标题【"+expShareInfo.getExpTitle()+"】，已审核，可登陆平台或关注“江西工业园区微讯”进行查看。 ";
					InvokeInfoBean<BigDecimal> msgRst =  submitThirdSmHelper.validateSubmitContactSimpleSmJob(new BigDecimal(3600009),
							new BigDecimal("201611281649570000002"), new BigDecimal(3600009), new BigDecimal(21), (short) 2, (short) 1, smsContent,
							new Timestamp(System.currentTimeMillis()), null, list, (short) 2, "127.0.0.1",
							(short) 1, new Timestamp(System.currentTimeMillis()));
					
					if(!msgRst.isSuccess()){
						modelMap.addAttribute("message", msgRst.getErrorMsg());
					}
				}
			}
			
			if(rst > 0 && audit == 1){
				rst = expShareInfoService.syncExpInfoData(expId);
			}
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "审核成功!");
		}catch(Exception e){
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "审核失败！");
		}
		return "jsonView";

	}
	/**
	 * 获取详情
	 * @param inspectBean
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/json/expShare/view")
	public String jsonView(@RequestParam(value="expId") BigDecimal expId,
			ModelMap modelMap){
		try{
			ExpShareInfoBean expShareInfo = expShareInfoService.selectById(expId);
			
			if(expShareInfo.getStatus()==1){
				//增加浏览量总数
				Integer count = Integer.parseInt(expShareInfo.getBrowseCount())+1;
				expShareInfo.setBrowseCount(count.toString());
				Integer count2 = Integer.parseInt(expShareInfo.getBrowseCountEdit())+1;
				expShareInfo.setBrowseCountEdit(count2.toString());
				expShareInfoService.updateById(expShareInfo);
			}
			//增加浏览日志
			BrowseLogMainBean browseLogMainBean = new BrowseLogMainBean();
			browseLogMainBean.setId(seq.getNextSeqIdToBigDecimal());
			browseLogMainBean.setAccountId(getCurrentAccountId());
			browseLogMainBean.setRelatedId(expId);
			browseLogMainBean.setSource("t_exp_share_info");
			browseLogMainBean.setCreateTime(new Timestamp(new Date().getTime()));
			browseLogMainService.insert(browseLogMainBean);
			
			modelMap.addAttribute("value", expShareInfo);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取详情成功!");
		}catch(Exception e){
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取详情失败！");
		}
		return "jsonView";

	}
	/**
	 * 获取列表
	 * @param inspectBean
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/json/expShare/list")
	public String jsonList(@ModelAttribute(value = "expShareInfo") ExpShareInfoBean expShareInfo, 
			@RequestParam(value="type") int type, //0:待审核1:已审核 2:所有动态 3:我的动态
			Page<ExpShareInfoBean> page,
			ModelMap modelMap){
		try{

			expShareInfo.setOrderByClause("CREATE_TIME DESC");
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			if(type==0){
				expShareInfo.setStatus((short) 2);
				page = (Page<ExpShareInfoBean>) expShareInfoService.queryByCond(expShareInfo);
			}else if(type==1){
				page = (Page<ExpShareInfoBean>) expShareInfoService.queryAuditedList(expShareInfo);
			}else if(type==2){
				expShareInfo.setStatus((short) 1);
				page = (Page<ExpShareInfoBean>) expShareInfoService.queryByCond(expShareInfo);
			}else{
				page = (Page<ExpShareInfoBean>) expShareInfoService.queryByCond(expShareInfo);
			}
			modelMap.addAttribute("value", page.getResult());
			modelMap.addAttribute("total", page.getTotal());
			modelMap.addAttribute("pages", page.getPages());
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取列表成功!");
		}catch(Exception e){
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取列表失败！");
		}
		return "jsonView";

	}
	/**
	 * 获取标签
	 * @param inspectBean
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/json/expShare/tagList")
	public String jsonTag(ModelMap modelMap,HttpServletRequest request,HttpServletResponse response){
		try{

			response.addHeader("Access-Control-Allow-Origin", request.getHeader("Origin"));
            response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			ProjectActivityTagBean projectActivityTagBean = new ProjectActivityTagBean();
			projectActivityTagBean.setKind(202);
			projectActivityTagBean.setStatus((short) 1);
			projectActivityTagBean.setOrderByClause("SORT_GRADE ASC");
			List<ProjectActivityTagBean> list = projectActivityTagService.queryByCond(projectActivityTagBean);
			modelMap.addAttribute("value", list);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取标签成功!");
		}catch(Exception e){
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取标签失败！");
		}
		return "jsonView";

	}
	/**
	 * 保存
	 * @param inspectBean
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/json/expShare/expBc")
	public String jsonSave(
			@RequestParam(value="expTitle") String expTitle,
			@RequestParam(value="unitId") BigDecimal unitId,
			@RequestParam(value="expImage") String expImage,
			@RequestParam(value="imageId") BigDecimal imageId,
			@RequestParam(value="expLabel") String expLabel,
			@RequestParam(value="expText") String expText,
			@RequestParam(value="expAttachment",required=false) String expAttachment,
			@RequestParam(value="attachmentId",required=false) String attachmentId,
			@RequestParam(value="accountId") BigDecimal accountId,
			@RequestParam(value="accountName") String accountName,
			@RequestParam(value="unitType") Short unitType,
			ModelMap modelMap,HttpServletRequest request,HttpServletResponse response){
		try{
			
			response.addHeader("Access-Control-Allow-Origin", request.getHeader("Origin"));
            response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			ExpShareInfoBean expShareInfo = new ExpShareInfoBean();
			expShareInfo.setExpId(seq.getNextSeqIdToBigDecimal());
			expShareInfo.setBrowseCount("0");
			expShareInfo.setBrowseCountEdit("0");
			expShareInfo.setCommentCount("0");
			expShareInfo.setCreateTime(new Timestamp(new Date().getTime()));
			expShareInfo.setExpTitle(expTitle);
			expShareInfo.setUnitId(unitId);
			expShareInfo.setExpImage(expImage);
			expShareInfo.setImageId(imageId);
			expShareInfo.setExpLabel(expLabel);
			expShareInfo.setExpText(expText);
			expShareInfo.setExpAttachment(expAttachment);
			expShareInfo.setAttachmentId(attachmentId);
			expShareInfo.setAccountId(accountId);
			expShareInfo.setAccountName(accountName);
			expShareInfo.setUnitType(unitType);
			OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy
					.selectByPrimaryKey(expShareInfo.getUnitId());
			expShareInfo.setExpUnit(organizationInfoBean.getOrganizationName());

			if(organizationInfoBean.getOrganizationKind()==2){
				ParkInfoBean parkInfoBean = parkInfoBeanService
						.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
				expShareInfo.setProvinceName(parkInfoBean.getProvinceName());
				expShareInfo.setAreaName(parkInfoBean.getAreaName());
				expShareInfo.setUnitType((short)0);
			}else if(organizationInfoBean.getOrganizationKind()==3){
				CompanyInfoBean companyInfoBean = companyInfoBeanService
						.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
				expShareInfo.setProvinceName(companyInfoBean.getProvinceName());
				expShareInfo.setAreaName(companyInfoBean.getAreaName());
				expShareInfo.setUnitType((short)1);
			}else if(organizationInfoBean.getOrganizationKind()==1){
				GovernmentInfoBean governmentInfoBean = governmentInfoBeanService.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
				expShareInfo.setProvinceName(governmentInfoBean.getProvinceName());
				expShareInfo.setAreaName(governmentInfoBean.getAreaName());
				expShareInfo.setUnitType((short)2);
			}
			expShareInfo.setQrCode(createQrcode("experienceSharing/weixin/detail/"+expShareInfo.getExpId(),null));
			expShareInfo.setStatus((short) 2);
			int rst = expShareInfoService.insert(expShareInfo);
			
			if(expShareInfo.getStatus()==2&&rst>0){
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
				String smsContent = "["+platformName+"]您好，"+sdf.format(System.currentTimeMillis())+"，您有一个待审批园区动态，标题【"+expShareInfo.getExpTitle()+"】，请及时处理！ ";
				InvokeInfoBean<BigDecimal> msgRst =  submitThirdSmHelper.validateSubmitContactSimpleSmJob(new BigDecimal(3600009),
						new BigDecimal("201611281649570000002"), new BigDecimal(3600009), new BigDecimal(21), (short) 2, (short) 1, smsContent,
						new Timestamp(System.currentTimeMillis()), null, list, (short) 2, "127.0.0.1",
						(short) 1, new Timestamp(System.currentTimeMillis()));
				
				if(!msgRst.isSuccess()){
					modelMap.addAttribute("message", msgRst.getErrorMsg());
				}
			}
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "保存成功!");
			modelMap.addAttribute("expId", expShareInfo.getExpId());
		}catch(Exception e){
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "保存失败！");
		}
		return "jsonView";

	}

	/**
	 * 更新
	 * @param inspectBean
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/json/expShare/update")
	public String jsonUpdate(
			@RequestParam(value="expId",required = true) BigDecimal expId,
			@RequestParam(value="expTitle") String expTitle,
			@RequestParam(value="unitId") BigDecimal unitId,
			@RequestParam(value="expImage") String expImage,
			@RequestParam(value="imageId") BigDecimal imageId,
			@RequestParam(value="expLabel") String expLabel,
			@RequestParam(value="expText") String expText,
			@RequestParam(value="expAttachment" , required = false) String expAttachment,
			@RequestParam(value="attachmentId" , required = false) String attachmentId,
			@RequestParam(value="accountId") BigDecimal accountId,
			@RequestParam(value="accountName") String accountName,
			@RequestParam(value="unitType") Short unitType,
			ModelMap modelMap,HttpServletRequest request,HttpServletResponse response){
		try{
			
			response.addHeader("Access-Control-Allow-Origin", request.getHeader("Origin"));
            response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			ExpShareInfoBean expShareInfo = expShareInfoService.selectById(expId);
			expShareInfo.setExpTitle(expTitle);
			expShareInfo.setUnitId(unitId);
			expShareInfo.setExpImage(expImage);
			expShareInfo.setImageId(imageId);
			expShareInfo.setExpLabel(expLabel);
			expShareInfo.setExpText(expText);
			expShareInfo.setExpAttachment(expAttachment);
			expShareInfo.setAttachmentId(attachmentId);
			expShareInfo.setAccountId(accountId);
			expShareInfo.setAccountName(accountName);
			expShareInfo.setUnitType(unitType);
			OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy
					.selectByPrimaryKey(expShareInfo.getUnitId());
			expShareInfo.setExpUnit(organizationInfoBean.getOrganizationName());

			if(organizationInfoBean.getOrganizationKind()==2){
				ParkInfoBean parkInfoBean = parkInfoBeanService
						.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
				expShareInfo.setProvinceName(parkInfoBean.getProvinceName());
				expShareInfo.setAreaName(parkInfoBean.getAreaName());
				expShareInfo.setUnitType((short)0);
			}else if(organizationInfoBean.getOrganizationKind()==3){
				CompanyInfoBean companyInfoBean = companyInfoBeanService
						.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
				expShareInfo.setProvinceName(companyInfoBean.getProvinceName());
				expShareInfo.setAreaName(companyInfoBean.getAreaName());
				expShareInfo.setUnitType((short)1);
			}else if(organizationInfoBean.getOrganizationKind()==1){
				GovernmentInfoBean governmentInfoBean = governmentInfoBeanService.selectByPrimaryKey(organizationInfoBean.getOrganizationId());
				expShareInfo.setProvinceName(governmentInfoBean.getProvinceName());
				expShareInfo.setAreaName(governmentInfoBean.getAreaName());
				expShareInfo.setUnitType((short)2);
			}
			expShareInfo.setQrCode(createQrcode("experienceSharing/weixin/detail/"+expId,null));
			expShareInfoService.updateById(expShareInfo);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "保存成功!");
		}catch(Exception e){
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "保存失败！");
		}
		return "jsonView";

	}
	/**
	 * 更新阅读量BrowseCountEdit
	 * @param inspectBean
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/json/expShare/updateBrowseCountEdit")
	public String jsonUpdateBrowseCountEdit(
			@RequestParam(value="expId",required = true) BigDecimal expId,
			@RequestParam(value="browseCountEdit") String browseCountEdit,
			ModelMap modelMap){
		try{
			ExpShareInfoBean expShareInfo = expShareInfoService.selectById(expId);
			expShareInfo.setBrowseCountEdit(browseCountEdit);
			int rst = expShareInfoService.updateById(expShareInfo);
			if (rst>0) {
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "保存成功!");
			}else{
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", -1);
				modelMap.addAttribute("errorMsg", "保存失败！");
			}
		}catch(Exception e){
		}
		return "jsonView";

	}
	
	/**
	 * 根据查询条件获取园区动态列表
	 * @param orderType
	 * @param startTime
	 * @param endTime
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/json/expShare/orderList")
	public String getExpShartList(
			@RequestParam(value="orderType",defaultValue = " browse_count ") String orderType,
			@RequestParam(value="startTime",required = false) String startTime,
			@RequestParam(value="endTime",required = false) String endTime,
			@RequestParam(value="provinceName",required = false) String provinceName,
			@RequestParam(value="resultType") String resultType,
			Page<ExpShareInfoBean> page, ModelMap modelMap){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			ExpShareInfoBean expShareInfoBean = new ExpShareInfoBean();
			if(StringUtil.checkNotNull(orderType)){	
				expShareInfoBean.setOrderByClause(" to_number( "+ orderType + " ) desc");
			}else{
				expShareInfoBean.setOrderByClause(" create_time desc");
			}
			if(StringUtil.checkNotNull(startTime)){				
				expShareInfoBean.setStartTime(new Timestamp(sdf.parse(startTime+" 00:00:00").getTime()));
			}
			if(StringUtil.checkNotNull(endTime)){				
				expShareInfoBean.setEndTime(new Timestamp(sdf.parse(endTime+" 23:59:59").getTime()));
			}
			expShareInfoBean.setProvinceName(provinceName);
			expShareInfoBean.setStatus((short)1);
			
			if("1".equals(resultType)){
				PageHelper.startPage(page.getPageNum(), page.getPageSize());
				page = (Page<ExpShareInfoBean>)expShareInfoService.queryOrderList(expShareInfoBean);
				modelMap.addAttribute("pages", page.getPages());
				modelMap.addAttribute("total", page.getTotal());
				modelMap.addAttribute("value", page.getResult());
			}else{
				List<ExpShareInfoBean> list = expShareInfoService.queryOrderList(expShareInfoBean);
				modelMap.addAttribute("value", list);
			}
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取列表成功!");

		}catch(Exception e){
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取列表失败！");
		}
		return "jsonView";
	}
	
	
	@RequestMapping(value = "/json/expShare/sc")
	public String jsonDelete(
			@RequestParam(value = "ids")String ids,
			RedirectAttributes redirectAttributes,Model model,
			 ModelMap modelMap,HttpServletRequest request,HttpServletResponse response){
		try {

			response.addHeader("Access-Control-Allow-Origin", request.getHeader("Origin"));
            response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(ids!=null && ids!=""){
				String[] idsStr = ids.split(",");
				for(int i=0;i<idsStr.length;i++){
					expShareInfoService.deleteById(new BigDecimal(idsStr[i]));
				}
			}
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "删除成功!");
		} catch (Exception ex) {
			logger.error("删除园区动态失败，"+ex.getMessage(),ex);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "删除列表失败！");
		}
		return "jsonView";
	}

	/**
	 * -------------------------------------------------------------------
	 *                           共用方法
	 * -------------------------------------------------------------------
	 */
	/**
	 * 获取标签列表
	 * @return
	 */
	private List<ProjectActivityTagBean> getTags(){
		List<ProjectActivityTagBean> list = null;
		try{
			ProjectActivityTagBean projectActivityTagBean = new ProjectActivityTagBean();
			projectActivityTagBean.setStatus((short) 1);
			projectActivityTagBean.setKind(202);
			projectActivityTagBean.setOrderByClause("SORT_GRADE ASC");
			list = projectActivityTagService.queryByCond(projectActivityTagBean);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
		return list;
	}

}