package com.chinatelecom.jx.zone.spring.security;

import java.math.BigDecimal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.util.Assert;

public class ZoneAuthenticationFilter extends AbstractAuthenticationProcessingFilter {

	public ZoneAuthenticationFilter(RequestMatcher requiresAuthenticationRequestMatcher) {
		super(requiresAuthenticationRequestMatcher);
	}

	// 表单项，默认认证类型参数
	public static final String SPRING_SECURITY_FORM_AUTH_KIND_KEY = "authKind";

	// 表单项 默认用户名参数
	public static final String SPRING_SECURITY_FORM_USERNAME_KEY = "username";

	// 表单项 默认密码参数
	public static final String SPRING_SECURITY_FORM_PASSWORD_KEY = "password";

	// 表单项 默认验证码类型参数
	public static final String SPRING_SECURITY_FORM_CAPTCHA_KIND_KEY = "captchaKind";

	// 表单项 默认验证码取值参数
	public static final String SPRING_SECURITY_FORM_CAPTCHA_VALUE_KEY = "captchaValue";

	// 表单项 默认入口类型参数
	public static final String SPRING_SECURITY_FORM_ENTRANCE_KIND_KEY = "entranceKind";

	// 表单项 默认入口取值参数
	public static final String SPRING_SECURITY_FORM_ENTRANCE_VALUE_KEY = "entranceValue";
    
	// 表单项认证类型参数，可以重定义，当前取值支持（0:账号+绑定手机；1：账号登录；2：手机号码登录；3：自助注册登录，4：微信关于门户网站API的登录；5：微信关于公共账号API的登录；6:企业微信的登录；8；红名单登录；9：单点登录；
	// 11:江西政务网登录；
	private String authKindParameter = SPRING_SECURITY_FORM_AUTH_KIND_KEY;

	// 表单项用户名参数，可以重定义，取值含义联动authKindParameter
	private String usernameParameter = SPRING_SECURITY_FORM_USERNAME_KEY;

	// 表单密码参数，可以重定义。
	private String passwordParameter = SPRING_SECURITY_FORM_PASSWORD_KEY;

	// 表单入口类型参数，可以重定义，当前取值支持（0：统一互联网入口；1：政府入口类型；2：园区入口类型）
	private String entranceKindParameter = SPRING_SECURITY_FORM_ENTRANCE_KIND_KEY;

	// 表单入口取值参数，可以重定义，取值含义联动entranceKindParameter
	private String entranceValueParameter = SPRING_SECURITY_FORM_ENTRANCE_VALUE_KEY;

	// 表单验证码类型参数，可以重定义，当前取值支持（1：图片验证码；2：短信验证码）。
	private String captchaKindParameter = SPRING_SECURITY_FORM_CAPTCHA_KIND_KEY;

	// 表单验证码取值参数，可以重定义，取值含义联动captchaKindParameter
	private String captchaValueParameter = SPRING_SECURITY_FORM_CAPTCHA_VALUE_KEY;

	private boolean postOnly = true;

	private static final Logger logger = LoggerFactory.getLogger(ZoneAuthenticationFilter.class);

	public String getAuthKindParameter() {
		return authKindParameter;
	}

	public void setAuthKindParameter(String authKindParameter) {
		Assert.hasText(authKindParameter, "AuthKind parameter must not be empty or null");
		this.authKindParameter = authKindParameter;
	}

	protected String obtainAuthKind(HttpServletRequest request) {
		return request.getParameter(authKindParameter);
	}

	protected String obtainPassword(HttpServletRequest request) {
		return request.getParameter(passwordParameter);
	}

	protected String obtainUsername(HttpServletRequest request) {
		return request.getParameter(usernameParameter);
	}

	protected void setDetails(HttpServletRequest request, UsernamePasswordAuthenticationToken authRequest) {
		authRequest.setDetails(authenticationDetailsSource.buildDetails(request));
	}

	public void setUsernameParameter(String usernameParameter) {
		Assert.hasText(usernameParameter, "Username parameter must not be empty or null");
		this.usernameParameter = usernameParameter;
	}

	public void setPasswordParameter(String passwordParameter) {
		Assert.hasText(passwordParameter, "Password parameter must not be empty or null");
		this.passwordParameter = passwordParameter;
	}

	public void setPostOnly(boolean postOnly) {
		this.postOnly = postOnly;
	}

	public final String getUsernameParameter() {
		return usernameParameter;
	}

	public final String getPasswordParameter() {
		return passwordParameter;
	}

	public String getEntranceKindParameter() {
		return entranceKindParameter;
	}

	public void setEntranceKindParameter(String entranceKindParameter) {
		Assert.hasText(entranceKindParameter, "EntranceKindParameter parameter must not be empty or null");
		this.entranceKindParameter = entranceKindParameter;
	}

	protected String obtainEntranceKind(HttpServletRequest request) {
		return request.getParameter(entranceKindParameter);
	}

