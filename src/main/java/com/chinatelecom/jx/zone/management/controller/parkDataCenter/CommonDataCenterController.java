package com.chinatelecom.jx.zone.management.controller.parkDataCenter;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

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
import com.chinatelecom.jx.zone.management.service.parkDataCenter.ICommonDataCenterService;

/**
 * 园区数据中心公用页面
 * 
 */

@Controller
public class CommonDataCenterController extends BaseController{
	
	@Autowired
	private ICommonDataCenterService commonDataCenterService;
	
	private static final Logger logger = LoggerFactory.getLogger(CommonDataCenterController.class);
	
	/**
	 * 园区经济指标
	 */
	@RequestMapping(value = "/front/parkDataCenter/pkEconIndicators")
	public String parkEconomic(
			@RequestParam( value = "orgId", required = false)BigDecimal orgId, 
			@RequestParam( value = "year", required = false)Integer year, Model model){
		try{
			/*获取该园区数据中心配置信息*/
			JSONObject configInfo = commonDataCenterService.selectParkDataCenterConfigByParkId(orgId);
			
			if(year==null){
				/*获取最新数据年份*/
				year = commonDataCenterService.selectYearByParkId(orgId, (short)1, Integer.parseInt(configInfo.get("isPkLocalShow").toString()));
				if(year==null){
					Calendar calendar=Calendar.getInstance();    
					year = calendar.get(Calendar.YEAR);
				}
			}
			int typeSize = configInfo.get("pkIndexNum") == null ? 0 : Integer.parseInt(configInfo.get("pkIndexNum").toString());
			
			model.addAttribute("typeSize", typeSize);
			model.addAttribute("configInfo", configInfo);
			model.addAttribute("orgId", orgId);
			model.addAttribute("year", year);
		}catch (Exception e) {
			logger.error("【园区数据中心】pkEconIndicators方法发生异常，详细原因：" + e.getMessage(), e);
			model.addAttribute("message", "页面加载异常："+e);
		}
		return "front/parkDataCenter/common/pkEconIndicators";
	}

	/**
	 * 产业集群指标
	 */
	@RequestMapping(value = "/front/parkDataCenter/indClusterIndex")
	public String indClusterIndex(
			@RequestParam( value = "orgId", required = false)BigDecimal orgId, 
			@RequestParam( value = "year", required = false)Integer year, Model model){
		try{
			model.addAttribute("orgId", orgId);
			model.addAttribute("year", year);
		}catch (Exception e) {
			logger.error("【产业集群指标】indClusterIndex方法发生异常，详细原因：" + e.getMessage(), e);
			model.addAttribute("message", "页面加载异常："+e);
		}
		return "front/parkDataCenter/jx/indClusterIndex";
	}
	
	/**
	 * 获取参数
	 * @param orgId
	 * @param year
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/interface/json/dataCenter/pkDict")
	public String pkDict(
			@RequestParam( value = "orgId", required = false)BigDecimal orgId, 
			@RequestParam( value = "year", required = false)Integer year, 
			HttpServletResponse response, HttpServletRequest request, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			/*获取该园区数据中心配置信息*/
			JSONObject configInfo = commonDataCenterService.selectParkDataCenterConfigByParkId(orgId);
			
