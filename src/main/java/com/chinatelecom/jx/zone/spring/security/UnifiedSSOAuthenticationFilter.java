package com.chinatelecom.jx.zone.spring.security;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.authentication.AuthenticationDetailsSource;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.GenericFilterBean;

import com.chinatelecom.jx.servlet.ServletHelper;
import com.chinatelecom.jx.util.CryptUtils;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.account.login.log.sync.AccountLoginLogSync;
import com.chinatelecom.jx.zone.account.organization.helper.AccountOrganizationSessionHelper;
import com.chinatelecom.jx.zone.account.organization.module.dao.IAccountOrganizationModuleDao;
import com.chinatelecom.jx.zone.entrance.helper.EntranceIdHelper;
import com.chinatelecom.jx.zone.module.info.proxy.IModuleInfoBeanLookup;
import com.chinatelecom.jx.zone.session.helper.AccountIdSessionHelper;
import com.chinatelecom.jx.zone.session.helper.AuthKindSessionHelper;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanLookup;
import com.chinatelecom.jx.zone.system.log.sync.ISystemLogSync;


/**
 * 统一单点登录
 * 
 * @author ZuoGuangDe
 *
 */
@Component("unifiedSSOAuthenticationFilter")
public class UnifiedSSOAuthenticationFilter extends GenericFilterBean implements InitializingBean {
	private static final Logger logger = LoggerFactory.getLogger(UnifiedSSOAuthenticationFilter.class);
	private AuthenticationDetailsSource<HttpServletRequest, ?> authenticationDetailsSource = new WebAuthenticationDetailsSource();

 
	@Autowired
	private AccountOrganizationSessionHelper accountOrganizationSessionHelper;
	@Autowired
	private AuthKindSessionHelper authKindSessionHelper;		
	
	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper;
	@Autowired
	private EntranceIdHelper entranceIdHelper;
	@Autowired
	private ISystemInfoBeanLookup systemInfoBeanProxy;
	@Autowired
	private IModuleInfoBeanLookup moduleInfoBeanProxy;

	@Autowired
	private IAccountOrganizationModuleDao accountOrganizationModuleDao;

	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;

	@Autowired
	private AccountLoginLogSync accountLoginLogSync;
	@Autowired
	private ISystemLogSync systemLogSync;


	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		final java.util.Date requestTime = new java.util.Date();
		final String requestIp = ServletHelper.getIpAddress(request);
		String userCode = request.getParameter("userCode");
		String accessToken = request.getParameter("accessToken");
		String url = request.getParameter("url");

		if (StringUtils.isEmpty(userCode)) {
			logger.error("单点登录失败，requestIp: " + requestIp + "，传参用户名userCode不能为空！");
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "请求格式不正确，传参用户名userCode不能为空！");
			return;
		}
		if (StringUtils.isEmpty(accessToken)) {
			logger.error("单点登录失败，requestIp: " + requestIp + "，传参时戳accessToken不能为空！");
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "请求格式不正确，传参时戳accessToken不能为空！");
			return;
		}
		if (StringUtils.isEmpty(url)) {
			logger.error("单点登录失败，requestIp: " + requestIp + "，传参跳转url不能为空！");
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "请求格式不正确，传参跳转url不能为空！");
			return;
		}
		
		//@TODO 为快速开发，当前未对accessToken的有效性进行验证。下步需完善accessToken的有效认证，设想通过打通数据交换平台相关接口实现。

		try {
			userCode = CryptUtils.decryptDESede(accessToken, userCode);

		} catch (Exception ex) {
			logger.error("单点登录失败，requestIp: " + requestIp + "，解码传参解码用户名userCode失败，accessToken：" + accessToken
					+ "，userCode：" + userCode + "，" + ex.getLocalizedMessage(), ex);
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "请求格式不正确，，解码传参解码用户名userCode失败！");
			return;
		}

		try {
			url = CryptUtils.decryptDESede(accessToken, url);

		} catch (Exception ex) {
			logger.error(
					"单点登录失败，解码传参跳转url失败，accessToken：" + accessToken + "，url：" + url + "，" + ex.getLocalizedMessage(),
					ex);
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "请求格式不正确，解码传参跳转url失败！");
			return;
		}


		request.setAttribute("userCode", userCode);
		HttpSession session = request.getSession(true);
		final String sessionId = session.getId();
		session.setAttribute("userCode", userCode);

		final String redirectUrl = request.getContextPath() + url;

		AccountInfoBean accountInfo = accountInfoBeanProxy.selectLiveByUserCode(userCode);

		if (accountInfo == null) {			
			logger.warn("用户单点登录失败，userCode：" + userCode + "，，用户信息不存在，重定向页面：" + redirectUrl);
		} else {
			accountInfoBeanProxy.updateLoginTimeByAccountId(accountInfo.getAccountId(), new java.util.Date());

			BigDecimal thisSystemId = systemInfoBeanProxy.selectSystemIdByThisSystemCode();
			BigDecimal thisModuleId = moduleInfoBeanProxy.selectModuleIdByModuleName("单点认证登录");

			authKindSessionHelper.setAuthKindBySessionAttribute(request, Integer.valueOf(9));
 
			BigDecimal entranceId = entranceIdHelper.setupPerfectEntranceId(request);
			// 设置当前用户在Session的entranceId，organizationId，rootId信息。
			accountOrganizationSessionHelper.setSessionAttribute(request, thisSystemId, null,entranceId,
					accountInfo.getAccountId());


			 BigDecimal organizationId =  organizationIdSessionHelper.getOrganizationIdBySessionAttribute();

			BigDecimal rootId = organizationIdSessionHelper.getRootIdBySessionAttribute();

			List<String> moduleNameList = accountOrganizationModuleDao
					.queryModuleUniqueListByAccountIdAndOrganizationIdAndRootIdAndSystemId(accountInfo.getAccountId(),
							null, rootId, thisSystemId);//操作菜单及权限限定到单位展示。


			Collection<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>(10);
			for (String moduleName : moduleNameList) {
				authorities.add(new SimpleGrantedAuthority(moduleName));
			}

			UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(
					accountInfo.getAccountCode(), "UnifiedSSO", authorities);
			auth.setDetails(authenticationDetailsSource.buildDetails(request));

			accountLoginLogSync.insert(thisSystemId, userCode, "UnifiedSSO", (short) 9, requestTime, (short) 0,
					accountInfo.getAccountId(), organizationId, rootId, sessionId,requestIp); // 记录用户登录日志

			systemLogSync.insert(request, thisModuleId, accountInfo.getAccountId(), organizationId, rootId, 
					(short) 0, 0, "用户单点登录成功！"); // 记录系统审计日志

			SecurityContextHolder.getContext().setAuthentication(auth);
			logger.info("用户单点登录成功，userCode：" + userCode + "，重定向页面：" + redirectUrl);

		}
		response.sendRedirect(redirectUrl);
	}

	public void setAuthenticationDetailsSource(
			AuthenticationDetailsSource<HttpServletRequest, ?> authenticationDetailsSource) {
		Assert.notNull(authenticationDetailsSource, "AuthenticationDetailsSource required");
		this.authenticationDetailsSource = authenticationDetailsSource;
	}
}
