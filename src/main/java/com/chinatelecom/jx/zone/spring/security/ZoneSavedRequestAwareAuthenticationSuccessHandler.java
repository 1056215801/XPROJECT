package com.chinatelecom.jx.zone.spring.security;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import com.alibaba.fastjson.JSONObject;
 
public class ZoneSavedRequestAwareAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	private static final Logger logger = LoggerFactory.getLogger(ZoneSavedRequestAwareAuthenticationSuccessHandler.class);
	
	public ZoneSavedRequestAwareAuthenticationSuccessHandler () {	   
	}
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication) 	throws ServletException, IOException {
		boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (ajax) {
			JSONObject json = new JSONObject();
			json.put("success", true);
			json.put("errorCode", 0);
			json.put("errorMsg", "系统登录验证通过！");
			response.setContentType("application/json");
			try (Writer writer = response.getWriter()) {
				writer.write(json.toJSONString());
				if (logger.isInfoEnabled()) {
					StringBuilder builder = new StringBuilder(1024);
					builder.append("Ajax系统登录验证业务处理执行完毕，requestURI：").append(request.getRequestURI()).append("，requestURL：")
							.append(request.getRequestURL()).append("，response：").append(json.toJSONString())
							.append("。");
					logger.info(builder.toString());
				}
			} 
		} else { //Page跳转方式处理
			super.onAuthenticationSuccess(request, response, authentication);
			if (logger.isInfoEnabled()) {
				StringBuilder builder = new StringBuilder(1024);
				builder.append("Page系统登录验证业务处理执行完毕，requestURI：").append(request.getRequestURI()).append("，requestURL：")
						.append(request.getRequestURL()).append("。");
				logger.info(builder.toString());
			}
		}
	}
}
