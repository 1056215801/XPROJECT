package com.chinatelecom.jx.zone.management.service.cityDataCenter.common;

import java.math.BigDecimal;

import com.alibaba.fastjson.JSONObject;

public interface ICommonCityDataCenterService {

	JSONObject getAreaInfoByOrgIdAndProvinceId(BigDecimal orgId, BigDecimal provinceId);

	JSONObject selectSearchList(BigDecimal orgId, int pageType);

	JSONObject selectDefaultSearchInfo(BigDecimal orgId, int pageType);

	boolean isSyncDataCompany(BigDecimal companyId);

}
