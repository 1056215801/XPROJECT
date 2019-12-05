
package com.chinatelecom.jx.zone.management.controller.expShare;

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
import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareInfoBean;
import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareLabelBean;
import com.chinatelecom.jx.zone.management.service.expShare.IExpShareLabelService;

@Controller
//@RequestMapping(value = "/expsharelabel")
public class ExpShareLabelController extends BaseController {
	@Autowired
	private IExpShareLabelService expShareLabelService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(ExpShareLabelController.class);
 
	/**
	 * -------------------------------------------------------------------
	 *                            接口
	 * -------------------------------------------------------------------
	 */
	
	/**
	 * 保存
	 * @param inspectBean
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/json/expShareLabel/save")
	public String save(@ModelAttribute(value="expShareLabel") ExpShareLabelBean expShareLabel, 
			ModelMap modelMap){
		try{
			expShareLabel.setLabelId(seq.getNextSeqIdToBigDecimal());
			expShareLabelService.insert(expShareLabel);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "标签增加成功!");
		}catch(Exception e){
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "标签增加失败！");
		}
		return "jsonView";
		
	}
	/**
	 * 查看
	 * @param inspectBean
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/json/expShareLabel/view")
	public String view(@RequestParam(value="labelId") BigDecimal labelId,
			ModelMap modelMap){
		try{
			ExpShareLabelBean expShareLabel = expShareLabelService.selectById(labelId);
			modelMap.addAttribute("value", expShareLabel);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取详情成功!");
		}catch(Exception e){
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取详情失败！");
		}
		return "jsonView";
		
	}
	/**
	 * 删除
	 * @param inspectBean
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/json/expShareLabel/delete")
	public String inspectInsert(@RequestParam(value="ids") String ids,
			ModelMap modelMap){
		try{
			String[] idsStr = ids.split(",");
			for(int i = 0;i<idsStr.length;i++){
				expShareLabelService.deleteById(new BigDecimal(idsStr[i]));
			}
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "删除成功!");
		}catch(Exception e){
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "删除失败！");
		}
		return "jsonView";
		
	}
	
	
	/**
	 * ----------------------------------------------------------------
	 */
	
	
	
	/**
	 * 列表
	 * @param expShareLabel
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShareLabel/list")
	public String list(@ModelAttribute("expShareLabel") ExpShareLabelBean expShareLabel, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<ExpShareLabelBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<ExpShareLabelBean>)expShareLabelService.queryByCond(null);
		setPageInfo(page, model, "expShareLabel/list");
		model.addAttribute("searchKey", searchKey);
		return "expShareLabel/list";
	}
	
	/**
	 * 新增 
	 * @param labelId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShareLabel/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 ExpShareLabelBean  expShareLabel = new ExpShareLabelBean();
			/* 初始化
			expShareLabel.setLabelId(value);//标题id，主键
			expShareLabel.setLabelTitle(value);//标签名称
			expShareLabel.setLabelSort(value);//标签序号
			expShareLabel.setRemark(value);//备注
			*/
		 
	  model.addAttribute("expShareLabel", expShareLabel);
	  model.addAttribute("pageNo", pageNo);
	  return "expShareLabel/edit";
	} 
	/**
	 * 编辑
	 * @param labelId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShareLabel/edit/{id}")
	public String create(
			@PathVariable(value = "labelId" ) BigDecimal labelId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   ExpShareLabelBean expShareLabel = expShareLabelService.selectById(labelId);
		 
	  model.addAttribute("expShareLabel", expShareLabel);
	  model.addAttribute("pageNo", pageNo);
	  return "expShareLabel/edit";
	}
	
	/**
	 * 保存操作
	 * @param expShareLabel
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShareLabel/save")
	public String save(
			@ModelAttribute(value = "expShareLabel") ExpShareLabelBean expShareLabel, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(expShareLabel.getLabelId()==null){
			/*  
			expShareLabel.setLabelId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//标题id，主键
			expShareLabel.setLabelTitle(value);//标签名称
			expShareLabel.setLabelSort(value);//标签序号
			expShareLabel.setRemark(value);//备注
			*/
			expShareLabelService.insert(expShareLabel);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			expShareLabelService.updateById(expShareLabel);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/expShareLabel/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param labelId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/expShareLabel/view/{id}")
	public String view(
			@PathVariable(value = "labelId") BigDecimal labelId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		ExpShareLabelBean expShareLabel = expShareLabelService.selectById(labelId);
		model.addAttribute("expShareLabel",expShareLabel);
		model.addAttribute("pageNo", pageNo);
		return "expShareLabel/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/expShareLabel/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = expShareLabelService.batchDelete(items);
		int i=  expShareLabelService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/expShareLabel/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/expShareLabel//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "expShareLabel") ExpShareLabelBean expShareLabel, 
			HttpServletRequest request ) {
		String str =null;
		if(expShareLabel.getLabelId()==null){
			/*
			expShareLabel.setLabelId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//标题id，主键
			expShareLabel.setLabelTitle(value);//标签名称
			expShareLabel.setLabelSort(value);//标签序号
			expShareLabel.setRemark(value);//备注
			*/
			expShareLabelService.insert(expShareLabel);
			
			  str = "创建成功！";
		}else{//编辑
			expShareLabelService.updateById(expShareLabel);
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
	@RequestMapping(value = "/expShareLabel/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = expShareLabelService.batchDelete(items);
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
	@RequestMapping(value = "/expShareLabel/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ExpShareLabelBean jsonSave(
			@RequestParam(value = "labelId") BigDecimal labelId,
			HttpServletRequest request ) {
		    ExpShareLabelBean expShareLabel = expShareLabelService.selectById(labelId);
	  return  expShareLabel ;
	} 
	
}