package com.chinatelecom.jx.zone.management.login.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.util.ProjectProps;
import com.chinatelecom.jx.zone.management.util.ZoneLoginCryptHelper;

@Controller
public class SingleSigninController extends BaseController{
	
	@RequestMapping(value = "/login/singleSignin/json/getOaUrl")
	public String getOaUrl(){
		try{
			BigDecimal accountId = getCurrentAccountId();
			if(accountId==null){
				accountId = new BigDecimal("1");
			}
			java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
			String timestamp = df.format( new Date());
			
			ZoneLoginCryptHelper helper = new ZoneLoginCryptHelper();
			String userId = helper.encryptor(accountId.toString(), timestamp);
			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("userId", userId);
			paramMap.put("timestamp", timestamp);
			
			String url = new StringBuilder(256)
			.append(ProjectProps.getProp("zw.interface.url"))
			.append("/page/login/validateForTwoNew")
			.append("?userId="+userId+"&timestamp="+timestamp).toString();
			
			return "redirect:"+url;
			
		}catch(Exception ex){
			logger.error("政务单点登录接口调用失败，详细原因："+ex.getMessage(),ex);
		}
		return "";
	}
	
}
