
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
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareLogBean;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareLogService;

@Controller
//@RequestMapping(value = "/projectdeclarelog")
public class ProjectDeclareLogController extends BaseController {
	@Autowired
	private IProjectDeclareLogService projectDeclareLogService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(ProjectDeclareLogController.class);
 
	/**
	 * 列表
	 * @param projectDeclareLog
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareLog/list")
	public String list(@ModelAttribute("projectDeclareLog") ProjectDeclareLogBean projectDeclareLog, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<ProjectDeclareLogBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<ProjectDeclareLogBean>)projectDeclareLogService.queryByCond(null);
		setPageInfo(page, model, "projectDeclareLog/list");
		model.addAttribute("searchKey", searchKey);
		return "projectDeclareLog/list";
	}
	
	/**
	 * 新增 
	 * @param logId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareLog/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 ProjectDeclareLogBean  projectDeclareLog = new ProjectDeclareLogBean();
			/* 初始化
			projectDeclareLog.setLogId(value);//主键
			projectDeclareLog.setApplyId(value);//申报id，外键，关联表t_project_declare_apply
			projectDeclareLog.setSortNum(value);//排序
			projectDeclareLog.setUnitId(value);//审核单位id
			projectDeclareLog.setUnitName(value);//审核单位名称
			projectDeclareLog.setUnitKind(value);//审核单位类型，枚举值：0：政府 1：园区
			projectDeclareLog.setAccountId(value);//用户id
			projectDeclareLog.setAccountName(value);//用户名称
			projectDeclareLog.setStatus(value);//状态，枚举值：0：上报未通过 1：上报已通过 2：上报审核中
			projectDeclareLog.setCreateTime(value);//创建时间
			*/
		 
	  model.addAttribute("projectDeclareLog", projectDeclareLog);
	  model.addAttribute("pageNo", pageNo);
	  return "projectDeclareLog/edit";
	} 
	/**
	 * 编辑
	 * @param logId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareLog/edit/{id}")
	public String create(
			@PathVariable(value = "logId" ) BigDecimal logId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   ProjectDeclareLogBean projectDeclareLog = projectDeclareLogService.selectById(logId);
		 
	  model.addAttribute("projectDeclareLog", projectDeclareLog);
	  model.addAttribute("pageNo", pageNo);
	  return "projectDeclareLog/edit";
	}
	
	/**
	 * 保存操作
	 * @param projectDeclareLog
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareLog/save")
	public String save(
			@ModelAttribute(value = "projectDeclareLog") ProjectDeclareLogBean projectDeclareLog, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(projectDeclareLog.getLogId()==null){
			/*  
			projectDeclareLog.setLogId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键
			projectDeclareLog.setApplyId(value);//申报id，外键，关联表t_project_declare_apply
			projectDeclareLog.setSortNum(value);//排序
			projectDeclareLog.setUnitId(value);//审核单位id
			projectDeclareLog.setUnitName(value);//审核单位名称
			projectDeclareLog.setUnitKind(value);//审核单位类型，枚举值：0：政府 1：园区
			projectDeclareLog.setAccountId(value);//用户id
			projectDeclareLog.setAccountName(value);//用户名称
			projectDeclareLog.setStatus(value);//状态，枚举值：0：上报未通过 1：上报已通过 2：上报审核中
			projectDeclareLog.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			projectDeclareLogService.insert(projectDeclareLog);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			projectDeclareLog.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			projectDeclareLogService.updateById(projectDeclareLog);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/projectDeclareLog/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param logId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareLog/view/{id}")
	public String view(
			@PathVariable(value = "logId") BigDecimal logId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		ProjectDeclareLogBean projectDeclareLog = projectDeclareLogService.selectById(logId);
		model.addAttribute("projectDeclareLog",projectDeclareLog);
		model.addAttribute("pageNo", pageNo);
		return "projectDeclareLog/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareLog/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = projectDeclareLogService.batchDelete(items);
		int i=  projectDeclareLogService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/projectDeclareLog/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareLog//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "projectDeclareLog") ProjectDeclareLogBean projectDeclareLog, 
			HttpServletRequest request ) {
		String str =null;
		if(projectDeclareLog.getLogId()==null){
			/*
			projectDeclareLog.setLogId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键
			projectDeclareLog.setApplyId(value);//申报id，外键，关联表t_project_declare_apply
			projectDeclareLog.setSortNum(value);//排序
			projectDeclareLog.setUnitId(value);//审核单位id
			projectDeclareLog.setUnitName(value);//审核单位名称
			projectDeclareLog.setUnitKind(value);//审核单位类型，枚举值：0：政府 1：园区
			projectDeclareLog.setAccountId(value);//用户id
			projectDeclareLog.setAccountName(value);//用户名称
			projectDeclareLog.setStatus(value);//状态，枚举值：0：上报未通过 1：上报已通过 2：上报审核中
			projectDeclareLog.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			projectDeclareLogService.insert(projectDeclareLog);
			
			  str = "创建成功！";
		}else{//编辑
			projectDeclareLog.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			projectDeclareLogService.updateById(projectDeclareLog);
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
	@RequestMapping(value = "/projectDeclareLog/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = projectDeclareLogService.batchDelete(items);
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
	@RequestMapping(value = "/projectDeclareLog/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProjectDeclareLogBean jsonSave(
			@RequestParam(value = "logId") BigDecimal logId,
			HttpServletRequest request ) {
		    ProjectDeclareLogBean projectDeclareLog = projectDeclareLogService.selectById(logId);
	  return  projectDeclareLog ;
	} 
	
}