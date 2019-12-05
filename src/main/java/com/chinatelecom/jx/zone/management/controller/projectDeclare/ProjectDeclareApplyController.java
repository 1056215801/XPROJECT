
package com.chinatelecom.jx.zone.management.controller.projectDeclare;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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



import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareApplyBean;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareApplyService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareInfoService;

@Controller
//@RequestMapping(value = "/projectdeclareapply")
public class ProjectDeclareApplyController extends BaseController {
	@Autowired
	private IProjectDeclareApplyService projectDeclareApplyService;
	 	@Autowired
	private IProjectDeclareInfoService projectDeclareInfoService;
	 	@Autowired
	 	private IAccountInfoBeanProxy accountInfoBeanProxy;


	private static final Logger logger = LoggerFactory
			.getLogger(ProjectDeclareApplyController.class);
 
	/**
	 * 列表
	 * @param projectDeclareApply
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareApply/list")
	public String list(@ModelAttribute("projectDeclareApply") ProjectDeclareApplyBean projectDeclareApply, 
			@RequestParam(value = "declareId", required = false) BigDecimal declareId,
			@ModelAttribute("page") Page<ProjectDeclareApplyBean> page, Model model) {
		try {
			projectDeclareApply.setDeclareId(declareId);
			projectDeclareApply.setOrderByClause("CREATE_TIME DESC");
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page=(Page<ProjectDeclareApplyBean>)projectDeclareApplyService.queryByCond(projectDeclareApply);
			setPageInfo(page, model, "projectDeclareApply/list");
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
			return "projectDeclareApply/list";
	}
	
	/**
	 * 我的申报列表
	 * @param projectDeclareApply
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareApply/mylist")
	public String myList(@ModelAttribute("projectDeclareApply") ProjectDeclareApplyBean projectDeclareApply, 
			@RequestParam(value = "declareId", required = false) BigDecimal declareId,
			@ModelAttribute("page") Page<ProjectDeclareApplyBean> page, Model model) {
		try {
			projectDeclareApply.setAccountId(null);
			projectDeclareApply.setOrderByClause("CREATE_TIME DESC");
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page=(Page<ProjectDeclareApplyBean>)projectDeclareApplyService.queryByCond(projectDeclareApply);
			setPageInfo(page, model, "projectDeclareApply/mylist");
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
		return "projectDeclareApply/mylist";
	}
	
	/**
	 * 新增 
	 * @param applyId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareApply/add")
	public String create(
			@RequestParam(value="declareId") BigDecimal declareId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
	  model.addAttribute("pageNo", pageNo);
	  model.addAttribute("declareId", declareId);
	  return "projectDeclareApply/edit";
	} 
	/**
	 * 编辑
	 * @param applyId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareApply/edit")
	public String edit(
			@RequestParam(value = "applyId" ) BigDecimal applyId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		try {
			ProjectDeclareApplyBean projectDeclareApply = projectDeclareApplyService.selectById(applyId);
			model.addAttribute("projectDeclareApply", projectDeclareApply);
			model.addAttribute("pageNo", pageNo);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
	  return "projectDeclareApply/edit";
	}
	
	/**
	 * 保存操作
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareApply/save")
	public String save(
			@ModelAttribute(value = "projectDeclareApply") ProjectDeclareApplyBean projectDeclareApply, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {

		try {
			if(projectDeclareApply.getApplyId()==null){
				/*  
				projectDeclareApply.setApplyId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//编号
				projectDeclareApply.setDeclareId(value);//关联编号
				projectDeclareApply.setAccountId(value);//申请人ID
				projectDeclareApply.setAccountName(value);//申请人名称
				projectDeclareApply.setCompanyName(value);//申请企业名称
				projectDeclareApply.setAccountTel(value);//申请人联系方式
				projectDeclareApply.setApplyAttachment(value);//附件
				projectDeclareApply.setApplyStatus(value);//状态
				projectDeclareApply.setRemark(value);//备注
				projectDeclareApply.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
				*/
				projectDeclareApply.setApplyId(seq.getNextSeqIdToBigDecimal());
				projectDeclareApply.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
				
				/*OrgAuditInfoBean bean = orgAuditInfoService.selectById(projectDeclareApply.get)*/
				
				projectDeclareApplyService.insert(projectDeclareApply);
				
				String str = "创建成功！";
				 