			if(year==null){
				/*获取最新数据年份*/
				year = commonDataCenterService.selectYearByParkId(orgId, (short)1, Integer.parseInt(configInfo.get("isPkLocalShow").toString()));
				if(year==null){
					Calendar calendar=Calendar.getInstance();    
					year = calendar.get(Calendar.YEAR);
				}
			}
			int typeSize = configInfo.get("pkIndexNum") == null ? 0 : Integer.parseInt(configInfo.get("pkIndexNum").toString());
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("typeSize", typeSize);
			modelMap.addAttribute("configInfo", configInfo);
			modelMap.addAttribute("orgId", orgId);
			modelMap.addAttribute("year", year);
		}catch (Exception e) {
			logger.error("【园区数据中心】pkDict方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	
	@RequestMapping(value="/interface/json/dataCenter/pkEconIndicators")
	public String jsonPkEconIndicators(
			@RequestParam(value = "orgId") BigDecimal orgId,
			@RequestParam(value = "year") Integer year, 
			@RequestParam(value = "isPkLocalShow") Integer isPkLocalShow, 
			@RequestParam(value = "pkIndexCode") String pkIndexCode,
			HttpServletResponse response, HttpServletRequest request, ModelMap modelMap){
		try{
			
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			/*判断是否有数据*/
			Boolean isAnyData = commonDataCenterService.selectEconIsAnyDataByParkIdAndYear(orgId, year, 1, isPkLocalShow);
			if(isAnyData){				
				JSONObject pkEconData = commonDataCenterService.selectPkEconDataByParkIdAndYear(orgId, year, isPkLocalShow, pkIndexCode);
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "数据获取成功！");
				modelMap.addAttribute("pkEconData", pkEconData);
			}else{
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", year+"年暂无数据！");
			}
			
		}catch(Exception ex){
			logger.error("【园区数据中心】jsonPkEconIndicators方法出现异常，详细原因："+ex.getMessage(), ex);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	/**
	 * 产业经济指标
	 */
	@RequestMapping(value = "/front/parkDataCenter/indEconIndicators")
	public String industryEconomic(
			@RequestParam( value = "orgId", required = false)BigDecimal orgId, 
			@RequestParam( value = "year", required = false)Integer year, Model model){
		
		try{
			/*获取该园区数据中心配置信息*/
			JSONObject configInfo = commonDataCenterService.selectParkDataCenterConfigByParkId(orgId);
			
			if(year==null){
				/*获取最新数据年份*/
				year = commonDataCenterService.selectYearByParkId(orgId, (short)2, null);
				if(year==null){
					Calendar calendar=Calendar.getInstance();    
					year = calendar.get(Calendar.YEAR);
				}
			}
			
			List<JSONObject> typeList = commonDataCenterService.selectTypeListByParkId(orgId, year);
			
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("configInfo", configInfo);
			model.addAttribute("typeList", typeList);
			model.addAttribute("typeSize", typeList.size());
			model.addAttribute("orgId", orgId);
			model.addAttribute("year", year);
		}catch (Exception e) {
			logger.error("【园区数据中心】indEconIndicators方法发生异常，详细原因：" + e.getMessage(), e);
			model.addAttribute("message", "页面加载异常："+e);
		}
		
		if(new BigDecimal("1200").equals(orgId)){
			return "front/parkDataCenter/jx/indClusterIndex";
		}else{
			return "front/parkDataCenter/common/indEconIndicators";
		}
		
	}

	@RequestMapping(value="/interface/json/dataCenter/indEconIndicators")
	public String jsonIndEconIndicators(
			@RequestParam(value = "orgId") BigDecimal orgId,
			@RequestParam(value = "year") Integer year, 
			@RequestParam(value = "indIndexCode") String indIndexCode,
			HttpServletResponse response, HttpServletRequest request, ModelMap modelMap){
		try{
			
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			/*判断是否有数据*/
			Boolean isAnyData = commonDataCenterService.selectEconIsAnyDataByParkIdAndYear(orgId, year, 2, null);
			if(isAnyData){				
				JSONObject indEconData = commonDataCenterService.selectIndEconDataByParkIdAndYear(orgId, year, indIndexCode);
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "数据获取成功！");
				modelMap.addAttribute("indEconData", indEconData);
			}else{
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", year+"年暂无数据！");
			}
		}catch(Exception ex){
			logger.error("【园区数据中心】jsonIndEconIndicators方法出现异常，详细原因："+ex.getMessage(), ex);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	
	/**
	 * 首页
	 */
	@RequestMapping(value = "/front/parkDataCenter/index")
	public String index(
			@RequestParam( value = "orgId", required = false)BigDecimal orgId, Model model){
		try{
			
			/*获取该园区数据中心配置信息*/
			JSONObject configInfo = commonDataCenterService.selectParkDataCenterConfigByParkId(orgId);
			model.addAttribute("configInfo", configInfo);
			model.addAttribute("orgId", orgId);
			
			/*江西大余工业园区*/
			if(new BigDecimal("1215").equals(orgId)){
				return "front/parkDataCenter/dy/dyIndex";
			}
			
			/*上饶经济技术开发区*/
			if(new BigDecimal("2610").equals(orgId)){
				return "front/parkDataCenter/srjk/srjkIndex";
			}
			
			/*江西新建长堎工业园区*/
			if(new BigDecimal("1287").equals(orgId)){
				return "front/parkDataCenter/cl/clIndex";
			}
			
			/*江西玉山经济开发区*/
			if(new BigDecimal("1233").equals(orgId)){
				return "front/parkDataCenter/ysjk/ysjkIndex";
			}
			
			/*江西上栗经济开发区*/
			if(new BigDecimal("1280").equals(orgId)){
				return "front/parkDataCenter/sljk/sljkIndex";
			}
			
			/*江西吉水工业园区*/
			if(new BigDecimal("1246").equals(orgId)){
				return "front/parkDataCenter/js/jsIndex";
			}
			
			/*江西万年高新技术产业园区*/
			if(new BigDecimal("1238").equals(orgId)){
				return "front/parkDataCenter/wn/wnIndex";
			}
			
			/*江西安远工业产业园区*/
			if(new BigDecimal("1217").equals(orgId)){
				return "front/parkDataCenter/ay/ayIndex";
			}

			/*萍乡经济技术开发区*/
			if(new BigDecimal("1273").equals(orgId)){
				return "front/parkDataCenter/pxjk/pxIndex";
			}
			
			/*江西横峰经济开发区*/
			if(new BigDecimal("1179").equals(orgId)){
				return "front/parkDataCenter/hfjk/hfIndex";
			}
			
			/*江西贵溪工业园区*/
			if(new BigDecimal("1091").equals(orgId)){
				return "front/parkDataCenter/gx/gxIndex";
			}
			
			/*江西会昌工业园区*/
			if(new BigDecimal("1223").equals(orgId)){
				return "front/parkDataCenter/hc/hcIndex";
			}
			
			/*江西进贤经济开发区*/
			if(new BigDecimal("1200").equals(orgId)){
				return "front/parkDataCenter/jx/jxIndex";
			}
			
			/*江西进贤经济开发区*/
			if(new BigDecimal("1113").equals(orgId)){
				return "front/parkDataCenter/sg/sgIndex";
			}
			
			/*江西吉安河东经济开发区*/
			if(new BigDecimal("1243").equals(orgId)){
				return "front/parkDataCenter/hdjk/hdIndex";
			}
			
			/*宜春经济技术开发区*/
			if(new BigDecimal("1224").equals(orgId)){
				return "front/parkDataCenter/ycjk/ycjkIndex";
			}
			
			/*宜春丰城工业园区*/
			if(new BigDecimal("1226").equals(orgId)){
				return "front/parkDataCenter/fc/fcIndex";
			}
			
			/*江西都昌工业园区*/
			if(new BigDecimal("1271").equals(orgId)){
				return "front/parkDataCenter/dc/dcIndex";
			}
			
			/*江西瑞昌经济开发区*/
			if(new BigDecimal("1210").equals(orgId)){
				return "front/parkDataCenter/rcjk/rcjkIndex";
			}
			
		}catch (Exception e) {
			logger.error("【园区数据中心】index方法发生异常，详细原因：" + e.getMessage(), e);
			model.addAttribute("message", "页面加载异常："+e);
			return "redirect:/error/404";
		}
		
		return "redirect:/error/404";
	}
	
	/**
	 * 企业统计
	 * 入参orgId：园区id
	 * 	  standardSize：0非规上 1规上 2未知
	 */
	@RequestMapping(value="/interface/json/dataCenter/compCount")
	public String jsonCompCount(
			@RequestParam(value = "orgId") BigDecimal orgId,
			@RequestParam(value = "standardSize", required = false) Short standardSize, 
			HttpServletResponse response, HttpServletRequest request, ModelMap modelMap){
		try{
			
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			JSONObject compData = commonDataCenterService.selectCompDataByParkIdAndStandardSize(orgId, standardSize);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("compData", compData);
		}catch(Exception ex){
			logger.error("【园区数据中心】jsonCompCount方法出现异常，详细原因："+ex.getMessage(), ex);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
}
