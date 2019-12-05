
package com.chinatelecom.jx.zone.management.controller.statisticsInve;

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
import com.chinatelecom.jx.zone.management.bean.statisticsInve.StatisticsInveInfoBean;
import com.chinatelecom.jx.zone.management.service.statisticsInve.IStatisticsInveInfoService;

@Controller
//@RequestMapping(value = "/statisticsinveinfo")
public class StatisticsInveInfoController extends BaseController {
	@Autowired
	private IStatisticsInveInfoService statisticsInveInfoService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(StatisticsInveInfoController.class);
 
	/**
	 * 列表
	 * @param statisticsInveInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsInveInfo/list")
	public String list(@ModelAttribute("statisticsInveInfo") StatisticsInveInfoBean statisticsInveInfo, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<StatisticsInveInfoBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<StatisticsInveInfoBean>)statisticsInveInfoService.queryByCond(null);
		setPageInfo(page, model, "statisticsInveInfo/list");
		model.addAttribute("searchKey", searchKey);
		return "statisticsInveInfo/list";
	}
	
	/**
	 * 新增 
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsInveInfo/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 StatisticsInveInfoBean  statisticsInveInfo = new StatisticsInveInfoBean();
			/* 初始化
			statisticsInveInfo.setId(value);//编号ID
			statisticsInveInfo.setInvestigationId(value);//调查ID
			statisticsInveInfo.setFormId(value);//模板ID
			statisticsInveInfo.setCountExampleSum(value);//数据总量
			statisticsInveInfo.setCountExamplePc(value);//PC端数据量
			statisticsInveInfo.setCountExampleWx(value);//移动端数据量
			statisticsInveInfo.setCountBrowse(value);//浏览量
			statisticsInveInfo.setCreateday(value);//日期
			statisticsInveInfo.setExamplePrc(value);//填写率
			statisticsInveInfo.setUpdateDate(value);//处理时间
			*/
		 
	  model.addAttribute("statisticsInveInfo", statisticsInveInfo);
	  model.addAttribute("pageNo", pageNo);
	  return "statisticsInveInfo/edit";
	} 
	/**
	 * 编辑
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsInveInfo/edit/{id}")
	public String create(
			@PathVariable(value = "id" ) BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   StatisticsInveInfoBean statisticsInveInfo = statisticsInveInfoService.selectById(id);
		 
	  model.addAttribute("statisticsInveInfo", statisticsInveInfo);
	  model.addAttribute("pageNo", pageNo);
	  return "statisticsInveInfo/edit";
	}
	
	/**
	 * 保存操作
	 * @param statisticsInveInfo
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsInveInfo/save")
	public String save(
			@ModelAttribute(value = "statisticsInveInfo") StatisticsInveInfoBean statisticsInveInfo, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(statisticsInveInfo.getId()==null){
			/*  
			statisticsInveInfo.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//编号ID
			statisticsInveInfo.setInvestigationId(value);//调查ID
			statisticsInveInfo.setFormId(value);//模板ID
			statisticsInveInfo.setCountExampleSum(value);//数据总量
			statisticsInveInfo.setCountExamplePc(value);//PC端数据量
			statisticsInveInfo.setCountExampleWx(value);//移动端数据量
			statisticsInveInfo.setCountBrowse(value);//浏览量
			statisticsInveInfo.setCreateday(value);//日期
			statisticsInveInfo.setExamplePrc(value);//填写率
			statisticsInveInfo.setUpdateDate(new Timestamp(new Date().getTime()));//处理时间
			*/
			statisticsInveInfoService.insert(statisticsInveInfo);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			statisticsInveInfo.setUpdateDate(new Timestamp(new Date().getTime()));//处理时间
			statisticsInveInfoService.updateById(statisticsInveInfo);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/statisticsInveInfo/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/statisticsInveInfo/view/{id}")
	public String view(
			@PathVariable(value = "id") BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		StatisticsInveInfoBean statisticsInveInfo = statisticsInveInfoService.selectById(id);
		model.addAttribute("statisticsInveInfo",statisticsInveInfo);
		model.addAttribute("pageNo", pageNo);
		return "statisticsInveInfo/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/statisticsInveInfo/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = statisticsInveInfoService.batchDelete(items);
		int i=  statisticsInveInfoService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/statisticsInveInfo/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/statisticsInveInfo//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "statisticsInveInfo") StatisticsInveInfoBean statisticsInveInfo, 
			HttpServletRequest request ) {
		String str =null;
		if(statisticsInveInfo.getId()==null){
			/*
			statisticsInveInfo.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//编号ID
			statisticsInveInfo.setInvestigationId(value);//调查ID
			statisticsInveInfo.setFormId(value);//模板ID
			statisticsInveInfo.setCountExampleSum(value);//数据总量
			statisticsInveInfo.setCountExamplePc(value);//PC端数据量
			statisticsInveInfo.setCountExampleWx(value);//移动端数据量
			statisticsInveInfo.setCountBrowse(value);//浏览量
			statisticsInveInfo.setCreateday(value);//日期
			statisticsInveInfo.setExamplePrc(value);//填写率
			statisticsInveInfo.setUpdateDate(new Timestamp(new Date().getTime()));//处理时间
			*/
			statisticsInveInfoService.insert(statisticsInveInfo);
			
			  str = "创建成功！";
		}else{//编辑
			statisticsInveInfo.setUpdateDate(new Timestamp(new Date().getTime()));//处理时间
			statisticsInveInfoService.updateById(statisticsInveInfo);
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
	@RequestMapping(value = "/statisticsInveInfo/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = statisticsInveInfoService.batchDelete(items);
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
	@RequestMapping(value = "/statisticsInveInfo/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public StatisticsInveInfoBean jsonSave(
			@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request ) {
		    StatisticsInveInfoBean statisticsInveInfo = statisticsInveInfoService.selectById(id);
	  return  statisticsInveInfo ;
	} 
	
}