package com.chinatelecom.jx.zone.management.login.controller.weixin;

import java.math.BigDecimal;
import javax.annotation.PostConstruct;
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
import com.chinatelecom.jx.spring.util.JsonViewHelper;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.account.weixin.bean.AccountWeixinBean;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.captcha.helper.SignatureShortMessageCaptchaCacheHelper;
import com.chinatelecom.jx.zone.entrance.helper.EntranceIdHelper;
import com.chinatelecom.jx.zone.module.info.proxy.IModuleInfoBeanLookup;
import com.chinatelecom.jx.zone.organization.account.transaction.IOrganizationAccountRegisterService;
 
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanLookup;
import com.chinatelecom.jx.zone.system.log.sync.ISystemLogSync;

@Controller
public class MobileWeixinRegisterController {

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
	private IOrganizationAccountRegisterService organizationAccountRegisterService;

	private static final Logger logger = LoggerFactory.getLogger(MobileWeixinRegisterController.class);

	@PostConstruct
	public void initialize() {
		logger.info("手机端微信用户系统注册前端交互服务初始化成功！");
	}

	// 引导到微信系统注册页面
	/**
	 * 引导到系统注册页面（1：从登录页面引导；2：从微信登录页面引导）
	 * 
	 * @param username
	 *            手机号码
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/session/page/mobile/weixin/login/register/index")
	public String index(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "redirectUrl", required = false) String redirectUrl, HttpServletRequest request,
			HttpSession session, Model model) {
		if (logger.isTraceEnabled()) {
			final BigDecimal entranceId = entranceIdHelper.setupPerfectEntranceId(request);
			final AccountWeixinBean accountWeixinBean = (AccountWeixinBean) session.getAttribute("accountWeixinBean"); // 如果有值，则是通过MobileWeixinOpenFilter中方法设置。

			logger.trace("引导手机端微信用户到账户注册页面，入参手机号码username：" + username + ",入参登录跳转链接redirectUrl：" + redirectUrl
					 + "，客户地址requestIp：" + ServletHelper.getIpAddress(request)
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
		final String successUrl = "/mobile/weixin/login/register/index"; // 处理成功的跳转View
		return successUrl;
	}

	// 短信验证码发送，业务逻辑见ShortMessageCaptchaController，
	// url路径为：/session/json/shortMessageCaptcha

	// 微信用户注册的业务调用
	@RequestMapping(value = "/session/json/mobile/weixin/login/register/register")
	public String register(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "password1", required = false) String password1,
			@RequestParam(value = "captchaValue", required = false) String captchaValue, HttpServletRequest request,
			HttpSession session, ModelMap modelMap) {

		final BigDecimal entranceId = entranceIdHelper.setupPerfectEntranceId(request);
		final AccountWeixinBean accountWeixinBean = (AccountWeixinBean) session.getAttribute("accountWeixinBean"); // 如有设置，则值是通过MobileWeixinOpenFilter业务处理后进行设置。

		if (logger.isTraceEnabled()) {
			logger.trace("系统账户自助注册，入参手机号码username：" + username + "，入参账户密码password：" + password
					+ "，入参账户密码password1：" + password1 + "，客户地址requestIp：" + ServletHelper.getIpAddress(request)
					+ "，登录入口entranceId：" + entranceId + "，事务会话sessionId：" + session.getId() + "，会话手机号码username："
					+ session.getAttribute("username") + "，会话微信记录accountWeixinBean："
					+ JSON.toJSONString(accountWeixinBean) + "，会话登录跳转redirectUrl：" + session.getAttribute("redirectUrl")
					+ "。");

		}
		if (!StringUtils.isEmpty(username)) {
			session.setAttribute("username", username); // 存到访问会话中，以备后续相关功能使用。
		}
		String sessionId = session.getId();
		try {

			final String requestIp = ServletHelper.getIpAddress(request);
			final String requestURI = request.getRequestURI();

			final BigDecimal thisSystemId = systemInfoBeanProxy.selectSystemIdByThisSystemCode();
			final String thisModuleName = "系统账号注册";
			final BigDecimal thisModuleId = moduleInfoBeanProxy.selectModuleIdByModuleName(thisModuleName);

			if (StringUtils.isEmpty(username)) {
				return JsonViewHelper.setupAndReturnJsonView(false, 1, "手机号码不能为空！", modelMap);
			}
			if (StringUtils.isEmpty(captchaValue)) {
				return JsonViewHelper.setupAndReturnJsonView(false, 1, "短信验证码不能为空！", modelMap);
			}
			if (StringUtils.isEmpty(password)) {
				return JsonViewHelper.setupAndReturnJsonView(false, 1, "密码输入不能为空！", modelMap);
			}
			if (!password.equals(password1)) {
				return JsonViewHelper.setupAndReturnJsonView(false, 1, "两次密码输入不一致！", modelMap);
			}

			Short gate = hcodePtProxy.queryOperatorGate(username);
			if (gate == null) {
				return JsonViewHelper.setupAndReturnJsonView(false, 1, "手机号码输入错误！", modelMap);
			}

	
			// 验证短信码
			InvokeInfoBean<Boolean> rst1 = signatureShortMessageCaptchaCacheHelper
					.validateCacheSignatureShortMessageCaptchaWithFailedTimesCheck(username, requestIp, sessionId, captchaValue);
			if (!rst1.isSuccess()) {
				return JsonViewHelper.setupAndReturnJsonView(false, rst1.getErrorCode(), rst1.getErrorMsg(), modelMap);
			}
	
			AccountInfoBean accountInfo = accountInfoBeanProxy.selectLiveByUserCode(username);
			if (accountInfo != null) {
				return JsonViewHelper.setupAndReturnJsonView(false, 2, "手机号码已经存在！", modelMap);
			}

			
			String userNick = (String) session.getAttribute("nickName");
			if (StringUtils.isEmpty(userNick)) {
				userNick = username;
			}

			final BigDecimal bindId = accountWeixinBean == null ? null : accountWeixinBean.getBindId();

			InvokeInfoBean<BigDecimal[]> rst2 = organizationAccountRegisterService.register(entranceId, userNick,
					username, password, bindId);
			boolean success = rst2.isSuccess();
			int errorCode = rst2.getErrorCode();
			String errorMsg = rst2.getErrorMsg();
			if (!success) {
				return JsonViewHelper.setupAndReturnJsonView(false, errorCode, errorMsg, modelMap);
			}
			session.removeAttribute("accountWeixinBean");

			BigDecimal accountId = null;
			BigDecimal organizationId = null;
			BigDecimal rootId = null;
			if (rst2.getValue() != null) {
				accountId = rst2.getValue()[0];
				organizationId = rst2.getValue()[1];
				rootId = rst2.getValue()[2];
			}

			String logDetail = new StringBuilder(128).append("账户门户自助注册，登录入口entranceId：" + entranceId + "，微信记录accountWeixinBean："
					+ JSON.toJSONString(accountWeixinBean) + "，手机号码username：" + username + "，账户密码password：" + password + "，账户密码password1：" + password1
					+ "，rst：" + JSON.toJSONString(rst2)) + "！";
			systemLogSync.insert(request, thisModuleId, accountId, organizationId, rootId,(short) 0, errorCode, logDetail);

			return JsonViewHelper.setupAndReturnJsonView(true, errorCode, errorMsg, modelMap);

		} catch (Exception ex) {
			logger.error("账户注册失败，" + ex.getLocalizedMessage(), ex);
			return JsonViewHelper.setupAndReturnJsonView(false, 2, "系统资源忙，请稍后再试！", modelMap);
		}

	}
	/**
	 * 校验手机号是否可以注册
	 * @param username  手机号码
	 * @param request
	 * @param session
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/session/json/mobile/weixin/login/register/check")
	public String index(@RequestParam(value = "username", required = true) String username,
			 HttpServletRequest request,HttpSession session, ModelMap modelMap) {
		try{
			AccountInfoBean accountInfo = accountInfoBeanProxy.selectLiveByUserCode(username);
			if (accountInfo != null) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 2);
				modelMap.addAttribute("errorMsg", "手机号码已经存在！");
			}else{
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "可以注册！");
			}
		}catch(Exception ex){
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "注册出现异常，请联系管理员！");
			logger.error("注册异常，" + ex.getLocalizedMessage(), ex);
		}
		return "jsonView";
	}
	
}