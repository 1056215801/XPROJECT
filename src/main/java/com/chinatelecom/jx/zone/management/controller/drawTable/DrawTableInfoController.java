
package com.chinatelecom.jx.zone.management.controller.drawTable;

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
import com.chinatelecom.jx.zone.management.bean.drawTable.DrawTableInfoBean;
import com.chinatelecom.jx.zone.management.service.drawTable.IDrawTableInfoService;

@Controller
//@RequestMapping(value = "/drawtableinfo")
public class DrawTableInfoController extends BaseController {
	@Autowired
	private IDrawTableInfoService drawTableInfoService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(DrawTableInfoController.class);
 
	/**
	 * 列表
	 * @param drawTableInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawTableInfo/list")
	public String list(@ModelAttribute("drawTableInfo") DrawTableInfoBean drawTableInfo, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<DrawTableInfoBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<DrawTableInfoBean>)drawTableInfoService.queryByCond(null);
		setPageInfo(page, model, "drawTableInfo/list");
		model.addAttribute("searchKey", searchKey);
		return "drawTableInfo/drawTableInfoList";
	}
	
	/**
	 * 新增 
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawTableInfo/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 DrawTableInfoBean  drawTableInfo = new DrawTableInfoBean();
			/* 初始化
			drawTableInfo.setId(value);//编号
			drawTableInfo.setTitle(value);//业务名称
			drawTableInfo.setMark(value);//唯一标记 用于跟业务绑定
			drawTableInfo.setDescription(value);//说明
			drawTableInfo.setRowNum(value);//总行数
			drawTableInfo.setColNum(value);//总列数
			drawTableInfo.setCreateTime(value);//创建时间
			drawTableInfo.setAccountId(value);//创建人
			drawTableInfo.setAccountName(value);//创建人名称
			drawTableInfo.setParkId(value);//归属园区
			*/
		 
	  model.addAttribute("drawTableInfo", drawTableInfo);
	  model.addAttribute("pageNo", pageNo);
	  return "drawTableInfo/drawTableInfoForm";
	} 
	/**
	 * 编辑
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawTableInfo/edit/{id}")
	public String create(
			@PathVariable(value = "id" ) BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   DrawTableInfoBean drawTableInfo = drawTableInfoService.selectById(id);
		 
	  model.addAttribute("drawTableInfo", drawTableInfo);
	  model.addAttribute("pageNo", pageNo);
	  return "drawTableInfo/drawTableInfoForm";
	}
	
	/**
	 * 保存操作
	 * @param drawTableInfo
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawTableInfo/save")
	public String save(
			@ModelAttribute(value = "drawTableInfo") DrawTableInfoBean drawTableInfo, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(drawTableInfo.getId()==null){
			drawTableInfo.setId(seq.getNextSeqIdToBigDecimal());//编号
			drawTableInfo.setRowNum(1);//总行数
			drawTableInfo.setColNum(1);//总列数
			drawTableInfo.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			drawTableInfo.setAccountId(new BigDecimal("1"));//创建人
			drawTableInfo.setAccountName("1");//创建人名称
			drawTableInfo.setParkId(new BigDecimal("1"));//归属园区
			drawTableInfoService.insert(drawTableInfo);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			drawTableInfo.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			drawTableInfoService.updateById(drawTableInfo);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/drawTableInfo/list" ;
	}
	
	/**
	 * 查看详细
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/drawTableInfo/view/{id}")
	public String view(
			@PathVariable(value = "id") BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		DrawTableInfoBean drawTableInfo = drawTableInfoService.selectById(id);
		model.addAttribute("drawTableInfo",drawTableInfo);
		model.addAttribute("pageNo", pageNo);
		return "drawTableInfo/drawTableInfoView";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/drawTableInfo/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = drawTableInfoService.batchDelete(items);
		int i=  drawTableInfoService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/drawTableInfo/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/drawTableInfo//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "drawTableInfo") DrawTableInfoBean drawTableInfo, 
			HttpServletRequest request ) {
		String str =null;
		if(drawTableInfo.getId()==null){
			/*
			drawTableInfo.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//编号
			drawTableInfo.setTitle(value);//业务名称
			drawTableInfo.setMark(value);//唯一标记 用于跟业务绑定
			drawTableInfo.setDescription(value);//说明
			drawTableInfo.setRowNum(value);//总行数
			drawTableInfo.setColNum(value);//总列数
			drawTableInfo.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			drawTableInfo.setAccountId(value);//创建人
			drawTableInfo.setAccountName(value);//创建人名称
			drawTableInfo.setParkId(value);//归属园区
			*/
			drawTableInfoService.insert(drawTableInfo);
			
			  str = "创建成功！";
		}else{//编辑
			drawTableInfo.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			drawTableInfoService.updateById(drawTableInfo);
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
	@RequestMapping(value = "/drawTableInfo/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = drawTableInfoService.batchDelete(items);
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
	@RequestMapping(value = "/drawTableInfo/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public DrawTableInfoBean jsonSave(
			@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request ) {
		    DrawTableInfoBean drawTableInfo = drawTableInfoService.selectById(id);
	  return  drawTableInfo ;
	} 
	
}