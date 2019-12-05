package com.chinatelecom.jx.zone.management.controller.accountInfo;

import java.math.BigDecimal;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanProxy;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * 账号管理 
 * @author Administrator
 *
 */
@Controller
public class AccountInfoController extends BaseController {
	@Autowired
	private IAccountInfoBeanProxy accountInfoService;
	@Autowired
	private ISystemInfoBeanProxy systemInfoBeanProxy;
	
	
	@RequestMapping(value = "/accountInfo/list")
	public String list(
			@ModelAttribute("accountInfo") AccountInfoBean accountInfoBean,
			@ModelAttribute("page") Page<AccountInfoBean> page,
			@RequestParam(value = "searchText", required = false) String searchText,
			Model model, ServletRequest request) {
		
		BigDecimal systemId = systemInfoBeanProxy.selectSystemIdByThisSystemCode();
	//	System.out.println("========searchText========"+searchText);
	//	accountInfoBean.setOrderByClause("CREATE_TIME DESC");
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page = (Page<AccountInfoBean>) accountInfoService.selectFirstGradeListByOrganizationIdAndRootIdAndSystemIdAndStatusArrayAndSearchKey
				(null, null, systemId, null, searchText);

				 
		setPageInfo(page, model, "accountInfo/list");
		model.addAttribute("searchText",searchText);
		return "accountInfo/list";
	}
	
}
