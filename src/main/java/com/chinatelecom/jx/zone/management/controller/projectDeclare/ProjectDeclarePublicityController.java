
package com.chinatelecom.jx.zone.management.controller.projectDeclare;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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



import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclarePublicityBean;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareInfoService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclarePublicityService;
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanProxy;
import com.chinatelecom.jx.zone.util.StatusUtils;

@Controller
//@RequestMapping(value = "/projectdeclarepublicity")
public class ProjectDeclarePublicityController extends BaseController {
	@Autowired
	private IProjectDeclarePublicityService projectDeclarePublicityService;
	@Autowired
	private IProjectDeclareInfoService projectDeclareInfoService;
	@Autowired
 	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private ISystemInfoBeanProxy systemInfoBeanProxy;
	
	private static final Logger logger = LoggerFactory
			.getLogger(ProjectDeclarePublicityController.class);
 
	/**
	 * 列表
	 * @param projectDeclarePublicity
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePublicity/list")
	public String list(@ModelAttribute("projectDeclarePublicity") ProjectDeclarePublicityBean projectDeclarePublicity, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<ProjectDeclarePublicityBean> page, Model model) {
		
		//排序条件
		projectDeclarePublicity.setOrderByClause("CREATE_TIME desc");
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<ProjectDeclarePublicityBean>)projectDeclarePublicityService.queryByCond(projectDeclarePublicity);
		setPageInfo(page, model, "projectDeclarePublicity/list");
		model.addAttribute("searchKey", searchKey);
		return "projectDeclarePublicity/list";
	}
	

	/**
	 * 异步加载找项目查看列表
	 * code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 */
	@RequestMapping(value = "/projectDeclarePublicity/json/list", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonList(@ModelAttribute("projectDeclarePublicity") ProjectDeclarePublicityBean projectDeclarePublicity, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<ProjectDeclarePublicityBean> page, Model model){
		ResultBean resultBean = new ResultBean();
		try {
			//排序条件
			projectDeclarePublicity.setOrderByClause("CREATE_TIME desc");
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page=(Page<ProjectDeclarePublicityBean>)projectDeclarePublicityService.queryByCond(projectDeclarePublicity);
			setPageInfo(page, model, "projectDeclarePublicity/list");
			model.addAttribute("searchKey", searchKey);
            List<ProjectDeclarePublicityBean> list = new ArrayList<ProjectDeclarePublicityBean>(); 
            for(ProjectDeclarePublicityBean bean : page){
            	list.add(bean);
            }
            if(page.getTotal()==0){
				resultBean.setCode(2);
				return resultBean;
			}
			
			if(page.getTotal()>(page.getPageNum()*page.getPageSize())){
				resultBean.setCode(1);
			}else{
				resultBean.setCode(0);
			}
			resultBean.setValue(list);

		} catch (Exception e) {
			logger.error(e.getMessage());
			resultBean.setCode(-1);
			resultBean.setMsg("获取列表失败！");
		}
		
		return resultBean;
	}
	
	/**
	 * 新增 
	 * @param publicityId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePublicity/add")
	public String create(
			@RequestParam(value = "declareId" ) BigDecimal declareId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 ProjectDeclarePublicityBean  projectDeclarePublicity = new ProjectDeclarePublicityBean();		 						 
	  model.addAttribute("projectDeclarePublicity", projectDeclarePublicity);
	  model.addAttribute("declareId", declareId);
	  model.addAttribute("pageNo", pageNo);
	  return "projectDeclarePublicity/edit";
	} 
	/**
	 * 编辑
	 * @param publicityId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePublicity/edit")
	public String edit(
			@RequestParam(value = "publicityId" ) BigDecimal publicityId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   ProjectDeclarePublicityBean projectDeclarePublicity = projectDeclarePublicityService.selectById(publicityId);
		 
	  model.addAttribute("projectDeclarePublicity", projectDeclarePublicity);
	  model.addAttribute("pageNo", pageNo);
	  return "projectDeclarePublicity/edit";
	}
	
	/**
	 * 保存操作
	 * @param projectDeclarePublicity
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePublicity/save")
	public String save(
			@ModelAttribute(value = "projectDeclarePublicity") ProjectDeclarePublicityBean projectDeclarePublicity, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		try{
		if(projectDeclarePublicity.getPublicityId()==null){
			projectDeclarePublicity.setPublicityId(seq.getNextSeqIdToBigDecimal());//编号
			
			//projectDeclarePublicity.setPublicityAttachment();//附件
			//projectDeclarePublicity.setOrganizationName("");//公示单位			
			projectDeclarePublicity.setCreateTime(new Timestamp(new Date().getTime()));//公示时间
						
			projectDeclarePublicityService.insert(projectDeclarePublicity);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑							
			projectDeclarePublicity.setCreateTime(new Timestamp(new Date().getTime()));//公示时间
			projectDeclarePublicityService.updateById(projectDeclarePublicity);
			
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		}catch(Exception e){
			//TODO:handle exception
			logger.error(e.getMessage());
		}
		return "redirect:/projectDeclarePublicity/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param publicityId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePublicity/view")
	public String view(
			@RequestParam(value = "publicityId") BigDecimal publicityId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		ProjectDeclarePublicityBean projectDeclarePublicity = projectDeclarePublicityService.selectById(publicityId);
		ProjectDeclareInfoBean projectDeclareInfo=projectDeclareInfoService.selectById(projectDeclarePublicity.getDeclareId());
		
		model.addAttribute("declareTitle",projectDeclareInfo.getDeclareTitle());
		model.addAttribute("projectDeclarePublicity",projectDeclarePublicity);
		model.addAttribute("pageNo", pageNo);
		return "projectDeclarePublicity/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePublicity/delete")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = projectDeclarePublicityService.batchDelete(items);
		int i=  projectDeclarePublicityService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/projectDeclarePublicity/list";
	}
	
	/**
	 * 运维新增 
	 * @param publicityId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePublicity/operationAdd")
	public String operationAdd(
			@RequestParam(value = "declareId" ) BigDecimal declareId,
			Model model, ServletRequest request) {
		final BigDecimal systemId = systemInfoBeanProxy.selectSystemIdByThisSystemCode();
		List<AccountInfoBean> accountInfoList = accountInfoBeanProxy.selectAllGradeListByOrganizationIdAndRootIdAndSystemIdAndStatusArrayAndSearchKey
				(null, null, systemId, StatusUtils.open, null);			
		model.addAttribute("accountInfoList",accountInfoList);
		model.addAttribute("accountInfoRandom", 
				accountInfoList.get((int)(Math.random()*accountInfoList.size())));
	  model.addAttribute("declareId", declareId);
	  return "projectDeclarePublicity/operationAdd";
	} 
	
	/**
	 * 运维保存操作
	 * @param projectDeclarePublicity
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclarePublicity/operationSave" , produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String operationSave(
			@ModelAttribute(value = "projectDeclarePublicity") ProjectDeclarePublicityBean projectDeclarePublicity, 
			@RequestParam(value = "createDate") String createDate, 
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		String str = "";
		try{
			ProjectDeclareInfoBean infoBean = projectDeclareInfoService.selectById(projectDeclarePublicity.getDeclareId());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			projectDeclarePublicity.setPublicityId(seq.getNextSeqIdToBigDecimal());//编号
			
			projectDeclarePublicity.setCreateTime(sdf.parse(createDate));//公示时间
			projectDeclarePublicity.setPublicityUnit(infoBean.getSupervisorName());
						
			projectDeclarePublicityService.insert(projectDeclarePublicity);
			
			 str = "创建成功！";
			 
		
		}catch(Exception e){
			//TODO:handle exception
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
	@RequestMapping(value = "/projectDeclarePublicity/json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "projectDeclarePublicity") ProjectDeclarePublicityBean projectDeclarePublicity, 
			HttpServletRequest request ) {
		String str =null;
		if(projectDeclarePublicity.getPublicityId()==null){
			/*
			projectDeclarePublicity.setPublicityId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//公示编号
			projectDeclarePublicity.setDeclareId(value);//关联编号
			projectDeclarePublicity.setPublicityUnit(value);//公式单位
			projectDeclarePublicity.setPublicityTitle(value);//公示标题
			projectDeclarePublicity.setPublicityText(value);//公示正文
			projectDeclarePublicity.setAtUrlList(value);//附件列表，URL列表，多个URL通过半角逗号分隔。
			projectDeclarePublicity.setAtIdList(value);//附件列表，AttachmentI_Id列表，多个Attachment_Id通过半角逗号分隔。
			projectDeclarePublicity.setCreateTime(new Timestamp(new Date().getTime()));//公示时间
			*/
			projectDeclarePublicityService.insert(projectDeclarePublicity);
			
			  str = "创建成功！";
		}else{//编辑
			projectDeclarePublicity.setCreateTime(new Timestamp(new Date().getTime()));//公示时间
			projectDeclarePublicityService.updateById(projectDeclarePublicity);
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
	@RequestMapping(value = "/projectDeclarePublicity/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = projectDeclarePublicityService.batchDelete(items);
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
	@RequestMapping(value = "/projectDeclarePublicity/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProjectDeclarePublicityBean jsonSave(
			@RequestParam(value = "publicityId") BigDecimal publicityId,
			HttpServletRequest request ) {
		    ProjectDeclarePublicityBean projectDeclarePublicity = projectDeclarePublicityService.selectById(publicityId);
	  return  projectDeclarePublicity ;
	} 
	
}