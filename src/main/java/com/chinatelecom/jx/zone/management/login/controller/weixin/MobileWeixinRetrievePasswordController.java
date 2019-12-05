package com.chinatelecom.jx.zone.management.login.controller.weixin;

import java.math.BigDecimal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.chinatelecom.jx.spring.util.JsonViewHelper;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.account.passwd.service.IUpdateAccountPasswdService;
import com.chinatelecom.jx.zone.account.weixin.bean.AccountWeixinBean;
import com.chinatelecom.jx.zone.account.weixin.transaction.IAccountWeixinBindService;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.captcha.helper.SignatureShortMessageCaptchaCacheHelper;
import com.chinatelecom.jx.zone.entrance.helper.EntranceIdHelper;
import com.chinatelecom.jx.zone.module.info.proxy.IModuleInfoBeanLookup;
 
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanLookup;
import com.chinatelecom.jx.zone.system.log.sync.ISystemLogSync;

@Controller
public class MobileWeixinRetrievePasswordController {

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
	@Autowired
	private IAccountWeixinBindService accountWeixinBindService;
	@Autowired
	private EntranceIdHelper entranceIdHelper;

	private static final Logger logger = LoggerFactory.getLogger(MobileWeixinRetrievePasswordController.class);

	// 引导手机端微信客户到找回密码页面
	@RequestMapping(value = "/session/page/mobile/weixin/login/retrievePassword/index")
	public String index(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "redirectUrl", required = false) String redirectUrl,
			HttpServletRequest request,HttpSession session, Model model) {
			

		if (logger.isTraceEnabled()) {
			BigDecimal entranceId = entranceIdHelper.setupPerfectEntranceId(request);
			final AccountWeixinBean accountWeixinBean = (AccountWeixinBean) session.getAttribute("accountWeixinBean"); // 如果有值，则值是通过MobileWeixinOpenFilter业务处理后进行设置。
			logger.trace("引导手机端微信客户到找回密码页面，入参手机号码username：" + username + "，客户地址requestIp："
					+ ServletHelper.getIpAddress(request) + "，访问路径requestURI：" + request.getRequestURI()
					+ "，登录入口entranceId：" + entranceId + "，事务会话sessionId：" + session.getId() + "，会话手机号码username："
					+ session.getAttribute("username") + "，会话微信记录accountWeixinBean："
					+ JSON.toJSONString(accountWeixinBean) + "，会话登录跳转redirectUrl：" + session.getAttribute("redirectUrl")
					+ "。");
		}

		if (!StringUtils.isEmpty(username)) {
			session.setAttribute("username", username); // 存到访问会话中，以备后续相关功能使用。
		}
		if (!StringUtils.isEmpty(redirectUrl)) {
			session.setAttribute("redirectUrl", redirectUrl); // 存到访问会话中，以备后续相关功能使用。
		}
		
		return "/mobile/weixin/login/retrievePassword/index";
	}

	@RequestMapping(value = "/session/json/mobile/weixin/login/retrievePassword/validate")
	public String validate(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "captchaValue", required = false) String captchaValue, HttpServletRequest request,
			HttpSession session, ModelMap modelMap) {

		try {

			final String requestIp = ServletHelper.getIpAddress(request);
			final String requestURI = request.getRequestURI();

			final BigDecimal thisSystemId = systemInfoBeanProxy.selectSystemIdByThisSystemCode();
			final String thisModuleName = "账户手机认证";
			final BigDecimal thisModuleId = moduleInfoBeanProxy.selectModuleIdByModuleName(thisModuleName);

			if (StringUtils.isEmpty(username)) {
				return JsonViewHelper.setupAndReturnJsonView(false, 1, "手机号码不能为空！", modelMap);
			}
			if (StringUtils.isEmpty(captchaValue)) {
				return JsonViewHelper.setupAndReturnJsonView(false, 1, "短信验证码不能为空！", modelMap);
			}

			Short gate = hcodePtProxy.queryOperatorGate(username);
			if (gate == null) {
				return JsonViewHelper.setupAndReturnJsonView(false, 1, "手机号码输入错误！", modelMap);
			}
			// 验证短信码
			InvokeInfoBean<Boolean> rst1 =this.signatureShortMessageCaptchaCacheHelper.validateCacheSignatureShortMessageCaptchaWithFailedTimesCheck(username, requestIp, session.getId(), captchaValue);
			if (!rst1.isSuccess()) {
				return JsonViewHelper.setupAndReturnJsonView(false, rst1.getErrorCode(), rst1.getErrorMsg(), modelMap);

			}
			AccountInfoBean accountInfo = accountInfoBeanProxy.selectLiveByUserCode(username);
			if (accountInfo == null) {
				return JsonViewHelper.setupAndReturnJsonView(false, 20, "账户信息不存在！", modelMap);
			}
			if (accountInfo.getStatus() == 0) {
				return JsonViewHelper.setupAndReturnJsonView(false, 20, "账户已后台锁定！", modelMap);
			}

			// 提供设置新密码业务调用的安全判断使用，防止注入渗透攻击。
			session.setAttribute("username", username);
			BigDecimal accountId = accountInfo.getAccountId();
			session.setAttribute("accountId", accountId);

			boolean success = true;
			int errorCode = 0;
			String errorMsg = "验证手机号码成功！";
			String logDetail = new StringBuilder(128).append("验证手机号码成功，存入session，sessionId：").append(session.getId())
					.append("，username：").append(username).append("，accountId：").append(accountId).append("！")
					.toString();
			systemLogSync.insert(request, thisModuleId, accountId, null, null, 
					(short) (success ? 0 : 1), errorCode, logDetail);
			return JsonViewHelper.setupAndReturnJsonView(success, errorCode, errorMsg, modelMap);

		} catch (Exception ex) {
			logger.error("验证手机号码失败，" + ex.getLocalizedMessage(), ex);
			int errorCode = 2;
			String errorMsg = "系统资源忙，请稍后再试！";
			return JsonViewHelper.setupAndReturnJsonView(false, errorCode, errorMsg, modelMap);

		}

	}

	// 设置新密码的业务调用
	@RequestMapping(value = "/session/json/mobile/weixin/login/retrievePassword/reset")
	public String reset(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "password1", required = false) String password1, HttpServletRequest request,
			HttpSession session, ModelMap modelMap) {
		try {

			final String requestIp = ServletHelper.getIpAddress(request);
			final String requestURI = request.getRequestURI();
			final AccountWeixinBean accountWeixinBean = (AccountWeixinBean) session.getAttribute("accountWeixinBean");

			if (logger.isTraceEnabled()) {
				final BigDecimal entranceId = entranceIdHelper.setupPerfectEntranceId(request);
				String sessionId = session.getId();
				logger.trace("手机微信端设置新密码reset，手机号码username：" + username + "，入参重设密码password：" + password
						+ "，入参重输密码password1：" + password1 + "，客户地址requestIp：" + requestIp + "，访问路径requestURI："
						+ requestURI + "，登录入口entranceId：" + entranceId + "，事务会话sessionId：" + session.getId()
						+ "，会话手机号码username：" + session.getAttribute("username") + "，会话微信记录accountWeixinBean："
						+ JSON.toJSONString(accountWeixinBean) + "，会话登录跳转redirectUrl："
						+ session.getAttribute("redirectUrl") + "。");
			}

			final BigDecimal thisSystemId = systemInfoBeanProxy.selectSystemIdByThisSystemCode();
			final String thisModuleName = "账户密码自助找回";
			final BigDecimal thisModuleId = moduleInfoBeanProxy.selectModuleIdByModuleName(thisModuleName);
			if (StringUtils.isEmpty(username)) {
				return JsonViewHelper.setupAndReturnJsonView(false, 1, "手机号码不能为空！", modelMap);
			}
			if (StringUtils.isEmpty(password)) {
				return JsonViewHelper.setupAndReturnJsonView(false, 1, "密码输入不能为空！", modelMap);
			}
			if (!password.equals(password1)) {
				return JsonViewHelper.setupAndReturnJsonView(false, 1, "两次密码输入不一致！", modelMap);
			}
			final String usernameInSessionAttribute = "username";

			if (!username.equals(session.getAttribute(usernameInSessionAttribute))) {
				return JsonViewHelper.setupAndReturnJsonView(false, 2, "请先验证手机号码！", modelMap);
			}

			final String accountIdInSessionAttribute = "accountId";
			BigDecimal accountId = (BigDecimal) session.getAttribute(accountIdInSessionAttribute);
			Assert.isTrue(accountId != null, "此处有BUG，accountId必须有值！");

			InvokeInfoBean<Integer> rst1 = updateAccountPasswdService
					.resetAccountPasswdByAccountIdAndNewAccountPasswdUsingRetrieve(accountId, password);
			systemLogSync.insert(request, thisModuleId, accountId, null, null, 
					(short) (rst1.isSuccess() ? 0 : 1), rst1.getErrorCode(),
					"账户密码自助找回" + (rst1.isSuccess() ? "成功" : "失败") + "，username：" + username + "。");
			if (rst1.isSuccess()) {
				if (accountWeixinBean != null) {
					InvokeInfoBean<?> rst2 = accountWeixinBindService.bind(accountId, accountWeixinBean.getBindId());
					session.removeAttribute("accountWeixinBean");
				}
				session.removeAttribute(usernameInSessionAttribute);
				session.removeAttribute(accountIdInSessionAttribute);
			}

			return JsonViewHelper.setupAndReturnJsonView(rst1.isSuccess(), rst1.getErrorCode(), rst1.getErrorMsg(),
					modelMap);

		} catch (Exception ex) {
			logger.error("账户找回密码失败，" + ex.getLocalizedMessage(), ex);

			return JsonViewHelper.setupAndReturnJsonView(false, 2, "系统资源忙，请稍后再试！", modelMap);
		}

	}
}
