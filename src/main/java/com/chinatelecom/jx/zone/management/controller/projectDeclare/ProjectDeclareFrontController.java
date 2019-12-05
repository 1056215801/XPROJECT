package com.chinatelecom.jx.zone.management.controller.projectDeclare;

import java.io.File;
import java.math.BigDecimal;
import java.net.URL;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.attachment.client.bean.AttachmentClientBean;
import com.chinatelecom.jx.zone.attachment.client.bean.InvokeAttachmentsRst;
import com.chinatelecom.jx.zone.attachment.client.helper.AttachmentClientHelper;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.orgAudit.OrgAuditExampleBean;
import com.chinatelecom.jx.zone.management.bean.orgAudit.OrgAuditInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareApplyBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareAuditlogBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareLogBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareNodeBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareOrgBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclarePublicityBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareUpgradeBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclarePoster.ProjectDeclarePosterBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.orgAudit.IOrgAuditExampleService;
import com.chinatelecom.jx.zone.management.service.orgAudit.IOrgAuditInfoService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareApplyService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareAuditlogService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareInfoService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareLogService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareNodeService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclarePublicityService;
// import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareReadService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareUpgradeService;
import com.chinatelecom.jx.zone.management.service.projectDeclarePoster.IProjectDeclarePosterService;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.management.util.ZipDownloadUtil;
import com.chinatelecom.jx.zone.organization.info.bean.OrganizationInfoBean;
import com.chinatelecom.jx.zone.organization.info.proxy.IOrganizationInfoBeanProxy;
import com.chinatelecom.jx.zone.organization.info.service.IOrganizationInfoBeanService;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jfinal.kit.StrKit;

@Controller
public class ProjectDeclareFrontController extends BaseController {
	@Autowired
	private AttachmentClientHelper attachmentClientHelper;

	@Autowired
	private IProjectDeclareInfoService projectDeclareInfoService;

	@Autowired
	private IProjectDeclareApplyService projectDeclareApplyService;

	@Autowired
	private IProjectDeclareNodeService projectDeclareNodeService;

	@Autowired
	private IProjectDeclarePublicityService projectDeclarePublicityService;

	@Autowired
	private IProjectDeclareUpgradeService projectDeclareUpgradeService;

	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper;

	@Autowired
	private IOrganizationInfoBeanProxy organizationInfoBeanProxy;

	@Autowired
	private IOrgAuditInfoService orgAuditInfoService;

	@Autowired
	private IOrganizationInfoBeanService organizationInfoBeanService;

	@Autowired
	private IProjectDeclareLogService proDeclareLogService;

	@Autowired
	private IOrgAuditExampleService orgAuditExampleService;

	@Autowired
	private IProjectDeclareLogService projectDeclareLogService;

	@Autowired
	private IProjectDeclareAuditlogService projectDeclareAuditlogService;

	@Autowired
	private IProjectDeclarePosterService projectDeclarePosterService;
	// @Autowired
	// private IProjectDeclareReadService projectDeclareReadService;

	@Value("${CopyRight}")
	private String CopyRight;
	
