
package com.chinatelecom.jx.zone.management.controller.orgAudit;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
import com.chinatelecom.jx.zone.management.bean.orgAudit.OrgAuditExampleBean;
import com.chinatelecom.jx.zone.management.bean.orgAudit.OrgAuditInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareInfoBean;
import com.chinatelecom.jx.zone.management.service.orgAudit.IOrgAuditExampleService;
import com.chinatelecom.jx.zone.management.service.orgAudit.IOrgAuditInfoService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareInfoService;

@Controller
//@RequestMapping(value = "/orgauditexample")
public class OrgAuditExampleController extends BaseController {
	@Autowired
	private IOrgAuditExampleService orgAuditExampleService;
	@Autowired
	private IOrgAuditInfoService orgAuditInfoService;
	@Autowired
	private IProjectDeclareInfoService projectDeclareInfoService;
	private static final Logger logger = LoggerFactory
			.getLogger(OrgAuditExampleController.class);

	/**
	 * 列表
	 * @param orgAuditExample
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/orgAuditExample/list")
	public String list(@ModelAttribute("orgAuditExample") OrgAuditExampleBean orgAuditExample, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<OrgAuditExampleBean> page, Model model) {

		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<OrgAuditExampleBean>)orgAuditExampleService.queryByCond(null);
		setPageInfo(page, model, "orgAuditExample/list");
		model.addAttribute("searchKey", searchKey);
		return "orgAuditExample/list";
	}

	/**
	 * 新增 
	 * @param exampleId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/orgAuditExample/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		OrgAuditExampleBean  orgAuditExample = new OrgAuditExampleBean();
		/* 初始化
			orgAuditExample.setExampleId(value);//主键
			orgAuditExample.setOrgId(value);//组织id，外键，关联表t_org_aduit_info
			orgAuditExample.setDeclareId(value);//项目id，外键，关联表t_project_declare_info
			orgAuditExample.setOrgName(value);//组织名称
			orgAuditExample.setOrgKind(value);//组织类型，枚举值，0：政府 1：园区 2：企业
			orgAuditExample.setEndTime(value);//上报截止时间
			orgAuditExample.setIndexNum(value);//指标个数
			orgAuditExample.setIsReport(value);//是否已上报上级部门，枚举值，0：否 1：是
			orgAuditExample.setStatus(value);//状态，枚举值，0：失效 1：有效
			orgAuditExample.setCreateTime(value);//创建时间
		 */

