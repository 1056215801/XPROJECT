package com.chinatelecom.jx.zone.spring.security;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.chinatelecom.jx.servlet.ServletHelper;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;

import com.chinatelecom.jx.zone.account.login.helper.InteractiveAccountLoginPasswordHelper;
import com.chinatelecom.jx.zone.account.login.helper.InteractiveAccountLoginRedIpHelper;
import com.chinatelecom.jx.zone.account.login.helper.InteractiveAccountLoginWeixinHelper;
import com.chinatelecom.jx.zone.account.passwd.service.IValidateAccountPasswdService;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;

import com.chinatelecom.jx.zone.entrance.helper.EntranceIdHelper;
import com.chinatelecom.jx.zone.session.helper.AuthKindSessionHelper;


@Component("zoneAuthenticationProvider")
public class ZoneAuthenticationProvider extends AbstractUserDetailsAuthenticationProvider {

	@Autowired
	private UserDetailsService userDetailsService;
	@Autowired
	private InteractiveAccountLoginPasswordHelper interactiveAccountLoginPasswordHelper;

	@Autowired
	private InteractiveAccountLoginWeixinHelper interactiveAccountLoginWeixinHelper;

	
	@Autowired
	private InteractiveAccountLoginRedIpHelper interactiveAccountLoginRedIpHelper;
	
	@Autowired
	private IValidateAccountPasswdService validateAccountPasswdService;

	@Autowired
	private EntranceIdHelper entranceIdHelper;
	
	@Autowired
	private AuthKindSessionHelper authKindSessionHelper;
	


	private static final Logger logger = LoggerFactory.getLogger(ZoneAuthenticationProvider.class);

	@Override
	public void doAfterPropertiesSet() {
		super.setHideUserNotFoundExceptions(false);
	}

	@Override
	protected void additionalAuthenticationChecks(UserDetails userDetails,
			UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
		if (logger.isTraceEnabled()) {
			logger.trace("additionalAuthenticationChecks，userDetails：" + JSON.toJSONString(userDetails)
					+ "，authentication：" + JSON.toJSONString(authentication));
		}
		String storePasswd = userDetails.getPassword();
		String inputPasswd = authentication.getCredentials().toString();

		ZoneAuthenticationToken ztoken = (ZoneAuthenticationToken) authentication;
		int authKind = ztoken.getAuthKind();

		if (authKind >= 0 && authKind <= 1) {
			// 针对密码校验，要再次核实，避免缓存影响。
			boolean rst = validateAccountPasswdService.validateAccountPasswd(inputPasswd, storePasswd);
			if (logger.isTraceEnabled()) {
				StringBuilder builder = new StringBuilder(48);
				builder.append("storePasswd：").append(storePasswd).append("，inputPasswd：").append(inputPasswd)
						.append("，rst：").append(rst).append("。");
				logger.trace(builder.toString());
			}
			if (!rst) {
				throw new BadCredentialsException("用户名或密码错误！");
			}
		}
	}

	@Override
	protected UserDetails retrieveUser(String username, UsernamePasswordAuthenticationToken authentication)
			throws AuthenticationException {
		if (logger.isTraceEnabled()) {
			logger.trace("retrieveUser，username：" + username + "，authentication：" + JSON.toJSONString(authentication));
		}

		ZoneAuthenticationToken ztoken = (ZoneAuthenticationToken) authentication;

		int authKind = ztoken.getAuthKind();
		
		short entranceKind = ztoken.getEntranceKind();
		
		BigDecimal entranceValue = ztoken.getEntranceValue();

		String password = ztoken.getCredentials().toString();

		int captchaKind = ztoken.getCaptchaKind();
		String captchaValue = ztoken.getCaptchaValue();
		HttpServletRequest request = ztoken.getRequest();
		if (entranceValue == null) {
			entranceValue = entranceIdHelper.setupPerfectEntranceId(request);
		}
		
		final String requestIp = ServletHelper.getIpAddress(request);
		final String sessionId = request.getSession(true).getId();
		
		//将账户认证方式基于特定封装记录的会话Session中，以后后续业务获取做特殊处理。
		authKindSessionHelper.setAuthKindBySessionAttribute(request, authKind);

		if (authKind >= 0 && authKind <= 2) { // 账号密码登录
			InvokeInfoBean<AccountInfoBean> rst = interactiveAccountLoginPasswordHelper.interactiveAccountValidate(entranceKind,entranceValue,
					username, password, captchaKind, captchaValue, requestIp, sessionId, request);
			if (logger.isDebugEnabled()) {
				logger.debug("账号密码校验interactiveAccountLoginPasswordHelper.interactiveAccountValidate：" + JSON.toJSONString(rst));
			}
			if (!rst.isSuccess()) {
				if (rst.getErrorCode() < 0) {
					throw new AuthenticationServiceException(rst.getErrorMsg());
				} else {
					switch (rst.getErrorCode()) {
					case 10:
						throw new AccountExpiredException(rst.getErrorMsg());
					case 11:
						throw new LockedException(rst.getErrorMsg());
					case 12:
						throw new DisabledException(rst.getErrorMsg());
						// case 14:
						// throw new
						// UsernameNotFoundException(rst.getErrorMsg());
						// 属性hideUserNotFoundExceptions默认会隐藏UsernameNotFoundException，自动转义
					default:
						throw new BadCredentialsException(rst.getErrorMsg());
					}
				}
			}

		} else if (authKind == 4) { // 微信扫码登录
			InvokeInfoBean<Boolean> rst = interactiveAccountLoginWeixinHelper
					.validateLoginStatus(entranceKind,entranceValue,username, request);
			if (!rst.isSuccess()) {
				throw new AuthenticationServiceException(rst.getErrorMsg());
			}
		} else if (authKind == 8) { //内部红名单Ip登录
			InvokeInfoBean<Boolean> rst = interactiveAccountLoginRedIpHelper.validateLoginStatus(entranceKind,entranceValue, username, request);
			if (!rst.isSuccess()) {
				throw new AuthenticationServiceException(rst.getErrorMsg());
			}
		}
		else {
			throw new BadCredentialsException("不支持的登录方式！");
		}

		return userDetailsService.loadUserByUsername(username);
	}

}
