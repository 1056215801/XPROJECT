
package com.chinatelecom.jx.zone.management.controller.expBrowse;

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
import com.chinatelecom.jx.zone.management.bean.expBrowse.ExpBrowseLogBean;
import com.chinatelecom.jx.zone.management.service.expBrowse.IExpBrowseLogService;

@Controller
//@RequestMapping(value = "/expbrowselog")
public class ExpBrowseLogController extends BaseController {
	@Autowired
	private IExpBrowseLogService expBrowseLogService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(ExpBrowseLogController.class);
 
	/**
	 * 列表
	 * @param expBrowseLog
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expBrowseLog/list")
	public String list(@ModelAttribute("expBrowseLog") ExpBrowseLogBean expBrowseLog, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<ExpBrowseLogBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<ExpBrowseLogBean>)expBrowseLogService.queryByCond(null);
		setPageInfo(page, model, "expBrowseLog/list");
		model.addAttribute("searchKey", searchKey);
		return "expBrowseLog/list";
	}
	
	/**
	 * 新增 
	 * @param logId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expBrowseLog/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 ExpBrowseLogBean  expBrowseLog = new ExpBrowseLogBean();
			/* 初始化
			expBrowseLog.setLogId(value);//浏览id，主键
			expBrowseLog.setExpId(value);//园区动态id，外键 见t_exp_info
			expBrowseLog.setType(value);//类型，0：游客 1：注册用户
			expBrowseLog.setBrowseId(value);//浏览人id
			expBrowseLog.setBrowseName(value);//浏览人名称
			expBrowseLog.setBrowseIp(value);//浏览人ip
			expBrowseLog.setRemark(value);//备注
			expBrowseLog.setCreateTime(value);//创建时间
			*/
		 
	  model.addAttribute("expBrowseLog", expBrowseLog);
	  model.addAttribute("pageNo", pageNo);
	  return "expBrowseLog/edit";
	} 
	/**
	 * 编辑
	 * @param logId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expBrowseLog/edit/{id}")
	public String create(
			@PathVariable(value = "logId" ) BigDecimal logId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   ExpBrowseLogBean expBrowseLog = expBrowseLogService.selectById(logId);
		 
	  model.addAttribute("expBrowseLog", expBrowseLog);
	  model.addAttribute("pageNo", pageNo);
	  return "expBrowseLog/edit";
	}
	
	/**
	 * 保存操作
	 * @param expBrowseLog
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expBrowseLog/save")
	public String save(
			@ModelAttribute(value = "expBrowseLog") ExpBrowseLogBean expBrowseLog, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(expBrowseLog.getLogId()==null){
			/*  
			expBrowseLog.setLogId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//浏览id，主键
			expBrowseLog.setExpId(value);//园区动态id，外键 见t_exp_info
			expBrowseLog.setType(value);//类型，0：游客 1：注册用户
			expBrowseLog.setBrowseId(value);//浏览人id
			expBrowseLog.setBrowseName(value);//浏览人名称
			expBrowseLog.setBrowseIp(value);//浏览人ip
			expBrowseLog.setRemark(value);//备注
			expBrowseLog.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			expBrowseLogService.insert(expBrowseLog);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			expBrowseLog.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			expBrowseLogService.updateById(expBrowseLog);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/expBrowseLog/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param logId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/expBrowseLog/view/{id}")
	public String view(
			@PathVariable(value = "logId") BigDecimal logId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		ExpBrowseLogBean expBrowseLog = expBrowseLogService.selectById(logId);
		model.addAttribute("expBrowseLog",expBrowseLog);
		model.addAttribute("pageNo", pageNo);
		return "expBrowseLog/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/expBrowseLog/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = expBrowseLogService.batchDelete(items);
		int i=  expBrowseLogService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/expBrowseLog/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/expBrowseLog//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "expBrowseLog") ExpBrowseLogBean expBrowseLog, 
			HttpServletRequest request ) {
		String str =null;
		if(expBrowseLog.getLogId()==null){
			/*
			expBrowseLog.setLogId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//浏览id，主键
			expBrowseLog.setExpId(value);//园区动态id，外键 见t_exp_info
			expBrowseLog.setType(value);//类型，0：游客 1：注册用户
			expBrowseLog.setBrowseId(value);//浏览人id
			expBrowseLog.setBrowseName(value);//浏览人名称
			expBrowseLog.setBrowseIp(value);//浏览人ip
			expBrowseLog.setRemark(value);//备注
			expBrowseLog.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			expBrowseLogService.insert(expBrowseLog);
			
			  str = "创建成功！";
		}else{//编辑
			expBrowseLog.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			expBrowseLogService.updateById(expBrowseLog);
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
	@RequestMapping(value = "/expBrowseLog/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = expBrowseLogService.batchDelete(items);
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
	@RequestMapping(value = "/expBrowseLog/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ExpBrowseLogBean jsonSave(
			@RequestParam(value = "logId") BigDecimal logId,
			HttpServletRequest request ) {
		    ExpBrowseLogBean expBrowseLog = expBrowseLogService.selectById(logId);
	  return  expBrowseLog ;
	} 
	
}