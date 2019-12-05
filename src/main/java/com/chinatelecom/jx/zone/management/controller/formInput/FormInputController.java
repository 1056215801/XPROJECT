
package com.chinatelecom.jx.zone.management.controller.formInput;

import java.math.BigDecimal;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chinatelecom.jx.zone.management.bean.formInput.FormInputBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.formInput.IFormInputService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
public class FormInputController extends BaseController {
	@Autowired
	private IFormInputService formInputService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(FormInputController.class);
 
	/**
	 * 列表
	 * @param formInput
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/formInput/list")
	public String list(@ModelAttribute("formInput") FormInputBean formInput, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<FormInputBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<FormInputBean>)formInputService.queryByCond(null);
		setPageInfo(page, model, "formInput/list");
		model.addAttribute("searchKey", searchKey);
		return "formInput/list";
	}
	
	/**
	 * 新增 
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/formInput/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
	  FormInputBean  formInput = new FormInputBean();
	  model.addAttribute("formInput", formInput);
	  model.addAttribute("pageNo", pageNo);
	  return "formInput/edit";
	} 
	/**
	 * 编辑
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/formInput/edit/{id}")
	public String create(
			@PathVariable(value = "id" ) BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   FormInputBean formInput = formInputService.selectById(id);
		 
	  model.addAttribute("formInput", formInput);
	  model.addAttribute("pageNo", pageNo);
	  return "formInput/edit";
	}
	
	/**
	 * 保存操作
	 * @param formInput
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/formInput/save")
	public String save(
			@ModelAttribute(value = "formInput") FormInputBean formInput, 
			@RequestParam(value = "templateId") BigDecimal templateId,//模板ID
			@RequestParam(value = "tagNames") String tagNames,//模板ID
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(formInput.getId()==null){
			int result = formInputService.saveInputItems(formInput, templateId, tagNames, request, seq);
			String str = "创建成功！";
			if(result == -1){
				str = "创建失败！";
			}
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			formInputService.updateById(formInput);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/formTemplate/list" ;
		
	}
	
	/**
	 * 保存操作
	 * @param formInput
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/formInput/saveNew")
	public String saveNew(
			@ModelAttribute(value = "formInput") FormInputBean formInput, 
			@RequestParam(value = "templateId") BigDecimal templateId,//模板ID
			@RequestParam(value = "tagNames") String tagNames,//模板ID
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(formInput.getId()==null){
			int result = formInputService.saveInputItemsNew(formInput, templateId, tagNames, request, seq);
			String str = "创建成功！";
			if(result == -1){
				str = "创建失败！";
			}
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			formInputService.updateById(formInput);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
//		return "redirect:/formTemplate/list" ;
		return "redirect:/investigationInfoMain/myList" ;
	}
	
	/**
	 * 查看详细
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/formInput/view")
	public String view(
			@PathVariable(value = "id") BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		FormInputBean formInput = formInputService.selectById(id);
		model.addAttribute("formInput",formInput);
		model.addAttribute("pageNo", pageNo);
		return "formInput/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/formInput/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = formInputService.batchDelete(items);
		int i=  formInputService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/formInput/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/formInput//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "formInput") FormInputBean formInput, 
			HttpServletRequest request ) {
		String str =null;
		if(formInput.getId()==null){
			/*
			formInput.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//录入项ID
			formInput.setInputType(value);//录入项类型 录入项类型，参考元素设计 text单行文本
			formInput.setInputTitle(value);//录入项标题
			formInput.setFiledName(value);//录入项字段名
			formInput.setDataFormat(value);//录入数据格式 有的元素有此属性，格式参考元素设计，日期格式
			formInput.setDefaultValue(value);//默认值
			formInput.setCheckType(value);//校验 0:否; 1:是;    非必填、必填
			formInput.setFuncPermission(value);//权限   查看只读(read)、编辑(edit)、可见(view)、隐藏(hidden)
			formInput.setSortGrade(value);//排序 越小越靠前
			formInput.setMinValue(value);//最小值 数值文本框特有属性
			formInput.setMaxValue(value);//最大值 数值文本框特有属性
			formInput.setPrecision(value);//小数点后几位 数值文本框特有属性
			formInput.setOptions(value);//选项 手动输入，或数据源
			formInput.setFormId(value);//表单模板ID 所属模板（表单）ID 
			formInput.setPromptMsg(value);//录入项提示 提示信息，如提示输入数据格式等.功能同input的title提示
			formInput.setInputParams(value);//数据来源 1.单选框、复选框数据来源，对应表单参数表； 2.子表单对应的模板ID；
			formInput.setRepeatFlag(value);//重复处理时标识 1:更新、2:插入
			formInput.setIsXml(value);//是否将此数据保存至数据区 0:否; 1:是; 
			formInput.setXmlName(value);//对应的变量名 流程校验时，检查是否存在相同的变量名，存入数据区是为了此值会进行线的流转
			formInput.setExtend1(value);//备份1
			formInput.setExtend2(value);//备份2
			formInput.setExtend3(value);//备份3
			*/
			formInputService.insert(formInput);
			
			  str = "创建成功！";
		}else{//编辑
			formInputService.updateById(formInput);
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
	@RequestMapping(value = "/formInput/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = formInputService.batchDelete(items);
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
	@RequestMapping(value = "/formInput/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public FormInputBean jsonSave(
			@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request ) {
		    FormInputBean formInput = formInputService.selectById(id);
	  return  formInput ;
	} 
	
}