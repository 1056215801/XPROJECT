
package com.chinatelecom.jx.zone.management.controller.formTemplate;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

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
import com.chinatelecom.jx.zone.management.bean.formTemplate.FormTemplateBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.formInput.IFormInputService;
import com.chinatelecom.jx.zone.management.service.formTemplate.IFormTemplateService;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
public class FormTemplateController extends BaseController {
	@Autowired
	private IFormTemplateService formTemplateService;
	@Autowired
	private IFormInputService formInputService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(FormTemplateController.class);
 
	/**
	 * 列表
	 * @param formTemplate
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/formTemplate/list")
	public String list(@ModelAttribute("formTemplate") FormTemplateBean formTemplate, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<FormTemplateBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<FormTemplateBean>)formTemplateService.queryByCond(null);
		setPageInfo(page, model, "formTemplate/list");
		model.addAttribute("searchKey", searchKey);
		return "formTemplate/formTemplateList";
	}
	
	/**
	 * 新增 
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/formTemplate/add")
	public String add(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 FormTemplateBean  formTemplate = new FormTemplateBean();
			/* 初始化
			formTemplate.setId(value);//表单模板ID
			formTemplate.setFormName(value);//表单名称
			formTemplate.setFormDesc(value);//表单描述
			formTemplate.setStatusFlag(value);//状态 0:无效; 1:有效 ;
			formTemplate.setCreateOperatorId(value);//创建人
			formTemplate.setCreateTime(value);//创建时间
			formTemplate.setUpdateTime(value);//最后修改时间
			formTemplate.setParkId(value);//所属园区 可为空
			formTemplate.setQuoteFormId(value);//引用模板ID 在其他表单基础上修改用到，与子表单概念不要混淆
			formTemplate.setRelationType(value);//业务类型 对应的业务类型 1：项目申报 2：在线调查
			formTemplate.setShowUrl(value);//查看页面URL
			formTemplate.setEditUrl(value);//编辑页面URL
			formTemplate.setBrief(value);//备注
			formTemplate.setExtend1(value);//备份1
			formTemplate.setExtend2(value);//备份2
			formTemplate.setExtend3(value);//备份3
			*/
		 