		model.addAttribute("orgAuditExample", orgAuditExample);
		model.addAttribute("pageNo", pageNo);
		return "orgAuditExample/edit";
	} 
	/**
	 * 编辑
	 * @param exampleId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/orgAuditExample/edit/{id}")
	public String create(
			@PathVariable(value = "exampleId" ) BigDecimal exampleId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		OrgAuditExampleBean orgAuditExample = orgAuditExampleService.selectById(exampleId);

		model.addAttribute("orgAuditExample", orgAuditExample);
		model.addAttribute("pageNo", pageNo);
		return "orgAuditExample/edit";
	}

	/**
	 * 保存操作
	 * @param orgAuditExample
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/orgAuditExample/save")
	public String save(
			@ModelAttribute(value = "orgAuditExample") OrgAuditExampleBean orgAuditExample, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {

		if(orgAuditExample.getExampleId()==null){
			/*  
			orgAuditExample.setExampleId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键
			orgAuditExample.setOrgId(value);//组织id，外键，关联表t_org_aduit_info
			orgAuditExample.setDeclareId(value);//项目id，外键，关联表t_project_declare_info
			orgAuditExample.setOrgName(value);//组织名称
			orgAuditExample.setOrgKind(value);//组织类型，枚举值，0：政府 1：园区 2：企业
			orgAuditExample.setEndTime(new Timestamp(new Date().getTime()));//上报截止时间
			orgAuditExample.setIndexNum(value);//指标个数
			orgAuditExample.setIsReport(value);//是否已上报上级部门，枚举值，0：否 1：是
			orgAuditExample.setStatus(value);//状态，枚举值，0：失效 1：有效
			orgAuditExample.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			 */
			orgAuditExampleService.insert(orgAuditExample);

			String str = "创建成功！";

			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			orgAuditExample.setEndTime(new Timestamp(new Date().getTime()));//上报截止时间
			orgAuditExample.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			orgAuditExampleService.updateById(orgAuditExample);
			String str = "保存成功！";

			redirectAttributes.addFlashAttribute("message", str);
		}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/orgAuditExample/list" ;

	}

	/**
	 * 查看详细
	 * @param exampleId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/orgAuditExample/view/{id}")
	public String view(
			@PathVariable(value = "exampleId") BigDecimal exampleId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {

		OrgAuditExampleBean orgAuditExample = orgAuditExampleService.selectById(exampleId);
		model.addAttribute("orgAuditExample",orgAuditExample);
		model.addAttribute("pageNo", pageNo);
		return "orgAuditExample/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/orgAuditExample/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = orgAuditExampleService.batchDelete(items);
		int i=  orgAuditExampleService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/orgAuditExample/list";
	}

	/**
	 * -----------------------------------------------------------------------
	 *                           接口
	 * -----------------------------------------------------------------------
	 */

	/**
	 * 列表
	 * @param orgAuditExample
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/json/orgAuditExample/list")
	public String jsonList(@ModelAttribute("orgAuditExample") OrgAuditExampleBean orgAuditExample, 
			@ModelAttribute("page") Page<OrgAuditExampleBean> page, ModelMap modelMap) {
		try {
			orgAuditExample.setOrderByClause("CREATE_TIME DESC");
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page=(Page<OrgAuditExampleBean>)orgAuditExampleService.selectExampleAndDeclareOpen(orgAuditExample);
			modelMap.addAttribute("value", page.getResult());
			modelMap.addAttribute("total", page.getTotal());
			modelMap.addAttribute("pages", page.getPages());
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取列表成功!");
		} catch (Exception e) {
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取列表失败！");
		}

		return "jsonView";
	}

	/**
	 * 保存操作
	 * @param orgAuditExample
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/json/orgAuditExample/bc")
	public String jsonSave(
			@ModelAttribute(value = "orgAuditExample") OrgAuditExampleBean orgAuditExample, 
			@RequestParam(value="endTimeStr") String endTime,
			@RequestParam(value="indexNumStr") String indexNum,
			@RequestParam(value="orgIdStr") String orgId,
			@RequestParam(value="type") Integer type, //0：项目首次分配指标  1：分配上级单位下发的指标
			@RequestParam(value="parentExampleId",required=false) BigDecimal parentExampleId, 
			ModelMap modelMap) {
		try {
			String[] endTimeStr = endTime.split(",");
			String[] indexNumStr = indexNum.split(",");
			String[] orgIdStr = orgId.split(",");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if(orgAuditExample.getExampleId()==null){
				orgAuditExample.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
				orgAuditExample.setStatus((short) 1);
				orgAuditExample.setIsReport((short) 0);
				orgAuditExample.setIsAllot((short) 0);
				for(int i =0;i<endTimeStr.length;i++){
					orgAuditExample.setExampleId(seq.getNextSeqIdToBigDecimal());//主键
					OrgAuditInfoBean bean = orgAuditInfoService.selectById(new BigDecimal(orgIdStr[i]));
					orgAuditExample.setEndTime(sdf.parse(endTimeStr[i]));
					orgAuditExample.setIndexNum(Integer.parseInt(indexNumStr[i]));
					orgAuditExample.setOrgId(new BigDecimal(orgIdStr[i]));
					orgAuditExample.setOrgName(bean.getOrgName());
					orgAuditExample.setOrgKind(bean.getOrgKind());
					orgAuditExampleService.insert(orgAuditExample);
				}
				if(type==0){
				ProjectDeclareInfoBean bean = new ProjectDeclareInfoBean();
				bean.setDeclareId(orgAuditExample.getDeclareId());
				bean.setIsAllot((short) 1);
				Integer indexCount = 0;
				for(int i = 0;i<indexNumStr.length;i++){
					indexCount += Integer.parseInt(indexNumStr[i]);
				}
				bean.setIndexCount(indexCount);
				projectDeclareInfoService.updateById(bean);
				}else if(type==1){
					OrgAuditExampleBean bean = new OrgAuditExampleBean();
					bean.setExampleId(parentExampleId);
					bean.setIsAllot((short) 1);
					
					orgAuditExampleService.updateById(bean);
				}
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "指标下发成功!");

			}else{//只在分配指标的情况下需要编辑

				orgAuditExampleService.updateById(orgAuditExample);
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "指标修改成功!");

			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "指标下发失败！");
		}


		return "jsonView" ;

	}


	/**
	 * 下发的指标
	 * @param orgAuditExample
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/json/orgAuditExample/myOrgCreatelist")
	public String jsonMyOrgCreateList(
			@RequestParam(value="parentId") BigDecimal parentId,
			@RequestParam(value="orgName",required=false) String orgName,
			@RequestParam(value="declareTitle",required=false) String declareTitle,
			@RequestParam(value="exampleTitle",required=false) String exampleTitle,
			@ModelAttribute("page") Page<OrgAuditExampleBean> page, ModelMap modelMap) {
		try {
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page=(Page<OrgAuditExampleBean>)orgAuditExampleService.selectMyOrgCreateExample(parentId, orgName, declareTitle, exampleTitle);
			modelMap.addAttribute("value", page.getResult());
			modelMap.addAttribute("total", page.getTotal());
			modelMap.addAttribute("pages", page.getPages());
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取列表成功!");
		} catch (Exception e) {
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取列表失败！");
		}

		return "jsonView";
	}

	/**
	 * 查看详细
	 * @param exampleId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/json/orgAuditExample/view")
	public String jsonView(
			@RequestParam(value = "exampleId") BigDecimal exampleId,
			ServletRequest request,ModelMap modelMap) {
		try {
			OrgAuditExampleBean orgAuditExample = orgAuditExampleService.selectById(exampleId);
			modelMap.addAttribute("value", orgAuditExample);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取详细成功!");
		} catch (Exception e) {
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取详细失败！");
		}

		return "jsonView";
	}



}