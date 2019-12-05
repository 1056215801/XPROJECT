package com.chinatelecom.jx.zone.management.controller.dataCenter;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.dataCenter.IDataCenterService;

/**
 * 省级平台数据中心
 * 该数据中心只针对江西省，页面所配地图适配江西省地图；
 * 
 * @author MR_WU
 *
 */

@Controller
public class DataCenterController extends BaseController{
	@Autowired
	private IDataCenterService dataCenterService;
	
	private static final Logger logger = LoggerFactory.getLogger(DataCenterController.class);
	
	/**
	 * 数据中心1PC端
	 * 入参：orgId 组织id
	 * 	   provinceId 所处省份id，默认江西省
	 * 出参：
	 */
	@RequestMapping(value="/front/dataCenter/organizationCount")
	public String organizationCount(
			@RequestParam(value = "orgId", defaultValue = "360000")BigDecimal orgId, 
			@RequestParam(value = "linkId", required = false)BigDecimal linkId, 
			@RequestParam(value = "provinceId", defaultValue = "360000")BigDecimal provinceId, 
			HttpServletRequest request, Model model){
		BigDecimal organizationId = orgId;
		try{
			model.addAttribute("orgId", orgId);
			model.addAttribute("entranceId", orgId);
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
			model.addAttribute("linkId", linkId);
			
		}catch(Exception ex){
			logger.error("【公共服务平台数据中心】organizationCount方法出现异常，详细原因："+ex.getMessage(), ex);
			model.addAttribute("message", "页面加载异常："+ex);
		}
		if(new BigDecimal("90020180129150931800055000000001").compareTo(organizationId)==0){
			return "/front/dataCenter_fgw/organizationCount";
		}else{			
			return "/front/dataCenter/organizationCount";
		}
	}
	
