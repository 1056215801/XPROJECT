package com.chinatelecom.jx.zone.management.controller.projectActivity;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

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

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.chinatelecom.jx.zone.account.ban.helper.AccountBanSessionHelper;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityEnterBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityTagBean;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityCommentService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityEnterService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityInfoService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityTagService;
import com.chinatelecom.jx.zone.management.util.MyBeanUtils;
import com.chinatelecom.jx.zone.management.util.ProjectProps;
import com.chinatelecom.jx.zone.management.util.StringUtil;

@Controller
// @RequestMapping(value = "/projectactivityinfo")
public class ProjectActivityInfoController extends BaseController {
	@Autowired
	private IProjectActivityInfoService projectActivityInfoService;
	@Autowired
	private IProjectActivityTagService projectActivityTagService;
	@Autowired
	private IProjectActivityEnterService projectActivityEnterService;
	@Autowired
	private IProjectActivityCommentService projectActivityCommentService;
	@Autowired
	private AccountBanSessionHelper accountBanSessionHelper;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;

	/**
	 * 列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/projectActivityInfo/list")
	public String list(
			@ModelAttribute("projectActivityInfo") ProjectActivityInfoBean projectActivityInfoBean,
			@ModelAttribute("page") Page<ProjectActivityInfoBean> page,
			@RequestParam(value = "searchText", required = false) String searchText,
			Model model, ServletRequest request) {
		try{
			if(StringUtil.checkNotNull(searchText)){
				projectActivityInfoBean.setActivityName(searchText);
			}
			projectActivityInfoBean.setStatusArray(new String[]{"0","1"});
			projectActivityInfoBean.setOrderByClause("CREATE_TIME DESC");
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectActivityInfoBean>) projectActivityInfoService
					.queryByCond(projectActivityInfoBean);
			setPageInfo(page, model, "projectActivityInfo/list");
			model.addAttribute("currentAccount",getCurrentAccountId());
			model.addAttribute("searchText",searchText);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "projectActivityInfo/list";
	}

	/**
	 * 新增
	 * 
	 * @return
	 */
	@RequestMapping(value = "/projectActivityInfo/add")
	public String create(
			Model model, ServletRequest request) {
		List<?> accountInfoList = null;
		try{
			getRequest().getSession().removeAttribute("activityId");
			accountInfoList = selectTestAccount();
			ProjectActivityInfoBean projectActivityInfoBean = new ProjectActivityInfoBean();
			ProjectActivityTagBean projectActivityTagBean = new ProjectActivityTagBean();
			projectActivityTagBean.setKind(201);
			List<ProjectActivityTagBean> tagList = projectActivityTagService.queryByCond(projectActivityTagBean);
			model.addAttribute("tagList",tagList);
			model.addAttribute("projectActivityInfoBean", projectActivityInfoBean);
			model.addAttribute("accountInfoList", accountInfoList);
			model.addAttribute("accountInfoRandom", 
					accountInfoList.get((int)(Math.random()*accountInfoList.size())));
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		
		return "projectActivityInfo/edit";
	}

	/**
	 * 编辑
	 * 
	 * @param activityId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectActivityInfo/edit")
	public String create(
			@RequestParam(value = "activityId") BigDecimal activityId,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			Model model, ServletRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try{
			ProjectActivityInfoBean projectActivityInfo = projectActivityInfoService
					.selectById(activityId);
			projectActivityInfo.setStart(sdf.format(projectActivityInfo.getStartTime()));
			projectActivityInfo.setEnd(sdf.format(projectActivityInfo.getEndTime()));
			List<ProjectActivityTagBean> tagList = projectActivityTagService.queryByCond(null);
			model.addAttribute("tagList",tagList);
			model.addAttribute("projectActivityInfo", projectActivityInfo);
			model.addAttribute("pageNo", pageNo);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		
		return "projectActivityInfo/edit";
	}

	/**
	 * 异步保存活动
	 * code代码 1：发布成功 0：发布失败 -1：程序抛出异常 2:重复发布
	 * @return
	 */
	@RequestMapping(value = "/projectActivity/json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean activitySave(
			@ModelAttribute("projectActivityInfoBean") ProjectActivityInfoBean projectActivityInfoBean,
			@RequestParam(value = "create" ,required = false)String create){
		int rst = 1 ;
		ResultBean resultBean = new ResultBean();
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			if(!StringUtil.checkNotNull(projectActivityInfoBean.getActivityName())){
				projectActivityInfoBean = (ProjectActivityInfoBean)
						getRequest().getSession().getAttribute("projectActivityInfoBean");
			}
			if(projectActivityInfoBean.getActivityId()==null){
				BigDecimal activityId = seq.getNextSeqIdToBigDecimal();
				projectActivityInfoBean.setActivityId(activityId);
				projectActivityInfoBean.setActivityUrl(ProjectProps.getProp("url")+"projectActivity/details/"+activityId);
				projectActivityInfoBean.setStartTime(sdf.parse(projectActivityInfoBean.getStart()));
				projectActivityInfoBean.setEndTime(sdf.parse(projectActivityInfoBean.getEnd()));
				projectActivityInfoBean.setStatus((short)1);
				projectActivityInfoBean.setIsTop((short)0);
				projectActivityInfoBean.setEnterCount(1);
				projectActivityInfoBean.setRemark("");
				if(!StringUtil.checkNotNull(projectActivityInfoBean.getCreateAccount())){
					projectActivityInfoBean.setCreateAccount(getCurrentAccountId());
					projectActivityInfoBean.setCreateUser(getCurrentAccountName());
				}
				projectActivityInfoBean.setSortGrade(100);
				if(StringUtil.checkNotNull(create)){
					projectActivityInfoBean.setCreateTime(new Timestamp(sdf.parse(create).getTime()));
				}else{
					projectActivityInfoBean.setCreateTime(new Timestamp(new Date().getTime()));
				}
				
				projectActivityInfoBean.setQrCode(createQrcode("projectActivity/weixin/detail/"+activityId,null));
				rst = projectActivityInfoService.insert(projectActivityInfoBean);
				
				//添加创建人自动报名
				ProjectActivityEnterBean projectActivityEnterBean = new ProjectActivityEnterBean();
				projectActivityEnterBean.setEnterId(seq.getNextSeqIdToBigDecimal());
				projectActivityEnterBean.setActivityId(projectActivityInfoBean.getActivityId());
				if(StringUtil.checkNotNull(projectActivityInfoBean.getCreateAccount())){
					projectActivityEnterBean.setEnterAccount(projectActivityInfoBean.getCreateAccount());
					projectActivityEnterBean.setEnterUser(projectActivityInfoBean.getCreateUser());
				}else{
					projectActivityEnterBean.setEnterAccount(getCurrentAccountId());
					projectActivityEnterBean.setEnterUser(getCurrentAccountName());
				}
				
				if(StringUtil.checkNotNull(create)){
					projectActivityEnterBean.setEnterTime(new Timestamp(sdf.parse(create).getTime()));
					projectActivityEnterBean.setCreateTime(new Timestamp(sdf.parse(create).getTime()));
				}else{
					projectActivityEnterBean.setEnterTime(new Timestamp(new Date().getTime()));
					projectActivityEnterBean.setCreateTime(new Timestamp(new Date().getTime()));
				}
				
				projectActivityEnterBean.setStatus((short)1);
				projectActivityEnterBean.setRemark("");
				
				
				projectActivityEnterService.insert(projectActivityEnterBean);
			}else{
				ProjectActivityInfoBean record = projectActivityInfoService
						.selectById(projectActivityInfoBean.getActivityId());
				MyBeanUtils.copyProperties(projectActivityInfoBean, record);
				record.setStartTime(sdf.parse(projectActivityInfoBean.getStart()));
				record.setEndTime(sdf.parse(projectActivityInfoBean.getEnd()));
				rst = projectActivityInfoService.updateById(record);
			}
			
			if(rst==1){
				resultBean.setCode(1);
			}else{
				resultBean.setCode(0);
				resultBean.setMsg("发布失败");
			}
			
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			resultBean.setCode(-1);
			resultBean.setMsg("发布失败");
		}
		
		return resultBean;
	}

