package com.chinatelecom.jx.zone.management.controller.recruitment;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinatelecom.jx.zone.hcdy.organization.log.bean.HcdyOrganizationLogBean;
import com.chinatelecom.jx.zone.hcdy.organization.log.service.IHcdyOrganizationLogService;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;

@Controller
public class HcdyWeiXinController extends BaseController {
	@Autowired
	private IHcdyOrganizationLogService hcdyOrganizationLogService;
	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper;

	@RequestMapping(value = "/auth/page/mobile/weixin/recruitment/hcdy/main")
	private String main(@RequestParam(value="isBack", required = false)Boolean isBack, Model model) {
		model.addAttribute("isBack", isBack);
		return "/weixinPage/recruitment/hcdy/main";
	}

	@RequestMapping(value = "/auth/page/mobile/weixin/recruitment/hcdy/headhunt")
	private String headhunt() {
		return "/weixinPage/recruitment/hcdy/headhunt";
	}

	@RequestMapping(value = "/auth/page/mobile/weixin/recruitment/hcdy/showResume")
	public String showResume(@RequestParam(value = "url", defaultValue = "") String url, Model model) {
		model.addAttribute("url", url);
		return "/weixinPage/recruitment/hcdy/showResume";
	}

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/auth/page/mobile/weixin/recruitment/hcdy/my")
	public String my(Model model) {
		BigDecimal rootId = organizationIdSessionHelper.getRootIdBySessionAttribute();
		HcdyOrganizationLogBean logBean = hcdyOrganizationLogService.selectById(rootId);
		if (logBean != null) {
			String account = logBean.getAccount();
			model.addAttribute("account", account);
		}
		return "/weixinPage/recruitment/hcdy/my";
	}

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/auth/page/mobile/weixin/recruitment/hcdy/showPosition")
	public String showPosition(Model model) {
		BigDecimal rootId = organizationIdSessionHelper.getRootIdBySessionAttribute();
		HcdyOrganizationLogBean logBean = hcdyOrganizationLogService.selectById(rootId);
		if (logBean != null) {
			String account = logBean.getAccount();
			model.addAttribute("account", account);
		}
		return "/weixinPage/recruitment/hcdy/showPosition";
	}

	@RequestMapping(value = "/auth/page/mobile/weixin/recruitment/hcdy/showHeadhunt")
	public String showHeadhunt(@RequestParam(value = "url", defaultValue = "") String url, Model model) {
		model.addAttribute("url", url);
		return "/weixinPage/recruitment/hcdy/showHeadhunt";
	}

}
