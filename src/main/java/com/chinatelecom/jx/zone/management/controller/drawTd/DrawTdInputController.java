
package com.chinatelecom.jx.zone.management.controller.drawTd;

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
import com.chinatelecom.jx.zone.management.bean.drawTd.DrawTdInputBean;
import com.chinatelecom.jx.zone.management.service.drawTd.IDrawTdInputService;

@Controller
//@RequestMapping(value = "/drawtdinput")
public class DrawTdInputController extends BaseController {
	@Autowired
	private IDrawTdInputService drawTdInputService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(DrawTdInputController.class);
 
	/**
	 * 列表
	 * @param drawTdInput
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawTdInput/list")
	public String list(@ModelAttribute("drawTdInput") DrawTdInputBean drawTdInput, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<DrawTdInputBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<DrawTdInputBean>)drawTdInputService.queryByCond(null);
		setPageInfo(page, model, "drawTdInput/list");
		model.addAttribute("searchKey", searchKey);
		return "drawTdInput/list";
	}
	
	/**
	 * 新增 
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawTdInput/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 DrawTdInputBean  drawTdInput = new DrawTdInputBean();
			/* 初始化
			drawTdInput.setId(value);//编号
			drawTdInput.setTdId(value);//单元格ID
			drawTdInput.setInputId(value);//控件ID
			drawTdInput.setSortGrade(value);//排序号
			drawTdInput.setParkId(value);//归属园区ID
			drawTdInput.setCreateTime(value);//创建时间
			*/
		 
	  model.addAttribute("drawTdInput", drawTdInput);
	  model.addAttribute("pageNo", pageNo);
	  return "drawTdInput/edit";
	} 
	/**
	 * 编辑
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawTdInput/edit/{id}")
	public String create(
			@PathVariable(value = "id" ) BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   DrawTdInputBean drawTdInput = drawTdInputService.selectById(id);
		 
	  model.addAttribute("drawTdInput", drawTdInput);
	  model.addAttribute("pageNo", pageNo);
	  return "drawTdInput/edit";
	}
	
	/**
	 * 保存操作
	 * @param drawTdInput
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawTdInput/save")
	public String save(
			@ModelAttribute(value = "drawTdInput") DrawTdInputBean drawTdInput, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(drawTdInput.getId()==null){
			/*  
			drawTdInput.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//编号
			drawTdInput.setTdId(value);//单元格ID
			drawTdInput.setInputId(value);//控件ID
			drawTdInput.setSortGrade(value);//排序号
			drawTdInput.setParkId(value);//归属园区ID
			drawTdInput.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			drawTdInputService.insert(drawTdInput);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			drawTdInput.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			drawTdInputService.updateById(drawTdInput);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/drawTdInput/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/drawTdInput/view/{id}")
	public String view(
			@PathVariable(value = "id") BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		DrawTdInputBean drawTdInput = drawTdInputService.selectById(id);
		model.addAttribute("drawTdInput",drawTdInput);
		model.addAttribute("pageNo", pageNo);
		return "drawTdInput/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/drawTdInput/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = drawTdInputService.batchDelete(items);
		int i=  drawTdInputService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/drawTdInput/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/drawTdInput//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "drawTdInput") DrawTdInputBean drawTdInput, 
			HttpServletRequest request ) {
		String str =null;
		if(drawTdInput.getId()==null){
			/*
			drawTdInput.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//编号
			drawTdInput.setTdId(value);//单元格ID
			drawTdInput.setInputId(value);//控件ID
			drawTdInput.setSortGrade(value);//排序号
			drawTdInput.setParkId(value);//归属园区ID
			drawTdInput.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			drawTdInputService.insert(drawTdInput);
			
			  str = "创建成功！";
		}else{//编辑
			drawTdInput.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			drawTdInputService.updateById(drawTdInput);
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
	@RequestMapping(value = "/drawTdInput/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = drawTdInputService.batchDelete(items);
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
	@RequestMapping(value = "/drawTdInput/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public DrawTdInputBean jsonSave(
			@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request ) {
		    DrawTdInputBean drawTdInput = drawTdInputService.selectById(id);
	  return  drawTdInput ;
	} 
	
}