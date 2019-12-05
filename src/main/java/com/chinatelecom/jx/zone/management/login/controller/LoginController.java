package com.chinatelecom.jx.zone.management.login.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.chinatelecom.jx.servlet.ServletHelper;
import com.chinatelecom.jx.zone.account.image.bean.AccountImageBean;
import com.chinatelecom.jx.zone.account.image.service.IAccountImageBeanService;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.account.weixin.bean.AccountWeixinBean;
import com.chinatelecom.jx.zone.entrance.helper.EntranceIdHelper;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.login.controller.weixin.MobileWeixinLoginController;
import com.chinatelecom.jx.zone.management.service.showLogin.IShowLoginService;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.session.helper.AccountIdSessionHelper;

/**
 * 登录页面展示
 * 
 * @author ZuoGuangDe
 * 
 */
@Controller
public class LoginController extends BaseController {

	@Autowired
	private MobileWeixinLoginController mobileWeixinLoginController;
	@Autowired
	private EntranceIdHelper entranceIdHelper;
	@Autowired
	private IShowLoginService showLoginService;
	@Autowired
	private AccountIdSessionHelper accountIdSessionHelper;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private IAccountImageBeanService accountImageBeanService;

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(value = "/homePage/main")
	public String homePage(HttpServletRequest request,HttpServletResponse response, HttpSession session, Model model)throws Exception {
		request.getSession().setAttribute("urlPath", showLoginService.getUrlPath());
		model.addAttribute("isLogin", isLogin());
		BigDecimal entranceId=null ;
		String eId = request.getParameter("entranceId");
		try {
			if (StringUtil.checkNotNull(eId)) {
				entranceId = new BigDecimal(eId);// 宜春市下面单位ID转换成宜春ID
			}  
		} catch (Exception e) {
			entranceId = null;
		}
		request.getSession().setAttribute("entranceId", entranceId);
		if(isLogin()){
			model.addAttribute("accountId", this.getCurrentAccountId());
		}
		return "/front/homePage_new";
	}
	
