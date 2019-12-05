package com.chinatelecom.jx.zone.management.controller.cityDataCenter.jx;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinatelecom.jx.zone.management.controller.BaseController;

@Controller
public class JxCityDataCenterController extends BaseController{
	
	
	@RequestMapping(value = "/front/cityDataCenter/jxIndex/{page}")
	public String jxIndex(@PathVariable(value = "page") int page,
			@RequestParam(value = "year", required = false) Integer year,
			@RequestParam(value = "quarter", required = false) Integer quarter,
			@RequestParam(value = "month", required = false) Integer month,
			@RequestParam(value = "orgId", required = false) BigDecimal orgId,
			@RequestParam(value = "parkId", required = false) BigDecimal parkId,
			@RequestParam(value = "parkName", required = false) String parkName,
			@RequestParam(value = "tabIndex", required = false) BigDecimal tabIndex,
			@RequestParam(value = "entranceId", required = false) BigDecimal entranceId,
			@RequestParam(value = "companyId", required = false) BigDecimal companyId,
			HttpServletRequest request, Model model) {
		try {

			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("year", year);
			model.addAttribute("quarter", quarter);
			model.addAttribute("month", month);
			model.addAttribute("orgId", orgId);
			model.addAttribute("page", page);
			model.addAttribute("entranceId", entranceId);
			if(isLogin()){
				model.addAttribute("isLogin", 1);
				model.addAttribute("accountName", this.getCurrentAccountName());
				model.addAttribute("orgId", orgId);
				model.addAttribute("governmentKind", this.getGovernmentKind());
				model.addAttribute("cityId", this.getCurrentAreaIds()[1]);
				model.addAttribute("parkId", this.getCurrentParkId());
				model.addAttribute("orgType", this.getOrganizationType());
			}else{
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			model.addAttribute("entranceId", 1242);
			model.addAttribute("companyId", companyId);
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("tabIndex", tabIndex);
			switch (page) {
			case 1:
				return "front/cityDataCenter/jinx/index";
			case 2:
				return "front/cityDataCenter/jinx/companyPortrait";
			case 3:
				return "front/cityDataCenter/jinx/operationManagement";
			case 4:
				return "front/cityDataCenter/jinx/industrialInvestIndex";
			case 5:
				return "front/cityDataCenter/jinx/productionMonitoring";
			case 6:
				return "front/cityDataCenter/jinx/Infrastructure";
			case 7:
				return "front/cityDataCenter/jinx/emergencyCommand";
			default:
				return "redirect:/error/404";
			}

		} catch (Exception e) {
			logger.error("【发改委级数据中心】jxIndex方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}
}
