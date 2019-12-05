
package com.chinatelecom.jx.zone.management.controller.projectDeclare;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareApplyBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareNodeBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclarePublicityBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareUpgradeBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.orgAudit.IOrgAuditExampleService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareApplyService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareAuditlogService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareInfoService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareLogService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareNodeService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclarePublicityService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareUpgradeService;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.organization.info.bean.OrganizationInfoBean;
import com.chinatelecom.jx.zone.organization.info.proxy.IOrganizationInfoBeanProxy;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
//@RequestMapping(value = "/projectdeclareinfo")
public class ProjectDeclareInfoController extends BaseController {
	@Autowired
	private IProjectDeclareInfoService projectDeclareInfoService;
	@Autowired
	private IProjectDeclareApplyService projectDeclareApplyService;
	@Autowired
	private IProjectDeclareNodeService projectDeclareNodeService;
	@Autowired
	private IProjectDeclareLogService projectLogService;
	@Autowired
	private IProjectDeclareAuditlogService projectAuditlogService;
	@Autowired
	private IOrgAuditExampleService orgAuditExampleService;
	@Autowired
	private IProjectDeclarePublicityService projectDeclarePublicityService;
	@Autowired
	private IProjectDeclareUpgradeService projectDeclareUpgradeService;
	@Autowired
	private IOrganizationInfoBeanProxy organizationInfoBeanProxy;

	private static final Logger logger = LoggerFactory
			.getLogger(ProjectDeclareInfoController.class);

	