	/**
	 * 数据中心1接口
	 * 入参：orgId 组织id
	 * 出参：
	 */
	@RequestMapping(value="/interface/json/dataCenter/organizationCount")
	public String jsonOrganizationCount(
			@RequestParam(value = "areaId")Integer areaId,
			@RequestParam(value = "year")Integer year,
			@RequestParam(value = "quarter")Integer quarter,
			@RequestParam(value = "isProvince")Boolean isProvince,
			@RequestParam(value = "provinceId")BigDecimal provinceId,
			@RequestParam(value = "orgId", defaultValue = "360000")BigDecimal orgId, 
			HttpServletRequest request, ModelMap modelMap, HttpServletResponse response){
		try{

			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			/*园区数据*/
			JSONObject parkData = dataCenterService.selectParkDataByAreaIdAndYear(areaId, year, isProvince, provinceId);
			
			/*园区数据*/
			JSONObject mapData = dataCenterService.selectMapDataByAreaIdAndYear(areaId, year, isProvince, provinceId);
			
			/*经济指标、企业数据*/
			JSONObject compAndEcData = dataCenterService.selectCompAndEcDataByAreaIdAndYearAndQuarter(areaId, year, quarter, isProvince, provinceId);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("parkData", parkData);
			modelMap.addAttribute("mapData", mapData);
			modelMap.addAttribute("compAndEcData", compAndEcData);
			modelMap.addAttribute("entranceId", orgId);
			
		}catch(Exception ex){
			logger.error("【公共服务平台数据中心】jsonOrganizationCount方法出现异常，详细原因："+ex.getMessage(), ex);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	/**
	 * 数据中心1接口
	 * 入参：orgId 组织id
	 * 出参：
	 */
	@RequestMapping(value="/interface/json/dataCenter/parkCount")
	public String parkCount(
			@RequestParam(value = "orgId", required = false)BigDecimal orgId, 
			HttpServletRequest request, ModelMap modelMap, HttpServletResponse response){
		try{

			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(orgId == null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数orgId未设置！");
				return "jsonView";
			}
			
			boolean isProvince = false;
			BigDecimal provinceId = null;
			if(BigDecimal.valueOf(360000).compareTo(orgId)==0){
				isProvince = true;
				provinceId = orgId;
			}
			/*园区数据*/
			JSONObject parkData = dataCenterService.selectParkDataByAreaIdAndYear(Integer.valueOf(orgId.toString()), null, isProvince, provinceId);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("parkData", parkData);
			modelMap.addAttribute("entranceId", orgId);
			
		}catch(Exception ex){
			logger.error("【公共服务平台数据中心】jsonOrganizationCount方法出现异常，详细原因："+ex.getMessage(), ex);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	
	/**
	 * 数据中心2PC端
	 * 入参：orgId 组织id
	 * 出参：
	 */
	@RequestMapping(value="/front/dataCenter/economicCount")
	public String economicCount(
			@RequestParam(value = "orgId", defaultValue = "360000")BigDecimal orgId, 
			@RequestParam(value = "linkId", required = false)BigDecimal linkId, 
			@RequestParam(value = "provinceId", defaultValue = "360000")BigDecimal provinceId, 
			HttpServletRequest request, Model model){
		BigDecimal organizationId = orgId;
		try{
			model.addAttribute("orgId", orgId);
			model.addAttribute("entranceId", orgId);
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
			model.addAttribute("linkId", linkId);
		}catch(Exception ex){
			logger.error("【公共服务平台数据中心】economicCount方法出现异常，详细原因："+ex.getMessage(), ex);
			model.addAttribute("message", "页面加载异常："+ex);
		}
		if(new BigDecimal("90020180129150931800055000000001").compareTo(organizationId)==0){
			return "/front/dataCenter_fgw/economicCount";
		}else{			
			return "/front/dataCenter/economicCount";
		}
	}
	
	/**
	 * 数据中心2接口
	 * 入参：orgId 组织id
	 * 出参：
	 */
	@RequestMapping(value="/interface/json/dataCenter/economicCount")
	public String jsonEconomicCount(
			@RequestParam(value = "areaId")Integer areaId,
			@RequestParam(value = "year")Integer year, 
			@RequestParam(value = "isProvince")Boolean isProvince,
			@RequestParam(value = "orgId", defaultValue = "360000")BigDecimal orgId,
			HttpServletRequest request, ModelMap modelMap, HttpServletResponse response){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			/*经济指标数据*/
			JSONObject economicData = dataCenterService.selectEconomicDataByAreaIdAndYear(areaId, year, isProvince);
			modelMap.addAttribute("entranceId", orgId);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("economicData", economicData);
			
		}catch(Exception ex){
			logger.error("【公共服务平台数据中心】jsonEconomicCount方法出现异常，详细原因："+ex.getMessage(), ex);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	/**
	 * 数据中心3PC端
	 * 入参：orgId 组织id
	 * 出参：
	 */
	@RequestMapping(value="/front/dataCenter/industryCount")
	public String industryCount(
			@RequestParam(value = "orgId", defaultValue = "360000")BigDecimal orgId, 
			@RequestParam(value = "linkId", required = false)BigDecimal linkId, 
			@RequestParam(value = "provinceId", defaultValue = "360000")BigDecimal provinceId, 
			HttpServletRequest request, Model model){
		BigDecimal organizationId = orgId;
		try{
			model.addAttribute("orgId", orgId);
			model.addAttribute("entranceId", orgId);
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
			model.addAttribute("linkId", linkId);
		}catch(Exception ex){
			logger.error("【公共服务平台数据中心】industryCount方法出现异常，详细原因："+ex.getMessage(), ex);
			model.addAttribute("message", "页面加载异常："+ex);
		}
		if(new BigDecimal("90020180129150931800055000000001").compareTo(organizationId)==0){
			return "/front/dataCenter_fgw/industryCount";
		}else{			
			return "/front/dataCenter/industryCount";
		}
	}
	
	
	/**
	 * 数据中心3接口
	 * 入参：industryType:1:工业增加值 2：主营业务收入 3：利润总额 4：出口交货值
	 * 出参：
	 */
	@RequestMapping(value="/interface/json/dataCenter/industryCount")
	public String jsonIndustryCount(
			@RequestParam(value = "areaId")Integer areaId,
			@RequestParam(value = "year")Integer year,
			@RequestParam(value = "quarter")Integer quarter,
			@RequestParam(value = "isProvince")Boolean isProvince,
			@RequestParam(value = "provinceId")BigDecimal provinceId,
			@RequestParam(value = "industryType")Short industryType, 
			@RequestParam(value = "orgId", defaultValue = "360000")BigDecimal orgId,
			HttpServletRequest request, ModelMap modelMap, HttpServletResponse response){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			/*工业产值*/
			JSONObject industryData = dataCenterService.selectIndustryDataByAreaIdAndYearAndQuarter(areaId, year, quarter, isProvince, provinceId, industryType);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("industryData", industryData);
			modelMap.addAttribute("entranceId", orgId);
		}catch(Exception ex){
			logger.error("【公共服务平台数据中心】jsonIndustryCount方法出现异常，详细原因："+ex.getMessage(), ex);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	/**
	 * 数据中心4PC端
	 * 入参：orgId 组织id
	 * 出参：
	 */
	@RequestMapping(value="/front/dataCenter/energyCount")
	public String energyCount(
			@RequestParam(value = "orgId", defaultValue = "360000")BigDecimal orgId,
			@RequestParam(value = "linkId", required = false)BigDecimal linkId, 
			@RequestParam(value = "provinceId", defaultValue = "360000")BigDecimal provinceId, 
			@RequestParam(value = "year", defaultValue = "2016")Integer year,
			HttpServletRequest request, Model model){
		BigDecimal organizationId = orgId;
		try{
			model.addAttribute("orgId", orgId);
			model.addAttribute("entranceId", orgId);
			if(new BigDecimal("90020180129150931800055000000001").compareTo(orgId)==0){
				orgId = new BigDecimal("360000");
			}
			/*获取组织所在地市*/
			JSONObject areaInfo = dataCenterService.getAreaInfoByOrgIdAndProvinceId(orgId, provinceId);
			
			/*企业能耗*/
			JSONObject energyData = dataCenterService.selectEnergyDataByYear(year);
			
			model.addAttribute("areaInfo", areaInfo);
			model.addAttribute("provinceId", provinceId);
			model.addAttribute("energyData", energyData);
			model.addAttribute("year", year);
			model.addAttribute("energyData", energyData);
			model.addAttribute("linkId", linkId);
		}catch(Exception ex){
			logger.error("【公共服务平台数据中心】energyCount方法出现异常，详细原因："+ex.getMessage(), ex);
			model.addAttribute("message", "页面加载异常："+ex);
		}
		if(new BigDecimal("90020180129150931800055000000001").compareTo(organizationId)==0){
			return "/front/dataCenter_fgw/energyCount";
		}else{			
			return "/front/dataCenter/energyCount";
		}
	}
	
	/**
	 * 数据中心4接口
	 * 入参：year
	 * 
	 * 出参：
	 */
	@RequestMapping(value="/interface/json/dataCenter/energyCount")
	public String jsonEnergyCount(
			@RequestParam(value = "year")Integer year,
			@RequestParam(value = "orgId", defaultValue = "360000")BigDecimal orgId,
			HttpServletRequest request, ModelMap modelMap, HttpServletResponse response){
		try{
			
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			/*企业能耗*/
			JSONObject energyData = dataCenterService.selectEnergyDataByYear(year);
			modelMap.addAttribute("entranceId", orgId);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("energyData", energyData);
			
		}catch(Exception ex){
			logger.error("【公共服务平台数据中心】jsonEnergyCount方法出现异常，详细原因："+ex.getMessage(), ex);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
}
