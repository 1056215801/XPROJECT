
package com.chinatelecom.jx.zone.management.controller.drawTd;

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

import com.chinatelecom.jx.zone.management.bean.drawTable.DrawTableInfoBean;
import com.chinatelecom.jx.zone.management.bean.drawTd.DrawTdInfoBean;
import com.chinatelecom.jx.zone.management.bean.drawTd.DrawTdInputBean;
import com.chinatelecom.jx.zone.management.bean.formInput.FormInputBean;
import com.chinatelecom.jx.zone.management.bean.formTemplate.FormTemplateBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.drawTable.IDrawTableInfoService;
import com.chinatelecom.jx.zone.management.service.drawTd.IDrawTdInfoService;
import com.chinatelecom.jx.zone.management.service.drawTd.IDrawTdInputService;
import com.chinatelecom.jx.zone.management.service.formInput.IFormInputService;
import com.chinatelecom.jx.zone.management.service.formTemplate.IFormTemplateService;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
//@RequestMapping(value = "/drawtdinfo")
public class DrawTdInfoController extends BaseController {
	@Autowired
	private IDrawTdInfoService drawTdInfoService;
	@Autowired
	private IDrawTdInputService drawTdInputService;
	@Autowired
	private IDrawTableInfoService drawTableInfoService;
	@Autowired
	private IFormTemplateService formTemplateService;
	@Autowired
	private IFormInputService formInputService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(DrawTdInfoController.class);
 
