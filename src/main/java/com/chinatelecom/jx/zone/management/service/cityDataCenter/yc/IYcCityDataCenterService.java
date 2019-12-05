package com.chinatelecom.jx.zone.management.service.cityDataCenter.yc;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public interface IYcCityDataCenterService {
	
	/**
	 * 首页数据
	 * @param orgId
	 * @param year
	 * @param month
	 * @return
	 */
	JSONObject selectFirstPageData(BigDecimal orgId, Integer year, Integer month);

	/**
	 * 第二页数据
	 * @param orgId
	 * @param areaId
	 * @param year
	 * @param month
	 * @return
	 */
	JSONObject selectSecondPageData(BigDecimal orgId, BigDecimal areaId, Integer year,
			Integer month);
	
	/**
	 * 第三页数据
	 * @param orgId
	 * @param year
	 * @param month
	 * @param orderType
	 * @return
	 */
	List<JSONObject> selectThirdPageData(BigDecimal orgId, Integer year, Integer month, Integer orderType);
	
	/**
	 * 第四页数据
	 * @param orgId
	 * @param parkId
	 * @param year
	 * @param month
	 * @return
	 */
	JSONObject selectFourthPageData(BigDecimal orgId, BigDecimal parkId, Integer year, Integer month);
	
	/**
	 * 第五页数据
	 * @param orgId
	 * @param year
	 * @param month
	 * @param orderType
	 * @return
	 */
	List<JSONObject> selectFifthPageData(BigDecimal orgId, Integer year, Integer month, Integer orderType);

	/**
	 * 第六页数据
	 * @param orgId
	 * @param year
	 * @param month
	 * @return
	 */
	JSONObject selectSixthPageData(BigDecimal orgId, Integer year, Integer month);
	
	/**
	 * 第七页数据
	 * @param orgId
	 * @param year
	 * @param month
	 * @param orderType 
	 * @return
	 */
	JSONObject selectSeventhPageData(BigDecimal orgId, Integer year, Integer month, Integer orderType);

	List<JSONObject> selectPercentData(BigDecimal orgId, Integer year, Integer month, String value);
	
	/**
	 * 获取制定字段排序
	 * @param orgId
	 * @param year
	 * @param month
	 * @param orderType
	 * @param orderKind 
	 * @return
	 */
	List<JSONObject> selectSortDataByOrderType(BigDecimal orgId, Integer year, Integer month, String orderType, Integer orderKind, Integer orgKind);

	JSONObject newFirstPageData(BigDecimal orgId, Integer year, Integer month);

	JSONObject newFourthPageData(BigDecimal orgId, Integer year, Integer month, Integer type);
	
	List<JSONObject> selectSpaceEconomicData(BigDecimal areaId, Integer year, Integer month, Integer orderType);

	Map<String, JSONArray> selectSpaceMonthEconomicData(BigDecimal spaceId, Integer year, Integer month);

	List<JSONObject> selectParkEconomicData(BigDecimal areaId, Integer year, Integer month, Integer orderType);

	Map<String, JSONArray> selectparkMonthEconomicData(BigDecimal parkId, Integer year, Integer month);

	Map<String, Object> selectSpaceBenefitAnalysisData(BigDecimal areaId, Integer year, Integer month);

	Map<String, Object> selectParkBenefitAnalysisData(BigDecimal areaId, Integer year, Integer month);

	

}
