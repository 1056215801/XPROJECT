package com.chinatelecom.jx.zone.management.service.parkDataCenter;

import java.math.BigDecimal;
import java.util.Map;

public interface IYYDataCenterService {

	Map<String, Object> selectCompanyDistributionData(BigDecimal orgId, Integer year, Integer month);

	Map<String, Object> selectCompanySortData(BigDecimal orgId, Integer year, Integer month, Integer orderType);

	Map<String, Object> selectChartData(BigDecimal orgId, Integer year, Integer type);

	Map<String, Object> selectCompanyIndustryStatisticsData(BigDecimal orgId);

	Map<String, Object> selectParkEconomic(BigDecimal orgId, Integer year);

	Map<String, Object> selectIndustryEconomic(BigDecimal orgId, Integer year);
	
	public Integer selectYearByParkId(BigDecimal orgId, Short type);
}
