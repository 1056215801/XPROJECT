package com.chinatelecom.jx.zone.spring.security;

import java.math.BigDecimal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.rememberme.AbstractRememberMeServices;
import org.springframework.security.web.authentication.rememberme.InvalidCookieException;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSON;
import com.chinatelecom.jx.util.CryptUtils;
import com.chinatelecom.jx.zone.session.helper.AccountIdSessionHelper;
import com.chinatelecom.jx.zone.session.helper.AuthKindSessionHelper;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;

//cookie: 'username:accountId:entranceId:rootId:organizationId:spaceId:areaId:provinceId:expireTime:md5Hex(username:accountId:entranceId:rootId:organizationId:expireTime:password:key)'

public class ZoneTokenBasedRememberMeServices extends AbstractRememberMeServices {
	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper;
	
	@Autowired
	private AccountIdSessionHelper accountIdSessionHelper;
	
	@Autowired
	private AuthKindSessionHelper authKindSessionHelper;	
	
	
	private static final Logger logger = LoggerFactory.getLogger(ZoneTokenBasedRememberMeServices.class);

	
	public ZoneTokenBasedRememberMeServices(String key, UserDetailsService userDetailsService) {
		super(key, userDetailsService);
	}

	// ~ Methods
	// ========================================================================================================

	@Override
	protected UserDetails processAutoLoginCookie(String[] cookieTokens, HttpServletRequest request,
			HttpServletResponse response) {

		
		if (cookieTokens.length != 10) {
			StringBuilder builder = new StringBuilder(386);
			builder.append("Cookie票据格式不正确，正确格式为")
			.append("'username:accountId:entranceId:rootId:organizationId:spaceId:areaId:provinceId:expireTime:md5Hex(username:accountId:entranceId:rootId:organizationId:spaceId:areaId:provinceId:expireTime:password:key)'")
			.append("，错误数据为：").append(JSON.toJSONString(cookieTokens)).append("！");			
			throw new InvalidCookieException(builder.toString());
		}
		final String username = cookieTokens[0];

		
		BigDecimal accountId = null;
		try {
			accountId = new BigDecimal(cookieTokens[1]);
		} catch (NumberFormatException nfe) {
			throw new InvalidCookieException("Cookie票据第二项内容用户账户accountId取值格式错误，错误内容：" + cookieTokens[1] + "！");
		}
		
		
		BigDecimal entranceId = null;
		try {
			entranceId = new BigDecimal(cookieTokens[2]);
		} catch (NumberFormatException nfe) {
			throw new InvalidCookieException("Cookie票据第三项内容网站入口entranceId取值格式错误，错误内容：" + cookieTokens[2] + "！");
		}

		BigDecimal rootId = null;
		try {
			rootId = new BigDecimal(cookieTokens[3]);
		} catch (NumberFormatException nfe) {
			throw new InvalidCookieException("Cookie票据第四项内容归属单位rootId取值格式错误，错误内容：" + cookieTokens[3] + "！");
		}
		BigDecimal organizationId = null;
		try {
			organizationId = new BigDecimal(cookieTokens[4]);
		} catch (NumberFormatException nfe) {
			throw new InvalidCookieException("Cookie票据第五项内容所属部门organizationId取值格式错误，错误内容：" + cookieTokens[4] + "！");
		}
		BigDecimal spaceId = null;
		try {
			spaceId = new BigDecimal(cookieTokens[5]);
		} catch (NumberFormatException nfe) {
			throw new InvalidCookieException("Cookie票据第六项内容所属县区spaceId取值格式错误，错误内容：" + cookieTokens[5] + "！");
		}		
		
		BigDecimal areaId = null;
		try {
			areaId = new BigDecimal(cookieTokens[6]);
		} catch (NumberFormatException nfe) {
			throw new InvalidCookieException("Cookie票据第七项内容所属地市areaId取值格式错误，错误内容：" + cookieTokens[6] + "！");
		}			

		BigDecimal provinceId = null;
		try {
			provinceId = new BigDecimal(cookieTokens[7]);
		} catch (NumberFormatException nfe) {
			throw new InvalidCookieException("Cookie票据第八项内容所属地市provinceId取值格式错误，错误内容：" + cookieTokens[7] + "！");
		}	
		
		long tokenExpiryTime = 0L;
		try {
			tokenExpiryTime = new Long(cookieTokens[8]).longValue();
		} catch (NumberFormatException nfe) {
			throw new InvalidCookieException("Cookie票据第九项内容有效时间tokenExpiryTime取值格式错误，错误内容：" + cookieTokens[8] + "！");
		}

		if (isTokenExpired(tokenExpiryTime)) {
			throw new InvalidCookieException("Cookie票据第九项内容有效时间tokenExpiryTime已经过期，过期时间为'" + new Date(tokenExpiryTime)
					+ "'，当前时间为 '" + new Date() + "'！");
		}
		
		authKindSessionHelper.setAuthKindBySessionAttribute(request, Integer.valueOf(10));
		
		
		accountIdSessionHelper.setAccountIdBySessionAttribute(request, accountId);
		organizationIdSessionHelper.setEntranceIdBySessionAttribute(request, entranceId);
		organizationIdSessionHelper.setRootIdBySessionAttribute(request, rootId);
		organizationIdSessionHelper.setOrganizationIdBySessionAttribute(request, organizationId);
		organizationIdSessionHelper.setSpaceIdBySessionAttribute(request,spaceId);
		organizationIdSessionHelper.setAreaIdBySessionAttribute(request, areaId);
		organizationIdSessionHelper.setProvinceIdBySessionAttribute(request, provinceId);
		

		UserDetails userDetails = getUserDetailsService().loadUserByUsername(username);
		
		
		

		String expectedTokenSignature = makeTokenSignature(accountId,entranceId,rootId,organizationId,spaceId,areaId,provinceId,tokenExpiryTime, userDetails.getUsername(),
				userDetails.getPassword());
		String tokenSignature = cookieTokens[9];

		if (!expectedTokenSignature.equals(tokenSignature)) {
			throw new InvalidCookieException("Cookie票据校验失败，Cookie票据第十项内容签名为'" + tokenSignature
					+ "'，但是计算签名为 '" + expectedTokenSignature + "'！");
		}

		return userDetails;
	}

