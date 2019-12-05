
package com.chinatelecom.jx.zone.management.controller.projectDeclarePoster;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.sql.Timestamp;
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
import com.chinatelecom.jx.zone.management.bean.projectDeclarePoster.ProjectDeclarePosterBean;
import com.chinatelecom.jx.zone.management.service.projectDeclarePoster.IProjectDeclarePosterService;

@Controller
//@RequestMapping(value = "/projectdeclareposter")
public class ProjectDeclarePosterController extends BaseController {
	@Autowired
	private IProjectDeclarePosterService projectDeclarePosterService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(ProjectDeclarePosterController.class);
 
	/**
	 * 列表
	 * @param projectDeclarePoster
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePoster/list")
	public String list(@ModelAttribute("projectDeclarePoster") ProjectDeclarePosterBean projectDeclarePoster, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<ProjectDeclarePosterBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<ProjectDeclarePosterBean>)projectDeclarePosterService.queryByCond(null);
		setPageInfo(page, model, "projectDeclarePoster/list");
		model.addAttribute("searchKey", searchKey);
		return "projectDeclarePoster/list";
	}
	
	/**
	 * 新增 
	 * @param posterId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePoster/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 ProjectDeclarePosterBean  projectDeclarePoster = new ProjectDeclarePosterBean();
			/* 初始化
			projectDeclarePoster.setPosterId(value);//海报Id,主键
			projectDeclarePoster.setAttachmentId(value);//海报附件Id
			projectDeclarePoster.setAttachmentUrl(value);//海报附件URL
			projectDeclarePoster.setAccountId(value);//上传用户Id
			projectDeclarePoster.setAccountName(value);//上传用户名称
			projectDeclarePoster.setOrganizationId(value);//组织ID
			projectDeclarePoster.setOrganizationName(value);//组织名称
			projectDeclarePoster.setRootId(value);//单位ID
			projectDeclarePoster.setRootName(value);//单位名称
			projectDeclarePoster.setParkId(value);//园区ID
			projectDeclarePoster.setParkName(value);//园区名称
			projectDeclarePoster.setAreaId(value);//地区Id
			projectDeclarePoster.setAreaName(value);//地区名称
			projectDeclarePoster.setCreateTime(value);//创建时间
			projectDeclarePoster.setSortGrade(value);//序号
			*/
		 
	  model.addAttribute("projectDeclarePoster", projectDeclarePoster);
	  model.addAttribute("pageNo", pageNo);
	  return "projectDeclarePoster/edit";
	} 
	/**
	 * 编辑
	 * @param posterId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePoster/edit/{id}")
	public String create(
			@PathVariable(value = "id" ) BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   ProjectDeclarePosterBean projectDeclarePoster = projectDeclarePosterService.selectById(id);
		 
	  model.addAttribute("projectDeclarePoster", projectDeclarePoster);
	  model.addAttribute("pageNo", pageNo);
	  return "projectDeclarePoster/edit";
	}
	
	/**
	 * 保存操作
	 * @param projectDeclarePoster
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePoster/save")
	public String save(
			@ModelAttribute(value = "projectDeclarePoster") ProjectDeclarePosterBean projectDeclarePoster, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(projectDeclarePoster.getPosterId()==null){
			/*  
			projectDeclarePoster.setPosterId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//海报Id,主键
			projectDeclarePoster.setAttachmentId(value);//海报附件Id
			projectDeclarePoster.setAttachmentUrl(value);//海报附件URL
			projectDeclarePoster.setAccountId(value);//上传用户Id
			projectDeclarePoster.setAccountName(value);//上传用户名称
			projectDeclarePoster.setOrganizationId(value);//组织ID
			projectDeclarePoster.setOrganizationName(value);//组织名称
			projectDeclarePoster.setRootId(value);//单位ID
			projectDeclarePoster.setRootName(value);//单位名称
			projectDeclarePoster.setParkId(value);//园区ID
			projectDeclarePoster.setParkName(value);//园区名称
			projectDeclarePoster.setAreaId(value);//地区Id
			projectDeclarePoster.setAreaName(value);//地区名称
			projectDeclarePoster.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			projectDeclarePoster.setSortGrade(value);//序号
			*/
			projectDeclarePosterService.insert(projectDeclarePoster);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			projectDeclarePoster.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			projectDeclarePosterService.updateById(projectDeclarePoster);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/projectDeclarePoster/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param posterId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePoster/view/{id}")
	public String view(
			@PathVariable(value = "id") BigDecimal  id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		ProjectDeclarePosterBean projectDeclarePoster = projectDeclarePosterService.selectById(id);
		model.addAttribute("projectDeclarePoster",projectDeclarePoster);
		model.addAttribute("pageNo", pageNo);
		return "projectDeclarePoster/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePoster/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = projectDeclarePosterService.batchDelete(items);
		int i=  projectDeclarePosterService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/projectDeclarePoster/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePoster//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "projectDeclarePoster") ProjectDeclarePosterBean projectDeclarePoster, 
			HttpServletRequest request ) {
		String str =null;
		if(projectDeclarePoster.getPosterId()==null){
			/*
			projectDeclarePoster.setPosterId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//海报Id,主键
			projectDeclarePoster.setAttachmentId(value);//海报附件Id
			projectDeclarePoster.setAttachmentUrl(value);//海报附件URL
			projectDeclarePoster.setAccountId(value);//上传用户Id
			projectDeclarePoster.setAccountName(value);//上传用户名称
			projectDeclarePoster.setOrganizationId(value);//组织ID
			projectDeclarePoster.setOrganizationName(value);//组织名称
			projectDeclarePoster.setRootId(value);//单位ID
			projectDeclarePoster.setRootName(value);//单位名称
			projectDeclarePoster.setParkId(value);//园区ID
			projectDeclarePoster.setParkName(value);//园区名称
			projectDeclarePoster.setAreaId(value);//地区Id
			projectDeclarePoster.setAreaName(value);//地区名称
			projectDeclarePoster.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			projectDeclarePoster.setSortGrade(value);//序号
			*/
			projectDeclarePosterService.insert(projectDeclarePoster);
			
			  str = "创建成功！";
		}else{//编辑
			projectDeclarePoster.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			projectDeclarePosterService.updateById(projectDeclarePoster);
			  str = "保存成功！";
			}
	 return str ;
	}
	/**
	 * json删除 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePoster/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = projectDeclarePosterService.batchDelete(items);
		if(i > 0){
			msg="删除成功！" ;
		}else{
			msg="删除失败！" ;
		}
	  return msg ;
	} 
	/**
	 * json查看
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePoster/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProjectDeclarePosterBean jsonSave(
			@RequestParam(value = "posterId") BigDecimal posterId,
			HttpServletRequest request ) {
		    ProjectDeclarePosterBean projectDeclarePoster = projectDeclarePosterService.selectById(posterId);
	  return  projectDeclarePoster ;
	} 
	
}