	public String getEntranceValueParameter() {
		return entranceValueParameter;
	}

	public void setEntranceValueParameter(String entranceValueParameter) {
		Assert.hasText(entranceValueParameter, "EntranceValueParameter parameter must not be empty or null");
		this.entranceValueParameter = entranceValueParameter;
	}

	protected String obtainEntranceValue(HttpServletRequest request) {
		return request.getParameter(entranceValueParameter);
	}

	public String getCaptchaKindParameter() {
		return captchaKindParameter;
	}

	public void setCaptchaKindParameter(String captchaKindParameter) {
		Assert.hasText(captchaKindParameter, "CaptchaKind parameter must not be empty or null");
		this.captchaKindParameter = captchaKindParameter;
	}

	protected String obtainCaptchaKind(HttpServletRequest request) {
		return request.getParameter(captchaKindParameter);
	}

	public String getCaptchaValueParameter() {
		return captchaValueParameter;
	}

	public void setCaptchaValueParameter(String captchaValueParameter) {
		Assert.hasText(captchaValueParameter, "CaptchaValue parameter must not be empty or null");
		this.captchaValueParameter = captchaValueParameter;
	}

	protected String obtainCaptchaValue(HttpServletRequest request) {
		return request.getParameter(captchaValueParameter);
	}

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException {
		logger.info("ZoneAuthenticationFilter attemptAuthentication begin !");
		String authKind = obtainAuthKind(request);// 认证类型
		if (logger.isTraceEnabled()) {
			logger.trace("账户登录表单认证类型authKind：" + authKind);
		}
		if (authKind == null) {
			throw new BadCredentialsException("请选择认证类型！");
		}
		
		int authKindValue = -1;
		try {
			authKindValue = Integer.parseInt(authKind);
		} catch (Exception ex) {
			logger.error("错误的认证类型，authKind：" + authKind + "！");
			throw new BadCredentialsException("错误的认证类型！");
		}

		String username = obtainUsername(request); // 用户名
		if (username == null) {
			throw new BadCredentialsException("请输入用户名！");
		}
		username = username.trim();
		
		//if (username.length() < 5) {
		//	throw new BadCredentialsException("用户名输入格式有误！");
	    //}

		if (logger.isTraceEnabled()) {
			logger.trace("账户登录表单用户名username：" + username);
		}

		String password = obtainPassword(request); // 密码
		if (logger.isTraceEnabled()) {
			logger.trace("账户登录表单密码password：" + password);
		}

		if (authKindValue >= 0 && authKindValue <= 2) { // 需要密码校验
			if (password == null) {
				throw new BadCredentialsException("请输入密码！");
			} else {
				password = password.trim();
				if (password.length() < 6) {
					throw new BadCredentialsException("密码输入格式有误！");
				}
			}
		}
		String entranceKind = obtainEntranceKind(request);// 入口类型
		if (logger.isTraceEnabled()) {
			logger.trace("账户登录表单入口类型entranceKind：" + entranceKind);
		}
		if (entranceKind == null) {
			throw new BadCredentialsException("请核实入口类型！");
		} else if (entranceKind.compareTo("0") < 0 || entranceKind.compareTo("2") > 0) {
			throw new BadCredentialsException("未知的入口类型！");
		}

		String entranceValue = obtainEntranceValue(request);// 入口取值
		if (logger.isTraceEnabled()) {
			logger.trace("账户登录表单入口取值entranceValue：" + entranceValue);
		}
		if (entranceValue == null) {
			throw new BadCredentialsException("入口取值未设置！");
		}

		String captchaKind = obtainCaptchaKind(request);// 验证码类型
		if (logger.isTraceEnabled()) {
			logger.trace("账户登录表单验证码类型captchaKind：" + captchaKind);
		}
		if (captchaKind == null) {
			throw new BadCredentialsException("请核实验证码类型！");
		} else if (entranceKind.compareTo("0") < 0 || entranceKind.compareTo("2") > 0) {
			throw new BadCredentialsException("未知的验证码类型！");
		}

		String captchaValue = null;
		if (!captchaKind.equals("0")) { // 需要获取校验验证码
			captchaValue = obtainCaptchaValue(request); // 验证码取值
			if (logger.isTraceEnabled()) {
				logger.trace("账户登录表单验证码取值captchaValue：" + captchaValue);
			}
			if (captchaValue == null) {
				throw new BadCredentialsException("请输入验证码！");
			} else {
				captchaValue = captchaValue.trim();
				if (captchaValue.length() != 4) {
					throw new BadCredentialsException("验证码为4位字符！");
				}
			}
		}

		UsernamePasswordAuthenticationToken authRequest = new ZoneAuthenticationToken(username, password,
				 Short.parseShort(entranceKind), new BigDecimal(entranceValue), Integer.parseInt(authKind),
				Integer.parseInt(captchaKind), captchaValue, request);

		setDetails(request, authRequest);

		return this.getAuthenticationManager().authenticate(authRequest);
	}

}