	/**
	 * 列表
	 * @param drawTdInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawTdInfo/list")
	public String list(@ModelAttribute("drawTdInfo") DrawTdInfoBean drawTdInfo, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<DrawTdInfoBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<DrawTdInfoBean>)drawTdInfoService.queryByCond(null);
		setPageInfo(page, model, "drawTdInfo/list");
		model.addAttribute("searchKey", searchKey);
		return "drawTdInfo/list";
	}
	
	/**
	 * 新增 
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawTdInfo/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			@RequestParam(value = "tableId") BigDecimal tableId,
			Model model, ServletRequest request) {
		//获取单元格信息
	  DrawTdInfoBean drawTdInfo = new DrawTdInfoBean();
	  drawTdInfo.setTableId(tableId);
	  drawTdInfo.setOrderByClause("row_num asc,col_num asc");
	  List<DrawTdInfoBean> tdList = drawTdInfoService.queryByCond(drawTdInfo);
	  model.addAttribute("tdList",tdList);
	  //获取表格信息
	  DrawTableInfoBean drawTableInfo = drawTableInfoService.selectById(tableId);
	  model.addAttribute("drawTableInfo",drawTableInfo);
	  
	  model.addAttribute("pageNo", pageNo);
	  return "drawTdInfo/drawTdInfoForm";
	} 
	/**
	 * 编辑
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawTdInfo/edit/{id}")
	public String create(
			@PathVariable(value = "id" ) BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   DrawTdInfoBean drawTdInfo = drawTdInfoService.selectById(id);
		 
	  model.addAttribute("drawTdInfo", drawTdInfo);
	  model.addAttribute("pageNo", pageNo);
	  return "drawTdInfo/edit";
	}
	
	/**
	 * 保存操作
	 * @param drawTdInfo
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/drawTdInfo/save")
	public String save(
			@ModelAttribute(value = "drawTdInfo") DrawTdInfoBean drawTdInfo,
			@RequestParam(value = "rowNum",defaultValue = "1") int rowNum,
			@RequestParam(value = "colNum",defaultValue = "1") int colNum,
			@RequestParam(value = "tableId") BigDecimal tableId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		//先删除原来数据
		drawTdInfoService.deleteByTableId(tableId);
		
		//新增单元格信息
		String value = "";
		for(int r  = 1; r <= rowNum; r++){
			for(int c = 1; c <= colNum; c++){
				value = request.getParameter(r+"_"+c);
				if(StringUtil.checkNotNull(value)){
					//保存单元格信息
					drawTdInfo = new DrawTdInfoBean();
					drawTdInfo.setId(seq.getNextSeqIdToBigDecimal());//编号
					drawTdInfo.setTableId(tableId);//表格ID
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
		//保存表格信息
		DrawTableInfoBean tbInfo = new DrawTableInfoBean();
		tbInfo.setId(tableId);
		tbInfo.setRowNum(rowNum);
		tbInfo.setColNum(colNum);
		drawTableInfoService.updateById(tbInfo);
		
		String str = "保存成功！";
		redirectAttributes.addFlashAttribute("message", str);
		
		model.addAttribute("pageNo", pageNo);
		return "redirect:/drawTableInfo/list" ;
	}
	
	@RequestMapping(value = "/drawTdInfo/saveTdWithInput")
	public String saveTdWithInput(
			@RequestParam(value = "rowNum",defaultValue = "1") int rowNum,
			@RequestParam(value = "colNum",defaultValue = "1") int colNum,
			@RequestParam(value = "tableId") BigDecimal tableId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		//先删除原来数据
		drawTdInputService.deleteByTableId(tableId);
		
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
							tdInputBean.setTableId(tableId);//表格ID
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
	@RequestMapping(value = "/drawTdInfo/view")
	public String view(
			@RequestParam(value = "tableId") BigDecimal tableId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		DrawTdInfoBean drawTdInfo = new DrawTdInfoBean();
		drawTdInfo.setTableId(tableId);
		drawTdInfo.setOrderByClause("row_num asc,col_num asc");
		List<DrawTdInfoBean> tdList = drawTdInfoService.queryByCond(drawTdInfo);
		model.addAttribute("tdList",tdList);
		//获取表格信息
		DrawTableInfoBean drawTableInfo = drawTableInfoService.selectById(tableId);
		model.addAttribute("drawTableInfo",drawTableInfo);
		model.addAttribute("pageNo", pageNo);
		return "drawTdInfo/drawTdInfoView";
	}
	
	@RequestMapping(value = "/drawTdInfo/drawTdWithInput")
	public String drawTdWithInput(
			@RequestParam(value = "tableId") BigDecimal tableId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		DrawTdInfoBean drawTdInfo = new DrawTdInfoBean();
		drawTdInfo.setTableId(tableId);
		drawTdInfo.setOrderByClause("row_num asc,col_num asc");
		List<DrawTdInfoBean> tdList = drawTdInfoService.queryByCond(drawTdInfo);
		model.addAttribute("tdList",tdList);
		//获取表格信息
		DrawTableInfoBean drawTableInfo = drawTableInfoService.selectById(tableId);
		model.addAttribute("drawTableInfo",drawTableInfo);
		//获取控件信息
		FormTemplateBean formTemplate = formTemplateService.selectById(new BigDecimal("90020161104152942001001000000009"));
		//获取已配置的录入项
		FormInputBean bean = new FormInputBean();
		bean.setFormId(formTemplate.getId());
		bean.setOrderByClause("to_number(sort_grade) asc,id asc");
		List<FormInputBean> inputList = formInputService.queryByCond(bean);
		model.addAttribute("inputList",inputList);
		
		//获取表格与控件关系数据
		DrawTdInputBean tdInput = new DrawTdInputBean();
		tdInput.setTableId(drawTableInfo.getId());
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
		
		model.addAttribute("pageNo", pageNo);
		return "drawTdInfo/surveyManagementForm";
	}
	
	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/drawTdInfo/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = drawTdInfoService.batchDelete(items);
		int i=  drawTdInfoService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/drawTdInfo/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/drawTdInfo//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "drawTdInfo") DrawTdInfoBean drawTdInfo, 
			HttpServletRequest request ) {
		String str =null;
		if(drawTdInfo.getId()==null){
			/*
			drawTdInfo.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//编号
			drawTdInfo.setTableId(value);//表格ID
			drawTdInfo.setTdNo(value);//单元格编号
			drawTdInfo.setRowNum(value);//行号
			drawTdInfo.setColNum(value);//列号
			drawTdInfo.setRowspanNum(value);//跨行数量
			drawTdInfo.setColspanNum(value);//跨列数量
			drawTdInfo.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			drawTdInfo.setParkId(value);//归属园区ID
			*/
			drawTdInfoService.insert(drawTdInfo);
			
			  str = "创建成功！";
		}else{//编辑
			drawTdInfo.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			drawTdInfoService.updateById(drawTdInfo);
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
	@RequestMapping(value = "/drawTdInfo/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = drawTdInfoService.batchDelete(items);
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
	@RequestMapping(value = "/drawTdInfo/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public DrawTdInfoBean jsonSave(
			@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request ) {
		    DrawTdInfoBean drawTdInfo = drawTdInfoService.selectById(id);
	  return  drawTdInfo ;
	} 
	
}