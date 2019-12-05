package com.chinatelecom.jx.zone.management.controller.showFront;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinatelecom.jx.util.CryptUtils;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.showLogin.IShowLoginService;
import com.chinatelecom.jx.zone.management.service.showProduct.IshowProductService;

@Controller
public class ShowLoginController extends BaseController {
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private IshowProductService showProductService;
	@Autowired
	private IShowLoginService showLoginService;
	
	private static final Logger logger = LoggerFactory.getLogger(ShowLoginController.class);

	/**
	 * type 1: 产品页面  2：供需页面  3:宜春产品页面  4：宜春供需页面
	 * @param type
	 * @param model
	 * @param request
	 * @return
	 */
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/login/page/show/validate")
	public String validate(
			@RequestParam(value = "type", required = false) Short type,
			@RequestParam(value = "entranceId", required = false) BigDecimal entranceId,
			Model model, HttpServletRequest request) {
		try {
			// 判断企业信息是否完整
			boolean isComplete = showLoginService.isComplete(getCurrentAccountId());
			model.addAttribute("isComplete", isComplete);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		if (type == 1) {
			return "redirect:/front/showProduct/main";
		} else if (type == 2) {
			return "redirect:/showSupply/main";
		} else if (type == 3) {
			return "redirect:/product/list?entranceId="+entranceId;
		} else {
			return "redirect:/supply/list?entranceId="+entranceId;
		}
		
	}
	
	/**
	 * type 1: 产品  2：供需  3:宜春产品页面  4：宜春供需页面
	 * @param type
	 * @param model
	 * @param request
	 * @return
	 */
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/login/page/show/validateLogin")
	public String toXProduction(
			@RequestParam(value = "type", required = false) Short type, 
			@RequestParam(value = "entranceId", required = false) BigDecimal entranceId,
			Model model, HttpServletRequest request) {
		String url = "";
		
		if(type==1||type==3){
			if(entranceId==null){				
				url = "/login/page/showProductInfoTemp/add?isProxy=0&resource=1&type="+type;
			}else{
				url = "/login/page/showProductInfoTemp/add?isProxy=0&resource=1&type="+type+"&entranceId="+entranceId;
			}
		}else if(type==2||type==4){
			if(entranceId==null){	
				url = "/login/page/showSupplyDemandTemp/add?isProxy=0&resource=1&type="+type;
			}else{
				url = "/login/page/showSupplyDemandTemp/add?isProxy=0&resource=1&type="+type+"&entranceId="+entranceId;
			}
		}
		
		StringBuilder builder = new StringBuilder(10240);
		try {
			AccountInfoBean accountInfoBean = accountInfoBeanProxy.selectByPrimaryKey(getCurrentAccountId());

			String userCode = accountInfoBean.getAccountCode();
			String accessToken = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());

			userCode = CryptUtils.encryptDESede(accessToken, userCode);
			url = CryptUtils.encryptDESede(accessToken, url);

			builder.append(showProductService.getProductionUrl2() + "/auth/page/validateUnifiedSSOLogin")
					.append("?userCode=").append(userCode).append("&accessToken=").append(accessToken)
					.append("&url=").append(java.net.URLEncoder.encode(url, "UTF-8"));

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "redirect:" + builder.toString();
	}
}
