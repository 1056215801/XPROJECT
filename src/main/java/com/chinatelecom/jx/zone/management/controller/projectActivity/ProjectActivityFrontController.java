package com.chinatelecom.jx.zone.management.controller.projectActivity;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.util.HtmlUtils;

import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.account.msg.bean.AccountMsgBean;
import com.chinatelecom.jx.zone.account.msg.service.IAccountMsgBeanService;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityCommentBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityComplainBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityEnterBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityTagBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.expShare.IExpShareInfoService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityCommentService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityComplainService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityEnterService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityInfoService;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityTagService;
import com.chinatelecom.jx.zone.management.util.MyBeanUtils;
import com.chinatelecom.jx.zone.management.util.ProjectProps;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * 活动前台页面跳转
 * @author MR_WU
 *
 */

@Controller
public class ProjectActivityFrontController extends BaseController{
	
	@Autowired
	private IProjectActivityTagService projectActivityTagService;
	@Autowired
	private IProjectActivityInfoService projectActivityInfoService;
	@Autowired
	private IProjectActivityEnterService projectActivityEnterService;
	@Autowired
	private IProjectActivityCommentService projectActivityCommentService;
	@Autowired
	private IProjectActivityComplainService projectActivityComplainService;
	@Autowired
	private IAccountMsgBeanService accountMsgBeanService;
	@Autowired
	private IExpShareInfoService expShareInfoService;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	
	/**
	 * 活动报名首页 
	 * @return
	 */
	@RequestMapping(value = "/projectActivity/main")
	public String main(Model model){
		try{
			//获取标签列表
			List<ProjectActivityTagBean> tagList = getProjectActivityTag();
			
			ProjectActivityInfoBean projectActivityInfoBean = new ProjectActivityInfoBean();
			projectActivityInfoBean.setStatusArray(new String[]{"0","1"});
			int activityCount = projectActivityInfoService
					.queryTotalSize(projectActivityInfoBean);
			
			projectActivityInfoBean.setStatusArray(new String[]{"1"});
			int activityLiveCount = projectActivityInfoService
					.queryTotalSize(projectActivityInfoBean);
			
			model.addAttribute("activityCount",activityCount);
			model.addAttribute("activityLiveCount",activityLiveCount);
			model.addAttribute("tagList",tagList);
		}catch(Exception e){
			logger.error("首页加载失败，"+e.getMessage(),e);
			return "redirect:/error/404" ;
		}
		return "/front/projectActivity/main";
	}
	
