package com.chinatelecom.jx.zone.management.login.controller.weixin;

import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.chinatelecom.jx.servlet.ServletHelper;
import com.chinatelecom.jx.spring.util.JsonViewHelper;
import com.chinatelecom.jx.zone.account.bind.bean.AccountBindBean;
import com.chinatelecom.jx.zone.account.bind.proxy.IAccountBindBeanProxy;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.validate.helper.AccountValidateHelper;
import com.chinatelecom.jx.zone.account.weixin.bean.AccountWeixinBean;
import com.chinatelecom.jx.zone.account.weixin.proxy.IAccountWeixinBeanProxy;
import com.chinatelecom.jx.zone.account.weixin.transaction.IAccountWeixinBindService;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.entrance.helper.EntranceIdHelper;
 
/**
 * 手机微信版本Wap登录页面封装微信扫码相关页面逻辑处理
 * 
 * @author ZuoGuangDe
 *
 */
@Controller
public class MobileWeixinLoginController {
	@Autowired
	private IAccountWeixinBeanProxy accountWeixinBeanProxy;
	@Autowired
	private IAccountBindBeanProxy accountBindBeanProxy;

	@Autowired
	private com.chinatelecom.jx.zone.hcode.pt.proxy.IHcodePtValidateProxy hcodePtValidateProxy;
	@Autowired
	private AccountValidateHelper accountValidateHelper;
	@Autowired
	private IAccountWeixinBindService accountWeixinBindService;
	@Autowired
	private EntranceIdHelper entranceIdHelper;
	@Autowired
	private MobileWeixinRegisterController mobileWeixinRegisterController;

	private static final Logger logger = LoggerFactory.getLogger(MobileWeixinLoginController.class);

	// 微信授权用户访问测试链接1
	@RequestMapping(value = "/login/page/mobile/weixin/test1")
	public String test1(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "/mobile/weixin/test1";
	}

	// 微信授权用户访问测试链接2
	@RequestMapping(value = "/login/page/mobile/weixin/test2")
	public String test2(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "/mobile/weixin/test2";
	}

