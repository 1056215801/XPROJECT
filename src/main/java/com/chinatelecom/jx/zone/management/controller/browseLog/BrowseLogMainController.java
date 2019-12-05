
package com.chinatelecom.jx.zone.management.controller.browseLog;

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
import com.chinatelecom.jx.zone.management.bean.browseLog.BrowseLogMainBean;
import com.chinatelecom.jx.zone.management.service.browseLog.IBrowseLogMainService;

@Controller
//@RequestMapping(value = "/browselogmain")
public class BrowseLogMainController extends BaseController {
	@Autowired
	private IBrowseLogMainService browseLogMainService;
	 
	/**
	 * 列表
	 * @param browseLogMain
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/browseLogMain/list")
	public String list(@ModelAttribute("browseLogMain") BrowseLogMainBean browseLogMain, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<BrowseLogMainBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<BrowseLogMainBean>)browseLogMainService.queryByCond(null);
		setPageInfo(page, model, "browseLogMain/list");
		model.addAttribute("searchKey", searchKey);
		return "browseLogMain/list";
	}
	
	/**
	 * 新增 
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/browseLogMain/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 BrowseLogMainBean  browseLogMain = new BrowseLogMainBean();
			/* 初始化
			browseLogMain.setId(value);//主键id
			browseLogMain.setRelatedId(value);//外键，关联id
			browseLogMain.setSource(value);//日志来源，填写来源数据表名
			browseLogMain.setAccountId(value);//创建人id
			browseLogMain.setRemark(value);//备注
			browseLogMain.setCreateTime(value);//创建时间
			*/
		 
	  model.addAttribute("browseLogMain", browseLogMain);
	  model.addAttribute("pageNo", pageNo);
	  return "browseLogMain/edit";
	} 
	/**
	 * 编辑
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/browseLogMain/edit/{id}")
	public String create(
			@PathVariable(value = "id" ) BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   BrowseLogMainBean browseLogMain = browseLogMainService.selectById(id);
		 
	  model.addAttribute("browseLogMain", browseLogMain);
	  model.addAttribute("pageNo", pageNo);
	  return "browseLogMain/edit";
	}
	
	/**
	 * 保存操作
	 * @param browseLogMain
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/browseLogMain/save")
	public String save(
			@ModelAttribute(value = "browseLogMain") BrowseLogMainBean browseLogMain, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(browseLogMain.getId()==null){
			/*  
			browseLogMain.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键id
			browseLogMain.setRelatedId(value);//外键，关联id
			browseLogMain.setSource(value);//日志来源，填写来源数据表名
			browseLogMain.setAccountId(value);//创建人id
			browseLogMain.setRemark(value);//备注
			browseLogMain.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			browseLogMainService.insert(browseLogMain);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			browseLogMain.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			browseLogMainService.updateById(browseLogMain);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/browseLogMain/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/browseLogMain/view/{id}")
	public String view(
			@PathVariable(value = "id") BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		BrowseLogMainBean browseLogMain = browseLogMainService.selectById(id);
		model.addAttribute("browseLogMain",browseLogMain);
		model.addAttribute("pageNo", pageNo);
		return "browseLogMain/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/browseLogMain/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = browseLogMainService.batchDelete(items);
		int i=  browseLogMainService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/browseLogMain/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/browseLogMain//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "browseLogMain") BrowseLogMainBean browseLogMain, 
			HttpServletRequest request ) {
		String str =null;
		if(browseLogMain.getId()==null){
			/*
			browseLogMain.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键id
			browseLogMain.setRelatedId(value);//外键，关联id
			browseLogMain.setSource(value);//日志来源，填写来源数据表名
			browseLogMain.setAccountId(value);//创建人id
			browseLogMain.setRemark(value);//备注
			browseLogMain.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			browseLogMainService.insert(browseLogMain);
			
			  str = "创建成功！";
		}else{//编辑
			browseLogMain.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			browseLogMainService.updateById(browseLogMain);
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
	@RequestMapping(value = "/browseLogMain/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = browseLogMainService.batchDelete(items);
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
	@RequestMapping(value = "/browseLogMain/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public BrowseLogMainBean jsonSave(
			@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request ) {
		    BrowseLogMainBean browseLogMain = browseLogMainService.selectById(id);
	  return  browseLogMain ;
	} 
	
}