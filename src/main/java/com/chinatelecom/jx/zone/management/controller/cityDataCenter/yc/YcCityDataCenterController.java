package com.chinatelecom.jx.zone.management.controller.cityDataCenter.yc;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.service.cityDataCenter.yc.IYcCityDataCenterService;

@Controller
public class YcCityDataCenterController {
	
	@Autowired
	private IYcCityDataCenterService ycCityDataCenterService;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private static final BigDecimal YC_ORG_ID = new BigDecimal("3609009");
	private static final BigDecimal YC_AREA_ID = new BigDecimal("360900");
	private static final BigDecimal JX_AREA_ID = new BigDecimal("360000");
	
	private static final Logger logger = LoggerFactory.getLogger(YcCityDataCenterController.class);
	
	@RequestMapping(value = "/interface/json/cityDataCenter/yc/firstPageData")
	public String firstPageData(
			@RequestParam(value = "orgId") BigDecimal orgId,
			@RequestParam(value = "year") Integer year, 
			@RequestParam(value = "month") Integer month, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(YC_ORG_ID.equals(orgId)){
				orgId = YC_AREA_ID;
			}
			
			JSONObject firstPageData = ycCityDataCenterService
					.selectFirstPageData(orgId, year, month);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("firstPageData", firstPageData);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】firstPageData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	@RequestMapping(value = "/interface/json/cityDataCenter/yc/secondPageData")
	public String secondPageData(
			@RequestParam(value = "orgId") BigDecimal orgId,
			@RequestParam(value = "areaId") BigDecimal areaId,
			@RequestParam(value = "year") Integer year, 
			@RequestParam(value = "month") Integer month, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(YC_ORG_ID.equals(orgId)){
				orgId = YC_AREA_ID;
			}
			
			JSONObject secondPageData = ycCityDataCenterService
					.selectSecondPageData(orgId, areaId, year, month);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("secondPageData", secondPageData);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】secondPageData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	@RequestMapping(value = "/interface/json/cityDataCenter/yc/thirdPageData")
	public String thirdPageData(
			@RequestParam(value = "orgId") BigDecimal orgId,
			@RequestParam(value = "year") Integer year, 
			@RequestParam(value = "month") Integer month, 
			@RequestParam(value = "orderType", required = false) Integer orderType, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(YC_ORG_ID.equals(orgId)){
				orgId = YC_AREA_ID;
			}
			
			List<JSONObject> thirdPageData = ycCityDataCenterService
					.selectThirdPageData(orgId, year, month, orderType);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("thirdPageData", thirdPageData);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】thirdPageData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	@RequestMapping(value = "/interface/json/cityDataCenter/yc/fourthPageData")
	public String fourthPageData(
			@RequestParam(value = "orgId") BigDecimal orgId,
			@RequestParam(value = "parkId") BigDecimal parkId, 
			@RequestParam(value = "year") Integer year, 
			@RequestParam(value = "month") Integer month, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(YC_ORG_ID.equals(orgId)){
				orgId = YC_AREA_ID;
			}
			
			JSONObject fourthPageData = ycCityDataCenterService
					.selectFourthPageData(orgId, parkId, year, month);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("fourthPageData", fourthPageData);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】fourthPageData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	@RequestMapping(value = "/interface/json/cityDataCenter/yc/fifthPageData")
	public String fifthPageData(
			@RequestParam(value = "orgId") BigDecimal orgId,
			@RequestParam(value = "year") Integer year, 
			@RequestParam(value = "month") Integer month, 
			@RequestParam(value = "orderType", required = false) Integer orderType,
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(YC_ORG_ID.equals(orgId)){
				orgId = YC_AREA_ID;
			}
			
			List<JSONObject> fifthPageData = ycCityDataCenterService
					.selectFifthPageData(orgId, year, month, orderType);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("fifthPageData", fifthPageData);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】fifthPageData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	@RequestMapping(value = "/interface/json/cityDataCenter/yc/sixthPageData")
	public String sixthPageData(
			@RequestParam(value = "orgId") BigDecimal orgId,
			@RequestParam(value = "year") Integer year, 
			@RequestParam(value = "month") Integer month, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(YC_ORG_ID.equals(orgId)){
				orgId = YC_AREA_ID;
			}
			
			JSONObject sixthPageData = ycCityDataCenterService
					.selectSixthPageData(orgId, year, month);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("sixthPageData", sixthPageData);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】sixthPageData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	@RequestMapping(value = "/interface/json/cityDataCenter/yc/seventhPageData")
	public String seventhPageData(
			@RequestParam(value = "orgId") BigDecimal orgId,
			@RequestParam(value = "year") Integer year, 
			@RequestParam(value = "month") Integer month, 
			@RequestParam(value = "orderType", required = false) Integer orderType, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(YC_ORG_ID.equals(orgId)){
				orgId = YC_AREA_ID;
			}
			
			JSONObject seventhPageData = ycCityDataCenterService
					.selectSeventhPageData(orgId, year, month, orderType);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("seventhPageData", seventhPageData);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】seventhPageData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	/**
	 * 查询增幅
	 */
	@RequestMapping(value = "/interface/json/cityDataCenter/yc/percentData")
	public String percentData(
			@RequestParam(value = "orgId") BigDecimal orgId,
			@RequestParam(value = "year") Integer year, 
			@RequestParam(value = "month") Integer month, 
			@RequestParam(value = "value") String value, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(YC_ORG_ID.equals(orgId)){
				orgId = YC_AREA_ID;
			}
			
			List<JSONObject> percentData = ycCityDataCenterService
					.selectPercentData(orgId, year, month, value);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("percentData", percentData);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】percentData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	/**
	 * 
	 * @param orgId
	 * @param year
	 * @param month
	 * @param orderType 排序字段
	 * @param orderKind 1:总量  2：同比
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/interface/json/cityDataCenter/yc/sort")
	public String sort(
			@RequestParam(value = "orgId") BigDecimal orgId,
			@RequestParam(value = "year") Integer year, 
			@RequestParam(value = "month") Integer month, 
			@RequestParam(value = "orderType") String orderType, 
			@RequestParam(value = "orderKind") int orderKind, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(YC_ORG_ID.equals(orgId)){
				orgId = YC_AREA_ID;
			}
			
			List<JSONObject> sortData = ycCityDataCenterService
					.selectSortDataByOrderType(orgId, year, month, orderType, orderKind, orgId.compareTo(YC_AREA_ID)==0?1:0);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("sortData", sortData);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】sortData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	/**
	 * 
	 * 新版接口
	 * 
	 */
	@RequestMapping(value = "/interface/json/cityDataCenter/ycNew/firstPageData")
	public String newFirstPageData(
			@RequestParam(value = "orgId") BigDecimal orgId,
			@RequestParam(value = "year", required = false) Integer year, 
			@RequestParam(value = "month", required = false) Integer month, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			Integer orgKind = 0; 
			/*if(YC_ORG_ID.equals(orgId)){
				orgId = YC_AREA_ID;
			}else{
				orgKind = 0; 
			}*/
			
			/*获取最新数据年份月份*/
			String sql = "select t1.year_caliber from r_pk_ei_mn_ac_log t1 where t1.organization_id = ? and t1.organization_kind = ? and t1.zyywsr_value is not null group by t1.year_caliber order by 1 desc ";
			List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{orgId, orgKind});
			
			List<Object> yearList = new ArrayList<>();
			Integer yearCaliber = 0;
			Integer monthCaliber = 0;
			if(!list.isEmpty()){
				yearCaliber = Integer.valueOf(list.get(0).get("year_caliber").toString());
				for(Map<String, Object> record:list){
					yearList.add(record.get("year_caliber"));
				}
				sql = "select max(t1.month_caliber) from r_pk_ei_mn_ac_log t1 where t1.organization_id = ? and t1.organization_kind = ? and t1.year_caliber = ? and t1.zyywsr_value is not null ";
				monthCaliber = jdbcTemplate.queryForObject(sql, Integer.class, new Object[]{orgId, orgKind, yearCaliber});
			}
			if(year==null||month==null){
				year = yearCaliber;
				month = monthCaliber;
			}
			
			JSONObject value = ycCityDataCenterService
					.newFirstPageData(orgId, year, month);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("value", value);
			modelMap.addAttribute("yearList", yearList);
			modelMap.addAttribute("year", year);
			modelMap.addAttribute("month", month);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】firstPageData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	/**
	 * type 1：区县  2：园区  0：省市
	 * @param orgId
	 * @param year
	 * @param month
	 * @param request
	 * @param type
	 * @param response
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/interface/json/cityDataCenter/ycNew/fourthPageData")
	public String newFourthPageData(
			@RequestParam(value = "orgId") BigDecimal orgId,
			@RequestParam(value = "parkId", required = false) BigDecimal parkId,
			@RequestParam(value = "year", required = false) Integer year, 
			@RequestParam(value = "month", required = false) Integer month, 
			@RequestParam(value = "type", defaultValue = "1") Integer type,
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(YC_ORG_ID.equals(orgId)){
				orgId = YC_AREA_ID;
			}
			
			List<Object> yearList = new ArrayList<>();
			if(type==1){
				/*获取最新数据年份月份*/
				String sql = "select t1.year_caliber from r_pk_ei_mn_ac_log t1 where exists (select 1 from t_area_info t2 where t2.area_id = t1.organization_id and t2.parent_id = ? ) and t1.organization_kind = 1 and t1.zyywsr_value is not null group by t1.year_caliber order by 1 desc ";
				List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{YC_AREA_ID});
				
				Integer yearCaliber = 0;
				Integer monthCaliber = 0;
				if(!list.isEmpty()){
					yearCaliber = Integer.valueOf(list.get(0).get("year_caliber").toString());
					for(Map<String, Object> record:list){
						yearList.add(record.get("year_caliber"));
					}
					sql = "select max(t1.month_caliber) from r_pk_ei_mn_ac_log t1 where exists (select 1 from t_area_info t2 where t2.area_id = t1.organization_id and t2.parent_id = ? ) and t1.organization_kind = 1 and t1.year_caliber = ? and t1.zyywsr_value is not null ";
					monthCaliber = jdbcTemplate.queryForObject(sql, Integer.class, new Object[]{YC_AREA_ID, yearCaliber});
				}
				if(year==null||month==null){
					year = yearCaliber;
					month = monthCaliber;
				}
			}else if(type==2){
				/*获取最新数据年份月份*/
				String sql = "select t1.year_caliber from r_pk_in_op_mn_ac_log t1 where exists (select 1 from t_park_info t2 where t2.park_id = t1.organization_id and t2.area_id = ? ) and t1.organization_kind = 2 and t1.zyywsr_value is not null group by t1.year_caliber order by 1 desc ";
				List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{YC_AREA_ID});
				
				
				Integer yearCaliber = 0;
				Integer monthCaliber = 0;
				if(!list.isEmpty()){
					yearCaliber = Integer.valueOf(list.get(0).get("year_caliber").toString());
					for(Map<String, Object> record:list){
						yearList.add(record.get("year_caliber"));
					}
					sql = "select max(t1.month_caliber) from r_pk_in_op_mn_ac_log t1 where exists (select 1 from t_park_info t2 where t2.park_id = t1.organization_id and t2.area_id = ? ) and t1.organization_kind = 2 and t1.year_caliber = ? and t1.zyywsr_value is not null ";
					monthCaliber = jdbcTemplate.queryForObject(sql, Integer.class, new Object[]{YC_AREA_ID, yearCaliber});
				}
				if(year==null||month==null){
					year = yearCaliber;
					month = monthCaliber;
				}
			}else{
				/*获取最新数据年份月份*/
				String sql = "select t1.year_caliber from r_pk_in_op_mn_ac_log t1 where exists (select 1 from t_area_info t2 where t2.area_id = t1.organization_id and t2.parent_id = ? ) and t1.organization_kind = 1 and t1.zyywsr_value is not null group by t1.year_caliber order by 1 desc ";
				List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{JX_AREA_ID});
				
				Integer yearCaliber = 0;
				Integer monthCaliber = 0;
				if(!list.isEmpty()){
					yearCaliber = Integer.valueOf(list.get(0).get("year_caliber").toString());
					for(Map<String, Object> record:list){
						yearList.add(record.get("year_caliber"));
					}
					sql = "select max(t1.month_caliber) from r_pk_in_op_mn_ac_log t1 where exists (select 1 from t_area_info t2 where t2.area_id = t1.organization_id and t2.parent_id = ? ) and t1.organization_kind = 1 and t1.year_caliber = ? and t1.zyywsr_value is not null ";
					monthCaliber = jdbcTemplate.queryForObject(sql, Integer.class, new Object[]{JX_AREA_ID, yearCaliber});
				}
				if(year==null||month==null){
					year = yearCaliber;
					month = monthCaliber;
				}
			}
			

			if(parkId!=null&&type==2){
				orgId=parkId;
			}
			
			JSONObject value = ycCityDataCenterService
					.newFourthPageData(orgId, year, month, type);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("value", value);
			modelMap.addAttribute("yearList", yearList);
			modelMap.addAttribute("year", year);
			modelMap.addAttribute("month", month);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】fourthPageData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	/**
	 * 
	 * 
	 * 
	 */
	@RequestMapping(value = "/interface/json/cityDataCenter/ycNew/valueData")
	public String valueData(
			@RequestParam(value = "year", required = false) Integer year, 
			@RequestParam(value = "month", required = false) Integer month, 
			@RequestParam(value = "type", defaultValue = "1") Integer type,
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			String sql = "";
			if(year==null){
				sql = "select year_caliber, month_caliber from r_pk_in_op_mn_ac_log "
						+ " where organization_kind = 1 and organization_id in "
						+ " (select area_id from t_area_info where parent_id=?) order by year_caliber desc, month_caliber desc ";
				List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql, BigDecimal.valueOf(360000));
				if(!list1.isEmpty()){
					year = Integer.valueOf(list1.get(0).get("year_caliber").toString());
					month= Integer.valueOf(list1.get(0).get("month_caliber").toString());
				}
			}else{
				sql = "select month_caliber from r_pk_in_op_mn_ac_log where organization_kind = 1 and year_caliber = ? and organization_id in (select area_id from t_area_info where parent_id=?) order by 1 desc ";
				List<Map<String, Object>> list2 = jdbcTemplate.queryForList(sql, new Object[]{year,BigDecimal.valueOf(360000)});
				if(!list2.isEmpty()){
					month= Integer.valueOf(list2.get(0).get("month_caliber").toString());
				}
			}
			
			
			/*获取主营业务收入（万元） 利润总额（万元） 从业人员*/
			sql = "select ZYYWSR_VALUE,LR_VALUE,CSGYSCHD_CYRY_VALUE, organization_name from r_pk_in_op_mn_ac_log "
					+ "where organization_kind = 1 and year_caliber = ? and month_caliber = ? and organization_id in (select area_id from t_area_info where parent_id= ? ) ";
					
			if(type==1){
				sql += "order by ZYYWSR_VALUE desc ";
			}else if(type==2){
				sql += "order by LR_VALUE desc ";
			}else{
				sql += "order by CSGYSCHD_CYRY_VALUE desc ";
			}
			List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{year, month, BigDecimal.valueOf(360000)});
			
			List<JSONObject> valueList = new ArrayList<>();
			if(!list.isEmpty()){
				DecimalFormat df = new DecimalFormat("#0.0");
				for(Map<String, Object> record:list){
					JSONObject jsonObject=new JSONObject();
					jsonObject.put("orgName",record.get("organization_name"));
					if(type==1){
						jsonObject.put("value", record.get("ZYYWSR_VALUE") == null ? "" : df.format(Double.parseDouble(record.get("ZYYWSR_VALUE").toString())/10000));
					}else if(type==2){
						jsonObject.put("value", record.get("LR_VALUE") == null ? "" : df.format(Double.parseDouble(record.get("LR_VALUE").toString())/10000));
					}else if(type==3){
						jsonObject.put("value", record.get("CSGYSCHD_CYRY_VALUE") == null ? "" : df.format(Double.parseDouble(record.get("CSGYSCHD_CYRY_VALUE").toString())/10000));
					}
					valueList.add(jsonObject);
				}
			}
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("valueList", valueList);
			modelMap.addAttribute("year", year);
			modelMap.addAttribute("month", month);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】valueData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	
	/*****************************************************************************************************************************
	 * 
	 * 
	 * 												宜春数据中心新版经济指标接口
	 * 
	 * 
	 * ****************************************************************************************************************************
	 */
	
	
	/**
	 * 1：工业增加值 2：主营业务收入 3：利润总额  4：利润率
	 * 查询宜春市各县区经济指标数据
	 * @return
	 */
	@RequestMapping(value = "/interface/json/cityDataCenter/ycNew/selectSpaceEconomicData")
	public String selectSpaceEconomicData(
			@RequestParam(value = "areaId", required = false) BigDecimal areaId,
			@RequestParam(value = "year", required = false) Integer year, 
			@RequestParam(value = "month", required = false) Integer month, 
			@RequestParam(value = "orderType", required = false) Integer orderType, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(areaId==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数areaId未设置！");
				return "jsonView";
			}
			
			if(orderType==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数orderType未设置！");
				return "jsonView";
			}
			
			/*获取最新数据年份月份*/
			String sql = "select t1.year_caliber from r_pk_ei_mn_ac_log t1 where exists (select 1 from t_area_info t2 where t2.area_id = t1.organization_id and t2.parent_id = ? ) and t1.organization_kind = 1 and t1.zyywsr_value is not null group by t1.year_caliber order by 1 desc ";
			List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, areaId);
			
			Integer yearCaliber = 0;
			Integer monthCaliber = 0;
			List<Object> yearList = new ArrayList<>();
			if(!list.isEmpty()){
				yearCaliber = Integer.valueOf(list.get(0).get("year_caliber").toString());
				for(Map<String, Object> record:list){
					yearList.add(record.get("year_caliber"));
				}
				sql = "select max(t1.month_caliber) from r_pk_ei_mn_ac_log t1 where exists (select 1 from t_area_info t2 where t2.area_id = t1.organization_id and t2.parent_id = ? ) and t1.organization_kind = 1 and t1.year_caliber = ? and t1.zyywsr_value is not null ";
				monthCaliber = jdbcTemplate.queryForObject(sql, Integer.class, new Object[]{areaId, yearCaliber});
			}
			if(year==null||month==null){
				year = yearCaliber;
				month = monthCaliber;
			}
			
			List<JSONObject> value = ycCityDataCenterService.selectSpaceEconomicData(areaId, year, month, orderType);
			
			Double total = 0.0;
			if(!value.isEmpty()){
				for(JSONObject jo : value){
					total += (jo.getDouble("value")==null?0:jo.getDouble("value"));
				}
			}
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("yearList", yearList);
			modelMap.addAttribute("year", year);
			modelMap.addAttribute("month", month);
			modelMap.addAttribute("value", value);
			modelMap.addAttribute("total", total);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】selectSpaceEconomicData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	/**
	 * 查询宜春市各县区月份经济指标数据
	 * @return
	 */
	@RequestMapping(value = "/interface/json/cityDataCenter/ycNew/selectSpaceMonthEconomicData")
	public String selectSpaceMonthEconomicData(
			@RequestParam(value = "spaceId") BigDecimal spaceId,
			@RequestParam(value = "year", required = false) Integer year, 
			@RequestParam(value = "month", defaultValue = "12") Integer month, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(spaceId==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数spaceId未设置！");
				return "jsonView";
			}
			
			if(year==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数year未设置！");
				return "jsonView";
			}
			
			Map<String, JSONArray> value = ycCityDataCenterService.selectSpaceMonthEconomicData(spaceId, year, month);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("value", value);
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】selectSpaceMonthEconomicData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	/**
	 * 查询宜春市各县区效益分析数据
	 * @return
	 */
	@RequestMapping(value = "/interface/json/cityDataCenter/ycNew/selectSpaceBenefitAnalysisData")
	public String selectSpaceBenefitAnalysisData(
			@RequestParam(value = "areaId") BigDecimal areaId,
			@RequestParam(value = "year", required = false) Integer year, 
			@RequestParam(value = "month", defaultValue = "12") Integer month, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(areaId==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数areaId未设置！");
				return "jsonView";
			}
			
			/*获取最新数据年份月份*/
			String sql = "select t1.year_caliber from r_pk_ei_mn_ac_log t1 where exists (select 1 from t_area_info t2 where t2.area_id = t1.organization_id and t2.parent_id = ? ) and t1.organization_kind = 1 and t1.month_caliber in (3,6,9,12) and t1.zyywsr_value is not null group by t1.year_caliber order by 1 desc ";
			List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, areaId);
			
			Integer yearCaliber = 0;
			Integer monthCaliber = 0;
			List<Object> yearList = new ArrayList<>();
			if(!list.isEmpty()){
				yearCaliber = Integer.valueOf(list.get(0).get("year_caliber").toString());
				for(Map<String, Object> record:list){
					yearList.add(record.get("year_caliber"));
				}
				sql = "select max(t1.month_caliber) from r_pk_ei_mn_ac_log t1 where exists (select 1 from t_area_info t2 where t2.area_id = t1.organization_id and t2.parent_id = ? ) and t1.month_caliber in (3,6,9,12) and t1.organization_kind = 1 and t1.year_caliber = ? and t1.zyywsr_value is not null ";
				monthCaliber = jdbcTemplate.queryForObject(sql, Integer.class, new Object[]{areaId, yearCaliber});
			}
			if(year==null||month==null){
				year = yearCaliber;
				month = monthCaliber;
			}
			
			Map<String, Object> value = ycCityDataCenterService.selectSpaceBenefitAnalysisData(areaId, year, month);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			
			modelMap.addAttribute("value", value);
			modelMap.addAttribute("yearList", yearList);
			modelMap.addAttribute("year", year);
			modelMap.addAttribute("month", month);
			modelMap.addAttribute("value", value);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】selectSpaceMonthEconomicData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	/** 园区
	 * 1：从业人员 2：主营业务收入 3：利润总额  4：利润率
	 * 查询宜春市各县区经济指标数据
	 * @return
	 */
	@RequestMapping(value = "/interface/json/cityDataCenter/ycNew/selectParkEconomicData")
	public String selectParkEconomicData(
			@RequestParam(value = "areaId", required = false) BigDecimal areaId,
			@RequestParam(value = "year", required = false) Integer year, 
			@RequestParam(value = "month", required = false) Integer month, 
			@RequestParam(value = "orderType", required = false) Integer orderType, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(areaId==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数areaId未设置！");
				return "jsonView";
			}
			
			if(orderType==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数orderType未设置！");
				return "jsonView";
			}
			
			/*获取最新数据年份月份*/
			String sql = "select t1.year_caliber from r_pk_in_op_mn_ac_log t1 where "
					+ "exists (select 1 from t_park_info t2 where t2.park_id = t1.organization_id and t2.area_id = ? ) "
					+ "and t1.organization_kind = 2 and t1.month_caliber in (3,6,9,12) and t1.zyywsr_value is not null group by t1.year_caliber order by 1 desc ";
			List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{YC_AREA_ID});
			
			
			Integer yearCaliber = 0;
			Integer monthCaliber = 0;
			List<Object> yearList = new ArrayList<>();
			if(!list.isEmpty()){
				yearCaliber = Integer.valueOf(list.get(0).get("year_caliber").toString());
				for(Map<String, Object> record:list){
					yearList.add(record.get("year_caliber"));
				}
				sql = "select max(t1.month_caliber) from r_pk_in_op_mn_ac_log t1 where "
						+ "exists (select 1 from t_park_info t2 where t2.park_id = t1.organization_id and t2.area_id = ? ) "
						+ "and t1.organization_kind = 2 and t1.month_caliber in (3,6,9,12) and t1.year_caliber = ? and t1.zyywsr_value is not null ";
				monthCaliber = jdbcTemplate.queryForObject(sql, Integer.class, new Object[]{YC_AREA_ID, yearCaliber});
			}
			if(year==null||month==null){
				year = yearCaliber;
				month = monthCaliber;
			}
			
			List<JSONObject> value = ycCityDataCenterService.selectParkEconomicData(areaId, year, month, orderType);
			
			Double total = 0.0;
			if(!value.isEmpty()){
				for(JSONObject jo : value){
					total += (jo.getDouble("value")==null?0:jo.getDouble("value"));
				}
			}
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("yearList", yearList);
			modelMap.addAttribute("year", year);
			modelMap.addAttribute("month", month);
			modelMap.addAttribute("value", value);
			modelMap.addAttribute("total", total);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】selectSpaceEconomicData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	/**
	 * 查询宜春市各县区月份经济指标数据
	 * @return
	 */
	@RequestMapping(value = "/interface/json/cityDataCenter/ycNew/selectParkMonthEconomicData")
	public String selectParkMonthEconomicData(
			@RequestParam(value = "parkId") BigDecimal parkId,
			@RequestParam(value = "year", required = false) Integer year, 
			@RequestParam(value = "month", defaultValue = "12") Integer month, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(parkId==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数parkId未设置！");
				return "jsonView";
			}
			
			if(year==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数year未设置！");
				return "jsonView";
			}
			
			Map<String, JSONArray> value = ycCityDataCenterService.selectparkMonthEconomicData(parkId, year, month);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("value", value);
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】selectSpaceMonthEconomicData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
	
	@RequestMapping(value = "/interface/json/cityDataCenter/ycNew/selectParkBenefitAnalysisData")
	public String selectParkBenefitAnalysisData(
			@RequestParam(value = "areaId") BigDecimal areaId,
			@RequestParam(value = "year", required = false) Integer year, 
			@RequestParam(value = "month", defaultValue = "12") Integer month, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(areaId==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数areaId未设置！");
				return "jsonView";
			}
			
			/*获取最新数据年份月份*/
			String sql = "select t1.year_caliber from r_pk_in_op_mn_ac_log t1 "
					+ "where exists (select 1 from t_park_info t2 where t2.park_id = t1.organization_id and t2.area_id = ? ) "
					+ "and t1.organization_kind = 2 and t1.month_caliber in (3,6,9,12) and t1.zyywsr_value is not null group by t1.year_caliber order by 1 desc ";
			List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{YC_AREA_ID});
			
			
			Integer yearCaliber = 0;
			Integer monthCaliber = 0;
			List<Object> yearList = new ArrayList<>();
			if(!list.isEmpty()){
				yearCaliber = Integer.valueOf(list.get(0).get("year_caliber").toString());
				for(Map<String, Object> record:list){
					yearList.add(record.get("year_caliber"));
				}
				sql = "select max(t1.month_caliber) from r_pk_in_op_mn_ac_log t1 "
						+ "where exists (select 1 from t_park_info t2 where t2.park_id = t1.organization_id and t2.area_id = ? ) "
						+ "and t1.organization_kind = 2 and t1.month_caliber in (3,6,9,12) and t1.year_caliber = ? and t1.zyywsr_value is not null ";
				monthCaliber = jdbcTemplate.queryForObject(sql, Integer.class, new Object[]{YC_AREA_ID, yearCaliber});
			}
			if(year==null||month==null){
				year = yearCaliber;
				month = monthCaliber;
			}
			
			Map<String, Object> value = ycCityDataCenterService.selectParkBenefitAnalysisData(areaId, year, month);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			
			modelMap.addAttribute("value", value);
			modelMap.addAttribute("yearList", yearList);
			modelMap.addAttribute("year", year);
			modelMap.addAttribute("month", month);
			modelMap.addAttribute("value", value);
			
		}catch (Exception e) {
			logger.error("【市级数据中心-宜春】selectSpaceMonthEconomicData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
}
