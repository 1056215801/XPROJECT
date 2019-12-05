
package com.chinatelecom.jx.zone.management.controller.formInput;

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
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.formInput.FormInputProinstBean;
import com.chinatelecom.jx.zone.management.service.formInput.IFormInputProinstService;

@Controller
//@RequestMapping(value = "/forminputproinst")
public class FormInputProinstController extends BaseController {
	@Autowired
	private IFormInputProinstService formInputProinstService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(FormInputProinstController.class);
 
	/**
	 * 列表
	 * @param formInputProinst
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/formInputProinst/list")
	public String list(@ModelAttribute("formInputProinst") FormInputProinstBean formInputProinst, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<FormInputProinstBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<FormInputProinstBean>)formInputProinstService.queryByCond(null);
		setPageInfo(page, model, "formInputProinst/list");
		model.addAttribute("searchKey", searchKey);
		return "formInputProinst/list";
	}
	
	/**
	 * 新增 
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/formInputProinst/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 FormInputProinstBean  formInputProinst = new FormInputProinstBean();
			/* 初始化
			formInputProinst.setId(value);//录入项ID
			formInputProinst.setInputType(value);//录入项类型 录入项类型，参考元素设计 text单行文本
number数值
textarea多行文本
richtext富文本编辑器
radio单选
checkbox多选
select下拉
selectmore下拉多选
date日期
hidden隐藏域
file上传
sub子表单
line分割线
			formInputProinst.setInputTitle(value);//录入项标题
			formInputProinst.setFiledName(value);//录入项字段名
			formInputProinst.setInputValue(value);//录入值
			formInputProinst.setStatusFlag(value);//录入状态  0未录入 1已录入 3无效
			formInputProinst.setAccountId(value);//创建人ID
			formInputProinst.setCreateTime(value);//创建时间
			formInputProinst.setDataFormat(value);//录入数据格式 有的元素有此属性，格式参考元素设计，日期格式
			formInputProinst.setDefaultValue(value);//默认值
			formInputProinst.setCheckType(value);//校验 0:否; 1:是;    非必填、必填
			formInputProinst.setFuncPermission(value);//权限 查看只读、编辑、可见、隐藏
			formInputProinst.setSortGrade(value);//排序 越小越靠前
			formInputProinst.setMinValue(value);//最小值 数值文本框特有属性
			formInputProinst.setMaxValue(value);//最大值 数值文本框特有属性
			formInputProinst.setPrecision(value);//小数点后几位 数值文本框特有属性
			formInputProinst.setOptions(value);//选项 手动输入，或数据源
			formInputProinst.setFormId(value);//表单模板ID 所属模板（表单）ID
			formInputProinst.setPromptMsg(value);//录入项提示 提示信息，如提示输入数据格式等.功能同input的title提示
			formInputProinst.setInputParams(value);//数据来源 1.单选框、复选框数据来源，对应表单参数表； 2.子表单对应的模板ID；
			formInputProinst.setWorkitemid(value);//工作项ID
			formInputProinst.setActionid(value);//环节ID
			formInputProinst.setActionname(value);//环节名称
			formInputProinst.setRelationId(value);//业务表主键
			formInputProinst.setRepeatFlag(value);//重复处理时标识 1:更新、2:插入
			formInputProinst.setIsXml(value);//是否将此数据保存至数据区 0:否; 1:是;
			formInputProinst.setXmlName(value);//对应的变量名 流程校验时，检查是否存在相同的变量名，存入数据区是为了此值会进行线的流转
			formInputProinst.setExtend1(value);//备份1
			formInputProinst.setExtend2(value);//备份2
			formInputProinst.setExtend3(value);//备份3
			*/
		 
