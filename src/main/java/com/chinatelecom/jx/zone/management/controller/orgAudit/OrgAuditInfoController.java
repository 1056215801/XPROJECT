
package com.chinatelecom.jx.zone.management.controller.orgAudit;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;



import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.bean.orgAudit.OrgAuditInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareInfoBean;
import com.chinatelecom.jx.zone.management.service.orgAudit.IOrgAuditInfoService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareInfoService;
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanLookup;

@Controller
//@RequestMapping(value = "/orgauditinfo")
public class OrgAuditInfoController extends BaseController {
	@Autowired
	private IOrgAuditInfoService orgAuditInfoService;
	@Autowired
	private IProjectDeclareInfoService projectDeclareInfoService;
	
	
	private static final Logger logger = LoggerFactory
			.getLogger(OrgAuditInfoController.class);
 
	/**
	 * 列表
	 * @param orgAuditInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/orgAuditInfo/list")
	public String list(@ModelAttribute("orgAuditInfo") OrgAuditInfoBean orgAuditInfo, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<OrgAuditInfoBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<OrgAuditInfoBean>)orgAuditInfoService.queryByCond(null);
		setPageInfo(page, model, "orgAuditInfo/list");
		model.addAttribute("searchKey", searchKey);
		return "orgAuditInfo/list";
	}
	
	/**
	 * 新增 
	 * @param orgId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/orgAuditInfo/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 OrgAuditInfoBean  orgAuditInfo = new OrgAuditInfoBean();
			/* 初始化
			orgAuditInfo.setOrgId(value);//主键
			orgAuditInfo.setOrgName(value);//组织名称
			orgAuditInfo.setOrgKind(value);//组织类型，枚举值：0：政府 1：园区 2：企业
			orgAuditInfo.setParentId(value);//上级组织id，外键，关联表t_org_audit_info
			orgAuditInfo.setParentName(value);//上级组织名称
			orgAuditInfo.setParentKind(value);//上级组织类型，枚举值：0：政府 1：园区 2：企业
			orgAuditInfo.setSortGrade(value);//排序等级，越大越靠后
			orgAuditInfo.setRemark(value);//备注
			orgAuditInfo.setStatus(value);//状态，枚举值：0：注销 1：有效
			orgAuditInfo.setCreateTime(value);//创建时间
			*/
		 
	  model.addAttribute("orgAuditInfo", orgAuditInfo);
	  model.addAttribute("pageNo", pageNo);
	  return "orgAuditInfo/edit";
	} 
	/**
	 * 编辑
	 * @param orgId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/orgAuditInfo/edit/{id}")
	public String create(
			@PathVariable(value = "orgId" ) BigDecimal orgId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   OrgAuditInfoBean orgAuditInfo = orgAuditInfoService.selectById(orgId);
		 
	  model.addAttribute("orgAuditInfo", orgAuditInfo);
	  model.addAttribute("pageNo", pageNo);
	  return "orgAuditInfo/edit";
	}
	
	/**
	 * 保存操作
	 * @param orgAuditInfo
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/orgAuditInfo/save")
	public String save(
			@ModelAttribute(value = "orgAuditInfo") OrgAuditInfoBean orgAuditInfo, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(orgAuditInfo.getOrgId()==null){
			/*  
			orgAuditInfo.setOrgId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键
			orgAuditInfo.setOrgName(value);//组织名称
			orgAuditInfo.setOrgKind(value);//组织类型，枚举值：0：政府 1：园区 2：企业
			orgAuditInfo.setParentId(value);//上级组织id，外键，关联表t_org_audit_info
			orgAuditInfo.setParentName(value);//上级组织名称
			orgAuditInfo.setParentKind(value);//上级组织类型，枚举值：0：政府 1：园区 2：企业
			orgAuditInfo.setSortGrade(value);//排序等级，越大越靠后
			orgAuditInfo.setRemark(value);//备注
			orgAuditInfo.setStatus(value);//状态，枚举值：0：注销 1：有效
			orgAuditInfo.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			orgAuditInfoService.insert(orgAuditInfo);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			orgAuditInfo.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			orgAuditInfoService.updateById(orgAuditInfo);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/orgAuditInfo/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param orgId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/orgAuditInfo/view/{id}")
	public String view(
			@PathVariable(value = "orgId") BigDecimal orgId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		OrgAuditInfoBean orgAuditInfo = orgAuditInfoService.selectById(orgId);
		model.addAttribute("orgAuditInfo",orgAuditInfo);
		model.addAttribute("pageNo", pageNo);
		return "orgAuditInfo/view";
	}

	
	
	
	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/orgAuditInfo/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = orgAuditInfoService.batchDelete(items);
		int i=  orgAuditInfoService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/orgAuditInfo/list";
	}
	
	/**
	 * ---------------------------------------------------------------------
	 *                            接口
	 * ---------------------------------------------------------------------
	 */
	
	/**
	 * 获取下级单位
	 * @param orgAuditExample
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/json/orgAuditInfo/getChildOrg")
	public String getChildOrg(@ModelAttribute("orgAuditInfoBean") OrgAuditInfoBean orgAuditInfoBean, 
			@RequestParam(value="declareOpen") Short declareOpen,
			ModelMap modelMap) {
		try {
			List<OrgAuditInfoBean> list = new ArrayList<OrgAuditInfoBean>();
			if(declareOpen==1){
				list = orgAuditInfoService.queryByCond(orgAuditInfoBean);
			}else{
				list = orgAuditInfoService.queryByChildOrg(orgAuditInfoBean);
			}
			modelMap.addAttribute("value", list);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取列表成功!");
		} catch (Exception e) {
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取列表失败！");
		}
	
		return "jsonView";
	}
	
	/**
	 * 获取下级单位
	 * @param orgAuditExample
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/json/orgAuditInfo/getOrg")
	public String getOrg(@ModelAttribute("orgAuditInfoBean") OrgAuditInfoBean orgAuditInfoBean, 
			ModelMap modelMap) {
		try {
			List<OrgAuditInfoBean> list = orgAuditInfoService.queryByCond(orgAuditInfoBean);
			modelMap.addAttribute("value", list);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取列表成功!");
		} catch (Exception e) {
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取列表失败！");
		}
		
		return "jsonView";
	}
	/**
	 * 获取单位详情
	 * @param orgAuditExample
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/json/orgAuditInfo/getOrgInfo")
	public String getOrgInfo(@RequestParam(value="orgId") BigDecimal orgId,
			ModelMap modelMap) {
		try {
			OrgAuditInfoBean bean = orgAuditInfoService.selectById(orgId);
			modelMap.addAttribute("value", bean);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取详情成功!");
		} catch (Exception e) {
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取详情失败！");
		}
		
		return "jsonView";
	}
	
	
}