				redirectAttributes.addFlashAttribute("message", str);
			}else{//编辑
				projectDeclareApplyService.updateById(projectDeclareApply);
				String str = "保存成功！";
				 
				redirectAttributes.addFlashAttribute("message", str);
				}
			model.addAttribute("pageNo", pageNo);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
			return "redirect:/projectDeclareInfo/view?allowApply=1&declareId="+projectDeclareApply.getDeclareId();

	}
	
	/**
	 * 查看详细
	 * @param applyId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareApply/view")
	public String view(
			@RequestParam(value = "applyId") BigDecimal applyId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 try {
			 ProjectDeclareApplyBean projectDeclareApply = projectDeclareApplyService.selectById(applyId);
				model.addAttribute("projectDeclareApply",projectDeclareApply);
				model.addAttribute("pageNo", pageNo);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
		return "projectDeclareApply/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareApply/delete")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = projectDeclareApplyService.batchDelete(items);
		try {
			int i=  projectDeclareApplyService.deleteById(id);
			if(i > 0){
				redirectAttributes.addFlashAttribute("message", "删除成功！");
			}else{
				redirectAttributes.addFlashAttribute("message", "删除失败！");
			}
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}

		
		return "redirect:/projectDeclareApply/list";

	}
	
	/**
	 * 运维页面申报
	 * @param applyId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareApply/operationCreate")
	public String operationCreate(
			@RequestParam(value="declareId") BigDecimal declareId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		List<?> accountInfoList = selectTestAccount();
		model.addAttribute("accountInfoList",accountInfoList);
		model.addAttribute("accountInfoRandom", 
				accountInfoList.get((int)(Math.random()*accountInfoList.size())));
	  model.addAttribute("pageNo", pageNo);
	  model.addAttribute("declareId", declareId);
	  return "projectDeclareApply/operationApply";
	} 
	
	/**
	 * 运维保存操作
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareApply/operationSave", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String operationSave(
			@ModelAttribute(value = "projectDeclareApply") ProjectDeclareApplyBean projectDeclareApply, 
			@RequestParam(value = "createDate",required=false) String createDate,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		String str = "";
		try {
			if(projectDeclareApply.getApplyId()==null){
				/*  
				projectDeclareApply.setApplyId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//编号
				projectDeclareApply.setDeclareId(value);//关联编号
				projectDeclareApply.setAccountId(value);//申请人ID
				projectDeclareApply.setAccountName(value);//申请人名称
				projectDeclareApply.setCompanyName(value);//申请企业名称
				projectDeclareApply.setAccountTel(value);//申请人联系方式
				projectDeclareApply.setApplyAttachment(value);//附件
				projectDeclareApply.setApplyStatus(value);//状态
				projectDeclareApply.setRemark(value);//备注
				projectDeclareApply.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
				*/
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
				projectDeclareApply.setApplyId(seq.getNextSeqIdToBigDecimal());
				projectDeclareApply.setCreateTime(sdf.parse(createDate));
				projectDeclareApply.setApplyStatus((short) 2);
				projectDeclareApplyService.insert(projectDeclareApply);
				
				str = "创建成功！";
				 
			}else{//编辑
				projectDeclareApplyService.updateById(projectDeclareApply);
				str = "保存成功！";
				 
				}
			model.addAttribute("pageNo", pageNo);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
			return str;

	}
	
	/**
	 * 运维列表
	 * @param projectDeclareApply
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareApply/operationList")
	public String operationList(@ModelAttribute("projectDeclareApply") ProjectDeclareApplyBean projectDeclareApply, 
			
			@ModelAttribute("page") Page<ProjectDeclareApplyBean> page, Model model) {
		try {
			projectDeclareApply.setOrderByClause("CREATE_TIME DESC");
			projectDeclareApply.setApplyStatus((short) 2);
			
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page=(Page<ProjectDeclareApplyBean>)projectDeclareApplyService.queryByCond(projectDeclareApply);
			setPageInfo(page, model, "projectDeclareApply/list");
			model.addAttribute("declareId", projectDeclareApply.getDeclareId());
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
			return "projectDeclareApply/operationList";
	}
	
	
	/**
	 * 运维批量审核操作
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareApply/operationAudit", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String operationAudit(
			@RequestParam(value = "ids") String ids,
			@RequestParam(value = "type") Short type,
			@RequestParam(value="createDate") String createDate,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		String str = "";
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String[] idsStr = ids.split(",");
			for(int i = 0;i<idsStr.length;i++){
				ProjectDeclareApplyBean projectDeclareApplyBean = new ProjectDeclareApplyBean();
				projectDeclareApplyBean.setApplyId(new BigDecimal(idsStr[i]));
				projectDeclareApplyBean.setApplyStatus(type);
				projectDeclareApplyBean.setAuditTime(sdf.parse(createDate));
				projectDeclareApplyService.updateById(projectDeclareApplyBean);
			}
			str = "审核成功！";
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
			return str;

	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareApply//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "projectDeclareApply") ProjectDeclareApplyBean projectDeclareApply, 
			HttpServletRequest request ) {
		String str =null;
		if(projectDeclareApply.getApplyId()==null){
			/*
			projectDeclareApply.setApplyId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//编号
			projectDeclareApply.setDeclareId(value);//关联编号
			projectDeclareApply.setAccountId(value);//申请人ID
			projectDeclareApply.setAccountName(value);//申请人名称
			projectDeclareApply.setCompanyName(value);//申请企业名称
			projectDeclareApply.setAccountTel(value);//申请人联系方式
			projectDeclareApply.setAtUrlList(value);//附件列表，URL列表，多个URL通过半角逗号分隔。
			projectDeclareApply.setAtIdList(value);//附件列表，AttachmentI_Id列表，多个Attachment_Id通过半角逗号分隔。
			projectDeclareApply.setApplyStatus(value);//状态
			projectDeclareApply.setRemark(value);//备注
			projectDeclareApply.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			projectDeclareApplyService.insert(projectDeclareApply);
			
			  str = "创建成功！";
		}else{//编辑
			projectDeclareApply.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			projectDeclareApplyService.updateById(projectDeclareApply);
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
	@RequestMapping(value = "/projectDeclareApply/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = projectDeclareApplyService.batchDelete(items);
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
	@RequestMapping(value = "/projectDeclareApply/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProjectDeclareApplyBean jsonSave(
			@RequestParam(value = "applyId") BigDecimal applyId,
			HttpServletRequest request ) {
		    ProjectDeclareApplyBean projectDeclareApply = projectDeclareApplyService.selectById(applyId);
	  return  projectDeclareApply ;
	} 
	
}