	  model.addAttribute("formTemplate", formTemplate);
	  model.addAttribute("pageNum", pageNo);
	  return "formTemplate/formTemplateForm";
	} 
	/**
	 * 编辑
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/formTemplate/edit/{id}")
	public String create(
			@PathVariable(value = "id" ) BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
	  FormTemplateBean formTemplate = formTemplateService.selectById(id);
		 
	  model.addAttribute("formTemplate", formTemplate);
	  model.addAttribute("pageNum", pageNo);
	  return "formTemplate/formTemplateForm";
	}
	
	/**
	 * 保存操作
	 * @param formTemplate
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/formTemplate/save")
	public String save(
			@ModelAttribute(value = "formTemplate") FormTemplateBean formTemplate, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(formTemplate.getId()==null){
			formTemplate.setId(seq.getNextSeqIdToBigDecimal());//表单模板ID
//			formTemplate.setCreateOperatorId(value);//创建人
			formTemplate.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			formTemplate.setUpdateTime(new Timestamp(new Date().getTime()));//最后修改时间
//			formTemplate.setParkId();//所属园区 可为空
//			formTemplate.setQuoteFormId(value);//引用模板ID 在其他表单基础上修改用到，与子表单概念不要混淆
			formTemplateService.insert(formTemplate);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			formTemplate.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			formTemplate.setUpdateTime(new Timestamp(new Date().getTime()));//最后修改时间
			formTemplateService.updateById(formTemplate);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNum", pageNo);
		return "redirect:/formTemplate/list";
		
	}
	
	/**
	 * 查看详细
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/formTemplate/view/{id}")
	public String view(
			@PathVariable(value = "id") BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		FormTemplateBean formTemplate = formTemplateService.selectById(id);
		model.addAttribute("formTemplate",formTemplate);
		model.addAttribute("pageNum", pageNo);
		return "formTemplate/formTemplateView";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/formTemplate/delete")
	public String delete(
			@RequestParam(value = "items") String[] items,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		int i = formTemplateService.batchDelete(items);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/formTemplate/list";
	}
	
	@RequestMapping(value = "/formTemplate/createInputItems")
	public String createInputItems(@ModelAttribute("formTemplate") FormTemplateBean formTemplate, 
			@RequestParam(value = "pageNum", required = false,defaultValue="1") int pageNum, Model model) {
		//获取所有的模板
		FormTemplateBean template = new FormTemplateBean();
		template.setOrderByClause("create_time desc");
		List<FormTemplateBean> templateList = formTemplateService.queryByCond(template);
		model.addAttribute("templateList",templateList);
		
		formTemplate = formTemplateService.selectById(formTemplate.getId());
		model.addAttribute("formTemplate",formTemplate);
		
		//获取已配置的录入项
		FormInputBean bean = new FormInputBean();
		bean.setFormId(formTemplate.getId());
		bean.setOrderByClause("to_number(sort_grade) asc,id asc");
		List<FormInputBean> inputList = formInputService.queryByCond(bean);
		
		model.addAttribute("inputList",inputList);
		model.addAttribute("formTemplate",formTemplate);
//		if(inputList == null || inputList.size() == 0){
//			return "formTemplate/inputItemsForm";
//		}else{
			int rdoIndex = 0;//单选项
			int ckbIndex = 0;//复选项
			int slcIndex = 0;//下拉选项
			int slmIndex = 0;//下拉复选项
			String tagNames = "";
			int i = 1;
			for(FormInputBean input : inputList){
				tagNames += ";item"+i+"_"+input.getInputType();
				if("radio".equals(input.getInputType())){
					if(StringUtil.checkNotNull(input.getOptions())){
						rdoIndex+=input.getOptions().split("_:").length;
					}
				}else if("checkbox".equals(input.getInputType())){
					if(StringUtil.checkNotNull(input.getOptions())){
						ckbIndex+=input.getOptions().split("_:").length;
					}
				}else if("select".equals(input.getInputType())){
					if(StringUtil.checkNotNull(input.getOptions())){
						slcIndex+=input.getOptions().split("_:").length;
					}
				}else if("selectmore".equals(input.getInputType())){
					if(StringUtil.checkNotNull(input.getOptions())){
						slmIndex+=input.getOptions().split("_:").length;
					}
				}
				i++;
			}
			model.addAttribute("tagNames",tagNames);
			model.addAttribute("size",inputList.size()+1);
			model.addAttribute("rdoIndex",rdoIndex+1);
			model.addAttribute("ckbIndex",ckbIndex+1);
			model.addAttribute("slcIndex",slcIndex+1);
			model.addAttribute("slmIndex",slmIndex+1);
			return "formTemplate/inputItemsEditForm";
//		}
	}
	
	@RequestMapping(value = "/formTemplate/createInputItemsForNew")
	public String createInputItemsForNew(@ModelAttribute("formTemplate") FormTemplateBean formTemplate, 
			@RequestParam(value = "pageNum", required = false,defaultValue="1") int pageNum, Model model) {
		//获取所有的模板
		FormTemplateBean template = new FormTemplateBean();
		template.setOrderByClause("create_time desc");
		List<FormTemplateBean> templateList = formTemplateService.queryByCond(template);
		model.addAttribute("templateList",templateList);
		
		formTemplate = formTemplateService.selectById(formTemplate.getId());
		model.addAttribute("formTemplate",formTemplate);
		
		//获取已配置的录入项
		FormInputBean bean = new FormInputBean();
		bean.setFormId(formTemplate.getId());
		bean.setOrderByClause("to_number(sort_grade) asc,id asc");
		List<FormInputBean> inputList = formInputService.queryByCond(bean);
		
		model.addAttribute("inputList",inputList);
		model.addAttribute("formTemplate",formTemplate);
//		if(inputList == null || inputList.size() == 0){
//			return "formTemplate/inputItemsForm";
//		}else{
			int rdoIndex = 0;//单选项
			int ckbIndex = 0;//复选项
			int slcIndex = 0;//下拉选项
			int slmIndex = 0;//下拉复选项
			String tagNames = "";
			int i = 1;
			for(FormInputBean input : inputList){
				tagNames += ";item"+i+"_"+input.getInputType();
				if("radio".equals(input.getInputType())){
					if(StringUtil.checkNotNull(input.getOptions())){
						rdoIndex+=input.getOptions().split("_:").length;
					}
				}else if("checkbox".equals(input.getInputType())){
					if(StringUtil.checkNotNull(input.getOptions())){
						ckbIndex+=input.getOptions().split("_:").length;
					}
				}else if("select".equals(input.getInputType())){
					if(StringUtil.checkNotNull(input.getOptions())){
						slcIndex+=input.getOptions().split("_:").length;
					}
				}else if("selectmore".equals(input.getInputType())){
					if(StringUtil.checkNotNull(input.getOptions())){
						slmIndex+=input.getOptions().split("_:").length;
					}
				}
				i++;
			}
			model.addAttribute("tagNames",tagNames);
			model.addAttribute("size",inputList.size()+1);
			model.addAttribute("rdoIndex",rdoIndex+1);
			model.addAttribute("ckbIndex",ckbIndex+1);
			model.addAttribute("slcIndex",slcIndex+1);
			model.addAttribute("slmIndex",slmIndex+1);
			return "formTemplate/inputItemsNewForm";
//		}
	}
	
	@RequestMapping(value = "/formTemplate/preView")
	public String preView(
			@RequestParam(value = "id") BigDecimal id,
			@RequestParam(value = "formId") BigDecimal formId,
			@RequestParam(value = "status") BigDecimal status,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		//表单信息
		FormTemplateBean formTemplate = formTemplateService.selectById(formId);
		//对应配置的录入项信息
		FormInputBean inputBean = new FormInputBean();
		inputBean.setFormId(formTemplate.getId());
		inputBean.setOrderByClause("to_number(sort_grade) asc,id asc");
		List<FormInputBean> lstInput = formInputService.queryByCond(inputBean);
		//传到前台
		model.addAttribute("formTemplate",formTemplate);
		model.addAttribute("id",id);
		model.addAttribute("status",status);
		model.addAttribute("lstInput",lstInput);
		model.addAttribute("pageNum", pageNo);
		return "formInput/preView";
	}
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/formTemplate//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "formTemplate") FormTemplateBean formTemplate, 
			HttpServletRequest request ) {
		String str =null;
		if(formTemplate.getId()==null){
			/*
			formTemplate.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//表单模板ID
			formTemplate.setFormName(value);//表单名称
			formTemplate.setFormDesc(value);//表单描述
			formTemplate.setStatusFlag(value);//状态 0:无效; 1:有效 ;
			formTemplate.setCreateOperatorId(value);//创建人
			formTemplate.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			formTemplate.setUpdateTime(new Timestamp(new Date().getTime()));//最后修改时间
			formTemplate.setParkId(value);//所属园区 可为空
			formTemplate.setQuoteFormId(value);//引用模板ID 在其他表单基础上修改用到，与子表单概念不要混淆
			formTemplate.setRelationType(value);//业务类型 对应的业务类型 1：项目申报 2：在线调查
			formTemplate.setShowUrl(value);//查看页面URL
			formTemplate.setEditUrl(value);//编辑页面URL
			formTemplate.setBrief(value);//备注
			formTemplate.setExtend1(value);//备份1
			formTemplate.setExtend2(value);//备份2
			formTemplate.setExtend3(value);//备份3
			*/
			formTemplateService.insert(formTemplate);
			
			  str = "创建成功！";
		}else{//编辑
			formTemplate.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			formTemplate.setUpdateTime(new Timestamp(new Date().getTime()));//最后修改时间
			formTemplateService.updateById(formTemplate);
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
	@RequestMapping(value = "/formTemplate/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = formTemplateService.batchDelete(items);
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
	@RequestMapping(value = "/formTemplate/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public FormTemplateBean jsonSave(
			@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request ) {
		    FormTemplateBean formTemplate = formTemplateService.selectById(id);
	  return  formTemplate ;
	} 
	
	
	@RequestMapping(value = "/formTemplate/createInputItemsForTb")
	public String createInputItemsForTb(@ModelAttribute("formTemplate") FormTemplateBean formTemplate, 
			@RequestParam(value = "pageNum", required = false,defaultValue="1") int pageNum, Model model) {
		//获取所有的模板
		FormTemplateBean template = new FormTemplateBean();
		template.setOrderByClause("create_time desc");
		List<FormTemplateBean> templateList = formTemplateService.queryByCond(template);
		model.addAttribute("templateList",templateList);
		
		formTemplate = formTemplateService.selectById(formTemplate.getId());
		model.addAttribute("formTemplate",formTemplate);
		
		//获取已配置的录入项
		FormInputBean bean = new FormInputBean();
		bean.setFormId(formTemplate.getId());
		bean.setOrderByClause("to_number(sort_grade) asc,id asc");
		List<FormInputBean> inputList = formInputService.queryByCond(bean);
		
		model.addAttribute("inputList",inputList);
		model.addAttribute("formTemplate",formTemplate);
//		if(inputList == null || inputList.size() == 0){
//			return "formTemplate/inputItemsForm";
//		}else{
			int rdoIndex = 0;//单选项
			int ckbIndex = 0;//复选项
			int slcIndex = 0;//下拉选项
			int slmIndex = 0;//下拉复选项
			String tagNames = "";
			int i = 1;
			for(FormInputBean input : inputList){
				tagNames += ";item"+i+"_"+input.getInputType();
				if("radio".equals(input.getInputType())){
					if(StringUtil.checkNotNull(input.getOptions())){
						rdoIndex+=input.getOptions().split("_:").length;
					}
				}else if("checkbox".equals(input.getInputType())){
					if(StringUtil.checkNotNull(input.getOptions())){
						ckbIndex+=input.getOptions().split("_:").length;
					}
				}else if("select".equals(input.getInputType())){
					if(StringUtil.checkNotNull(input.getOptions())){
						slcIndex+=input.getOptions().split("_:").length;
					}
				}else if("selectmore".equals(input.getInputType())){
					if(StringUtil.checkNotNull(input.getOptions())){
						slmIndex+=input.getOptions().split("_:").length;
					}
				}
				i++;
			}
			model.addAttribute("tagNames",tagNames);
			model.addAttribute("size",inputList.size()+1);
			model.addAttribute("rdoIndex",rdoIndex+1);
			model.addAttribute("ckbIndex",ckbIndex+1);
			model.addAttribute("slcIndex",slcIndex+1);
			model.addAttribute("slmIndex",slmIndex+1);
			return "formTemplate/inputItemsNewForm";
//		}
	}
}