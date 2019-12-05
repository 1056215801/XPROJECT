package com.chinatelecom.jx.zone.spring.security;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import com.alibaba.fastjson.JSONObject;

public class ZoneSimpleUrlAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler{

	public ZoneSimpleUrlAuthenticationFailureHandler() {
		super();
	}
	

	public ZoneSimpleUrlAuthenticationFailureHandler(String defaultFailureUrl) {
		super(defaultFailureUrl);
	}

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (ajax) {
			JSONObject json = new JSONObject();
			json.put("success", false);
			json.put("errorCode", 2);
			json.put("errorMsg", exception.getLocalizedMessage());
			json.put("login", false);
			response.setContentType("application/json");
			try (Writer writer = response.getWriter()) {
				writer.write(json.toJSONString());
				if (logger.isInfoEnabled()) {
					StringBuilder builder = new StringBuilder(1024);
					builder.append("Ajax系统登录验证业务处理执行完毕，requestURI：").append(request.getRequestURI()).append("，requestURL：")
							.append(request.getRequestURL()).append("，response：").append(json.toJSONString())
							.append("。");
					logger.info(builder.toString(),exception);
				}
			} 
		} else { //Page跳转方式处理
			super.onAuthenticationFailure(request, response, exception);
			if (logger.isInfoEnabled()) {
				StringBuilder builder = new StringBuilder(1024);
				builder.append("Page系统登录验证业务处理执行完毕，requestURI：").append(request.getRequestURI()).append("，requestURL：")
						.append(request.getRequestURL()).append("。");
				logger.info(builder.toString(),exception);
			}
		}
	}

}
