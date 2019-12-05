package com.chinatelecom.jx.zone.management.service.dataCenter;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;

public interface IDataCenterService {
	
	/**
	 * 获取组织所在地市
	 * @param orgId
	 * @param provinceId
	 * @return
	 */
	public JSONObject getAreaInfoByOrgIdAndProvinceId(BigDecimal orgId, BigDecimal provinceId);

	/**
	 * 获取有数据年份列表，季度列表
	 * @return
	 */
	public Map<String, List<JSONObject>> selectSearchList();

	/**
	 * 获取最近录入数据年份和季度
	 * @return
	 */
	public JSONObject selectDefaultSearchInfo();
	
	/**
	 * 园区数据
	 * @param areaId
	 * @param year
	 * @param isProvince
	 * @param provinceId
	 * @return
	 */
	public JSONObject selectParkDataByAreaIdAndYear(Integer areaId, Integer year, Boolean isProvince, BigDecimal provinceId);

	/**
	 * 园区地图数据
	 * @param areaId
	 * @param year
	 * @param isProvince
	 * @param provinceId
	 * @return
	 */
	public JSONObject selectMapDataByAreaIdAndYear(Integer areaId, Integer year, Boolean isProvince, BigDecimal provinceId);
	
	/**
	 * 经济指标、企业数据
	 * @param areaId
	 * @param year
	 * @param quarter
	 * @param isProvince
	 * @return
	 */
	public JSONObject selectCompAndEcDataByAreaIdAndYearAndQuarter(Integer areaId, Integer year, Integer quarter, Boolean isProvince, BigDecimal provinceId);

	/**
	 * 经济指标数据
	 * @param areaId
	 * @param year
	 * @param isProvince
	 * @return
	 */
	public JSONObject selectEconomicDataByAreaIdAndYear(Integer areaId, Integer year, Boolean isProvince);

	/**
	 * 工业产值
	 * @param areaId
	 * @param year
	 * @param quarter
	 * @param isProvince
	 * @param provinceId
	 * @param industryType
	 * @return
	 */
	public JSONObject selectIndustryDataByAreaIdAndYearAndQuarter(Integer areaId, Integer year, Integer quarter, Boolean isProvince, BigDecimal provinceId, Short industryType);

	/**
	 * 企业能耗
	 * @param year
	 * @return
	 */
	public JSONObject selectEnergyDataByYear(Integer year);
	
	
}