	/**
	 * 异步加载活动列表，每次加载6条数据
	 * code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常 -2:未登录
	 * @param projectActivityInfo
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/projectActivity/json/activityList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean activityList(
			@ModelAttribute("projectActivityInfoBean") ProjectActivityInfoBean projectActivityInfoBean,
			@ModelAttribute("page") Page<ProjectActivityInfoBean> page,
			@RequestParam(value = "type")Integer type){
		ResultBean resultBean = new ResultBean();
		List<ProjectActivityInfoBean> list = new ArrayList<>();
		try{
			projectActivityInfoBean.setOrderByClause("status desc, CREATE_TIME DESC");
			if(StringUtil.checkNotNull(projectActivityInfoBean.getActivityTags())){
				projectActivityInfoBean.setTags(projectActivityInfoBean.getActivityTags().split(","));				
			}
			if(type==2){
				if(getCurrentAccountId()==null){
					resultBean.setCode(-2);
					resultBean.setMsg("亲，您还没有登录");
					return resultBean;
				}
				projectActivityInfoBean.setCreateAccount(getCurrentAccountId());
			}
			if(page.getPageSize()==0){				
				page.setPageSize(6);
			}
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			if(type!=3){
				page = (Page<ProjectActivityInfoBean>) projectActivityInfoService
						.queryByCond(projectActivityInfoBean);
			}else{
				if(getCurrentAccountId()==null){
					resultBean.setCode(-2);
					resultBean.setMsg("亲，您还没有登录");
					return resultBean;
				}
				projectActivityInfoBean.setAccountId(getCurrentAccountId());
				page = projectActivityInfoService
						.queryByEnterAccount(projectActivityInfoBean);
			}
			
			if(page.getTotal()==0){
				resultBean.setCode(2);
				resultBean.setMsg(projectActivityInfoBean.getActivityName());
				return resultBean;
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			for(ProjectActivityInfoBean info:page){
				if(System.currentTimeMillis()>info.getEndTime().getTime()){
					info.setStatus((short)0);
				}
				if(!StringUtil.checkNotNull(info.getQrCode())){
					info.setQrCode(createQrcode("projectActivity/weixin/detail/"+info.getActivityId(),null));
				}
				if(!StringUtil.checkNotNull(info.getActivityUrl())){
					info.setActivityUrl(ProjectProps.getProp("website")+"/projectActivity/weixin/detail/"+info.getActivityId());
				}
				projectActivityInfoService.updateById(info);
				
				info.setStart(sdf.format(info.getStartTime()));
				info.setEnd(sdf.format(info.getEndTime()));
				list.add(info);
			}
			
			if(page.getTotal()>(page.getPageNum()*page.getPageSize())){
				resultBean.setCode(1);
			}else{
				resultBean.setCode(0);
			}
			resultBean.setValue(list);
			resultBean.setMsg(projectActivityInfoBean.getActivityName()+","+page.getTotal());
		}catch(Exception e){
			logger.error("获取活动列表失败，"+e.getMessage(),e);
			resultBean.setCode(-1);
			resultBean.setMsg("获取活动列表失败");
		}
		
		return resultBean;
	}
	
	/**
	 * 活动详情
	 * @return
	 */
	@RequestMapping(value = "/projectActivity/details/{activityId}")
	public String details(@PathVariable(value = "activityId")String activityId,
			HttpServletRequest request,Model model){
		try{
			
			if(isMobileDevice(request)){
				return "redirect:/projectActivity/weixin/detail/"+activityId;
			}
			
			ProjectActivityInfoBean projectActivityInfoBean = projectActivityInfoService
					.selectById(new BigDecimal(activityId));
			
			if(projectActivityInfoBean==null){
				return "redirect:/error/404" ;
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
			logger.error("获取活动详情失败，"+e.getMessage(),e);
			return "redirect:/error/404" ;
		}
		return "/front/projectActivity/details";
	}
	
	/**
	 * 
	 * 异步加载报名列表
	 * code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 * @return
	 */
	@RequestMapping(value = "/projectActivity/json/enterList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean enterList(
			@ModelAttribute("projectActivityEnterBean") ProjectActivityEnterBean projectActivityEnterBean,
			@ModelAttribute("page") Page<ProjectActivityEnterBean> page){
		ResultBean resultBean = new ResultBean();
		
		try{
			projectActivityEnterBean.setStatus((short)1);
			
			//page.setPageSize(10);
			
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectActivityEnterBean>) projectActivityEnterService
					.queryByActivityId(projectActivityEnterBean);
			
			
			List<JSONObject> list = new ArrayList<>();
			for(ProjectActivityEnterBean info:page){
				JSONObject jo = new JSONObject();
				jo.put("imageUrl", info.getImageUrl());
				jo.put("enterUser", info.getEnterUser().replaceAll("(\\d{3})\\d{4}(\\d{4})","$1****$2"));
				list.add(jo);
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
		}catch(Exception e){
			logger.error("获取报名列表失败，"+e.getMessage(),e);
			resultBean.setCode(-1);
			resultBean.setMsg("获取报名列表失败");
		}
		
		return resultBean;
	}
	
	
	/**
	 * 
	 * 异步加载评论列表
	 * code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 * @return
	 */
	@RequestMapping(value = "/projectActivity/json/commentList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean commentList(
			@ModelAttribute("projectActivityCommentBean") ProjectActivityCommentBean projectActivityCommentBean,
			@ModelAttribute("page") Page<ProjectActivityCommentBean> page,
			@RequestParam(value = "commentType" ,defaultValue = "1") Integer commentType){
		ResultBean resultBean = new ResultBean();
		List<ProjectActivityCommentBean> list = new ArrayList<>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try{
			if(commentType==2){
				if(getCurrentAccountId()==null){
					resultBean.setCode(-2);
					resultBean.setMsg("亲，您还没有登录");
					return resultBean;
				}
				projectActivityCommentBean.setCommentAccount(getCurrentAccountId());
			}
			
			projectActivityCommentBean.setOrderByClause(" a.CREATE_TIME DESC");
			
			//page.setPageSize(5);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = projectActivityCommentService
					.queryByCommentAccount(projectActivityCommentBean);
			
			for(ProjectActivityCommentBean info:page){
				info.setComTime(sdf.format(info.getCommentTime()));
				info.setIsCurComment(info.getCommentAccount().equals(getCurrentAccountId())+"");
				list.add(info);
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
			resultBean.setMsg(page.getTotal()+"");
		}catch(Exception e){
			logger.error("获取评论列表失败,"+e.getMessage(),e);
			resultBean.setCode(-1);
			resultBean.setMsg("获取评论列表失败");
		}
		
		return resultBean;
	}
	
	/**
	 * 活动报名
	 * code代码 1：报名成功 0：报名或取消报名失败2：取消报名成功 -1：程序抛出异常 3活动结束
	 * @param activityId
	 * @return
	 */
	@RequestMapping(value = "/projectActivity/json/enterSave", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean enterSave(
			@ModelAttribute("projectActivityEnterBean") ProjectActivityEnterBean projectActivityEnterBean,
			@RequestParam(value = "create" ,required = false)String create){
		ResultBean resultBean = new ResultBean();
		int rst = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try{
			if(getCurrentAccountId()==null){
				resultBean.setCode(-2);
				resultBean.setMsg("亲，您还没有登录");
				return resultBean;
			}
			ProjectActivityInfoBean projectActivityInfoBean = projectActivityInfoService
					.selectById(projectActivityEnterBean.getActivityId());
			
			if(!StringUtil.checkNotNull(projectActivityEnterBean.getEnterAccount())){
				if(System.currentTimeMillis()>projectActivityInfoBean.getEndTime().getTime()||
						projectActivityInfoBean.getStatus()!=1){
					projectActivityInfoBean.setStatus((short)0);
					projectActivityInfoService.updateById(projectActivityInfoBean);
					resultBean.setCode(3);
					resultBean.setMsg("活动已结束");
					return resultBean;
				}
			}
			
			
			if(!StringUtil.checkNotNull(projectActivityEnterBean.getEnterAccount())){
				projectActivityEnterBean.setEnterAccount(getCurrentAccountId());
				AccountInfoBean accountInfoBean = accountInfoBeanProxy.selectByPrimaryKey(getCurrentAccountId());
				if(StringUtil.checkNotNull(accountInfoBean.getAccountNick())){
					projectActivityEnterBean.setEnterUser(accountInfoBean.getAccountNick());
				}else{					
					projectActivityEnterBean.setEnterUser(accountInfoBean.getAccountName());
				}
				
			}
			List<ProjectActivityEnterBean> list = projectActivityEnterService
					.queryByCond(projectActivityEnterBean);
			
			if(list.size()==0){
				projectActivityEnterBean.setEnterId(seq.getNextSeqIdToBigDecimal());
				
				projectActivityEnterBean.setStatus((short)1);
				projectActivityEnterBean.setRemark("");
				
				if(StringUtil.checkNotNull(create)){
					projectActivityEnterBean.setEnterTime(new Timestamp(sdf.parse(create).getTime()));
					projectActivityEnterBean.setCreateTime(new Timestamp(sdf.parse(create).getTime()));
				}else{
					projectActivityEnterBean.setEnterTime(new Timestamp(System.currentTimeMillis()));
					projectActivityEnterBean.setCreateTime(new Timestamp(System.currentTimeMillis()));
				}
				
				rst = projectActivityEnterService.insert(projectActivityEnterBean);
				resultBean.setMsg("报名成功");
				resultBean.setCode(1);
				
				projectActivityInfoBean.setEnterCount(
						projectActivityInfoBean.getEnterCount()+1);
			}else{
				ProjectActivityEnterBean record = list.get(0);
				if(record.getStatus()==1){
					record.setStatus((short)0);
				}else{
					record.setStatus((short)1);
				}
				rst = projectActivityEnterService.updateById(record);
				if(record.getStatus()==1){
					resultBean.setCode(1);
					resultBean.setMsg("报名成功");
					projectActivityInfoBean.setEnterCount(
							projectActivityInfoBean.getEnterCount()+1);
				}else{
					resultBean.setCode(2);
					resultBean.setMsg("取消报名成功");
					projectActivityInfoBean.setEnterCount(
							projectActivityInfoBean.getEnterCount()-1);
				}
			}
			
			projectActivityInfoService.updateById(projectActivityInfoBean);
			if(rst != 1){
				resultBean.setCode(0);
				resultBean.setMsg("报名失败");
			}
		}catch(Exception e){
			logger.error("报名失败，"+e.getMessage(),e);
			resultBean.setCode(-1);
			resultBean.setMsg("报名失败");
		}
		return resultBean;
	}
	
	/**
	 * 
	 * 保存评论内容
	 * code代码 1：保存成功 0：保存失败 -1：程序抛出异常
	 * @return
	 */
	@RequestMapping(value = "/projectActivity/json/commentSave", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean commentSave(
			@ModelAttribute("projectActivityCommentBean") ProjectActivityCommentBean projectActivityCommentBean,
			@RequestParam(value = "create" ,required = false)String create,HttpServletRequest request
			){
		String xReq = request.getHeader("x-requested-with");
		ResultBean resultBean = new ResultBean();
		if (! "XMLHttpRequest".equalsIgnoreCase(xReq)) {
			resultBean.setCode(-2);
			resultBean.setMsg("非法请求");
			return resultBean;
		}else{
			// 是ajax异步请求
			String token=request.getHeader("token");
			String sessionId=request.getSession().getId();
			if(!sessionId.equals(token)){
				resultBean.setCode(-2);
				resultBean.setMsg("非法请求");
				return resultBean;
			}
		}
		int rst = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try{
			if(getCurrentAccountId()==null){
				resultBean.setCode(-2);
				resultBean.setMsg("亲，您还没有登录");
				return resultBean;
			}
			if(StringUtil.checkNotNull(projectActivityCommentBean.getReplyId())){
				ProjectActivityCommentBean record = projectActivityCommentService
						.selectById(projectActivityCommentBean.getReplyId());
				projectActivityCommentBean.setReplyAccount(record.getCommentAccount());
				projectActivityCommentBean.setReplayUser(record.getCommentUser());
			}
			projectActivityCommentBean.setCommentId(seq.getNextSeqIdToBigDecimal());
			if(!StringUtil.checkNotNull(projectActivityCommentBean.getCommentAccount())){
				projectActivityCommentBean.setCommentAccount(getCurrentAccountId());
				
				AccountInfoBean accountInfoBean = accountInfoBeanProxy.selectByPrimaryKey(getCurrentAccountId());
				String accountNick = null;
				if(StringUtil.checkNotNull(accountInfoBean.getAccountNick())){
					accountNick = accountInfoBean.getAccountNick();
				}else{
					accountNick = accountInfoBean.getAccountName();
				}
				
				projectActivityCommentBean.setCommentUser(accountNick);
			}
			
			projectActivityCommentBean.setRemark("");
			projectActivityCommentBean.setSortGrade(100);
			if(StringUtil.checkNotNull(create)){
				projectActivityCommentBean.setCommentTime(new Timestamp(sdf.parse(create).getTime()));
				projectActivityCommentBean.setCreateTime(new Timestamp(sdf.parse(create).getTime()));
			}else{
				projectActivityCommentBean.setCommentTime(new Timestamp(System.currentTimeMillis()));
				projectActivityCommentBean.setCreateTime(new Timestamp(System.currentTimeMillis()));
			}
			projectActivityCommentBean.setCommentContent(HtmlUtils.htmlEscape(projectActivityCommentBean.getCommentContent()));
			rst = projectActivityCommentService.insert(projectActivityCommentBean);
			if(rst == 1){
				resultBean.setCode(1);
				resultBean.setMsg("发表评论成功");
				if(projectActivityCommentBean.getKind()==202){
					ExpShareInfoBean record = expShareInfoService
							.selectById(projectActivityCommentBean.getActivityId());
					ExpShareInfoBean expShareInfoBean = new ExpShareInfoBean();
					expShareInfoBean.setCommentCount((Integer.parseInt(record.getCommentCount())+1)+"");
					MyBeanUtils.copyProperties(expShareInfoBean, record);
					expShareInfoService.updateById(record);
				}
			}else{
				resultBean.setCode(0);
				resultBean.setMsg("发表评论失败");
			}
		}catch(Exception e){
			logger.error("发表评论失败，"+e.getMessage(),e);
			resultBean.setCode(-1);
			resultBean.setMsg("发表评论失败");
		}
		return resultBean;
	}
	
	/**
	 * 
	 * 删除当前账号所发评论
	 * code代码 1：删除成功 0：删除失败 -1：程序抛出异常
	 * @return
	 */
	@RequestMapping(value = "/projectActivity/json/commentDelete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean commentDelete(
			@RequestParam(value = "commentId")String commentId,HttpServletRequest request){
		int rst = 0;
		String xReq = request.getHeader("x-requested-with");
		ResultBean resultBean = new ResultBean();
		if (! "XMLHttpRequest".equalsIgnoreCase(xReq)) {
			resultBean.setCode(-2);
			resultBean.setMsg("非法请求1");
			return resultBean;
		}else{
			// 是ajax异步请求
			String token=request.getHeader("token");
			String sessionId=request.getSession().getId();
			if(!sessionId.equals(token)){
				resultBean.setCode(-2);
				resultBean.setMsg("非法请求2");
				return resultBean;
			}
		}
		try{
			ProjectActivityCommentBean projectActivityCommentBean = projectActivityCommentService
					.selectById(new BigDecimal(commentId));
			if(projectActivityCommentBean==null){
				resultBean.setCode(-2);
				resultBean.setMsg("记录不存在");
				return resultBean;
			}else{
				if(!getCurrentAccountId().equals(projectActivityCommentBean.getCommentAccount())){
					resultBean.setCode(-2);
					resultBean.setMsg("非法操作");
					return resultBean;
				}
			}
			rst = projectActivityCommentService.deleteById(new BigDecimal(commentId));
			if(rst == 1){
				resultBean.setCode(1);
				if(projectActivityCommentBean.getKind()==202){
					ExpShareInfoBean record = expShareInfoService
							.selectById(projectActivityCommentBean.getActivityId());
					ExpShareInfoBean expShareInfoBean = new ExpShareInfoBean();
					expShareInfoBean.setCommentCount((Integer.parseInt(record.getCommentCount())-1)+"");
					MyBeanUtils.copyProperties(expShareInfoBean, record);
					expShareInfoService.updateById(record);
				}
			}else{
				resultBean.setCode(0);
				resultBean.setMsg("删除失败");
			}
		}catch(Exception e){
			logger.error("删除活动评论失败，"+e.getMessage(),e);
			resultBean.setCode(-1);
			resultBean.setMsg("删除失败");
		}
		return resultBean;
	}
	
	/**
	 * 举报活动
	 * code代码 1：举报成功 0：举报失败 2举报过于频繁 -1：程序抛出异常
	 * @return
	 */
	@RequestMapping(value = "/projectActivity/json/complainSave", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean complainSave(@ModelAttribute("projectActivityComplainBean") ProjectActivityComplainBean projectActivityComplainBean){
		ResultBean resultBean = new ResultBean();
		int rst = 0;
		try{
			if(getCurrentAccountId()==null){
				resultBean.setCode(-2);
				resultBean.setMsg("亲，您还没有登录");
				return resultBean;
			}
			projectActivityComplainBean.setSubmitAccount(getCurrentAccountId());
			List<ProjectActivityComplainBean> list = projectActivityComplainService
					.queryByCond(projectActivityComplainBean);
			if(list.size()>=5){
				resultBean.setCode(2);
				resultBean.setMsg("您已举报该活动，请勿频繁举报");
				return resultBean;
			}
			
			String subContent = projectActivityComplainBean.getSubmitContent();
			projectActivityComplainBean.setSubmitContent(
					subContent.substring(0, subContent.lastIndexOf(",")));
			projectActivityComplainBean.setComplainId(seq.getNextSeqIdToBigDecimal());
			projectActivityComplainBean.setSubmitUser(getCurrentAccountName());
			projectActivityComplainBean.setSubmitTime(new Date());
			projectActivityComplainBean.setResponseRst((short)0);
			projectActivityComplainBean.setRemark("");
			projectActivityComplainBean.setCreateTime(new Date());
			
			rst = projectActivityComplainService.insert(projectActivityComplainBean);
			if(rst == 1){
				resultBean.setCode(1);
			}else{
				resultBean.setCode(0);
				resultBean.setMsg("保存举报信息失败");
			}
		}catch(Exception e){
			logger.error("保存活动举报信息失败，"+e.getMessage(),e);
			resultBean.setCode(-1);
			resultBean.setMsg("保存举报信息失败");
		}
		return resultBean;
	}
	
	
	/**
	 * 活动发布
	 * type 2:再次编辑
	 * @return
	 */
	@RequestMapping(value = "projectActivity/create")
	public String create(
			@RequestParam(value = "type",required = false) String type,
			Model model){
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
		}catch(Exception e){
			logger.error("活动编辑页面加载失败，"+e.getMessage(),e);
			return "redirect:/error/404" ;
		}
		return "/front/projectActivity/create";
	}

	/**
	 * 活动预览
	 * @return
	 */
	@RequestMapping(value = "projectActivity/preview")
	public String preview(
			@ModelAttribute("projectActivityInfoBean") ProjectActivityInfoBean projectActivityInfoBean,
			Model model){
		try{
			getRequest().getSession().setAttribute("projectActivityInfoBean", projectActivityInfoBean);
			model.addAttribute("projectActivityInfoBean",projectActivityInfoBean);
		}catch(Exception e){
			logger.error("活动预览页面加载失败，"+e.getMessage(),e);
			return "redirect:/error/404" ;
		}
		return "/front/projectActivity/preview";
	}
	
	/**
	 * 异步保存活动
	 * code代码 1：发布成功 0：发布失败 -1：程序抛出异常 2:重复发布
	 * @return
	 */
	@RequestMapping(value = "/projectActivity/json/activitySave", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean activitySave(
			@ModelAttribute("projectActivityInfoBean") ProjectActivityInfoBean projectActivityInfoBean,
			@RequestParam(value = "create" ,required = false)String create){
		int rst = 1 ;
		ResultBean resultBean = new ResultBean();
		try{
			if(getCurrentAccountId()==null){
				resultBean.setCode(-2);
				resultBean.setMsg("亲，您还没有登录");
				return resultBean;
			}
			Object activityIdSession = getRequest()
					.getSession().getAttribute("activityId");
			if(activityIdSession !=null ){
				ProjectActivityInfoBean info = projectActivityInfoService
						.selectById(new BigDecimal(activityIdSession.toString()));
				if(info != null){
					resultBean.setCode(2);
					resultBean.setMsg("请勿重复发布");
					return resultBean;
				}
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			if(!StringUtil.checkNotNull(projectActivityInfoBean.getActivityName())){
				ProjectActivityInfoBean record = (ProjectActivityInfoBean)
						getRequest().getSession().getAttribute("projectActivityInfoBean");
				if(record!=null){
					projectActivityInfoBean = record;
				}
			}
			
			if(projectActivityInfoBean.getActivityId()==null){
				BigDecimal activityId = seq.getNextSeqIdToBigDecimal();
				projectActivityInfoBean.setActivityId(activityId);
				getRequest().getSession().setAttribute("activityId", activityId);
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
					projectActivityInfoBean.setCreateTime(new Timestamp(System.currentTimeMillis()));
				}
				
				projectActivityInfoBean.setQrCode(createQrcode("projectActivity/weixin/detail/"+activityId,null));
				rst = projectActivityInfoService.insert(projectActivityInfoBean);
				
				if(rst>0){
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
						projectActivityEnterBean.setEnterTime(new Timestamp(System.currentTimeMillis()));
						projectActivityEnterBean.setCreateTime(new Timestamp(System.currentTimeMillis()));
					}
					
					projectActivityEnterBean.setStatus((short)1);
					projectActivityEnterBean.setRemark("");
					
					projectActivityEnterService.insert(projectActivityEnterBean);
				}
				
			}else{
				ProjectActivityInfoBean record = projectActivityInfoService
						.selectById(projectActivityInfoBean.getActivityId());
				MyBeanUtils.copyProperties(projectActivityInfoBean, record);
				rst = projectActivityInfoService.updateById(record);
			}
			
			if(rst==1){
				resultBean.setCode(1);
				resultBean.setMsg(projectActivityInfoBean.getActivityId().toString());
			}else{
				resultBean.setCode(0);
				resultBean.setMsg("发布失败");
			}
			
			getRequest().getSession().removeAttribute("projectActivityInfoBean");
			
		}catch(Exception e){
			logger.error("活动发布失败，"+e.getMessage(),e);
			resultBean.setCode(-1);
			resultBean.setMsg("发布失败");
		}
		
		return resultBean;
	}
	
	/**
	 * 获取标签列表
	 * @return
	 */
	private List<ProjectActivityTagBean> getProjectActivityTag(){
		List<ProjectActivityTagBean> list = null;
		try{
			ProjectActivityTagBean projectActivityTagBean = new ProjectActivityTagBean();
			projectActivityTagBean.setStatus((short) 1);
			projectActivityTagBean.setKind(201);
			projectActivityTagBean.setOrderByClause("SORT_GRADE ASC");
			list = projectActivityTagService.queryByCond(projectActivityTagBean);
		}catch(Exception e){
			logger.error("获取活动标签列表失败，"+e.getMessage(),e);
		}
		return list;
	}
	
	/**
	 * 异步保存活动变更信息
	 * code代码 1：变更消息保存成功0：取消消息保存成功-1：程序抛出异常
	 * type代码 1：变更 2：取消
	 * msgType代码1：pc端 2：微信端
	 * @return
	 */
	@RequestMapping(value = "/projectActivity/json/noticeSave", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean noticeSave(
			@RequestParam(value = "type")Integer type,
			@RequestParam(value = "activityId")String activityId,
			@RequestParam(value = "msgContent")String msgContent,
			@RequestParam(value = "msgType", defaultValue = "1")String msgType){
		ResultBean resultBean = new ResultBean();
		try{
			if(getCurrentAccountId()==null){
				resultBean.setCode(-2);
				resultBean.setMsg("亲，您还没有登录");
				return resultBean;
			}
			ProjectActivityInfoBean record = projectActivityInfoService
					.selectById(new BigDecimal(activityId));
			ProjectActivityEnterBean projectActivityEnterBean = new ProjectActivityEnterBean();
			projectActivityEnterBean.setActivityId(new BigDecimal(activityId));
			projectActivityEnterBean.setStatus((short)1);
			List<ProjectActivityEnterBean> list = projectActivityEnterService
					.queryByActivityId(projectActivityEnterBean);
			for(ProjectActivityEnterBean info : list){
				AccountMsgBean accountMsgBean = new AccountMsgBean();
				accountMsgBean.setMsgId(seq.getNextSeqIdToBigDecimal());
				accountMsgBean.setAccountId(info.getEnterAccount());
				accountMsgBean.setMsgTitle("活动【"+record.getActivityName()+"】"+(type==1?"变更":"取消"));
				accountMsgBean.setMsgWeb(msgContent);;
				accountMsgBean.setStatus((short)0);
				if("1".equals(msgType)){
					accountMsgBean.setPushKind("00001");
				}else{
					accountMsgBean.setPushKind("01000");					
				}
				accountMsgBean.setCreateTime(new Timestamp(System.currentTimeMillis()));
				accountMsgBeanService.insertSelective(accountMsgBean);
			}
			
			resultBean.setCode(1);
			resultBean.setMsg("消息发送成功");
			
			if("2".equals(type)){
				ProjectActivityInfoBean projectActivityInfoBean = new ProjectActivityInfoBean();
				projectActivityInfoBean.setStatus((short)-1);
				projectActivityInfoBean.setActivityId(new BigDecimal(activityId));
				projectActivityInfoService.updateById(projectActivityInfoBean);
				resultBean.setCode(2);
			}
			
		}catch(Exception e){
			logger.error("活动变更消息保存失败，"+e.getMessage(),e);
			resultBean.setCode(-1);
			resultBean.setMsg("消息发送失败");
		}
		
		return resultBean;
	}
	
}
