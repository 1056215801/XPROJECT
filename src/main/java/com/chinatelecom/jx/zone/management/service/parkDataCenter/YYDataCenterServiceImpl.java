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

@Service
@Transactional(rollbackFor = Exception.class)
public class YYDataCenterServiceImpl implements IYYDataCenterService {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public Map<String, Object> selectCompanyDistributionData(BigDecimal orgId, Integer year, Integer month) {

		StringBuilder sql = new StringBuilder();
		sql.append("select t.gyzjz_value, ").append("t.gyzjz_percent, ").append("t.zyywsr_value, ")
				.append("t.zyywsr_percent, ").append("t.lr_value, ").append("t.lr_percent, ")
				.append("(select sum(l.gyydl_value) ").append("from R_Cp_In_Op_Mn_Log l ")
				.append("where l.park_id = t.organization_id ").append("and l.year_caliber = t.year_caliber ")
				.append("and l.month_caliber = t.month_caliber) as gyydl_value, ").append("0 as gyydl_percent ")
				.append("from R_Pk_In_Op_Mn_Ac_Log t ").append("where t.organization_id = ? ")
				.append("and t.year_caliber = ? ").append("and t.month_caliber = ? ")
				.append(" order by t.quarter_caliber ");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), new Object[] { orgId, year, month });

		Map<String, Object> map = new HashMap<>();
		if (!list.isEmpty()) {
			map.put("distributionData", list);
		}

		return map;
	}

	@Override
	public Map<String, Object> selectCompanySortData(BigDecimal orgId, Integer year, Integer month, Integer orderType) {
		StringBuilder sql = new StringBuilder();

		sql.append("select t.company_name, t.gyzjz_value, t.zyywsr_value, t.lr_value ")
				.append("from (select l.company_id, ").append("l.company_name, ").append("l.year_caliber, ")
				.append("l.month_caliber, ").append("nvl(l.gyzcz_value, 0) as gyzjz_value, ")
				.append("nvl(l.zyywsr_value, 0) as zyywsr_value, ").append("nvl(l.lr_value, 0) as lr_value ")
				.append("from R_Cp_In_Op_Mn_Log l ").append("where l.park_id = ? ").append("and l.year_caliber = ? ")
				.append("and l.month_caliber = ?) t ").append("WHERE ROWNUM <= 18 ");
		switch (orderType) {
		case 1:
			sql.append("order by t.gyzjz_value desc ");
			break;
		case 2:
			sql.append("order by t.zyywsr_value desc ");
			break;
		case 3:
			sql.append("order by t.lr_value desc ");
			break;
		default:
			break;
		}

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), new Object[] { orgId, year, month });

		List<JSONObject> newList = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		if (!list.isEmpty()) {
			int index = 1;
			for (Map<String, Object> record : list) {
				JSONObject jo = new JSONObject();
				jo.put("sortGrade", index++);
				jo.put("name", record.get("COMPANY_NAME"));
				switch (orderType) {
				case 1:
					jo.put("value", record.get("GYZJZ_VALUE"));
					break;
				case 2:
					jo.put("value", record.get("ZYYWSR_VALUE"));
					break;
				case 3:
					jo.put("value", record.get("LR_VALUE"));
					break;
				default:
					break;
				}
				newList.add(jo);
			}
		}
		map.put("sortData", newList);

		return map;
	}

	@Override
	public Map<String, Object> selectChartData(BigDecimal orgId, Integer year, Integer type) {
		StringBuilder sql = new StringBuilder();

		sql.append("select t.year_caliber, ").append("t.month_caliber, ").append("t.gyzjz_value, ")
				.append("t.gyzjz_percent, ").append("t.zyywsr_value, ").append("t.zyywsr_percent, ")
				.append("t.lr_value, ").append("t.lr_percent ");
		if (type == 1) {
			sql.append("from R_Pk_In_Op_Mn_Ac_Log t ");
		} else {
			sql.append("from R_Pk_In_Op_Mn_Us_Log t ");
		}
		sql.append("where t.organization_id = ? ").append("and t.year_caliber = ? ")
				.append("order by t.month_caliber ");

		List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql.toString(), new Object[] { orgId, year });
		List<Map<String, Object>> list2 = jdbcTemplate.queryForList(sql.toString(), new Object[] { orgId, year - 1 });

		Map<String, Object> map = new HashMap<>();
		if (!list1.isEmpty()) {
			JSONArray gyzjz_value_2017 = new JSONArray();
			JSONArray gyzjz_percent_2017 = new JSONArray();
			JSONArray zyywsr_value_2017 = new JSONArray();
			JSONArray zyywsr_percent_2017 = new JSONArray();
			JSONArray lr_value_2017 = new JSONArray();
			JSONArray lr_percent_2017 = new JSONArray();

			for (int i = 0; i < list1.size(); i++) {
				Map<String, Object> record = list1.get(i);
				gyzjz_value_2017.add(record.get("GYZJZ_VALUE"));
				gyzjz_percent_2017.add(record.get("GYZJZ_PERCENT"));
				zyywsr_value_2017.add(record.get("ZYYWSR_VALUE"));
				zyywsr_percent_2017.add(record.get("ZYYWSR_PERCENT"));
				lr_value_2017.add(record.get("LR_VALUE"));
				lr_percent_2017.add(record.get("LR_PERCENT"));
			}

			map.put("gyzjz_value_2017", gyzjz_value_2017.toJSONString());
			map.put("gyzjz_percent_2017", gyzjz_percent_2017.toJSONString());
			map.put("zyywsr_value_2017", zyywsr_value_2017.toJSONString());
			map.put("zyywsr_percent_2017", zyywsr_percent_2017.toJSONString());
			map.put("lr_value_2017", lr_value_2017.toJSONString());
			map.put("lr_percent_2017", lr_percent_2017.toJSONString());

			JSONArray gyzjz_value_2017_ = gyzjz_value_2017;
			JSONArray gyzjz_percent_2017_ = gyzjz_percent_2017;
			JSONArray zyywsr_value_2017_ = zyywsr_value_2017;
			JSONArray zyywsr_percent_2017_ = zyywsr_percent_2017;
			JSONArray lr_value_2017_ = lr_value_2017;
			JSONArray lr_percent_2017_ = lr_percent_2017;

			if (list1.size() < 11) {
				for (int i = 0; i < (11 - list1.size()); i++) {
					gyzjz_value_2017_.add("");
					gyzjz_percent_2017_.add("");
					zyywsr_value_2017_.add("");
					zyywsr_percent_2017_.add("");
					lr_value_2017_.add("");
					lr_percent_2017_.add("");
				}
			}

			map.put("gyzjz_value_2017_", gyzjz_value_2017_.toJSONString());
			map.put("gyzjz_percent_2017_", gyzjz_percent_2017_.toJSONString());
			map.put("zyywsr_value_2017_", zyywsr_value_2017_.toJSONString());
			map.put("zyywsr_percent_2017_", zyywsr_percent_2017_.toJSONString());
			map.put("lr_value_2017_", lr_value_2017_.toJSONString());
			map.put("lr_percent_2017_", lr_percent_2017_.toJSONString());
		}

		if (!list2.isEmpty()) {
			JSONArray gyzjz_value_2016 = new JSONArray();
			JSONArray gyzjz_percent_2016 = new JSONArray();
			JSONArray zyywsr_value_2016 = new JSONArray();
			JSONArray zyywsr_percent_2016 = new JSONArray();
			JSONArray lr_value_2016 = new JSONArray();
			JSONArray lr_percent_2016 = new JSONArray();

			for (int i = 0; i < list2.size(); i++) {
				Map<String, Object> record = list2.get(i);
				gyzjz_value_2016.add(record.get("GYZJZ_VALUE"));
				gyzjz_percent_2016.add(record.get("GYZJZ_PERCENT"));
				zyywsr_value_2016.add(record.get("ZYYWSR_VALUE"));
				zyywsr_percent_2016.add(record.get("ZYYWSR_PERCENT"));
				lr_value_2016.add(record.get("LR_VALUE"));
				lr_percent_2016.add(record.get("LR_PERCENT"));
			}

			map.put("gyzjz_value_2016", gyzjz_value_2016.toJSONString());
			map.put("gyzjz_percent_2016", gyzjz_percent_2016.toJSONString());
			map.put("zyywsr_value_2016", zyywsr_value_2016.toJSONString());
			map.put("zyywsr_percent_2016", zyywsr_percent_2016.toJSONString());
			map.put("lr_value_2016", lr_value_2016.toJSONString());
			map.put("lr_percent_2016", lr_percent_2016.toJSONString());
		}

		return map;
	}

	@Override
	public Map<String, Object> selectCompanyIndustryStatisticsData(BigDecimal orgId) {
		StringBuilder sql = new StringBuilder();

		sql.append("select i.type_name, t.comp_num ").append("from (select n.type_id, count(1) as comp_num ")
				.append("from t_industry_type_company_now n, t_company_info i ")
				.append("where n.company_id = i.company_id ").append("and n.organization_id = ? ")
				.append("group by n.type_id) t, ").append("t_industry_type_info_now i ")
				.append("where t.type_id = i.type_id ").append("and i.organization_id = ? ")
				.append("order by i.sort_grade ");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), new Object[] { orgId, orgId });
		JSONArray xAxis = new JSONArray();
		JSONArray series = new JSONArray();
		int num = 0;
		int max = 0;
		int min = 0;
		if (!list.isEmpty()) {
			min = max = Integer.parseInt(list.get(0).get("COMP_NUM").toString());
			for (Map<String, Object> record : list) {
				String name = record.get("TYPE_NAME").toString();
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
				series.add(record.get("COMP_NUM"));
				int compNum = Integer.parseInt(record.get("COMP_NUM").toString());
				num += compNum;
				if (max < compNum) {
					max = compNum;
				}

				if (min > compNum) {
					min = compNum;
				}
			}
		}

		Map<String, Object> map = new HashMap<>();
		map.put("xAxis", xAxis.toJSONString());
		map.put("series", series.toJSONString());
		map.put("num", num);
		map.put("max", max);
		map.put("min", min);

		return map;
	}

	@Override
	public Map<String, Object> selectParkEconomic(BigDecimal orgId, Integer year) {
		Map<String, Object> map = new HashMap<>();

		// 第一部分数据
		StringBuilder sql1 = new StringBuilder();
		sql1.append("select t.gyzjz_value, t.zyywsr_value, t.ls_value, t.csgyschd_cyry_value ")
				.append("from R_Pk_In_Op_Mn_Ac_4_Log t ").append("where t.organization_id = ? ")
				.append("and t.year_caliber = ? ").append("and t.month_caliber = ")
				.append("(select max(a.month_caliber) ").append("from R_Pk_In_Op_Mn_Ac_4_Log a ")
				.append("where a.organization_id = t.organization_id ").append("and a.year_caliber = t.year_caliber) ")
				.append("order by t.quarter_caliber ");

		List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql1.toString(), new Object[] { orgId, year });

		JSONObject data1 = new JSONObject();
		if (!list1.isEmpty()) {
			Map<String, Object> record = list1.get(0);
			data1.put("GYZJZ_VALUE", record.get("GYZJZ_VALUE"));
			data1.put("ZYYWSR_VALUE", record.get("ZYYWSR_VALUE"));
			data1.put("LS_VALUE", record.get("LS_VALUE"));
			data1.put("CSGYSCHD_CYRY_VALUE", record.get("CSGYSCHD_CYRY_VALUE"));
		}

		map.put("data1", data1);
		// 第二部分数据
		StringBuilder sql2 = new StringBuilder();

		sql2.append("select t.year_caliber, ").append("t.quarter_caliber, /*t.month_caliber,*/ ")
				.append("t.gyzjz_value, ").append("t.zyywsr_value, ").append("t.ls_value, ")
				.append("t.csgyschd_cyry_value ").append("from R_Pk_In_Op_Mn_Ac_4_Log t ")
				.append("where t.organization_id = ? ").append("and t.year_caliber = ? ")
				.append("and t.month_caliber in (3, 6, 9, 12) ").append("order by t.month_caliber ");

		List<Map<String, Object>> list2 = jdbcTemplate.queryForList(sql2.toString(), new Object[] { orgId, year });

		JSONObject data2 = new JSONObject();
		if (!list2.isEmpty()) {
			JSONArray gyzjz = new JSONArray();
			JSONArray zyywsr = new JSONArray();
			JSONArray ls = new JSONArray();
			JSONArray cyry = new JSONArray();
			for (Map<String, Object> record : list2) {
				gyzjz.add(record.get("GYZJZ_VALUE"));
				zyywsr.add(record.get("ZYYWSR_VALUE"));
				ls.add(record.get("LS_VALUE"));
				cyry.add(record.get("CSGYSCHD_CYRY_VALUE"));
			}
			data2.put("gyzjz", gyzjz.toJSONString());
			data2.put("zyywsr", zyywsr.toJSONString());
			data2.put("ls", ls.toJSONString());
			data2.put("cyry", cyry.toJSONString());
		}

		map.put("data2", data2);

		// 第三部分数据
		StringBuilder sql3 = new StringBuilder();

		sql3.append("select t.year_caliber, ").append("t.month_caliber, ").append("t.gyzjz_value, ")
				.append("t.zyywsr_value, ").append("t.ls_value ").append("from R_Pk_In_Op_Mn_Ac_4_Log t ")
				.append("where t.organization_id = ? ").append("and t.year_caliber in (?, ?, ?) ")
				.append("and t.month_caliber = ").append("(select max(a.month_caliber) ")
				.append("from R_Pk_In_Op_Mn_Ac_4_Log a ").append("where a.organization_id = t.organization_id ")
				.append("and a.year_caliber = t.year_caliber) ").append("order by 1 desc ");

		List<Map<String, Object>> list3 = jdbcTemplate.queryForList(sql3.toString(),
				new Object[] { orgId, year - 2, year - 1, year });

		JSONObject data3 = new JSONObject();
		if (!list3.isEmpty()) {
			JSONArray gyzjz = new JSONArray();
			JSONArray zyywsr = new JSONArray();
			JSONArray ls = new JSONArray();
			JSONArray yAxis = new JSONArray();
			for (Map<String, Object> record : list3) {
				yAxis.add(record.get("YEAR_CALIBER"));
				if(Integer.parseInt(record.get("year_caliber").toString())!=2017){					
					gyzjz.add(record.get("GYZJZ_VALUE"));
				}
				zyywsr.add(record.get("ZYYWSR_VALUE"));
				ls.add(record.get("LS_VALUE"));
			}
			data3.put("yAxis", yAxis.toJSONString());
			data3.put("gyzjz", gyzjz.toJSONString());
			data3.put("zyywsr", zyywsr.toJSONString());
			data3.put("ls", ls.toJSONString());
		}

		map.put("data3", data3);

		return map;
	}

	@Override
	public Map<String, Object> selectIndustryEconomic(BigDecimal orgId, Integer year) {
		Map<String, Object> map = new HashMap<>();
		
		/*
		 * 产业类型列表 
		 */
		String sql = "select type_id, type_name from t_industry_type_info_now where organization_id = ? and status = 1 order by sort_grade asc";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[] { orgId });
		
		List<JSONObject> typeList = new ArrayList<>();
		if(!list.isEmpty()){
			for(Map<String, Object> record : list){
				JSONObject jo = new JSONObject();
				jo.put("typeId", record.get("type_id"));
				jo.put("typeName", record.get("type_name"));
				typeList.add(jo);
			}
		}
		
		map.put("typeList", typeList);
		
		// 第一部分数据
		StringBuilder sql1 = new StringBuilder();

		sql1.append("select t.year_caliber, ").append("n.type_name, ").append("t.gyzjz_value, ")
				.append("t.zyywsr_value, ").append("t.ls_value, ").append("t.gyydl_value, ")
				.append("t.csgyschd_cyry_value, ").append("t.lr_value, ").append("t.sj_value ")
				.append("from r_pk_in_tp_in_op_mn_us_4_log t, T_Industry_Type_Info_Now n ")
				.append("where t.organization_id = ? ").append("and t.year_caliber in (?, ?, ?) ")
				.append("and t.month_caliber in(3,6,9,12) and t.quarter_caliber = ").append("(select max(a.quarter_caliber) ")
				.append("from r_pk_in_tp_in_op_mn_us_4_log a ").append("where a.organization_id = t.organization_id ")
				.append("and a.year_caliber = t.year_caliber) ").append("and t.type_id = n.type_id ")
				.append("order by t.year_caliber, n.sort_grade ");

		List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql1.toString(),
				new Object[] { orgId, year - 2, year - 1, year });

		JSONObject data1 = new JSONObject();

		JSONObject gyzjz = new JSONObject();
		JSONObject zyywsr = new JSONObject();
		JSONObject ls = new JSONObject();
		JSONObject gyydl = new JSONObject();
		JSONObject cyry = new JSONObject();
		JSONObject lr = new JSONObject();
		JSONObject sj = new JSONObject();
		if (!list1.isEmpty()) {
			JSONArray legend = new JSONArray();
			legend.add(year);
			legend.add(year - 1);
			legend.add(year - 2);

			JSONArray xAxis_this = new JSONArray();
			JSONArray xAxis_last = new JSONArray();
			JSONArray xAxis_before = new JSONArray();

			JSONArray series_this_gyzjz = new JSONArray();
			JSONArray series_this_zyywsr = new JSONArray();
			JSONArray series_this_ls = new JSONArray();
			JSONArray series_this_gyydl = new JSONArray();
			JSONArray series_this_cyry = new JSONArray();
			JSONArray series_this_lr = new JSONArray();
			JSONArray series_this_sj = new JSONArray();

			JSONArray series_last_gyzjz = new JSONArray();
			JSONArray series_last_zyywsr = new JSONArray();
			JSONArray series_last_ls = new JSONArray();
			JSONArray series_last_gyydl = new JSONArray();
			JSONArray series_last_cyry = new JSONArray();
			JSONArray series_last_lr = new JSONArray();
			JSONArray series_last_sj = new JSONArray();
			
			JSONArray series_before_gyzjz = new JSONArray();
			JSONArray series_before_zyywsr = new JSONArray();
			JSONArray series_before_ls = new JSONArray();
			JSONArray series_before_gyydl = new JSONArray();
			JSONArray series_before_cyry = new JSONArray();
			JSONArray series_before_lr = new JSONArray();
			JSONArray series_before_sj = new JSONArray();
			
			for (Map<String, Object> record : list1) {
				int year_caliber = Integer.parseInt(record.get("YEAR_CALIBER").toString());

				if (year_caliber == year) {
					xAxis_this.add(record.get("TYPE_NAME"));
					series_this_gyzjz.add(record.get("GYZJZ_VALUE"));
					series_this_zyywsr.add(record.get("ZYYWSR_VALUE"));
					series_this_ls.add(record.get("LS_VALUE"));
					series_this_gyydl.add(record.get("GYYDL_VALUE"));
					series_this_cyry.add(record.get("CSGYSCHD_CYRY_VALUE"));
					series_this_lr.add(record.get("LR_VALUE"));
					series_this_sj.add(record.get("SJ_VALUE"));
				}

				if (year_caliber == (year - 1)) {
					xAxis_last.add(record.get("TYPE_NAME"));
					series_last_gyzjz.add(record.get("GYZJZ_VALUE"));
					series_last_zyywsr.add(record.get("ZYYWSR_VALUE"));
					series_last_ls.add(record.get("LS_VALUE"));
					series_last_gyydl.add(record.get("GYYDL_VALUE"));
					series_last_cyry.add(record.get("CSGYSCHD_CYRY_VALUE"));
					series_last_lr.add(record.get("LR_VALUE"));
					series_last_sj.add(record.get("SJ_VALUE"));
				}

				if (year_caliber == (year - 2)) {
					xAxis_before.add(record.get("TYPE_NAME"));
					series_before_gyzjz.add(record.get("GYZJZ_VALUE"));
					series_before_zyywsr.add(record.get("ZYYWSR_VALUE"));
					series_before_ls.add(record.get("LS_VALUE"));
					series_before_gyydl.add(record.get("GYYDL_VALUE"));
					series_before_cyry.add(record.get("CSGYSCHD_CYRY_VALUE"));
					series_before_lr.add(record.get("LR_VALUE"));
					series_before_sj.add(record.get("SJ_VALUE"));
				}

			}

			gyzjz.put("_this", series_this_gyzjz);
			gyzjz.put("_last", series_last_gyzjz);
			gyzjz.put("_before", series_before_gyzjz);

			zyywsr.put("_this", series_this_zyywsr);
			zyywsr.put("_last", series_last_zyywsr);
			zyywsr.put("_before", series_before_zyywsr);

			ls.put("_this", series_this_ls);
			ls.put("_last", series_last_ls);
			ls.put("_before", series_before_ls);

			gyydl.put("_this", series_this_gyydl);
			gyydl.put("_last", series_last_gyydl);
			gyydl.put("_before", series_before_gyydl);

			cyry.put("_this", series_this_cyry);
			cyry.put("_last", series_last_cyry);
			cyry.put("_before", series_before_cyry);
			
			lr.put("_this", series_this_lr);
			lr.put("_last", series_last_lr);
			lr.put("_before", series_before_lr);
			
			sj.put("_this", series_this_sj);
			sj.put("_last", series_last_sj);
			sj.put("_before", series_before_sj);
			

			data1.put("xAxis_this", xAxis_this);
			data1.put("xAxis_last", xAxis_last);
			data1.put("xAxis_before", xAxis_before);
			data1.put("gyzjz", gyzjz);
			data1.put("zyywsr", zyywsr);
			data1.put("ls", ls);
			data1.put("gyydl", gyydl);
			data1.put("cyry", cyry);
			data1.put("lr", lr);
			data1.put("sj", sj);
		}

		map.put("data1", data1);

		// 第二部分数据
		StringBuilder sql2 = new StringBuilder();

		sql2.append("select t.year_caliber, ").append("t.quarter_caliber, ").append("t.type_id, ")
				.append("n.type_name, ").append("t.gyzjz_value, ").append("t.zyywsr_value, ").append("t.ls_value, ")
				.append("t.gyydl_value, ").append("t.csgyschd_cyry_value, ").append("t.lr_value, ").append("t.sj_value ")
				.append("from r_pk_in_tp_in_op_mn_us_4_log t, T_Industry_Type_Info_Now n ")
				.append("where t.organization_id = ? ").append("and t.month_caliber in(3,6,9,12) and t.year_caliber = ? ")
				.append("and t.type_id = n.type_id ").append("order by t.type_id, t.quarter_caliber, n.sort_grade ");

		List<Map<String, Object>> list2 = jdbcTemplate.queryForList(sql2.toString(), new Object[] { orgId, year });

		JSONObject data2 = new JSONObject();
		if (!list2.isEmpty()&&!list.isEmpty()) {
			// typeId 25：食品医药 19：新型材料 27：有色金属 28：智能装备 26：其他
			//int[] typeIds = new int[] { 25, 19, 27, 28, 26 };
			for (int i = 0; i < list.size(); i++) {
				if(i>4){
					break;
				}
				BigDecimal typeId1 = new BigDecimal(list.get(i).get("type_id").toString());
				JSONObject jo = new JSONObject();
				JSONArray gyzjz2 = new JSONArray();
				JSONArray zyywsr2 = new JSONArray();
				JSONArray ls2 = new JSONArray();
				JSONArray gyydl2 = new JSONArray();
				JSONArray cyry2 = new JSONArray();
				JSONArray lr2 = new JSONArray();
				JSONArray sj2 = new JSONArray();

				for (Map<String, Object> record : list2) {
					BigDecimal typeId2 = new BigDecimal(record.get("TYPE_ID").toString());
					if (typeId2.equals(typeId1)) {
						gyzjz2.add(record.get("GYZJZ_VALUE"));
						zyywsr2.add(record.get("zyywsr_value"));
						ls2.add(record.get("ls_value"));
						gyydl2.add(record.get("gyydl_value"));
						cyry2.add(record.get("csgyschd_cyry_value"));
						lr2.add(record.get("lr_value"));
						sj2.add(record.get("sj_value"));
					}
				}
				jo.put("gyzjz", gyzjz2);
				jo.put("zyywsr", zyywsr2);
				jo.put("ls", ls2);
				jo.put("gyydl", gyydl2);
				jo.put("cyry", cyry2);
				jo.put("lr", lr2);
				jo.put("sj", sj2);

				data2.put("index"+i, jo);
				
				/*switch (typeIds[i]) {
				case 25:
					data2.put("sw", jo);
					break;
				case 19:
					data2.put("cl", jo);
					break;
				case 27:
					data2.put("js", jo);
					break;
				case 28:
					data2.put("zn", jo);
					break;
				case 26:
					data2.put("qt", jo);
					break;

				default:
					break;
				}*/
				
				
			}

		}

		map.put("data2", data2);

		return map;
	}

	
	@Override
	public Integer selectYearByParkId(BigDecimal orgId, Short type) {
		StringBuilder sql = new StringBuilder();
		sql.append("select max(year_caliber) year_caliber from ");
		if (type == 1) {
			sql.append("r_pk_in_op_mn_ac_4_log ");
		} else {
			sql.append("r_pk_in_tp_in_op_mn_us_4_log ");
		}
		sql.append("where organization_id = ?");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), new Object[] { orgId });
		Integer year = null;
		if (!list.isEmpty()) {
			year = list.get(0).get("year_caliber") == null ? null
					: Integer.valueOf(list.get(0).get("year_caliber").toString());
		}

		return year;
	}
}
