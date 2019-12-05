package com.chinatelecom.jx.zone.management.service.dataCenter;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Service
@Transactional
public class DataCenterServiceImpl implements IDataCenterService {
	@Autowired
	private org.springframework.jdbc.core.JdbcTemplate jdbcTemplate;
	
	@Override
	@Transactional(readOnly=true)
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
	@Transactional(readOnly=true)
	public Map<String, List<JSONObject>> selectSearchList() {
		List<JSONObject> yearList = new ArrayList<>();
		List<JSONObject> quarterList = new ArrayList<>();

		StringBuilder sql = new StringBuilder().append("select year_caliber ").append("from r_pk_in_op_mn_ac_log ")
				.append("group by year_caliber ").append("order by year_caliber desc ");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString());
		if (!list.isEmpty()) {
			for (Map<String, Object> record : list) {
				JSONObject jo = new JSONObject();
				jo.put("year", record.get("year_caliber"));
				yearList.add(jo);
			}
		}

		/* 此处季度为写死四季度，可以扩展为动态获取有数据季度 */
		int quarterNum = 4;
		for (int i = 0; i < quarterNum; i++) {
			JSONObject jo = new JSONObject();
			jo.put("quarter", i + 1);
			quarterList.add(jo);
		}

		Map<String, List<JSONObject>> map = new HashMap<>(16);
		map.put("yearList", yearList);
		map.put("quarterList", quarterList);