	// 引导微信用户到号码输入页面
	@RequestMapping(value = "/session/page/mobile/weixin/login/index")
	public String index(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "redirectUrl", required = false) String redirectUrl, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model) {

		if (logger.isTraceEnabled()) {
			final BigDecimal entranceId = entranceIdHelper.setupPerfectEntranceId(request);
			final AccountWeixinBean accountWeixinBean = (AccountWeixinBean) session.getAttribute("accountWeixinBean"); // 如果有值，则值是通过MobileWeixinOpenFilter业务处理后进行设置。
			logger.trace("引导手机端微信用户到号码输入页面，入参手机号码username：" + username + "，入参登录跳转redirectUrl：" + redirectUrl
					+ "，客户地址requestIp：" + ServletHelper.getIpAddress(request) + "，访问路径requestURI："
					+ request.getRequestURI() + "，登录入口entranceId：" + entranceId + "，事务会话sessionId：" + session.getId()
					+ "，会话手机号码username：" + session.getAttribute("username") + "，会话微信记录accountWeixinBean："
					+ JSON.toJSONString(accountWeixinBean) + "，会话登录跳转redirectUrl：" + session.getAttribute("redirectUrl")
					+ "。");
		}

		if (!StringUtils.isEmpty(username)) {
			session.setAttribute("username", username); // 存到访问会话中，以备后续相关功能使用。
		}

		if (!StringUtils.isEmpty(redirectUrl)) {
			session.setAttribute("redirectUrl", redirectUrl); // 存到访问会话中，已被后续登录认证表单提交时可以填值。
		}

		//model.addAttribute("entranceId", entranceId);
		return "/mobile/weixin/login/weixinLogin";
	}

	// 验证微信号与手机号码
	@RequestMapping(value = "/session/page/mobile/weixin/login/phoneVerification")
	public String phoneVerification(@RequestParam(value = "username", required = false) String username,
			HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
			throws ServletException, IOException {

		if (logger.isTraceEnabled()) {
			final BigDecimal entranceId = entranceIdHelper.setupPerfectEntranceId(request);
			final AccountWeixinBean accountWeixinBean = (AccountWeixinBean) session.getAttribute("accountWeixinBean"); // 如果有值，则值是通过MobileWeixinOpenFilter业务处理后进行设置。

			logger.trace("手机微信端验证手机号码phoneVerification，入参手机号码username：" + username + "，客户地址requestIp："
					+ ServletHelper.getIpAddress(request) + "，访问路径requestURI：" + request.getRequestURI()
					+ "，登录入口entranceId：" + entranceId + "，事务会话sessionId：" + session.getId() + "，会话手机号码username："
					+ session.getAttribute("username") + "，会话微信记录accountWeixinBean："
					+ JSON.toJSONString(accountWeixinBean) + "，会话登录跳转redirectUrl：" + session.getAttribute("redirectUrl")
					+ "。");
		}
		if (StringUtils.isEmpty(username)) {
			BadCredentialsException se = new BadCredentialsException("手机号码不能为空！");
			model.addAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, se);
			return index(username, null, request, response, session, model); // 返回到号码绑定页面，显示相关错误。
		}
		if (hcodePtValidateProxy.queryOperatorGate(username) == null) {
			BadCredentialsException se = new BadCredentialsException("手机号码格式不正确！");
			model.addAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, se);
			return index(username, null, request, response, session, model); // 返回到号码绑定页面，显示相关错误。
		}

		AccountBindBean accountBindBean = accountBindBeanProxy.selectBySystemIdAndOpenId(BigDecimal.valueOf(-1),
				username);
		if (accountBindBean == null) { // 手机号码未绑定
			return mobileWeixinRegisterController.index(username, null, request, session, model);
		}
		// 手机号码已绑定，引导到微信绑定页面。
		session.setAttribute("username", username);

		return "/mobile/weixin/login/phoneVerification";

	}

	// 验证微信账号绑定。
	@RequestMapping(value = "/session/json/mobile/weixin/login/bind")
	public String bind(@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "password", required = true) String password, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model) {

		String requestIp = ServletHelper.getIpAddress(request);
		
		// 如果有值，用户通过微信到微门户的OAuth免登录协议进行访问的，值是通过MobileWeixinOpenFilter业务处理后进行设置。
		final AccountWeixinBean accountWeixinBean = (AccountWeixinBean) session.getAttribute("accountWeixinBean"); 
		// if (accountWeixinBean == null) {
		// return JsonViewHelper.setupAndReturnJsonView(false, 20,
		// "绑定失败，账户微信信息不存在！", model);
		// }
		String sessionId = session.getId();

		if (logger.isTraceEnabled()) {
			final BigDecimal entranceId = entranceIdHelper.setupPerfectEntranceId(request);
			logger.trace("验证微信账号绑定bind，入参手机号码username：" + username + "，入参账户密码password：" + password + "，客户地址requestIp："
					+ ServletHelper.getIpAddress(request) + "，访问路径requestURI：" + request.getRequestURI()
					+ "，登录入口entranceId：" + entranceId + "，事务会话sessionId：" + sessionId + "，会话手机号码username："
					+ session.getAttribute("username") + "，会话微信记录accountWeixinBean："
					+ JSON.toJSONString(accountWeixinBean) + "，会话登录跳转redirectUrl：" + session.getAttribute("redirectUrl")
					+ "。");
		}

		try {

			InvokeInfoBean<AccountInfoBean> rst = accountValidateHelper.interactiveAccountValidate(username, password,
					0, null, requestIp, sessionId);
			if (!rst.isSuccess()) {
				return JsonViewHelper.setupAndReturnJsonView(false, rst.getErrorCode(), "绑定失败，" + rst.getErrorMsg(),
						model);
			}

			if (accountWeixinBean != null) {
				InvokeInfoBean<?> rst1 = accountWeixinBindService.bind(rst.getValue().getAccountId(),
						accountWeixinBean.getBindId());
				if (!rst1.isSuccess()) {
					return JsonViewHelper.setupAndReturnJsonView(false, rst1.getErrorCode(),
							"绑定失败，" + rst1.getErrorMsg(), model);
				}
			}
			return JsonViewHelper.setupAndReturnJsonView(true, 0, "绑定成功!", model);
		} catch (Exception ex) {
			String errorMsg = "绑定账户失败，手机号码username：" + username + "，账户密码password：" + password + "，"
					+ ex.getLocalizedMessage();
			logger.error(errorMsg, ex);
			return JsonViewHelper.setupAndReturnJsonView(false, 2, "绑定失败，" + ex.getLocalizedMessage(), model);
		}

	}
}
