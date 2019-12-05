package com.chinatelecom.jx.zone.management.controller.parkDataCenter;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.parkDataCenter.IYYDataCenterService;

/**
 * 弋阳数据中心
 *
 */
@Controller
public class YYDataCenterController extends BaseController{

	@Autowired
	private IYYDataCenterService dataCenterService;
	
	private static final Logger logger = LoggerFactory.getLogger(YYDataCenterController.class);
	
	@RequestMapping(value = "/front/parkDataCenter/yyIndex")
	public String index(
			@RequestParam( value = "orgId", required = false)BigDecimal orgId,
			@RequestParam( value = "year", required = false)Integer year,
			@RequestParam( value = "month", required = false)Integer month,
			Model model){
		try{
			
			if(year==null){
//				Calendar calendar=Calendar.getInstance();    
//				year = calendar.get(Calendar.YEAR);
				year = 2017;
//				month = calendar.get(Calendar.MONTH) + 1;
				month = 4;
			}
			
			orgId = new BigDecimal(1236);
			
			//企业分布情况数据
			Map<String, Object> map1 = dataCenterService.selectCompanyDistributionData(orgId, year, month);
			//企业排行数据
			Map<String, Object> map2 = dataCenterService.selectCompanySortData(orgId, year, month, 1);
			//图表数据
			Map<String, Object> map3 = dataCenterService.selectChartData(orgId, 2017, 1);
			
			Map<String, Object> map4 = dataCenterService.selectChartData(orgId, 2017, 2);
			
			model.addAttribute("distributionData", map1.get("distributionData"));
			model.addAttribute("sortData", map2.get("sortData"));
			model.addAttribute("chartData", map3);
			model.addAttribute("chartData_M", map4);
			
			model.addAttribute("orgId", orgId);
			model.addAttribute("year", year);
			model.addAttribute("month", month);
		}catch (Exception e) {
			logger.error("【弋阳数据中心】index方法发生异常，详细原因：" + e.getMessage(), e);
		}
		return "front/parkDataCenter/yyIndex";
	}
	
	@RequestMapping(value = "/json/parkDataCenter/jsonIndex")
	public String jsonIndex(
			@RequestParam( value = "orgId")BigDecimal orgId,
			@RequestParam( value = "year")Integer year,
			@RequestParam( value = "month")Integer month, 
			@RequestParam( value = "orderType")Integer orderType,ModelMap modelMap){
		try{
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取数据成功！");
			modelMap.addAttribute("sortData", dataCenterService.selectCompanySortData(orgId, year, month, orderType).get("sortData"));
			modelMap.addAttribute("chartData", "");
		}catch (Exception e) {
			logger.error("【弋阳数据中心】index方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常！");
		}
		return "jsonView";
	}
	
	
	@RequestMapping(value = "/front/parkDataCenter/yyDetail")
	public String yyDetail(
			@RequestParam( value = "orgId", required = false)BigDecimal orgId, Model model){
		try{
			orgId = new BigDecimal(1236);
			Map<String, Object> map = dataCenterService.selectCompanyIndustryStatisticsData(orgId);
			model.addAttribute("chartData", map);
			model.addAttribute("orgId", orgId);
		}catch (Exception e) {
			logger.error("【弋阳数据中心】yyDetail方法发生异常，详细原因：" + e.getMessage(), e);
		}
		return "front/parkDataCenter/yyDetail";
	}
	
	
	/**
	 * 园区经济指标
	 */
	@RequestMapping(value = "/front/parkDataCenter/parkEconomic")
	public String parkEconomic(
			@RequestParam( value = "orgId", required = false)BigDecimal orgId, 
			@RequestParam( value = "year", required = false)Integer year, Model model){
		try{
			orgId = new BigDecimal(1236);
			
			if(year==null){
				/*获取最新数据年份*/
				year = dataCenterService.selectYearByParkId(orgId, (short)2);
				if(year==null){
					Calendar calendar=Calendar.getInstance();    
					year = calendar.get(Calendar.YEAR);
				}
			}
			
			Map<String, Object> map = dataCenterService.selectParkEconomic(orgId, year);
			
			model.addAttribute("map", map);
			model.addAttribute("orgId", orgId);
			model.addAttribute("year", year);
		}catch (Exception e) {
			logger.error("【弋阳数据中心】parkEconomic方法发生异常，详细原因：" + e.getMessage(), e);
		}
		return "front/parkDataCenter/parkEconomic";
	}

	
	/**
	 * 园区经济指标
	 */
	@RequestMapping(value = "/front/parkDataCenter/industryEconomic")
	public String industryEconomic(
			@RequestParam( value = "orgId", required = false)BigDecimal orgId, 
			@RequestParam( value = "year", required = false)Integer year, Model model){
		try{
			orgId = new BigDecimal(1236);
			
			if(year==null){
				/*获取最新数据年份*/
				year = dataCenterService.selectYearByParkId(orgId, (short)2);
				if(year==null){
					Calendar calendar=Calendar.getInstance();    
					year = calendar.get(Calendar.YEAR);
				}
			}
			
			Map<String, Object> map = dataCenterService.selectIndustryEconomic(orgId, year);
			
			model.addAttribute("map", map);
			model.addAttribute("orgId", orgId);
			model.addAttribute("year", year);
		}catch (Exception e) {
			logger.error("【弋阳数据中心】industryEconomic方法发生异常，详细原因：" + e.getMessage(), e);
		}
		return "front/parkDataCenter/industryEconomic";
	}
}
