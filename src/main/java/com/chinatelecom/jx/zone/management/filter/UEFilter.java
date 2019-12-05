package com.chinatelecom.jx.zone.management.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

/**
 * 百度编辑器 废弃
 * 
 * @author Administrator
 * 
 */
public class UEFilter extends OncePerRequestFilter  {
	 
 	public void doFilter(ServletRequest request, ServletResponse response) throws IOException, ServletException {
 		 
 	}

	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain chain)
			throws ServletException, IOException {
		 String url = request.getRequestURI();    
//	     System.out.println(url); 
	     try {  
	            if (url.contains("/controller.jsp")) {  
//	                System.out.println("使用自定义的过滤器");  
	                chain.doFilter(request, response);  
	            } else {  
//	                System.out.println("使用默认的过滤器");  
	                super.doFilter(request, response, chain);
	            }  
	        } catch (Exception e) {  
	            e.printStackTrace();    
	        }    
	}
}
