package com.chinatelecom.jx.zone.management.login.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;

import com.chinatelecom.jx.servlet.ServletHelper;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.account.weixin.bean.AccountWeixinBean;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.captcha.helper.SignatureShortMessageCaptchaCacheHelper;
import com.chinatelecom.jx.zone.entrance.helper.EntranceIdHelper;
import com.chinatelecom.jx.zone.management.login.controller.weixin.MobileWeixinRegisterController;
import com.chinatelecom.jx.zone.management.service.register.IAccountRegisterService;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.module.info.proxy.IModuleInfoBeanLookup;
 
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanLookup;
import com.chinatelecom.jx.zone.system.log.sync.ISystemLogSync;

import net.sf.ehcache.Element;

@Controller
public class RegisterController {

	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private ISystemInfoBeanLookup systemInfoBeanProxy;
	@Autowired
	private IModuleInfoBeanLookup moduleInfoBeanProxy;

	@Autowired
	private ISystemLogSync systemLogSync;

	@Autowired
	private com.chinatelecom.jx.zone.hcode.pt.proxy.IHcodePtValidateProxy hcodePtProxy;

	@Autowired
	private SignatureShortMessageCaptchaCacheHelper signatureShortMessageCaptchaCacheHelper;
	@Autowired
	private EntranceIdHelper entranceIdHelper;
	@Autowired
	private MobileWeixinRegisterController mobileWeixinRegisterController;
	@Autowired
	private IAccountRegisterService accountRegisterService;

	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);

	@PostConstruct
	public void initialize() {

		logger.info("RegisterController initialized!");
	}

	@RequestMapping(value = "/session/page/login/register/index")
	public String index(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "redirectUrl", required = false) String redirectUrl, HttpServletRequest request,
			HttpSession session, Model model) {
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
		if (ServletHelper.isMobileRequest(request)) { // 如果是手机端访问，则转派手机端用户注册Controller进行处理
			return mobileWeixinRegisterController.index(username, redirectUrl, request, session, model);
		}
		if (logger.isTraceEnabled()) {
			final AccountWeixinBean accountWeixinBean = (AccountWeixinBean) session.getAttribute("accountWeixinBean"); // 如果有值，则是通过WebWeixinLoginController中方法设置。

			logger.trace("引导PC端Web用户到账户注册页面，入参手机号码username：" + username + ",入参登录跳转redirectUrl：" + redirectUrl
					+ "，客户地址requestIp：" + ServletHelper.getIpAddress(request) + "，访问路径requestURI：" + request.getRequestURI()
					+ "，登录入口entranceId：" + entranceId + "，事务会话sessionId：" + session.getId() + "，会话手机号码username："
					+ session.getAttribute("username") + "，会话微信记录accountWeixinBean："
					+ JSON.toJSONString(accountWeixinBean) + "，会话登录跳转redirectUrl：" + session.getAttribute("redirectUrl")
					+ "。");

		}

		if (!StringUtils.isEmpty(username) && username.matches("[\u4e00-\u9fa5a-zA-Z0-9]{1,32}")) { //中英文及数字
			session.setAttribute("username", username); // 存到访问会话中，以备后续相关功能使用。
		}

		if (!StringUtils.isEmpty(redirectUrl)) {
			session.setAttribute("redirectUrl", redirectUrl); // 存到访问会话中，已被后续登录认证表单提交时可以填值。
		}
		if(entranceId.equals(new BigDecimal(3609009)) ) //宜春工信委ID))
	      	return "/login/register/index_yc";
	    else
	    	return "/login/register/index"; // 处理成功的跳转View
	}

	// 短信验证码发送，业务逻辑见ShortMessageCaptchaController，
	// url路径为：/session/json/shortMessageCaptcha

	// 门户用户注册的业务调用
	@RequestMapping(value = "/session/json/login/register/register")
	public String register(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "password1", required = false) String password1,
			@RequestParam(value = "captchaValue", required = false) String captchaValue, HttpServletRequest request,
			HttpSession session, ModelMap modelMap) {
		return mobileWeixinRegisterController.register(username, password, password1, captchaValue, request, session,
				modelMap);

	}
}