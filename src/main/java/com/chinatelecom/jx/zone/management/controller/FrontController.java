package com.chinatelecom.jx.zone.management.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.account.bind.bean.AccountBindBean;
import com.chinatelecom.jx.zone.account.bind.service.IAccountBindBeanService;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.company.info.bean.CompanyInfoBean;
import com.chinatelecom.jx.zone.company.info.service.ICompanyInfoBeanService;
import com.chinatelecom.jx.zone.entrance.helper.EntranceIdHelper;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareInfoBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiSourceSearchBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityEnterBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityTagBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareApplyBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclarePublicityBean;
import com.chinatelecom.jx.zone.management.service.expShare.IExpShareInfoService;
import com.chinatelecom.jx.zone.management.service.logisticsInfo.IWanjiLogisticsInfoService;
import com.chinatelecom.jx.zone.management.service.personalCenter.IPersonalCenterService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityEnterService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityInfoService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityTagService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareApplyService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareInfoService;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclarePublicityService;
import com.chinatelecom.jx.zone.management.service.showLogin.IShowLoginService;
import com.chinatelecom.jx.zone.management.service.showProduct.IshowProductService;
import com.chinatelecom.jx.zone.management.service.showSupply.IshowSupplyService;
import com.chinatelecom.jx.zone.management.util.HttpToolkit;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.management.util.StringUtils;
import com.chinatelecom.jx.zone.management.websocket.Msg;
import com.chinatelecom.jx.zone.management.websocket.WSServer;
import com.chinatelecom.jx.zone.organization.info.bean.OrganizationInfoBean;
import com.chinatelecom.jx.zone.organization.info.proxy.IOrganizationInfoBeanProxy;
import com.chinatelecom.jx.zone.organization.info.service.IOrganizationInfoBeanService;
import com.chinatelecom.jx.zone.park.info.bean.ParkInfoBean;
import com.chinatelecom.jx.zone.park.info.service.IParkInfoBeanService;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jfinal.kit.Kv;
import com.jfinal.kit.PathKit;
import com.jfinal.template.Engine;
import com.jfinal.template.Template;

/**
 * 前端页面展示
 * 
 * @author Administrator
 *
 */