	  model.addAttribute("formInputProinst", formInputProinst);
	  model.addAttribute("pageNo", pageNo);
	  return "formInputProinst/edit";
	} 
	/**
	 * 编辑
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/formInputProinst/edit/{id}")
	public String create(
			@PathVariable(value = "id" ) BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   FormInputProinstBean formInputProinst = formInputProinstService.selectById(id);
		 
	  model.addAttribute("formInputProinst", formInputProinst);
	  model.addAttribute("pageNo", pageNo);
	  return "formInputProinst/edit";
	}
	
	/**
	 * 保存操作
	 * @param formInputProinst
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/formInputProinst/save")
	public String save(
			@ModelAttribute(value = "formInputProinst") FormInputProinstBean formInputProinst, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(formInputProinst.getId()==null){
			/*  
			formInputProinst.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//录入项ID
			formInputProinst.setInputType(value);//录入项类型 录入项类型，参考元素设计 text单行文本
number数值
textarea多行文本
richtext富文本编辑器
radio单选
checkbox多选
select下拉
selectmore下拉多选
date日期
hidden隐藏域
file上传
sub子表单
line分割线
			formInputProinst.setInputTitle(value);//录入项标题
			formInputProinst.setFiledName(value);//录入项字段名
			formInputProinst.setInputValue(value);//录入值
			formInputProinst.setStatusFlag(value);//录入状态  0未录入 1已录入 3无效
			formInputProinst.setAccountId(value);//创建人ID
			formInputProinst.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			formInputProinst.setDataFormat(value);//录入数据格式 有的元素有此属性，格式参考元素设计，日期格式
			formInputProinst.setDefaultValue(value);//默认值
			formInputProinst.setCheckType(value);//校验 0:否; 1:是;    非必填、必填
			formInputProinst.setFuncPermission(value);//权限 查看只读、编辑、可见、隐藏
			formInputProinst.setSortGrade(value);//排序 越小越靠前
			formInputProinst.setMinValue(value);//最小值 数值文本框特有属性
			formInputProinst.setMaxValue(value);//最大值 数值文本框特有属性
			formInputProinst.setPrecision(value);//小数点后几位 数值文本框特有属性
			formInputProinst.setOptions(value);//选项 手动输入，或数据源
			formInputProinst.setFormId(value);//表单模板ID 所属模板（表单）ID
			formInputProinst.setPromptMsg(value);//录入项提示 提示信息，如提示输入数据格式等.功能同input的title提示
			formInputProinst.setInputParams(value);//数据来源 1.单选框、复选框数据来源，对应表单参数表； 2.子表单对应的模板ID；
			formInputProinst.setWorkitemid(value);//工作项ID
			formInputProinst.setActionid(value);//环节ID
			formInputProinst.setActionname(value);//环节名称
			formInputProinst.setRelationId(value);//业务表主键
			formInputProinst.setRepeatFlag(value);//重复处理时标识 1:更新、2:插入
			formInputProinst.setIsXml(value);//是否将此数据保存至数据区 0:否; 1:是;
			formInputProinst.setXmlName(value);//对应的变量名 流程校验时，检查是否存在相同的变量名，存入数据区是为了此值会进行线的流转
			formInputProinst.setExtend1(value);//备份1
			formInputProinst.setExtend2(value);//备份2
			formInputProinst.setExtend3(value);//备份3
			*/
			formInputProinstService.insert(formInputProinst);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			formInputProinst.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			formInputProinstService.updateById(formInputProinst);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/formInputProinst/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/formInputProinst/view/{id}")
	public String view(
			@PathVariable(value = "id") BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		FormInputProinstBean formInputProinst = formInputProinstService.selectById(id);
		model.addAttribute("formInputProinst",formInputProinst);
		model.addAttribute("pageNo", pageNo);
		return "formInputProinst/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/formInputProinst/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = formInputProinstService.batchDelete(items);
		int i=  formInputProinstService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/formInputProinst/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/formInputProinst//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "formInputProinst") FormInputProinstBean formInputProinst, 
			HttpServletRequest request ) {
		String str =null;
		if(formInputProinst.getId()==null){
			/*
			formInputProinst.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//录入项ID
			formInputProinst.setInputType(value);//录入项类型 录入项类型，参考元素设计 text单行文本
number数值
textarea多行文本
richtext富文本编辑器
radio单选
checkbox多选
select下拉
selectmore下拉多选
date日期
hidden隐藏域
file上传
sub子表单
line分割线
			formInputProinst.setInputTitle(value);//录入项标题
			formInputProinst.setFiledName(value);//录入项字段名
			formInputProinst.setInputValue(value);//录入值
			formInputProinst.setStatusFlag(value);//录入状态  0未录入 1已录入 3无效
			formInputProinst.setAccountId(value);//创建人ID
			formInputProinst.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			formInputProinst.setDataFormat(value);//录入数据格式 有的元素有此属性，格式参考元素设计，日期格式
			formInputProinst.setDefaultValue(value);//默认值
			formInputProinst.setCheckType(value);//校验 0:否; 1:是;    非必填、必填
			formInputProinst.setFuncPermission(value);//权限 查看只读、编辑、可见、隐藏
			formInputProinst.setSortGrade(value);//排序 越小越靠前
			formInputProinst.setMinValue(value);//最小值 数值文本框特有属性
			formInputProinst.setMaxValue(value);//最大值 数值文本框特有属性
			formInputProinst.setPrecision(value);//小数点后几位 数值文本框特有属性
			formInputProinst.setOptions(value);//选项 手动输入，或数据源
			formInputProinst.setFormId(value);//表单模板ID 所属模板（表单）ID
			formInputProinst.setPromptMsg(value);//录入项提示 提示信息，如提示输入数据格式等.功能同input的title提示
			formInputProinst.setInputParams(value);//数据来源 1.单选框、复选框数据来源，对应表单参数表； 2.子表单对应的模板ID；
			formInputProinst.setWorkitemid(value);//工作项ID
			formInputProinst.setActionid(value);//环节ID
			formInputProinst.setActionname(value);//环节名称
			formInputProinst.setRelationId(value);//业务表主键
			formInputProinst.setRepeatFlag(value);//重复处理时标识 1:更新、2:插入
			formInputProinst.setIsXml(value);//是否将此数据保存至数据区 0:否; 1:是;
			formInputProinst.setXmlName(value);//对应的变量名 流程校验时，检查是否存在相同的变量名，存入数据区是为了此值会进行线的流转
			formInputProinst.setExtend1(value);//备份1
			formInputProinst.setExtend2(value);//备份2
			formInputProinst.setExtend3(value);//备份3
			*/
			formInputProinstService.insert(formInputProinst);
			
			  str = "创建成功！";
		}else{//编辑
			formInputProinst.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			formInputProinstService.updateById(formInputProinst);
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
	@RequestMapping(value = "/formInputProinst/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = formInputProinstService.batchDelete(items);
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
	@RequestMapping(value = "/formInputProinst/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public FormInputProinstBean jsonSave(
			@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request ) {
		    FormInputProinstBean formInputProinst = formInputProinstService.selectById(id);
	  return  formInputProinst ;
	} 
	
	
	
	/**
	 * json 保存 录入值
	 * code代码 1：数据保存成功 0：失败 -1：系统异常
	 */
	@RequestMapping(value = "/formInputProinst/json/valueSave", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean valueSave(
			@RequestParam(value = "id")BigDecimal id,
			@RequestParam(value = "value")String value
			){
		ResultBean resultBean = new ResultBean();
		int rst = 0;
		try{
			FormInputProinstBean formInputProinstBean = formInputProinstService
					.selectById(id);
			formInputProinstBean.setInputValue(value);
			rst = formInputProinstService.updateById(formInputProinstBean);
			
			if(rst==0){
				resultBean.setCode(0);
				resultBean.setMsg("录入数据保存失败");
			}
			resultBean.setCode(1);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			resultBean.setCode(-1);
			resultBean.setMsg("系统异常");
		}
		
		return resultBean;
	}
}