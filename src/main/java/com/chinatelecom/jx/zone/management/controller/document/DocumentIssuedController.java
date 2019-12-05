package com.chinatelecom.jx.zone.management.controller.document;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.weaver.ast.Var;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.document.IDocumentIssuedService;

@Controller
public class DocumentIssuedController extends BaseController {
	private static final Logger logger = LoggerFactory
			.getLogger(DocumentIssuedController.class);
	@Autowired
	private IDocumentIssuedService documentIssuedService;
	
	/**
	 * 公告文件
	 * 
	 * @param formInput
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	//原路径
	@RequestMapping(value = "/documentIssued/viewList")
	//@RequestMapping(value = "/auth/page/mobile/weixin/documentIssued/viewList")
	public String viewList(
			@RequestParam(value = "searchKey", required = false) String searchKey,
			Model model) {
		BigDecimal accoutBD = getCurrentAccountId();
		String accountId = "";
		if (accoutBD != null) {
			accountId = accoutBD.toString();
		}
		BigDecimal parkBD = getCurrentParkId();
		String parkId = "";
		if (parkBD != null) {
			parkId = parkBD.toString();
		}
		model.addAttribute("accountId", accountId);
		model.addAttribute("parkId", parkId);
		return "/weixinPage/documentIssued/list";
	}

	/**
	 * 查看详细
	 * 
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/documentIssued/view")
	public String view(@RequestParam(value = "id") String id,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			Model model) {
		BigDecimal accoutBD = getCurrentAccountId();
		String accountId = "";
		if (accoutBD != null) {
			accountId = accoutBD.toString();
		}
		BigDecimal parkBD = getCurrentParkId();
		String parkId = "";
		if (parkBD != null) {
			parkId = parkBD.toString();
		}
		model.addAttribute("accountId", accountId);
		model.addAttribute("parkId", parkId);
		model.addAttribute("id", id);
		model.addAttribute("pageNo", pageNo);
		return "/weixinPage/documentIssued/view";
	}

	/**
	 * 公告文件
	 * 
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	//原路径
//	@RequestMapping(value = "/documentIssued/newViewList")
	@RequestMapping(value = "/auth/page/mobile/weixin/documentIssued/viewList")
	public String newViewList(
			@RequestParam(value = "searchKey", required = false) String searchKey,
			Model model) {
		BigDecimal accoutBD = getCurrentAccountId();
		String accountId = "";
		if (accoutBD != null) {
			accountId = accoutBD.toString();
		}
		BigDecimal parkBD = getCurrentParkId();
		String parkId = "";
		if (parkBD != null) {
			parkId = parkBD.toString();
		}
		model.addAttribute("accountId", accountId);
		model.addAttribute("parkId", parkId);
		return "/weixinPage/documentIssued/newViewList";
	}

	/**
	 * 查看详细
	 * 
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/documentIssued/newView")
	public String newView(@RequestParam(value = "id") String id,
			@RequestParam(value = "logId") String logId,
			@RequestParam(value = "logStatus") String logStatus,
			Model model) {
		BigDecimal accoutBD = getCurrentAccountId();
		String accountId = "";
		String accountName = "";
		if (accoutBD != null) {
			accountId = accoutBD.toString();
			accountName = getCurrentAccountName();
		}
		BigDecimal parkBD = getCurrentParkId();
		String parkId = "";
		if (parkBD != null) {
			parkId = parkBD.toString();
		}
		model.addAttribute("accountId", accountId);
		model.addAttribute("accountName", accountName);
		model.addAttribute("parkId", parkId);
		model.addAttribute("id", id);
		model.addAttribute("logId", logId);
		model.addAttribute("logStatus", logStatus);
		return "/weixinPage/documentIssued/newView";
	}
	
	/*
	 * ==================================================json数据=================
	 * ===========================================
	 */
	/**
	 * 查询文件下达列表
	 * @param page
	 * @param parkId
	 * @return
	 */
	@RequestMapping(value = "/interface/json/documentIssued/list")
	public String parkInfoList(
			@RequestParam(value = "pageNum", defaultValue = "1") Short pageNum, 
			@RequestParam(value = "pageSize", defaultValue = "10") Short pageSize, 
			@RequestParam(value = "accountId", required=true) BigDecimal accountId, 
			@RequestParam(value = "logStatus", required=false) Short logStatus, 
			@RequestParam(value = "title", required=false) String title, 
			ModelMap modelMap, HttpServletRequest request) {
		String json = "";
		try {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("pageNum", pageNum);
			params.put("pageSize", pageSize);
			if(title!=null){
				params.put("title", title);
			}
			params.put("accountId", accountId);
			if(logStatus==null){
				json = documentIssuedService.getJsonStrWithUrlAndParams("allList", params);
				modelMap.addAttribute("jsonObj",JSONObject.parse(json));
			}else{
				params.put("logStatus", logStatus);
				json = documentIssuedService.getJsonStrWithUrlAndParams("taskList", params);
				modelMap.addAttribute("jsonObj",JSONObject.parse(json));
			}
		} catch (Exception ex) {
			String errorMsg = "查询列表失败，详细原因：" + ex.getLocalizedMessage();
			logger.error(errorMsg, ex);
			return null;
		}
		return "jsonView";
	}
	
	/**
	 * 查询文件下达详情
	 * @param page
	 * @param parkId
	 * @return
	 */
	@RequestMapping(value = "/interface/json/documentIssued/detail")
	public String parkInfoList(
			@RequestParam(value = "id", required=true) BigDecimal id,
			@RequestParam(value = "logStatus", required=true) String logStatus,
			@RequestParam(value = "logId", required=false) BigDecimal logId,
			ModelMap modelMap, HttpServletRequest request) {
		String json = "";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		if(logId!=null)
		params.put("logId", logId);
		params.put("logStatus", logStatus);
		try {
			BigDecimal accountId = getCurrentAccountId();
			String accountName = getCurrentAccountName();
			BigDecimal parkId = getCurrentParkId();//没有登录会抛异常
			String parkName = getParkNameById(parkId);
			params.put("accountId", accountId==null?"-2":accountId);
			params.put("accountName", accountName==null?"-2":accountName);
			params.put("parkId", parkId==null?"-2":accountId);
			params.put("parkName", parkName==null?"-2":accountName);
			params.put("orgId", parkId==null?"-2":parkId);
			params.put("orgName", parkName==null?"-2":parkName);
		} catch (Exception ex) {
			params.put("accountId", "-2");
			params.put("accountName", "-2");
			params.put("parkId","-2");
			params.put("parkName","-2");
			params.put("orgId","-2");
			params.put("orgName","-2");
		}
		try{
			json = documentIssuedService.getJsonStrWithUrlAndParams("view", params);
			modelMap.addAttribute("jsonObj",JSONObject.parse(json));
		}catch(Exception ex){
			String errorMsg = "查询详情失败，详细原因：" + ex.getLocalizedMessage();
			logger.error(errorMsg, ex);
			return null;
		}
		return "jsonView";
	}
}