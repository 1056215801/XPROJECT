
package com.chinatelecom.jx.zone.management.controller.investigationInfo;

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
import com.chinatelecom.jx.zone.management.bean.investigationInfo.InvestigationInfoExampleBean;
import com.chinatelecom.jx.zone.management.service.investigationInfo.IInvestigationInfoExampleService;

@Controller
//@RequestMapping(value = "/investigationinfoexample")
public class InvestigationInfoExampleController extends BaseController {
	@Autowired
	private IInvestigationInfoExampleService investigationInfoExampleService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(InvestigationInfoExampleController.class);
 
	/**
	 * 列表
	 * @param investigationInfoExample
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/investigationInfoExample/list")
	public String list(@ModelAttribute("investigationInfoExample") InvestigationInfoExampleBean investigationInfoExample, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<InvestigationInfoExampleBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<InvestigationInfoExampleBean>)investigationInfoExampleService.queryByCond(null);
		setPageInfo(page, model, "investigationInfoExample/list");
		model.addAttribute("searchKey", searchKey);
		return "investigationInfoExample/list";
	}
	
	/**
	 * 新增 
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/investigationInfoExample/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 InvestigationInfoExampleBean  investigationInfoExample = new InvestigationInfoExampleBean();
			/* 初始化
			investigationInfoExample.setId(value);//主键id
			investigationInfoExample.setInvestigationId(value);//外键，关联调查表
			investigationInfoExample.setAccountId(value);//创建人id
			investigationInfoExample.setAccountName(value);//创建人名
			investigationInfoExample.setIpAddress(value);//ip地址
			investigationInfoExample.setSource(value);//数据来源1：PC 2：微信 
			investigationInfoExample.setStatus(value);//状态1：有效 0：无效
			investigationInfoExample.setCreateTime(value);//创建时间
			investigationInfoExample.setRemark(value);//备注
			investigationInfoExample.setExtend1(value);//备份1
			investigationInfoExample.setExtend2(value);//备份2
			investigationInfoExample.setExtend3(value);//备份3
			*/
		 
	  model.addAttribute("investigationInfoExample", investigationInfoExample);
	  model.addAttribute("pageNo", pageNo);
	  return "investigationInfoExample/edit";
	} 
	/**
	 * 编辑
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/investigationInfoExample/edit/{id}")
	public String create(
			@PathVariable(value = "id" ) BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   InvestigationInfoExampleBean investigationInfoExample = investigationInfoExampleService.selectById(id);
		 
	  model.addAttribute("investigationInfoExample", investigationInfoExample);
	  model.addAttribute("pageNo", pageNo);
	  return "investigationInfoExample/edit";
	}
	
	/**
	 * 保存操作
	 * @param investigationInfoExample
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/investigationInfoExample/save")
	public String save(
			@ModelAttribute(value = "investigationInfoExample") InvestigationInfoExampleBean investigationInfoExample, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(investigationInfoExample.getId()==null){
			/*  
			investigationInfoExample.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键id
			investigationInfoExample.setInvestigationId(value);//外键，关联调查表
			investigationInfoExample.setAccountId(value);//创建人id
			investigationInfoExample.setAccountName(value);//创建人名
			investigationInfoExample.setIpAddress(value);//ip地址
			investigationInfoExample.setSource(value);//数据来源1：PC 2：微信 
			investigationInfoExample.setStatus(value);//状态1：有效 0：无效
			investigationInfoExample.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			investigationInfoExample.setRemark(value);//备注
			investigationInfoExample.setExtend1(value);//备份1
			investigationInfoExample.setExtend2(value);//备份2
			investigationInfoExample.setExtend3(value);//备份3
			*/
			investigationInfoExampleService.insert(investigationInfoExample);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			investigationInfoExample.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			investigationInfoExampleService.updateById(investigationInfoExample);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/investigationInfoExample/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/investigationInfoExample/view/{id}")
	public String view(
			@PathVariable(value = "id") BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		InvestigationInfoExampleBean investigationInfoExample = investigationInfoExampleService.selectById(id);
		model.addAttribute("investigationInfoExample",investigationInfoExample);
		model.addAttribute("pageNo", pageNo);
		return "investigationInfoExample/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/investigationInfoExample/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = investigationInfoExampleService.batchDelete(items);
		int i=  investigationInfoExampleService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/investigationInfoExample/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/investigationInfoExample//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "investigationInfoExample") InvestigationInfoExampleBean investigationInfoExample, 
			HttpServletRequest request ) {
		String str =null;
		if(investigationInfoExample.getId()==null){
			/*
			investigationInfoExample.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键id
			investigationInfoExample.setInvestigationId(value);//外键，关联调查表
			investigationInfoExample.setAccountId(value);//创建人id
			investigationInfoExample.setAccountName(value);//创建人名
			investigationInfoExample.setIpAddress(value);//ip地址
			investigationInfoExample.setSource(value);//数据来源1：PC 2：微信 
			investigationInfoExample.setStatus(value);//状态1：有效 0：无效
			investigationInfoExample.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			investigationInfoExample.setRemark(value);//备注
			investigationInfoExample.setExtend1(value);//备份1
			investigationInfoExample.setExtend2(value);//备份2
			investigationInfoExample.setExtend3(value);//备份3
			*/
			investigationInfoExampleService.insert(investigationInfoExample);
			
			  str = "创建成功！";
		}else{//编辑
			investigationInfoExample.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			investigationInfoExampleService.updateById(investigationInfoExample);
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
	@RequestMapping(value = "/investigationInfoExample/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = investigationInfoExampleService.batchDelete(items);
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
	@RequestMapping(value = "/investigationInfoExample/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public InvestigationInfoExampleBean jsonSave(
			@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request ) {
		    InvestigationInfoExampleBean investigationInfoExample = investigationInfoExampleService.selectById(id);
	  return  investigationInfoExample ;
	} 
	
}