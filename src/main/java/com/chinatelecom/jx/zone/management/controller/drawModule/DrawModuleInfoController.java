
package com.chinatelecom.jx.zone.management.controller.drawModule;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.chinatelecom.jx.zone.management.bean.drawModule.DrawModuleInfoBean;
import com.chinatelecom.jx.zone.management.bean.drawTable.DrawTableInfoBean;
import com.chinatelecom.jx.zone.management.bean.drawTd.DrawTdInfoBean;
import com.chinatelecom.jx.zone.management.bean.drawTd.DrawTdInputBean;
import com.chinatelecom.jx.zone.management.bean.formInput.FormInputBean;
import com.chinatelecom.jx.zone.management.bean.formInput.FormInputExampleBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.drawModule.IDrawModuleInfoService;
import com.chinatelecom.jx.zone.management.service.drawTable.IDrawTableInfoService;
import com.chinatelecom.jx.zone.management.service.drawTd.IDrawTdInfoService;
import com.chinatelecom.jx.zone.management.service.drawTd.IDrawTdInputService;
import com.chinatelecom.jx.zone.management.service.formInput.IFormInputService;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
//@RequestMapping(value = "/drawmoduleinfo")
public class DrawModuleInfoController extends BaseController {
	@Autowired
	private IDrawModuleInfoService drawModuleInfoService;
	@Autowired
	private IDrawTableInfoService drawTableInfoService;
	@Autowired
	private IFormInputService formInputService;
	@Autowired
	private IDrawTdInfoService drawTdInfoService;
	@Autowired
	private IDrawTdInputService drawTdInputService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(DrawModuleInfoController.class);
 
