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

import com.alibaba.fastjson.JSON;
import com.chinatelecom.jx.servlet.ServletHelper;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.account.login.log.sync.AccountLoginLogSync;
import com.chinatelecom.jx.zone.account.organization.helper.AccountOrganizationSessionHelper;
import com.chinatelecom.jx.zone.account.organization.module.dao.IAccountOrganizationModuleDao;
import com.chinatelecom.jx.zone.account.weixin.bean.AccountWeixinBean;
import com.chinatelecom.jx.zone.account.weixin.proxy.IAccountWeixinBeanProxy;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;

import com.chinatelecom.jx.zone.entrance.config.info.bean.EntranceConfigInfoBean;
import com.chinatelecom.jx.zone.entrance.config.info.proxy.IEntranceConfigInfoBeanProxy;
import com.chinatelecom.jx.zone.entrance.helper.EntranceIdHelper;
import com.chinatelecom.jx.zone.module.info.proxy.IModuleInfoBeanLookup;

import com.chinatelecom.jx.zone.session.helper.AccountIdSessionHelper;
import com.chinatelecom.jx.zone.session.helper.AuthKindSessionHelper;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanLookup;
import com.chinatelecom.jx.zone.system.log.sync.ISystemLogSync;
import com.chinatelecom.jx.zone.weixin.sns.UserInfoApi;
import com.chinatelecom.jx.zone.weixin.sns.UserInfoApiResult;
import com.chinatelecom.jx.zone.weixin.sns.oauth2.AccessTokenApiResult;

/**
 * 免鉴权微信认证访问
 * 
 * @author ZuoGuangDe
 *
 */
@Component("mobileWeixinOpenFilter")
public class MobileWeixinOpenFilter extends GenericFilterBean implements InitializingBean {
	private static final Logger logger = LoggerFactory.getLogger(MobileWeixinOpenFilter.class);
	private AuthenticationDetailsSource<HttpServletRequest, ?> authenticationDetailsSource = new WebAuthenticationDetailsSource();

	@Autowired
	private AccountIdSessionHelper accountIdSessionHelper;
	@Autowired
	private AccountOrganizationSessionHelper accountOrganizationSessionHelper;
	
	@Autowired
	private AuthKindSessionHelper authKindSessionHelper;	
	
	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper;
	@Autowired
	private IEntranceConfigInfoBeanProxy entranceConfigInfoBeanProxy;
	@Autowired
	private EntranceIdHelper entranceIdHelper;

	@Autowired
	private ISystemInfoBeanLookup systemInfoBeanProxy;
	@Autowired
	private IModuleInfoBeanLookup moduleInfoBeanProxy;

	@Autowired
	private IAccountOrganizationModuleDao accountOrganizationModuleDao;

	@Autowired
	private IAccountWeixinBeanProxy accountWeixinBeanProxy;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;

	@Autowired
	private AccountLoginLogSync accountLoginLogSync;
	@Autowired
	private ISystemLogSync systemLogSync;

	public MobileWeixinOpenFilter() {

	}

	// ~ Methods
	// ========================================================================================================

	@Override
	public void afterPropertiesSet() {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

		if (SecurityContextHolder.getContext().getAuthentication() == null) {

			setupAuthentication((HttpServletRequest) req, (HttpServletResponse) res);

		}
		chain.doFilter(req, res);
	}
	
	private final static int AUTH_OK = 0; //认证成功
	private final static int AUTH_FAILED = 1; //认证失败
	private final static int AUTH_EXCEPTION = -1; //认证异常

