package com.chinatelecom.jx.zone.management.service.cityDataCenter.common;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;

@Service
@Transactional(rollbackFor = Exception.class)
public class CommonCityDataCenterServiceImpl implements ICommonCityDataCenterService {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public JSONObject getAreaInfoByOrgIdAndProvinceId(BigDecimal orgId, BigDecimal provinceId) {
		StringBuilder sql = new StringBuilder().append("select organization_id, organization_name ")
				.append("from (select * ").append("from t_organization_info ").append("start with organization_id = ? ")
				.append("connect by prior parent_id = organization_id) ").append(" where organization_kind = 0 ")
				.append("and parent_id = ? ").append("or (organization_id = ?) ")
				.append("order by organization_id desc ");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(),
				new Object[] { orgId, provinceId, provinceId });

		JSONObject areaInfo = new JSONObject();
		if (!list.isEmpty()) {
			areaInfo.put("areaId", list.get(0).get("organization_id"));
			areaInfo.put("areaName", list.get(0).get("organization_name"));
			areaInfo.put("isProvince", list.size() > 1 ? false : true);
		}

		return areaInfo;
	}

	@Override
	public JSONObject selectSearchList(BigDecimal orgId, int pageType) {
		List<JSONObject> yearList = new ArrayList<>();
		List<JSONObject> monthList = new ArrayList<>();

		StringBuilder sql = new StringBuilder().append("select year_caliber ");
		if (pageType == 1) {
			sql.append("from r_pk_ei_mn_ac_log ");
		} else if (pageType == 3){
			sql.append("from r_pk_in_op_mn_ac_log ");
		} else {
			sql.append("from r_pk_in_tp_in_op_mn_ac_4_log ");
		}
		sql.append("where organization_id = ? ").append("group by year_caliber ").append("order by year_caliber desc ");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), orgId);
		if (!list.isEmpty()) {
			for (Map<String, Object> record : list) {
				JSONObject jo = new JSONObject();
				jo.put("year", record.get("year_caliber"));
				yearList.add(jo);
			}
		}

		/* 此处季度为写死四季度，可以扩展为动态获取有数据季度 */
		/* 业务调整为按月展示，此处参数名不变 */
		int monthNum = 12;
		for (int i = 0; i < monthNum; i++) {
			JSONObject jo = new JSONObject();
			jo.put("month", i + 1);
			monthList.add(jo);
		}

		JSONObject jo = new JSONObject();
		jo.put("yearList", yearList);
		jo.put("monthList", monthList);

		return jo;
	}

	@Override
	public JSONObject selectDefaultSearchInfo(BigDecimal orgId, int pageType) {
		StringBuilder sql = new StringBuilder().append("select max(a.month_caliber) month, max(b.year) year ");
		if (pageType == 1) {
			sql.append("from r_pk_ei_mn_ac_log a, ")
					.append("(select max(year_caliber) year from r_pk_ei_mn_ac_log) b ");
		} else if (pageType == 3){
			sql.append("from r_pk_in_op_mn_ac_log a, ")
			.append("(select max(year_caliber) year from r_pk_ei_mn_ac_log) b ");
		}  else {
			sql.append("from r_pk_in_tp_in_op_mn_ac_4_log a, ")
					.append("(select max(year_caliber) year from r_pk_in_tp_in_op_mn_ac_4_log) b ");
		}
		sql.append("where a.year_caliber = b.year and organization_id = ? ");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), orgId);

		JSONObject jo = new JSONObject();
		if (!list.isEmpty()) {
			jo.put("year", list.get(0).get("year"));
			jo.put("month", list.get(0).get("month"));
		}

		return jo;
	}

	@Override
	public boolean isSyncDataCompany(BigDecimal companyId) {
		String sql = "select count(1) from x_data.z_s_result where company_primary_id = ? ";
		int count = jdbcTemplate.queryForObject(sql, Integer.class, companyId);
		return count>0?true:false;
	}

}