	/**
	 * 列表
	 * @param drawModuleInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawModuleInfo/list")
	public String list(@ModelAttribute("drawModuleInfo") DrawModuleInfoBean drawModuleInfo, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<DrawModuleInfoBean> page, Model model) {
		drawModuleInfo.setParentId(new BigDecimal("-1"));
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<DrawModuleInfoBean>)drawModuleInfoService.queryByCond(drawModuleInfo);
		setPageInfo(page, model, "drawModuleInfo/list");
		model.addAttribute("searchKey", searchKey);
		return "drawModuleInfo/drawModuleInfoList";
	}
	
	/**
	 * 新增 
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawModuleInfo/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			@RequestParam(value = "modelType",defaultValue = "1") String modelType,//1模块 2分组 3具体表单
			Model model, ServletRequest request) {
		 DrawModuleInfoBean  drawModuleInfo = new DrawModuleInfoBean();
		 drawModuleInfo.setModelType(modelType);
		 model.addAttribute("drawModuleInfo", drawModuleInfo);
		 model.addAttribute("pageNo", pageNo);
		 return "drawModuleInfo/drawModuleInfoForm";
	} 
	/**
	 * 编辑
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawModuleInfo/edit/{id}")
	public String create(
			@PathVariable(value = "id" ) BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   DrawModuleInfoBean drawModuleInfo = drawModuleInfoService.selectById(id);
	  model.addAttribute("drawModuleInfo", drawModuleInfo);
	  model.addAttribute("pageNo", pageNo);
	  return "drawModuleInfo/drawModuleInfoForm";
	}
	
	/**
	 * 保存操作
	 * @param drawModuleInfo
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawModuleInfo/save")
	public String save(
			@ModelAttribute(value = "drawModuleInfo") DrawModuleInfoBean drawModuleInfo, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(drawModuleInfo.getId()==null){
			drawModuleInfo.setId(seq.getNextSeqIdToBigDecimal());//编号
			drawModuleInfo.setAccountId(new BigDecimal("1"));//创建人ID
			drawModuleInfo.setAccountName("系统管理员");//创建人名称
			drawModuleInfo.setParkId(new BigDecimal("1"));//归属园区ID
			drawModuleInfo.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			drawModuleInfo.setUpdateTime(new Timestamp(new Date().getTime()));//最后修改时间
			drawModuleInfoService.insert(drawModuleInfo);
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			drawModuleInfo.setUpdateTime(new Timestamp(new Date().getTime()));//最后修改时间
			drawModuleInfoService.updateById(drawModuleInfo);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/drawModuleInfo/list" ;
		
	}
	
	/**
	 * 模块详情编辑页面
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/drawModuleInfo/main")
	public String main(
			@RequestParam(value = "id") BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		//当前模块信息
		DrawModuleInfoBean drawModuleInfo = drawModuleInfoService.selectById(id);
		model.addAttribute("drawModuleInfo",drawModuleInfo);
		model.addAttribute("pageNo", pageNo);
		
		DrawModuleInfoBean info = new DrawModuleInfoBean();
		info.setParentId(drawModuleInfo.getId());
		info.setOrderByClause("sort_grade asc");
		List<DrawModuleInfoBean> moduleList = drawModuleInfoService.queryByCond(info);
		
		model.addAttribute("moduleList", moduleList);
		return "drawModuleInfo/drawModuleMain";
	}
	
	/**
	 * 进入绘制表单相关信息 包括：拖拉控件、绘制表格、控件与表格联合布局
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/drawModuleInfo/toDrawInputMain")
	public String toDrawInputMain(
			@RequestParam(value = "moduleId",required=false) BigDecimal moduleId,
			@RequestParam(value = "parentId",required=false) BigDecimal parentId,
			@RequestParam(value = "stepType",defaultValue="one") String stepType,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		
		DrawModuleInfoBean bean = null;
		if(StringUtil.checkNotNull(moduleId)){
			bean = drawModuleInfoService.selectById(moduleId);
		}else{
			bean = new DrawModuleInfoBean();
			bean.setId(seq.getNextSeqIdToBigDecimal());
			bean.setAccountId(new BigDecimal("1"));
			bean.setAccountName("管理员");
			bean.setCreateTime(new Date());
			bean.setUpdateTime(bean.getCreateTime());
			bean.setModelType("3");//表单
			bean.setModuleName("未命名");
			bean.setParkId(new BigDecimal("1"));
			bean.setParentId(parentId);
			drawModuleInfoService.insert(bean);
		}
		model.addAttribute("parentId",parentId);
		
		model.addAttribute("moduleInfo",bean);
		model.addAttribute("isSave",request.getParameter("isSave"));
		if("one".equals(stepType)){
			return "drawModuleInfo/drawInputMainForm1";
		}else if("two".equals(stepType)){
			//获取单元格信息
		    DrawTdInfoBean drawTdInfo = new DrawTdInfoBean();
		    drawTdInfo.setTableId(moduleId);
		    drawTdInfo.setOrderByClause("row_num asc,col_num asc");
		    List<DrawTdInfoBean> tdList = drawTdInfoService.queryByCond(drawTdInfo);
		    model.addAttribute("tdList",tdList);
		    
			return "drawModuleInfo/drawInputMainForm2";
		}else if("three".equals(stepType)){
			drawTdWithInput(moduleId, model);
			return "drawModuleInfo/drawInputMainForm3";
		}else if("four".equals(stepType)){
			return "drawModuleInfo/drawInputMainForm4";
		}else{
			return "drawModuleInfo/drawInputMainForm1";
		}
	}
	
	/**
	 * 查看详细
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/drawModuleInfo/view/{id}")
	public String view(
			@PathVariable(value = "id") BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		DrawModuleInfoBean drawModuleInfo = drawModuleInfoService.selectById(id);
		model.addAttribute("drawModuleInfo",drawModuleInfo);
		model.addAttribute("pageNo", pageNo);
		return "drawModuleInfo/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/drawModuleInfo/delete")
	public String delete(
			@RequestParam(value = "items") String[] items,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		int i = drawModuleInfoService.batchDelete(items);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/drawModuleInfo/list";
	}
	
	/**
	 * 保存操作
	 * @param formInput
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawModuleInfo/saveInput")
	public String saveInput(
			@ModelAttribute(value = "formInput") FormInputBean formInput, 
			@RequestParam(value = "moduleId") BigDecimal moduleId,//模板ID
			@RequestParam(value = "parentId") BigDecimal parentId,//模板ID
			@RequestParam(value = "tagNames") String tagNames,//模板ID
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(formInput.getId()==null){
			int result = formInputService.saveInputForForm(formInput, moduleId, tagNames, request, seq);
			String str = "保存成功！";
			if(result == -1){
				str = "保存失败！";
			}
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			formInputService.updateById(formInput);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		redirectAttributes.addAttribute("isSave","yes");
		return "redirect:/drawModuleInfo/toDrawInputMain?moduleId="+moduleId+"&parentId="+parentId;
		
	}
	
	@RequestMapping(value = "/drawModuleInfo/saveTdInfo")
	public String saveTdInfo(
			@ModelAttribute(value = "drawTdInfo") DrawTdInfoBean drawTdInfo,
			@RequestParam(value = "rowNum",defaultValue = "1") int rowNum,
			@RequestParam(value = "colNum",defaultValue = "1") int colNum,
			@RequestParam(value = "moduleId") BigDecimal moduleId,//表单ID
			@RequestParam(value = "parentId") BigDecimal parentId,//模板ID
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		//先删除原来数据
		drawTdInfoService.deleteByTableId(moduleId);
		
		//更新表单信息
		DrawModuleInfoBean moduleInfo = new DrawModuleInfoBean();
		moduleInfo.setId(moduleId);
		moduleInfo.setRowNum(rowNum);
		moduleInfo.setColNum(colNum);
		drawModuleInfoService.updateById(moduleInfo);
		
		//新增单元格信息
		String value = "";
		for(int r  = 1; r <= rowNum; r++){
			for(int c = 1; c <= colNum; c++){
				value = request.getParameter(r+"_"+c);
				if(StringUtil.checkNotNull(value)){
					//保存单元格信息
					drawTdInfo = new DrawTdInfoBean();
					drawTdInfo.setId(seq.getNextSeqIdToBigDecimal());//编号
					drawTdInfo.setTableId(moduleId);//表格ID
					drawTdInfo.setTdNo(r+"_"+c);
					drawTdInfo.setRowNum(new BigDecimal(r));//行号
					drawTdInfo.setColNum(new BigDecimal(c));//列号
					drawTdInfo.setRowspanNum(Integer.valueOf(value.split("_")[0]));//跨行数量
					drawTdInfo.setColspanNum(Integer.valueOf(value.split("_")[1]));//跨列数量
					drawTdInfo.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
					drawTdInfo.setParkId(new BigDecimal("1"));//归属园区ID
					drawTdInfoService.insert(drawTdInfo);
				}
			}
		}
		
		String str = "保存成功！";
		redirectAttributes.addFlashAttribute("message", str);
		
		redirectAttributes.addAttribute("isSave","yes");
		return "redirect:/drawModuleInfo/toDrawInputMain?stepType=two&moduleId="+moduleId+"&parentId="+parentId;
	}
	
	private void drawTdWithInput(BigDecimal moduleId,Model model) {
		DrawTdInfoBean drawTdInfo = new DrawTdInfoBean();
		drawTdInfo.setTableId(moduleId);
		drawTdInfo.setOrderByClause("row_num asc,col_num asc");
		List<DrawTdInfoBean> tdList = drawTdInfoService.queryByCond(drawTdInfo);
		model.addAttribute("tdList",tdList);
		//获取表格信息
		DrawModuleInfoBean moduleInfo = drawModuleInfoService.selectById(moduleId);
		model.addAttribute("moduleInfo",moduleInfo);
		//获取控件信息
		List<FormInputBean> inputList = getMyInputItems(moduleId).getInputList();
		model.addAttribute("inputList",inputList);
		
		//获取表格与控件关系数据
		DrawTdInputBean tdInput = new DrawTdInputBean();
		tdInput.setTableId(moduleId);
		tdInput.setOrderByClause("td_id asc,sort_grade asc");
		List<DrawTdInputBean> listTdInput = drawTdInputService.queryByCond(tdInput);
		
		//封装Map数据
		Map<String,FormInputBean> inputMap = new HashMap<String,FormInputBean>();
		for(FormInputBean input : inputList){
			inputMap.put(input.getId().toString(),input);
		}
		model.addAttribute("inputMap",inputMap);
		
		Map<BigDecimal,String> allTdInput = new HashMap<BigDecimal,String>();
		Map<BigDecimal,List<String>> tdInputMap = new HashMap<BigDecimal,List<String>>();
		List<String> inputIdList = null;
		BigDecimal tempTdId = null;
		for(DrawTdInputBean tdinput : listTdInput){
			if(tempTdId == null || tdinput.getTdId().compareTo(tempTdId) != 0){
				inputIdList = new ArrayList<String>();
				tdInputMap.put(tdinput.getTdId(),inputIdList);
				tempTdId = tdinput.getTdId();
			}
			inputIdList.add(tdinput.getInputId().toString());
			//所有已分配过的控件ID
			allTdInput.put(tdinput.getInputId(), "yes");
		}
		model.addAttribute("tdInputMap",tdInputMap);
		model.addAttribute("allTdInput",allTdInput);
	}
	
	@RequestMapping(value = "/drawModuleInfo/saveTdWithInput")
	public String saveTdWithInput(
			@RequestParam(value = "rowNum",defaultValue = "1") int rowNum,
			@RequestParam(value = "colNum",defaultValue = "1") int colNum,
			@RequestParam(value = "moduleId") BigDecimal moduleId,//表单ID
			@RequestParam(value = "parentId") BigDecimal parentId,//模板ID
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		//先删除原来数据
		drawTdInputService.deleteByTableId(moduleId);
		
		DrawTdInputBean tdInputBean = null;
		//新增单元格信息 可能存在多值
		String[] value = null;
		for(int r = 1; r <= rowNum; r++){
			for(int c = 1; c <= colNum; c++){
				value = request.getParameterValues(r+"_"+c);
				if(value != null && value.length > 0){
					for(int s = 0; s < value.length; s++){
						if(StringUtil.checkNotNull(value[s])){
							//保存单元格关联信息
							tdInputBean = new DrawTdInputBean();
							tdInputBean.setId(seq.getNextSeqIdToBigDecimal());//编号
							tdInputBean.setTableId(moduleId);//表格ID
							tdInputBean.setTdId(new BigDecimal(value[s].split("_")[0]));
							tdInputBean.setInputId(new BigDecimal(value[s].split("_")[1]));
							tdInputBean.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
							tdInputBean.setParkId(new BigDecimal("1"));//归属园区ID
							tdInputBean.setSortGrade(new BigDecimal(s+1));
							drawTdInputService.insert(tdInputBean);
						}
					}
				}
			}
		}
		String str = "保存成功！";
		redirectAttributes.addFlashAttribute("message", str);
		
		redirectAttributes.addAttribute("isSave","yes");
		return "redirect:/drawModuleInfo/toDrawInputMain?stepType=three&moduleId="+moduleId+"&parentId="+parentId;
		
	}
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/drawModuleInfo//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "drawModuleInfo") DrawModuleInfoBean drawModuleInfo, 
			HttpServletRequest request ) {
		String str =null;
		if(drawModuleInfo.getId()==null){
			/*
			drawModuleInfo.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//编号
			drawModuleInfo.setModuleName(value);//模块名称
			drawModuleInfo.setUniqueMark(value);//唯一标识
			drawModuleInfo.setDescription(value);//备注说明
			drawModuleInfo.setSortGrade(value);//排序
			drawModuleInfo.setAccountId(value);//创建人ID
			drawModuleInfo.setAccountName(value);//创建人名称
			drawModuleInfo.setParkId(value);//归属园区ID
			drawModuleInfo.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			drawModuleInfo.setUpdateTime(new Timestamp(new Date().getTime()));//最后修改时间
			*/
			drawModuleInfoService.insert(drawModuleInfo);
			
