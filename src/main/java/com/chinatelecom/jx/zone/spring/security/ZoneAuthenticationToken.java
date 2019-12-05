package com.chinatelecom.jx.zone.spring.security;

import java.math.BigDecimal;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.SpringSecurityCoreVersion;

import com.alibaba.fastjson.annotation.JSONField;

public class ZoneAuthenticationToken extends UsernamePasswordAuthenticationToken {

	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	// ~ Instance fields
	// ==================================================================================================

	private int authKind;
	private int captchaKind;
	private String captchaValue;
	private short entranceKind;
	private BigDecimal entranceValue;
	
	 @JSONField(serialize=false,deserialize=false)
	private HttpServletRequest request;

	// ~ Constructors
	// ===================================================================================================

	/**
	 * This constructor can be safely used by any code that wishes to create a
	 * <code>UsernamePasswordAuthenticationToken</code>, as the
	 * {@link #isAuthenticated()} will return <code>false</code>.
	 *
	 */
	public ZoneAuthenticationToken(Object principal, Object credentials, short entranceKind, BigDecimal entranceValue,
			int authKind, int captchaKind, String captchaValue,HttpServletRequest request) {
		super(principal, credentials);
		setAuthenticated(false);

		this.authKind = authKind;
		this.captchaKind = captchaKind;
		this.captchaValue = captchaValue;

		this.entranceKind = entranceKind;
		this.entranceValue = entranceValue;
		
		this.request = request;

	}

	// ~ Methods
	// ========================================================================================================

	public int getAuthKind() {
		return authKind;
	}

	public int getCaptchaKind() {
		return captchaKind;
	}

	public String getCaptchaValue() {
		return captchaValue;
	}

	public short getEntranceKind() {
		return entranceKind;
	}

	public BigDecimal getEntranceValue() {
		return entranceValue;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

}