	// 引导到系统登录首页,页面短链
	@RequestMapping(value = "/login")
	public String sl(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "redirectUrl", required = false) String redirectUrl, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model) {
		return index(username,redirectUrl,request,response,session,model);
	}

	// 引导到系统登录首页，正常链接
	@RequestMapping(value = "/session/page/login/index")
	public String index(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "redirectUrl", required = false) String redirectUrl, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model) {
		BigDecimal entranceId = entranceIdHelper.setupPerfectEntranceId(request);
		if(entranceId==null){
			String eId =request.getParameter("entranceId");
			if(StringUtil.checkNotNull(eId)){
				try{
					entranceId =new BigDecimal(eId);
				}catch(Exception e){
					e.printStackTrace();
					entranceId =null;
				}
				entranceIdHelper.setEntranceIdInSession(request, entranceId);
			}
		}
		if (ServletHelper.isMobileRequest(request)) { // 发现是手机端访问，引导到手机端的微信访问页面。
			return mobileWeixinLoginController.index(username, redirectUrl, request, response, session, model);
			// return "forward:/session/page/mobile/weixin/login/index";
		}
		if (logger.isTraceEnabled()) {
			final AccountWeixinBean accountWeixinBean = (AccountWeixinBean) session.getAttribute("accountWeixinBean"); 
			
			logger.trace("引导PC用户到登录首页页面，入参手机号码username：" + username + "，入参登录跳转redirectUrl：" + redirectUrl
					+ "，客户地址requestIp：" + ServletHelper.getIpAddress(request) + "，访问路径requestURI：" + request.getRequestURI()
					+ "，登录入口entranceId：" + entranceId + "，事务会话sessionId：" + session.getId() + "，会话手机号码username："
					+ session.getAttribute("username") + "，会话微信记录accountWeixinBean："
					+ JSON.toJSONString(accountWeixinBean) + "，会话登录跳转redirectUrl：" + session.getAttribute("redirectUrl")
					+ "。");
		}

		if (!StringUtils.isEmpty(username)) {
			session.setAttribute("username", username); // 存到访问会话中，以备后续相关功能使用。
		}

		if (!StringUtils.isEmpty(redirectUrl)) {
			session.setAttribute("redirectUrl", redirectUrl); // 存到访问会话中，已被后续登录认证表单提交时可以填值。
		}
       if(entranceId.equals(Yichun_ID) ){ //宜春工信委ID 
       		return "/login/index_yc";
       }
       if(entranceId.equals(GXW_ID) ) {//江西省工信委ID 
		    return "/login/index_gxw";
       }
       if(entranceId.equals(FGW_ID) ) {//江西发改委ID，到江西政务登录
    	 // String domain= showLoginService.getUrlPath();
    	  String jxClient=showLoginService.getJxGovCaClientId();
    	  String s= "https://login.jxzwfww.gov.cn/auth2/authorize.do?client_id="+ jxClient +"&redirect_uri="+redirectUrl;
    	  return "redirect:"+s ;
       }else  //省级平台
		  return "/login/index";

	}

	/**
	 * 超级管理员，运维用户登录
	 */
	@RequestMapping(value = "/manage/login")
	public String adminLogin(HttpServletRequest request) throws Exception {
		return "/admin/login";
	}

	/**
	 * 超级管理员，运维用户登录后页面
	 */
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/admin/main")
	public String manageMain(HttpServletRequest request) throws Exception {
		return "/admin/main";
	}

	 
	/**
	 * 判断用户是否已登录，并返回头像和名称
	 */
	@RequestMapping(value = "/session/account/isLogin" )
	public String isLogin(ModelMap modelMap,HttpServletRequest request) throws Exception {
		boolean b = accountIdSessionHelper.isAccountAlreadyLogin();
		String returnUrl = "";
		if (b) {
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "用户已登录！");
		}else{
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "用户未登录！");
		}
		return "jsonView";
	}

	
	/**
	 *  返回头像和名称
	 */
	@RequestMapping(value = "/account/headImage" )
	public String headImage(ModelMap modelMap,HttpServletRequest request) throws Exception {
		boolean b = accountIdSessionHelper.isAccountAlreadyLogin();
		String returnUrl = "";
		if (b) {
			String id = (String) request.getSession().getAttribute("accountId");
			String name = (String) request.getSession().getAttribute("accountName");
			String image = (String) request.getSession().getAttribute("headImage");
			if (StringUtil.checkNotNull(name) && StringUtil.checkNotNull(image) && id.equals(accountIdSessionHelper.getAccountIdBySessionAttribute().toString())) {
				returnUrl = image;
			} else {
				AccountInfoBean info = accountInfoBeanProxy
						.selectByPrimaryKey(accountIdSessionHelper.getAccountIdBySessionAttribute());
				List<AccountImageBean> imageInfoList = accountImageBeanService.selectListByAccountIdAndImageType(
						accountIdSessionHelper.getAccountIdBySessionAttribute(), (short) 10);
				AccountImageBean imageInfo = imageInfoList.isEmpty() ? null : imageInfoList.get(0);
				name = info == null ? "" : info.getAccountName() ;
				String defaultImage = request.getContextPath() + "/static/image/experienceSharing/headPortrait.png";
				returnUrl = imageInfo == null ? defaultImage : imageInfo.getImageUrl(); // 默认头像
				
				request.getSession().setAttribute("accountName",name);
				request.getSession().setAttribute("headImage", returnUrl );
				request.getSession().setAttribute("accountId", accountIdSessionHelper.getAccountIdBySessionAttribute().toString());
			}
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "调用成功！");
			modelMap.addAttribute("headImage", returnUrl);
			modelMap.addAttribute("accountName", name);
		}else{
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "用户未登录！");
			modelMap.addAttribute("headImage", "");
			modelMap.addAttribute("accountName", "");
		}
		return "jsonView";
	}
	
	//恢复session
	@RequestMapping(value = "/restoreSession" )
	public String restoreSession(ModelMap modelMap,HttpServletRequest request) throws Exception {
		String eid=request.getParameter("entranceId");
		if(StringUtil.checkNotNull(eid)){
			BigDecimal id=new BigDecimal(eid);
			request.getSession().setAttribute("entranceId",id);
		}
		request.getSession().setAttribute("urlPath",request.getParameter("urlPath"));
		return "jsonView";
	}
	
}