	/**
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public int setupAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final java.util.Date requestTime = new java.util.Date();
		final String requestIp = ServletHelper.getIpAddress(request);
		final HttpSession session = request.getSession(true);
		final String sessionId = session.getId();
		final BigDecimal entranceId = entranceIdHelper.setupPerfectEntranceId(request);

		final String code = request.getParameter("code");
		if (logger.isTraceEnabled()) {
			logger.trace("获取微信Auth认证传参code：" + code);
		}
		if (StringUtils.isEmpty(code)) {
			StringBuilder builder = new StringBuilder(512);
			builder.append("免鉴权微信认证访问异常，微信Auth认证传参code不能为空，requestIp：").append(requestIp).append("，requestURI：")
					.append(request.getRequestURI()).append("！");
			logger.warn(builder.toString());
			return AUTH_EXCEPTION;
		}

		EntranceConfigInfoBean config = entranceConfigInfoBeanProxy.selectByPrimaryKey(entranceId);
		if (config == null) {
			StringBuilder builder = new StringBuilder(512);
			builder.append("免鉴权微信认证访问失败,t_entrance_config_info表没有entrance_id = ").append(entranceId).append("记录！");
			logger.error(builder.toString());
			return AUTH_EXCEPTION;
		}
		// 腾讯微信公众平台AppId
		final String appId = config.getWeixinOpnAppId();
		// 腾讯微信公众平台AppSecret
		final String appSecret = config.getWeixinOpnAppSecret();

		AccessTokenApiResult rst1 = com.chinatelecom.jx.zone.weixin.sns.oauth2.AccessTokenApi.invoking(appId, appSecret,
				code, "authorization_code");

		final String openId = rst1.getOpenid();
		final String accessToken = rst1.getAccess_token();
		if (StringUtils.isEmpty(openId) || StringUtils.isEmpty(accessToken)) {
			StringBuilder builder = new StringBuilder(512);
			builder.append("免鉴权微信认证访问失败，调用调用微信公共账号能力服务->AccessTokenApi接口失败，appId：").append(appId).append("，appSecret")
					.append(appSecret).append("，code：").append(code).append("，应答消息AccessTokenApiResult：")
					.append(JSON.toJSONString(rst1)).append("！");
			logger.error(builder.toString());
			return AUTH_EXCEPTION;
		} else if (logger.isTraceEnabled()) {
			StringBuilder builder = new StringBuilder(128);
			builder.append("调用微信公共账号能力服务->AccessTokenApi接口结束，appId：").append(appId).append("，appSecret")
					.append(appSecret).append("，code：").append(code).append("，应答消息AccessTokenApiResult：")
					.append(JSON.toJSONString(rst1)).append("！");
			logger.trace(builder.toString());
		}

		UserInfoApiResult rst2 = UserInfoApi.invoking(accessToken, openId, "zh_CN");
		if (!StringUtils.isEmpty(rst2.getErrcode())) {
			StringBuilder builder = new StringBuilder(512);
			builder.append("免鉴权微信认证访问失败，调用调用微信公共账号能力服务->UserInfoApi接口失败，accessToken：").append(accessToken)
					.append("，openId：").append(openId).append("，应答消息UserInfoApiResult：").append(JSON.toJSONString(rst2))
					.append("！");
			logger.error(builder.toString());
			return AUTH_EXCEPTION;
		} else if (logger.isTraceEnabled()) {
			StringBuilder builder = new StringBuilder(128);
			builder.append("调用微信公共账号能力服务->获取UserInfoApi接口结束，accessToken：").append(accessToken).append("，openId：")
					.append(openId).append("，应答消息UserInfoApiResult：").append(JSON.toJSONString(rst2)).append("！");
			logger.trace(builder.toString());
		}

		AccountWeixinBean accountWeixinBean = accountWeixinBeanProxy.selectByOpenIdAndAppId(openId, appId);
		if (accountWeixinBean == null) {

			accountWeixinBean = new AccountWeixinBean();
			accountWeixinBean.setAccountId(BigDecimal.valueOf(-1));
			accountWeixinBean.setOpenId(openId);
			accountWeixinBean.setAppId(appId);
			accountWeixinBean.setNickName(rst2.getNickname());
			accountWeixinBean.setUnionId(rst2.getUnionid());
			accountWeixinBean.setCity(rst2.getCity());
			accountWeixinBean.setProvince(rst2.getProvince());
			accountWeixinBean.setCountry(rst2.getCountry());
			accountWeixinBean.setSex(String.valueOf(rst2.getSex()));
			accountWeixinBean.setSubscribe("0");

			accountWeixinBean.setGroupId(rst2.getGroupId());
			accountWeixinBean.setHeadImgurl(rst2.getHeadimgurl());
			accountWeixinBean.setLanguage("zh_CN");
			accountWeixinBean.setCreateTime(new java.util.Date());
			InvokeInfoBean<Integer> invoke = accountWeixinBeanProxy.validateInsertSelective(accountWeixinBean);
			if (!invoke.isSuccess()) {
				logger.error("免鉴权微信认证访问失败，新增游客账户微信绑定记录失败，accountWeixinBean：" + JSON.toJSONString(accountWeixinBean) + "，invoke："
						+ JSON.toJSONString(invoke));
				return AUTH_EXCEPTION;
			}
 
			StringBuilder builder = new StringBuilder(512);
			builder.append("免鉴权微信认证访问失败，新增游客账户微信绑定记录成功，accountWeixinBean：").append(JSON.toJSONString(accountWeixinBean))
					.append("，invoke：").append(JSON.toJSONString(invoke)).append("，requestURI：")
					.append(request.getRequestURI()).append("；记录相关信息入会话session，sessionId：").append(session.getId())
					.append("。");
			logger.warn(builder.toString());
			
			session.setAttribute("accountWeixinBean", accountWeixinBean);
			return AUTH_FAILED;
		} else {
			accountWeixinBean.setNickName(rst2.getNickname());
			accountWeixinBean.setUnionId(rst2.getUnionid());

			accountWeixinBean.setSex(String.valueOf(rst2.getSex()));
			accountWeixinBean.setCity(rst2.getCity());
			accountWeixinBean.setProvince(rst2.getProvince());
			accountWeixinBean.setCountry(rst2.getCountry());

			accountWeixinBean.setGroupId(rst2.getGroupId());
			accountWeixinBean.setHeadImgurl(rst2.getHeadimgurl());
			InvokeInfoBean<Integer> invoke = accountWeixinBeanProxy
					.validateUpdateByPrimaryKeySelective(accountWeixinBean);
			if (!invoke.isSuccess()) {
				logger.error("更新系统账户微信绑定记录失败，record：" + JSON.toJSONString(accountWeixinBean) + "，invoke："
						+ JSON.toJSONString(invoke));
			}

			if (accountWeixinBean.getAccountId() == null
					|| accountWeixinBean.getAccountId().equals(BigDecimal.valueOf(-1))) {

				StringBuilder builder = new StringBuilder(512);
				builder.append("免鉴权微信认证访问失败，库表账户微信绑定t_account_weixin记录未绑定到账号，accountWeixinBean：")
						.append(JSON.toJSONString(accountWeixinBean)).append("，requestURI：")
						.append(request.getRequestURI()).append("；记录相关信息入会话session，sessionId：").append(session.getId())
						.append("。");
				logger.warn(builder.toString());
				
				session.setAttribute("accountWeixinBean", accountWeixinBean);
				return AUTH_FAILED;
			}
		}

		AccountInfoBean accountInfo = accountInfoBeanProxy.selectByPrimaryKey(accountWeixinBean.getAccountId());
		if (accountInfo == null) {
			StringBuilder builder = new StringBuilder(512);
			builder.append("免鉴权微信认证访问失败，库表账户微信绑定t_account_weixin记录绑定的账号已删除，accountWeixinBean：")
					.append(JSON.toJSONString(accountWeixinBean)).append("，requestURI：").append(request.getRequestURI())
					.append("！");
			logger.warn(builder.toString());
			
			session.setAttribute("accountWeixinBean", accountWeixinBean);
			return AUTH_FAILED;
		}
		if (accountInfo.getStatus() < 1) {
			StringBuilder builder = new StringBuilder(512);
			builder.append("免鉴权微信认证访问失败，库表账户微信绑定t_account_weixin记录绑定的账户不可用，accountWeixinBean：")
					.append(JSON.toJSONString(accountWeixinBean)).append("，accountInfoBean：")
					.append(JSON.toJSONString(accountInfo)).append("，requestURI：").append(request.getRequestURI())
					.append("！");
			logger.warn(builder.toString());
			
			session.setAttribute("accountWeixinBean", accountWeixinBean);
			return AUTH_FAILED;
		}
		
		accountInfoBeanProxy.updateLoginTimeByAccountId(accountWeixinBean.getAccountId(), new java.util.Date());
		BigDecimal thisSystemId = systemInfoBeanProxy.selectSystemIdByThisSystemCode();
		BigDecimal thisModuleId = moduleInfoBeanProxy.selectModuleIdByModuleName("微信透传登录");

		authKindSessionHelper.setAuthKindBySessionAttribute(request, Integer.valueOf(5));
		 
		// 设置当前用户在Session的entranceId，organizationId，rootId信息。
		accountOrganizationSessionHelper.setSessionAttribute(request, thisSystemId, null, entranceId,
				accountInfo.getAccountId());

		
		 BigDecimal organizationId =  organizationIdSessionHelper.getOrganizationIdBySessionAttribute();

		BigDecimal rootId = organizationIdSessionHelper.getRootIdBySessionAttribute();

		List<String> moduleNameList = accountOrganizationModuleDao	
				.queryModuleUniqueListByAccountIdAndOrganizationIdAndRootIdAndSystemId(accountInfo.getAccountId(),
					  null, rootId, thisSystemId); //操作菜单及权限限定到单位展示。

		Collection<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>(10);
		for (String moduleName : moduleNameList) {
			authorities.add(new SimpleGrantedAuthority(moduleName));
		}

		UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(accountInfo.getAccountCode(),
				"WeixinPasswd", authorities);
		auth.setDetails(authenticationDetailsSource.buildDetails(request));

		accountLoginLogSync.insert(thisSystemId, openId, "WeixinAuthProtocol", (short) 5, requestTime, (short) 0,
				accountInfo.getAccountId(), organizationId, entranceId, sessionId,requestIp); // 记录用户登录日志

		systemLogSync.insert(request, thisModuleId, accountIdSessionHelper.getAccountIdBySessionAttribute(request),
				organizationIdSessionHelper.getOrganizationIdBySessionAttribute(request),
				organizationIdSessionHelper.getRootIdBySessionAttribute(request),
				(short) 0, 0, "用户微信访问透传登录成功！"); // 记录系统审计日志

		StringBuilder builder = new StringBuilder(512);
		builder.append("免鉴权微信认证访问成功，openId：").append(openId).append("！");
		logger.info(builder.toString());

		SecurityContextHolder.getContext().setAuthentication(auth);

		return AUTH_OK;
	}
    /*
	public void setAuthenticationDetailsSource(
			AuthenticationDetailsSource<HttpServletRequest, ?> authenticationDetailsSource) {
		Assert.notNull(authenticationDetailsSource, "AuthenticationDetailsSource required");
		this.authenticationDetailsSource = authenticationDetailsSource;
	}
	*/

}
