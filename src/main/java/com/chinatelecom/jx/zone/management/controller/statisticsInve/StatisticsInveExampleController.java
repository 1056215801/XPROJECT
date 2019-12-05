
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
import com.chinatelecom.jx.zone.management.bean.statisticsInve.StatisticsInveExampleBean;
import com.chinatelecom.jx.zone.management.service.statisticsInve.IStatisticsInveExampleService;

@Controller
//@RequestMapping(value = "/statisticsinveexample")
public class StatisticsInveExampleController extends BaseController {
	@Autowired
	private IStatisticsInveExampleService statisticsInveExampleService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(StatisticsInveExampleController.class);
 
	/**
	 * 列表
	 * @param statisticsInveExample
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsInveExample/list")
	public String list(@ModelAttribute("statisticsInveExample") StatisticsInveExampleBean statisticsInveExample, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<StatisticsInveExampleBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<StatisticsInveExampleBean>)statisticsInveExampleService.queryByCond(null);
		setPageInfo(page, model, "statisticsInveExample/list");
		model.addAttribute("searchKey", searchKey);
		return "statisticsInveExample/list";
	}
	
	/**
	 * 新增 
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsInveExample/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 StatisticsInveExampleBean  statisticsInveExample = new StatisticsInveExampleBean();
			/* 初始化
			statisticsInveExample.setId(value);//ID ，主键
			statisticsInveExample.setInvestigationId(value);//t_investigation_info_main主键
			statisticsInveExample.setFormId(value);//模板ID
			statisticsInveExample.setInputId(value);//录入项ID
			statisticsInveExample.setInputType(value);//录入项类型 录入项类型
			statisticsInveExample.setCheckType(value);//校验 0:否; 1:是;    非必填、必填
			statisticsInveExample.setInputTitle(value);//录入项名称
			statisticsInveExample.setInputOptions(value);//录入项对应的标准值
			statisticsInveExample.setInputTrue(value);//录入项作答数
			statisticsInveExample.setSortGrade(value);//录入项排序 越小越靠前
			statisticsInveExample.setCountExampleSum(value);//录入项数据总量
			statisticsInveExample.setExamplePrc(value);//录入项填写率
			statisticsInveExample.setOptions(value);//录入项对应的分解值
			statisticsInveExample.setInputProinstNum(value);//对应的分解值录入次数
			statisticsInveExample.setInputProinstPrc(value);//对应的分解值录入百分比
			statisticsInveExample.setUpdateDate(value);//更新时间
			*/
		 
	  model.addAttribute("statisticsInveExample", statisticsInveExample);
	  model.addAttribute("pageNo", pageNo);
	  return "statisticsInveExample/edit";
	} 
	/**
	 * 编辑
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsInveExample/edit/{id}")
	public String create(
			@PathVariable(value = "id" ) BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   StatisticsInveExampleBean statisticsInveExample = statisticsInveExampleService.selectById(id);
		 
	  model.addAttribute("statisticsInveExample", statisticsInveExample);
	  model.addAttribute("pageNo", pageNo);
	  return "statisticsInveExample/edit";
	}
	
	/**
	 * 保存操作
	 * @param statisticsInveExample
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsInveExample/save")
	public String save(
			@ModelAttribute(value = "statisticsInveExample") StatisticsInveExampleBean statisticsInveExample, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(statisticsInveExample.getId()==null){
			/*  
			statisticsInveExample.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//ID ，主键
			statisticsInveExample.setInvestigationId(value);//t_investigation_info_main主键
			statisticsInveExample.setFormId(value);//模板ID
			statisticsInveExample.setInputId(value);//录入项ID
			statisticsInveExample.setInputType(value);//录入项类型 录入项类型
			statisticsInveExample.setCheckType(value);//校验 0:否; 1:是;    非必填、必填
			statisticsInveExample.setInputTitle(value);//录入项名称
			statisticsInveExample.setInputOptions(value);//录入项对应的标准值
			statisticsInveExample.setInputTrue(value);//录入项作答数
			statisticsInveExample.setSortGrade(value);//录入项排序 越小越靠前
			statisticsInveExample.setCountExampleSum(value);//录入项数据总量
			statisticsInveExample.setExamplePrc(value);//录入项填写率
			statisticsInveExample.setOptions(value);//录入项对应的分解值
			statisticsInveExample.setInputProinstNum(value);//对应的分解值录入次数
			statisticsInveExample.setInputProinstPrc(value);//对应的分解值录入百分比
			statisticsInveExample.setUpdateDate(new Timestamp(new Date().getTime()));//更新时间
			*/
			statisticsInveExampleService.insert(statisticsInveExample);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			statisticsInveExample.setUpdateDate(new Timestamp(new Date().getTime()));//更新时间
			statisticsInveExampleService.updateById(statisticsInveExample);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/statisticsInveExample/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/statisticsInveExample/view/{id}")
	public String view(
			@PathVariable(value = "id") BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		StatisticsInveExampleBean statisticsInveExample = statisticsInveExampleService.selectById(id);
		model.addAttribute("statisticsInveExample",statisticsInveExample);
		model.addAttribute("pageNo", pageNo);
		return "statisticsInveExample/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/statisticsInveExample/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = statisticsInveExampleService.batchDelete(items);
		int i=  statisticsInveExampleService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/statisticsInveExample/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/statisticsInveExample//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "statisticsInveExample") StatisticsInveExampleBean statisticsInveExample, 
			HttpServletRequest request ) {
		String str =null;
		if(statisticsInveExample.getId()==null){
			/*
			statisticsInveExample.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//ID ，主键
			statisticsInveExample.setInvestigationId(value);//t_investigation_info_main主键
			statisticsInveExample.setFormId(value);//模板ID
			statisticsInveExample.setInputId(value);//录入项ID
			statisticsInveExample.setInputType(value);//录入项类型 录入项类型
			statisticsInveExample.setCheckType(value);//校验 0:否; 1:是;    非必填、必填
			statisticsInveExample.setInputTitle(value);//录入项名称
			statisticsInveExample.setInputOptions(value);//录入项对应的标准值
			statisticsInveExample.setInputTrue(value);//录入项作答数
			statisticsInveExample.setSortGrade(value);//录入项排序 越小越靠前
			statisticsInveExample.setCountExampleSum(value);//录入项数据总量
			statisticsInveExample.setExamplePrc(value);//录入项填写率
			statisticsInveExample.setOptions(value);//录入项对应的分解值
			statisticsInveExample.setInputProinstNum(value);//对应的分解值录入次数
			statisticsInveExample.setInputProinstPrc(value);//对应的分解值录入百分比
			statisticsInveExample.setUpdateDate(new Timestamp(new Date().getTime()));//更新时间
			*/
			statisticsInveExampleService.insert(statisticsInveExample);
			
			  str = "创建成功！";
		}else{//编辑
			statisticsInveExample.setUpdateDate(new Timestamp(new Date().getTime()));//更新时间
			statisticsInveExampleService.updateById(statisticsInveExample);
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
	@RequestMapping(value = "/statisticsInveExample/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = statisticsInveExampleService.batchDelete(items);
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
	@RequestMapping(value = "/statisticsInveExample/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public StatisticsInveExampleBean jsonSave(
			@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request ) {
		    StatisticsInveExampleBean statisticsInveExample = statisticsInveExampleService.selectById(id);
	  return  statisticsInveExample ;
	} 
	
}