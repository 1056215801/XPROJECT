package com.chinatelecom.jx.zone.management.service.parkDataCenter;

import java.math.BigDecimal;
import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface ICommonDataCenterService {
	/**
	 * 获取园区数据中心配置信息
	 * @param parkId
	 * @return
	 */
	public JSONObject selectParkDataCenterConfigByParkId(BigDecimal parkId);

	/**
	 * 获取园区产业列表
	 * @param orgId
	 * @return
	 */
	public List<JSONObject> selectTypeListByParkId(BigDecimal orgId, Integer year);
	
	/**
	 * 获取园区经济指标数据
	 * @param orgId
	 * @param year
	 * @param isPkLocalShow 
	 * @param pkIndexCode
	 * @return
	 */
	public JSONObject selectPkEconDataByParkIdAndYear(BigDecimal orgId, Integer year, Integer isPkLocalShow, String pkIndexCode);

	/**
	 * 获取产业经济指标数据
	 * @param orgId
	 * @param year
	 * @param indIndexCode
	 * @return
	 */
	public JSONObject selectIndEconDataByParkIdAndYear(BigDecimal orgId, Integer year, String indIndexCode);

	/**
	 * 判断是否有产业经济指标数据
	 * @param orgId
	 * @param year
	 * @param i
	 * @param isPkLocalShow 
	 * @return
	 */
	public Boolean selectEconIsAnyDataByParkIdAndYear(BigDecimal orgId, Integer year, int i, Integer isPkLocalShow);
	
	/**
	 * 获取企业统计数据
	 * @param orgId
	 * @param standardSize
	 * @return
	 */
	public JSONObject selectCompDataByParkIdAndStandardSize(BigDecimal orgId, Short standardSize);

	/**
	 * 获取已有数据最大年份
	 * @param orgId
	 * @param type
	 * @return
	 */
	public Integer selectYearByParkId(BigDecimal orgId, Short type, Integer isPkLocalShow);
	
}