	/**
	 * 删除操作
	 * 
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectActivityInfo/delete")
	public String delete(
			@RequestParam(value = "id") String id,
			RedirectAttributes redirectAttributes, 
			Model model) {
		try{
			String[] ids = id.split(","); 
			for(int i=0;i<ids.length;i++){
				ProjectActivityInfoBean record = projectActivityInfoService
						.selectById(new BigDecimal(ids[i].toString()));
				record.setStatus((short)-2);
				projectActivityInfoService.updateById(record);
			}
		}catch(Exception ex){
			logger.error(ex.getMessage(),ex);
			return "redirect:/error/404";
		}
		return "redirect:/projectActivityInfo/list";

	}
	
	/**
	 * ================================================================================
	 * 									微信端
	 * ================================================================================
	 */

	
	
	/**
	 * 微信端活动首页     auth/page/mobile/weixin/
	 */
	//原路径：@RequestMapping(value = "/projectActivity/weixin/activityMain")
	@RequestMapping(value = "/auth/page/mobile/weixin/projectActivity/weixin/activityMain")
	public String activityMain( Model model, ServletRequest request) {
		try{
			//获取标签列表
			List<ProjectActivityTagBean> tagList = getProjectActivityTag();
			model.addAttribute("tagList",tagList);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "weixinPage/activity/activityMain";
	}
	

	/**
	 * 微信端我的活动
	 * @param activityId
	 */
	@RequestMapping(value = "/projectActivity/weixin/myActivity")
	public String myActivityMain( Model model, ServletRequest request) {
		try{
			//获取标签列表
			List<ProjectActivityTagBean> tagList = getProjectActivityTag();
			model.addAttribute("tagList",tagList);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "weixinPage/activity/myActivity";
	}
	/**
	 * 微信端我的活动登录跳转
	 * @param activityId
	 */
	@RequestMapping(value = "/projectActivity/weixin/myActivity/add")
	public String myActivityMainLogin( Model model, ServletRequest request) {
		return "redirect:/projectActivity/weixin/myActivity";
	}
	
	/**
	 * 微信端活动详情
	 * @param activityId
	 */
	@RequestMapping(value = "/projectActivity/weixin/detail/{activityId}")
	public String detail(
			@PathVariable(value = "activityId") String activityId,
			Model model, HttpServletRequest request) {
		try{
			
			if(!isMobileDevice(request)){
				return "redirect:/projectActivity/details/"+activityId;
			}
			
			ProjectActivityInfoBean projectActivityInfoBean = projectActivityInfoService
					.selectById(new BigDecimal(activityId));
			if(projectActivityInfoBean==null){
				return "redirect:/error/404";
			}
			if(getCurrentAccountId()==null){
				model.addAttribute("isEnter",false);
			}else{
				ProjectActivityEnterBean projectActivityEnterBean = new ProjectActivityEnterBean();
				projectActivityEnterBean.setActivityId(new BigDecimal(activityId));
				projectActivityEnterBean.setStatus((short)1);
				projectActivityEnterBean.setEnterAccount(getCurrentAccountId());
				//判断当前用户是否报名该活动
				List<ProjectActivityEnterBean> list = projectActivityEnterService
						.queryByCond(projectActivityEnterBean);
				model.addAttribute("isEnter",list.size()==0?false:true);
			}
			model.addAttribute("curAccountId",getCurrentAccountId());
			model.addAttribute("projectActivityInfoBean",projectActivityInfoBean);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		
		return "weixinPage/activity/activityDetails";
	}
	
	/**
	 * 微信端活动详情登录跳转
	 * @param activityId
	 */
	@RequestMapping(value = "/projectActivity/weixin/detail/add/{activityId}")
	public String detailLogin(
			@PathVariable(value = "activityId") String activityId,
			Model model, ServletRequest request) {
		try{
			if(!StringUtil.checkNotNull(activityId)){
				return "redirect:/error/404";
			}
		}catch(Exception ex){
			logger.error("微信端活动详情登录跳转失败，详细信息："+ex.getMessage(),ex);
			return "redirect:/error/404";
		}
		return "redirect:/projectActivity/weixin/detail/"+activityId+"?main=1";
	}
	
	/**
	 * 微信端活动创建
	 */
	@RequestMapping(value = "/projectActivity/weixin/createActivity")
	public String create(@RequestParam(value = "type",required = false) String type,Model model) {
		try{
			List<ProjectActivityTagBean> tagList = getProjectActivityTag();
			ProjectActivityInfoBean projectActivityInfoBean = new ProjectActivityInfoBean();
			if("2".equals(type)){				
				projectActivityInfoBean = (ProjectActivityInfoBean)
						getRequest().getSession().getAttribute("projectActivityInfoBean");
			}else{
				getRequest().getSession().removeAttribute("projectActivityInfoBean");
			}
			getRequest().getSession().removeAttribute("activityId");
			model.addAttribute("tagList",tagList);
			model.addAttribute("projectActivityInfoBean",projectActivityInfoBean);
			model.addAttribute("type",type);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "weixinPage/activity/activityCreate";
	}
	
	/**
	 * 微信端活动预览
	 * @param activityId
	 */
	@RequestMapping(value = "/projectActivity/weixin/activityPreview")
	public String preview(
			@ModelAttribute("projectActivityInfoBean") ProjectActivityInfoBean projectActivityInfoBean,
			Model model) {
		try{
			getRequest().getSession().setAttribute("projectActivityInfoBean", projectActivityInfoBean);
			model.addAttribute("projectActivityInfoBean",projectActivityInfoBean);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "weixinPage/activity/activityPreview";
	}
	
	/**
	 * 获取标签列表
	 * @return
	 */
	private List<ProjectActivityTagBean> getProjectActivityTag(){
		List<ProjectActivityTagBean> list = null;
		try{
			ProjectActivityTagBean projectActivityTagBean = new ProjectActivityTagBean();
			projectActivityTagBean.setKind(201);
			projectActivityTagBean.setOrderByClause("SORT_GRADE ASC");
			list = projectActivityTagService.queryByCond(projectActivityTagBean);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
		return list;
	}
	
	
	/**
	 * 后台运维列表
	 */
	@RequestMapping(value = "/projectActivityInfo/maintain")
	public String maintain(
			@ModelAttribute("projectActivityInfo") ProjectActivityInfoBean projectActivityInfoBean,
			@ModelAttribute("page") Page<ProjectActivityInfoBean> page,Model model){
		List<?> accountInfoList = null;
		
		try{
			accountInfoList = selectTestAccount();
			projectActivityInfoBean.setOrderByClause("CREATE_TIME DESC");
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectActivityInfoBean>) projectActivityInfoService
					.queryByCond(projectActivityInfoBean);
			
			setPageInfo(page, model, "projectActivityInfo/maintain");
			model.addAttribute("accountInfoList",accountInfoList);
			model.addAttribute("accountInfoRandom", 
					accountInfoList.get((int)(Math.random()*accountInfoList.size())));
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		
		return "projectActivityInfo/maintain";
	}
 
}