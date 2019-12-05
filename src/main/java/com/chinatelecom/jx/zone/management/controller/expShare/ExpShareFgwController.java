package com.chinatelecom.jx.zone.management.controller.expShare;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chinatelecom.jx.zone.company.info.bean.CompanyInfoBean;
import com.chinatelecom.jx.zone.company.info.service.ICompanyInfoBeanService;
import com.chinatelecom.jx.zone.government.info.bean.GovernmentInfoBean;
import com.chinatelecom.jx.zone.government.info.service.IGovernmentInfoBeanService;
import com.chinatelecom.jx.zone.management.bean.expBrowse.ExpBrowseLogBean;
import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareInfoBean;
import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareLabelBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityTagBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.expBrowse.IExpBrowseLogService;
import com.chinatelecom.jx.zone.management.service.expShare.IExpShareInfoService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityTagService;
import com.chinatelecom.jx.zone.management.util.MyBeanUtils;
import com.chinatelecom.jx.zone.organization.info.bean.OrganizationInfoBean;
import com.chinatelecom.jx.zone.organization.info.proxy.IOrganizationInfoBeanProxy;
import com.chinatelecom.jx.zone.park.info.bean.ParkInfoBean;
import com.chinatelecom.jx.zone.park.info.service.IParkInfoBeanService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jfinal.kit.StrKit;

@Controller
public class ExpShareFgwController extends BaseController{
	
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
	
	/**
	 * 园区动态首页
	 * @return
	 */
	@RequestMapping(value = "/auth/page/mobile/weixin/experienceSharing_fgw/weixin/main")
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
		return "weixinPage/experienceSharing_fgw/main";
	}

	/**
	 * 我的列表
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing_fgw/weixin/myShare")
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
		return "weixinPage/experienceSharing_fgw/myShare";
	}

	/**
	 * 我的列表登录跳转
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing_fgw/weixin/myShare/add")
	public String myShareLogin(
			@ModelAttribute("expShareInfo") ExpShareInfoBean expShareInfo, 
			@ModelAttribute("page") Page<ExpShareInfoBean> page, Model model){
		return "redirect:/experienceSharing_fgw/weixin/myShare";
	}
	
	/**
	 * 登录重定向到详情
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing_fgw/weixin/add/detail/{expId}")
	public String addDetail(
			@PathVariable(value = "expId")BigDecimal expId, Model model){
		return "redirect:/experienceSharing_fgw/weixin/detail/"+expId;
	}
	
	
	/**
	 * 详情 wiexin
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing_fgw/weixin/detail/{expId}")
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
			if(expShareInfo.getAccountId()!=getCurrentAccountId() || getCurrentAccountId()==null){
				//增加浏览量总数
				Integer count = Integer.parseInt(expShareInfo.getBrowseCount())+1;
				expShareInfo.setBrowseCount(count.toString());
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
			}
			model.addAttribute("curAccountId",getCurrentAccountId());
			model.addAttribute("isCurrentAccount",isCurrentAccount);
			model.addAttribute("expShareInfo",expShareInfo);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "weixinPage/experienceSharing_fgw/experienceDetails";
	}
	
	/**
	 * 详情登录跳转
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing_fgw/weixin/detail/add/{expId}")
	public String detailLogin(
			@PathVariable(value = "expId") String expId,
			Model model, ServletRequest request) {
		return "redirect:/experienceSharing_fgw/weixin/detail/"+expId+"?main=1";
	}
	
	
	/**
	 * 新增 
	 * @param expId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing_fgw/weixin/add")
	public String createExp(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
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
		return "weixinPage/experienceSharing_fgw/shareExperience";
	} 

	/**
	 * 编辑
	 * @param expId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing_fgw/weixin/edit")
	public String createExp(
			@RequestParam(value = "expId" ) BigDecimal expId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
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
		return "weixinPage/experienceSharing_fgw/shareExperience";
	}
	/**
	 * 保存操作
	 * @param expShareInfo
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing_fgw/weixin/save")
	public String saveExp(
			@ModelAttribute(value = "expShareInfo") ExpShareInfoBean expShareInfo, 
			@RequestParam(value = "isPreview",required=false) String isPreview,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		try {
			if(expShareInfo.getExpId()==null){
				BigDecimal expId = seq.getNextSeqIdToBigDecimal();
				expShareInfo.setExpId(expId);
				expShareInfo.setAccountId(getCurrentAccountId());
				expShareInfo.setAccountName(getCurrentAccountName());
				expShareInfo.setBrowseCount("0");
				expShareInfo.setCommentCount("0");
				expShareInfo.setQrCode(createQrcode("experienceSharing_fgw/weixin/detail/"+expId,null));
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
					expShareInfoService.insert(expShareInfo);
					String str = "提交成功！待审核";
					redirectAttributes.addFlashAttribute("message", str);
				}else{
					expShareInfo.setStatus((short) 3);
					expShareInfoService.insert(expShareInfo);
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
					expShareInfoService.updateById(record);
					String str = "提交成功！待审核";
					redirectAttributes.addFlashAttribute("message", str);
				}else{
					MyBeanUtils.copyProperties(expShareInfo, record);
					expShareInfoService.updateById(record);
				}
			}
		} catch (Exception ex) {
			logger.error("园区动态保存失败，"+ex.getMessage(),ex);
			return "redirect:/error/404";
		}
		if(!StrKit.isBlank(isPreview)){
			model.addAttribute("expShareInfo",expShareInfo);
			return "redirect:/experienceSharing_fgw/weixin/preview?expId="+expShareInfo.getExpId();
		}else{
			return "redirect:/auth/page/mobile/weixin/experienceSharing_fgw/weixin/main" ;			
		}
	}
	
	/**
	 * 预览
	 * @param expId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing_fgw/weixin/preview")
	public String previewExp(@RequestParam(value = "expId") BigDecimal expId,Model model){
		try{
			ExpShareInfoBean expShareInfo = expShareInfoService.selectById(expId);
			model.addAttribute("expShareInfo",expShareInfo);
		}catch(Exception ex){
			logger.error("获取预览失败，"+ex.getMessage(),ex);
			return "redirect:/error/404";
		}
		return "weixinPage/experienceSharing_fgw/sharePreview";
	}
	
	/**
	 * 删除
	 * @param expId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/experienceSharing_fgw/weixin/delete")
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
		return "redirect:/experienceSharing_fgw/weixin/myShare";
	}
	
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