	@Value("${rh.java.io.tmpdir}")
	private String tmpdir;
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectDeclareInfoController.class);

	/**
	 * 项目查看列表
	 * 
	 * @param projectDeclareInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/main")
	public String main(Model model) {
		try {
			ProjectDeclareInfoBean bean = new ProjectDeclareInfoBean();
			ProjectDeclarePublicityBean publicity = new ProjectDeclarePublicityBean();
			ProjectDeclareInfoBean bean1 = new ProjectDeclareInfoBean();
			BigDecimal organizationId = getOrganizationId();
			if (organizationId == null) {
				organizationId = BigDecimal.valueOf(-1);
			}
			bean.setOrgId(organizationId);
			bean.setDeclareStatus((short) 0);
			int countApplying = projectDeclareInfoService.countByCondNotPreview(bean);
			bean.setDeclareStatus((short) 2);
			int countPulicity = projectDeclareInfoService.countByCondNotPreview(bean);
			// 热门项目公示
			publicity.setOrgId(organizationId);
			publicity.setOrderByClause("CREATE_TIME DESC");
			publicity.setStatus((short) 1);
			PageHelper.startPage(1, 5);
			Page<ProjectDeclarePublicityBean> page = (Page<ProjectDeclarePublicityBean>) projectDeclarePublicityService.queryByIsOpen(publicity);
			// 热门项目申报
			bean1.setFastQuery((short) 1);
			bean1.setOrderByClause("a.CREATE_TIME DESC");
			bean1.setOrgId(organizationId);
			PageHelper.startPage(1, 5);
			Page<ProjectDeclareInfoBean> page1 = (Page<ProjectDeclareInfoBean>) projectDeclareInfoService.queryByCondNotPreview(bean1);
			model.addAttribute("infoList", page1.getResult());
			model.addAttribute("publicityList", page.getResult());
			model.addAttribute("countApplying", countApplying); // 统计正在申报的项目
			model.addAttribute("countPulicity", countPulicity); // 统计已公示的项目
			if (getCurrentAccountId() == null) {
				model.addAttribute("entryStatus", false); // 未登录
			} else {
				model.addAttribute("entryStatus", true); // 已登录
				model.addAttribute("accountId", getCurrentAccountId());
				// 用户级别
				model.addAttribute("zoneLevel", getAccountType(getRootId()));
				model.addAttribute("areaId", getAreaBean().getOrganizationId());
			}
			// 获取所有地市
			List<OrganizationInfoBean> areaList = organizationInfoBeanProxy.selectFirstGradeListByParentIdAndRootIdAndStatusArrayAndOrganizationKindArrayAndSystemIdArrayAndOrganizationNameSearchKey(
				new BigDecimal(360000), null, null, new Short[] { 0 }, null, null);
			model.addAttribute("areaList", areaList);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/front/projectDeclare/main";
	}

	/**
	 * 新增、编辑
	 * 
	 * @param declareId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/create")
	public String create(@RequestParam(value = "declareId", required = false) BigDecimal declareId, Model model) {
		try {
			ProjectDeclareInfoBean bean = new ProjectDeclareInfoBean();
			if (declareId != null) {
				bean = projectDeclareInfoService.selectById(declareId);
				ProjectDeclareNodeBean projectDeclareNodeBean = new ProjectDeclareNodeBean();
				projectDeclareNodeBean.setDeclareId(declareId);
				List<ProjectDeclareNodeBean> nodeList = projectDeclareNodeService.queryByCond(projectDeclareNodeBean);
				String nodeTitle = "";
				String endTime = "";
				if (nodeList.size() != 0) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					for (int i = 0; i < nodeList.size(); i++) {
						nodeList.get(i).setEndTimeStr(sdf.format(nodeList.get(i).getEndTime()));
						if (i == 0) {
							nodeTitle = nodeList.get(i).getNodeName();
							endTime = sdf.format(nodeList.get(i).getEndTime()).toString();
						} else {
							nodeTitle += "," + nodeList.get(i).getNodeName();
							endTime += "," + sdf.format(nodeList.get(i).getEndTime()).toString();
						}
					}
				}
				model.addAttribute("endTime", endTime);
				model.addAttribute("nodeTitle", nodeTitle);
				model.addAttribute("projectDeclareInfo", bean);
				model.addAttribute("nodeList", nodeList);
				model.addAttribute("listSize", nodeList.size());
				model.addAttribute("isPreview", 1);
			}
			// 分享单位列表
			List<OrganizationInfoBean> organizationList =
				organizationInfoBeanProxy.selectFirstGradeListByAccountIdAndRootIdAndSystemIdArrayAndOrganizationNameSearchKey(getCurrentAccountId(), null, null, null);
			List<OrganizationInfoBean> newOrganizationList = new ArrayList<OrganizationInfoBean>();
			for (OrganizationInfoBean orgBean : organizationList) {
				OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy.selectUnitByOrganizationId(orgBean.getOrganizationId());
				if (organizationInfoBean.getOrganizationKind() == 2 || organizationInfoBean.getOrganizationKind() == 3 || organizationInfoBean.getOrganizationKind() == 1) {
					newOrganizationList.add(organizationInfoBean);
				}
			}
			if (newOrganizationList.size() > 0) {
				model.addAttribute("organizationList", newOrganizationList);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/front/projectDeclare/createProject";
	}

	/**
	 * 新增、编辑（宜春定制申报）
	 * 
	 * @param declareId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/onlineCreate")
	public String onlineCreate(@RequestParam(value = "declareId", required = true) BigDecimal declareId, @RequestParam(value = "entranceId", defaultValue = "3609009") BigDecimal entranceId,
		Model model) {
		try {
			BigDecimal rootId = getRootId();
			model.addAttribute("rootId", rootId);
			model.addAttribute("rootName", getRootName());
			model.addAttribute("accountId", getCurrentAccountId());
			model.addAttribute("accountName", getCurrentAccountName());
			model.addAttribute("declareId", declareId);
			model.addAttribute("entranceId", entranceId);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return "/front/ycPage/declareOnlineAdd";
	}

	/**
	 * 查看详情（宜春定制申报）
	 * 
	 * @param declareId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/onlineDetail")
	public String onlineDetail(@RequestParam(value = "declareId", required = true) BigDecimal declareId, @RequestParam(value = "entranceId", defaultValue = "3609009") BigDecimal entranceId,
		Model model) {
		try {
			BigDecimal rootId = getRootId();
			model.addAttribute("rootId", rootId);
			model.addAttribute("rootName", getRootName());
			model.addAttribute("accountId", getCurrentAccountId());
			model.addAttribute("accountName", getCurrentAccountName());
			model.addAttribute("declareId", declareId);
			model.addAttribute("entranceId", entranceId);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return "/front/ycPage/declareOnlineDetail";
	}

	/**
	 * 保存操作
	 * 
	 * @param projectDeclareInfo
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/save")
	public String save(@ModelAttribute(value = "projectDeclareInfo") ProjectDeclareInfoBean projectDeclareInfo, @RequestParam(value = "nodeTitle", required = false) String nodeTitle,
		@RequestParam(value = "endTime", required = false) String endTime, @RequestParam(value = "saveType", required = false) Short saveType, // 0:预览保存 不传值为没有预览直接发布保存
		@RequestParam(value = "isPreview", required = false) Short isPreview, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo, RedirectAttributes redirectAttributes, Model model,
		ServletRequest request) {
		try {
			// 时间节点
			List<ProjectDeclareNodeBean> list = new ArrayList<ProjectDeclareNodeBean>();
			if (StringUtil.checkNotNull(nodeTitle)) {
				String[] nodeNameArr = nodeTitle.split(",");
				String[] endTimeArr = endTime.split(",");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				for (int i = 0; i < endTimeArr.length; i++) {
					ProjectDeclareNodeBean projectDeclareNode = new ProjectDeclareNodeBean();
					projectDeclareNode.setNodeId(seq.getNextSeqIdToBigDecimal());
					projectDeclareNode.setDeclareId(projectDeclareInfo.getDeclareId());
					projectDeclareNode.setNodeName(nodeNameArr[i]);
					if (StringUtil.checkNotNull(endTimeArr[i])) {
						Date date = sdf.parse(endTimeArr[i] + " 23:59:59");
						projectDeclareNode.setEndTime(date);
						if (date.getTime() >= new Date().getTime()) {
							long diff = date.getTime() - new Date().getTime();
							long between = diff / (24 * 60 * 60 * 1000);
							projectDeclareNode.setRemainDay((int) between);
						} else {
							projectDeclareNode.setRemainDay(-1);
						}
					} else {
						projectDeclareNode.setEndTime(null);
						projectDeclareNode.setRemainDay(null);
					}
					list.add(projectDeclareNode);
				}
			}
			Integer isOverdue = null;
			if (list.size() != 0) {
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getRemainDay() != -1) {
						isOverdue = 0;
					}
				}
			}
			if (isOverdue == null && list.size() != 0) {
				isOverdue = 1;
			} else {
				isOverdue = 0;
			}
			if (projectDeclareInfo.getDeclareId() == null) {
				projectDeclareInfo.setDeclareId(seq.getNextSeqIdToBigDecimal());
				projectDeclareInfo.setCreateTime(new Timestamp(new Date().getTime()));// 创建时间
				projectDeclareInfo.setAccountId(getCurrentAccountId());
				projectDeclareInfo.setAccountName(getCurrentAccountName());
				projectDeclareInfo.setQrCode(createQrcode("projectDeclare/weixin/view/" + projectDeclareInfo.getDeclareId(), null));
				projectDeclareInfo.setIsAllot((short) 0);
				if (saveType != null) {
					projectDeclareInfo.setDeclareStatus((short) 3);
				} else {
					if (isOverdue == 1) {
						projectDeclareInfo.setDeclareStatus((short) 1);
					} else if (isOverdue == 0) {
						projectDeclareInfo.setDeclareStatus((short) 0);
					}
					String str = "创建成功！";
					redirectAttributes.addFlashAttribute("message", str);
				}
				projectDeclareInfoService.insert(projectDeclareInfo, list, null);
			} else {// 预览后发布
				if (isPreview == null && saveType == null) {
					if (isOverdue == 1) {
						projectDeclareInfo.setDeclareStatus((short) 1);
					} else if (isOverdue == 0) {
						projectDeclareInfo.setDeclareStatus((short) 0);
					}
					projectDeclareInfoService.updateById(projectDeclareInfo, list);
					String str = "创建成功！";
					redirectAttributes.addFlashAttribute("message", str);
				} else {
					projectDeclareInfoService.updateById(projectDeclareInfo, list);
				}
			}
			model.addAttribute("pageNo", pageNo);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		if (saveType != null) {
			return "redirect:/projectDeclare/view?saveType=0&declareId=" + projectDeclareInfo.getDeclareId();
		} else {
			return "redirect:/projectDeclare/main";
		}
	}

	/**
	 * 新增申请成为政府用户
	 * 
	 * @param declareId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/upgradeCreate")
	public String upgradeCreate(HttpServletRequest request, @RequestParam(value = "accountId", defaultValue = "1") BigDecimal accountId, Model model) {
		model.addAttribute("accountId", accountId);
		if (isMobileDevice(request)) { // 手机端
			return "/weixinPage/personalCenter/applicationAuthority";
		} else { // PC端
			return "/front/projectDeclare/applicationAuthority";
		}
	}

	/**
	 * 保存政府用户申请
	 * 
	 * @param declareId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/upgradeSave")
	public String upgradeSave(@ModelAttribute(value = "projectDeclareUpgrade") ProjectDeclareUpgradeBean projectDeclareUpgrade, RedirectAttributes redirectAttributes, Model model,
		HttpServletRequest request) {
		try {
			projectDeclareUpgrade.setUpgradeId(seq.getNextSeqIdToBigDecimal());
			projectDeclareUpgrade.setStatus((short) 2);
			projectDeclareUpgrade.setCreateTime(new Timestamp(new Date().getTime()));
			projectDeclareUpgrade.setType((short) 0);
			projectDeclareUpgradeService.insert(projectDeclareUpgrade);
			redirectAttributes.addFlashAttribute("message", "提交申请成功！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		if (isMobileDevice(request)) { // 手机端账号升级页面
			return "redirect:/personalCenter/accountUpgrade";
		} else { // PC端
			return "redirect:/projectDeclare/main";
		}
	}

	/**
	 * 查看详细
	 * 
	 * @param declareId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/view")
	public String view(@RequestParam(value = "declareId") BigDecimal declareId, @RequestParam(value = "publicityId", required = false) BigDecimal publicityId,
		@RequestParam(value = "saveType", required = false) Short saveType, // 0:跳转到预览页面，不传值跳转到详细页面
		@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, @RequestParam(value = "publicityView", required = false) String publicityView, HttpServletRequest request, Model model) {
		try {
			if (isMobileDevice(request) && new BigDecimal(-1).compareTo(declareId) != 0) {
				return "redirect:/projectDeclare/weixin/view/" + declareId;
			}
			if (new BigDecimal(-1).compareTo(declareId) != 0) {
				ProjectDeclareInfoBean projectDeclareInfo = projectDeclareInfoService.selectById(declareId);
				ProjectDeclareNodeBean projectDeclareNodeBean = new ProjectDeclareNodeBean();
				projectDeclareNodeBean.setDeclareId(projectDeclareInfo.getDeclareId());
				projectDeclareNodeBean.setOrderByClause("NODE_NUM ASC,NODE_ID ASC");
				List<ProjectDeclareNodeBean> nodeList = projectDeclareNodeService.queryByCond(projectDeclareNodeBean);
				model.addAttribute("projectDeclareInfo", projectDeclareInfo);
				model.addAttribute("nodeList", nodeList);
			}
			model.addAttribute("declareId", declareId);
			if (StrKit.notBlank(publicityView)) {
				model.addAttribute("pubView", publicityView);
				model.addAttribute("pubId", publicityId);
			}
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("currentAccountId", getCurrentAccountId());
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		if (saveType != null) {
			return "/front/projectDeclare/createPreview";
		} else {
			return "/front/projectDeclare/projectDetails";
		}
	}

	/**
	 * 在线申报
	 * 
	 * @param declareId
	 * @param model
	 * @return
	 */
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/projectDeclare/applyCreate")
	public String applyCreate(@RequestParam(value = "declareId") BigDecimal declareId, Model model) {
		try {
			// 分享单位列表
			List<OrganizationInfoBean> organizationList =
				organizationInfoBeanProxy.selectFirstGradeListByAccountIdAndRootIdAndSystemIdArrayAndOrganizationNameSearchKey(getCurrentAccountId(), null, null, null);
			List<OrganizationInfoBean> newOrganizationList = new ArrayList<OrganizationInfoBean>();
			for (OrganizationInfoBean orgBean : organizationList) {
				OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy.selectUnitByOrganizationId(orgBean.getOrganizationId());
				if (organizationInfoBean.getOrganizationKind() == 2 || organizationInfoBean.getOrganizationKind() == 3 || organizationInfoBean.getOrganizationKind() == 1) {
					newOrganizationList.add(organizationInfoBean);
				}
			}
			if (newOrganizationList.size() > 0) {
				model.addAttribute("organizationList", newOrganizationList);
			}
			model.addAttribute("declareId", declareId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/front/projectDeclare/enterpriseApplication";
	}

	/**
	 * 申报保存操作
	 * 
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/applySave")
	public String save(@ModelAttribute(value = "projectDeclareApply") ProjectDeclareApplyBean projectDeclareApply, RedirectAttributes redirectAttributes, Model model, ServletRequest request) {
		try {
			if (projectDeclareApply.getApplyId() == null) {
				OrganizationInfoBean bean = organizationInfoBeanService.selectByPrimaryKey(projectDeclareApply.getCompanyId());
				projectDeclareApply.setApplyId(seq.getNextSeqIdToBigDecimal());
				projectDeclareApply.setCreateTime(new Timestamp(new Date().getTime()));// 创建时间
				projectDeclareApply.setApplyStatus((short) 2);
				projectDeclareApply.setAccountId(getCurrentAccountId());
				projectDeclareApply.setAuditOrgId(getCurrentParkId());
				projectDeclareApply.setSourceOrgId(bean.getOrganizationId());
				projectDeclareApply.setSourceOrgName(bean.getOrganizationName());
				projectDeclareApply.setSourceOrgKind(bean.getOrganizationKind());
				projectDeclareApplyService.insert(projectDeclareApply);
				String str = "创建成功！";
				redirectAttributes.addFlashAttribute("message", str);
			} else {// 编辑
				projectDeclareApplyService.updateById(projectDeclareApply);
				String str = "保存成功！";
				redirectAttributes.addFlashAttribute("message", str);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "redirect:/projectDeclare/view?allowApply=1&declareId=" + projectDeclareApply.getDeclareId();
	}

	/**
	 * 公示保存操作
	 * 
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/publicitySave")
	public String publicitySave(@ModelAttribute(value = "projectDeclarePublicity") ProjectDeclarePublicityBean projectDeclarePublicity, RedirectAttributes redirectAttributes, Model model,
		ServletRequest request) {
		try {
			ProjectDeclareInfoBean infoBean = projectDeclareInfoService.selectById(projectDeclarePublicity.getDeclareId());
			ProjectDeclareNodeBean nodeBean = new ProjectDeclareNodeBean();
			nodeBean.setDeclareId(projectDeclarePublicity.getDeclareId());
			List<ProjectDeclareNodeBean> list = projectDeclareNodeService.queryByCond(nodeBean);
			if (projectDeclarePublicity.getPublicityId() == null) {
				projectDeclarePublicity.setPublicityId(seq.getNextSeqIdToBigDecimal());
				projectDeclarePublicity.setCreateTime(new Timestamp(new Date().getTime()));
				if (infoBean != null && StringUtil.checkNotNull(infoBean.getSupervisorName())) {
					projectDeclarePublicity.setPublicityUnit(infoBean.getSupervisorName());
				} else {
					projectDeclarePublicity.setPublicityUnit(getRootName());
				}
				projectDeclarePublicity.setStatus((short) 1);
				projectDeclarePublicityService.insert(projectDeclarePublicity);
				if (infoBean != null && !list.isEmpty() && list.size() != 0) {
					infoBean.setDeclareStatus((short) 2);
				}
				projectDeclareInfoService.updateById(infoBean);
			} else {
				projectDeclarePublicity.setStatus((short) 1);
				projectDeclarePublicityService.updateById(projectDeclarePublicity);
				if (list.size() != 0) {
					infoBean.setDeclareStatus((short) 2);
				}
				projectDeclareInfoService.updateById(infoBean);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "redirect:/projectDeclare/view?allowApply=1&declareId=" + projectDeclarePublicity.getDeclareId();
	}

	/**
	 * 附件批量下载
	 * 
	 * @param projectDeclareApply
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/batchDownload")
	public String batchDownload(@RequestParam(value = "ids") String ids, RedirectAttributes redirectAttributes, Model model, HttpServletResponse response, ServletRequest request) {
		try {
			String[] idsStr = ids.split(",");
			ProjectDeclareApplyBean applyBean = new ProjectDeclareApplyBean();
			String atIdList = "";
			String[] companyNameStr = new String[idsStr.length];
			Map<String, String> idCompNameMap = new HashMap<String, String>();
			for (int i = 0; i < idsStr.length; i++) {
				int nextI = i + 1;
				if (StringUtil.checkNotNull(idsStr) && !(i > idsStr.length) && StringUtil.checkNotNull(idsStr[i])) {
					applyBean = projectDeclareApplyService.selectById(new BigDecimal(idsStr[i]));
					atIdList += applyBean.getAtIdList();
					companyNameStr[i] = applyBean.getCompanyName();
					String[] atIdStr = applyBean.getAtIdList().split(",");
					for (int j = 0; j < atIdStr.length; j++) {
						idCompNameMap.put(atIdStr[j], applyBean.getCompanyName() + nextI + j);
					}
				}
			}
			//去除atIdList异常数据后面的","
			if(StringUtil.checkNotNull(atIdList)&&atIdList.endsWith(",")){
				atIdList = atIdList.substring(0, atIdList.length()-1);
			}
			InvokeAttachmentsRst rst = attachmentClientHelper.selectListByAttachmentIdList(atIdList);
			if (rst != null) {
				List<AttachmentClientBean> attList = rst.getAttachments();
				// 创建数量等于列表中附件数量的File数组
				File[] file = new File[attList.size()];
				// 创建存放附件名称的map，用于重命名附件
				Map<String, String> fileNameMap = new HashMap<String, String>();
				for (int i = 0; i < attList.size(); i++) {
					AttachmentClientBean bean = attList.get(i);
					if (bean.getAttachmentUrl() != "" && bean.getAttachmentUrl() != null) {
						URL url = new URL(bean.getAttachmentUrl());
						// 将附件传入File数组中，采用的是附件的本地路径
						File f = new File(tmpdir + File.separator + bean.getRemoteName());
						FileUtils.copyURLToFile(url, f);
						file[i] = f;
						String name = file[i].getName();
						String[] fileName = name.split("\\.");
						// 将修改的命名传入附件名称的map
						fileNameMap.put(file[i].getName(), idCompNameMap.get(bean.getAttachmentId()) + "." + fileName[fileName.length - 1]);
					}
				}
				// 打印文件是否存在
				for (int i = 0; i < attList.size(); i++) {
					logger.info("-----file[" + i + "]为-------" + file[i].exists());
				}
				// 创建zip文件名及路径
				String time = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
				String strZipName = "批量下载" + time + ".zip";
				File strZipPath = new File(tmpdir, strZipName);
				// 生成zip文件
				ZipDownloadUtil util = new ZipDownloadUtil();
				util.zipUpload(file, strZipPath, fileNameMap);
				logger.info("生成打包Zip文件成功，" + strZipPath);
				// 下载
				util.zipDownload(strZipName, strZipPath, response);
			}
		} catch (Exception e) {
			return "redirect:/error/404";
		}
		return null;
	}

	/**
	 * -----------------------------------------------------------------------------
	 * 微信端同步方法
	 * -----------------------------------------------------------------------------
	 */
	/**
	 * 项目申报首页
	 */
	// 原路径：@RequestMapping(value = "/projectDeclare/weixin/main")
	@RequestMapping(value = "/auth/page/mobile/weixin/projectDeclare/weixin/main")
	public String weixinMain() {
		return "weixinPage/projectDeclare/main";
	}

	/**
	 * 项目申报首页登录跳转
	 */
	@RequestMapping(value = "/projectDeclare/weixin/main/add")
	public String weixinMainLogin() {
		return "redirect:/projectDeclare/weixin/main";
	}

	/**
	 * 我申报的
	 */
	@RequestMapping(value = "/projectDeclare/weixin/myListApplyPro")
	public String weixinMyApplyPro() {
		return "weixinPage/projectDeclare/myApplication";
	}

	/**
	 * 申报企业
	 */
	@RequestMapping(value = "/projectDeclare/weixin/applyComp")
	public String weixinApplyComp(@RequestParam(value = "declareId") BigDecimal declareId, Model model) {
		try {
			ProjectDeclareApplyBean applyBean = new ProjectDeclareApplyBean();
			applyBean.setDeclareId(declareId);
			applyBean.setApplyStatus((short) 0);
			List<ProjectDeclareApplyBean> list = projectDeclareApplyService.queryByCond(applyBean);
			int noPassNum = list.size();
			applyBean.setApplyStatus((short) 1);
			list = projectDeclareApplyService.queryByCond(applyBean);
			int passNum = list.size();
			applyBean.setApplyStatus((short) 2);
			list = projectDeclareApplyService.queryByCond(applyBean);
			int auditNum = list.size();
			model.addAttribute("noPassNum", noPassNum);
			model.addAttribute("passNum", passNum);
			model.addAttribute("auditNum", auditNum);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return "redirect:/error/404";
		}
		return "weixinPage/projectDeclare/applicationEnterprise";
	}

	/**
	 * 已发项目
	 */
	@RequestMapping(value = "/projectDeclare/weixin/myListPro")
	public String weixinMyPro() {
		return "weixinPage/projectDeclare/haveSendProject";
	}

	/**
	 * 项目详情
	 */
	@RequestMapping(value = "/projectDeclare/weixin/view/{declareId}")
	public String weixinView(@PathVariable(value = "declareId") BigDecimal declareId, HttpServletRequest request, Model model) {
		try {
			if (!isMobileDevice(request)) {
				return "redirect:/projectDeclare/view?declareId=" + declareId;
			}
			ProjectDeclareInfoBean projectDeclareInfo = projectDeclareInfoService.selectById(declareId);
			ProjectDeclareNodeBean projectDeclareNodeBean = new ProjectDeclareNodeBean();
			projectDeclareNodeBean.setDeclareId(projectDeclareInfo.getDeclareId());
			projectDeclareNodeBean.setOrderByClause("NODE_NUM ASC,NODE_ID ASC");
			List<ProjectDeclareNodeBean> nodeList = projectDeclareNodeService.queryByCond(projectDeclareNodeBean);
			model.addAttribute("projectDeclareInfo", projectDeclareInfo);
			model.addAttribute("nodeList", nodeList);
			model.addAttribute("declareId", declareId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "weixinPage/projectDeclare/projectDetails";
	}

	/**
	 * 公示详情
	 */
	@RequestMapping(value = "/projectDeclare/weixin/publicityView")
	public String weixinPublicityView(@RequestParam(value = "declareId", required = false) BigDecimal declareId, @RequestParam(value = "publicityId") BigDecimal publicityId,
		HttpServletRequest request, Model model) {
		try {
			/*
			 * if(!isMobileDevice(request)){
			 * return "redirect:/projectDeclare/view?declareId="+declareId;
			 * }
			 */
			if (declareId != null && new BigDecimal(-1).compareTo(declareId) != 0) {
				ProjectDeclareInfoBean projectDeclareInfo = projectDeclareInfoService.selectById(declareId);
				ProjectDeclareNodeBean projectDeclareNodeBean = new ProjectDeclareNodeBean();
				projectDeclareNodeBean.setDeclareId(projectDeclareInfo.getDeclareId());
				projectDeclareNodeBean.setOrderByClause("NODE_NUM ASC");
				List<ProjectDeclareNodeBean> nodeList = projectDeclareNodeService.queryByCond(projectDeclareNodeBean);
				model.addAttribute("projectDeclareInfo", projectDeclareInfo);
				model.addAttribute("nodeList", nodeList);
			}
			model.addAttribute("declareId", declareId);
			model.addAttribute("publicityId", publicityId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "weixinPage/projectDeclare/publicityDetails";
	}

	/**
	 * 结果公示
	 */
	@RequestMapping(value = "/projectDeclare/weixin/publicityList")
	public String weixinPublicityList() {
		return "weixinPage/projectDeclare/resultPublicity";
	}

	/**
	 * -----------------------------------------------------------------------------
	 * 通用异步方法
	 * -----------------------------------------------------------------------------
	 */
	/**
	 * 异步预览公示
	 * 
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/json/publicitypreView", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String publicitypreView(@ModelAttribute(value = "projectDeclarePublicity") ProjectDeclarePublicityBean projectDeclarePublicity, RedirectAttributes redirectAttributes, Model model,
		ServletRequest request) {
		String str = "0";
		try {
			if (projectDeclarePublicity.getPublicityId() == null) {
				ProjectDeclareInfoBean infoBean = projectDeclareInfoService.selectById(projectDeclarePublicity.getDeclareId());
				projectDeclarePublicity.setPublicityId(seq.getNextSeqIdToBigDecimal());
				projectDeclarePublicity.setCreateTime(new Timestamp(new Date().getTime()));
				projectDeclarePublicity.setPublicityUnit(infoBean.getSupervisorName());
				projectDeclarePublicity.setStatus((short) 0);
				projectDeclarePublicityService.insert(projectDeclarePublicity);
			} else {
				projectDeclarePublicityService.updateById(projectDeclarePublicity);
			}
			str = projectDeclarePublicity.getPublicityId().toString();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			str = "0";
		}
		return str;
	}

	/**
	 * 通过项目ID异步获取查看公示
	 * 
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/json/publicityView", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProjectDeclarePublicityBean publicityView(@RequestParam(value = "declareId") BigDecimal declareId, RedirectAttributes redirectAttributes, Model model, ServletRequest request) {
		List<ProjectDeclarePublicityBean> list = new ArrayList<ProjectDeclarePublicityBean>();
		try {
			ProjectDeclarePublicityBean bean = new ProjectDeclarePublicityBean();
			bean.setDeclareId(declareId);
			list = projectDeclarePublicityService.queryByCond(bean);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return list.get(0);
	}

	/**
	 * 通过公示ID异步获取查看公示
	 * 
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/json/publicityViewById", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProjectDeclarePublicityBean publicityViewById(@RequestParam(value = "publicityId") String publicityId, RedirectAttributes redirectAttributes, Model model, ServletRequest request) {
		ProjectDeclarePublicityBean bean = new ProjectDeclarePublicityBean();
		try {
			bean = projectDeclarePublicityService.selectById(new BigDecimal(publicityId));
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return bean;
	}

	/**
	 * 获取项目的公示列表
	 * 
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/json/publicityList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean publicityList(@ModelAttribute("projectDeclarePublicity") ProjectDeclarePublicityBean projectDeclarePublicity, @ModelAttribute("page") Page<ProjectDeclarePublicityBean> page,
		Model model) {
		ResultBean resultBean = new ResultBean();
		try {
			projectDeclarePublicity.setStatus((short) 1);
			projectDeclarePublicity.setOrderByClause("CREATE_TIME DESC");
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectDeclarePublicityBean>) projectDeclarePublicityService.queryByCond(projectDeclarePublicity);
			List<ProjectDeclarePublicityBean> list = new ArrayList<ProjectDeclarePublicityBean>();
			for (ProjectDeclarePublicityBean bean1 : page) {
				ProjectDeclareInfoBean infoBean = new ProjectDeclareInfoBean();
				infoBean.setDeclareId(bean1.getDeclareId());
				infoBean = projectDeclareInfoService.queryByCond(infoBean).get(0);
				bean1.setDeclareGrade(infoBean.getDeclareGrade());
				if (infoBean.getDeclareStatus() == 1) {
					bean1.setEndData("已截止");
				} else if (infoBean.getDeclareStatus() == 0) {
					bean1.setEndData(infoBean.getDeclareRemark());
				}
				list.add(bean1);
			}
			if (page.getTotal() == 0) {
				resultBean.setCode(2);
				return resultBean;
			}
			if (page.getTotal() > (page.getPageNum() * page.getPageSize())) {
				resultBean.setCode(1);
			} else {
				resultBean.setCode(0);
			}
			resultBean.setValue(list);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resultBean.setCode(-1);
			resultBean.setMsg("获取列表失败！");
		}
		return resultBean;
	}

	/**
	 * 获取有权限的公示列表
	 * 
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/json/publicityByOpen", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean publicityByOpen(@ModelAttribute("projectDeclarePublicity") ProjectDeclarePublicityBean projectDeclarePublicity, @ModelAttribute("page") Page<ProjectDeclarePublicityBean> page,
		Model model) {
		ResultBean resultBean = new ResultBean();
		try {
			projectDeclarePublicity.setStatus((short) 1);
			projectDeclarePublicity.setOrderByClause("CREATE_TIME DESC");
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectDeclarePublicityBean>) projectDeclarePublicityService.queryByIsOpen(projectDeclarePublicity);
			List<ProjectDeclarePublicityBean> list = new ArrayList<ProjectDeclarePublicityBean>();
			for (ProjectDeclarePublicityBean bean1 : page) {
				if (new BigDecimal(-1).compareTo(bean1.getDeclareId()) != 0) {
					ProjectDeclareInfoBean infoBean = new ProjectDeclareInfoBean();
					infoBean.setDeclareId(bean1.getDeclareId());
					infoBean = projectDeclareInfoService.queryByCond(infoBean).get(0);
					bean1.setDeclareGrade(infoBean.getDeclareGrade());
					if (infoBean.getDeclareStatus() == 2) {
						bean1.setEndData("已截止");
					} else if (infoBean.getDeclareStatus() == 0) {
						bean1.setEndData(infoBean.getDeclareRemark());
					}
				}
				list.add(bean1);
			}
			if (page.getTotal() == 0) {
				resultBean.setCode(2);
				return resultBean;
			}
			if (page.getTotal() > (page.getPageNum() * page.getPageSize())) {
				resultBean.setCode(1);
			} else {
				resultBean.setCode(0);
			}
			resultBean.setValue(list);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resultBean.setCode(-1);
			resultBean.setMsg("获取列表失败！");
		}
		return resultBean;
	}

	/**
	 * TODO 更新时间节点表剩余天数，更新项目申报业务表状态
	 * 
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/updateTime")
	public String updateTime(Model model) {
		try {
			// 更新剩余时间
			projectDeclareNodeService.updateTime();
			projectDeclareNodeService.updateTimeDay();
			// 更新项目状态
			projectDeclareInfoService.updateTime();
			model.addAttribute("success", true);
			model.addAttribute("errorCode", 0);
			model.addAttribute("errorMsg", "更新成功.");
		} catch (Exception e) {
			// 打印日志
			logger.error("失败原因：" + e.getLocalizedMessage(), e);
			model.addAttribute("success", false);
			model.addAttribute("errorCode", -1);
			model.addAttribute("errorMsg", "更新失败.");
		}
		return "jsonView";
	}

	/**
	 * 首页数据 异步加载找项目查看列表 code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 * 性能差 需要优化
	 */
	@RequestMapping(value = "/projectDeclare/json/list", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonList(@ModelAttribute("projectDeclareInfo") ProjectDeclareInfoBean projectDeclareInfo, @RequestParam(value = "type") Integer type, // 0：全部项目 1：我申报的 2：我的已发 3:最新项目 4：到期提醒
		@ModelAttribute("page") Page<ProjectDeclareInfoBean> page, Model model) {
		ResultBean resultBean = new ResultBean();
		try {
			if (projectDeclareInfo.getOrgId() == null) {
				BigDecimal organizationId = getOrganizationId();
				if (organizationId == null) {
					organizationId = BigDecimal.valueOf(-1);
				}
				projectDeclareInfo.setOrgId(organizationId);
			}
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			BigDecimal accountId = getCurrentAccountId();
			if (type == 1) {
				if (accountId!= null) {
					page = (Page<ProjectDeclareInfoBean>) projectDeclareInfoService.queryFromMyApply(accountId);
				} else {
					resultBean.setCode(-2);
					resultBean.setMsg("亲，您还没有登录");
					return resultBean;
				}
			} else if (type == 4) {
				if (accountId != null) {
					projectDeclareInfo.setDeclareStatus((short) 0);
					page = (Page<ProjectDeclareInfoBean>) projectDeclareInfoService.queryByCondOrderBy(projectDeclareInfo);
				} else {
					resultBean.setCode(-2);
					resultBean.setMsg("亲，您还没有登录");
					return resultBean;
				}
			} else {
				if (type == 0) {
					if (getCurrentAccountId() != null) {
						if (projectDeclareInfo.getAreaId() == null && "province".equals(getAccountType(getRootId()))) {
							projectDeclareInfo.setAreaIdArray(new BigDecimal[] { getAreaBean().getOrganizationId() });
						} else if (projectDeclareInfo.getAreaId() == null && "area".equals(getAccountType(getRootId()))) {
							projectDeclareInfo.setAreaIdArray(new BigDecimal[] { new BigDecimal(360000), getAreaBean().getOrganizationId() });
						}
					}
					if (projectDeclareInfo.getAreaId() != null && projectDeclareInfo.getAreaId().compareTo(new BigDecimal(-2)) == 0) {
						projectDeclareInfo.setAreaId(null);
					}
					projectDeclareInfo.setOrderByClause("a.IS_RECOMMEND DESC,a.DECLARE_STATUS ASC,a.CREATE_TIME DESC");
				} else if (type == 2) {
					if (accountId != null) {
						projectDeclareInfo.setAccountId(accountId);
						projectDeclareInfo.setOrderByClause("a.CREATE_TIME DESC");
					} else {
						resultBean.setCode(-2);
						resultBean.setMsg("亲，您还没有登录");
						return resultBean;
					}
				} else if (type == 3) {
					projectDeclareInfo.setOrderByClause("a.CREATE_TIME DESC");
				}
				page = (Page<ProjectDeclareInfoBean>) projectDeclareInfoService.queryByCondNotPreview(projectDeclareInfo);
			}
			List<ProjectDeclareInfoBean> list = new ArrayList<ProjectDeclareInfoBean>();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
			for (ProjectDeclareInfoBean bean : page) {
				bean.setCreateTimeStr(sdf.format(bean.getCreateTime()));
				list.add(bean);
			}
			if (page.getTotal() == 0) {
				resultBean.setCode(2);
				return resultBean;
			}
			if (page.getTotal() > (page.getPageNum() * page.getPageSize())) {
				resultBean.setCode(1);
			} else {
				resultBean.setCode(0);
			}
			resultBean.setValue(list);
			resultBean.setMsg(page.getTotal() + "");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resultBean.setCode(-1);
			resultBean.setMsg("获取列表失败！");
		}
		return resultBean;
	}

	/**
	 * 异步加载申报企业列表 code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 */
	@RequestMapping(value = "/projectDeclare/json/applylist", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonApplyList(@ModelAttribute("applyBean") ProjectDeclareApplyBean applyBean, @RequestParam(value = "status", required = false) String status,
		@ModelAttribute("page") Page<ProjectDeclareApplyBean> page, Model model) {
		ResultBean resultBean = new ResultBean();
		try {
			if (applyBean.getAccountId() != null && getCurrentAccountId() == null) {
				resultBean.setCode(-2);
				resultBean.setMsg("亲，请您先登录");
				return resultBean;
			} else {
				applyBean.setOrderByClause("CREATE_TIME DESC");
				if (StrKit.notBlank(status)) {
					applyBean.setApplyStatus(new Short(status));
				}
				PageHelper.startPage(page.getPageNum(), page.getPageSize());
				page = (Page<ProjectDeclareApplyBean>) projectDeclareApplyService.queryByCond(applyBean);
				List<ProjectDeclareApplyBean> list = new ArrayList<ProjectDeclareApplyBean>();
				for (ProjectDeclareApplyBean bean : page) {
					list.add(bean);
				}
				if (page.getTotal() == 0) {
					resultBean.setCode(2);
					return resultBean;
				}
				if (page.getTotal() > (page.getPageNum() * page.getPageSize())) {
					resultBean.setCode(1);
				} else {
					resultBean.setCode(0);
				}
				resultBean.setValue(list);
				resultBean.setMsg(page.getTotal() + "");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resultBean.setCode(-1);
			resultBean.setMsg("获取列表失败！");
		}
		return resultBean;
	}

	/**
	 * 判断是否是政府用户
	 * 
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/isUpgrade", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String isUpgrade() {
		String isUpgrade = "";
		try {
			ProjectDeclareUpgradeBean bean = new ProjectDeclareUpgradeBean();
			if (getCurrentAccountId() == null) {
				isUpgrade = "3";
				return isUpgrade;
			} else {
				bean.setAccountId(getCurrentAccountId());
			}
			// 判断账号是否已升级成为政务用户
			List<ProjectDeclareUpgradeBean> list = projectDeclareUpgradeService.queryByCond(bean);
			if (list.size() > 0 && list.get(0).getType() == 1) {
				isUpgrade = "1";
			} else if (list.size() == 0) {
				BigDecimal rootId = organizationIdSessionHelper.getRootIdBySessionAttribute();
				OrganizationInfoBean organizationInfo = organizationInfoBeanProxy.selectByPrimaryKey(rootId);
				if (organizationInfo.getOrganizationKind() == 1 || organizationInfo.getOrganizationKind() == 2) {
					isUpgrade = "1";
				} else {
					isUpgrade = "0";
				}
			} else if (list.get(0).getType() == 0) {
				isUpgrade = "2";
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return isUpgrade;
	}

	/**
	 * 申报审核操作
	 * 
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectDeclare/json/auditApply", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JSONObject audit(@RequestParam(value = "audit") String auditStr, @RequestParam(value = "ids") String ids, @RequestParam(value = "orgId") BigDecimal orgId,
		@RequestParam(value = "accountId") BigDecimal accountId, @RequestParam(value = "accountName") String accountName, RedirectAttributes redirectAttributes, Model model, ServletRequest request) {
		String j = "";
		JSONObject k = new JSONObject();
		try {
			ProjectDeclareApplyBean bean = new ProjectDeclareApplyBean();
			auditStr = auditStr.trim();
			Short audit = 0;
			if (auditStr.equals("通过")) {
				bean.setApplyStatus((short) 1);
				audit = 1;
			} else if (auditStr.equals("不通过")) {
				bean.setApplyStatus((short) 0);
			}
			bean.setAuditTime(new Timestamp(new Date().getTime()));
			String[] idsStr = ids.split(",");
			OrgAuditInfoBean orgBean = orgAuditInfoService.selectById(orgId);
			for (int i = 0; i < idsStr.length; i++) {
				bean.setApplyId(new BigDecimal(idsStr[i]));
				projectDeclareApplyService.updateById(bean);
				ProjectDeclareApplyBean applyBean = projectDeclareApplyService.selectById(new BigDecimal(idsStr[i]));
				// 新增审核日志
				ProjectDeclareAuditlogBean auditBean = new ProjectDeclareAuditlogBean();
				auditBean.setAuditId(seq.getNextSeqIdToBigDecimal());
				auditBean.setApplyId(new BigDecimal(idsStr[i]));
				auditBean.setApplySourceOrg(applyBean.getSourceOrgName());
				auditBean.setOrgId(orgBean.getOrgId());
				auditBean.setOrgName(orgBean.getOrgName());
				auditBean.setOrgKind(orgBean.getOrgKind());
				auditBean.setAccountId(accountId);
				auditBean.setAccountName(accountName);
				auditBean.setStatus(audit);
				auditBean.setAuditTime(new Timestamp(new Date().getTime()));
				projectDeclareAuditlogService.insert(auditBean);
				if (applyBean.getAccountId() != null && applyBean.getAccountId().compareTo(new BigDecimal(-1)) != 0) {
					j += "," + applyBean.getAccountId();
				}
			}
			if (StringUtil.checkNotNull(j)) {
				j = j.substring(1);
			}
			k.put("accountIds", j);
			k.put("success", true);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			k.put("success", false);
		}
		return k;
	}

	/**
	 * -----------------------------------------------------------------------------
	 * 接口
	 * -----------------------------------------------------------------------------
	 */
	/**
	 * 保存
	 * 
	 * @param projectDeclareInfo
	 * @param nodeTitle
	 * @param endTime
	 * @param saveType
	 * @param isPreview
	 * @param pageNo
	 * @param redirectAttributes
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/bc")
	public String jsonSave(@RequestParam(value = "declareId", required = false) BigDecimal declareId, @RequestParam(value = "isAllot", required = false) Short isAllot,
		@RequestParam(value = "indexCount", required = false) Integer indexCount, @RequestParam(value = "declareTitle", required = false) String declareTitle,
		@RequestParam(value = "declareGrade", required = false) String declareGrade, @RequestParam(value = "supervisorName", required = false) String supervisorName,
		@RequestParam(value = "supervisorId", required = false) BigDecimal supervisorId, @RequestParam(value = "declareImage", required = false) String declareImage,
		@RequestParam(value = "declareImageId", required = false) BigDecimal declareImageId, @RequestParam(value = "declareText", required = false) String declareText,
		@RequestParam(value = "atUrlList", required = false) String atUrlList, @RequestParam(value = "atIdList", required = false) String atIdList,
		@RequestParam(value = "declareRemark", required = false) String declareRemark, @RequestParam(value = "applyOnline", required = false) String applyOnline,
		@RequestParam(value = "applyYc", required = false) Short applyYc, @RequestParam(value = "isRecommend", required = false) String isRecommend,
		@RequestParam(value = "accountId", required = false) BigDecimal accountId, @RequestParam(value = "accountName", required = false) String accountName,
		@RequestParam(value = "nodeTitle", required = false) String nodeTitle, @RequestParam(value = "endTime", required = false) String endTime,
		@RequestParam(value = "orgIdStr", required = false) String orgIdStr, @RequestParam(value = "orgNameStr", required = false) String orgNameStr,
		@RequestParam(value = "declareOpen", required = false) Short declareOpen, @RequestParam(value = "areaId", required = false) BigDecimal areaId,
		@RequestParam(value = "areaName", required = false) String areaName, HttpServletResponse response, ModelMap modelMap) {
		try {
			int result = 0;
			ProjectDeclareInfoBean projectDeclareInfo = new ProjectDeclareInfoBean();
			if (declareId == null) {
				projectDeclareInfo.setDeclareId(seq.getNextSeqIdToBigDecimal());
				projectDeclareInfo.setCreateTime(new Timestamp(new Date().getTime()));// 创建时间
				try {
					String Qrcode = createQrcode("projectDeclare/weixin/view/" + projectDeclareInfo.getDeclareId(), null);
					projectDeclareInfo.setQrCode(Qrcode);
				} catch (Exception e) {
				}
				projectDeclareInfo.setDeclareStatus((short) 0);
				projectDeclareInfo.setDeclareTitle(declareTitle);
				projectDeclareInfo.setDeclareGrade(declareGrade);
				projectDeclareInfo.setSupervisorName(supervisorName);
				projectDeclareInfo.setSupervisorId(supervisorId);
				projectDeclareInfo.setDeclareImage(declareImage);
				projectDeclareInfo.setDeclareImageId(declareImageId);
				projectDeclareInfo.setDeclareText(declareText);
				projectDeclareInfo.setAtIdList(atIdList);
				projectDeclareInfo.setAtUrlList(atUrlList);
				projectDeclareInfo.setDeclareRemark(declareRemark);
				if(applyOnline!=null){
					projectDeclareInfo.setApplyOnline(Short.parseShort(applyOnline));
				}
				projectDeclareInfo.setApplyYc(applyYc);
				projectDeclareInfo.setIsRecommend(isRecommend);
				projectDeclareInfo.setAccountId(accountId);
				projectDeclareInfo.setAccountName(accountName);
				projectDeclareInfo.setIsAllot((short) 0);
				projectDeclareInfo.setDeclareOpen(declareOpen);
				projectDeclareInfo.setAreaId(areaId);
				projectDeclareInfo.setAreaName(areaName);
				// 时间节点
				List<ProjectDeclareNodeBean> list = new ArrayList<ProjectDeclareNodeBean>();
				if (StringUtil.checkNotNull(nodeTitle)) {
					String[] nodeNameArr = nodeTitle.split(",");
					String[] endTimeArr = endTime.split(",");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					for (int i = 0; i < endTimeArr.length; i++) {
						ProjectDeclareNodeBean projectDeclareNode = new ProjectDeclareNodeBean();
						projectDeclareNode.setNodeId(seq.getNextSeqIdToBigDecimal());
						projectDeclareNode.setDeclareId(projectDeclareInfo.getDeclareId());
						projectDeclareNode.setNodeName(nodeNameArr[i]);
						if (StringUtil.checkNotNull(endTimeArr[i])) {
							Date date = sdf.parse(endTimeArr[i] + " 23:59:59");
							projectDeclareNode.setEndTime(date);
							if (date.getTime() >= new Date().getTime()) {
								long diff = date.getTime() - new Date().getTime();
								long between = diff / (24 * 60 * 60 * 1000);
								projectDeclareNode.setRemainDay((int) between);
							} else {
								projectDeclareNode.setRemainDay(-1);
							}
						} else {
							projectDeclareNode.setEndTime(null);
							projectDeclareNode.setRemainDay(null);
						}
						list.add(projectDeclareNode);
					}
				}
				List<ProjectDeclareOrgBean> orgList = new ArrayList<ProjectDeclareOrgBean>();
				if (StringUtil.checkNotNull(orgIdStr)) {
					String[] orgIdArr = orgIdStr.split(",");
					String[] orgNameArr = orgNameStr.split(",");
					Timestamp nowTime = new Timestamp(new Date().getTime());
					for (int k = 0; k < orgIdArr.length; k++) {
						ProjectDeclareOrgBean orgBean = new ProjectDeclareOrgBean();
						orgBean.setDeclareId(projectDeclareInfo.getDeclareId());
						orgBean.setCreateTime(nowTime);
						orgBean.setRelatedId(seq.getNextSeqIdToBigDecimal());
						orgBean.setOrgId(new BigDecimal(orgIdArr[k]));
						orgBean.setOrgName(orgNameArr[k]);
						orgList.add(orgBean);
					}
				}
				result = projectDeclareInfoService.insert(projectDeclareInfo, list, orgList);
			} else if (declareImageId != null) { // 编辑海报
				projectDeclareInfo.setDeclareId(declareId);
				projectDeclareInfo.setDeclareImage(declareImage);
				projectDeclareInfo.setDeclareImageId(declareImageId);
				result = projectDeclareInfoService.updateById(projectDeclareInfo);
			} else { // 分配指标
				projectDeclareInfo.setDeclareId(declareId);
				projectDeclareInfo.setIndexCount(indexCount);
				projectDeclareInfo.setIsAllot(isAllot);
				result = projectDeclareInfoService.updateById(projectDeclareInfo);
			}
			if (result == 1) {
				modelMap.addAttribute("value", projectDeclareInfo.getDeclareId());
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "发布成功!");
			} else {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", -1);
				modelMap.addAttribute("errorMsg", "发布失败！");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "发布失败！");
		}
		return "jsonView";
	}

	/**
	 * 我的已发列表
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/list")
	public String jsonMyList(@ModelAttribute("projectDeclareInfo") ProjectDeclareInfoBean projectDeclareInfo, @RequestParam(value = "accountId") BigDecimal accountId,
		Page<ProjectDeclareInfoBean> page, ModelMap modelMap) {
		try {
			projectDeclareInfo.setAccountId(accountId);
			projectDeclareInfo.setOrderByClause("CREATE_TIME DESC");
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectDeclareInfoBean>) projectDeclareInfoService.queryByCondNotPreview(projectDeclareInfo);
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
	 * 公示保存操作
	 * 
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/publicityBc")
	public String jsonPublicitySave(@RequestParam(value = "publicityTitle") String publicityTitle, @RequestParam(value = "publicityText") String publicityText,
		@RequestParam(value = "atUrlList", required = false) String atUrlList, @RequestParam(value = "atIdList", required = false) String atIdList,
		@RequestParam(value = "declareId") BigDecimal declareId, @RequestParam(value = "publicityUnit", required = false) String publicityUnit, RedirectAttributes redirectAttributes,
		ModelMap modelMap, ServletRequest request) {
		try {
			ProjectDeclarePublicityBean projectDeclarePublicity = new ProjectDeclarePublicityBean();
			projectDeclarePublicity.setPublicityTitle(publicityTitle);
			projectDeclarePublicity.setPublicityText(publicityText);
			projectDeclarePublicity.setAtIdList(atIdList);
			projectDeclarePublicity.setAtUrlList(atUrlList);
			projectDeclarePublicity.setDeclareId(declareId);
			ProjectDeclareInfoBean infoBean = null;
			if (new BigDecimal(-1).compareTo(declareId) != 0) {
				infoBean = projectDeclareInfoService.selectById(projectDeclarePublicity.getDeclareId());
				publicityUnit = infoBean.getSupervisorName();
			}
			ProjectDeclareNodeBean nodeBean = new ProjectDeclareNodeBean();
			nodeBean.setDeclareId(projectDeclarePublicity.getDeclareId());
			List<ProjectDeclareNodeBean> list = projectDeclareNodeService.queryByCond(nodeBean);
			projectDeclarePublicity.setPublicityId(seq.getNextSeqIdToBigDecimal());
			projectDeclarePublicity.setCreateTime(new Timestamp(new Date().getTime()));
			projectDeclarePublicity.setPublicityUnit(publicityUnit);
			projectDeclarePublicity.setStatus((short) 1);
			projectDeclarePublicityService.insert(projectDeclarePublicity);
			if (list.size() != 0 && new BigDecimal(-1).compareTo(declareId) != 0) {
				infoBean.setDeclareStatus((short) 2);
				projectDeclareInfoService.updateById(infoBean);
			}
			if (new BigDecimal(-1).compareTo(declareId) != 0) {
				// 获取申报数据
				ProjectDeclareApplyBean applyBean = new ProjectDeclareApplyBean();
				applyBean.setDeclareId(declareId);
				applyBean.setApplyStatus((short) 1);
				applyBean.setAuditOrgId(new BigDecimal(3600009));
				List<ProjectDeclareApplyBean> applyList = projectDeclareApplyService.queryByCond(applyBean);
				modelMap.addAttribute("applyList", applyList);
				modelMap.addAttribute("declareTitle", projectDeclareInfoService.selectById(declareId).getDeclareTitle());
			}
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "发布成功!");
		} catch (Exception e) {
			logger.error(e.getMessage());
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "发布失败！");
		}
		return "jsonView";
	}

	/**
	 * 公示删除操作
	 * 
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/publicityDelete")
	public String jsonPublicitySave(@RequestParam(value = "publicityIdStr") String publicityIdStr, RedirectAttributes redirectAttributes, ModelMap modelMap, ServletRequest request) {
		try {
			String[] publicityIdArr = publicityIdStr.split(",");
			int rst = projectDeclarePublicityService.batchDelete(publicityIdArr);
			if (rst > 0) {
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "删除成功!");
			} else {
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "删除失败!");
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "删除失败！");
		}
		return "jsonView";
	}

	@RequestMapping(value = "/interface/json/projectDeclare/publicityList")
	public String jsonPublicityList(@ModelAttribute("projectDeclarePublicity") ProjectDeclarePublicityBean projectDeclarePublicity, @ModelAttribute("page") Page<ProjectDeclarePublicityBean> page,
		ModelMap modelMap) {
		try {
			projectDeclarePublicity.setStatus((short) 1);
			projectDeclarePublicity.setOrderByClause("CREATE_TIME DESC");
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectDeclarePublicityBean>) projectDeclarePublicityService.selectWithForegin(projectDeclarePublicity);
			modelMap.addAttribute("value", page.getResult());
			modelMap.addAttribute("total", page.getTotal());
			modelMap.addAttribute("pages", page.getPages());
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取列表成功!");
		} catch (Exception e) {
			logger.error(e.getMessage());
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取列表失败！");
		}
		return "jsonView";
	}

	/**
	 * 查看公示
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/publicityView")
	public String jsonPublicityView(@RequestParam(value = "publicityId") String publicityId, RedirectAttributes redirectAttributes, ModelMap modelMap, ServletRequest request) {
		ProjectDeclarePublicityBean bean = new ProjectDeclarePublicityBean();
		try {
			bean = projectDeclarePublicityService.selectById(new BigDecimal(publicityId));
			modelMap.addAttribute("value", bean);
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

	/**
	 * 统计导出
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/countUnit")
	public String countUnit(@ModelAttribute(value = "projectDeclareInfo") ProjectDeclareInfoBean projectDeclareInfo, @RequestParam(value = "areaIdStr", required = false) String areaIdStr,
		@ModelAttribute("page") Page<ProjectDeclareInfoBean> page, ModelMap modelMap) {
		try {
			if (StringUtil.checkNotNull(areaIdStr)) {
				String[] areaStrArray = areaIdStr.split(",");
				BigDecimal[] areaIdArray = new BigDecimal[areaStrArray.length];
				for (int i = 0; i < areaStrArray.length; i++) {
					areaIdArray[i] = new BigDecimal(areaStrArray[i]);
				}
				projectDeclareInfo.setAreaIdArray(areaIdArray);
			}
			if (page.getPageNum() != 0) {
				PageHelper.startPage(page.getPageNum(), page.getPageSize());
				page = (Page<ProjectDeclareInfoBean>) projectDeclareInfoService.queryForCount(projectDeclareInfo);
				modelMap.addAttribute("value", page.getResult());
				modelMap.addAttribute("total", page.getTotal());
				modelMap.addAttribute("pages", page.getPages());
			} else {
				List<ProjectDeclareInfoBean> list = projectDeclareInfoService.queryForCount(projectDeclareInfo);
				modelMap.addAttribute("value", list);
			}
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
	 * 
	 * @param declareId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/view")
	public String jsonView(@RequestParam(value = "declareId") BigDecimal declareId, ModelMap modelMap) {
		try {
			ProjectDeclareInfoBean projectDeclareInfo = projectDeclareInfoService.selectById(declareId);
			ProjectDeclareNodeBean projectDeclareNodeBean = new ProjectDeclareNodeBean();
			projectDeclareNodeBean.setDeclareId(projectDeclareInfo.getDeclareId());
			projectDeclareNodeBean.setOrderByClause("NODE_NUM ASC");
			List<ProjectDeclareNodeBean> nodeList = projectDeclareNodeService.queryByCond(projectDeclareNodeBean);
			modelMap.addAttribute("value", projectDeclareInfo);
			modelMap.addAttribute("nodeList", nodeList);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取详情成功!");
		} catch (Exception e) {
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取详情失败！");
		}
		return "jsonView";
	}

	/**
	 * 企业申报列表
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/applyList")
	public String jsonApplyList(@ModelAttribute("projectDeclareApplyBean") ProjectDeclareApplyBean projectDeclareApplyBean, @ModelAttribute("page") Page<ProjectDeclareApplyBean> page,
		ModelMap modelMap) {
		try {
			projectDeclareApplyBean.setOrderByClause("source_org_id asc,sort_num asc");
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectDeclareApplyBean>) projectDeclareApplyService.queryByCond(projectDeclareApplyBean);
			long total = page.getTotal();
			long pages = page.getPages();
			modelMap.addAttribute("value", page.getResult());
			modelMap.addAttribute("total", total);
			modelMap.addAttribute("pages", pages);
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
	 * 已审核申报列表
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/auditedApplyList")
	public String jsonAuditedApplyList(@RequestParam(value = "auditOrgId") BigDecimal auditOrgId, @RequestParam(value = "declareId", required = false) BigDecimal declareId,
		@RequestParam(value = "companyName", required = false) String companyName, @ModelAttribute("page") Page<ProjectDeclareApplyBean> page, ModelMap modelMap) {
		try {
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectDeclareApplyBean>) projectDeclareApplyService.selectAuditedList(declareId, auditOrgId, companyName);
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
	 * 已上报申报列表
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/reportedApplyList")
	public String jsonReportedApplyList(@RequestParam(value = "auditOrgId") BigDecimal auditOrgId, @RequestParam(value = "declareId") BigDecimal declareId,
		@RequestParam(value = "companyName", required = false) String companyName, @ModelAttribute("page") Page<ProjectDeclareApplyBean> page, ModelMap modelMap) {
		try {
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectDeclareApplyBean>) projectDeclareApplyService.selectReportedList(declareId, auditOrgId, companyName);
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
	 * 上报申报
	 * 
	 * @param applyIds
	 * @param declareId
	 * @param accountId
	 * @param accountName
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/reportApply")
	public String jsonReportApply(@RequestParam(value = "applyIds") String applyIds, @RequestParam(value = "declareId") BigDecimal declareId, @RequestParam(value = "accountId") BigDecimal accountId,
		@RequestParam(value = "accountName") String accountName, ModelMap modelMap) {
		try {
			String[] applyIdStr = applyIds.split(",");
			ProjectDeclareApplyBean applyBean = new ProjectDeclareApplyBean();
			ProjectDeclareLogBean logBean = new ProjectDeclareLogBean();
			OrgAuditInfoBean orgBean = new OrgAuditInfoBean();
			OrgAuditExampleBean exampleBean = new OrgAuditExampleBean();
			for (int i = 0; i < applyIdStr.length; i++) {
				applyBean = projectDeclareApplyService.selectById(new BigDecimal(applyIdStr[i]));
				orgBean = orgAuditInfoService.selectById(applyBean.getAuditOrgId());
				// 新增上报日志
				logBean.setLogId(seq.getNextSeqIdToBigDecimal());
				logBean.setApplyId(applyBean.getApplyId());
				logBean.setSortNum(applyBean.getSortNum());
				logBean.setOrgId(orgBean.getOrgId());
				logBean.setOrgName(orgBean.getOrgName());
				logBean.setOrgKind(orgBean.getOrgKind());
				logBean.setAccountId(accountId);
				logBean.setAccountName(accountName);
				logBean.setStatus((short) 1);
				logBean.setCreateTime(new Timestamp(new Date().getTime()));
				proDeclareLogService.insert(logBean);
				// 修改申报来源、状态、排序
				applyBean.setSourceOrgId(orgBean.getOrgId());
				applyBean.setSourceOrgName(orgBean.getOrgName());
				applyBean.setSourceOrgKind(orgBean.getOrgKind());
				applyBean.setAuditOrgId(orgBean.getParentId());
				applyBean.setApplyStatus((short) 2);
				applyBean.setSortNum(i + 1);
				projectDeclareApplyService.updateById(applyBean);
			}
			// 修改指标实例表上报状态
			exampleBean.setDeclareId(declareId);
			exampleBean.setOrgId(orgBean.getOrgId());
			exampleBean = orgAuditExampleService.queryByCond(exampleBean).get(0);
			exampleBean.setIsReport((short) 1);
			orgAuditExampleService.updateById(exampleBean);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "上报成功!");
		} catch (Exception e) {
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "上报失败！");
		}
		return "jsonView";
	}

	/**
	 * 申报排序列表
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/applySort")
	public String jsonApplySort(@RequestParam(value = "applyIds") String applyIds, ModelMap modelMap) {
		try {
			String[] applyIdStr = applyIds.split(",");
			List<ProjectDeclareApplyBean> list = new ArrayList<ProjectDeclareApplyBean>();
			for (int i = 0; i < applyIdStr.length; i++) {
				ProjectDeclareApplyBean bean = projectDeclareApplyService.selectById(new BigDecimal(applyIdStr[i]));
				list.add(bean);
			}
			modelMap.addAttribute("value", list);
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
	 * 附件批量下载
	 * 
	 * @param projectDeclareApply
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/batchDownload")
	public String batchDownload(@RequestParam(value = "ids") String ids, RedirectAttributes redirectAttributes, ModelMap modelMap, HttpServletResponse response, ServletRequest request) {
		try {
			String[] idsStr = ids.split(",");
			ProjectDeclareApplyBean applyBean = new ProjectDeclareApplyBean();
			String atIdList = "";
			String[] companyNameStr = new String[idsStr.length];
			Map<String, String> idCompNameMap = new HashMap<String, String>();
			int n = 1;
			for (int i = 0; i < idsStr.length; i++) {
				int nextI = ++n;
				applyBean = projectDeclareApplyService.selectById(new BigDecimal(idsStr[i]));
				atIdList += "," + applyBean.getAtIdList();
				companyNameStr[i] = applyBean.getCompanyName();
				String[] atIdStr = applyBean.getAtIdList().split(",");
				for (int j = 0; j < atIdStr.length; j++) {
					idCompNameMap.put(atIdStr[j], applyBean.getCompanyName() + nextI + j);
				}
			}
			if (StringUtil.checkNotNull(atIdList)) {
				atIdList = atIdList.substring(1);
			}
			InvokeAttachmentsRst rst = attachmentClientHelper.selectListByAttachmentIdList(atIdList);
			if (rst != null) {
				modelMap.addAttribute("attList", rst.getAttachments());
				modelMap.addAttribute("map", idCompNameMap);
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "获取附件成功!");
			}
		} catch (Exception e) {
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取附件失败！");
		}
		return "jsonView";
	}

	/**
	 * 上报保存（没有用到）
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/reported")
	public String jsonReported(@RequestParam(value = "applyIds") String applyIds, @RequestParam(value = "accountId") BigDecimal accountId, @RequestParam(value = "accountName") String accountName,
		ModelMap modelMap) {
		try {
			String[] applyIdStr = applyIds.split(",");
			BigDecimal declareId = null;
			BigDecimal orgId = null;
			BigDecimal parentId = null;
			for (int i = 1; i < applyIdStr.length + 1; i++) {
				ProjectDeclareApplyBean bean = projectDeclareApplyService.selectById(new BigDecimal(applyIdStr[i - 1]));
				OrgAuditInfoBean orgBean = orgAuditInfoService.selectById(bean.getAuditOrgId());
				if (i == 1) {
					declareId = bean.getDeclareId();
					orgId = orgBean.getOrgId();
					parentId = orgBean.getParentId();
				}
				// 新增上报日志
				ProjectDeclareLogBean logBean = new ProjectDeclareLogBean();
				logBean.setLogId(seq.getNextSeqIdToBigDecimal());
				logBean.setApplyId(bean.getApplyId());
				logBean.setSortNum(i);
				logBean.setOrgId(orgBean.getOrgId());
				logBean.setOrgName(orgBean.getOrgName());
				logBean.setOrgKind(orgBean.getOrgKind());
				logBean.setAccountId(accountId);
				logBean.setAccountName(accountName);
				logBean.setStatus((short) 1);
				logBean.setCreateTime(new Timestamp(new Date().getTime()));
				projectDeclareLogService.insert(logBean);
				// 更新企业申报状态
				bean.setApplyStatus((short) 2);
				bean.setAuditTime(null);
				bean.setSourceOrgId(orgBean.getOrgId());
				bean.setSourceOrgName(orgBean.getOrgName());
				bean.setSourceOrgKind(orgBean.getOrgKind());
				bean.setSortNum(i);
				bean.setAuditOrgId(orgBean.getParentId());
				projectDeclareApplyService.baseUpdateById(bean);
			}
			// 修改指标状态
			OrgAuditExampleBean exampleBean = new OrgAuditExampleBean();
			exampleBean.setDeclareId(declareId);
			exampleBean.setOrgId(orgId);
			List<OrgAuditExampleBean> list = orgAuditExampleService.queryByCond(exampleBean);
			if (list.size() == 0) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", -1);
				modelMap.addAttribute("errorMsg", "上报失败,原因，指标实例表中没有数据！");
				return "jsonView";
			}
			exampleBean = list.get(0);
			exampleBean.setIsReport((short) 1);
			orgAuditExampleService.updateById(exampleBean);
			modelMap.addAttribute("parentId", parentId);
			modelMap.addAttribute("declareTitle", projectDeclareInfoService.selectById(declareId).getDeclareTitle());
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "上报成功!");
		} catch (Exception e) {
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "上报失败！");
		}
		return "jsonView";
	}

	/**
	 * 代理申报
	 * 
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/applyAuditedSave")
	public String jsonApplyAuditedSave(@ModelAttribute(value = "projectDeclareApply") ProjectDeclareApplyBean projectDeclareApply, RedirectAttributes redirectAttributes, ModelMap modelMap,
		ServletRequest request) {
		try {
			projectDeclareApply.setApplyId(seq.getNextSeqIdToBigDecimal());
			projectDeclareApply.setCreateTime(new Timestamp(new Date().getTime()));// 创建时间
			projectDeclareApply.setAuditTime(new Timestamp(new Date().getTime()));
			projectDeclareApply.setAccountId(new BigDecimal(-1));
			projectDeclareApply.setCompanyId(new BigDecimal(-1));
			projectDeclareApply.setApplyStatus((short) 1);
			projectDeclareApplyService.insert(projectDeclareApply);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "申报成功!");
		} catch (Exception e) {
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "申报失败！");
		}
		return "jsonView";
	}

	/**
	 * 带项目名称的查询方法
	 * 
	 * @param projectDeclareApply
	 * @param redirectAttributes
	 * @param modelMap
	 * @param request
	 * @return 章越 2017.10.27
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/selectWithForegin")
	public String jsonSelectWithForegin(@ModelAttribute(value = "projectDeclareApply") ProjectDeclareApplyBean projectDeclareApply, @ModelAttribute("page") Page<ProjectDeclareApplyBean> page,
		RedirectAttributes redirectAttributes, ModelMap modelMap, ServletRequest request) {
		try {
			if (page.getPageNum() == 0) {
				page.setPageNum(1);
				page.setPageSize(10);
			}
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectDeclareApplyBean>) projectDeclareApplyService.selectApplyWithForegin(projectDeclareApply);
			modelMap.addAttribute("value", page.getResult());
			modelMap.addAttribute("total", page.getTotal());
			modelMap.addAttribute("pages", page.getPages());
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "接口调用成功!");
		} catch (Exception e) {
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "接口调用异常失败！原因：" + e.getMessage());
		}
		return "jsonView";
	}

	/**
	 * 首页数据 异步加载找项目查看列表 code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/listFowWx")
	public String listFowWx(@ModelAttribute("projectDeclareInfo") ProjectDeclareInfoBean projectDeclareInfo, @RequestParam(value = "type", required = false) Integer type, // 0：全部项目 1：我申报的 2：我的已发 3:最新项目 4：到期提醒
		@RequestParam(value = "accountId", required = false) BigDecimal accountId, @ModelAttribute("page") Page<ProjectDeclareInfoBean> page, ModelMap modelMap) {
		try {
			if (type == null) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数type未设置！");
				return "jsonView";
			}
			if (projectDeclareInfo
				.getOrgId() == null/* && getOrganizationId()==null */) {
				projectDeclareInfo.setOrgId(new BigDecimal(-1));
			}
			if (type == 1) {
				if (accountId != null) {
					PageHelper.startPage(page.getPageNum(), page.getPageSize());
					page = (Page<ProjectDeclareInfoBean>) projectDeclareInfoService.queryFromMyApply(accountId);
				} else {
					modelMap.addAttribute("success", false);
					modelMap.addAttribute("errorCode", 1);
					modelMap.addAttribute("errorMsg", "亲，您还没有登录");
					return "jsonView";
				}
			} else if (type == 4) {
				if (accountId != null) {
					PageHelper.startPage(page.getPageNum(), page.getPageSize());
					projectDeclareInfo.setDeclareStatus((short) 0);
					page = (Page<ProjectDeclareInfoBean>) projectDeclareInfoService.queryByCondOrderBy(projectDeclareInfo);
				} else {
					modelMap.addAttribute("success", false);
					modelMap.addAttribute("errorCode", 1);
					modelMap.addAttribute("errorMsg", "亲，您还没有登录");
					return "jsonView";
				}
			} else {
				if (type == 0) {
					projectDeclareInfo.setOrderByClause("a.IS_RECOMMEND DESC,a.DECLARE_STATUS ASC,a.CREATE_TIME DESC");
				} else if (type == 2) {
					if (accountId != null) {
						projectDeclareInfo.setAccountId(accountId);
						projectDeclareInfo.setOrderByClause("a.CREATE_TIME DESC");
					} else {
						modelMap.addAttribute("success", false);
						modelMap.addAttribute("errorCode", 1);
						modelMap.addAttribute("errorMsg", "亲，您还没有登录");
						return "jsonView";
					}
				} else if (type == 3) {
					projectDeclareInfo.setOrderByClause("a.CREATE_TIME DESC");
				}
				PageHelper.startPage(page.getPageNum(), page.getPageSize());
				page = (Page<ProjectDeclareInfoBean>) projectDeclareInfoService.queryByCondNotPreview(projectDeclareInfo);
			}
			List<ProjectDeclareInfoBean> list = new ArrayList<ProjectDeclareInfoBean>();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
			for (ProjectDeclareInfoBean bean : page) {
				bean.setCreateTimeStr(sdf.format(bean.getCreateTime()));
				list.add(bean);
			}
			/*
			 * if(page.getTotal()==0){
			 * resultBean.setCode(2);
			 * return resultBean;
			 * }
			 * if(page.getTotal()>(page.getPageNum()*page.getPageSize())){
			 * resultBean.setCode(1);
			 * }else{
			 * resultBean.setCode(0);
			 * }
			 * resultBean.setValue(list);
			 * resultBean.setMsg(page.getTotal()+"");
			 */
			modelMap.addAttribute("value", page.getResult());
			modelMap.addAttribute("total", page.getTotal());
			modelMap.addAttribute("pages", page.getPages());
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "接口调用成功!");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "接口调用异常失败！原因：" + e.getMessage());
			/*
			 * resultBean.setCode(-1);
			 * resultBean.setMsg("获取列表失败！");
			 */
		}
		return "jsonView";
	}

	/**
	 * 异步加载申报企业列表 code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/applylistForWx")
	public String applylistForWx(@ModelAttribute("applyBean") ProjectDeclareApplyBean applyBean, @RequestParam(value = "status", required = false) String status,
		@ModelAttribute("page") Page<ProjectDeclareApplyBean> page, ModelMap modelMap) {
		try {
			if (applyBean
				.getAccountId() != null/* && getCurrentAccountId()==null */) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "亲，您还没有登录");
				return "jsonView";
			} else {
				applyBean.setOrderByClause("CREATE_TIME DESC");
				if (StrKit.notBlank(status)) {
					applyBean.setApplyStatus(new Short(status));
				}
				PageHelper.startPage(page.getPageNum(), page.getPageSize());
				page = (Page<ProjectDeclareApplyBean>) projectDeclareApplyService.queryByCond(applyBean);
				modelMap.addAttribute("value", page.getResult());
				modelMap.addAttribute("total", page.getTotal());
				modelMap.addAttribute("pages", page.getPages());
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "接口调用成功!");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "接口调用异常失败！原因：" + e.getMessage());
		}
		return "jsonView";
	}

	/**
	 * 获取项目的公示列表
	 * 
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/publicityListForWx")
	public String publicityListForWx(@ModelAttribute("projectDeclarePublicity") ProjectDeclarePublicityBean projectDeclarePublicity, @ModelAttribute("page") Page<ProjectDeclarePublicityBean> page,
		ModelMap modelMap) {
		try {
			projectDeclarePublicity.setStatus((short) 1);
			projectDeclarePublicity.setOrderByClause("CREATE_TIME DESC");
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectDeclarePublicityBean>) projectDeclarePublicityService.queryByCond(projectDeclarePublicity);
			List<ProjectDeclarePublicityBean> list = new ArrayList<ProjectDeclarePublicityBean>();
			for (ProjectDeclarePublicityBean bean1 : page) {
				ProjectDeclareInfoBean infoBean = new ProjectDeclareInfoBean();
				infoBean.setDeclareId(bean1.getDeclareId());
				infoBean = projectDeclareInfoService.queryByCond(infoBean).get(0);
				bean1.setDeclareGrade(infoBean.getDeclareGrade());
				if (infoBean.getDeclareStatus() == 2) {
					bean1.setEndData("已截止");
				} else if (infoBean.getDeclareStatus() == 0) {
					bean1.setEndData(infoBean.getDeclareRemark());
				}
				list.add(bean1);
			}
			modelMap.addAttribute("value", list);
			modelMap.addAttribute("total", page.getTotal());
			modelMap.addAttribute("pages", page.getPages());
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "接口调用成功!");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "接口调用异常失败！原因：" + e.getMessage());
		}
		return "jsonView";
	}

	/**
	 * 通过公示ID异步获取查看公示
	 * 
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/publicityViewByIdForWx")
	public String publicityViewByIdForWx(@RequestParam(value = "publicityId") String publicityId, RedirectAttributes redirectAttributes, ModelMap modelMap, ServletRequest request) {
		ProjectDeclarePublicityBean bean = new ProjectDeclarePublicityBean();
		try {
			bean = projectDeclarePublicityService.selectById(new BigDecimal(publicityId));
			modelMap.addAttribute("value", bean);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "接口调用成功!");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "接口调用异常失败！原因：" + e.getMessage());
		}
		return "jsonView";
	}

	/**
	 * 获取有权限的公示列表
	 * 
	 * @param projectDeclareApply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/publicityByOpenForWx")
	public String publicityByOpenForWx(@ModelAttribute("projectDeclarePublicity") ProjectDeclarePublicityBean projectDeclarePublicity, @ModelAttribute("page") Page<ProjectDeclarePublicityBean> page,
		ModelMap modelMap) {
		try {
			projectDeclarePublicity.setStatus((short) 1);
			projectDeclarePublicity.setOrderByClause("CREATE_TIME DESC");
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectDeclarePublicityBean>) projectDeclarePublicityService.queryByIsOpen(projectDeclarePublicity);
			List<ProjectDeclarePublicityBean> list = new ArrayList<ProjectDeclarePublicityBean>();
			for (ProjectDeclarePublicityBean bean1 : page) {
				if (new BigDecimal(-1).compareTo(bean1.getDeclareId()) != 0) {
					ProjectDeclareInfoBean infoBean = new ProjectDeclareInfoBean();
					infoBean.setDeclareId(bean1.getDeclareId());
					infoBean = projectDeclareInfoService.queryByCond(infoBean).get(0);
					bean1.setDeclareGrade(infoBean.getDeclareGrade());
					bean1.setDeclareStatus(infoBean.getDeclareStatus());
					if (infoBean.getDeclareStatus() == 2) {
						bean1.setEndData("已截止");
					} else if (infoBean.getDeclareStatus() == 0) {
						bean1.setEndData(infoBean.getDeclareRemark());
					}
				}
				list.add(bean1);
			}
			modelMap.addAttribute("value", list);
			modelMap.addAttribute("total", page.getTotal());
			modelMap.addAttribute("pages", page.getPages());
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "接口调用成功!");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "接口调用异常失败！原因：" + e.getMessage());
		}
		return "jsonView";
	}

	/**
	 * 获取截止时间还有7天的，还未上报指标的单位ID
	 * 
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/getTaskOrg")
	public String getTaskOrg(ModelMap modelMap) {
		try {
			// 获取截止时间（7天后）
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			c.setTime(new Date());
			c.add(c.DAY_OF_YEAR, +7);
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			// 查询有未上报指标的单位
			OrgAuditExampleBean exampleBean = new OrgAuditExampleBean();
			exampleBean.setEndTime(format1.parse(sdf.format(c.getTime())));
			exampleBean.setStatus((short) 1);
			exampleBean.setIsReport((short) 0);
			List<OrgAuditExampleBean> exampleList = orgAuditExampleService.queryByCond(exampleBean);
			String orgIds = "";
			String declareTitles = "";
			for (int i = 0; i < exampleList.size(); i++) {
				if (orgIds.indexOf(exampleList.get(i).getOrgId().toString()) == -1) {
					orgIds += "," + exampleList.get(i).getOrgId();
					declareTitles += "_" + projectDeclareInfoService.selectById(exampleList.get(i).getDeclareId()).getDeclareTitle();
				}
			}
			if (StringUtil.checkNotNull(orgIds)) {
				modelMap.addAttribute("orgIds", orgIds.substring(1));
				modelMap.addAttribute("declareTitles", declareTitles.substring(1));
			}
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "接口调用成功!");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "接口调用异常失败！原因：" + e.getMessage());
		}
		return "jsonView";
	}

	/**
	 * 配置海报保存
	 * 
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/posterSave")
	public String posterSave(@ModelAttribute("projectDeclarePosterBean") ProjectDeclarePosterBean projectDeclarePosterBean, ModelMap modelMap) {
		try {
			int i = 0;
			projectDeclarePosterBean.setCreateTime(new Timestamp(new Date().getTime()));
			if (projectDeclarePosterBean.getPosterId() != null) {
				i = projectDeclarePosterService.updateById(projectDeclarePosterBean);
			} else {
				projectDeclarePosterBean.setPosterId(seq.getNextSeqIdToBigDecimal());
				i = projectDeclarePosterService.insert(projectDeclarePosterBean);
			}
			modelMap.addAttribute("value", i);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "接口调用成功!");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "接口调用异常失败！原因：" + e.getMessage());
		}
		return "jsonView";
	}

	/**
	 * 配置海报列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/posterList")
	public String posterList(@ModelAttribute("projectDeclarePosterBean") ProjectDeclarePosterBean projectDeclarePosterBean, Page<ProjectDeclarePosterBean> page, ModelMap modelMap) {
		try {
			if (page != null && page.getPageNum() > 0) {
				PageHelper.startPage(page.getPageNum(), page.getPageSize());
				page = (Page<ProjectDeclarePosterBean>) projectDeclarePosterService.queryByCond(projectDeclarePosterBean);
				modelMap.addAttribute("value", page.getResult());
				modelMap.addAttribute("total", page.getTotal());
				modelMap.addAttribute("pages", page.getPages());
			} else {
				modelMap.addAttribute("value", projectDeclarePosterService.queryByCond(projectDeclarePosterBean));
			}
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取列表成功!");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "接口调用异常失败！原因：" + e.getMessage());
		}
		return "jsonView";
	}

	/**
	 * 配置海报删除
	 * 
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/posterDelete")
	public String posterDelete(@RequestParam("ids") String ids, ModelMap modelMap) {
		try {
			String[] idArr = ids.split(",");
			int i = projectDeclarePosterService.batchDelete(idArr);
			if (i > 0) {
				modelMap.addAttribute("value", i);
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "删除成功!");
			} else {
				modelMap.addAttribute("value", i);
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "删除失败!");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "接口调用异常失败！原因：" + e.getMessage());
		}
		return "jsonView";
	}

	/**
	 * 配置海报详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "/interface/json/projectDeclare/posterView")
	public String posterView(@RequestParam("id") String id, ModelMap modelMap) {
		try {
			ProjectDeclarePosterBean bean = projectDeclarePosterService.selectById(new BigDecimal(id));
			modelMap.addAttribute("value", bean);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "接口调用成功!");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "接口调用异常失败！原因：" + e.getMessage());
		}
		return "jsonView";
	}

	/**
	 * -------------------------------------------------------------------------------------------
	 * 通用方法
	 * -------------------------------------------------------------------------------------------
	 */
	public BigDecimal getOrganizationId() {
		BigDecimal orgId = null;
		try {
			orgId = organizationIdSessionHelper.getOrganizationIdBySessionAttribute();
		} catch (Exception e) {
			orgId = null;
		}
		return orgId;
	}

	public String getRootName() {
		String rootName = null;
		try {
			BigDecimal rootId = organizationIdSessionHelper.getRootIdBySessionAttribute();
			rootName = organizationInfoBeanProxy.selectByPrimaryKey(rootId).getOrganizationName();
		} catch (Exception e) {
		}
		return rootName;
	}
}
