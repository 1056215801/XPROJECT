package com.chinatelecom.jx.zone.spring.security;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.LoggerFactory;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.web.session.SessionInformationExpiredEvent;
import org.springframework.security.web.session.SessionInformationExpiredStrategy;
import org.springframework.security.web.session.SimpleRedirectSessionInformationExpiredStrategy;

import com.alibaba.fastjson.JSONObject;

public class ZoneSessionInformationExpiredStrategy implements SessionInformationExpiredStrategy{
	

	private SimpleRedirectSessionInformationExpiredStrategy simpleRedirectSessionInformationExpiredStrategy;
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(ZoneSessionInformationExpiredStrategy.class);

	public ZoneSessionInformationExpiredStrategy(
			SimpleRedirectSessionInformationExpiredStrategy simpleRedirectSessionInformationExpiredStrategy) {
		this.simpleRedirectSessionInformationExpiredStrategy = simpleRedirectSessionInformationExpiredStrategy;
	}

	
	@Override
	public void onExpiredSessionDetected(SessionInformationExpiredEvent event) throws IOException, ServletException {
		HttpServletRequest request = event.getRequest();
		HttpServletResponse response = event.getResponse();
		//SessionInformation info = event.getSessionInformation();
		
		boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (ajax) {
			response.setContentType("application/json");
			try (Writer writer = response.getWriter()) {
				JSONObject json = new JSONObject();
				json.put("success", false);
				json.put("errorCode", 2);
				json.put("errorMsg","业务提交请求失败，用户会话已过期！");
				json.put("logout", "expire");
				String js = json.toJSONString();
				writer.write(js);
				if (logger.isWarnEnabled()) {
					StringBuilder builder = new StringBuilder(1024);
					builder.append("Ajax访问会话超期处理执行完毕，requestURI：").append(request.getRequestURI()).append("，requestURL：")
							.append(request.getRequestURL()).append("，response：").append(js)
							.append("！");
					logger.warn(builder.toString());
				}
			}
		} else {
			simpleRedirectSessionInformationExpiredStrategy.onExpiredSessionDetected(event);
		}
		
	}

}
