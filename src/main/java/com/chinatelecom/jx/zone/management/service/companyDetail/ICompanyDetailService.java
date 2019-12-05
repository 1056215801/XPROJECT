package com.chinatelecom.jx.zone.management.service.companyDetail;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public interface ICompanyDetailService {

	Map<String, Object> selectFirstDataByCompanyId(BigDecimal companyId);

	List<JSONObject> selectSecondDataByCompanyIdAndKind(BigDecimal companyId, String kind) throws Exception;

	
	/*****************************************************
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * ***************************************************
	 */

    JSONObject riskDimensionCountByCompany(BigDecimal companyId);

    JSONObject equityDimensionCountByCompany(BigDecimal companyId);

    JSONObject detailByCompanyAndDimension(BigDecimal companyId,String type);

    JSONObject gsBaseDetailByCompany(BigDecimal companyId);

    JSONObject reportReviewInfoByCompany(BigDecimal companyId);

    JSONArray associationMap(BigDecimal companyId);

    String getCompanyName(BigDecimal companyId);

    JSONObject countByYear(BigDecimal companyId,String type,String viewName);

    List<Map<String,Object>> riskList(BigDecimal companyId);

    Map<String,Object> getDetailById(JSONArray queryList);

    Map<String,Integer> innovation(BigDecimal companyId);

    Map<String,Integer> investCount(BigDecimal companyId);

    JSONObject invest(BigDecimal companyId);

    Map<String,Integer> riskTotal(BigDecimal companyId);
}
