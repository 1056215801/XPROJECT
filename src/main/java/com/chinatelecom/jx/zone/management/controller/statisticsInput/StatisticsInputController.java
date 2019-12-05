
package com.chinatelecom.jx.zone.management.controller.statisticsInput;

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
import com.chinatelecom.jx.zone.management.bean.statisticsInput.StatisticsInputBean;
import com.chinatelecom.jx.zone.management.service.statisticsInput.IStatisticsInputService;

@Controller
//@RequestMapping(value = "/statisticsinput")
public class StatisticsInputController extends BaseController {
	@Autowired
	private IStatisticsInputService statisticsInputService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(StatisticsInputController.class);
 
	/**
	 * 列表
	 * @param statisticsInput
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsInput/list")
	public String list(@ModelAttribute("statisticsInput") StatisticsInputBean statisticsInput, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<StatisticsInputBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<StatisticsInputBean>)statisticsInputService.queryByCond(null);
		setPageInfo(page, model, "statisticsInput/list");
		model.addAttribute("searchKey", searchKey);
		return "statisticsInput/list";
	}
	
	/**
	 * 新增 
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsInput/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 StatisticsInputBean  statisticsInput = new StatisticsInputBean();
			/* 初始化
			statisticsInput.setId(value);//ID 主键
			statisticsInput.setInvestigationId(value);//t_investigation_info_main主键
			statisticsInput.setFormId(value);//模板ID
			statisticsInput.setInputId(value);//录入项ID
			statisticsInput.setInputType(value);//录入项类型 录入项类型
			statisticsInput.setCheckType(value);//校验 0:否; 1:是;    非必填、必填
			statisticsInput.setInputTitle(value);//录入项名称
			statisticsInput.setInputOptions(value);//录入项对应的标准值
			statisticsInput.setInputTrue(value);//录入项作答数
			statisticsInput.setSortGrade(value);//录入项排序 越小越靠前
			statisticsInput.setCountExampleSum(value);//录入项数据总量
			statisticsInput.setExamplePrc(value);//录入项填写率
			statisticsInput.setUpdateDate(value);//更新时间
			*/
		 
	  model.addAttribute("statisticsInput", statisticsInput);
	  model.addAttribute("pageNo", pageNo);
	  return "statisticsInput/edit";
	} 
	/**
	 * 编辑
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsInput/edit/{id}")
	public String create(
			@PathVariable(value = "id" ) BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   StatisticsInputBean statisticsInput = statisticsInputService.selectById(id);
		 
	  model.addAttribute("statisticsInput", statisticsInput);
	  model.addAttribute("pageNo", pageNo);
	  return "statisticsInput/edit";
	}
	
	/**
	 * 保存操作
	 * @param statisticsInput
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsInput/save")
	public String save(
			@ModelAttribute(value = "statisticsInput") StatisticsInputBean statisticsInput, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(statisticsInput.getId()==null){
			/*  
			statisticsInput.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//ID 主键
			statisticsInput.setInvestigationId(value);//t_investigation_info_main主键
			statisticsInput.setFormId(value);//模板ID
			statisticsInput.setInputId(value);//录入项ID
			statisticsInput.setInputType(value);//录入项类型 录入项类型
			statisticsInput.setCheckType(value);//校验 0:否; 1:是;    非必填、必填
			statisticsInput.setInputTitle(value);//录入项名称
			statisticsInput.setInputOptions(value);//录入项对应的标准值
			statisticsInput.setInputTrue(value);//录入项作答数
			statisticsInput.setSortGrade(value);//录入项排序 越小越靠前
			statisticsInput.setCountExampleSum(value);//录入项数据总量
			statisticsInput.setExamplePrc(value);//录入项填写率
			statisticsInput.setUpdateDate(new Timestamp(new Date().getTime()));//更新时间
			*/
			statisticsInputService.insert(statisticsInput);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			statisticsInput.setUpdateDate(new Timestamp(new Date().getTime()));//更新时间
			statisticsInputService.updateById(statisticsInput);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/statisticsInput/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/statisticsInput/view/{id}")
	public String view(
			@PathVariable(value = "id") BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		StatisticsInputBean statisticsInput = statisticsInputService.selectById(id);
		model.addAttribute("statisticsInput",statisticsInput);
		model.addAttribute("pageNo", pageNo);
		return "statisticsInput/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/statisticsInput/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = statisticsInputService.batchDelete(items);
		int i=  statisticsInputService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/statisticsInput/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/statisticsInput//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "statisticsInput") StatisticsInputBean statisticsInput, 
			HttpServletRequest request ) {
		String str =null;
		if(statisticsInput.getId()==null){
			/*
			statisticsInput.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//ID 主键
			statisticsInput.setInvestigationId(value);//t_investigation_info_main主键
			statisticsInput.setFormId(value);//模板ID
			statisticsInput.setInputId(value);//录入项ID
			statisticsInput.setInputType(value);//录入项类型 录入项类型
			statisticsInput.setCheckType(value);//校验 0:否; 1:是;    非必填、必填
			statisticsInput.setInputTitle(value);//录入项名称
			statisticsInput.setInputOptions(value);//录入项对应的标准值
			statisticsInput.setInputTrue(value);//录入项作答数
			statisticsInput.setSortGrade(value);//录入项排序 越小越靠前
			statisticsInput.setCountExampleSum(value);//录入项数据总量
			statisticsInput.setExamplePrc(value);//录入项填写率
			statisticsInput.setUpdateDate(new Timestamp(new Date().getTime()));//更新时间
			*/
			statisticsInputService.insert(statisticsInput);
			
			  str = "创建成功！";
		}else{//编辑
			statisticsInput.setUpdateDate(new Timestamp(new Date().getTime()));//更新时间
			statisticsInputService.updateById(statisticsInput);
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
	@RequestMapping(value = "/statisticsInput/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = statisticsInputService.batchDelete(items);
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
	@RequestMapping(value = "/statisticsInput/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public StatisticsInputBean jsonSave(
			@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request ) {
		    StatisticsInputBean statisticsInput = statisticsInputService.selectById(id);
	  return  statisticsInput ;
	} 
	
}