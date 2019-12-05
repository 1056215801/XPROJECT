package com.chinatelecom.jx.zone.management.controller.dataCenter;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.dataCenter.IDataCenterService;


@Controller
public class DataCenterWeixinController extends BaseController{
	@Autowired 
	private IDataCenterService dataCenterService;
	
	private static final Logger logger = LoggerFactory.getLogger(DataCenterWeixinController.class);

	@RequestMapping(value = "/weixin/dataCenter/organizationCount")
	public String organizationCount(
			@RequestParam(value = "orgId", defaultValue = "360000")BigDecimal orgId, 
			@RequestParam(value = "provinceId", defaultValue = "360000")BigDecimal provinceId, 
			HttpServletRequest request, Model model){
		BigDecimal organizationId = orgId;
		try{
			model.addAttribute("orgId", orgId);
			if(new BigDecimal("90020180129150931800055000000001").compareTo(orgId)==0){
				orgId = new BigDecimal("360000");
			}
			/*获取组织所在地市*/
			JSONObject areaInfo = dataCenterService.getAreaInfoByOrgIdAndProvinceId(orgId, provinceId);
			
			/*获取有数据年份列表，季度列表*/
			Map<String, List<JSONObject>> searchList = dataCenterService.selectSearchList();
			
			/*获取最近录入数据年份和季度*/
			JSONObject searchInfo = dataCenterService.selectDefaultSearchInfo();
			
			
			model.addAttribute("areaInfo", areaInfo);
			model.addAttribute("searchList", searchList);
			model.addAttribute("searchInfo", searchInfo);
			model.addAttribute("provinceId", provinceId);
		}catch (Exception ex) {
			logger.error("【微信数据中心】organizationCount出现异常:"+ex.getMessage(), ex);
			model.addAttribute("message", "页面加载异常："+ex);
		}
		if(new BigDecimal("90020180129150931800055000000001").compareTo(organizationId)==0){
			return "/weixinPage/dataCenter_fgw/organizationCount";
		}else{			
			return "/weixinPage/dataCenter/organizationCount";
		}
		
	}
	
	@RequestMapping(value="/weixin/dataCenter/economicCount")
	public String economicCount(
			@RequestParam(value = "orgId", defaultValue = "360000")BigDecimal orgId, 
			@RequestParam(value = "provinceId", defaultValue = "360000")BigDecimal provinceId, 
			HttpServletRequest request, Model model){
		BigDecimal organizationId = orgId;
		try{
			model.addAttribute("orgId", orgId);
			if(new BigDecimal("90020180129150931800055000000001").compareTo(orgId)==0){
				orgId = new BigDecimal("360000");
			}
			/*获取组织所在地市*/
			JSONObject areaInfo = dataCenterService.getAreaInfoByOrgIdAndProvinceId(orgId, provinceId);
			
			/*获取有数据年份列表，季度列表*/
			Map<String, List<JSONObject>> searchList = dataCenterService.selectSearchList();
			
			/*获取最近录入数据年份和季度*/
			JSONObject searchInfo = dataCenterService.selectDefaultSearchInfo();
			
			model.addAttribute("areaInfo", areaInfo);
			model.addAttribute("searchList", searchList);
			model.addAttribute("searchInfo", searchInfo);
			model.addAttribute("provinceId", provinceId);
		}catch(Exception ex){
			logger.error("【微信数据中心】economicCount出现异常:"+ex.getMessage(),ex);
			model.addAttribute("message", "页面加载异常："+ex);
		}
		if(new BigDecimal("90020180129150931800055000000001").compareTo(organizationId)==0){
			return "/weixinPage/dataCenter_fgw/economicCount";
		}else{			
			return "/weixinPage/dataCenter/economicCount";
		}
	}
	
	@RequestMapping(value="/weixin/dataCenter/industryCount")
	public String industryCount(
			@RequestParam(value = "orgId", defaultValue = "360000")BigDecimal orgId, 
			@RequestParam(value = "provinceId", defaultValue = "360000")BigDecimal provinceId, 
			HttpServletRequest request, Model model){
		BigDecimal organizationId = orgId;
		try{
			model.addAttribute("orgId", orgId);
			if(new BigDecimal("90020180129150931800055000000001").compareTo(orgId)==0){
				orgId = new BigDecimal("360000");
			}
			/*获取组织所在地市*/
			JSONObject areaInfo = dataCenterService.getAreaInfoByOrgIdAndProvinceId(orgId, provinceId);
			
			/*获取有数据年份列表，季度列表*/
			Map<String, List<JSONObject>> searchList = dataCenterService.selectSearchList();
			
			/*获取最近录入数据年份和季度*/
			JSONObject searchInfo = dataCenterService.selectDefaultSearchInfo();
			
			model.addAttribute("areaInfo", areaInfo);
			model.addAttribute("searchList", searchList);
			model.addAttribute("searchInfo", searchInfo);
			model.addAttribute("provinceId", provinceId);
		}catch(Exception ex){
			logger.error("【微信数据中心】industryCount出现异常:"+ex.getMessage(),ex);
			model.addAttribute("message", "页面加载异常："+ex);
		}
		if(new BigDecimal("90020180129150931800055000000001").compareTo(organizationId)==0){
			return "/weixinPage/dataCenter_fgw/industryCount";
		}else{			
			return "/weixinPage/dataCenter/industryCount";
		}
	}
	
	
	@RequestMapping(value="/weixin/dataCenter/energyCount")
	public String energyCount(
			@RequestParam(value = "orgId", defaultValue = "360000")BigDecimal orgId, 
			@RequestParam(value = "provinceId", defaultValue = "360000")BigDecimal provinceId, 
			HttpServletRequest request, Model model){
		BigDecimal organizationId = orgId;
		try{
			model.addAttribute("orgId", orgId);
			if(new BigDecimal("90020180129150931800055000000001").compareTo(orgId)==0){
				orgId = new BigDecimal("360000");
			}
			/*获取组织所在地市*/
			JSONObject areaInfo = dataCenterService.getAreaInfoByOrgIdAndProvinceId(orgId, provinceId);
			
			model.addAttribute("areaInfo", areaInfo);
			model.addAttribute("provinceId", provinceId);
		}catch(Exception ex){
			logger.error("【微信数据中心】energyCount出现异常:"+ex.getMessage(),ex);
			model.addAttribute("message", "页面加载异常："+ex);
		}
		if(new BigDecimal("90020180129150931800055000000001").compareTo(organizationId)==0){
			return "/weixinPage/dataCenter_fgw/energyCount";
		}else{			
			return "/weixinPage/dataCenter/energyCount";
		}
	}
	
}
