package com.chinatelecom.jx.zone.spring.security;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;

import com.alibaba.fastjson.JSONObject;

public class ZoneLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {

	private static final Logger logger = LoggerFactory.getLogger(ZoneLogoutSuccessHandler.class);

	private String json;
 

	public void initialize() {
		JSONObject js = new JSONObject();
		js.put("success", true);
		js.put("errorCode", 0);
		js.put("errorMsg", "您已成功登出系统！");
		json = js.toJSONString();
		logger.info("ZoneLogoutSuccessHandler初始化完毕！");
	}

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
	
		
	
		boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (logger.isDebugEnabled()) {
			logger.debug("账号成功登出系统，ajax：" + ajax + "。");
		}
		if (ajax) {
			response.setContentType("application/json");
			try (Writer writer = response.getWriter()) {
				writer.write(json);
			}
		} else {
			super.onLogoutSuccess(request, response, authentication);
		}
		HttpSession session = request.getSession(false);
		if (session != null) {
			String sessionId  = session.getId();
			session.invalidate();
			if (logger.isDebugEnabled()) {
				logger.debug("账号登录会话Session已经清除，sessionId：" + sessionId + "！");
			}
		}

	}
}