	/**
	 * Calculates the digital signature to be put in the cookie. Default value
	 * is md5Hex(username:entranceId:rootId:organizationId:expireTime:password:key)
	 */
	protected String makeTokenSignature(BigDecimal accountId,BigDecimal entranceId,BigDecimal rootId,BigDecimal organizationId,BigDecimal spaceId,BigDecimal areaId,BigDecimal provinceId, long tokenExpiryTime, String username, String password) {
		String data = username  + ":" + accountId.toPlainString() + ":" + entranceId.toPlainString() + ":" + rootId.toPlainString() + ":" + organizationId.toPlainString() + 
				":" + spaceId.toPlainString() + ":" + areaId.toPlainString() + ":" + provinceId.toPlainString() + 
				":" +  tokenExpiryTime + ":" + password + ":" + getKey();
		return CryptUtils.md5(data);
	}

	protected boolean isTokenExpired(long tokenExpiryTime) {
		return tokenExpiryTime < System.currentTimeMillis();
	}

	@Override
	public void onLoginSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication successfulAuthentication) {

		String username = retrieveUserName(successfulAuthentication);
		String password = retrievePassword(successfulAuthentication);

		// If unable to find a username and password, just abort as
		// TokenBasedRememberMeServices is
		// unable to construct a valid token in this case.
		if (!StringUtils.hasLength(username)) {
			logger.debug("Unable to retrieve username");
			return;
		}

		if (!StringUtils.hasLength(password)) {
			UserDetails user = getUserDetailsService().loadUserByUsername(username);
			password = user.getPassword();

			if (!StringUtils.hasLength(password)) {
				logger.debug("Unable to obtain password for user: " + username);
				return;
			}
		}
		
		BigDecimal accountId = accountIdSessionHelper.getAccountIdBySessionAttribute(request);
		
		BigDecimal entranceId = organizationIdSessionHelper.getEntranceIdBySessionAttribute(request);
		BigDecimal rootId = organizationIdSessionHelper.getRootIdBySessionAttribute(request);
		BigDecimal organizationId = organizationIdSessionHelper.getOrganizationIdBySessionAttribute(request);
		BigDecimal spaceId = organizationIdSessionHelper.getSpaceIdBySessionAttribute(request);
		BigDecimal areaId = organizationIdSessionHelper.getAreaIdBySessionAttribute(request);
		BigDecimal provinceId = organizationIdSessionHelper.getProvinceIdBySessionAttribute(request);

		int tokenLifetime = calculateLoginLifetime(request, successfulAuthentication);
		long expiryTime = System.currentTimeMillis();
		// SEC-949
		expiryTime += 1000L * (tokenLifetime < 0 ? TWO_WEEKS_S : tokenLifetime);

		String signatureValue = makeTokenSignature(accountId,entranceId,rootId,organizationId,spaceId,areaId,provinceId,expiryTime, username, password);
	

		setCookie(new String[] { username, accountId.toPlainString(),entranceId.toPlainString(),rootId.toPlainString(),organizationId.toPlainString(),
				spaceId.toPlainString(),areaId.toPlainString(),provinceId.toPlainString(),
				Long.toString(expiryTime), signatureValue }, tokenLifetime, request,
				response);

		if (logger.isDebugEnabled()) {
			logger.debug(
					"Added remember-me cookie for user '" + username + "', expiry: '" + new Date(expiryTime) + "'");
		}
	}

	/**
	 * Calculates the validity period in seconds for a newly generated
	 * remember-me login. After this period (from the current time) the
	 * remember-me login will be considered expired. This method allows
	 * customization based on request parameters supplied with the login or
	 * information in the <tt>Authentication</tt> object. The default value is
	 * just the token validity period property, <tt>tokenValiditySeconds</tt>.
	 * <p>
	 * The returned value will be used to work out the expiry time of the token
	 * and will also be used to set the <tt>maxAge</tt> property of the cookie.
	 *
	 * See SEC-485.
	 *
	 * @param request
	 *            the request passed to onLoginSuccess
	 * @param authentication
	 *            the successful authentication object.
	 * @return the lifetime in seconds.
	 */
	protected int calculateLoginLifetime(HttpServletRequest request, Authentication authentication) {
		return getTokenValiditySeconds();
	}

	protected String retrieveUserName(Authentication authentication) {
		if (isInstanceOfUserDetails(authentication)) {
			return ((UserDetails) authentication.getPrincipal()).getUsername();
		} else {
			return authentication.getPrincipal().toString();
		}
	}

	protected String retrievePassword(Authentication authentication) {
		if (isInstanceOfUserDetails(authentication)) {
			return ((UserDetails) authentication.getPrincipal()).getPassword();
		} else {
			if (authentication.getCredentials() == null) {
				return null;
			}
			return authentication.getCredentials().toString();
		}
	}


	
	private boolean isInstanceOfUserDetails(Authentication authentication) {
		return authentication.getPrincipal() instanceof UserDetails;
	}

}
