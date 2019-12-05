
package com.chinatelecom.jx.zone.management.controller.projectDeclare;

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
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareOrgBean;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareOrgService;

@Controller
//@RequestMapping(value = "/projectdeclareorg")
public class ProjectDeclareOrgController extends BaseController {
	@Autowired
	private IProjectDeclareOrgService projectDeclareOrgService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(ProjectDeclareOrgController.class);
 
	/**
	 * 列表
	 * @param projectDeclareOrg
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareOrg/list")
	public String list(@ModelAttribute("projectDeclareOrg") ProjectDeclareOrgBean projectDeclareOrg, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<ProjectDeclareOrgBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<ProjectDeclareOrgBean>)projectDeclareOrgService.queryByCond(null);
		setPageInfo(page, model, "projectDeclareOrg/list");
		model.addAttribute("searchKey", searchKey);
		return "projectDeclareOrg/list";
	}
	
	/**
	 * 新增 
	 * @param relatedId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareOrg/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 ProjectDeclareOrgBean  projectDeclareOrg = new ProjectDeclareOrgBean();
			/* 初始化
			projectDeclareOrg.setRelatedId(value);//主键
			projectDeclareOrg.setDeclareId(value);//外键，关联表t_project_declare_info
			projectDeclareOrg.setOrgId(value);//组织id
			projectDeclareOrg.setOrgName(value);//组织名称
			projectDeclareOrg.setRemark(value);//备注
			projectDeclareOrg.setCreateTime(value);//创建时间
			*/
		 
	  model.addAttribute("projectDeclareOrg", projectDeclareOrg);
	  model.addAttribute("pageNo", pageNo);
	  return "projectDeclareOrg/edit";
	} 
	/**
	 * 编辑
	 * @param relatedId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareOrg/edit/{id}")
	public String create(
			@PathVariable(value = "relatedId" ) BigDecimal relatedId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   ProjectDeclareOrgBean projectDeclareOrg = projectDeclareOrgService.selectById(relatedId);
		 
	  model.addAttribute("projectDeclareOrg", projectDeclareOrg);
	  model.addAttribute("pageNo", pageNo);
	  return "projectDeclareOrg/edit";
	}
	
	/**
	 * 保存操作
	 * @param projectDeclareOrg
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareOrg/save")
	public String save(
			@ModelAttribute(value = "projectDeclareOrg") ProjectDeclareOrgBean projectDeclareOrg, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(projectDeclareOrg.getRelatedId()==null){
			/*  
			projectDeclareOrg.setRelatedId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键
			projectDeclareOrg.setDeclareId(value);//外键，关联表t_project_declare_info
			projectDeclareOrg.setOrgId(value);//组织id
			projectDeclareOrg.setOrgName(value);//组织名称
			projectDeclareOrg.setRemark(value);//备注
			projectDeclareOrg.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			projectDeclareOrgService.insert(projectDeclareOrg);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			projectDeclareOrg.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			projectDeclareOrgService.updateById(projectDeclareOrg);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/projectDeclareOrg/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param relatedId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareOrg/view/{id}")
	public String view(
			@PathVariable(value = "relatedId") BigDecimal relatedId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		ProjectDeclareOrgBean projectDeclareOrg = projectDeclareOrgService.selectById(relatedId);
		model.addAttribute("projectDeclareOrg",projectDeclareOrg);
		model.addAttribute("pageNo", pageNo);
		return "projectDeclareOrg/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareOrg/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = projectDeclareOrgService.batchDelete(items);
		int i=  projectDeclareOrgService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/projectDeclareOrg/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareOrg//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "projectDeclareOrg") ProjectDeclareOrgBean projectDeclareOrg, 
			HttpServletRequest request ) {
		String str =null;
		if(projectDeclareOrg.getRelatedId()==null){
			/*
			projectDeclareOrg.setRelatedId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键
			projectDeclareOrg.setDeclareId(value);//外键，关联表t_project_declare_info
			projectDeclareOrg.setOrgId(value);//组织id
			projectDeclareOrg.setOrgName(value);//组织名称
			projectDeclareOrg.setRemark(value);//备注
			projectDeclareOrg.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			projectDeclareOrgService.insert(projectDeclareOrg);
			
			  str = "创建成功！";
		}else{//编辑
			projectDeclareOrg.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			projectDeclareOrgService.updateById(projectDeclareOrg);
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
	@RequestMapping(value = "/projectDeclareOrg/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = projectDeclareOrgService.batchDelete(items);
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
	@RequestMapping(value = "/projectDeclareOrg/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProjectDeclareOrgBean jsonSave(
			@RequestParam(value = "relatedId") BigDecimal relatedId,
			HttpServletRequest request ) {
		    ProjectDeclareOrgBean projectDeclareOrg = projectDeclareOrgService.selectById(relatedId);
	  return  projectDeclareOrg ;
	} 
	
}