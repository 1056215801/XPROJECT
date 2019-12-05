package com.chinatelecom.jx.zone.management.login.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.ehcache.Element;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.chinatelecom.jx.servlet.ServletHelper;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.account.passwd.service.IUpdateAccountPasswdService;
import com.chinatelecom.jx.zone.account.weixin.bean.AccountWeixinBean;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.captcha.helper.SignatureShortMessageCaptchaCacheHelper;
import com.chinatelecom.jx.zone.entrance.helper.EntranceIdHelper;
import com.chinatelecom.jx.zone.management.login.controller.weixin.MobileWeixinRetrievePasswordController;
import com.chinatelecom.jx.zone.module.info.proxy.IModuleInfoBeanLookup;
 
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanLookup;
import com.chinatelecom.jx.zone.system.log.sync.ISystemLogSync;

/**
 * PC端Web用户关于密码找回功能的页面服务封装
 * 
 * @author ZuoGuangDe
 *
 */
@Controller
public class RetrievePasswordController {
	@Autowired
	private EntranceIdHelper entranceIdHelper;
	@Autowired
	private MobileWeixinRetrievePasswordController mobileWeixinRetrievePasswordController;
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
	private IUpdateAccountPasswdService updateAccountPasswdService;

	private static final Logger logger = LoggerFactory.getLogger(RetrievePasswordController.class);

	// 引导到找回密码页面
	@RequestMapping(value = "/session/page/login/retrievePassword/index")
	public String index(@RequestParam(value = "username", required = false) String username, 
			@RequestParam(value = "redirectUrl", required = false) String redirectUrl,
			HttpServletRequest request,HttpSession session, Model model) {
		
		if (!StringUtils.isEmpty(redirectUrl)) {
			session.setAttribute("redirectUrl", redirectUrl); // 存到访问会话中，以备后续相关功能使用。
		}
		
		if (ServletHelper.isMobileRequest(request)) { // 探测是手机端访问
			return mobileWeixinRetrievePasswordController.index(username, redirectUrl,request, session, model);
		}

		if (logger.isTraceEnabled()) {
			final BigDecimal entranceId = entranceIdHelper.setupPerfectEntranceId(request);
			final AccountWeixinBean accountWeixinBean = (AccountWeixinBean) session.getAttribute("accountWeixinBean"); // 如果有值，则是通过WebWeixinLoginController中方法设置。

			logger.trace("引导PC端Web客户到找回密码页面，入参手机号码username：" + username + "，客户地址requestIp："
					+ ServletHelper.getIpAddress(request) + "，访问路径requestURI：" + request.getRequestURI()
					+ "，登录入口entranceId：" + entranceId + "，事务会话sessionId：" + session.getId() + "，会话手机号码username："
					+ session.getAttribute("username") + "，会话微信记录accountWeixinBean："
					+ JSON.toJSONString(accountWeixinBean) + "，会话登录跳转redirectUrl：" + session.getAttribute("redirectUrl")
					+ "。");
		}

		if (!StringUtils.isEmpty(username)) {
			session.setAttribute("username", username); // 存到访问会话中，以备后续相关功能使用。
		}
		return "/login/retrievePassword/index";
	}

	// 短信验证码发送，业务逻辑见ShortMessageCaptchaController，
	// url路径为：/session/json/shortMessageCaptcha

	@RequestMapping(value = "/session/json/login/retrievePassword/validate")
	public String validate(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "captchaValue", required = false) String captchaValue, HttpServletRequest request,
			HttpSession session, ModelMap modelMap) {
		return mobileWeixinRetrievePasswordController.validate(username, captchaValue, request, session, modelMap);
	}

	// 设置新密码的业务调用
	@RequestMapping(value = "/session/json/login/retrievePassword/reset")
	public String reset(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "password1", required = false) String password1, HttpServletRequest request,
			HttpSession session, ModelMap modelMap) {
		return mobileWeixinRetrievePasswordController.reset(username, password, password1, request, session, modelMap);

	}
}
