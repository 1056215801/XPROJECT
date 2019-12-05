package com.chinatelecom.jx.zone.management.service.parkDataCenter;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.util.StringUtil;

@Service
@Transactional(rollbackFor = Exception.class)
public class CommonDataCenterServiceImpl implements ICommonDataCenterService {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public JSONObject selectParkDataCenterConfigByParkId(BigDecimal parkId) {
		String sql = "select * from X_OFFICE.t_park_data_center_config where park_id = ?";

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[] { parkId });

		JSONObject jo = new JSONObject();
		if (!list.isEmpty()) {
			jo.put("imageUrl", list.get(0).get("image_url"));
			jo.put("isPkPctShow", list.get(0).get("is_pk_pct_show"));
			jo.put("isPkLocalShow", list.get(0).get("is_pk_local_show"));
			jo.put("pkIndexCode", list.get(0).get("pk_index_code"));
			jo.put("pkIndexName", list.get(0).get("pk_index_name"));
			jo.put("pkIndexNum", list.get(0).get("pk_index_num"));
			jo.put("isIndPctShow", list.get(0).get("is_ind_pct_show"));
			jo.put("indIndexCode", list.get(0).get("ind_index_code"));
			jo.put("indIndexName", list.get(0).get("ind_index_name"));
			jo.put("indIndexNum", list.get(0).get("ind_index_num"));
			jo.put("indexUrl", list.get(0).get("index_url"));
			jo.put("endUrl", list.get(0).get("end_url"));
		}