@Controller
public class FrontController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);
	@Autowired
	private IProjectDeclareInfoService projectDeclareInfoService;
	@Autowired
	private IProjectActivityInfoService projectActivityInfoService;
	@Autowired
	private IExpShareInfoService expShareInfoService;
	@Autowired
	private IProjectDeclarePublicityService projectDeclarePublicityService;
	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper;
	@Autowired
	private IShowLoginService showLoginService;
	@Autowired
	private EntranceIdHelper entranceIdHelper;
	@Autowired
	private IProjectActivityTagService projectActivityTagService;
	@Autowired
	private IshowProductService showProductService;
	@Autowired
	private IshowSupplyService showSupplyService;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private IWanjiLogisticsInfoService wanjiLogisticsInfoService;
	@Autowired
	private IPersonalCenterService personalCenterService;
	@Autowired
	private IAccountBindBeanService accountBindBeanService;
	@Autowired
	private IOrganizationInfoBeanProxy organizationInfoBeanProxy;
	@Autowired
	private IOrganizationInfoBeanService organizationInfoBeanService;
	@Autowired
	private IProjectDeclareApplyService projectDeclareApplyService;
	@Autowired
	private IProjectActivityEnterService projectActivityEnterService;
	@Autowired
	private ICompanyInfoBeanService companyInfoBeanProxy;
	@Autowired
	private IParkInfoBeanService parkInfoBeanService;

	private Engine engine = Engine.create("yc");

	@PostConstruct
	public void initialize() {
		logger.info("ShowPageController initialized!");
	}

	// 进贤服务平台主页
	@RequestMapping(value = "/homePage/jx")
	public String homePageJx(@ModelAttribute("page") Page<?> page, Model model, HttpServletRequest request) {
		BigDecimal entranceId =  Jinxian_ID;
		try {
			// 工业动态
			ExpShareInfoBean bean0 = new ExpShareInfoBean();
			bean0.setOrderByClause(" create_time DESC");
			bean0.setStatus((short) 1);
			page.setPageNum(1);
			page.setPageSize(3);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ExpShareInfoBean>)  expShareInfoService.queryByCond(bean0);
			model.addAttribute("expShareList", page.getResult());
			
			// 项目申报
			ProjectDeclareInfoBean bean = new ProjectDeclareInfoBean();
			bean.setOrgId(new BigDecimal(-1));
			bean.setDeclareOpen((short) 1);
			bean.setOrderByClause("is_recommend desc,CREATE_TIME DESC");
			bean.setFastQuery((short)1);
			page.setPageNum(1);
			page.setPageSize(3);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectDeclareInfoBean>) projectDeclareInfoService.queryByCondNotPreview(bean);
			model.addAttribute("declareList", page.getResult());
			
			// 活动报名
			ProjectActivityInfoBean bean2 = new ProjectActivityInfoBean();
			bean2.setStatusArray(new String[] { "0", "1" });
			bean2.setOrderByClause("is_top desc, CREATE_TIME DESC");
			bean2.setFastQuery((short)1);
			page.setPageNum(1);
			page.setPageSize(3);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectActivityInfoBean>) projectActivityInfoService.queryByCond(bean2);
			model.addAttribute("activityeList", page.getResult());
			
			// 是否已登录，
			request.getSession().setAttribute("isLogin", isLogin());
			// 入口ID相当于parkId
			request.getSession().setAttribute("entranceId", entranceId);
			entranceIdHelper.setEntranceIdInSession(request, entranceId);
			// 当前环境域名
			request.getSession().setAttribute("urlPath", showLoginService.getUrlPath());
			
			model.addAttribute("projectFun", "1,038"); // 下发项目资金(万元)

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/front/homePage_jx";
	}

	// 宜春市公共服务平台主页
	@RequestMapping(value = "/homePage/yc")
	public String homePage(@ModelAttribute("page") Page<?> page, Model model, HttpServletRequest request) {
		BigDecimal entranceId =  Yichun_ID;//setEnranceID(request);
		try {
			// 工业动态
			ExpShareInfoBean bean0 = new ExpShareInfoBean();
			bean0.setOrderByClause(" create_time DESC");
			bean0.setStatus((short) 1);
			page.setPageNum(1);
			page.setPageSize(3);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ExpShareInfoBean>) expShareInfoService.queryByCond(bean0);
			model.addAttribute("expShareList", page.getResult());
			
			// 项目申报
			ProjectDeclareInfoBean bean = new ProjectDeclareInfoBean();
			if(isLogin()){
				BigDecimal[] arr = new BigDecimal[]{new BigDecimal(360000),new BigDecimal(getCurrentAreaIds()[1].toString())};
				if(this.getAccountType(getRootId())=="province"){//不是省级用户 获取省级和该账号市级下面的所有项目申报 
						bean.setAreaId(new BigDecimal(360000));
					}else{
						bean.setAreaIdArray(arr);
					}
			}else{
				BigDecimal[] arr1 = new BigDecimal[]{new BigDecimal(360000),new BigDecimal(360900)};
				bean.setAreaIdArray(arr1);
			}
			bean.setOrgId(new BigDecimal(-1));
			bean.setDeclareOpen((short) 1);
			bean.setOrderByClause("is_recommend desc,CREATE_TIME DESC");
			bean.setFastQuery((short)1);
			page.setPageNum(1);
			page.setPageSize(3);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectDeclareInfoBean>) projectDeclareInfoService.queryByCondNotPreview(bean);
			model.addAttribute("declareList", page.getResult());
			
			// 活动报名
			ProjectActivityInfoBean bean2 = new ProjectActivityInfoBean();
			bean2.setStatusArray(new String[] { "0", "1" });
			bean2.setOrderByClause("is_top desc, CREATE_TIME DESC");
			bean2.setFastQuery((short)1);
			page.setPageNum(1);
			page.setPageSize(3);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectActivityInfoBean>) projectActivityInfoService.queryByCond(bean2);
			model.addAttribute("activityeList", page.getResult()); 
			
			// 是否已登录，
			request.getSession().setAttribute("isLogin", isLogin());
			// 入口ID相当于parkId
			request.getSession().setAttribute("entranceId", entranceId);
			entranceIdHelper.setEntranceIdInSession(request, entranceId);
			// 当前环境域名
			request.getSession().setAttribute("urlPath", showLoginService.getUrlPath());
			
			model.addAttribute("projectFun", "2.5"); // 下发项目资金(万元)

			// createJsp();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return "/front/homePage_yc";
	}

	// 活动報名详情
	@RequestMapping(value = "/activity/detail/{id}")
	public String activityDetail(@PathVariable(value = "id") BigDecimal id, Model model, HttpServletRequest request) {
		ProjectActivityInfoBean detail = projectActivityInfoService.selectById(id);
		try {
			getUrlPath(request);
			
			if (getCurrentAccountId() == null) {
				model.addAttribute("isEnter", false);
			} else {
				ProjectActivityEnterBean projectActivityEnterBean = new ProjectActivityEnterBean();
				projectActivityEnterBean.setActivityId(id);
				projectActivityEnterBean.setStatus((short) 1);
				projectActivityEnterBean.setEnterAccount(getCurrentAccountId());
				List<ProjectActivityEnterBean> list = projectActivityEnterService.queryByCond(projectActivityEnterBean);
				model.addAttribute("isEnter", list.size() == 0 ? false : true);
			}
			model.addAttribute("detail", detail);
			model.addAttribute("accountId", getCurrentAccountId());
		} catch (Exception e) {
			logger.error("活动報名详情异常：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
		return "/front/ycPage/activityDetail";
	}
	// 活动報名主页
		@RequestMapping(value = "/activity/list")
		public String projectActivity(Model model, HttpServletRequest request) {
			BigDecimal entranceId = setEnranceID(request);
			try {
				getUrlPath(request);
				// 获取标签列表
				List<ProjectActivityTagBean> tagList = getProjectActivityTag();
				ProjectActivityInfoBean projectActivityInfoBean = new ProjectActivityInfoBean();
				projectActivityInfoBean.setStatusArray(new String[] { "0", "1" });
				int activityCount = projectActivityInfoService.queryTotalSize(projectActivityInfoBean);
				projectActivityInfoBean.setStatusArray(new String[] { "1" });
				int activityLiveCount = projectActivityInfoService.queryTotalSize(projectActivityInfoBean);
				model.addAttribute("activityCount", activityCount);
				model.addAttribute("activityLiveCount", activityLiveCount);
				model.addAttribute("tagList", tagList);
				model.addAttribute("entranceId", entranceId);
				model.addAttribute("accountId", getCurrentAccountId());
			} catch (Exception e) {
				logger.error("首页加载失败，" + e.getMessage(), e);
				return "redirect:/error/404";
			}
			return "/front/ycPage/activityList";
		}
	// 活动報名-发布
	@RequestMapping(value = "/activity/add")
	public String activityAdd(@RequestParam(value = "type", required = false) String type, Model model,
			HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		try {
			getUrlPath(request);
			
			List<ProjectActivityTagBean> tagList = getProjectActivityTag();
			ProjectActivityInfoBean projectActivityInfoBean = new ProjectActivityInfoBean();
			if ("2".equals(type)) {
				projectActivityInfoBean = (ProjectActivityInfoBean) getRequest().getSession()
						.getAttribute("projectActivityInfoBean");
			} else {
				getRequest().getSession().removeAttribute("projectActivityInfoBean");
			}
			getRequest().getSession().removeAttribute("activityId");
			model.addAttribute("tagList", tagList);
			model.addAttribute("projectActivityInfoBean", projectActivityInfoBean);
			model.addAttribute("entranceId", entranceId);
		} catch (Exception e) {
			logger.error("活动编辑页面加载失败，" + e.getMessage(), e);
			return "redirect:/error/404";
		}
		return "/front/ycPage/activityAdd";

	}

	// 项目申报详情
	@RequestMapping(value = "/declare/detail/{id}")
	public String declareDetail(@PathVariable(value = "id") BigDecimal id, Model model, HttpServletRequest request) {
		try {
			getUrlPath(request);
			
			BigDecimal entranceId = setEnranceID(request);
			ProjectDeclareInfoBean detail = projectDeclareInfoService.selectById(id);
			model.addAttribute("detail", detail);
			model.addAttribute("accountId", getCurrentAccountId());
			model.addAttribute("entranceId", entranceId);
			//判断用户类型
			if(isLogin()){
				BigDecimal rootId = getRootId();
				model.addAttribute("rootId", rootId);
				if(rootId!=null){
					OrganizationInfoBean rootBean = 	organizationInfoBeanProxy.selectByPrimaryKey(rootId);
					if(rootBean!=null){
						model.addAttribute("rootKind",rootBean.getOrganizationKind());
					}
				}
			}
		} catch (Exception e) {
		}
		return "/front/ycPage/declareDetail";
	}

	// 项目申报-在线申报
	@RequestMapping(value = "/declare/add")
	public String declareAdd(@RequestParam(value = "declareId") BigDecimal declareId, Model model,
			HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		try {
			getUrlPath(request);
			
			// 分享单位列表
			List<OrganizationInfoBean> organizationList = organizationInfoBeanProxy
					.selectFirstGradeListByAccountIdAndRootIdAndSystemIdArrayAndOrganizationNameSearchKey(
							getCurrentAccountId(), null, null, null);
			List<OrganizationInfoBean> newOrganizationList = new ArrayList<OrganizationInfoBean>();
			for (OrganizationInfoBean orgBean : organizationList) {
				OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy
						.selectUnitByOrganizationId(orgBean.getOrganizationId());
				if (organizationInfoBean.getOrganizationKind() == 2 || organizationInfoBean.getOrganizationKind() == 3
						|| organizationInfoBean.getOrganizationKind() == 1) {
					newOrganizationList.add(organizationInfoBean);
				}
			}
			if (newOrganizationList.size() > 0) {
				model.addAttribute("organizationList", newOrganizationList);
			}
			model.addAttribute("declareId", declareId);
			model.addAttribute("entranceId", entranceId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/front/ycPage/declareAdd";

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
	@RequestMapping(value = "/projectDeclare/applySaveToYc")
	public String saveToYc(@ModelAttribute(value = "projectDeclareApply") ProjectDeclareApplyBean projectDeclareApply,
			RedirectAttributes redirectAttributes, Model model, HttpServletRequest request) {

		try {
			getUrlPath(request);
			
			if (projectDeclareApply.getApplyId() == null) {
				OrganizationInfoBean bean = organizationInfoBeanService
						.selectByPrimaryKey(projectDeclareApply.getCompanyId());
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
		return "redirect:/declare/add?declareId=" + projectDeclareApply.getDeclareId();

	}

	// 项目申报主页
	@RequestMapping(value = "/declare/list")
	public String projectDeclare(Model model, HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		try {
			getUrlPath(request);
			
			ProjectDeclareInfoBean bean = new ProjectDeclareInfoBean();
			ProjectDeclarePublicityBean publicity = new ProjectDeclarePublicityBean();
			ProjectDeclareInfoBean bean1 = new ProjectDeclareInfoBean();
			if (getOrganizationId() != null) {
				bean.setOrgId(getOrganizationId());
				publicity.setOrgId(getOrganizationId());
				bean1.setOrgId(getOrganizationId());
			} else if (getOrganizationId() == null) {
				bean.setOrgId(new BigDecimal(-1));
				publicity.setOrgId(new BigDecimal(-1));
				bean1.setOrgId(new BigDecimal(-1));
			}

			bean.setDeclareStatus((short) 0);
			int countApplying = projectDeclareInfoService.countByCondNotPreview(bean);
			bean.setDeclareStatus((short) 2);
			int countPulicity = projectDeclareInfoService.countByCondNotPreview(bean);

			// 热门项目公示
			publicity.setOrderByClause("CREATE_TIME DESC");
			publicity.setStatus((short) 1);
			PageHelper.startPage(1, 5);
			Page<ProjectDeclarePublicityBean> page = (Page<ProjectDeclarePublicityBean>) projectDeclarePublicityService
					.queryByIsOpen(publicity);

			// 热门项目申报
			bean1.setOrderByClause("a.CREATE_TIME DESC");
			PageHelper.startPage(1, 5);
			Page<ProjectDeclareInfoBean> page1 = (Page<ProjectDeclareInfoBean>) projectDeclareInfoService
					.queryByCondNotPreview(bean1);

			model.addAttribute("infoList", page1.getResult());
			model.addAttribute("publicityList", page.getResult());
			model.addAttribute("countApplying", countApplying); // 统计正在申报的项目
			model.addAttribute("countPulicity", countPulicity); // 统计已公示的项目
			model.addAttribute("accountId", getCurrentAccountId());
			model.addAttribute("entranceId", entranceId);
			//判断用户类型
			if(isLogin()){
				BigDecimal rootId = getRootId();
				model.addAttribute("rootId", rootId);
				if(rootId!=null){
					OrganizationInfoBean rootBean = 	organizationInfoBeanProxy.selectByPrimaryKey(rootId);
					if(rootBean!=null){
						model.addAttribute("rootKind",rootBean.getOrganizationKind());
					}
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);

		}
		return "/front/ycPage/declareList";

	}

	// 产品展示详情
	@RequestMapping(value = "/product/detail/{id}")
	public String productDetail(@PathVariable(value = "id") BigDecimal id, Model model, HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		try {
			getUrlPath(request);
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id", id);
			paramMap.put("collectAccountId", getCurrentAccountId());

			Map<String, Object> map = showProductService.productDetail(paramMap);

			if (!map.isEmpty()) {
				model.addAttribute("productInfo", map.get("productInfo"));
				model.addAttribute("companyInfo", map.get("companyInfo"));
				model.addAttribute("imageList", map.get("imageList"));
			}

			Map<String, Object> paramMap2 = new HashMap<>();
			paramMap2.put("relatedId", id);
			paramMap2.put("pageNum", 1);
			paramMap2.put("pageSize", 1000);

			JSONObject jo = showProductService.messageList(paramMap2);
			List<?> messageList = JSON.parseObject(jo.getString("messageList"), List.class);

			model.addAttribute("messageList", messageList);
			model.addAttribute("entranceId", entranceId);

		} catch (Exception e) {
			logger.error("【产业对接】view方法发生异常，详细原因：" + e.getMessage(), e);
		}
		return "/front/ycPage/productDetail";
	}

	// 产品展示-发布
	@RequestMapping(value = "/product/add")
	public String productAdd(Model model, HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		try {
			getUrlPath(request);
			
			model.addAttribute("entranceId", entranceId);
			model.addAttribute("accountId", getCurrentAccountId());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/front/ycPage/productAdd";

	}

	// 产品展示主页
	@RequestMapping(value = "/product/list")
	public String productList(@RequestParam(value = "isComplete", required = false) Boolean isComplete, Model model,
			HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		try {
			getUrlPath(request);
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("collectAccountId", getCurrentAccountId());
			paramMap.put("pageNum", 1);
			paramMap.put("pageSize", 20);

			Map<String, Object> map = showProductService.productIndex(paramMap);

			if (!map.isEmpty()) {
				List<JSONObject> companyList = (List<JSONObject>) map.get("companyList");
				List<JSONObject> compList = new ArrayList<>();
				for(int i=0;i<companyList.size();i++){
					String companyName = companyList.get(i).get("companyName").toString();
					if(!companyName.contains("融合")){
						compList.add(companyList.get(i));
					}
				}
				model.addAttribute("companyList", compList);
				model.addAttribute("pushProductList", map.get("pushProductList"));
				model.addAttribute("industryList", map.get("industryList"));
			}
			model.addAttribute("entranceId", entranceId);
			model.addAttribute("isComplete", isComplete);
			model.addAttribute("accountId", getCurrentAccountId());
		} catch (Exception e) {
			logger.error("【产业对接】main方法发生异常，详细原因：" + e.getMessage(), e);
		}
		return "/front/ycPage/productList";
	}

	// 供需详情
	@RequestMapping(value = "/supply/detail/{id}")
	public String supplyDetail(@PathVariable(value = "id") BigDecimal id, Model model, HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		try {
			getUrlPath(request);
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id", id);
			paramMap.put("collectAccountId", getCurrentAccountId());

			Map<String, Object> map = showSupplyService.supplyDetail(paramMap);

			if (!map.isEmpty()) {
				model.addAttribute("supplyDemand", map.get("supplyDemand"));
				model.addAttribute("imageList", map.get("imageList"));
			}

			Map<String, Object> paramMap2 = new HashMap<>();
			paramMap2.put("relatedId", id);
			paramMap2.put("pageNum", 1);
			paramMap2.put("pageSize", 1000);

			JSONObject jo = showProductService.messageList(paramMap2);
			List<?> messageList = JSON.parseObject(jo.getString("messageList"), List.class);

			model.addAttribute("messageList", messageList);
			model.addAttribute("entranceId", entranceId);

		} catch (Exception e) {
			logger.error("【要素共享】detail方法发生异常，详细原因：" + e.getMessage(), e);
		}
		return "/front/ycPage/supplyDetail";
	}

	// 供需-发布
	@RequestMapping(value = "/supply/add")
	public String supplyAdd(Model model, HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		try {
			getUrlPath(request);
			
			model.addAttribute("entranceId", entranceId);
			model.addAttribute("accountId", getCurrentAccountId());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/front/ycPage/supplyAdd";

	}

	// 供需主页
	@RequestMapping(value = "/supply/list")
	public String supply(@RequestParam(value = "isComplete", required = false) Boolean isComplete, Model model,
			HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("accountId", getCurrentAccountId());
		try {
			getUrlPath(request);
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("collectAccountId", getCurrentAccountId());

			Map<String, Object> map = showSupplyService.supplyIndex(paramMap);

			if (!map.isEmpty()) {
				List<JSONObject> companyList = (List<JSONObject>) map.get("companyList");
				List<JSONObject> compList = new ArrayList<>();
				for(int i=0;i<companyList.size();i++){
					String companyName = companyList.get(i).get("companyName").toString();
					if(!companyName.contains("融合")){
						compList.add(companyList.get(i));
					}
				}
				model.addAttribute("companyList", compList);
				model.addAttribute("pushSypplyList", map.get("pushSypplyList"));
				model.addAttribute("categoryList", map.get("categoryList"));
				model.addAttribute("supplyDemandCount", map.get("supplyDemandCount"));
			}
			model.addAttribute("entranceId", entranceId);
			model.addAttribute("isComplete", isComplete);
		} catch (Exception e) {
			logger.error("【要素共享】main方法发生异常，详细原因：" + e.getMessage(), e);
		}
		return "/front/ycPage/supplyList";
	}

	// 工业动态-发布
	@RequestMapping(value = "/experience/add")
	public String experienceAdd(Model model, HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		try {
			getUrlPath(request);
			
			// 标签列表
			List<ProjectActivityTagBean> tagList = getTags();
			// 分享单位列表
			List<OrganizationInfoBean> organizationList = organizationInfoBeanProxy
					.selectFirstGradeListByAccountIdAndRootIdAndSystemIdArrayAndOrganizationNameSearchKey(
							getCurrentAccountId(), null, null, null);
			List<OrganizationInfoBean> newOrganizationList = new ArrayList<OrganizationInfoBean>();
			for (OrganizationInfoBean bean : organizationList) {
				OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy
						.selectUnitByOrganizationId(bean.getOrganizationId());
				if (organizationInfoBean.getOrganizationKind() == 2 || organizationInfoBean.getOrganizationKind() == 3
						|| organizationInfoBean.getOrganizationKind() == 1) {
					newOrganizationList.add(organizationInfoBean);
				}

			}

			if (newOrganizationList.size() > 0) {
				model.addAttribute("organizationList", newOrganizationList);
			}
			model.addAttribute("tagList", tagList);
			model.addAttribute("expShareInfo", new ExpShareInfoBean());

			model.addAttribute("entranceId", entranceId);
			model.addAttribute("accountId", getCurrentAccountId());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/front/ycPage/expAdd";

	}

	/**
	 * 编辑
	 * 
	 * @param expId
	 * @param pageNum
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/experience/edit")
	public String create(@RequestParam(value = "expId") BigDecimal expId,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model, HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		try {
			getUrlPath(request);
			
			ExpShareInfoBean expShareInfo = expShareInfoService.selectById(expId);
			// 标签列表
			List<ProjectActivityTagBean> tagList = getTags();

			// 分享单位列表
			List<OrganizationInfoBean> organizationList = organizationInfoBeanProxy
					.selectFirstGradeListByAccountIdAndRootIdAndSystemIdArrayAndOrganizationNameSearchKey(
							getCurrentAccountId(), null, null, null);
			List<OrganizationInfoBean> newOrganizationList = new ArrayList<OrganizationInfoBean>();
			for (OrganizationInfoBean bean : organizationList) {
				OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy
						.selectUnitByOrganizationId(bean.getOrganizationId());
				if (organizationInfoBean.getOrganizationKind() == 2 || organizationInfoBean.getOrganizationKind() == 3
						|| organizationInfoBean.getOrganizationKind() == 1) {
					newOrganizationList.add(organizationInfoBean);
				}

			}
			if (newOrganizationList.size() > 0) {
				model.addAttribute("organizationList", newOrganizationList);
			}

			model.addAttribute("tagList", tagList);
			model.addAttribute("expShareInfo", expShareInfo);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return "redirect:/error/404";
		}
		return "/front/ycPage/expAdd";
	}

	// 工业动态详情【经验分享】
	@RequestMapping(value = "/experience/detail/{id}")
	public String experienceDetail(@PathVariable(value = "id") BigDecimal id, Model model, HttpServletRequest request) {
		try{
			getUrlPath(request);
			
			BigDecimal entranceId = setEnranceID(request);
			ExpShareInfoBean detail = expShareInfoService.selectById(id);
			// 增加浏览量总数
			Integer count = Integer.parseInt(detail.getBrowseCount()) + 1;
			detail.setBrowseCount(count.toString());
			Integer count2 = Integer.parseInt(detail.getBrowseCountEdit()) + 1;
			detail.setBrowseCountEdit(count2.toString());
			expShareInfoService.updateById(detail);
			model.addAttribute("detail", detail);
			model.addAttribute("entranceId", entranceId);
		}catch (Exception e) {
			logger.error(e.getMessage(), e);
			return "redirect:/error/404";
		}
		
		return "/front/ycPage/expDetail";
	}

	// 工业动态首页【经验分享】
	@RequestMapping(value = "/experience/list")
	public String experience(Model model, HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		String expLabel = request.getParameter("expLabel");
		try {
			getUrlPath(request);
			
			ExpShareInfoBean expShareInfo = new ExpShareInfoBean();
			// 热门 动态
			expShareInfo.setOrderByClause("BROWSE_COUNT DESC");
			expShareInfo.setStatus((short) 1);
			PageHelper.startPage(1, 5);
			Page<ExpShareInfoBean> page = (Page<ExpShareInfoBean>) expShareInfoService.queryByCond(expShareInfo);
			model.addAttribute("infoList", page.getResult());
			model.addAttribute("labelList", getTags()); // 标签列表
			model.addAttribute("accountId", getCurrentAccountId());
			model.addAttribute("entranceId", entranceId);
			model.addAttribute("expLabel", expLabel);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return "redirect:/error/404";
		}

		return "/front/ycPage/expList";
	}

	// 工业动态-预览
	@RequestMapping(value = "/experience/preview")
	public String experiencePreview(@RequestParam(value = "expId", required = false) BigDecimal expId, Model model,
			HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		try {
			getUrlPath(request);
			
			ExpShareInfoBean expShareInfo = expShareInfoService.selectById(expId);
			model.addAttribute("expShareInfo", expShareInfo);
			model.addAttribute("entranceId", entranceId);
			model.addAttribute("accountId", getCurrentAccountId());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/front/ycPage/expPreview";

	}

	// 产业动态详情
	@RequestMapping(value = "/industry/detail/{id}")
	public String industryDetail(@PathVariable(value = "id") BigDecimal id, Model model, HttpServletRequest request) {
		getUrlPath(request);
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("entranceId", entranceId);
		model.addAttribute("id", id);
		return "/front/ycPage/industryDetail";
	}

	// 产业动态主页
	@RequestMapping(value = "/industry/list")
	public String industryList(Model model, HttpServletRequest request) {
		getUrlPath(request);
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("entranceId", entranceId);
		return "/front/ycPage/industryList";
	}

	public BigDecimal getOrganizationId() {
		BigDecimal orgId = null;
		try {
			orgId = organizationIdSessionHelper.getOrganizationIdBySessionAttribute();
		} catch (Exception e) {
			orgId = null;
		}
		return orgId;
	}

	// 帮你问问详情
	@RequestMapping(value = "/helpAsk/detail/{id}")
	public String helpAskDetail(@PathVariable(value = "id") BigDecimal id, Model model, HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("entranceId", entranceId);
		model.addAttribute("id", id);
		model.addAttribute("accountId", getCurrentAccountId());
		model.addAttribute("accountName", getCurrentAccountId() == null ? "" : getCurrentAccountName());
		try {
			getUrlPath(request);
			if (isLogin()) {
				model.addAttribute("parkName", getCurrentParkName());
			} else {
				model.addAttribute("parkName", "");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/front/helpAsk/detail";
	}

	// 帮你问问发布
	@RequestMapping(value = "/helpAsk/add")
	public String helpAskAdd(Model model, HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		try {
			getUrlPath(request);
			model.addAttribute("entranceId", entranceId);
			model.addAttribute("accountId", getCurrentAccountId());
			model.addAttribute("parkName", getCurrentParkName());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/front/helpAsk/add";

	}

	// 帮你问问主页
	@RequestMapping(value = "/helpAsk/allList")
	public String helpAskList(Model model, HttpServletRequest request) {
		getUrlPath(request);
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("accountId", getCurrentAccountId());
		model.addAttribute("entranceId", entranceId);
		return "/front/helpAsk/allList";
	}

	// 帮你问问=回复
	@RequestMapping(value = "/helpAsk/reply/{id}")
	public String helpAskmyList(@PathVariable(value = "id") BigDecimal id, Model model, HttpServletRequest request) {
		getUrlPath(request);
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("entranceId", entranceId);
		model.addAttribute("id", id);
		return "/front/helpAsk/myList";
	}

	// 专家详情
	@RequestMapping(value = "/expert/detail/{id}")
	public String expertDetail(@PathVariable(value = "id") BigDecimal id, Model model, HttpServletRequest request) {
		getUrlPath(request);
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("entranceId", entranceId);
		model.addAttribute("id", id);
		model.addAttribute("accountId", getCurrentAccountId());
		return "/front/ycPage/expertDetail";
	}

	// 专家列表
	@RequestMapping(value = "/expert/list")
	public String expertList(Model model, HttpServletRequest request) {
		getUrlPath(request);
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("entranceId", entranceId);

		return "/front/ycPage/expertList";
	}

	// 科研机构详情
	@RequestMapping(value = "/science/detail/{id}")
	public String scienceDetail(@PathVariable(value = "id") BigDecimal id, Model model, HttpServletRequest request) {
		getUrlPath(request);
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("entranceId", entranceId);
		model.addAttribute("id", id);
		return "/front/ycPage/scienceList";
	}

	// 科研机构列表
	@RequestMapping(value = "/science/list")
	public String scienceList(Model model, HttpServletRequest request) {
		getUrlPath(request);
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("entranceId", entranceId);
		return "/front/ycPage/scienceList";
	}
	// 金融服务
	@RequestMapping(value = "/jrService/list")
		public String jrService(Model model, HttpServletRequest request) {
			getUrlPath(request);
			BigDecimal entranceId = setEnranceID(request);
			model.addAttribute("entranceId", entranceId);
			return "/front/ycPage/jrService";
		}

	// 机构编辑新增
	@RequestMapping(value = "/organ/edit")
	public String organAdd(BigDecimal id, Model model, HttpServletRequest request) throws Exception {
		getUrlPath(request);
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("entranceId", entranceId);
		model.addAttribute("id", id);
		BigDecimal companyId = getCompanyId();
		if (id == null && companyId != null) {
			CompanyInfoBean b = companyInfoBeanProxy.selectByPrimaryKey(companyId);
			model.addAttribute("companyId", b.getCompanyId());
			model.addAttribute("companyName", b.getCompanyName());
			model.addAttribute("areaId", b.getAreaId());
			model.addAttribute("areaName", b.getAreaName());
			model.addAttribute("spaceId", b.getSpaceId());
			model.addAttribute("spaceName", b.getSpaceName());
			model.addAttribute("provinceId", b.getProvinceId());
			model.addAttribute("provinceName", b.getProvinceName());

		} else if (id != null) {
			String u = (String) request.getSession().getAttribute("urlPath");
			String url = u + "XOffice/interface/json/serviceInstitutionInfo/view";
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id", id);
			String rst = HttpToolkit.POSTMethod(url, paramMap);
			JSONObject jsonObject = JSONObject.parseObject(rst);
			JSONObject obj = JSON.parseObject(jsonObject.getString("value"));

			String url1 = u + "XOffice/interface/json/serviceKindInfo/list";
			Map<String, Object> paramMap1 = new HashMap<String, Object>();
			paramMap1.put("parkId", "");
			String rst1 = HttpToolkit.POSTMethod(url1, paramMap1);

			JSONObject jsonObject1 = JSONObject.parseObject(rst1);
			List list = JSON.parseObject(jsonObject1.getString("value"), List.class);

			model.addAttribute("companyName", obj.get("institutionName"));
			/*
			 * model.addAttribute("areaId", obj.get("areaId"));
			 * model.addAttribute("areaName", obj.get("areaName"));
			 * model.addAttribute("provinceId", obj.get("provinceId"));
			 * model.addAttribute("provinceName", obj.get("provinceName"));
			 * model.addAttribute("spaceId", obj.get("spaceId"));
			 * model.addAttribute("spaceName", obj.get("spaceName"));
			 */
			model.addAttribute("serviceBean", obj);
			model.addAttribute("kindList", list);
			model.addAttribute("id", id);

		}
		model.addAttribute("isLogin", isLogin());
		if (this.isLogin()) {
			model.addAttribute("accountId", getCurrentAccountId());
			model.addAttribute("accountName", this.getCurrentAccountName());
			model.addAttribute("parkId", this.getCurrentParkId());
			model.addAttribute("parkName", this.getCurrentParkName());
			model.addAttribute("rootId", this.getRootId());
			model.addAttribute("rootName", this.getRootName());
			model.addAttribute("organizationId", this.getOrganizationId());

		}
		return "/front/ycPage/organEdit";
	}

	// 机构详情
	@RequestMapping(value = "/organ/detail/{id}")
	public String organDetail(@PathVariable(value = "id") BigDecimal id, Model model, HttpServletRequest request) {
		getUrlPath(request);
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("entranceId", entranceId);
		model.addAttribute("id", id);
		return "/front/ycPage/organDetail";
	}

	// 机构列表
	@RequestMapping(value = "/organ/list")
	public String organList(Model model, HttpServletRequest request) throws Exception {
		getUrlPath(request);
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("entranceId", entranceId);
		model.addAttribute("isLogin", isLogin());
		if (this.isLogin()) {
			model.addAttribute("accountId", getCurrentAccountId());
			model.addAttribute("parkId", this.getCurrentParkId());
			model.addAttribute("organizationType", this.getOrganizationType());
			boolean isComplete = showLoginService.isComplete(getCurrentAccountId());
			model.addAttribute("isComplete", isComplete);
		}
		OrganizationInfoBean b = getAreaBean(entranceId);
		model.addAttribute("areaBean", b);
		return "/front/ycPage/organList";
	}

	private BigDecimal setEnranceID(HttpServletRequest request) {
		String eId = request.getParameter("entranceId"); 
		String u = (String) request.getSession().getAttribute("urlPath");
		if (!StringUtil.checkNotNull(u)) {
			request.getSession().setAttribute("urlPath", showLoginService.getUrlPath());
		}
		BigDecimal entranceId = null;
		try {
			if (StringUtil.checkNotNull(eId)) {
				entranceId = new BigDecimal(eId);// 宜春市下面单位ID转换成宜春ID
				entranceId = getYcEntranceIDWithParkId(entranceId);
			} else {
				entranceId = Yichun_ID; // 默认宜春工信委
			}
		} catch (Exception e) {
			entranceId = Yichun_ID; // 默认宜春工信委
		}
		request.getSession().setAttribute("entranceId", entranceId);
		return entranceId;
	}

	/**
	 * 获取标签列表
	 * 
	 * @return
	 */
	private List<ProjectActivityTagBean> getProjectActivityTag() {
		List<ProjectActivityTagBean> list = null;
		try {
			ProjectActivityTagBean projectActivityTagBean = new ProjectActivityTagBean();
			projectActivityTagBean.setStatus((short) 1);
			projectActivityTagBean.setKind(201);
			projectActivityTagBean.setOrderByClause("SORT_GRADE ASC");
			list = projectActivityTagService.queryByCond(projectActivityTagBean);
		} catch (Exception e) {
			logger.error("获取活动标签列表失败，" + e.getMessage(), e);
		}
		return list;
	}

	/**
	 * 获取标签列表
	 * 
	 * @return
	 */
	private List<ProjectActivityTagBean> getTags() {
		List<ProjectActivityTagBean> list = null;
		try {
			ProjectActivityTagBean projectActivityTagBean = new ProjectActivityTagBean();
			projectActivityTagBean.setStatus((short) 1);
			projectActivityTagBean.setKind(202);
			projectActivityTagBean.setOrderByClause("SORT_GRADE ASC");
			list = projectActivityTagService.queryByCond(projectActivityTagBean);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return list;
	}

	// 通用列表 type为类型 1=对接月报，2=招聘月报 ,3=工业招聘
	@RequestMapping(value = "/yc/list")
	public String yclist(Model model, HttpServletRequest request) {
		getUrlPath(request);
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("entranceId", entranceId);
		String type = request.getParameter("type");
		if (StringUtil.checkNotNull(type))
			return "/front/ycPage/list" + type;
		else
			return "/front/ycPage/list";
	}

	// 通用详情 type为类型 1=对接月报，2=招聘月报 3=工业招聘
	@RequestMapping(value = "/yc/detail")
	public String ycdetail(Model model, HttpServletRequest request) {
		getUrlPath(request);
		BigDecimal entranceId = setEnranceID(request);
		String type = request.getParameter("type");
		String id = request.getParameter("id");
		String time = request.getParameter("time");
		model.addAttribute("entranceId", entranceId);
		model.addAttribute("type", type);
		model.addAttribute("id", id);
		model.addAttribute("time", time);
		if (StringUtil.checkNotNull(type))
			return "/front/ycPage/detail" + type;
		else
			return "/front/ycPage/detail";
	}

	// 物流列表
	@RequestMapping(value = "/logistics/list")
	public String logisticslist(Model model, HttpServletRequest request) {
		setEnranceID(request);
		try {
			getUrlPath(request);
			BigDecimal[] paramId = getId();
			BigDecimal entranceId = setEnranceID(request);

			// 万佶搜车字典
			Map<String, List<?>> result = wanjiLogisticsInfoService.getPlatCarDict(paramId);

			model.addAttribute("CarTypeDictsList", result.get("CarTypeDictsList"));
			model.addAttribute("CarLoadDictsList", result.get("CarLoadDictsList"));
			model.addAttribute("entranceId", entranceId);
			model.addAttribute("wanjiSourceSearchBean", new WanjiSourceSearchBean());
			model.addAttribute("accountId", getCurrentAccountId());
		} catch (Exception ex) {
			logger.error("详细原因：" + ex.getMessage(), ex);
		}
		return "/front/ycPage/logisticsList";
	}

	// 物流详情
	@RequestMapping(value = "/logistics/detail")
	public String logisticsdetail(@RequestParam(value = "info") String info, Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("entranceId", entranceId);
		model.addAttribute("id", id);
		setEnranceID(request);
		try {
			getUrlPath(request);
			String xReq = request.getHeader("x-requested-with");
			if (request.getHeader("x-requested-with") != null && "XMLHttpRequest".equalsIgnoreCase(xReq)) {
				return "redirect:/error/404";
			} else {
				info = xssFilter(info);
				info = sqlFilter(info);
				model.addAttribute("info", StringEscapeUtils.unescapeHtml4(info));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			logger.error("详细原因：" + ex.getMessage(), ex);
		}
		return "/front/ycPage/logisticsDetail";

	}

	/**
	 * 发布货源
	 * 
	 * @return
	 */
	@RequestMapping(value = "/logistics/add")
	public String publish(@RequestParam(value = "type", defaultValue = "1") Integer type, Model model,
			HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		model.addAttribute("entranceId", entranceId);
		try {
			getUrlPath(request);
			// 获取万佶数据字典
			Map<String, List<?>> wanjiDict = wanjiLogisticsInfoService.getInitCargo(getId());

			// 登录个人信息
			AccountInfoBean accountInfoBean = accountInfoBeanProxy.selectByPrimaryKey(getCurrentAccountId());

			model.addAttribute("wanjiDict", wanjiDict);
			model.addAttribute("type", type);
			model.addAttribute("accountName", accountInfoBean.getAccountName());
			model.addAttribute("accountCode", accountInfoBean.getAccountCode());

		} catch (Exception ex) {
			ex.printStackTrace();
			logger.error("详细原因：" + ex.getMessage(), ex);
		}
		return "/front/ycPage/logisticsAdd";
	}

	// 取企业id，没有则给公共id
	private BigDecimal[] getId() {
		BigDecimal[] paramId = null;
		BigDecimal accountId = getCurrentAccountId();
		if (accountId != null) {
			BigDecimal companyId = getCompanyId();
			if (companyId == null) {
				CompanyInfoBean info = personalCenterService.selectDefaultCompanyForVisitor(getCurrentAccountId());

				List<AccountBindBean> list = accountBindBeanService.selectListByAccountIdAndSystemIdAndOpenIdSearchKey(
						getCurrentAccountId(), new BigDecimal(1001), null);
				if (info == null && list.isEmpty()) {
					paramId = new BigDecimal[] { new BigDecimal("2016062216360980800018"), new BigDecimal("120") };
				} else {
					if (info != null) {
						paramId = new BigDecimal[] { accountId, info.getCompanyId() };
					} else {
						paramId = new BigDecimal[] { accountId,
								organizationIdSessionHelper.getRootIdBySessionAttribute() };
					}
				}
			} else {
				paramId = new BigDecimal[] { accountId, companyId };
			}

		} else {
			paramId = new BigDecimal[] { new BigDecimal("2016062216360980800018"), new BigDecimal("120") };
		}
		return paramId;
	}

	private String createJsp() {
		long a = System.currentTimeMillis();
		try {
			engine.setDevMode(true);
			engine.setBaseTemplatePath(PathKit.getWebRootPath());
			Template t = engine.getTemplate("WEB-INF/template/yc.jsp");
			String s = t.renderToString(Kv.by("name", "中国心"));
			// System.out.println("=========s========="+s);
			File file = new File(PathKit.getWebRootPath() + "/WEB-INF/views/aCreateJsp.jsp");
			BufferedWriter output = new BufferedWriter(new FileWriter(file));
			Map<String, String> map = new HashMap<String, String>();
			map.put("name", "他的故事");
			map.put("age", "22");
			t.render(map, output);
		} catch (Exception ee) {
			ee.printStackTrace();
		}
		long b = System.currentTimeMillis() - a;
		System.out.println("=========模板时间=========" + b);
		return "";
	}

	/**
	 * XSS 非法字符过滤 内容以<!--HTML-->开头的用以下规则（保留标签，去掉js脚本）：
	 * 1、<\s*(script|link|style|iframe)\s([\s\S]+?)<\/\s*\1\s*>
	 * 2、\s*on[a-z]+\s*=\s*("[^"]+"|'[^']+'|[^\s]+)\s*(?=>)
	 * 3、\s*(href|src)\s*=\s*("\s*(javascript|vbscript):[^"]+"|'\s*(javascript|vbscript):[^']+'|(javascript|vbscript):[^\s]+)\s*(?=>)
	 * 4、epression\((.|\n)*\);? 其它情况下：进行HTML4编码
	 * 
	 * @author ThinkGem
	 */
	private static Pattern p1 = Pattern.compile("<\\s*(script|link|style|iframe)\\s([\\s\\S]+?)<\\/\\s*\\1\\s*>",
			Pattern.CASE_INSENSITIVE);
	private static Pattern p2 = Pattern.compile("\\s*on[a-z]+\\s*=\\s*(\"[^\"]+\"|'[^']+'|[^\\s]+)\\s*(?=>)",
			Pattern.CASE_INSENSITIVE);
	private static Pattern p3 = Pattern.compile(
			"\\s*(href|src)\\s*=\\s*(\"\\s*(javascript|vbscript):[^\"]+\"|'\\s*(javascript|vbscript):[^']+'|(javascript|vbscript):[^\\s]+)\\s*(?=>)",
			Pattern.CASE_INSENSITIVE);
	private static Pattern p4 = Pattern.compile("epression\\((.|\n)*\\);?", Pattern.CASE_INSENSITIVE);

	public static String xssFilter(String text) {
		if (text != null) {
			String oriValue = StringUtils.trim(text), value = oriValue;

			value = p1.matcher(value).replaceAll("");
			value = p2.matcher(value).replaceAll("");
			value = p3.matcher(value).replaceAll("");
			value = p4.matcher(value).replaceAll("");
			// 如果开始不是HTML，XML，JOSN格式，则再进行HTML的 "、<、> 转码。
			if (!StringUtils.startsWithIgnoreCase(value, "<!--HTML-->") // HTML
					&& !StringUtils.startsWithIgnoreCase(value, "<?xml ") // XML
					&& !StringUtils.contains(value, "id=\"FormHtml\"") // JFlow
					&& !(StringUtils.startsWith(value, "{") && StringUtils.endsWith(value, "}")) // JSON
																									// Object
					&& !(StringUtils.startsWith(value, "[") && StringUtils.endsWith(value, "]")) // JSON
																									// Array
			) {
				value = value.replaceAll("\"", "&quot;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");
			}
			return value;
		}
		return null;
	}

	// 预编译SQL过滤正则表达式
	private static Pattern p5 = Pattern.compile(
			"(?:')|(?:--)|(/\\*(?:.|[\\n\\r])*?\\*/)|(\\b(select|update|and|or|delete|insert|trancate|char|into|substr|ascii|declare|exec|count|master|into|drop|execute)\\b)",
			Pattern.CASE_INSENSITIVE);

	/**
	 * SQL过滤，防止注入，传入参数输入有select相关代码，替换空。
	 * 
	 * @author ThinkGem
	 */
	public static String sqlFilter(String text) {
		if (text != null) {
			String value = p5.matcher(text).replaceAll("");
			return value;
		}
		return null;
	}

	/**
	 * 宜春市下各县工信委获取市工信委id（临时使用）转换成宜春市ID
	 * 
	 * @param parkId
	 * @return
	 */
	public BigDecimal getYcEntranceIDWithParkId(BigDecimal parkId) {
		// 袁州区工信委 丰城市工信委 高安市工信委 樟树市工信委 奉新县工信委 万载县工信委 上高县工信委 宜丰县工信委 靖安县工信委 铜鼓县工信委
		// 宜春经开区
		// 3609029 3609819 3609839 3609829 3609219 3609229 3609239 3609249
		// 3609259 3609269 52817399

		List<BigDecimal> idList = Arrays.asList(new BigDecimal(3609819), new BigDecimal(3609219),
				new BigDecimal(3609839), new BigDecimal(3609259), new BigDecimal(3609239), new BigDecimal(3609269),
				new BigDecimal(3609229), new BigDecimal(3609249), new BigDecimal(3609029), new BigDecimal(3609829),
				new BigDecimal(52817399));
		BigDecimal rst = parkId;
		if (idList.contains(rst)) {
			rst = Yichun_ID;
		}
		return rst;
	}

	@RequestMapping(value = "/session/getArea", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean getArea(@RequestParam(value = "parentId") BigDecimal parentId) {
		ResultBean resultBean = new ResultBean();
		try {
			resultBean = personalCenterService.selectAreaInfo(parentId);
		} catch (Exception ex) {
			logger.error("获取地址信息失败，详细原因：" + ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("地址获取失败！");
			ex.printStackTrace();
		}
		return resultBean;
	}
	
	// 企业上云
	@RequestMapping(value = "/cloud/list")
	public String cloudPage(Model model, HttpServletRequest request) {
		BigDecimal entranceId = setEnranceID(request);
		try {
			getUrlPath(request);
			model.addAttribute("entranceId", entranceId);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "/front/ycPage/cloudList";

	}
	// 企业上云申请单编辑/查看
		@RequestMapping(value = "/cloud/Edit")
		public String cloudEidtPage(Model model, HttpServletRequest request) {
			BigDecimal entranceId = setEnranceID(request);
			try {
				getUrlPath(request);
				model.addAttribute("entranceId", entranceId);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
			return "/front/ycPage/cloudListEdit";

		}
	
	

	/**
	 * 获取赛往云地址
	 * 
	 * @param parentId
	 * @return
	 */

	@RequestMapping(value = "/session/getSWYUrl")
	public String getSWYUrl(ModelMap modelMap, HttpServletRequest request) {
		boolean b = false;
		BigDecimal accountId = null;
		BigDecimal companyId = null;
		Map<String, Object> map = new HashMap<String, Object>();
		String result = "";
		try {
			getUrlPath(request);
			b = this.isLogin();
			if (b) {
				accountId = this.getCurrentAccountId();
				companyId = this.getCompanyId();
			}
			map.put("accountId", accountId);
			map.put("companyId", companyId);
			map.put("isLogin", b);
			String url = showLoginService.getUrlPath() + "XOffice/interface/json/getSSOLoginUrl";
			result = HttpToolkit.POSTMethod(url, map);
			JSONObject jo = new JSONObject();
			if (StringUtil.checkNotNull(result)) {
				jo = JSON.parseObject(result);
			}
			modelMap.addAttribute("success", jo.get("success"));
			modelMap.addAttribute("errorCode", jo.get("errorCode"));
			modelMap.addAttribute("errorMsg", jo.get("errorMsg"));
			modelMap.addAttribute("SSOUrl", jo.get("SSOUrl"));
		} catch (Exception ex) {
			logger.error("获取赛往云地址失败，详细原因：" + ex.getMessage(), ex);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常，获取登录地址失败！");
		}
		return "jsonView";
	}

	
	/**
	 * 发送websocket消息到客户端浏览器
	 * 参数：type= 接口名称【必填】 msg= 通知消息内容 parkId= 园区Id 
	 * 		帮扶动态:companyAppealNews   
	 *      供需 ：showSupplyDemandSave
	 *      用工 ：recruitInfoSave
	 *  
	 */
	
	@RequestMapping(value = "/session/sendMsgToClient", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JSONObject sendMsg(Model model, HttpServletRequest request) {
		JSONObject jo = new JSONObject();
		jo.put("success", false);
		try {
			String type = request.getParameter("type");
			String parkId = request.getParameter("parkId");
			String m = request.getParameter("msg");
			//System.out.println("======content======"+content); 
			//System.out.println("======from======"+from);     
			if (StringUtil.checkNotNull(type)) {
					Msg msg = new Msg();
					msg.setData(m);
					msg.setParkId( parkId);
					msg.setType( type );
					if(StringUtil.checkNotNull(parkId)) {
						ParkInfoBean b=parkInfoBeanService.selectByPrimaryKey(new BigDecimal(parkId));
						if(b!=null && b.getAreaName().equals("宜春市")){
							msg.setRemark(b.getSpaceId().toPlainString()); //县区ID  
						}
					}
			 	WSServer.pushBySys(msg);
			 	jo.put("success", true);
			 	jo.put("msg", "通知成功");
			}else{
				jo.put("msg", "参数不可为空");
			}
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			e.printStackTrace();
			jo.put("msg", "出现异常："+e.getLocalizedMessage());
		}
		return jo;
	}
	
	/**
	 * 获取园区所在区域
	 * 参数：园区ID
	 * @param request 
	 * @return
	 */
	
	@RequestMapping(value = "/session/findParkArea", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String,Object> findParkArea(Model model, HttpServletRequest request) {
		Map<String,Object> jo = new HashMap<String,Object>();
		jo.put("success", false);
		try {
			String parkId = request.getParameter("parkId");
			//String from = request.getParameter("from");
			//System.out.println("======content======"+content);
			// System.out.println("======from======"+from);
			if (StringUtil.checkNotNull(parkId)) {
				ParkInfoBean b=parkInfoBeanService.selectByPrimaryKey(new BigDecimal(parkId));
				if(b!=null){
					jo.put("provinceName", b.getProvinceName()); //省
					jo.put("cityName", b.getAreaName()); //市
					jo.put("countyName", b.getSpaceName());//县
					
				 	jo.put("msg", "查询成功");
				 	jo.put("success", true);
				}else{
					jo.put("msg", "无数据");
				}
			}else{
				jo.put("msg", "参数不可为空");
			}
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			e.printStackTrace();
			jo.put("msg", "出现异常："+e.getLocalizedMessage());
		}
		return jo;
	}
	
	
	/**
	 * 设置urlPath entranceId
	 * @param request
	 */
	private void getUrlPath(HttpServletRequest request){
		try{
			if(request.getSession()!=null){
				// 当前环境域名
				Object urlPath = request.getSession().getAttribute("urlPath");
				if(urlPath==null){				
					request.getSession().setAttribute("urlPath", showLoginService.getUrlPath());
				}
				
				Object entranceId = request.getSession().getAttribute("entranceId");
				if(entranceId==null){
					entranceId = request.getParameter("entranceId");
					request.getSession().setAttribute("entranceId", entranceId);
				}else{
					Object entranceId2 = request.getParameter("entranceId"); 
					if(entranceId2!=null&&entranceId.toString().compareTo(entranceId2.toString())!=0){
						request.getSession().setAttribute("entranceId", entranceId2);
					}
				}
			}
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
		}
	}
}
