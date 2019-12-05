
package com.chinatelecom.jx.zone.management.controller.projectDeclare;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;



import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareNodeBean;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareNodeService;

@Controller
//@RequestMapping(value = "/projectdeclarenode")
public class ProjectDeclareNodeController extends BaseController {
	@Autowired
	private IProjectDeclareNodeService projectDeclareNodeService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(ProjectDeclareNodeController.class);
 
	/**
	 * 列表
	 * @param projectDeclareNode
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareNode/list")
	public String list(@ModelAttribute("projectDeclareNode") ProjectDeclareNodeBean projectDeclareNode,
			@RequestParam(value="declareId") BigDecimal declareId,
			@ModelAttribute("page") Page<ProjectDeclareNodeBean> page, Model model) {
		try {
			projectDeclareNode.setDeclareId(declareId);
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page=(Page<ProjectDeclareNodeBean>)projectDeclareNodeService.queryByCond(null);
			setPageInfo(page, model, "projectDeclare/node/list");
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
	
		return "projectDeclare/node/list";
	}
	
	/**
	 * 新增 
	 * @param nodeId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareNode/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 ProjectDeclareNodeBean  projectDeclareNode = new ProjectDeclareNodeBean();
			/* 初始化
			projectDeclareNode.setNodeId(value);//编号
			projectDeclareNode.setDeclareId(value);//关联编号
			projectDeclareNode.setNodeName(value);//节点名称
			projectDeclareNode.setEndTime(value);//截止时间
			projectDeclareNode.setIsOverdue(value);//剩余时间，单位分钟，-1标识已经过期。
			projectDeclareNode.setRemark(value);//备注
			
			//projectDeclareNode.setBdlc(processdefid);
			*/
		 
	  model.addAttribute("projectDeclareNode", projectDeclareNode);
	  model.addAttribute("pageNo", pageNo);
	  return "projectDeclareNode/edit";
	} 
	/**
	 * 编辑
	 * @param nodeId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareNode/edit/{id}")
	public String create(
			@PathVariable(value = "nodeId" ) BigDecimal nodeId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   ProjectDeclareNodeBean projectDeclareNode = projectDeclareNodeService.selectById(nodeId);
		 
	  model.addAttribute("projectDeclareNode", projectDeclareNode);
	  model.addAttribute("pageNo", pageNo);
	  return "projectDeclareNode/edit";
	}
	
	/**
	 * 保存操作
	 * @param projectDeclareNode
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareNode/save")
	public String save(
			@ModelAttribute(value = "projectDeclareNode") ProjectDeclareNodeBean projectDeclareNode, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(projectDeclareNode.getNodeId()==null){
			/*  
			projectDeclareNode.setNodeId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//编号
			projectDeclareNode.setDeclareId(value);//关联编号
			projectDeclareNode.setNodeName(value);//节点名称
			projectDeclareNode.setEndTime(new Timestamp(new Date().getTime()));//截止时间
			projectDeclareNode.setIsOverdue(value);//剩余时间，单位分钟，-1标识已经过期。
			projectDeclareNode.setRemark(value);//备注
			*/
			projectDeclareNodeService.insert(projectDeclareNode);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			projectDeclareNode.setEndTime(new Timestamp(new Date().getTime()));//截止时间
			projectDeclareNodeService.updateById(projectDeclareNode);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/projectDeclareNode/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param nodeId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareNode/view/{id}")
	public String view(
			@PathVariable(value = "nodeId") BigDecimal nodeId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		ProjectDeclareNodeBean projectDeclareNode = projectDeclareNodeService.selectById(nodeId);
		model.addAttribute("projectDeclareNode",projectDeclareNode);
		model.addAttribute("pageNo", pageNo);
		return "projectDeclareNode/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareNode/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = projectDeclareNodeService.batchDelete(items);
		int i=  projectDeclareNodeService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/projectDeclareNode/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareNode//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "projectDeclareNode") ProjectDeclareNodeBean projectDeclareNode, 
			HttpServletRequest request ) {
		String str =null;
		if(projectDeclareNode.getNodeId()==null){
			/*
			projectDeclareNode.setNodeId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//编号
			projectDeclareNode.setDeclareId(value);//关联编号
			projectDeclareNode.setNodeName(value);//节点名称
			projectDeclareNode.setEndTime(new Timestamp(new Date().getTime()));//截止时间
			projectDeclareNode.setIsOverdue(value);//剩余时间，单位分钟，-1标识已经过期。
			projectDeclareNode.setRemark(value);//备注
			*/
			projectDeclareNodeService.insert(projectDeclareNode);
			
			  str = "创建成功！";
		}else{//编辑
			projectDeclareNode.setEndTime(new Timestamp(new Date().getTime()));//截止时间
			projectDeclareNodeService.updateById(projectDeclareNode);
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
	@RequestMapping(value = "/projectDeclareNode/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = projectDeclareNodeService.batchDelete(items);
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
	@RequestMapping(value = "/projectDeclareNode/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProjectDeclareNodeBean jsonSave(
			@RequestParam(value = "nodeId") BigDecimal nodeId,
			HttpServletRequest request ) {
		    ProjectDeclareNodeBean projectDeclareNode = projectDeclareNodeService.selectById(nodeId);
	  return  projectDeclareNode ;
	} 
	
}