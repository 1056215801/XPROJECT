package com.chinatelecom.jx.zone.management.controller.ldDataCenter;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.controller.cityDataCenter.common.CommonCityDataCenterController;

@Controller
public class LdDataCenterController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(CommonCityDataCenterController.class);

	/**
	 * 首页
	 */
	@RequestMapping(value = "/front/ldDataCenter/index/{page}")
	public String index(
			@PathVariable(value = "page") int page, 
			@RequestParam(value = "type", required = false) Integer type, 
			@RequestParam(value = "id", required = false) BigDecimal id, 
			@RequestParam(value = "typeId", required = false) BigDecimal typeId, 
			@RequestParam(value = "typeName", required = false) String typeName, 
			HttpServletRequest request, Model model) {
		try {
			//final String OfficeUrl = "https://test.inpark.com.cn/";
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("type", type);
			model.addAttribute("typeId", typeId);
			model.addAttribute("typeName", typeName);
			model.addAttribute("id", id);
			model.addAttribute("page", page);
			if(isLogin()){
				model.addAttribute("isLogin", 1);
				model.addAttribute("accountName", this.getCurrentAccountName());
			}else{
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			switch (page) {
			case 1:
				return "front/ldDataCenter/ldIndex1";
			case 2:
				return "front/ldDataCenter/ldIndex2";
			case 3:
				return "front/ldDataCenter/ldIndex3";
			case 4:
				return "front/ldDataCenter/ldIndex4";
			case 5:
				return "front/ldDataCenter/ldIndex5";
			case 6:
				return "front/ldDataCenter/ldIndex6";
			case 7:
				return "front/ldDataCenter/companyMap";
			case 8:
				return "front/ldDataCenter/ldIndex8";
			case 9:
				return "front/ldDataCenter/ldIndex9";
			default:
				return "redirect:/error/404";
			}

		} catch (Exception e) {
			logger.error("【市级数据中心】index方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}

	}
}