	/**
	 * 项目查看列表
	 * @param projectDeclareInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareInfo/list")
	public String list(@ModelAttribute("projectDeclareInfo") ProjectDeclareInfoBean projectDeclareInfo, 
			@RequestParam(value = "admin", required = false) String admin,
			@ModelAttribute("page") Page<ProjectDeclareInfoBean> page, Model model) {
		try {
			projectDeclareInfo.setOrderByClause("a.IS_RECOMMEND DESC,a.CREATE_TIME DESC");
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			List<ProjectDeclareInfoBean> infoList = projectDeclareInfoService.queryByCond(projectDeclareInfo);
			page=(Page<ProjectDeclareInfoBean>)infoList;
			setPageInfo(page, model, "projectDeclareInfo/list");


		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		if(admin!=null){
			return "projectDeclareInfo/adminList";
		}else{
			return "projectDeclareInfo/list";
		}
	}
	
	
	
	/**
	 * 我的已发项目列表
	 * @param projectDeclareInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareInfo/mylist")
	public String mylist(@ModelAttribute("projectDeclareInfo") ProjectDeclareInfoBean projectDeclareInfo, 
			@ModelAttribute("page") Page<ProjectDeclareInfoBean> page, Model model) {
		try {
			projectDeclareInfo.setAccountId(null);
			projectDeclareInfo.setOrderByClause("a.CREATE_TIME DESC");
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			List<ProjectDeclareInfoBean> infoList = projectDeclareInfoService.queryByCond(projectDeclareInfo);
			for(int i =0;i<infoList.size();i++){
				ProjectDeclarePublicityBean projectDeclarePublicityBean = new ProjectDeclarePublicityBean();
				projectDeclarePublicityBean.setDeclareId(infoList.get(i).getDeclareId());
				List<ProjectDeclarePublicityBean> list = projectDeclarePublicityService.queryByCond(projectDeclarePublicityBean);
				if(list.size()!=0){
					infoList.get(i).setIsPublicity("已发布公示");
				}
			}
			for(int j =0;j<infoList.size();j++){
				ProjectDeclareNodeBean projectDeclareNodeBean = new ProjectDeclareNodeBean();
				projectDeclareNodeBean.setDeclareId(infoList.get(j).getDeclareId());
				List<ProjectDeclareNodeBean> nodeList = projectDeclareNodeService.queryByCond(projectDeclareNodeBean);
					if(nodeList.size()==0){
						infoList.get(j).setDeclareStatus((short) 2);
					}
			}
			page=(Page<ProjectDeclareInfoBean>)infoList;
			setPageInfo(page, model, "projectDeclareInfo/mylist");
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
		return "projectDeclareInfo/mylist";
	}

	/**
	 * 新增 
	 * @param declareId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareInfo/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		String isUpgrade = "";
           ProjectDeclareUpgradeBean projectDeclareUpgradeBean = new ProjectDeclareUpgradeBean();
           projectDeclareUpgradeBean.setAccountId(new BigDecimal(1));
		List<ProjectDeclareUpgradeBean> list = projectDeclareUpgradeService.queryByCond(projectDeclareUpgradeBean);
		if(list.size()==0 || list.get(0).getType() != 1){
			isUpgrade = "no";
		}else{
			isUpgrade = "yes";
		}
		//分享单位列表
		List<OrganizationInfoBean> organizationList = organizationInfoBeanProxy
				.selectFirstGradeListByAccountIdAndRootIdAndSystemIdArrayAndOrganizationNameSearchKey(getCurrentAccountId(), null, null, null);
		List<OrganizationInfoBean> newOrganizationList = new ArrayList<OrganizationInfoBean>();
		for(OrganizationInfoBean bean : organizationList){
			OrganizationInfoBean organizationInfoBean = 
					organizationInfoBeanProxy.selectUnitByOrganizationId(bean.getOrganizationId());
			if(organizationInfoBean.getOrganizationKind()==2||
					organizationInfoBean.getOrganizationKind()==3||organizationInfoBean.getOrganizationKind()==1){					
				newOrganizationList.add(organizationInfoBean);
			}
			
		}
		
		if(newOrganizationList.size()>0){
			model.addAttribute("organizationList", newOrganizationList);
		}
		model.addAttribute("isUpgrade", isUpgrade);
		model.addAttribute("pageNo", pageNo);
		return "projectDeclareInfo/edit";
	} 
	/**
	 * 编辑
	 * @param declareId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareInfo/edit")
	public String create(
			@RequestParam(value="declareId") BigDecimal declareId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		try {
			ProjectDeclareInfoBean projectDeclareInfo = projectDeclareInfoService.selectById(declareId);
			ProjectDeclareNodeBean projectDeclareNodeBean = new ProjectDeclareNodeBean();
			projectDeclareNodeBean.setDeclareId(declareId);
			List<ProjectDeclareNodeBean> nodeList = projectDeclareNodeService.queryByCond(projectDeclareNodeBean);
			
			//分享单位列表
			List<OrganizationInfoBean> organizationList = organizationInfoBeanProxy
					.selectFirstGradeListByAccountIdAndRootIdAndSystemIdArrayAndOrganizationNameSearchKey(getCurrentAccountId(), null, null, null);
			List<OrganizationInfoBean> newOrganizationList = new ArrayList<OrganizationInfoBean>();
			for(OrganizationInfoBean bean : organizationList){
				OrganizationInfoBean organizationInfoBean = 
						organizationInfoBeanProxy.selectUnitByOrganizationId(bean.getOrganizationId());
				if(organizationInfoBean.getOrganizationKind()==2||
						organizationInfoBean.getOrganizationKind()==3||organizationInfoBean.getOrganizationKind()==1){					
					newOrganizationList.add(organizationInfoBean);
				}
				
			}
			
			if(newOrganizationList.size()>0){
				model.addAttribute("organizationList", newOrganizationList);
			}
			model.addAttribute("projectDeclareInfo", projectDeclareInfo);
			model.addAttribute("nodeList", nodeList);
			model.addAttribute("listSize", nodeList.size());
			model.addAttribute("pageNo", pageNo);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
		return "projectDeclareInfo/edit";
	}

	/**
	 * 保存操作
	 * @param projectDeclareInfo
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareInfo/save")
	public String save(
			@ModelAttribute(value = "projectDeclareInfo") ProjectDeclareInfoBean projectDeclareInfo, 
			@RequestParam(value="nodeNum",required=false) String nodeNum,
			@RequestParam(value="nodeTitle",required=false) String nodeTitle,
			@RequestParam(value="endTime",required=false) String endTime,
			@RequestParam(value="remark",required=false) String remark,
			@RequestParam(value="saveType",required=false) Short saveType,//0:预览保存 不传值为没有预览直接发布保存
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		try {
			//时间节点
			List<ProjectDeclareNodeBean> list = new ArrayList<ProjectDeclareNodeBean>();
			if(StringUtil.checkNotNull(nodeNum)){
				String[] nodeNumArr = nodeNum.split(",");
				String[] nodeNameArr = nodeTitle.split(",");
				String[] endTimeArr = endTime.split(",");
				String[]  reMarkArr=null;
				if(!remark.equals("")){
					reMarkArr = remark.split(",");
				}
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
				for(int i = 0;i<endTimeArr.length;i++){
					ProjectDeclareNodeBean projectDeclareNode = new ProjectDeclareNodeBean();
					projectDeclareNode.setNodeId(seq.getNextSeqIdToBigDecimal());
					projectDeclareNode.setDeclareId(projectDeclareInfo.getDeclareId());
					projectDeclareNode.setNodeName(nodeNameArr[i]);
					projectDeclareNode.setNodeNum(Integer.parseInt(nodeNumArr[i]));
					if(StringUtil.checkNotNull(endTimeArr[i])){
						Date date = sdf.parse(endTimeArr[i]+" 23:59:59");
						projectDeclareNode.setEndTime(date);
						long diff =  date.getTime() - new Date().getTime();
						long between = diff / (24 * 60 * 60 * 1000);
						projectDeclareNode.setRemainDay((int)between);
					}else{
						projectDeclareNode.setEndTime(null);
						projectDeclareNode.setRemainDay(null);
					}
					if(StringUtil.checkNotNull(reMarkArr)&&i<reMarkArr.length){
						if(StringUtil.checkNotNull(reMarkArr[i])){
							projectDeclareNode.setRemark(reMarkArr[i]);
						}
					}
					list.add(projectDeclareNode);
				}
			}
			if(projectDeclareInfo.getDeclareId()==null){
				projectDeclareInfo.setDeclareId(seq.getNextSeqIdToBigDecimal());
				projectDeclareInfo.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
				if(saveType!=null){
					projectDeclareInfo.setDeclareStatus((short)3);
				}else{
					projectDeclareInfo.setDeclareStatus((short)0);
					String str = "创建成功！";
					redirectAttributes.addFlashAttribute("message", str);
				}
			
				projectDeclareInfoService.insert(projectDeclareInfo,list,null);
			}else{//预览后发布
				projectDeclareInfo.setDeclareStatus((short)0);
				projectDeclareInfoService.updateById(projectDeclareInfo,list);
				String str = "创建成功！";
				redirectAttributes.addFlashAttribute("message", str);
			}

			model.addAttribute("pageNo", pageNo);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
		if(saveType!=null){
			return "redirect:/projectDeclareInfo/view?saveType=0&declareId="+ projectDeclareInfo.getDeclareId();
		}else{
			return "redirect:/projectDeclareInfo/add" ;
		}



	}

	/**
	 * 查看详细
	 * @param declareId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareInfo/view")
	public String view(
			@RequestParam(value = "declareId") BigDecimal declareId,
			@RequestParam(value = "saveType",required=false) Short saveType, //0:跳转到预览页面，不传值跳转到详细页面
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			@RequestParam(value = "allowApply",defaultValue = "0") String allowApply,
			ServletRequest request,Model model) {
		try {
			ProjectDeclareInfoBean projectDeclareInfo = projectDeclareInfoService.selectById(declareId);
			ProjectDeclareNodeBean projectDeclareNodeBean = new ProjectDeclareNodeBean();
			projectDeclareNodeBean.setDeclareId(projectDeclareInfo.getDeclareId());
			projectDeclareNodeBean.setOrderByClause("NODE_NUM ASC");
			List<ProjectDeclareNodeBean> nodeList = projectDeclareNodeService.queryByCond(projectDeclareNodeBean);
			for(int j =0;j<nodeList.size();j++){
				if(nodeList.get(j).getRemainDay()==-1){
					model.addAttribute("notApply", 1); //若传此参数到前端，则在线申报按钮为不可点击
				}
			}

			model.addAttribute("projectDeclareInfo",projectDeclareInfo);
			model.addAttribute("nodeList",nodeList);
			model.addAttribute("allowApply",allowApply);//此参数代表是否有在线申报按钮
			model.addAttribute("pageNo", pageNo);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
		if(saveType!=null){
			return "projectDeclareInfo/preview";
		}else{
			return "projectDeclareInfo/view";
		}
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareInfo/delete")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = projectDeclareInfoService.batchDelete(items);
		try {
			int i=  projectDeclareInfoService.deleteById(id);
			if(i > 0){
				redirectAttributes.addFlashAttribute("message", "删除成功！");
			}else{
				redirectAttributes.addFlashAttribute("message", "删除失败！");
			}
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}

		return "redirect:/projectDeclareInfo/mylist";


	}
	/**
	 * 运维列表
	 * @param projectDeclareInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareInfo/operationList")
	public String operationList(@ModelAttribute("projectDeclareInfo") ProjectDeclareInfoBean projectDeclareInfo, 
			@ModelAttribute("page") Page<ProjectDeclareInfoBean> page, Model model) {
		try {
			projectDeclareInfo.setOrderByClause("a.IS_RECOMMEND DESC,a.CREATE_TIME DESC");
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			List<ProjectDeclareInfoBean> infoList = projectDeclareInfoService.queryByCond(projectDeclareInfo);
			page=(Page<ProjectDeclareInfoBean>)infoList;
			setPageInfo(page, model, "projectDeclareInfo/operationList");
			model.addAttribute("title", projectDeclareInfo.getDeclareTitle());
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
			return "projectDeclareInfo/operationList";
	}
	/**
	 * 运维新增
	 * @param projectDeclareInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareInfo/operationAdd")
	public String operationAdd( Model model) {
		try {
			List<?> accountInfoList = selectTestAccount();
			model.addAttribute("accountInfoList",accountInfoList);
			model.addAttribute("accountInfoRandom", 
					accountInfoList.get((int)(Math.random()*accountInfoList.size())));
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
		return "projectDeclareInfo/operationAdd";
	}
	/**
	 * 运维编辑
	 * @param projectDeclareInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareInfo/operationEdit")
	public String operationEdit(
			@RequestParam(value="declareId") BigDecimal declareId,
			Model model) {
		try {
			ProjectDeclareInfoBean projectDeclareInfo = projectDeclareInfoService.selectById(declareId);
			/*ProjectDeclareNodeBean record = new ProjectDeclareNodeBean();
			record.setDeclareId(declareId);
			List<ProjectDeclareNodeBean> list = projectDeclareNodeService.queryByCond(record);
			List<AccountInfoBean> accountInfoList = accountInfoBeanProxy.selectAllGradeListByOrganizationIdWithRootIdAndStatusAndSearchKey(
					null, null, (short)1, null);
			if(list.size()>0){
			model.addAttribute("list",list);
			model.addAttribute("listSize",list.size());
			}*/
			model.addAttribute("projectDeclareInfo",projectDeclareInfo);
			/*model.addAttribute("accountInfoList",accountInfoList);
			model.addAttribute("accountInfoRandom", 
					accountInfoList.get((int)(Math.random()*accountInfoList.size())));*/
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
		return "projectDeclareInfo/operationAdd";
	}
	/**
	 * 运维删除
	 * @param projectDeclareInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareInfo/operationDel", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String operationDel(
			@RequestParam(value="declareIdStr") String declareIdStr,
			Model model) {
		String str = "0";
		try {
			String[] declareIdSttr = declareIdStr.split(",");
			List<ProjectDeclareApplyBean> applyList = new ArrayList<ProjectDeclareApplyBean>();
			ProjectDeclareApplyBean applyBean = new ProjectDeclareApplyBean();
			for(int i = 0;i<declareIdSttr.length;i++){
				projectDeclareInfoService.deleteById(new BigDecimal(declareIdSttr[i]));
				applyBean.setDeclareId(new BigDecimal(declareIdSttr[i]));
				applyList = projectDeclareApplyService.queryByCond(applyBean);
				for(int j=0;j<applyList.size();j++){
					projectAuditlogService.deleteByApplyId(applyList.get(j).getApplyId());
					projectLogService.deleteByApplyId(applyList.get(j).getApplyId());
				}
				projectDeclareApplyService.deleteByDeclareId(new BigDecimal(declareIdSttr[i]));
				projectDeclareNodeService.deleteByDecalreId(new BigDecimal(declareIdSttr[i]));
				projectDeclarePublicityService.deleteByDeclareId(new BigDecimal(declareIdSttr[i]));
				orgAuditExampleService.deleteByDeclareId(new BigDecimal(declareIdSttr[i]));
			}
			str = "1";
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
		return str;
	}

	/**
	 * 异步保存操作
	 * @param projectDeclareInfo
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclareInfo/operationSave", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String operationSave(
			@ModelAttribute(value = "projectDeclareInfo") ProjectDeclareInfoBean projectDeclareInfo, 
			@RequestParam(value="createDate",required=false) String createDate,
			@RequestParam(value="nodeNum",required=false) String nodeNum,
			@RequestParam(value="nodeTitle",required=false) String nodeTitle,
			@RequestParam(value="endTime",required=false) String endTime,
			@RequestParam(value="remark",required=false) String remark,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		String str = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		try {
			if(projectDeclareInfo.getDeclareId()==null){
			//时间节点
			List<ProjectDeclareNodeBean> list = new ArrayList<ProjectDeclareNodeBean>();
			if(StringUtil.checkNotNull(nodeNum)){
				String[] nodeNumArr = nodeNum.split(",");
				String[] nodeNameArr = nodeTitle.split(",");
				String[] endTimeArr = endTime.split(",");
				String[]  reMarkArr=null;
				if(!remark.equals("")){
					reMarkArr = remark.split(",");
				}
				for(int i = 0;i<endTimeArr.length;i++){
					ProjectDeclareNodeBean projectDeclareNode = new ProjectDeclareNodeBean();
					projectDeclareNode.setNodeId(seq.getNextSeqIdToBigDecimal());
					projectDeclareNode.setDeclareId(projectDeclareInfo.getDeclareId());
					projectDeclareNode.setNodeName(nodeNameArr[i]);
					projectDeclareNode.setNodeNum(Integer.parseInt(nodeNumArr[i]));
					if(StringUtil.checkNotNull(endTimeArr[i])){
						Date date = sdf.parse(endTimeArr[i]+" 23:59:59");
						projectDeclareNode.setEndTime(date);
						if(date.getTime()>=new Date().getTime()){
							long diff =  date.getTime() - new Date().getTime();
							long between = diff / (24 * 60 * 60 * 1000);
							projectDeclareNode.setRemainDay((int)between);
							}else{
								projectDeclareNode.setRemainDay(-1);
							}
					}else{
						projectDeclareNode.setEndTime(null);
						projectDeclareNode.setRemainDay(null);
					}
					if(StringUtil.checkNotNull(reMarkArr)&&i<reMarkArr.length){
						if(StringUtil.checkNotNull(reMarkArr[i])){
							projectDeclareNode.setRemark(reMarkArr[i]);
						}
					}
					list.add(projectDeclareNode);
				}
			}
			
			Integer isOverdue = null;
			if(list.size()!=0){
			for(int i = 0;i<list.size();i++){
				if(list.get(i).getRemainDay()!=-1){
					isOverdue = 0;
				}
			}
			}
			if(isOverdue==null&&list.size()!=0){
				isOverdue = 1;
			}else{
				isOverdue = 0;
			}
				projectDeclareInfo.setDeclareId(seq.getNextSeqIdToBigDecimal());
				projectDeclareInfo.setQrCode(createQrcode("projectDeclare/weixin/view/"+projectDeclareInfo.getDeclareId(),null));
				sdf = new SimpleDateFormat("yyyy-MM-dd"); 
				projectDeclareInfo.setCreateTime(sdf.parse(createDate));//创建时间
				if(isOverdue==1){
					projectDeclareInfo.setDeclareStatus((short)1);
				}else if(isOverdue==0){
					projectDeclareInfo.setDeclareStatus((short)0);
				}
					 str = "创建成功！";
					 model.addAttribute("message", str);
			
				projectDeclareInfoService.insert(projectDeclareInfo,list,null);

			model.addAttribute("pageNo", pageNo);
			}else{
				projectDeclareInfoService.updateById(projectDeclareInfo);
				str = "修改成功！";
				model.addAttribute("message", str);
			}
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
	@RequestMapping(value = "/projectDeclareInfo/json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "projectDeclareInfo") ProjectDeclareInfoBean projectDeclareInfo, 
			HttpServletRequest request ) {
		String str =null;
		if(projectDeclareInfo.getDeclareId()==null){
			/*
			projectDeclareInfo.setDeclareId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//编号
			projectDeclareInfo.setTemplateId(value);//模板ID
			projectDeclareInfo.setDeclareTitle(value);//项目标题
			projectDeclareInfo.setDeclareBatch(value);//批次
			projectDeclareInfo.setDeclareGrade(value);//项目级别
			projectDeclareInfo.setDeclareStatus(value);//状态，枚举值，需完善定义。
			projectDeclareInfo.setSupervisorName(value);//主管单位
			projectDeclareInfo.setDeclareText(value);//项目正文
			projectDeclareInfo.setAtUrlList(value);//附件列表，URL列表，多个URL通过半角逗号分隔。
			projectDeclareInfo.setAtIdList(value);//附件列表，AttachmentI_Id列表，多个Attachment_Id通过半角逗号分隔。
			projectDeclareInfo.setApplyOnline(value);//是否允许在线申报，枚举值，1：是，0：否。
			projectDeclareInfo.setScheduleOpen(value);//是否允许查看申报进度，枚举值，1：是；0：否。
			projectDeclareInfo.setPublicityOpen(value);//公示信息是否公开，枚举值，1：是，0：否。
			projectDeclareInfo.setAccountId(value);//创建人ID
			projectDeclareInfo.setAccountName(value);//创建人姓名
			projectDeclareInfo.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			 */
			//projectDeclareInfoService.insert(projectDeclareInfo);

			str = "创建成功！";
		}else{//编辑
			projectDeclareInfo.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			//projectDeclareInfoService.updateById(projectDeclareInfo);
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
	@RequestMapping(value = "/projectDeclareInfo/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
		String msg=null ;
		int i = projectDeclareInfoService.batchDelete(items);
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
	@RequestMapping(value = "/projectDeclareInfo/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProjectDeclareInfoBean jsonSave(
			@RequestParam(value = "declareId") BigDecimal declareId,
			HttpServletRequest request ) {
		ProjectDeclareInfoBean projectDeclareInfo = projectDeclareInfoService.selectById(declareId);
		return  projectDeclareInfo ;
	} 

}