		return map;
	}

	@Override
	@Transactional(readOnly=true)
	public JSONObject selectDefaultSearchInfo() {

		StringBuilder sql = new StringBuilder().append("select max(a.quarter_caliber) quarter, max(b.year) year ")
				.append("from R_Pk_In_Op_Mn_Ac_Log a, ")
				.append("(select max(year_caliber) year from R_Pk_In_Op_Mn_Ac_Log) b ")
				.append("where a.year_caliber = b.year ");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString());

		JSONObject jo = new JSONObject();
		if (!list.isEmpty()) {
			jo.put("year", list.get(0).get("year"));
			jo.put("quarter", list.get(0).get("quarter"));
		}

		return jo;
	}

	/**
	 * 省级 = 0 国家级 = 1 重点省级 = 2 筹建 = 9
	 */
	@Override
	@Transactional(readOnly=true)
	public JSONObject selectParkDataByAreaIdAndYear(Integer areaId, Integer year, Boolean isProvince,
			BigDecimal provinceId) {

		/* 省级用户省级数据 */
		StringBuilder sql1 = new StringBuilder().append("select t1.* from (")
				.append("select t.area_id, t.area_name, count(1) as park_cou,")
				.append("(select count(1) from T_Park_Info ti where ti.area_name = t.area_name and ti.park_kind = 1 and ti.view_kind2 = 1) as park_cou1,")
				.append("(select count(1) from T_Park_Info ti where ti.area_name = t.area_name and ti.park_kind = 2 and ti.view_kind2 = 1) as park_cou2,")
				.append("(select count(1) from T_Park_Info ti where ti.area_name = t.area_name and ti.park_kind = 0 and ti.view_kind2 = 1) as park_cou0,")
				.append("(select count(1) from T_Park_Info ti where ti.area_name = t.area_name and ti.park_kind = 9 and ti.view_kind2 = 1) as park_cou9 ")
				.append("from t_park_info t where t.view_kind2 = 1 ")
				.append("and t.province_id = ? group by t.area_id, t.area_name ")
				.append(")t1, t_area_info t2 where t1.area_id = t2.area_id order by t2.sort_grade");
		/* 省级用户市级数据 */
		StringBuilder sql2 = new StringBuilder().append("select t1.* from (")
				.append("select t.space_id, t.space_name as area_name, count(1) as park_cou,")
				.append("(select count(1) from T_Park_Info ti where ti.space_name = t.space_name and ti.area_id = ? and ti.park_kind = 1 and ti.view_kind2 = 1) as park_cou1,")
				.append("(select count(1) from T_Park_Info ti where ti.space_name = t.space_name and ti.area_id = ? and ti.park_kind = 2 and ti.view_kind2 = 1) as park_cou2,")
				.append("(select count(1) from T_Park_Info ti where ti.space_name = t.space_name and ti.area_id = ? and ti.park_kind = 0 and ti.view_kind2 = 1) as park_cou0,")
				.append("(select count(1) from T_Park_Info ti where ti.space_name = t.space_name and ti.area_id = ? and ti.park_kind = 9 and ti.view_kind2 = 1) as park_cou9 ")
				.append("from t_park_info t where t.view_kind2 = 1 ")
				.append("and t.area_id = ? group by t.space_id, t.space_name")
				.append(")t1, t_area_info t2 where t1.space_id = t2.area_id order by t2.sort_grade");
		/* 市级用户市级数据 */
		StringBuilder sql3 = new StringBuilder().append("select t1.* from (")
				.append("select t.space_id, t.space_name as area_name, count(1) as park_cou,")
				.append("(select count(1) from T_Park_Info ti where ti.space_name = t.space_name and ti.area_id = ? and ti.park_kind = 1 and ti.view_kind3 = 1) as park_cou1,")
				.append("(select count(1) from T_Park_Info ti where ti.space_name = t.space_name and ti.area_id = ? and ti.park_kind = 2 and ti.view_kind3 = 1) as park_cou2,")
				.append("(select count(1) from T_Park_Info ti where ti.space_name = t.space_name and ti.area_id = ? and ti.park_kind = 0 and ti.view_kind3 = 1) as park_cou0,")
				.append("(select count(1) from T_Park_Info ti where ti.space_name = t.space_name and ti.area_id = ? and ti.park_kind = 9 and ti.view_kind3 = 1) as park_cou9 ")
				.append("from t_park_info t where t.view_kind3 = 1 ")
				.append("and t.area_id = ? group by t.space_id, t.space_name")
				.append(")t1, t_area_info t2 where t1.space_id = t2.area_id order by t2.sort_grade");

		List<Map<String, Object>> list = new ArrayList<>();

		if (isProvince) {
			if (new BigDecimal(areaId).equals(provinceId)) {
				list = jdbcTemplate.queryForList(sql1.toString(), new Object[] { areaId });
			} else {
				list = jdbcTemplate.queryForList(sql2.toString(),
						new Object[] { areaId, areaId, areaId, areaId, areaId });
			}
		} else {
			list = jdbcTemplate.queryForList(sql3.toString(), new Object[] { areaId, areaId, areaId, areaId, areaId });
		}

		int count=0, count0 = 0, count1 = 0, count2 = 0, count9 = 0;
		JSONObject parkData = new JSONObject();

		if (!list.isEmpty()) {
			JSONObject line = new JSONObject();
			JSONObject pie = new JSONObject();

			/* x轴数据 */
			JSONArray xAxisDataLine = new JSONArray();
			/* 图形数据, 省级 = 0 国家级 = 1 重点省级 = 2 筹建 = 9 */
			JSONArray seriesDataLine = new JSONArray();
			JSONArray seriesData1Line = new JSONArray();
			JSONArray seriesData2Line = new JSONArray();
			JSONArray seriesData0Line = new JSONArray();
			JSONArray seriesData9Line = new JSONArray();
			List<JSONArray> seriesDataLineList = new ArrayList<>();
			for (Map<String, Object> record : list) {
				xAxisDataLine.add(record.get("AREA_NAME"));
				seriesDataLine.add(record.get("PARK_COU"));
				seriesData1Line.add(record.get("PARK_COU1"));
				seriesData2Line.add(record.get("PARK_COU2"));
				seriesData0Line.add(record.get("PARK_COU0"));
				seriesData9Line.add(record.get("PARK_COU9"));
				count += Integer.parseInt(record.get("PARK_COU") == null ? "0" : record.get("PARK_COU").toString());
				count1 += Integer.parseInt(record.get("PARK_COU1") == null ? "0" : record.get("PARK_COU1").toString());
				count2 += Integer.parseInt(record.get("PARK_COU2") == null ? "0" : record.get("PARK_COU2").toString());
				count0 += Integer.parseInt(record.get("PARK_COU0") == null ? "0" : record.get("PARK_COU0").toString());
				count9 += Integer.parseInt(record.get("PARK_COU9") == null ? "0" : record.get("PARK_COU9").toString());
			}
			seriesDataLineList.add(seriesDataLine);
			seriesDataLineList.add(seriesData1Line);
			seriesDataLineList.add(seriesData2Line);
			seriesDataLineList.add(seriesData0Line);
			seriesDataLineList.add(seriesData9Line);

			line.put("xAxis", xAxisDataLine);
			line.put("series", seriesDataLineList);

			/* 封装饼图数据 */
			List<JSONObject> legendDataPieList = new ArrayList<>();
			List<JSONObject> seriesDataPieList = new ArrayList<>();
			
			if (count1 != 0) {
				JSONObject legendDataPie = new JSONObject();
				JSONObject seriesDataPie = new JSONObject();

				legendDataPie.put("name", "国家级");
				seriesDataPie.put("value", count1);
				seriesDataPie.put("name", "国家级");

				legendDataPieList.add(legendDataPie);
				seriesDataPieList.add(seriesDataPie);
			}
			if (count2 != 0) {
				JSONObject legendDataPie = new JSONObject();
				JSONObject seriesDataPie = new JSONObject();

				legendDataPie.put("name", "重点省级");
				seriesDataPie.put("value", count2);
				seriesDataPie.put("name", "重点省级");

				legendDataPieList.add(legendDataPie);
				seriesDataPieList.add(seriesDataPie);
			}
			if (count0 != 0) {
				JSONObject legendDataPie = new JSONObject();
				JSONObject seriesDataPie = new JSONObject();

				legendDataPie.put("name", "省级");
				seriesDataPie.put("value", count0);
				seriesDataPie.put("name", "省级");

				legendDataPieList.add(legendDataPie);
				seriesDataPieList.add(seriesDataPie);
			}
			if (count9 != 0) {
				JSONObject legendDataPie = new JSONObject();
				JSONObject seriesDataPie = new JSONObject();

				legendDataPie.put("name", "筹建");
				seriesDataPie.put("value", count9);
				seriesDataPie.put("name", "筹建");

				legendDataPieList.add(legendDataPie);
				seriesDataPieList.add(seriesDataPie);
			}
			pie.put("legend", legendDataPieList);
			pie.put("series", seriesDataPieList);

			int parkTotla = count;

			parkData.put("line", line);
			parkData.put("pie", pie);
			parkData.put("parkTotla", parkTotla);
		}

		return parkData;
	}

	@Override
	@Transactional(readOnly=true)
	public JSONObject selectMapDataByAreaIdAndYear(Integer areaId, Integer year, Boolean isProvince,
			BigDecimal provinceId) {

		List<JSONObject> list1 = new ArrayList<>();
		List<JSONObject> list2 = new ArrayList<>();
		List<JSONObject> list3 = new ArrayList<>();

		StringBuilder sql = new StringBuilder();

		if (new BigDecimal(areaId).equals(provinceId)) {
			sql.append(
					"select area_name, count(1) total from t_park_info where view_kind2 = 1 group by area_name");
			List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString());
			if (!list.isEmpty()) {
				for (Map<String, Object> record : list) {
					JSONObject jo = new JSONObject();
					jo.put("name", record.get("area_name"));
					jo.put("value", record.get("TOTAL"));
					list1.add(jo);
					list2.add(jo);
				}
			}
		} else {
			sql.append(
					"select space_id, count(1) total from t_park_info where area_id = ? ");
			if (isProvince) {
				sql.append("and view_kind2 = 1 group by space_id");
			} else {
				sql.append("and view_kind3 = 1 group by space_id");
			}
			List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), new Object[] { areaId });
			List<BigDecimal> idList = new ArrayList<>();
			if (!list.isEmpty()) {
				for (Map<String, Object> record : list) {
					JSONObject jo1 = new JSONObject();
					JSONObject jo2 = new JSONObject();
					int total = Integer.parseInt(record.get("TOTAL").toString());

					jo1.put("name", record.get("SPACE_ID"));
					jo1.put("value", record.get("TOTAL"));
					list1.add(jo1);

					if (total > 1) {
						jo2.put("name", record.get("SPACE_ID"));
						jo2.put("value", record.get("TOTAL"));
						list2.add(jo2);
						idList.add(new BigDecimal(record.get("SPACE_ID").toString()));
					}

				}
			}

			sql.delete(0, sql.length());
			sql.append("select space_id, park_name from t_park_info where area_id = ? ");
			if (isProvince) {
				sql.append("and view_kind2 = 1");
			} else {
				sql.append("and view_kind3 = 1");
			}
			list.clear();
			list = jdbcTemplate.queryForList(sql.toString(), new Object[] { areaId });

			if (!list.isEmpty()) {
				for (Map<String, Object> record : list) {
					if (!idList.contains(new BigDecimal(record.get("SPACE_ID").toString()))) {
						JSONObject jo = new JSONObject();
						jo.put("name", record.get("SPACE_ID"));
						jo.put("value", record.get("PARK_NAME"));
						list3.add(jo);
					}
				}
			}
			
		}

		JSONObject jo = new JSONObject();
		jo.put("data1", list1);
		jo.put("data2", list2);
		jo.put("data3", list3);

		return jo;
	}

	@Override
	@Transactional(readOnly=true)
	public JSONObject selectCompAndEcDataByAreaIdAndYearAndQuarter(Integer areaId, Integer year, Integer quarter,
			Boolean isProvince, BigDecimal provinceId) {
		JSONObject compAndEcData = new JSONObject();

		StringBuilder sql1 = new StringBuilder().append("select nvl(t.gyzjz_percent, 0) gyzjz_percent, ")
				.append("nvl(t.zyywsr_value, 0) zyywsr_value, ").append("nvl(t.zyywsr_percent, 0) zyywsr_percent, ")
				.append("nvl(t.lr_value, 0) lr_value, ").append("nvl(t.lr_percent, 0) lr_percent ")
				.append("from R_Pk_In_Op_Mn_Ac_Log t ").append("where t.year_caliber = ? ")
				.append("and t.quarter_caliber = ? ").append("and t.organization_id = ? ")
				.append("and t.month_caliber in (3, 6, 9, 12) ");

		List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql1.toString(),
				new Object[] { year, quarter, areaId });
		if (!list1.isEmpty()) {
			JSONObject jo = new JSONObject();
			DecimalFormat df = new DecimalFormat("#0.00");
			jo.put("gyzjz_percent", list1.get(0).get("gyzjz_percent"));
			jo.put("zyywsr_value", df.format(Double.valueOf(list1.get(0).get("zyywsr_value").toString()) / 10000));
			jo.put("zyywsr_percent", list1.get(0).get("zyywsr_percent"));
			jo.put("lr_value", df.format(Double.valueOf(list1.get(0).get("lr_value").toString()) / 10000));
			jo.put("lr_percent", list1.get(0).get("lr_percent"));
			compAndEcData.put("ecData", jo);
		} else {
			JSONObject jo = new JSONObject();
			jo.put("gyzjz_percent", "-");
			jo.put("zyywsr_value", "-");
			jo.put("zyywsr_percent", "-");
			jo.put("lr_value", "-");
			jo.put("lr_percent", "-");
			compAndEcData.put("ecData", jo);
		}

		StringBuilder sql2 = new StringBuilder()
				.append("select t2.area_name, nvl(t1.tcgyqygs_value, 0) tcgyqygs_value, ")
				.append("nvl(t1.fgqy_qys_value, 0) fgqy_qys_value ").append("from t_area_info t2 ")
				.append("left join (select tcgyqygs_value, fgqy_qys_value, organization_id ")
				.append("from R_Pk_In_Op_Mn_Ac_Log t1 ").append("where year_caliber = ? ")
				.append("and quarter_caliber = ? ").append("and month_caliber in (3, 6, 9, 12)) t1 ")
				.append("on t2.area_id = t1.organization_id ").append("where t2.parent_id = ? ")
				.append("order by t2.area_id asc ");

		StringBuilder sql3 = new StringBuilder()
				.append("select space_name as area_name, nvl(sum(tcgyqygs_value), 0) tcgyqygs_value, ")
				.append("nvl(sum(fgqy_qys_value), 0) fgqy_qys_value ")
				.append("from view_comp_indicator_quarter ")
				.append("where area_id = ? ")
				.append("and year_caliber = ? ")
				.append("and quarter_caliber = ? ")
				.append("and month_caliber in (3, 6, 9, 12) ")
				.append("group by space_id,space_name ")
				.append("order by space_id asc ");
		List<Map<String, Object>> list2 = new ArrayList<>();
		if(new BigDecimal(areaId).equals(provinceId)){
			list2 = jdbcTemplate.queryForList(sql2.toString(),
					new Object[] { year, quarter, areaId });
		}else{
			list2 = jdbcTemplate.queryForList(sql3.toString(),
					new Object[] { areaId, year, quarter });
		}
		
		JSONObject compData = new JSONObject();
		if (!list2.isEmpty()) {
			JSONObject line = new JSONObject();
			JSONObject pie = new JSONObject();

			JSONArray xAxisDataLine = new JSONArray();
			/* 图形数据, 1投产 2非工企业数 */
			JSONArray seriesData1Line = new JSONArray();
			JSONArray seriesData2Line = new JSONArray();
			List<JSONArray> seriesDataLineList = new ArrayList<>();
			int total = 0;
			for (Map<String, Object> record : list2) {
				xAxisDataLine.add(record.get("AREA_NAME"));
				int tcgyqygsValue = Integer.parseInt(record.get("tcgyqygs_value").toString());
				int fgqyQysValue = Integer.parseInt(record.get("fgqy_qys_value").toString());
				seriesData1Line.add(tcgyqygsValue);
				seriesData2Line.add(fgqyQysValue);
				total += (tcgyqygsValue);
			}
			seriesDataLineList.add(seriesData1Line);
			seriesDataLineList.add(seriesData2Line);

			line.put("xAxis", xAxisDataLine);
			line.put("series", seriesDataLineList);

			/* 封装饼图数据 */
			List<JSONObject> legendDataPieList = new ArrayList<>();
			List<JSONObject> seriesDataPieList = new ArrayList<>();
			JSONObject textStyle = new JSONObject();
			textStyle.put("color", "#FFF");
			if (total != 0) {
				JSONObject legendDataPie = new JSONObject();
				JSONObject seriesDataPie = new JSONObject();

				legendDataPie.put("name", "投产");
				legendDataPie.put("textStyle", textStyle);
				seriesDataPie.put("value", total);
				seriesDataPie.put("name", "投产");

				legendDataPieList.add(legendDataPie);
				seriesDataPieList.add(seriesDataPie);
			}
			pie.put("legend", legendDataPieList);
			pie.put("series", seriesDataPieList);

			compData.put("line", line);
			compData.put("pie", pie);
		}
		compAndEcData.put("compData", compData);

		return compAndEcData;
	}

	@Override
	@Transactional(readOnly=true)
	public JSONObject selectEconomicDataByAreaIdAndYear(Integer areaId, Integer year, Boolean isProvince) {
		StringBuilder sql1 = new StringBuilder()
				.append("select t.quarter_caliber, ")
				.append("nvl(t.gyzjz_percent, 0) gyzjz_percent, ")
				.append("nvl(t.zyywsr_value, 0) zyywsr_value, ")
				.append("nvl(t.zyywsr_percent, 0) zyywsr_percent, ")
				.append("nvl(t.zssjdwzj_Value, 0) zssjdwzj_Value, ")
				.append("nvl(t.zssjdwzj_percent, 0) zssjdwzj_percent, ")
				.append("nvl(t.lr_value, 0) lr_value, ")
				.append("nvl(t.lr_percent, 0) lr_percent, ")
				.append("nvl(t.yqsjkfmj_Value, 0) yqsjkfmj_Value, ")
				.append("nvl(t.ckjhz_value, 0) ckjhz_value, ")
				.append("nvl(t.ckjhz_percent, 0) ckjhz_percent ")
				.append("from R_Pk_In_Op_Mn_Ac_Log t ")
				.append("where t.year_caliber = ? ")
				.append("and t.organization_id = ? ")
				.append("and t.month_caliber in (3, 6, 9, 12) ")
				.append("order by t.quarter_caliber ");
		
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql1.toString(), new Object[] { year, areaId });
		
		
		JSONArray gyzjzPercent = new JSONArray();
		JSONArray zyywsrValue = new JSONArray();
		JSONArray zyywsrPercent = new JSONArray();
		JSONArray zssjdwzjValue = new JSONArray();
		JSONArray zssjdwzjPercent = new JSONArray();
		JSONArray lrValue = new JSONArray();
		JSONArray lrPercent = new JSONArray();
		JSONArray yqsjkfmjValue = new JSONArray();
		JSONArray ckjhzValue = new JSONArray();
		JSONArray ckjhzPercent = new JSONArray();
		
		if (!list.isEmpty()) {
			DecimalFormat df = new DecimalFormat("#0.0");
			for (Map<String, Object> record : list) {
				gyzjzPercent.add(record.get("gyzjz_percent"));
				zyywsrValue.add(df.format(Double.valueOf(record.get("zyywsr_value").toString()) / 10000));
				zyywsrPercent.add(record.get("zyywsr_percent"));
				zssjdwzjValue.add(df.format(Double.valueOf(record.get("zssjdwzj_value").toString()) / 10000));
				zssjdwzjPercent.add(record.get("zssjdwzj_percent"));
				lrValue.add(df.format(Double.valueOf(record.get("lr_value").toString()) / 10000));
				lrPercent.add(record.get("lr_percent"));
				yqsjkfmjValue.add(df.format(Double.valueOf(record.get("yqsjkfmj_value").toString())));
				ckjhzValue.add(df.format(Double.valueOf(record.get("ckjhz_value").toString()) / 10000));
				ckjhzPercent.add(record.get("ckjhz_percent"));
			}
		}
		
		List<List<JSONArray>> series = new ArrayList<>();
		List<JSONArray> gyzjzList = new ArrayList<>();
		gyzjzList.add(gyzjzPercent);
		List<JSONArray> zyywsrList = new ArrayList<>();
		zyywsrList.add(zyywsrValue);
		zyywsrList.add(zyywsrPercent);
		List<JSONArray> zssjdwzjList = new ArrayList<>();
		zssjdwzjList.add(zssjdwzjValue);
		zssjdwzjList.add(zssjdwzjPercent);
		List<JSONArray> lrList = new ArrayList<>();
		lrList.add(lrValue);
		lrList.add(lrPercent);
		List<JSONArray> yqsjkfmjList = new ArrayList<>();
		yqsjkfmjList.add(yqsjkfmjValue);
		List<JSONArray> ckjhzList = new ArrayList<>();
		ckjhzList.add(ckjhzValue);
		ckjhzList.add(ckjhzPercent);
		
		series.add(gyzjzList);
		series.add(zyywsrList);
		series.add(zssjdwzjList);
		series.add(lrList);
		series.add(yqsjkfmjList);
		series.add(ckjhzList);
		
		JSONObject economicData = new JSONObject(); 
		economicData.put("ecData", series);
		
		/*地图颜色展示数据*/
		StringBuilder sql2 = new StringBuilder()
				.append("select t2.area_name, nvl(t1.zyywsr_value, 0) zyywsr_value ")
				.append("from R_Pk_In_Op_Mn_Ac_Log t1, t_area_info t2 ")
				.append("where t1.organization_id = t2.area_id ")
				.append("and t1.year_caliber = ? ")
				.append("and t1.month_caliber = ")
				.append("(select max(month_caliber) ")
				.append("from R_Pk_In_Op_Mn_Ac_Log ")
				.append("where year_caliber = ? ")
				.append("and organization_id = ? ")
				.append("and month_caliber in (3, 6, 9, 12)) ")
				.append("and t2.parent_id = ? ")
				.append("order by t2.area_id asc ");
		
		StringBuilder sql3 = new StringBuilder()
				.append("select area_name, ")
				.append("(select nvl(zyywsr_value, 0) ")
				.append("from R_Pk_In_Op_Mn_Ac_Log ")
				.append("where organization_id = ? ")
				.append("and year_caliber = ? ")
				.append("and month_caliber = ")
				.append("(select max(month_caliber) ")
				.append("from R_Pk_In_Op_Mn_Ac_Log  ")
				.append("where year_caliber = ? ")
				.append("and organization_id = ? ")
				.append("and month_caliber in (3, 6, 9, 12))) as zyywsr_value ")
				.append("from t_area_info ")
				.append("where parent_id = ? ")
				.append("order by area_id asc ");
		
		List<Map<String, Object>> list2 = new ArrayList<>();

		if (isProvince) {
			list2 = jdbcTemplate.queryForList(sql2.toString(), new Object[] { year, year, areaId, areaId });
		} else {
			list2 = jdbcTemplate.queryForList(sql3.toString(), new Object[] { areaId, year, year, areaId, areaId });
		}

		List<JSONObject> seriesMap = new ArrayList<>();
		int visualMapMax = 1000;
		if (!list2.isEmpty()) {
			for (Map<String, Object> record : list2) {
				Double zyywsr = Double.parseDouble(record.get("zyywsr_value").toString());
				JSONObject jo = new JSONObject();
				String name = record.get("AREA_NAME").toString();
				if ("新建区".equals(name)) {
					name = "新建县";
				} else if ("南康区".equals(name)) {
					name = "南康市";
				} else if ("广丰区".equals(name)) {
					name = "广丰县";
				}
				jo.put("name", name);
				jo.put("value", String.format("%.1f", zyywsr / 10000));
				seriesMap.add(jo);
				if (record.get("zyywsr_value") != null) {
					if (Math.ceil(zyywsr / 10000) <= 1500) {
						visualMapMax = 1500;
					} else if (Math.ceil(zyywsr / 10000) < 2500 && Math.ceil(zyywsr / 10000) > 1500) {
						visualMapMax = 2500;
					} else if (Math.ceil(zyywsr / 10000) < 3500 && Math.ceil(zyywsr / 10000) > 2500) {
						visualMapMax = 3500;
					} else {
						visualMapMax = Math.max(visualMapMax, (int) Math.ceil(zyywsr / 10000));
					}
				}
			}
		}

		economicData.put("mapData", seriesMap);
		economicData.put("visualMap", visualMapMax);
		
		return economicData;
	}

	@Override
	@Transactional(readOnly=true)
	public JSONObject selectIndustryDataByAreaIdAndYearAndQuarter(Integer areaId, Integer year, Integer quarter,
			Boolean isProvince, BigDecimal provinceId, Short industryType) {
		/*园区经济指标排行*/
		StringBuilder sql1 = new StringBuilder()
				.append("select * ")
				.append("from (select tp.park_name, ")
				.append("nvl(t.gyzjz_value, 0) gyzjz_value, ")
				.append("nvl(t.zyywsr_value, 0) zyywsr_value, ")
				.append("nvl(t.lr_value, 0) lr_value, ")
				.append("nvl(t.ckjhz_value, 0) ckjhz_value ")
				.append("from R_Pk_In_Op_Mn_Ac_Log t, T_Park_Info tp ")
				.append("where t.organization_id = tp.park_id ")
				.append("and t.year_caliber = ? ")
				.append("and t.quarter_caliber = ? ")
				.append("and t.month_caliber in (3, 6, 9, 12) ");
		if (new BigDecimal(areaId).equals(provinceId)) {
			sql1.append("and tp.province_id = ? ");
		} else {
			sql1.append("and tp.area_id = ? ");
		}
		sql1.append("order by " + (industryType + 1) + " desc) ").append("where ROWNUM <= 10 ");
		
		List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql1.toString(), new Object[] { year, quarter, areaId });
		
		List<JSONObject> parkSort = new ArrayList<>();
		if(!list1.isEmpty()){
			DecimalFormat df = new DecimalFormat("#0.0");
			for (Map<String, Object> record : list1) {
				JSONObject jo = new JSONObject();
				switch (industryType) {
				case 1:
					jo.put("parkName", record.get("park_name"));
					jo.put("value", df.format(Double.valueOf(record.get("gyzjz_value").toString()) / 10000));
					break;
				case 2:
					jo.put("parkName", record.get("park_name"));
					jo.put("value", df.format(Double.valueOf(record.get("zyywsr_value").toString()) / 10000));				
					break;
				case 3:
					jo.put("parkName", record.get("park_name"));
					jo.put("value", df.format(Double.valueOf(record.get("lr_value").toString()) / 10000));
					break;
				case 4:
					jo.put("parkName", record.get("park_name"));
					jo.put("value", df.format(Double.valueOf(record.get("ckjhz_value").toString()) / 10000));
					break;

				default:
					break;
				}
				parkSort.add(jo);
			}
		}
		
		JSONObject industryData = new JSONObject();
		industryData.put("parkSort", parkSort);
		
		/*按地市统计各园区三个类型的四个产值 省级 = 0 国家级 = 1 重点省级 = 2*/
		StringBuilder sql2 = new StringBuilder()
				.append("select t1.area_name, t1.area_id, ")
				.append("t1.sum_gyzjz_value1,t1.sum_gyzjz_value2,t1.sum_gyzjz_value0, ")
				.append("t1.sum_zyywsr_value1,t1.sum_zyywsr_value2,t1.sum_zyywsr_value0, ")
				.append("t1.sum_lr_value1,t1.sum_lr_value2,t1.sum_lr_value0, ")  
				.append("t1.sum_ckjhz_value1,t1.sum_ckjhz_value2,t1.sum_ckjhz_value0 ") 
				.append("from ( select t.area_id,t.area_name, ") 
				.append("(select nvl(sum(v.gyzjz_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.area_name = t.area_name ") 
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.park_kind =1 and v.month_caliber in (3,6,9,12))  as sum_gyzjz_value1, ")
				.append("(select nvl(sum(v.gyzjz_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.area_name = t.area_name ") 
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.park_kind =2 and v.month_caliber in (3,6,9,12)) as sum_gyzjz_value2, ")
				.append("(select nvl(sum(v.gyzjz_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.area_name = t.area_name ") 
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.park_kind =0 and v.month_caliber in (3,6,9,12)) as sum_gyzjz_value0, ")
				.append("(select nvl(sum(v.zyywsr_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.area_name = t.area_name ") 
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.park_kind =1 and v.month_caliber in (3,6,9,12))  as sum_zyywsr_value1, ")
				.append("(select nvl(sum(v.zyywsr_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.area_name = t.area_name ") 
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.park_kind =2 and v.month_caliber in (3,6,9,12)) as sum_zyywsr_value2, ")
				.append("(select nvl(sum(v.zyywsr_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.area_name = t.area_name ") 
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.park_kind =0 and v.month_caliber in (3,6,9,12)) as sum_zyywsr_value0, ")
				.append("(select nvl(sum(v.lr_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.area_name = t.area_name ") 
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.park_kind =1 and v.month_caliber in (3,6,9,12)) as sum_lr_value1, ")
				.append("(select nvl(sum(v.lr_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.area_name = t.area_name ") 
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.park_kind =2 and v.month_caliber in (3,6,9,12)) as sum_lr_value2, ")
				.append("(select nvl(sum(v.lr_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.area_name = t.area_name ") 
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.park_kind =0 and v.month_caliber in (3,6,9,12)) as sum_lr_value0, ")
				.append("(select nvl(sum(v.ckjhz_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.area_name = t.area_name ") 
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.park_kind =1 and v.month_caliber in (3,6,9,12))  as sum_ckjhz_value1, ")
				.append("(select nvl(sum(v.ckjhz_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.area_name = t.area_name ") 
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.park_kind =2 and v.month_caliber in (3,6,9,12)) as sum_ckjhz_value2, ")
				.append("(select nvl(sum(v.ckjhz_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.area_name = t.area_name ") 
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.park_kind =0 and v.month_caliber in (3,6,9,12)) as sum_ckjhz_value0 ") 
				.append("from VIEW_PARK_INDICATOR_QUARTER t ") 
				.append("where t.year_caliber = ? and t.quarter_caliber = ? ") 
				.append("and t.month_caliber in (3,6,9,12) and t.province_id = ? ") 
				.append("group by t.area_id,t.area_name )t1,t_area_info t2 ") 
				.append("where t1.area_id = t2.area_id order by t2.sort_grade ");
		/*按市统计*/
		StringBuilder sql3 = new StringBuilder()
				.append("select t1.space_name as area_name, t1.space_id as area_id,")
				.append("t1.sum_gyzjz_value1,t1.sum_gyzjz_value2,t1.sum_gyzjz_value0, ")
				.append("t1.sum_zyywsr_value1,t1.sum_zyywsr_value2,t1.sum_zyywsr_value0, ")
				.append("t1.sum_lr_value1,t1.sum_lr_value2,t1.sum_lr_value0,  ")
				.append("t1.sum_ckjhz_value1,t1.sum_ckjhz_value2,t1.sum_ckjhz_value0 ")
				.append("from ( select t.space_id,t.space_name, ")
				.append("(select nvl(sum(v.gyzjz_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.space_name = t.space_name ")
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.area_id = ? and v.park_kind =1 and v.month_caliber in (3,6,9,12)) as sum_gyzjz_value1,")
				.append("(select nvl(sum(v.gyzjz_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.space_name = t.space_name ")
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.area_id = ? and v.park_kind =2 and v.month_caliber in (3,6,9,12)) as sum_gyzjz_value2,")
				.append("(select nvl(sum(v.gyzjz_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.space_name = t.space_name ")
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.area_id = ? and v.park_kind =0 and v.month_caliber in (3,6,9,12)) as sum_gyzjz_value0,")
				.append("(select nvl(sum(v.zyywsr_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.space_name = t.space_name ")
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.area_id = ? and v.park_kind =1 and v.month_caliber in (3,6,9,12)) as sum_zyywsr_value1,")
				.append("(select nvl(sum(v.zyywsr_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.space_name = t.space_name ")
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.area_id = ? and v.park_kind =2 and v.month_caliber in (3,6,9,12)) as sum_zyywsr_value2,")
				.append("(select nvl(sum(v.zyywsr_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.space_name = t.space_name ")
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.area_id = ? and v.park_kind =0 and v.month_caliber in (3,6,9,12)) as sum_zyywsr_value0,")
				.append("(select nvl(sum(v.lr_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.space_name = t.space_name ")
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.area_id = ? and v.park_kind =1 and v.month_caliber in (3,6,9,12)) as sum_lr_value1,")
				.append("(select nvl(sum(v.lr_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.space_name = t.space_name ")
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.area_id = ? and v.park_kind =2 and v.month_caliber in (3,6,9,12)) as sum_lr_value2,")
				.append("(select nvl(sum(v.lr_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.space_name = t.space_name ")
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.area_id = ? and v.park_kind =0 and v.month_caliber in (3,6,9,12)) as sum_lr_value0,")
				.append("(select nvl(sum(v.ckjhz_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.space_name = t.space_name ")
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.area_id = ? and v.park_kind =1 and v.month_caliber in (3,6,9,12))  as sum_ckjhz_value1,")
				.append("(select nvl(sum(v.ckjhz_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.space_name = t.space_name ")
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.area_id = ? and v.park_kind =2 and v.month_caliber in (3,6,9,12)) as sum_ckjhz_value2,")
				.append("(select nvl(sum(v.ckjhz_value),0) from VIEW_PARK_INDICATOR_QUARTER v where v.space_name = t.space_name ")
				.append("and v.YEAR_CALIBER= ? and v.QUARTER_CALIBER = ? and v.area_id = ? and v.park_kind =0 and v.month_caliber in (3,6,9,12)) as sum_ckjhz_value0 ")
				.append("from VIEW_PARK_INDICATOR_QUARTER t ").append("where t.year_caliber = ?")
				.append("and t.quarter_caliber = ? ").append("and t.area_id = ? and t.month_caliber in (3,6,9,12)")
				.append("group by t.space_id,t.space_name )t1,t_area_info t2 ")
				.append("where t1.space_id = t2.area_id  ").append("order by t2.sort_grade ");

		
		/*工业总产值*/
		List<Map<String, Object>> list2 = new ArrayList<>();
		if (new BigDecimal(areaId).equals(provinceId)) {
			list2 = jdbcTemplate.queryForList(sql2.toString(),
					new Object[] { year, quarter, year, quarter, year, quarter, year, quarter,
							year, quarter, year, quarter, year, quarter, year, quarter,
							year, quarter, year, quarter, year, quarter, year, quarter,
							year, quarter, areaId });
		} else {
			list2 = jdbcTemplate.queryForList(sql3.toString(),
					new Object[] { year, quarter, areaId, year, quarter, areaId, year, quarter, areaId, year, quarter, areaId,
							year, quarter, areaId, year, quarter, areaId, year, quarter, areaId, year, quarter, areaId,
							year, quarter, areaId, year, quarter, areaId, year, quarter, areaId, year, quarter, areaId,
							year, quarter, areaId });
		}

		/*折线图数据*/
		JSONArray gyzjzValue1 = new JSONArray();
		JSONArray gyzjzValue2 = new JSONArray();
		JSONArray gyzjzValue0 = new JSONArray();
		JSONArray zyywsrValue1 = new JSONArray();
		JSONArray zyywsrValue2 = new JSONArray();
		JSONArray zyywsrValue0 = new JSONArray();
		JSONArray lrValue1 = new JSONArray();
		JSONArray lrValue2 = new JSONArray();
		JSONArray lrValue0 = new JSONArray();
		JSONArray ckjhzValue1 = new JSONArray();
		JSONArray ckjhzValue2 = new JSONArray();
		JSONArray ckjhzValue0 = new JSONArray();
		
		/*x轴数据*/
		JSONArray xAxis = new JSONArray();
		
		/*地图表示颜色数据*/
		List<JSONObject> gyzjzDataList = new ArrayList<>();
		List<JSONObject> zyywsrDataList = new ArrayList<>();
		List<JSONObject> lrDataList = new ArrayList<>();
		List<JSONObject> ckjhzDataList = new ArrayList<>();
		Double visualMapMax = (double) 1000;		
		
		DecimalFormat df = new DecimalFormat("#0.00");
		for (Map<String, Object> record : list2) {
			xAxis.add(record.get("AREA_NAME"));
			gyzjzValue1.add(df.format(Double.valueOf(record.get("sum_gyzjz_value1").toString()) / 10000));
			gyzjzValue2.add(df.format(Double.valueOf(record.get("sum_gyzjz_value2").toString()) / 10000));
			gyzjzValue0.add(df.format(Double.valueOf(record.get("sum_gyzjz_value0").toString()) / 10000));
			zyywsrValue1.add(df.format(Double.valueOf(record.get("sum_zyywsr_value1").toString()) / 10000));
			zyywsrValue2.add(df.format(Double.valueOf(record.get("sum_zyywsr_value2").toString()) / 10000));
			zyywsrValue0.add(df.format(Double.valueOf(record.get("sum_zyywsr_value0").toString()) / 10000));
			lrValue1.add(df.format(Double.valueOf(record.get("sum_lr_value1").toString()) / 10000));
			lrValue2.add(df.format(Double.valueOf(record.get("sum_lr_value2").toString()) / 10000));
			lrValue0.add(df.format(Double.valueOf(record.get("sum_lr_value0").toString()) / 10000));
			ckjhzValue1.add(df.format(Double.valueOf(record.get("sum_ckjhz_value1").toString()) / 10000));
			ckjhzValue2.add(df.format(Double.valueOf(record.get("sum_ckjhz_value2").toString()) / 10000));
			ckjhzValue0.add(df.format(Double.valueOf(record.get("sum_ckjhz_value0").toString()) / 10000));
			
			/*地图区域颜色数据*/
			Double gyzjz = Double.parseDouble(df.format(
					(Double.parseDouble(record.get("SUM_GYZJZ_VALUE1").toString())
							+ Double.parseDouble(record.get("SUM_GYZJZ_VALUE2").toString())
							+ Double.parseDouble(record.get("SUM_GYZJZ_VALUE0").toString())) / 10000));
			Double zyywsr = Double.parseDouble(df.format(
					(Double.parseDouble(record.get("SUM_ZYYWSR_VALUE1").toString())
							+ Double.parseDouble(record.get("SUM_ZYYWSR_VALUE2").toString())
							+ Double.parseDouble(record.get("SUM_ZYYWSR_VALUE0").toString())) / 10000));
			Double lr = Double.parseDouble(df.format(
					(Double.parseDouble(record.get("SUM_LR_VALUE1").toString())
							+ Double.parseDouble(record.get("SUM_LR_VALUE2").toString())
							+ Double.parseDouble(record.get("SUM_LR_VALUE0").toString())) / 10000));
			Double ckjhz = Double.parseDouble(df.format(
					(Double.parseDouble(record.get("SUM_CKJHZ_VALUE1").toString())
							+ Double.parseDouble(record.get("SUM_CKJHZ_VALUE2").toString())
							+ Double.parseDouble(record.get("SUM_CKJHZ_VALUE0").toString())) / 10000));

			String name = record.get("AREA_NAME").toString();
			if ("新建区".equals(name)) {
				name = "新建县";
			} else if ("南康区".equals(name)) {
				name = "南康市";
			} else if ("广丰区".equals(name)) {
				name = "广丰县";
			}
			
			JSONObject gyzjzData = new JSONObject();
			gyzjzData.put("name", name);
			gyzjzData.put("value", gyzjz);
			gyzjzDataList.add(gyzjzData);

			JSONObject zyywsrData = new JSONObject();
			zyywsrData.put("name", name);
			zyywsrData.put("value", zyywsr);
			zyywsrDataList.add(zyywsrData);

			JSONObject lrData = new JSONObject();
			lrData.put("name", name);
			lrData.put("value", lr);
			lrDataList.add(lrData);

			JSONObject ckjhzData = new JSONObject();
			ckjhzData.put("name", name);
			ckjhzData.put("value", ckjhz);
			ckjhzDataList.add(ckjhzData);

			Double max = Math.max(Math.max(gyzjz, zyywsr), Math.max(lr, ckjhz));

			if (max <= 1500) {
				visualMapMax = (double) 1500;
			} else if (max < 2500 && max > 1500) {
				visualMapMax = (double) 2500;
			} else if (max < 3500 && max > 2500) {
				visualMapMax = (double) 3500;
			} else {
				visualMapMax = Math.max(visualMapMax, max);
			}
		}
		
		
		/*对地图未有值的地区赋0值*/
		if (!new BigDecimal(areaId).equals(provinceId)) {
			String areaSql = "select area_name from t_area_info where parent_id = ?";
			List<Map<String, Object>> areaList = jdbcTemplate.queryForList(areaSql, new Object[] { areaId });

			for (Map<String, Object> record : areaList) {
				String name = record.get("AREA_NAME").toString();
				if ("新建区".equals(name)) {
					name = "新建县";
				} else if ("南康区".equals(name)) {
					name = "南康市";
				} else if ("广丰区".equals(name)) {
					name = "广丰县";
				}

				if (!xAxis.contains(name)) {
					JSONObject gyzjzData = new JSONObject();
					gyzjzData.put("name", name);
					gyzjzData.put("value", 0);
					gyzjzDataList.add(gyzjzData);

					JSONObject zyywsrData = new JSONObject();
					zyywsrData.put("name", name);
					zyywsrData.put("value", 0);
					zyywsrDataList.add(zyywsrData);

					JSONObject lrData = new JSONObject();
					lrData.put("name", name);
					lrData.put("value", 0);
					lrDataList.add(lrData);

					JSONObject ckjhzData = new JSONObject();
					ckjhzData.put("name", name);
					ckjhzData.put("value", 0);
					ckjhzDataList.add(ckjhzData);
				}
			}
		}
		
		JSONObject ecData = new JSONObject();
		JSONObject series = new JSONObject();
		JSONObject gyzjz = new JSONObject();
		gyzjz.put("gyzjzValue1", gyzjzValue1);
		gyzjz.put("gyzjzValue2", gyzjzValue2);
		gyzjz.put("gyzjzValue0", gyzjzValue0);
		JSONObject zyywsr = new JSONObject();
		zyywsr.put("zyywsrValue1", zyywsrValue1);
		zyywsr.put("zyywsrValue2", zyywsrValue2);
		zyywsr.put("zyywsrValue0", zyywsrValue0);
		JSONObject lr = new JSONObject();
		lr.put("lrValue1", lrValue1);
		lr.put("lrValue2", lrValue2);
		lr.put("lrValue0", lrValue0);
		JSONObject ckjhz = new JSONObject();
		ckjhz.put("ckjhzValue1", ckjhzValue1);
		ckjhz.put("ckjhzValue2", ckjhzValue2);
		ckjhz.put("ckjhzValue0", ckjhzValue0);
		
		series.put("gyzjz", gyzjz);
		series.put("zyywsr", zyywsr);
		series.put("lr", lr);
		series.put("ckjhz", ckjhz);
		
		ecData.put("series", series);
		ecData.put("xAxis", xAxis);
		
		JSONObject mapData = new JSONObject();
		mapData.put("gyzjz", gyzjzDataList);
		mapData.put("zyywsr", zyywsrDataList);
		mapData.put("lr", lrDataList);
		mapData.put("ckjhz", ckjhzDataList);
		mapData.put("visualMapMax", visualMapMax);
		
		industryData.put("ecData", ecData);
		industryData.put("mapData", mapData);
		
		return industryData;		
	}

	@Override
	@Transactional(readOnly=true)
	public JSONObject selectEnergyDataByYear(Integer year) {
		
		/*总体数据，纳入监管企业、能耗5000吨以上、能耗十万吨以上*/
		String[] totalData = null;
		
		/*水球下面文本数据*/
		String[] waterPoloTextData = null;
		
		/*柱形图数据*/
		/*显示全省规模以上工业能源消费*/
		String barLegendData1 = "[{name:'综合能耗',textStyle:{color:'#FCFF00\'}},"
				+ "{name:'同比',textStyle:{color:'#FCFF00'}}]"; // 图例
		String barXAxisData1 = "['南昌','景德镇','萍乡','九江','新余'," + "'鹰潭','赣州','吉安','宜春','抚州','上饶']"; 
		String barSeriesData1 = ""; 
		String lineSeriesData1 = "";

		/*显示全省六大高耗能行业*/
		String barLegendData2 = "[{name:'综合能耗',textStyle:{color:'#FCFF00\'}},"
				+ "{name:'同比',textStyle:{color:'#FCFF00'}}]";
		String barXAxisData2 = "['石油加工','化学原料','非金属矿物'," + "'黑色金属冶炼','有色金属冶炼','电力热力供应']";
		String barSeriesData2 = "";
		String lineSeriesData2 = "";

		/*饼图数据*/
		String pieData = "";
		String pieTitle = "";
		
		/*列表数据*/
		String comment = "";
		String[] listData = null;
		
		if (year == 2014) { 
			totalData = new String[]{"492","253","49"};

			waterPoloTextData = new String[]{"4906.66","6.4","3346.02","5.5","4172.49","6.60"};

			barSeriesData1 = "[{name:'南昌',value:529.42},{name:'景德镇',value:363.93},"
					+ "{name:'萍乡',value:931.02},{name:'九江',value:747.04},"
					+ "{name:'新余',value:641.96},{name:'鹰潭',value:280.31},"
					+ "{name:'赣州',value:129.15},{name:'吉安',value:230.35},"
					+ "{name:'宜春',value:766.16},{name:'抚州',value:34.39}," + "{name:'上饶',value:252.92}]";
			lineSeriesData1 = "[{name:'南昌',value:0.4},{name:'景德镇',value:9},"
					+ "{name:'萍乡',value:0.17},{name:'九江',value:14}," + "{name:'新余',value:-1.83},{name:'鹰潭',value:24},"
					+ "{name:'赣州',value:8.7},{name:'吉安',value:1.06}," + "{name:'宜春',value:7.9},{name:'抚州',value:1.21},"
					+ "{name:'上饶',value:7.4}]";

			barSeriesData2 = "[{name:'石油加工及炼焦业',value:1159.37},{name:'化学原料及化学制品制造业',value:918.35},"
					+ "{name:'非金属矿物制品业',value:753.14},{name:'黑色金属冶炼及压延加工业',value:586.47},"
					+ "{name:'有色金属冶炼及压延加工业',value:411.12},{name:'电力热力的生产供应',value:344.04},]";

			lineSeriesData2 = "[{name:'石油加工及炼焦业',value:9.50},{name:'化学原料及化学制品制造业',value:0.03},"
					+ "{name:'非金属矿物制品业',value:11.10},{name:'黑色金属冶炼及压延加工业',value:-0.95},"
					+ "{name:'有色金属冶炼及压延加工业',value:3.30},{name:'电力热力的生产供应',value:16.80},]";

			pieData = "[{name:'在线',value:85.1},{name:'不在线',value:14.9}]";
			pieTitle = "85.1%";

			comment = "增速超过<font class=\"yellowFont17\">20%</font>的企业有&nbsp;&nbsp;<font class=\"yellowFont17\">8</font>家，其中水泥企业有&nbsp;&nbsp;<font class=\"yellowFont17\">3</font>家";
			listData = new String[]{"中材萍乡水泥","37.20%","玉山南方水泥","28.50%","弋阳海螺水泥","20.60%"};

		} else if (year == 2015) {
			totalData = new String[]{"492","253","51"};

			waterPoloTextData = new String[]{"4980.21","0.7","3373.91","-0.7","4238.66","0.9"};

			barSeriesData1 = "[{name:'南昌',value:545.94},{name:'景德镇',value:350.83},"
					+ "{name:'萍乡',value:926.36},{name:'九江',value:782.30},"
					+ "{name:'新余',value:666.42},{name:'鹰潭',value:280.03},"
					+ "{name:'赣州',value:128.51},{name:'吉安',value:219.07},"
					+ "{name:'宜春',value:782.17},{name:'抚州',value:33.02}," + "{name:'上饶',value:265.57}]";
			lineSeriesData1 = "[{name:'南昌',value:3.12},{name:'景德镇',value:-3.6},"
					+ "{name:'萍乡',value:-0.5},{name:'九江',value:4.72},"
					+ "{name:'新余',value:3.81},{name:'鹰潭',value:-0.1},"
					+ "{name:'赣州',value:-0.5},{name:'吉安',value:-4.9}," + "{name:'宜春',value:2.09},{name:'抚州',value:-4},"
					+ "{name:'上饶',value:5.00}]";

			barSeriesData2 = "[{name:'石油加工及炼焦业',value:1193.80},{name:'化学原料及化学制品制造业',value:930.84},"
					+ "{name:'非金属矿物制品业',value:778.29},{name:'黑色金属冶炼及压延加工业',value:585.82},"
					+ "{name:'有色金属冶炼及压延加工业',value:419.96},{name:'电力热力的生产供应',value:329.93},]";

			lineSeriesData2 = "[{name:'石油加工及炼焦业',value:2.97},{name:'化学原料及化学制品制造业',value:1.36},"
					+ "{name:'非金属矿物制品业',value:3.34},{name:'黑色金属冶炼及压延加工业',value:-0.11},"
					+ "{name:'有色金属冶炼及压延加工业',value:2.15},{name:'电力热力的生产供应',value:-4.1},]";

			pieData = "[{name:'在线',value:86.4},{name:'不在线',value:13.6}]";
			pieTitle = "86.4%";

			comment = "降幅超过<font class=\"yellowFont17\">20%</font>的企业有&nbsp;&nbsp;<font class=\"yellowFont17\">3</font>家";
			listData = new String[]{"江西赣中氯碱制造有限公司","-55.70%","江西省金三角陶瓷有限公司","-35.00%","江西中煤科技有限责任公司","-22.80%"};
		} else if (year == 2016) {
			totalData = new String[]{"492","253","55"};

			waterPoloTextData = new String[]{"5104.33","1.9","3373.65","-1.4","4364.53","2.5"};

			barSeriesData1 = "[{name:'南昌',value:558.39},{name:'景德镇市',value:369.07},"
					+ "{name:'萍乡',value:946.74},{name:'九江市',value:825.33},"
					+ "{name:'新余',value:664.69},{name:'鹰潭市',value:282.24},"
					+ "{name:'赣州',value:134.87},{name:'吉安市',value:225.09},"
					+ "{name:'宜春',value:799.38},{name:'抚州市',value:33.31}," + "{name:'上饶',value:265.22}]";
			lineSeriesData1 = "[{name:'南昌',value:2.28},{name:'景德镇',value:5.2},"
					+ "{name:'萍乡',value:2.2},{name:'九江',value:5.5}," + "{name:'新余',value:-0.26},{name:'鹰潭',value:0.79},"
					+ "{name:'赣州',value:4.95},{name:'吉安',value:2.75}," + "{name:'宜春',value:2.2},{name:'抚州',value:0.89},"
					+ "{name:'上饶',value:-0.13}]";

			barSeriesData2 = "[{name:'石油加工及炼焦业',value:1228.42},{name:'化学原料及化学制品制造业',value:963.70},"
					+ "{name:'非金属矿物制品业',value:813.55},{name:'黑色金属冶炼及压延加工业',value:584.24},"
					+ "{name:'有色金属冶炼及压延加工业',value:428.53},{name:'电力热力的生产供应',value:346.10},]";

			lineSeriesData2 = "[{name:'石油加工及炼焦业',value:2.9},{name:'化学原料及化学制品制造业',value:3.53},"
					+ "{name:'非金属矿物制品业',value:4.53},{name:'黑色金属冶炼及压延加工业',value:-0.27},"
					+ "{name:'有色金属冶炼及压延加工业',value:2.04},{name:'电力热力的生产供应',value:4.9},]";

			pieData = "[{name:'在线',value:89.33},{name:'不在线',value:10.67}]";
			pieTitle = "89.33%";

			comment = "钢铁企业能耗下降明显";
			listData = new String[]{"萍乡安源钢铁","-9.60%","新余钢铁","-3.10%","方大特钢","-0.50%"};
		}
		
		JSONObject bar1 = new JSONObject();
		bar1.put("legend", barLegendData1);
		bar1.put("xAxis", barXAxisData1);
		bar1.put("series0", barSeriesData1);
		bar1.put("series1", lineSeriesData1);
		
		JSONObject bar2 = new JSONObject();
		bar2.put("legend", barLegendData2);
		bar2.put("xAxis", barXAxisData2);
		bar2.put("series0", barSeriesData2);
		bar2.put("series1", lineSeriesData2);
		
		JSONObject pie = new JSONObject();
		pie.put("pieData", pieData);
		pie.put("pieTitle", pieTitle);
		
		JSONObject list = new JSONObject();
		list.put("comment", comment);
		list.put("listData", listData);
		
		JSONObject energyData = new JSONObject();
		energyData.put("totalData", totalData);
		energyData.put("waterPoloTextData", waterPoloTextData);
		energyData.put("bar1", bar1);
		energyData.put("bar2", bar2);
		energyData.put("pie", pie);
		energyData.put("list", list);
		
		return energyData;		
	}

}