		return jo;
	}

	@Override
	public List<JSONObject> selectTypeListByParkId(BigDecimal orgId, Integer year) {
		String sql = "select type_name " + "from r_pk_in_tp_in_op_mn_us_4_log " + "where organization_id = ? "
				+ "and year_caliber = ? " + "group by type_name, sort_grade "
				+ "order by sort_grade asc";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[] { orgId, year });

		List<JSONObject> typeList = new ArrayList<>();
		if (!list.isEmpty()) {
			for (Map<String, Object> record : list) {
				JSONObject typeInfo = new JSONObject();
				typeInfo.put("typeName", record.get("type_name"));
				typeList.add(typeInfo);
			}
		}
		return typeList;
	}

	@Override
	public JSONObject selectPkEconDataByParkIdAndYear(BigDecimal orgId, Integer year, Integer isPkLocalShow,
			String pkIndexCode) {
		JSONObject jo = new JSONObject();
		String[] codes = pkIndexCode.split(",");
		String tableName = "";
		if (isPkLocalShow != null && isPkLocalShow == 1) {
			tableName = "r_pk_in_op_mn_ac_4_log ";
		} else {
			tableName = "r_pk_in_op_mn_ac_log ";
		}

		// 第一部分数据
		StringBuilder sql1 = new StringBuilder().append("select t.* from ").append(tableName)
				.append("t where t.organization_id = ? ").append("and t.year_caliber = ? ")
				.append("and t.month_caliber in (3, 6, 9, 12) ").append("order by t.quarter_caliber desc ");

		List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql1.toString(), new Object[] { orgId, year });

		JSONObject data1 = new JSONObject();
		JSONObject data2 = new JSONObject();
		if (!list1.isEmpty() && StringUtil.checkNotNull(pkIndexCode)) {
			Map<String, Object> record = list1.get(0);
			for (int i = 0; i < codes.length; i++) {
				data1.put(codes[i], record.get(codes[i]));
			}

			for (int i = 0; i < codes.length; i++) {
				JSONArray ja = new JSONArray();
				for (int j = list1.size() - 1; j >= 0; j--) {
					ja.add(list1.get(j).get(codes[i]));
				}
				data2.put(codes[i], ja);
			}
		}

		jo.put("data1", data1);
		jo.put("data2", data2);

		// 第三部分数据
		StringBuilder sql3 = new StringBuilder().append("select t.* from ").append(tableName)
				.append("t where t.organization_id = ? ").append("and t.year_caliber in (?, ?, ?) ")
				.append("and t.month_caliber = ").append("(select max(a.month_caliber) from ")
				.append(tableName).append("a where a.organization_id = t.organization_id ")
				.append("and a.year_caliber = t.year_caliber) ").append("order by t.year_caliber desc ");

		List<Map<String, Object>> list2 = jdbcTemplate.queryForList(sql3.toString(),
				new Object[] { orgId, year - 2, year - 1, year });

		JSONObject data3 = new JSONObject();
		if (!list2.isEmpty() && StringUtil.checkNotNull(pkIndexCode)) {
			JSONArray yAxis = new JSONArray();
			for (int i = 0; i < codes.length; i++) {
				JSONArray ja = new JSONArray();
				for (int j = list2.size() - 1; j >= 0; j--) {
					if (!yAxis.contains(list2.get(j).get("year_caliber"))) {
						yAxis.add(list2.get(j).get("year_caliber"));
					}
					ja.add(list2.get(j).get(codes[i]));
				}
				data3.put(codes[i], ja);
			}
			data3.put("yAxis", yAxis);
		}
		jo.put("data3", data3);

		return jo;
	}

	@Override
	public JSONObject selectIndEconDataByParkIdAndYear(BigDecimal orgId, Integer year, String indIndexCode) {
		JSONObject jo = new JSONObject();
		String[] codes = indIndexCode.split(",");

		/* 产业列表 */
		List<JSONObject> typeList = selectTypeListByParkId(orgId, year);

		// 第一部分数据 指标3年数据
		StringBuilder sql1 = new StringBuilder().append("select t.* ").append("from r_pk_in_tp_in_op_mn_us_4_log t ")
				.append("where t.organization_id = ? ").append("and t.year_caliber in (?, ?, ?) ")
				.append("and t.month_caliber = ").append("(select max(a.month_caliber) ")
				.append("from r_pk_in_tp_in_op_mn_us_4_log a ").append("where a.organization_id = t.organization_id ")
				.append("and a.year_caliber = t.year_caliber and a.month_caliber in(3,6,9,12))").append("order by t.year_caliber desc ");

		List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql1.toString(),
				new Object[] { orgId, year - 2, year - 1, year });

		JSONObject data1 = new JSONObject();

		if (!list1.isEmpty()) {
			JSONArray legend = new JSONArray();
			legend.add(year);
			legend.add(year - 1);
			legend.add(year - 2);

			if (codes.length > 0) {
				JSONArray xAxis = new JSONArray();
				for (int i = 0; i < codes.length; i++) {
					JSONObject jsonObject = new JSONObject();
					JSONArray seriesThis = new JSONArray();
					JSONArray seriesLast = new JSONArray();
					JSONArray seriesBefore = new JSONArray();
					for (Map<String, Object> record : list1) {
						int year_caliber = Integer.parseInt(record.get("year_caliber").toString());
						if (year_caliber == year) {
							if (!xAxis.contains(record.get("type_name"))) {
								xAxis.add(record.get("type_name"));
							}
							seriesThis.add(record.get(codes[i]));
						}

						if (year_caliber == (year - 1)) {
							seriesLast.add(record.get(codes[i]));
						}

						if (year_caliber == (year - 2)) {
							seriesBefore.add(record.get(codes[i]));
						}
					}
					jsonObject.put("seriesThis", seriesThis);
					jsonObject.put("seriesLast", seriesLast);
					jsonObject.put("seriesBefore", seriesBefore);
					data1.put(codes[i], jsonObject);
				}

				data1.put("xAxis", xAxis);
			}
			data1.put("legend", legend);
		}

		jo.put("data1", data1);

		// 第二部分数据
		StringBuilder sql2 = new StringBuilder().append("select t.* ").append("from r_pk_in_tp_in_op_mn_us_4_log t ")
				.append("where t.organization_id = ? ").append("and t.year_caliber = ? and t.month_caliber in (3,6,9,12) order by quarter_caliber asc ");
		
		List<Map<String, Object>> list2 = jdbcTemplate.queryForList(sql2.toString(), new Object[] { orgId, year });
		
		/*查询所有产业录入最小季度*/
		StringBuilder sql3 = new StringBuilder().append("select type_name, min(quarter_caliber) quarter_caliber, ")
				.append("(select max(quarter_caliber)")
				.append("from r_pk_in_tp_in_op_mn_us_4_log ")
				.append("where organization_id = ? and year_caliber = ? and month_caliber in (3,6,9,12)) max_quarter_caliber ")
				.append("from r_pk_in_tp_in_op_mn_us_4_log ").append("where organization_id = ? ")
				.append("and year_caliber = ? and month_caliber in (3,6,9,12)")
				.append("group by type_name");
		
		List<Map<String, Object>> list3 = jdbcTemplate.queryForList(sql3.toString(), new Object[] { orgId, year, orgId, year });
		Map<String, Integer> map = new HashMap<>();
		int maxQuarter = 0;
		if(!list3.isEmpty()){
			maxQuarter = Integer.parseInt(list3.get(0).get("max_quarter_caliber").toString());
			for (Map<String, Object> record : list3) {
				map.put(record.get("type_name").toString(), Integer.parseInt(record.get("quarter_caliber").toString()));
			}
		}
		JSONObject data2 = new JSONObject();
		JSONObject data3 = new JSONObject();
		if (!list2.isEmpty()) {
			for (int j = 0; j < codes.length; j++) {
				JSONObject series = new JSONObject();
				JSONArray codePie = new JSONArray();
				for (int i = 0; i < typeList.size(); i++) {
					Double count = 0.0;
					String nowTypeName = typeList.get(i).get("typeName").toString();
					JSONArray typeSeries = new JSONArray();
					int quarter = map.get(nowTypeName);
					if(quarter>1){
						for(int m = 0; m < (quarter-1); m++){
							typeSeries.add(null);
						}
					}
					for (Map<String, Object> record : list2) {
						String typeName = record.get("type_name").toString();
						if (typeName.equals(nowTypeName)) {
							typeSeries.add(record.get(codes[j]));
							if (codes[j].indexOf("_value") != -1&&maxQuarter==Integer.parseInt(record.get("quarter_caliber").toString())) {
								count = record.get(codes[j]) == null ? null
										: Double.parseDouble(record.get(codes[j]).toString());
							}
						}
					}
					series.put(typeList.get(i).getString("typeName"), typeSeries);
					if (codes[j].indexOf("_value") != -1) {
						JSONObject value = new JSONObject();
						value.put("name", typeList.get(i).getString("typeName"));
						value.put("value", count);
						codePie.add(value);
					}
				}

				data3.put(codes[j], codePie);
				data2.put(codes[j], series);
			}
		}

		jo.put("data2", data2);
		jo.put("data3", data3);
		return jo;
	}

	@Override
	public Boolean selectEconIsAnyDataByParkIdAndYear(BigDecimal orgId, Integer year, int i, Integer isPkLocalShow) {
		Boolean isAnyData = false;
		StringBuilder sql = new StringBuilder();
		sql.append("select count(1) total from ");
		if (i == 1) {
			if (isPkLocalShow != null && isPkLocalShow == 1) {
				sql.append("r_pk_in_op_mn_ac_4_log ");
			} else {
				sql.append("r_pk_in_op_mn_ac_log ");
			}
		} else {
			sql.append("r_pk_in_tp_in_op_mn_us_4_log ");
		}
		sql.append("where organization_id = ? and year_caliber = ?");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), new Object[] { orgId, year });
		if (!list.isEmpty()) {
			if (list.get(0).get("total") != null && Integer.parseInt(list.get(0).get("total").toString()) > 0) {
				isAnyData = true;
			}
		}

		return isAnyData;
	}

	@Override
	public JSONObject selectCompDataByParkIdAndStandardSize(BigDecimal orgId, Short standardSize) {
		StringBuilder sql = new StringBuilder();
		Object[] obj = null;
		sql.append("select b.type_name, count(a.type_id) total, b.sort_grade ")
				.append("from t_industry_type_company_now a ").append("left join t_industry_type_info_now b ")
				.append("on a.type_id = b.type_id ").append("where a.organization_id = ? ")
				.append("and exists (select 1 ").append("from t_company_info c ").append("where c.park_id = ? ");

		if (standardSize != null) {
			sql.append("and c.standard_size = ? ");
			obj = new Object[] { orgId, orgId, standardSize };
		} else {
			obj = new Object[] { orgId, orgId };
		}
		sql.append("and c.company_id = a.company_id) and b.type_name is not null ").append("group by b.type_name, b.sort_grade ")
				.append("order by b.sort_grade asc ");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), obj);

		JSONObject data = new JSONObject();
		if (!list.isEmpty()) {
			JSONArray pie = new JSONArray();
			JSONArray xAxis = new JSONArray();
			JSONArray bar = new JSONArray();
			int total = 0;
			int max;
			int min;
			min = max = list.get(0).get("total") == null ? 0 : Integer.parseInt(list.get(0).get("total").toString());
			for (Map<String, Object> record : list) {
				JSONObject jo = new JSONObject();
				jo.put("name", record.get("type_name"));
				jo.put("value", record.get("total"));
				pie.add(jo);

				String name = record.get("type_name").toString();
				char[] str1 = name.toCharArray();
				StringBuilder str2 = new StringBuilder();
				for (int i = 0; i < str1.length; i++) {
					if (i == 3 || i == 7 || i == 11) {
						str2.append(str1[i]).append("\n");
					} else {
						str2.append(str1[i]);
					}
				}
				xAxis.add(str2.toString());

				bar.add(record.get("total"));
				int compNum = record.get("total") == null ? 0 : Integer.parseInt(record.get("total").toString());
				total += compNum;
				if (max < compNum) {
					max = compNum;
				}

				if (min > compNum) {
					min = compNum;
				}
			}
			data.put("pie", pie);
			data.put("xAxis", xAxis);
			data.put("bar", bar);
			data.put("total", total);
			data.put("max", max);
			data.put("min", min);
		}
		return data;
	}

	@Override
	public Integer selectYearByParkId(BigDecimal orgId, Short type, Integer isPkLocalShow) {
		StringBuilder sql = new StringBuilder();
		sql.append("select max(year_caliber) year_caliber from ");
		if (type == 1) {
			if (isPkLocalShow != null && isPkLocalShow == 1) {
				sql.append("r_pk_in_op_mn_ac_4_log ");
			} else {
				sql.append("r_pk_in_op_mn_ac_log ");
			}
		} else {
			sql.append("r_pk_in_tp_in_op_mn_us_4_log ");
		}
		sql.append("where organization_id = ? and month_caliber in (3,6,9,12)");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), new Object[] { orgId });
		Integer year = null;
		if (!list.isEmpty()) {
			year = list.get(0).get("year_caliber") == null ? null
					: Integer.valueOf(list.get(0).get("year_caliber").toString());
		}

		return year;
	}

}
