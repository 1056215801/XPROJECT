
package com.chinatelecom.jx.zone.management.controller.projectActivity;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

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
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityEnterBean;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityEnterService;

@Controller
//@RequestMapping(value = "/projectactivityenter")
public class ProjectActivityEnterController extends BaseController {
	@Autowired
	private IProjectActivityEnterService projectActivityEnterService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(ProjectActivityEnterController.class);
 
	/**
	 * 列表
	 * @param projectActivityEnter
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectActivityEnter/list")
	public String list(@ModelAttribute("projectActivityEnter") ProjectActivityEnterBean projectActivityEnter, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<ProjectActivityEnterBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<ProjectActivityEnterBean>)projectActivityEnterService.queryByCond(null);
		setPageInfo(page, model, "projectActivityEnter/list");
		model.addAttribute("searchKey", searchKey);
		return "projectActivityEnter/list";
	}
	
	/**
	 * 新增 
	 * @param enterId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectActivityEnter/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 ProjectActivityEnterBean  projectActivityEnter = new ProjectActivityEnterBean();
			/* 初始化
			projectActivityEnter.setEnterId(value);//报名Id，记录主键。
			projectActivityEnter.setActivityId(value);//活动Id，值外键，见T_Project_Activity_Info表Activity_Id。
			projectActivityEnter.setEnterAccount(value);//报名账户，账户Id，值外键，见T_Account_Info表Account_Id。
			projectActivityEnter.setEnterUser(value);//报名人名，冗余字段，值外键，见T_Account_Info表Account_Name。
			projectActivityEnter.setEnterTime(value);//报名时间
			projectActivityEnter.setPrizeSeq(value);//中奖序号。
			projectActivityEnter.setStatus(value);//状态，1：有效；-1：无效。
			projectActivityEnter.setRemark(value);//备注，内部查看。
			projectActivityEnter.setCreateTime(value);//创建时间
			
			//projectActivityEnter.setBdlc(processdefid);
			*/
		 
	  model.addAttribute("projectActivityEnter", projectActivityEnter);
	  model.addAttribute("pageNo", pageNo);
	  return "projectActivityEnter/edit";
	} 
	/**
	 * 编辑
	 * @param enterId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectActivityEnter/edit/{id}")
	public String create(
			@PathVariable(value = "enterId" ) BigDecimal enterId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   ProjectActivityEnterBean projectActivityEnter = projectActivityEnterService.selectById(enterId);
		 
	  model.addAttribute("projectActivityEnter", projectActivityEnter);
	  model.addAttribute("pageNo", pageNo);
	  return "projectActivityEnter/edit";
	}
	
	/**
	 * 保存操作
	 * @param projectActivityEnter
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectActivityEnter/save")
	public String save(
			@ModelAttribute(value = "projectActivityEnter") ProjectActivityEnterBean projectActivityEnter, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(projectActivityEnter.getEnterId()==null){
			/*  
			projectActivityEnter.setEnterId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//报名Id，记录主键。
			projectActivityEnter.setActivityId(value);//活动Id，值外键，见T_Project_Activity_Info表Activity_Id。
			projectActivityEnter.setEnterAccount(value);//报名账户，账户Id，值外键，见T_Account_Info表Account_Id。
			projectActivityEnter.setEnterUser(value);//报名人名，冗余字段，值外键，见T_Account_Info表Account_Name。
			projectActivityEnter.setEnterTime(new Timestamp(new Date().getTime()));//报名时间
			projectActivityEnter.setPrizeSeq(value);//中奖序号。
			projectActivityEnter.setStatus(value);//状态，1：有效；-1：无效。
			projectActivityEnter.setRemark(value);//备注，内部查看。
			projectActivityEnter.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			projectActivityEnterService.insert(projectActivityEnter);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			projectActivityEnter.setEnterTime(new Timestamp(new Date().getTime()));//报名时间
			projectActivityEnter.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			projectActivityEnterService.updateById(projectActivityEnter);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/Spring/projectActivityEnter/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param enterId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectActivityEnter/view/{id}")
	public String view(
			@PathVariable(value = "enterId") BigDecimal enterId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		ProjectActivityEnterBean projectActivityEnter = projectActivityEnterService.selectById(enterId);
		model.addAttribute("projectActivityEnter",projectActivityEnter);
		model.addAttribute("pageNo", pageNo);
		return "projectActivityEnter/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectActivityEnter/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = projectActivityEnterService.batchDelete(items);
		int i=  projectActivityEnterService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/Spring/projectActivityEnter/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectActivityEnter/json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public int jsonSave(
			@RequestParam(value = "activityId", required = true)BigDecimal activityId, 
			@RequestParam(value = "startTime", required = true)Date startTime,
			@RequestParam(value = "enterId", required = false)BigDecimal enterId,
			HttpServletRequest request ) {
		ProjectActivityEnterBean record = getEnterBean(activityId);
		int n = 0;

		try {
			if(enterId != null){
				record = projectActivityEnterService.selectById(enterId);
			}
			if(record==null){
				record = new ProjectActivityEnterBean();
				record.setEnterId(seq.getNextSeqIdToBigDecimal());
				record.setActivityId(activityId);
//				record.setEnterAccount(getCurrentAccountId());
//				record.setEnterUser(getCurrentAccountName);
				record.setEnterAccount(new BigDecimal(1));
				record.setEnterUser("alice");
				if(startTime.getTime()>new Date().getTime()){
					record.setEnterTime(new Timestamp(startTime.getTime()));
				}else{				
					record.setEnterTime(new Timestamp(new Date().getTime()));
				}
//				record.setPrizeSeq(value);
				record.setStatus((short)1);
//				record.setRemark(value);
				record.setCreateTime(new Timestamp(new Date().getTime()));
				
				n = projectActivityEnterService.insert(record);
				
			}else{//编辑
				if(startTime.getTime()>new Date().getTime()){
					record.setEnterTime(new Timestamp(startTime.getTime()));
				}else{				
					record.setEnterTime(new Timestamp(new Date().getTime()));
				}
				record.setCreateTime(new Timestamp(new Date().getTime()));
				if(record.getStatus()==1){
					record.setStatus((short)-1);
				}else{
					record.setStatus((short)1);
				}
				n = projectActivityEnterService.updateById(record);
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

	 return n ;
	}
	
	/**
	 * 
	 */
	private ProjectActivityEnterBean getEnterBean(BigDecimal activityId){
		ProjectActivityEnterBean projectActivityEnterBean = new ProjectActivityEnterBean();
		projectActivityEnterBean.setActivityId(activityId);
		List<ProjectActivityEnterBean> list = projectActivityEnterService.queryByCond(projectActivityEnterBean);
		ProjectActivityEnterBean record = null;
		for(ProjectActivityEnterBean info:list){
			if(info.getEnterAccount().equals(new BigDecimal(1))){
				record = info;
			}
		}
		return record;
	}
	
	/**
	 * json删除 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectActivityEnter/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = projectActivityEnterService.batchDelete(items);
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
	@RequestMapping(value = "/projectActivityEnter/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProjectActivityEnterBean jsonSave(
			@RequestParam(value = "enterId") BigDecimal enterId,
			HttpServletRequest request ) {
		    ProjectActivityEnterBean projectActivityEnter = projectActivityEnterService.selectById(enterId);
	  return  projectActivityEnter ;
	} 
	
}