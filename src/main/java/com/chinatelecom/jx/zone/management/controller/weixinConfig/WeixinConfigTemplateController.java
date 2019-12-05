
package com.chinatelecom.jx.zone.management.controller.weixinConfig;

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
import com.chinatelecom.jx.zone.management.bean.weixinConfig.WeixinConfigTemplateBean;
import com.chinatelecom.jx.zone.management.service.weixinConfig.IWeixinConfigTemplateService;

@Controller
//@RequestMapping(value = "/weixinconfigtemplate")
public class WeixinConfigTemplateController extends BaseController {
	@Autowired
	private IWeixinConfigTemplateService weixinConfigTemplateService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(WeixinConfigTemplateController.class);
 
	/**
	 * 列表
	 * @param weixinConfigTemplate
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigTemplate/list")
	public String list(@ModelAttribute("weixinConfigTemplate") WeixinConfigTemplateBean weixinConfigTemplate, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<WeixinConfigTemplateBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<WeixinConfigTemplateBean>)weixinConfigTemplateService.queryByCond(null);
		setPageInfo(page, model, "weixinConfigTemplate/list");
		model.addAttribute("searchKey", searchKey);
		return "weixinConfigTemplate/list";
	}
	
	/**
	 * 新增 
	 * @param templateId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigTemplate/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 WeixinConfigTemplateBean  weixinConfigTemplate = new WeixinConfigTemplateBean();
			/* 初始化
			weixinConfigTemplate.setTemplateId(value);//主键
			weixinConfigTemplate.setBusiness(value);//行业
			weixinConfigTemplate.setTemplateMsgId(value);//模板ID
			weixinConfigTemplate.setTemplateMsgTitle(value);//模板标题
			weixinConfigTemplate.setContent(value);//内容
			weixinConfigTemplate.setExamples(value);//范例
			weixinConfigTemplate.setCreateTime(value);//创建时间
			weixinConfigTemplate.setRemark(value);//备注
			*/
		 
	  model.addAttribute("weixinConfigTemplate", weixinConfigTemplate);
	  model.addAttribute("pageNo", pageNo);
	  return "weixinConfigTemplate/edit";
	} 
	/**
	 * 编辑
	 * @param templateId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigTemplate/edit/{id}")
	public String create(
			@PathVariable(value = "templateId" ) BigDecimal templateId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   WeixinConfigTemplateBean weixinConfigTemplate = weixinConfigTemplateService.selectById(templateId);
		 
	  model.addAttribute("weixinConfigTemplate", weixinConfigTemplate);
	  model.addAttribute("pageNo", pageNo);
	  return "weixinConfigTemplate/edit";
	}
	
	/**
	 * 保存操作
	 * @param weixinConfigTemplate
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigTemplate/save")
	public String save(
			@ModelAttribute(value = "weixinConfigTemplate") WeixinConfigTemplateBean weixinConfigTemplate, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(weixinConfigTemplate.getTemplateId()==null){
			/*  
			weixinConfigTemplate.setTemplateId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键
			weixinConfigTemplate.setBusiness(value);//行业
			weixinConfigTemplate.setTemplateMsgId(value);//模板ID
			weixinConfigTemplate.setTemplateMsgTitle(value);//模板标题
			weixinConfigTemplate.setContent(value);//内容
			weixinConfigTemplate.setExamples(value);//范例
			weixinConfigTemplate.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			weixinConfigTemplate.setRemark(value);//备注
			*/
			weixinConfigTemplateService.insert(weixinConfigTemplate);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			weixinConfigTemplate.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			weixinConfigTemplateService.updateById(weixinConfigTemplate);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/weixinConfigTemplate/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param templateId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigTemplate/view/{id}")
	public String view(
			@PathVariable(value = "templateId") BigDecimal templateId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		WeixinConfigTemplateBean weixinConfigTemplate = weixinConfigTemplateService.selectById(templateId);
		model.addAttribute("weixinConfigTemplate",weixinConfigTemplate);
		model.addAttribute("pageNo", pageNo);
		return "weixinConfigTemplate/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigTemplate/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = weixinConfigTemplateService.batchDelete(items);
		int i=  weixinConfigTemplateService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/weixinConfigTemplate/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigTemplate/json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "weixinConfigTemplate") WeixinConfigTemplateBean weixinConfigTemplate, 
			HttpServletRequest request ) {
		String str =null;
		if(weixinConfigTemplate.getTemplateId()==null){
			/*
			weixinConfigTemplate.setTemplateId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键
			weixinConfigTemplate.setBusiness(value);//行业
			weixinConfigTemplate.setTemplateMsgId(value);//模板ID
			weixinConfigTemplate.setTemplateMsgTitle(value);//模板标题
			weixinConfigTemplate.setContent(value);//内容
			weixinConfigTemplate.setExamples(value);//范例
			weixinConfigTemplate.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			weixinConfigTemplate.setRemark(value);//备注
			*/
			weixinConfigTemplateService.insert(weixinConfigTemplate);
			
			  str = "创建成功！";
		}else{//编辑
			weixinConfigTemplate.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			weixinConfigTemplateService.updateById(weixinConfigTemplate);
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
	@RequestMapping(value = "/weixinConfigTemplate/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = weixinConfigTemplateService.batchDelete(items);
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
	@RequestMapping(value = "/weixinConfigTemplate/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public WeixinConfigTemplateBean jsonSave(
			@RequestParam(value = "templateId") BigDecimal templateId,
			HttpServletRequest request ) {
		    WeixinConfigTemplateBean weixinConfigTemplate = weixinConfigTemplateService.selectById(templateId);
	  return  weixinConfigTemplate ;
	} 
	
}