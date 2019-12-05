
package com.chinatelecom.jx.zone.management.controller.projectDeclare;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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



import com.jfinal.kit.StrKit;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareApplyBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareUpgradeBean;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareUpgradeService;

@Controller
//@RequestMapping(value = "/projectdeclareupgrade")
public class ProjectDeclareUpgradeController extends BaseController {
	@Autowired
	private IProjectDeclareUpgradeService projectDeclareUpgradeService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(ProjectDeclareUpgradeController.class);
 
	/**
	 * 列表
	 * @param projectDeclareUpgrade
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareUpgrade/list")
	public String list(@ModelAttribute("projectDeclareUpgrade") ProjectDeclareUpgradeBean projectDeclareUpgrade, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<ProjectDeclareUpgradeBean> page, Model model) {
		if(StrKit.notBlank(searchKey)){
			projectDeclareUpgrade.setAccountName(searchKey);
		}
		projectDeclareUpgrade.setStatus((short) 2);
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<ProjectDeclareUpgradeBean>)projectDeclareUpgradeService.queryByCond(projectDeclareUpgrade);
		setPageInfo(page, model, "projectDeclareUpgrade/list");
		model.addAttribute("page", page);
		model.addAttribute("searchKey", searchKey);
		return "projectDeclareUpgrade/list";
	}
	
	/**
	 * 新增 
	 * @param upgradeId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareUpgrade/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		
	  model.addAttribute("pageNo", pageNo);
	  return "projectDeclareUpgrade/edit";
	} 
	/**
	 * 编辑
	 * @param upgradeId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareUpgrade/edit/{id}")
	public String create(
			@PathVariable(value = "upgradeId" ) BigDecimal upgradeId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   ProjectDeclareUpgradeBean projectDeclareUpgrade = projectDeclareUpgradeService.selectById(upgradeId);
		 
	  model.addAttribute("projectDeclareUpgrade", projectDeclareUpgrade);
	  model.addAttribute("pageNo", pageNo);
	  return "projectDeclareUpgrade/edit";
	}
	
	/**
	 * 保存操作
	 * @param projectDeclareUpgrade
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareUpgrade/save")
	public String save(
			@ModelAttribute(value = "projectDeclareUpgrade") ProjectDeclareUpgradeBean projectDeclareUpgrade, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		try {
			projectDeclareUpgrade.setUpgradeId(seq.getNextSeqIdToBigDecimal());//主键
			projectDeclareUpgrade.setAccountId(new BigDecimal(1));//关联账号ID
			projectDeclareUpgrade.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			
			projectDeclareUpgradeService.insert(projectDeclareUpgrade);
			
			String str = "提交成功，请等待申请结果！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
			
		
		model.addAttribute("pageNo", pageNo);
		return "redirect:/projectDeclareInfo/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param upgradeId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareUpgrade/view")
	public String view(
			@RequestParam(value = "upgradeId") BigDecimal upgradeId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		ProjectDeclareUpgradeBean projectDeclareUpgrade = projectDeclareUpgradeService.selectById(upgradeId);
		model.addAttribute("projectDeclareUpgrade",projectDeclareUpgrade);
		model.addAttribute("pageNo", pageNo);
		return "projectDeclareUpgrade/view";
	}

	/**
	 * 审核操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareUpgrade/audit", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String audit(
			@RequestParam(value = "ids") String ids,
			@RequestParam(value = "type") Short type
			) {
		String str = "";
		try {
			String[] idsStr = ids.split(",");
			for(int i = 0;i<idsStr.length;i++){
				ProjectDeclareUpgradeBean projectDeclareUpgradeBean = 
						projectDeclareUpgradeService.selectById(new BigDecimal(idsStr[i]));
				projectDeclareUpgradeBean.setStatus(type);
				projectDeclareUpgradeBean.setType(type);
				projectDeclareUpgradeService.updateById(projectDeclareUpgradeBean);
			}
			str = "审核成功！";
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
			return str;
	}
	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareUpgrade/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = projectDeclareUpgradeService.batchDelete(items);
		int i=  projectDeclareUpgradeService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/projectDeclareUpgrade/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareUpgrade//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "projectDeclareUpgrade") ProjectDeclareUpgradeBean projectDeclareUpgrade, 
			HttpServletRequest request ) {
		String str =null;
		if(projectDeclareUpgrade.getUpgradeId()==null){
			/*
			projectDeclareUpgrade.setUpgradeId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键
			projectDeclareUpgrade.setAccountId(value);//关联账号ID
			projectDeclareUpgrade.setCompanyName(value);//企业名称
			projectDeclareUpgrade.setCompanyProvince(value);//单位所在省
			projectDeclareUpgrade.setCompanyCity(value);//单位所在市
			projectDeclareUpgrade.setCompanyCounty(value);//单位所在县
			projectDeclareUpgrade.setCompanyCodeImage(value);//组织信用代码图片URL
			projectDeclareUpgrade.setAccountName(value);//账号名称
			projectDeclareUpgrade.setIdcardNum(value);//身份证号
			projectDeclareUpgrade.setTelephone(value);//电话
			projectDeclareUpgrade.setCertificateImage(value);// 授权书图片URL
			projectDeclareUpgrade.setStatus(value);//状态  枚举值：0，不通过 1，通过
			projectDeclareUpgrade.setIdcardFront(value);//身份证复印件正面图片URL
			projectDeclareUpgrade.setIdcardBack(value);//身份证复印件反面图片URL
			projectDeclareUpgrade.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			projectDeclareUpgrade.setType(value);//类型 0，普通用户 1，政府用户
			projectDeclareUpgrade.setRemark(value);//备注
			*/
			projectDeclareUpgradeService.insert(projectDeclareUpgrade);
			
			  str = "创建成功！";
		}else{//编辑
			projectDeclareUpgrade.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			projectDeclareUpgradeService.updateById(projectDeclareUpgrade);
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
	@RequestMapping(value = "/projectDeclareUpgrade/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = projectDeclareUpgradeService.batchDelete(items);
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
	@RequestMapping(value = "/projectDeclareUpgrade/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProjectDeclareUpgradeBean jsonSave(
			@RequestParam(value = "upgradeId") BigDecimal upgradeId,
			HttpServletRequest request ) {
		    ProjectDeclareUpgradeBean projectDeclareUpgrade = projectDeclareUpgradeService.selectById(upgradeId);
	  return  projectDeclareUpgrade ;
	} 
	
}