			  str = "创建成功！";
		}else{//编辑
			drawModuleInfo.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			drawModuleInfo.setUpdateTime(new Timestamp(new Date().getTime()));//最后修改时间
			drawModuleInfoService.updateById(drawModuleInfo);
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
	@RequestMapping(value = "/drawModuleInfo/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = drawModuleInfoService.batchDelete(items);
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
	@RequestMapping(value = "/drawModuleInfo/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public DrawModuleInfoBean jsonView(
			@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request ) {
		    DrawModuleInfoBean drawModuleInfo = drawModuleInfoService.selectById(id);
	  return  drawModuleInfo ;
	} 
	
	/**
	 * json获取表单对应的配置控件  用于编辑时展示已保存的拖动控件
	 * @return
	 */
	@RequestMapping(value = "/drawModuleInfo/json/getInputItems", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public FormInputExampleBean getInputItems(
			@RequestParam(value = "moduleId") BigDecimal moduleId,
			HttpServletRequest request ) {
		FormInputExampleBean resultBean = new FormInputExampleBean();
		//获取已配置的录入项
		FormInputBean bean = new FormInputBean();
		bean.setFormId(moduleId);
		bean.setOrderByClause("to_number(sort_grade) asc,id asc");
		List<FormInputBean> inputList = formInputService.queryByCond(bean);
		resultBean.setInputList(inputList);//存入结果实体
		
		String tagNames = "";
		int i = 1;
		for(FormInputBean input : inputList){
			tagNames += ";item"+i+"_"+input.getInputType();
			i++;
		}
		
		resultBean.setTagNames(tagNames);
		resultBean.setSize(inputList==null?0:inputList.size());
		
	    return resultBean;
	} 
	
	private FormInputExampleBean getMyInputItems(BigDecimal moduleId){
		FormInputExampleBean resultBean = new FormInputExampleBean();
		//获取已配置的录入项
		FormInputBean bean = new FormInputBean();
		bean.setFormId(moduleId);
		bean.setOrderByClause("to_number(sort_grade) asc,id asc");
		List<FormInputBean> inputList = formInputService.queryByCond(bean);
		resultBean.setInputList(inputList);//存入结果实体
		
		String tagNames = "";
		int i = 1;
		for(FormInputBean input : inputList){
			tagNames += ";item"+i+"_"+input.getInputType();
			i++;
		}
		
		resultBean.setTagNames(tagNames);
		resultBean.setSize(inputList==null?0:inputList.size());
		
	    return resultBean;
	}
}