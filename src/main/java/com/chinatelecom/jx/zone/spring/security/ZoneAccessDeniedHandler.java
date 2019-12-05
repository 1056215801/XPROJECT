package com.chinatelecom.jx.zone.spring.security;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;

import com.alibaba.fastjson.JSONObject;

public class ZoneAccessDeniedHandler extends AccessDeniedHandlerImpl implements InitializingBean{
	private static final Logger logger = LoggerFactory.getLogger(ZoneAccessDeniedHandler.class);

    public void afterPropertiesSet() {
		logger.info("ZoneAccessDeniedHandler初始化完毕！");		
    }

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {	 
		
		boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (ajax) {
			response.setContentType("application/json");
			try (Writer writer = response.getWriter()) {
				JSONObject json = new JSONObject();
				json.put("success", false);
				json.put("errorCode", 2);
				StringBuilder builder = new StringBuilder(128);
				builder.append("业务提交请求失败，").append(accessDeniedException.getLocalizedMessage());
				json.put("errorMsg",builder.toString());
				String js = json.toJSONString();
				writer.write(js);
				if (logger.isWarnEnabled()) {
					builder = new StringBuilder(1024);
					builder.append("Ajax访问拒绝业务处理执行完毕，requestURI：").append(request.getRequestURI()).append("，requestURL：")
							.append(request.getRequestURL()).append("，response：").append(js)
							.append("，exception：").append(accessDeniedException.getLocalizedMessage());
					logger.warn(builder.toString(), accessDeniedException);
				}
			}

		} else {	
			super.handle(request, response, accessDeniedException);			
			if (logger.isWarnEnabled()) {
				StringBuilder builder = new StringBuilder(1024);
				builder.append("Page访问拒绝业务处理执行完毕，requestURI：").append(request.getRequestURI()).append("，requestURL：")
						.append(request.getRequestURL()).append("，exception：").append(accessDeniedException.getLocalizedMessage());
				logger.warn(builder.toString(), accessDeniedException);
			}
		}
	}
}
