package com.chinatelecom.jx.zone.management.service.cityDataCenter.yc;

import java.math.BigDecimal;
import java.text.DecimalFormat;
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
public class YcCityDataCenterServiceImpl implements IYcCityDataCenterService {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private static final BigDecimal JX_ORG_ID = new BigDecimal("360000");
	private static final BigDecimal YC_ORG_ID = new BigDecimal("360900");
	
	@Override
	public JSONObject selectFirstPageData(BigDecimal orgId, Integer year, Integer month) {
		/* 返回数据 */
		JSONObject firstPageData = new JSONObject();
		
		/* 经济运行数据 */
		StringBuilder sql1 = new StringBuilder().append("select * from r_pk_ei_mn_ac_log  ")
				.append("where organization_id =? ").append("and year_caliber = ? ")
				.append("and month_caliber = ? and organization_kind = 0 order by organization_id desc");
		List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql1.toString(),
				new Object[] { orgId, year, month });
		
		StringBuilder sql11 = new StringBuilder().append("select * from r_pk_ec_mn_ac_log ")
				.append("where organization_id = ? ").append("and year_caliber = ? ")
				.append("and month_caliber = ? and organization_kind = 1 order by organization_id desc");
		List<Map<String, Object>> list11 = jdbcTemplate.queryForList(sql11.toString(),
				new Object[] { orgId, year, month });
		
		JSONObject econData = new JSONObject();
		if (!list1.isEmpty()||!list11.isEmpty()) {
			String[] index = new String[] { "gyzjz", "zyywsr", "lr", "gytz", "gyydl" };
			DecimalFormat df = new DecimalFormat("#0.00");
			DecimalFormat df2 = new DecimalFormat("#0");
			for (int i = 0; i < index.length; i++) {
				JSONObject jo = new JSONObject();
				Map<String, Object> obj = null;
				if (i == (index.length - 1)) {
					if(list11.isEmpty()||list11.get(0) == null){
						continue;
					}
					obj = list11.get(0);
					
					jo.put("value", obj.get(index[i] + "_value1") == null ? ""
							: df2.format(Double.valueOf(obj.get(index[i] + "_value1").toString())));
					jo.put("percent", obj.get(index[i] + "_percent1") == null ? ""
							: obj.get(index[i] + "_percent1"));
					jo.put("percentOrder",
							obj.get(index[i] + "_order1") == null ? "" : obj.get(index[i] + "_order1"));
				} else {
					if(list1.isEmpty()||list1.get(0) == null){
						continue;
					}
					obj = list1.get(0);
					
					jo.put("value", obj.get(index[i] + "_value") == null ? ""
							: df.format(Double.valueOf(obj.get(index[i] + "_value").toString()) / 10000));
					jo.put("percent", obj.get(index[i] + "_percent") == null ? ""
							: obj.get(index[i] + "_percent"));
					jo.put("percentOrder",
							obj.get(index[i] + "_order1") == null ? "" : obj.get(index[i] + "_order1"));
				}
				
				econData.put(index[i], jo);
			}

		}
		firstPageData.put("econData", econData);
		
		/*全省工业用电量*/
		String sql2 = "select organization_name, gyydl_value1, gyydl_value2, (CASE WHEN t.organization_id = ? THEN 1 ELSE 0 END) flag "
				+"from r_pk_ec_mn_ac_log t where exists (select 1 from t_area_info "
				+"where parent_id = ? and area_id = t.organization_id) and t.year_caliber = ? " 
				+"and t.month_caliber = ? and t.organization_kind = 1 order by flag desc, organization_id asc";
		List<Map<String, Object>> list2 = jdbcTemplate.queryForList(sql2, new Object[]{orgId, JX_ORG_ID, year, month});
		JSONObject gyydlProData = new JSONObject();
		if(!list2.isEmpty()){
			JSONArray xAxis = new JSONArray();
			JSONArray series1 = new JSONArray();
			JSONArray series2 = new JSONArray();
			List<JSONArray> series = new ArrayList<>();
			for (Map<String, Object> record : list2) {
				xAxis.add(record.get("organization_name"));
				series1.add(record.get("gyydl_value1"));
				series2.add(record.get("gyydl_value2"));
			}
			series.add(series1);
			series.add(series2);
			gyydlProData.put("xAxis", xAxis);
			gyydlProData.put("series", series);
		}
		firstPageData.put("gyydlProData", gyydlProData);
		
		/*宜春市工业用电量*/
		String sql3 = "select organization_name, gyydl_value, gyydl_percent, "
				+"(select gyydl_value from r_pk_ec_mn_ac_log "
				+"where organization_id = t.organization_id and year_caliber = ? "
				+"and month_caliber = ? and t.organization_kind = 2 ) gyydl_value_last "
				+"from r_pk_ec_mn_ac_log t where exists (select 1 from t_area_info "
				+"where parent_id = ? and area_id = t.organization_id) and t.year_caliber = ? "
				+"and t.month_caliber = ? and t.organization_kind = 2 order by organization_id asc";
		List<Map<String, Object>> list3 = jdbcTemplate.queryForList(sql3, new Object[]{(year-1), month, orgId, year ,month});
		JSONObject gyydlAreaData = new JSONObject();
		if(!list3.isEmpty()){
			JSONArray xAxis = new JSONArray();
			JSONArray series1 = new JSONArray();
			JSONArray series2 = new JSONArray();
			JSONArray series3 = new JSONArray();
			List<JSONArray> series = new ArrayList<>();
			for (Map<String, Object> record : list3) {
				xAxis.add(record.get("organization_name"));
				series1.add(record.get("gyydl_value"));
				series2.add(record.get("gyydl_value_last"));
				series3.add(record.get("gyydl_percent"));
			}
			series.add(series1);
			series.add(series2);
			series.add(series3);
			gyydlAreaData.put("xAxis", xAxis);
			gyydlAreaData.put("series", series);
		}
		firstPageData.put("gyydlAreaData", gyydlAreaData);
		
		return firstPageData;
	}

	@Override
	public JSONObject selectSecondPageData(BigDecimal orgId, BigDecimal areaId, Integer year, Integer month) {
		/* 返回数据 */
		JSONObject secondPageData = new JSONObject();

		/* 经济运行数据 */
		StringBuilder sql1 = new StringBuilder().append("select * from r_pk_ei_mn_ac_log ")
				.append("where (organization_id = ? or organization_id = ?) ").append("and year_caliber = ? ")
				.append("and month_caliber = ? and organization_kind = 1 order by organization_id desc");
		List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql1.toString(),
				new Object[] { orgId, areaId, year, month });

		StringBuilder sql11 = new StringBuilder().append("select * from r_pk_ec_mn_ac_log ")
				.append("where organization_id = ?").append("and year_caliber = ? ")
				.append("and month_caliber = ? and organization_kind = 2 order by organization_id desc");
		List<Map<String, Object>> list11 = jdbcTemplate.queryForList(sql11.toString(),
				new Object[] { areaId, year, month });
		
		JSONObject econData = new JSONObject();
		if (!list1.isEmpty()||!list11.isEmpty()) {
			String[] index = new String[] { "gyzjz", "zyywsr", "lr", "gytz", "gyydl" };
			DecimalFormat df = new DecimalFormat("#0.00");
			DecimalFormat df2 = new DecimalFormat("#0");
			if (!list1.isEmpty()||!list11.isEmpty()) {
				for (int i = 0; i < index.length; i++) {
					JSONObject jo = new JSONObject();
					Map<String, Object> obj = null;
					if (i == (index.length - 1)) {
						if(list11.isEmpty()||list11.get(0) == null){
							continue;
						}
						obj = list11.get(0);
						
						jo.put("value", obj.get(index[i] + "_value1") == null ? ""
								: df2.format(Double.valueOf(obj.get(index[i] + "_value1").toString())));
						jo.put("percent", obj.get(index[i] + "_percent1") == null ? ""
								: obj.get(index[i] + "_percent1"));
						jo.put("percentOrder",
								obj.get(index[i] + "_order1") == null ? "" : obj.get(index[i] + "_order1"));
					} else {
						if(list1.isEmpty()||list1.get(0) == null){
							continue;
						}
						obj = list1.get(0);
						
						jo.put("value", obj.get(index[i] + "_value") == null ? ""
								: df.format(Double.valueOf(obj.get(index[i] + "_value").toString()) / 10000));
						jo.put("percent", obj.get(index[i] + "_percent") == null ? ""
								: obj.get(index[i] + "_percent"));
						jo.put("percentOrder",
								obj.get(index[i] + "_order1") == null ? "" : obj.get(index[i] + "_order1"));
					}
					
					econData.put(index[i], jo);
				}
			}

			if (list1.size()>1) {
				econData.put("p_zyywsr",
						list1.get(1).get("zyywsr_percent") == null ? "" : list1.get(1).get("zyywsr_percent"));
				econData.put("p_lr", list1.get(1).get("lr_percent") == null ? "" : list1.get(1).get("lr_percent"));
			}

		}
		secondPageData.put("econData", econData);

		/*宜春市工业用电量*/
		String sql3 = "select organization_name, gyydl_value, gyydl_percent "
				+"from r_pk_ec_mn_ac_log t where exists (select 1 from t_area_info "
				+"where parent_id = ? and area_id = t.organization_id) and t.year_caliber = ? "
				+"and t.month_caliber = ? and t.organization_kind = 2 order by organization_id asc";
		List<Map<String, Object>> list3 = jdbcTemplate.queryForList(sql3, new Object[]{orgId, year , month});
		JSONObject gyydlAreaData = new JSONObject();
		if(!list3.isEmpty()){
			JSONArray xAxis = new JSONArray();
			JSONArray series1 = new JSONArray();
			JSONArray series2 = new JSONArray();
			List<JSONArray> series = new ArrayList<>();
			for (Map<String, Object> record : list3) {
				xAxis.add(record.get("organization_name"));
				series1.add(record.get("gyydl_value"));
				series2.add(record.get("gyydl_percent"));
			}
			series.add(series1);
			series.add(series2);
			gyydlAreaData.put("xAxis", xAxis);
			gyydlAreaData.put("series", series);
		}
		secondPageData.put("gyydlAreaData", gyydlAreaData);
		
		/*工业用电量*/
		String sql4 = "select month_caliber, gyydl_value, gyydl_percent from r_pk_ec_mn_ac_log t "
				+"where organization_id = ? and t.year_caliber = ? and t.organization_kind = 2 order by t.month_caliber asc";
		List<Map<String, Object>> list4 = jdbcTemplate.queryForList(sql4, new Object[]{areaId, year});
		JSONObject gyydlSpaceData = new JSONObject();
		if(!list4.isEmpty()){
			JSONArray xAxis = new JSONArray();
			for(int i=1;i<=12;i++){
				xAxis.add(i + "月");
			}
			JSONArray series1 = new JSONArray();
			JSONArray series2 = new JSONArray();
			List<JSONArray> series = new ArrayList<>();
			
			int curMonth = Integer.parseInt(list4.get(0).get("month_caliber").toString());
			for(int j=0;j<curMonth-2;j++){
				series1.add(null);
				series2.add(null);
			}
			
			for (Map<String, Object> record : list4) {
				series1.add(record.get("gyydl_value"));
				series2.add(record.get("gyydl_percent"));
			}
			
			int maxMonth = Integer.parseInt(list4.get(list4.size()-1).get("month_caliber").toString());
			for(int j=0;j<12-maxMonth;j++){
				series1.add(null);
				series2.add(null);
			}
			
			series.add(series1);
			series.add(series2);

			gyydlSpaceData.put("xAxis", xAxis);
			gyydlSpaceData.put("series", series);
		}
		secondPageData.put("gyydlSpaceData", gyydlSpaceData);
		
		return secondPageData;
	}

	@Override
	public List<JSONObject> selectThirdPageData(BigDecimal orgId, Integer year, Integer month, Integer orderType) {
		StringBuilder sql = new StringBuilder()
				.append("select * from ( ")
//				.append("select a.organization_id, a.organization_name,")
//				.append("a.gyzjz_value, a.gyzjz_percent, a.gyzjz_order1 gyzjz_order, ")
//				.append("a.zyywsr_value, a.zyywsr_percent, a.zyywsr_order1 zyywsr_order, ")
//				.append("a.lr_value, a.lr_percent, a.lr_order1 lr_order, ")
//				.append("a.gytz_value, a.gytz_percent, a.gytz_order1 gytz_order,")
//				.append("b.gyydl_value, b.gyydl_percent, b.gyydl_order ")
//				.append("from r_pk_ei_mn_ac_log a left join r_pk_ec_mn_ac_log b ")
//				.append("on b.organization_id = a.organization_id and b.year_caliber = a.year_caliber ")
//				.append("and b.month_caliber = a.month_caliber and b.organization_kind = 1  ")
//				.append("where a.organization_id = ? and a.year_caliber = ? ")
//				.append("and a.month_caliber = ? and a.organization_kind = 0 union  ")
				.append("(select a.organization_id, a.organization_name, ")
				.append("a.gyzjz_value, a.gyzjz_percent, a.gyzjz_order1 gyzjz_order, ")
				.append("a.zyywsr_value, a.zyywsr_percent, a.zyywsr_order1 zyywsr_order, ")
				.append("a.lr_value, a.lr_percent, a.lr_order1 lr_order, ")
				.append("a.gytz_value, a.gytz_percent, a.gytz_order1 gytz_order, ")
				.append("c.gyydl_value, c.gyydl_percent, c.gyydl_order ")
				.append("from r_pk_ei_mn_ac_log a left join t_area_info b ")
				.append("on a.organization_id = b.area_id and b.parent_id = ? ")
				.append("left join r_pk_ec_mn_ac_log c ")
				.append("on c.organization_id = a.organization_id and c.organization_kind = 2")
				.append("and c.year_caliber = a.year_caliber and c.month_caliber = a.month_caliber ")
				.append("where a.year_caliber = ? and a.month_caliber = ? ")
				.append("and a.organization_kind = 1 ) ) order by ");
		if (orderType != null) {
			switch (orderType) {
			case 1:
				sql.append("gyzjz_order asc nulls first, ");
				break;
			case 2:
				sql.append("zyywsr_order asc nulls first, ");
				break;
			case 3:
				sql.append("lr_order asc nulls first, ");
				break;
			case 4:
				sql.append("gytz_order asc nulls first, ");
				break;
			case 5:
				sql.append("gyydl_order asc nulls first, ");
				break;
			default:
				break;
			}
		}
		sql.append("organization_id asc nulls first");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(),
				new Object[] { orgId, year, month });

		List<Map<String, Object>> lastList = jdbcTemplate.queryForList(sql.toString(),
				new Object[] { orgId, year, (month - 1) });

		List<JSONObject> econList = new ArrayList<>();
		if (!list.isEmpty()) {
			String[] index = new String[] { "gyzjz", "zyywsr", "lr", "gytz", "gyydl" };
			DecimalFormat df = new DecimalFormat("#0.00");

			for (Map<String, Object> record : list) {
				JSONObject jo = new JSONObject();
				jo.put("orgName", record.get("organization_name"));
				for (int i = 0; i < index.length; i++) {
					if (i == (index.length - 1)) {
						jo.put(index[i] + "_value", record.get(index[i] + "_value") == null ? ""
								: df.format(Double.valueOf(record.get(index[i] + "_value").toString())));
					} else {
						jo.put(index[i] + "_value", record.get(index[i] + "_value") == null ? ""
								: df.format(Double.valueOf(record.get(index[i] + "_value").toString()) / 10000));
					}
					jo.put(index[i] + "_percent",
							record.get(index[i] + "_percent") == null ? "" : record.get(index[i] + "_percent"));
					jo.put(index[i] + "_order",
							record.get(index[i] + "_order") == null ? "" : record.get(index[i] + "_order"));

					/* orderType:同比排行与上一条数据比较，1：上升 0：下降 */
					if (!lastList.isEmpty()) {
						BigDecimal orgId1 = new BigDecimal(record.get("organization_id").toString());
						Integer order1 = record.get(index[i] + "_order") == null ? null
								: Integer.valueOf(record.get(index[i] + "_order").toString());
						for (Map<String, Object> info : lastList) {
							BigDecimal orgId2 = new BigDecimal(info.get("organization_id").toString());
							if (orgId1.equals(orgId2)) {
								Integer order2 = info.get(index[i] + "_order") == null ? null
										: Integer.valueOf(info.get(index[i] + "_order").toString());
								if (order1 != null && order2 != null && order1 < order2) {
									jo.put(index[i] + "_orderType", 1);
								} else if (order1 != null && order2 != null && order1 > order2) {
									jo.put(index[i] + "_orderType", 0);
								}
							}
						}
					}
				}
				econList.add(jo);
			}
		}

		return econList;
	}

	@Override
	public JSONObject selectFourthPageData(BigDecimal orgId, BigDecimal parkId, Integer year, Integer month) {
		StringBuilder sql = new StringBuilder();
		Object[] obj = null;
		if (parkId == null) {
			sql.append("select a.* from r_pk_in_op_mn_ac_log a, t_park_info b  ")
					.append("where a.organization_id = b.park_id and b.area_id = ? ")
					.append("and a.year_caliber = ? ")
					.append("and a.month_caliber = ? and organization_kind = 2 order by a.create_time desc ");
			obj = new Object[] { orgId, year, month };

		} else {
			sql.append("select * from r_pk_in_op_mn_ac_log where organization_id = ? ")
					.append("and year_caliber = ? and organization_kind = 2 and month_caliber <= ? ").append("order by month_caliber asc");
			obj = new Object[] { parkId, year, month };
		}

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), obj);

		JSONObject econData = new JSONObject();
		JSONArray xAxis = new JSONArray();
		for (Map<String, Object> record : list) {
			if (parkId == null) {
				String name = record.get("organization_name").toString().replaceAll("江西", "");
				xAxis.add(name);
			} else {
				//xAxis.add(record.get("month_caliber") + "月");
			}
		}
		
		if (parkId != null) {
			for(int i=2;i<=12;i++){
				xAxis.add(i + "月");
			}
		}
		
		econData.put("xAxis", xAxis);
		
		if (!list.isEmpty()) {
			String[] index = new String[] { "gyzjz", "zyywsr", "lr", "gyydl", "csgyschd_cyry" };
			DecimalFormat df = new DecimalFormat("#0.00");
			for (int i = 0; i < index.length; i++) {
				JSONObject jo = new JSONObject();
				JSONArray seriesBar = new JSONArray();
				JSONArray seriesline = new JSONArray();
				if(parkId != null){
					int curMonth = Integer.parseInt(list.get(0).get("month_caliber").toString());
					for(int j=0;j<curMonth-2;j++){
						seriesBar.add(null);
						seriesline.add(null);
					}
				}
				for (Map<String, Object> record : list) {
					if(i == (index.length - 1)){
						seriesBar.add(record.get(index[i] + "_value"));
					}else{
						seriesBar.add(record.get(index[i] + "_value") == null ? ""
								: df.format(Double.valueOf(record.get(index[i] + "_value").toString()) / 10000));
					}
					
					seriesline.add(record.get(index[i] + "_percent"));
				}
				jo.put("bar", seriesBar);
				jo.put("line", seriesline);
				econData.put(index[i], jo);
			}
		}
		
		
		return econData;
	}

	@Override
	public List<JSONObject> selectFifthPageData(BigDecimal orgId, Integer year, Integer month, Integer orderType) {
		StringBuilder sql = new StringBuilder()
				.append("select a.* from r_pk_in_op_mn_ac_log a, t_park_info b  ")
				.append("where a.organization_id = b.park_id and b.area_id = ? ")
				.append("and a.year_caliber = ? ")
				.append("and a.month_caliber = ? and organization_kind = 2 order by ");
		if (orderType != null) {
			switch (orderType) {
			case 1:
				sql.append("a.gyzjz_order1 asc nulls last, ");
				break;
			case 2:
				sql.append("a.zyywsr_order1 asc nulls last, ");
				break;
			case 3:
				sql.append("a.lr_order1 asc nulls last, ");
				break;
			case 4:
				sql.append("a.gyydl_order asc nulls last, ");
				break;
			case 5:
				sql.append("a.csgyschd_cyry_value1 desc nulls last, ");
				break;
			default:
				break;
			}
		}
		sql.append("a.create_time desc ");

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(),
				new Object[] { orgId, year, month });

		/* 上一记录 */
		if (month == 1) {
			year = year - 1;
			month = 12;
		} else {
			month = month - 1;
		}
		List<Map<String, Object>> lastList = jdbcTemplate.queryForList(sql.toString(),
				new Object[] { orgId, year, month });

		List<JSONObject> econList = new ArrayList<>();
		if (!list.isEmpty()) {
			String[] index = new String[] { "gyzjz", "zyywsr", "lr", "gyydl", "csgyschd_cyry" };
			DecimalFormat df = new DecimalFormat("#0.00");
			DecimalFormat df2 = new DecimalFormat("#0");
			for (Map<String, Object> record : list) {
				JSONObject jo = new JSONObject();
				jo.put("orgName", record.get("organization_name"));
				for (int i = 0; i < index.length; i++) {
					if (i == (index.length - 1)) {
						jo.put(index[i] + "_value", record.get(index[i] + "_value") == null ? ""
								: df2.format(Double.valueOf(record.get(index[i] + "_value").toString())));
					} else {
						jo.put(index[i] + "_value", record.get(index[i] + "_value") == null ? ""
								: df.format(Double.valueOf(record.get(index[i] + "_value").toString()) / 10000));
					}
					jo.put(index[i] + "_percent",
							record.get(index[i] + "_percent") == null ? "" : record.get(index[i] + "_percent"));

					if (i < (index.length - 1)) {
						jo.put(index[i] + "_order",
								record.get(index[i] + "_order1") == null ? "" : record.get(index[i] + "_order1"));

						/* orderType:同比排行与上一条数据比较，1：上升 0：下降 */
						if (!lastList.isEmpty()) {
							BigDecimal orgId1 = new BigDecimal(record.get("organization_id").toString());
							Integer order1 = record.get(index[i] + "_order1") == null ? null
									: Integer.valueOf(record.get(index[i] + "_order1").toString());
							for (Map<String, Object> info : lastList) {
								BigDecimal orgId2 = new BigDecimal(info.get("organization_id").toString());
								if (orgId1.equals(orgId2)) {
									Integer order2 = info.get(index[i] + "_order") == null ? null
											: Integer.valueOf(info.get(index[i] + "_order").toString());
									if (order1 != null && order2 != null && order1 < order2) {
										jo.put(index[i] + "_orderType", 1);
									} else if (order1 != null && order2 != null && order1 > order2) {
										jo.put(index[i] + "_orderType", 0);
									}
								}
							}
						}
					}
				}
				econList.add(jo);
			}
		}

		return econList;
	}

	@Override
	public JSONObject selectSixthPageData(BigDecimal orgId, Integer year, Integer month) {
		/* 三年总量数据统计 */
		StringBuilder sql = new StringBuilder().append("select * from r_pk_in_tp_in_op_mn_ac_4_log ")
				.append("where organization_id = ? and year_caliber in (?,?,?) ")
				.append("and month_caliber = ? ")
				.append("order by year_caliber desc, month_caliber desc, sort_grade asc");
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(),
				new Object[] { orgId, year, year - 1, year - 2, month });

		JSONObject econData = new JSONObject();
		DecimalFormat df = new DecimalFormat("#0.00");
		String[] index = new String[] { "gyzjz", "zyywsr", "lr", "ls" };

		for (int i = 0; i < index.length; i++) {
			JSONObject jo = new JSONObject();
			JSONObject bar1 = new JSONObject();
			JSONObject bar2 = new JSONObject();
			JSONObject pie1 = new JSONObject();
			if (!list.isEmpty()) {
				JSONArray xAxis = new JSONArray();
				JSONArray legend = new JSONArray();

				JSONArray bar1Series1 = new JSONArray();
				JSONArray bar1Series2 = new JSONArray();
				JSONArray bar1Series3 = new JSONArray();
				JSONArray bar1Series4 = new JSONArray();
				JSONArray bar1Series5 = new JSONArray();
				JSONArray bar1Series6 = new JSONArray();

				JSONArray bar2Series1 = new JSONArray();
				JSONArray bar2Series2 = new JSONArray();

				JSONArray pieSeries = new JSONArray();
				for (Map<String, Object> record : list) {
					int nowYear = Integer.parseInt(record.get("year_caliber").toString());
					if (nowYear == year) {
						/* x轴数据 */
						if("全市".equals(record.get("type_name").toString())||"小计".equals(record.get("type_name").toString())){
							continue;
						}
						xAxis.add(record.get("type_name"));
						bar1Series1.add(record.get(index[i] + "_value") == null ? ""
									: df.format(Double.valueOf(record.get(index[i] + "_value").toString()) / 10000));
						bar1Series4.add(record.get(index[i] + "_percent") == null ? "0" : record.get(index[i] + "_percent"));
						

						/* 本年度总量同比数据 */
						bar2Series1.add(record.get(index[i] + "_value") == null ? ""
								: df.format(Double.valueOf(record.get(index[i] + "_value").toString()) / 10000));
						bar2Series2.add(record.get(index[i] + "_percent"));

						/* 饼图数据 */
						if (record.get(index[i] + "_value") != null) {
							legend.add(record.get("type_name"));
							JSONObject pie = new JSONObject();
							pie.put("name", record.get("type_name"));
							pie.put("value", record.get(index[i] + "_value") == null ? ""
									: df.format(Double.valueOf(record.get(index[i] + "_value").toString()) / 10000));
							pieSeries.add(pie);
						}
					}
				}

				for (int j = 0; j < xAxis.size(); j++) {
					String typeName = xAxis.get(j).toString();
					int count1 = 0;
					int count2 = 0;
					for (Map<String, Object> record : list) {
						int nowYear = Integer.parseInt(record.get("year_caliber").toString());
						String nowTypeName = record.get("type_name").toString();
						if (nowYear == (year - 1)) {
							if(typeName.equals(nowTypeName)){
								bar1Series2.add(record.get(index[i] + "_value") == null ? ""
										: df.format(Double.valueOf(record.get(index[i] + "_value").toString()) / 10000));
								bar1Series5.add(record.get(index[i] + "_percent") == null ? "0" : record.get(index[i] + "_percent"));
								count1 ++;
							}
						}

						if (nowYear == (year - 2)) {
							if(typeName.equals(nowTypeName)){
								bar1Series3.add(record.get(index[i] + "_value") == null ? ""
										: df.format(Double.valueOf(record.get(index[i] + "_value").toString()) / 10000));
								bar1Series6.add(record.get(index[i] + "_percent") == null ? "0" : record.get(index[i] + "_percent"));
								count2 ++;
							}
						}
					}
					if(count1==0){
						bar1Series2.add(null);
						bar1Series5.add(null);
					}
					
					if(count2==0){
						bar1Series3.add(null);
						bar1Series6.add(null);
					}
				}
				bar1.put("xAxis", xAxis);

				bar1.put("bar1Series1", bar1Series1);
				bar1.put("bar1Series2", bar1Series2);
				bar1.put("bar1Series3", bar1Series3);
				bar1.put("bar1Series4", bar1Series4);
				bar1.put("bar1Series5", bar1Series5);
				bar1.put("bar1Series6", bar1Series6);

				bar2.put("xAxis", xAxis);
				bar2.put("bar2Series1", bar2Series1);
				bar2.put("bar2Series2", bar2Series2);

				pie1.put("legend", legend);
				pie1.put("pieSeries", pieSeries);

				jo.put("bar1", bar1);
				jo.put("bar2", bar2);
				jo.put("pie", pie1);
			}

			econData.put(index[i], jo);
		}

		/*产业企业个数*/
		String sql2 = "select b.type_name, count(1) total "
			  +"from t_industry_type_company_now a "
			  +"left join t_industry_type_info_now b "
			  +"on a.organization_id = b.organization_id "
			  +"and a.type_id = b.type_id "
			  +"left join t_company_info c "
			  +"on a.company_id = c.company_id "
			  +"and c.view_kind2 = 1 and c.status in (1,2,3) "
			  +"where a.organization_id = ? "
			  +"group by b.type_name, b.sort_grade "
			  +"order by b.sort_grade ";
		
		List<Map<String, Object>> list2 = jdbcTemplate.queryForList(sql2, new Object[] {orgId});
		
		JSONObject compIndData = new JSONObject();
		if(!list2.isEmpty()){
			JSONArray xAxis = new JSONArray();
			JSONArray series = new JSONArray();
			for(Map<String, Object> record : list2){
				xAxis.add(record.get("type_name"));
				series.add(record.get("total"));
			}
			compIndData.put("xAxis", xAxis);
			compIndData.put("series", series);
		}
		econData.put("compIndData", compIndData);
		
		return econData;
	}

	@Override
	public JSONObject selectSeventhPageData(BigDecimal orgId, Integer year, Integer month, Integer orderType) {
		
		/* 产业数据 */
		StringBuilder sql2 = new StringBuilder().append("select * from r_pk_in_tp_in_op_mn_ac_4_log ")
				.append("where organization_id = ? and year_caliber = ? ")
				.append("and month_caliber = ? order by ");
		if (orderType != null) {
			switch (orderType) {
			case 1:
				sql2.append("gyzjz_value desc nulls last, ");
				break;
			case 2:
				sql2.append("zyywsr_value desc nulls last, ");
				break;
			case 3:
				sql2.append("lr_value desc nulls last, ");
				break;
			case 4:
				sql2.append("ls_value desc nulls last, ");
				break;
			default:
				break;
			}
		}
		sql2.append("sort_grade asc, create_time desc ");
		
		List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql2.toString(), new Object[] { orgId, year, month });
		
		List<JSONObject> list = new ArrayList<>();
		String[] index = new String[] { "gyzjz", "zyywsr", "lr", "ls"};
		if (!list1.isEmpty()) {
			DecimalFormat df1 = new DecimalFormat("#0");
			DecimalFormat df2 = new DecimalFormat("#0.0");
			Double value1 = (double) 0;
			Double value2 = (double) 0;
			Double value3 = (double) 0;
			Double value4 = (double) 0;
			for (Map<String, Object> record : list1) {
				JSONObject jo = new JSONObject();
				jo.put("name", record.get("type_name"));
				
				for (int i = 0; i < index.length; i++) {
					Double value = record.get(index[i] + "_value") == null ? 0
							: Double.valueOf(record.get(index[i] + "_value").toString());
					String valueStr = (value/10000)+"";
					
					jo.put(index[i] + "_value", valueStr == "0" ? "" : valueStr.indexOf(".") ==  -1 ? df1.format(value/10000) : df2.format(value/10000));
					jo.put(index[i] + "_percent", record.get(index[i] + "_percent"));
					Double lastValue = record.get(index[i] + "_previous") == null ? 0
							: Double.valueOf(record.get(index[i] + "_previous").toString());
					String lastValueStr = (lastValue/10000)+"";
					jo.put(index[i] + "_value_last", lastValueStr == "0" ? "" : lastValueStr.indexOf(".") ==  -1 ? df1.format(lastValue/10000) : df2.format(lastValue/10000));
					
					if (i == 0) {
						if("全市".equals(record.get("type_name").toString())){
							value1 = value;
						}else{
							if (value != 0 && value1 != 0) {
								String str = (value * 100 / value1) + "";
								jo.put(index[i] + "_proportion", str.indexOf(".") ==  -1 ? df1.format(value * 100 / value1) : df2.format(value * 100 / value1));
							}
						}
					} else if (i == 1) {
						if("全市".equals(record.get("type_name").toString())){
							value2 = value;
						}else{
							if (value != 0 && value2 != 0) {
								String str = (value * 100 / value2) + "";
								jo.put(index[i] + "_proportion", str.indexOf(".") ==  -1 ? df1.format(value * 100 / value2) : df2.format(value * 100 / value2));
							}
						}
					} else if (i == 2) {
						if("全市".equals(record.get("type_name").toString())){
							value3 = value;
						}else{
							if (value != 0 && value3 != 0) {
								String str = (value * 100 / value3) + "";
								jo.put(index[i] + "_proportion", str.indexOf(".") ==  -1 ? df1.format(value * 100 / value3) : df2.format(value * 100 / value3));
							}
						}
					} else if (i == 3) {
						if("全市".equals(record.get("type_name").toString())){
							value4 = value;
						}else{
							if (value != 0 && value4 != 0) {
								String str = (value * 100 / value4) + "";
								jo.put(index[i] + "_proportion", str.indexOf(".") ==  -1 ? df1.format(value * 100 / value4) : df2.format(value * 100 / value4));
							}
						}
					}
				}
				list.add(jo);
			}
		}
		
		
		//展示列
		String sql11 = "select nvl2(sum(gyzjz_value),1,0) gyzjz_value_show,"
		+"nvl2(sum(gyzjz_percent),1,0) gyzjz_percent_show,"
		+"nvl2(sum(zyywsr_value),1,0) zyywsr_value_show,"
		+"nvl2(sum(zyywsr_percent),1,0) zyywsr_percent_show,"
		+"nvl2(sum(lr_value),1,0) lr_value_show,"
		+"nvl2(sum(lr_percent),1,0) lr_percent_show,"
		+"nvl2(sum(ls_value),1,0) ls_value_show,"
		+"nvl2(sum(ls_percent),1,0) ls_percent_show "
		+"from r_pk_in_tp_in_op_mn_ac_4_log where organization_id = ? and year_caliber = ? and month_caliber = ?";
		
		List<Map<String, Object>> list11 = jdbcTemplate.queryForList(sql11, new Object[] { orgId, year, month });
		
		JSONObject show = new JSONObject();
		for(int i = 0; i < index.length; i++){
			show.put(index[i]+"_value_show", list11.get(0).get(index[i]+"_value_show"));
			show.put(index[i]+"_value_last_show", list11.get(0).get(index[i]+"_value_show"));
			show.put(index[i]+"_percent_show", list11.get(0).get(index[i]+"_percent_show"));
			show.put(index[i]+"_proportion_show", list11.get(0).get(index[i]+"_value_show"));
		}
		
		JSONObject data = new JSONObject();
		data.put("list", list);
		data.put("show", show);
		
		return data;
	}

	@Override
	public List<JSONObject> selectPercentData(BigDecimal orgId, Integer year, Integer month, String value) {
		String sql = "select type_name, " + value + " from r_pk_in_tp_in_op_mn_ac_4_log "
				+ " where organization_Id = " + orgId + " and year_caliber = " + year
				+ " and month_caliber = " + month + " order by " + value;
		
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		List<JSONObject> percentList = new ArrayList<>();
		if(!list.isEmpty()){
			for(Map<String, Object> record : list){
				if(record.get("type_name")!=null&&("全市".equals(record.get("type_name").toString())||"小计".equals(record.get("type_name").toString()))){
					continue;
				}
				JSONObject jo = new JSONObject();
				jo.put("name", record.get("type_name"));
				jo.put("value", record.get(value));
				percentList.add(jo);
			}
		}
		
		return percentList;
	}

	@Override
	public List<JSONObject> selectSortDataByOrderType(BigDecimal orgId, Integer year, Integer month,
			String orderType, Integer orderKind, Integer orgKind) {
		String value = orderType + "_value";
		String percent = orderType + "_percent";
		
		StringBuilder sql = new StringBuilder();
		sql.append("select organization_name,").append(value).append(",").append(percent)
		.append(" from r_pk_ei_mn_ac_log ")
		.append(" where exists (select 1 from t_area_info where parent_id = ? and area_id = organization_id) ")
		.append(" and year_caliber = ? and month_caliber = ? and organization_kind = ? order by ");
		if(orderKind==1){
			sql.append(value).append(" desc");
		}else{
			sql.append(percent).append(" desc");
		}
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), new Object[]{orgId, year, month, orgKind});
		
		List<JSONObject> sortData = new ArrayList<>();
		if(!list.isEmpty()){
			DecimalFormat df = new DecimalFormat("#0.00");
			for(Map<String, Object>record:list){
				JSONObject jo = new JSONObject();
				jo.put("name", record.get("organization_name"));
				jo.put("value", record.get(value)==null?"":df.format(Double.valueOf(record.get(value).toString())/10000));
				jo.put("percent", record.get(percent)==null?"":record.get(percent));
				sortData.add(jo);
			}
		}
		return sortData;
	}

	@Override
	public JSONObject newFourthPageData(BigDecimal orgId, Integer year, Integer month, Integer type) {
		final BigDecimal YC_ORG_ID = new BigDecimal("360900");
		StringBuilder sql = new StringBuilder();
		Object[] obj = null;
		if(type==1){
			if (YC_ORG_ID.compareTo(orgId)==0) {
				sql.append("select a.* from r_pk_ei_mn_ac_log a, t_area_info b  ")
						.append("where a.organization_id = b.area_id and b.parent_id = ? ")
						.append("and a.year_caliber = ? ")
						.append("and a.month_caliber = ? and organization_kind = 1 order by a.create_time desc ");
				obj = new Object[] { orgId, year, month };

			} else {
				sql.append("select * from r_pk_ei_mn_ac_log where organization_id = ? ")
						.append("and year_caliber = ? and organization_kind = 1 and month_caliber <= ? ").append("order by month_caliber asc");
				obj = new Object[] { orgId, year, month };
			}

		}else if (type==2){
			if (YC_ORG_ID.compareTo(orgId)==0) {
				sql.append("select a.* from r_pk_in_op_mn_ac_log a, t_park_info b  ")
						.append("where a.organization_id = b.park_id and b.area_id = ? ")
						.append("and a.year_caliber = ? ")
						.append("and a.month_caliber = ? and organization_kind = 2 order by a.create_time desc ");
				obj = new Object[] { orgId, year, month };

			} else {
				sql.append("select * from r_pk_in_op_mn_ac_log where organization_id = ? ")
				.append("and year_caliber = ? and organization_kind = 2 and month_caliber <= ? ").append("order by month_caliber asc");
				obj = new Object[] { orgId, year, month };
			}
			
		}else{
			if (BigDecimal.valueOf(360000).compareTo(orgId)==0) {
				sql.append("select a.* from r_pk_in_op_mn_ac_log a, t_area_info b  ")
						.append("where a.organization_id = b.area_id and b.parent_id = ? ")
						.append("and a.year_caliber = ? ")
						.append("and a.month_caliber = ? and organization_kind = 1 order by a.create_time desc ");
				obj = new Object[] { orgId, year, month };

			} else {
				sql.append("select * from r_pk_in_op_mn_ac_log where organization_id = ? ")
				.append("and year_caliber = ? and organization_kind = 1 and month_caliber <= ? ").append("order by month_caliber asc");
				obj = new Object[] { orgId, year, month };
			}
		}
		
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), obj);

		JSONObject econData = new JSONObject();
		JSONArray xAxis = new JSONArray();
		for (Map<String, Object> record : list) {
			if ((YC_ORG_ID.compareTo(orgId)==0&&type==1)||(YC_ORG_ID.compareTo(orgId)==0&&type==2)||(BigDecimal.valueOf(360000).compareTo(orgId)==0&&type==0)) {
				xAxis.add(record.get("organization_name"));
			} else {
				//xAxis.add(record.get("month_caliber") + "月");
			}
		}
		
		if ((YC_ORG_ID.compareTo(orgId)!=0&&type!=0)||(BigDecimal.valueOf(360000).compareTo(orgId)!=0&&type==0)) {
			for(int i=2;i<=12;i++){
				xAxis.add(i + "月");
			}
		}
		
		econData.put("xAxis", xAxis);
		
		if (!list.isEmpty()) {
			String[] index = new String[] { "gyzjz", "zyywsr", "lr", "gyydl", "csgyschd_cyry" };
			DecimalFormat df = new DecimalFormat("#0.00");
			for (int i = 0; i < index.length; i++) {
				JSONObject jo = new JSONObject();
				JSONArray seriesBar = new JSONArray();
				JSONArray seriesline = new JSONArray();
				if((YC_ORG_ID.compareTo(orgId)!=0&&type!=0)||(BigDecimal.valueOf(360000).compareTo(orgId)!=0&&type==0)){
					int curMonth = Integer.parseInt(list.get(0).get("MONTH_CALIBER").toString());
					for(int j=0;j<curMonth-2;j++){
						seriesBar.add(null);
						seriesline.add(null);
					}
				}
				
				/*for (Map<String, Object> record : list) {
					if(i == (index.length - 1)){
						seriesBar.add(record.get(index[i] + "_value"));
					}else{
						seriesBar.add(record.get(index[i] + "_value") == null ? ""
								: df.format(Double.valueOf(record.get(index[i] + "_value").toString()) / 10000));
					}
					
					seriesline.add(record.get(index[i] + "_percent"));
				}*/
				if ((YC_ORG_ID.compareTo(orgId)!=0&&type!=0)||(BigDecimal.valueOf(360000).compareTo(orgId)!=0&&type==0)) {
					for(int k=2;k<=12;k++){
						int m = -1;
						Map<String, Object> rec = null;
						for (int n = 0 ; n < list.size(); n++) {
							int m_ = Integer.parseInt(list.get(n).get("month_caliber").toString());
							if (k == m_) {
								rec = list.get(n);
								m = m_;
								break;
							}
						}
						if (m != -1 && rec != null) {
							if(i == (index.length - 1)){
								seriesBar.add(rec.get(index[i] + "_value"));
							}else{
								seriesBar.add(rec.get(index[i] + "_value") == null ? ""
										: df.format(Double.valueOf(rec.get(index[i] + "_value").toString()) / 10000));
							}
							
							seriesline.add(rec.get(index[i] + "_percent"));
						}else{
							seriesBar.add(null);
							seriesline.add(null);
						}
					}
				}else{
					for (Map<String, Object> record : list) {
						if(i == (index.length - 1)){
							seriesBar.add(record.get(index[i] + "_value"));
						}else{
							seriesBar.add(record.get(index[i] + "_value") == null ? ""
									: df.format(Double.valueOf(record.get(index[i] + "_value").toString()) / 10000));
						}
						
						seriesline.add(record.get(index[i] + "_percent"));
					}
				}
				
				
				jo.put("bar", seriesBar);
				jo.put("line", seriesline);
				econData.put(index[i], jo);
			}
		}
		
		
		return econData;
	}

	@Override
	public JSONObject newFirstPageData(BigDecimal orgId, Integer year, Integer month) {
		/* 返回数据 */
		JSONObject firstPageData = new JSONObject();
		
		Integer orgKind = 0; 
		/*if(YC_ORG_ID.equals(orgId)){
			orgKind = 1; 
		}*/
		
		/* 经济运行数据 */
		StringBuilder sql1 = new StringBuilder().append("select * from r_pk_ei_mn_ac_log  ")
				.append("where organization_id =? ").append("and year_caliber = ? ")
				.append("and month_caliber = ? and organization_kind = ? ");
		List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql1.toString(),
				new Object[] { orgId, year, month, orgKind});
		
		JSONObject econData = new JSONObject();
		String[] index = new String[] { "gyzjz", "zyywsr", "lr" };
		DecimalFormat df = new DecimalFormat("#0.00");
		if (!list1.isEmpty()) {
			Map<String, Object> obj = list1.get(0);
			
			for (int i = 0; i < index.length; i++) {
				JSONObject jo = new JSONObject();
				
				if(obj.isEmpty()){
					continue;
				}
				
				jo.put("value", obj.get(index[i] + "_value") == null ? ""
						: df.format(Double.valueOf(obj.get(index[i] + "_value").toString()) / 10000));
				jo.put("percent", obj.get(index[i] + "_percent") == null ? ""
						: obj.get(index[i] + "_percent"));
				jo.put("percentOrder",
						obj.get(index[i] + "_order1") == null ? "" : obj.get(index[i] + "_order1"));
				
				econData.put(index[i], jo);
			}

		}
		firstPageData.put("econData", econData);
		
		
		String sql2 = "select * from r_pk_ei_mn_ac_log where organization_kind = ? and organization_id = ? and year_caliber = ? order by month_caliber asc";
		List<Map<String, Object>> list2 = jdbcTemplate.queryForList(sql2, new Object[]{orgKind, orgId, year});
		JSONObject chart = new JSONObject();
		if(!list2.isEmpty()){

			JSONArray xAxis = new JSONArray();
			for(int i=2;i<=12;i++){
				xAxis.add("1-" + i + "月");
			}
			
			for (int i = 0; i < index.length; i++) {
				JSONObject jo = new JSONObject();
				JSONArray value = new JSONArray();
				JSONArray percent = new JSONArray();
				for (Map<String, Object> record : list2) {
					value.add(record.get(index[i] + "_value") == null ? ""
							: df.format(Double.valueOf(record.get(index[i] + "_value").toString()) / 10000));
					percent.add(record.get(index[i]+"_percent"));
				}
				jo.put("value", value);
				jo.put("percent", percent);
				chart.put(index[i], jo);
			}
			
		}
		
		List<Map<String, Object>> list3 = jdbcTemplate.queryForList(sql2, new Object[]{orgKind, orgId, year-1});
		if(!list3.isEmpty()){
			JSONObject jo = new JSONObject();
			JSONArray percent = new JSONArray();
			for (Map<String, Object> record : list3) {
				percent.add(record.get("gyzjz_percent"));
			}
			jo.put("percent", percent);
			chart.put("gyzjz_last", jo);
		}
		
		
		List<Map<String, Object>> list4 = jdbcTemplate.queryForList(sql2, new Object[]{0, JX_ORG_ID, year});
		if(!list4.isEmpty()){
			JSONObject jo = new JSONObject();
			JSONArray percent = new JSONArray();
			for (Map<String, Object> record : list4) {
				percent.add(record.get("gyzjz_percent"));
			}
			jo.put("percent", percent);
			chart.put("gyzjz_jx", jo);
		}
		
		firstPageData.put("chart", chart);
		
		
		return firstPageData;
	}
	
	/**
	 * ****************************************************************************************************************
	 * 														县区
	 * ****************************************************************************************************************
	 */
	@Override
	public List<JSONObject> selectSpaceEconomicData(BigDecimal areaId, Integer year, Integer month, Integer orderType) {
		String sql = "select * from (";
		switch (orderType) {
		case 1:
			sql += "select a.organization_id, a.organization_name, a.gyzjz_value as value, a.gyzjz_percent as percent ";
			break;
		case 2:
			sql += "select a.organization_id, a.organization_name, a.zyywsr_value as value, a.zyywsr_percent as percent ";		
			break;
		case 3:
			sql += "select a.organization_id, a.organization_name, a.lr_value as value, a.lr_percent as percent ";
			break;
		default:
			break;
		}
		
		sql += " from r_pk_ei_mn_ac_log a, t_area_info b where a.organization_id = b.area_id and b.parent_id = ? "
				+ "and a.year_caliber = ? and a.month_caliber = ? and a.organization_kind = 1) order by to_number(value) desc nulls last, to_number(percent) desc nulls last";
		
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), new Object[] { areaId, year, month });

		List<JSONObject> value = new ArrayList<>();
		if (!list.isEmpty()) {
			DecimalFormat df = new DecimalFormat("#0.00");
			for (Map<String, Object>record:list) {
				JSONObject jo = new JSONObject();
				jo.put("spaceId", record.get("organization_id"));
				jo.put("spaceName", record.get("organization_name"));
				if(orderType==1){
					jo.put("value", record.get("percent")!=null?(record.get("percent")):"");
				}else{
					jo.put("value", record.get("value")!=null?df.format(Double.valueOf(record.get("value").toString()) / 10000):"");
				}
				value.add(jo);
			}
		}
		
		return value;
	}

	@Override
	public Map<String, JSONArray> selectSpaceMonthEconomicData(BigDecimal spaceId, Integer year, Integer month) {
		
		String sql = "select * from r_pk_ei_mn_ac_log where organization_id = ? "
					+ "and year_caliber = ? and organization_kind = 1 and month_caliber <= ? order by month_caliber asc";
		
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), new Object[] { spaceId, year, month });

		Map<String, JSONArray> value = new HashMap<>();
		
		JSONArray xAxis = new JSONArray();
		for(int i=2;i<=12;i++){
			xAxis.add(i + "月");
		}
		value.put("xAxis", xAxis);
		
		
		if (!list.isEmpty()) {
			DecimalFormat df = new DecimalFormat("#0.00");
			JSONArray gyzjz_value = new JSONArray();
			JSONArray zyywsr_value = new JSONArray();
			JSONArray lr_value = new JSONArray();
			JSONArray gyzjz_percent = new JSONArray();
			JSONArray zyywsr_percent = new JSONArray();
			JSONArray lr_percent = new JSONArray();
			int count = 2;
			for (Map<String, Object>record:list) {
				int curMonth = Integer.parseInt(record.get("month_caliber").toString());
				while(count<curMonth) {
					gyzjz_value.add("");
					zyywsr_value.add("");
					lr_value.add("");
					gyzjz_percent.add("");
					zyywsr_percent.add("");
					lr_percent.add("");
					count++;
				}
				
				gyzjz_value.add(record.get("gyzjz_value")!=null?Double.valueOf(df.format(Double.valueOf(record.get("gyzjz_value").toString()) / 10000)):"");
				zyywsr_value.add(record.get("zyywsr_value")!=null?Double.valueOf(df.format(Double.valueOf(record.get("zyywsr_value").toString()) / 10000)):"");
				lr_value.add(record.get("lr_value")!=null?Double.valueOf(df.format(Double.valueOf(record.get("lr_value").toString()) / 10000)):"");
				
				gyzjz_percent.add(record.get("gyzjz_percent")!=null?record.get("gyzjz_percent"):"");
				zyywsr_percent.add(record.get("zyywsr_percent")!=null?record.get("zyywsr_percent"):"");
				lr_percent.add(record.get("lr_percent")!=null?record.get("lr_percent"):"");
				
				count++;
			}
			value.put("gyzjz_value", gyzjz_value);
			value.put("zyywsr_value", zyywsr_value);
			value.put("lr_value", lr_value);
			value.put("gyzjz_percent", gyzjz_percent);
			value.put("zyywsr_percent", zyywsr_percent);
			value.put("lr_percent", lr_percent);
		}
		return value;
	}
	/**
	 * ****************************************************************************************************************
	 * 														园区
	 * ****************************************************************************************************************
	 */
	@Override
	public List<JSONObject> selectParkEconomicData(BigDecimal areaId, Integer year, Integer month, Integer orderType) {
		String sql = "select * from (";
		switch (orderType) {
		case 1:
			sql += "select a.organization_id, a.organization_name, a.csgyschd_cyry_value as value, a.csgyschd_cyry_percent as percent ";
			break;
		case 2:
			sql += "select a.organization_id, a.organization_name, a.zyywsr_value as value, a.zyywsr_percent as percent ";		
			break;
		case 3:
			sql += "select a.organization_id, a.organization_name, a.lr_value as value, a.lr_percent as percent ";
			break;
		default:
			break;
		}
		
		sql += " from r_pk_in_op_mn_ac_log a, t_park_info b where a.organization_id = b.park_id and b.area_id = ? "
				+ "and a.year_caliber = ? and a.month_caliber = ? and a.month_caliber in (3,6,9,12) and a.organization_kind = 2) order by to_number(value) desc nulls last, to_number(percent) desc nulls last";
		
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), new Object[] { areaId, year, month });

		List<JSONObject> value = new ArrayList<>();
		if (!list.isEmpty()) {
			DecimalFormat df = new DecimalFormat("#0.00");
			for (Map<String, Object>record:list) {
				JSONObject jo = new JSONObject();
				jo.put("parkId", record.get("organization_id"));
				jo.put("parkName", record.get("organization_name"));
				if(orderType==1){
					jo.put("value", record.get("value")!=null?(record.get("value")):"");
				}else{
					jo.put("value", record.get("value")!=null?df.format(Double.valueOf(record.get("value").toString()) / 10000):"");
				}
				value.add(jo);
			}
		}
		
		return value;
	}

	@Override
	public Map<String, JSONArray> selectparkMonthEconomicData(BigDecimal parkId, Integer year, Integer month) {
		String sql = "select * from r_pk_in_op_mn_ac_log where organization_id = ? "
				+ "and year_caliber = ? and organization_kind = 2 and month_caliber <= ? and month_caliber in (3,6,9,12) order by month_caliber asc";
		
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), new Object[] { parkId, year, month });
	
		Map<String, JSONArray> value = new HashMap<>();
		
		JSONArray xAxis = new JSONArray();
		for(int i=1;i<=4;i++){
			xAxis.add("1-" + i*3 + "月");
		}
		value.put("xAxis", xAxis);
		
		
		if (!list.isEmpty()) {
			DecimalFormat df = new DecimalFormat("#0.00");
			JSONArray cyry_value = new JSONArray();
			JSONArray zyywsr_value = new JSONArray();
			JSONArray lr_value = new JSONArray();
			JSONArray cyry_percent = new JSONArray();
			JSONArray zyywsr_percent = new JSONArray();
			JSONArray lr_percent = new JSONArray();
			int count = 3;
			for (Map<String, Object>record:list) {
				int curMonth = Integer.parseInt(record.get("month_caliber").toString());
				while(count<curMonth) {
					cyry_value.add("");
					zyywsr_value.add("");
					lr_value.add("");
					cyry_percent.add("");
					zyywsr_percent.add("");
					lr_percent.add("");
					count+=3;
				}
				
				cyry_value.add(record.get("csgyschd_cyry_value")!=null?record.get("csgyschd_cyry_value"):"");
				zyywsr_value.add(record.get("zyywsr_value")!=null?Double.valueOf(df.format(Double.valueOf(record.get("zyywsr_value").toString()) / 10000)):"");
				lr_value.add(record.get("lr_value")!=null?Double.valueOf(df.format(Double.valueOf(record.get("lr_value").toString()) / 10000)):"");
				
				cyry_percent.add(record.get("csgyschd_cyry_percent")!=null?record.get("csgyschd_cyry_percent"):"");
				zyywsr_percent.add(record.get("zyywsr_percent")!=null?record.get("zyywsr_percent"):"");
				lr_percent.add(record.get("lr_percent")!=null?record.get("lr_percent"):"");
				
				count+=3;
				
			}
			value.put("cyry_value", cyry_value);
			value.put("zyywsr_value", zyywsr_value);
			value.put("lr_value", lr_value);
			value.put("cyry_percent", cyry_percent);
			value.put("zyywsr_percent", zyywsr_percent);
			value.put("lr_percent", lr_percent);
		}
		return value;
	}


	/**
	 * ****************************************************************************************************************
	 */
	
	@Override
	public Map<String, Object> selectSpaceBenefitAnalysisData(BigDecimal areaId, Integer year, Integer month) {
		Map<String, Object> map = new HashMap<>();
		DecimalFormat df = new DecimalFormat("#0.00");
		
		//div1 利润率对比
		boolean flag = false;
		String sql1 = "select * from (select a.organization_id, a.organization_name, decode(a.zyywsr_value, null, '', 0, '', round(nvl(a.lr_value,0)*100/a.zyywsr_value,1)) as value"
			+ " from r_pk_ei_mn_ac_log a, t_area_info b where a.organization_id = b.area_id and (b.parent_id = ? or b.area_id = ?) "
				+ "and a.year_caliber = ? and a.month_caliber = ? and a.organization_kind = 1) order by to_number(value) desc nulls last";
		
		List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql1.toString(), new Object[] { areaId, areaId, year, month });

		List<JSONObject> value = new ArrayList<>();
		Double total = 0.0;
		if (!list1.isEmpty()) {
			for (Map<String, Object>record:list1) {
				if(areaId.toString().compareTo(record.get("organization_id").toString())==0){
					map.put("div1_area_value", record.get("value"));
				}else{
					JSONObject jo = new JSONObject();
					jo.put("spaceId", record.get("organization_id"));
					jo.put("spaceName", record.get("organization_name"));
					jo.put("value", record.get("value"));
					value.add(jo);
					if(record.get("value")!=null&&record.get("value")!=""){
						flag = true;
					}
					total += (jo.getDouble("value")==null?0:jo.getDouble("value"));
				}
			}
		}
		map.put("div1_flag", flag);
		map.put("div1_list", value);
		map.put("div1_total", df.format(total));
		
		
		//div3 利润对比
		boolean pieFlag = false;
		boolean barFlag = false;
		String sql3 = "select a.organization_id, a.organization_name, a.lr_value, a.lr_percent "
				+ " from r_pk_ei_mn_ac_log a, t_area_info b where a.organization_id = b.area_id and b.parent_id = ? "
					+ "and a.year_caliber = ? and a.month_caliber = ? and a.organization_kind = 1 order by a.lr_percent desc nulls last";
		
		List<Map<String, Object>> list3 = jdbcTemplate.queryForList(sql3.toString(), new Object[] { areaId, year, month });
		//value 饼图
		JSONArray legendPieLr = new JSONArray();
		JSONArray seriesPieLr = new JSONArray();
		Double totalLr = 0.0;
		//percent 柱形图
		JSONArray xAxisBarLr = new JSONArray();
		JSONArray seriesBarLr = new JSONArray();
		if(!list3.isEmpty()){
			for (Map<String, Object>record:list3) {
				legendPieLr.add(record.get("organization_name"));
				JSONObject jo = new JSONObject();
				jo.put("name", record.get("organization_name"));
				jo.put("value", record.get("lr_value")!=null?Double.valueOf(df.format(Double.valueOf(record.get("lr_value").toString()) / 10000)):"");
				seriesPieLr.add(jo);
				totalLr += (record.get("lr_value")!=null?Double.valueOf(df.format(Double.valueOf(record.get("lr_value").toString()) / 10000)):0);
				
				xAxisBarLr.add(record.get("organization_name"));
				seriesBarLr.add(record.get("lr_percent"));
				
				if(record.get("lr_value")!=null&&record.get("lr_value")!=""){
					pieFlag = true;
				}
				
				if(record.get("lr_percent")!=null&&record.get("lr_percent")!=""){
					barFlag = true;
				}
				
			}
		}
		map.put("div3_legendPieLr", legendPieLr);
		map.put("div3_seriesPieLr", seriesPieLr);
		map.put("div3_xAxisBarLr", xAxisBarLr);
		map.put("div3_seriesBarLr", seriesBarLr);
		map.put("div3_totalLr", df.format(totalLr));
		map.put("div3_pieFlag", pieFlag);
		map.put("div3_barFlag", barFlag);
		
		
		//div4 主营业务对比
		pieFlag = false;
		barFlag = false;
		String sql4 = "select a.organization_id, a.organization_name, a.zyywsr_value, a.zyywsr_percent "
				+ " from r_pk_ei_mn_ac_log a, t_area_info b where a.organization_id = b.area_id and b.parent_id = ? "
					+ "and a.year_caliber = ? and a.month_caliber = ? and a.organization_kind = 1 order by a.zyywsr_percent desc nulls last";
		
		List<Map<String, Object>> list4 = jdbcTemplate.queryForList(sql4.toString(), new Object[] { areaId, year, month });
		//value 柱形图
		JSONArray legendPieZyywsr = new JSONArray();
		JSONArray seriesPieZyywsr = new JSONArray();
		//percent 饼图
		JSONArray xAxisBarZyywsr = new JSONArray();
		JSONArray seriesBarZyywsr = new JSONArray();
		Double totalZyywsr = 0.0;
		if(!list4.isEmpty()){
			for (Map<String, Object>record:list4) {
				legendPieZyywsr.add(record.get("organization_name"));
				JSONObject jo = new JSONObject();
				jo.put("name", record.get("organization_name"));
				jo.put("value", record.get("zyywsr_value")!=null?Double.valueOf(df.format(Double.valueOf(record.get("zyywsr_value").toString()) / 10000)):"");
				seriesPieZyywsr.add(jo);
				
				xAxisBarZyywsr.add(record.get("organization_name"));
				seriesBarZyywsr.add(record.get("zyywsr_percent"));
				totalZyywsr += (record.get("zyywsr_value")!=null?Double.valueOf(df.format(Double.valueOf(record.get("zyywsr_value").toString()) / 10000)):0);
			
				if(record.get("zyywsr_value")!=null&&record.get("zyywsr_value")!=""){
					pieFlag = true;
				}
				
				if(record.get("zyywsr_percent")!=null&&record.get("zyywsr_percent")!=""){
					barFlag = true;
				}
			}
		}
		map.put("div4_legendPieZyywsr", legendPieZyywsr);
		map.put("div4_seriesPieZyywsr", seriesPieZyywsr);
		map.put("div4_xAxisBarZyywsr", xAxisBarZyywsr);
		map.put("div4_seriesBarZyywsr", seriesBarZyywsr);
		map.put("div4_totalZyywsr", df.format(totalZyywsr));
		map.put("div4_pieFlag", pieFlag);
		map.put("div4_barFlag", barFlag);
		
		//div2
		String sql21 = "select t.*, rownum from ( "
				+"select * from ( select a.organization_id, a.organization_name, decode(a.zyywsr_value, null, '', 0, '', round(nvl(a.lr_value,0)*100/a.zyywsr_value,1)) as value "
				+"from r_pk_ei_mn_ac_log a, t_area_info b where a.organization_id = b.area_id and b.parent_id = ? "
				+"and a.year_caliber = ? and a.month_caliber = ? and a.organization_kind = 1) order by to_number(value) desc nulls last) t where rownum = 1";
		String sql22 = "select t.*, rownum from ( "
				+"select * from ( select a.organization_id, a.organization_name, round(nvl(a.zyywsr_value,0)/10000,2) as value "
				+"from r_pk_ei_mn_ac_log a, t_area_info b where a.organization_id = b.area_id and b.parent_id = ? "
				+"and a.year_caliber = ? and a.month_caliber = ? and a.organization_kind = 1) order by to_number(value) desc nulls last) t where rownum = 1";
		String sql23 = "select t.*, rownum from ( "
				+"select * from ( select a.organization_id, a.organization_name, round(nvl(a.lr_value,0)/10000,2) as value "
				+"from r_pk_ei_mn_ac_log a, t_area_info b where a.organization_id = b.area_id and b.parent_id = ? "
				+"and a.year_caliber = ? and a.month_caliber = ? and a.organization_kind = 1) order by to_number(value) desc nulls last) t where rownum = 1";
		String sql24 = "select t.*, rownum from ( "
				+"select * from ( select a.organization_id, a.organization_name, a.gyzjz_percent as value "
				+"from r_pk_ei_mn_ac_log a, t_area_info b where a.organization_id = b.area_id and b.parent_id = ? "
				+"and a.year_caliber = ? and a.month_caliber = ? and a.organization_kind = 1) order by to_number(value) desc nulls last) t where rownum = 1";
		
		JSONArray ja1 = new JSONArray();
		List<Map<String, Object>> map11 = jdbcTemplate.queryForList(sql21, new Object[] { areaId, year, month });
		List<Map<String, Object>> map12 = jdbcTemplate.queryForList(sql21, new Object[] { areaId, year-1, month });
		if(!map11.isEmpty()){
			ja1.add(map11.get(0).get("organization_name"));
			ja1.add(map11.get(0).get("value"));
			if(!map12.isEmpty()){				
				ja1.add(map12.get(0).get("value"));
				ja1.add(map11.get(0).get("value")==null||map12.get(0).get("value")==null?"":(df.format(Double.parseDouble(map11.get(0).get("value")==null?"0":map11.get(0).get("value").toString())
						-Double.parseDouble(map12.get(0).get("value")==null?"0":map12.get(0).get("value").toString()))));
			}else{
				ja1.add("");
				ja1.add("");
			}
		}else{
			ja1.add("");
			ja1.add("");
			if(!map12.isEmpty()){				
				ja1.add(map12.get(0).get("value"));
				ja1.add("");
			}else{
				ja1.add("");
				ja1.add("");
			}
		}
		
		JSONArray ja2 = new JSONArray();
		List<Map<String, Object>> map21 = jdbcTemplate.queryForList(sql22, new Object[] { areaId, year, month });
		List<Map<String, Object>> map22 = jdbcTemplate.queryForList(sql22, new Object[] { areaId, year-1, month });
		if(!map21.isEmpty()){
			ja2.add(map21.get(0).get("organization_name"));
			ja2.add(map21.get(0).get("value"));
			if(!map22.isEmpty()){				
				ja2.add(map22.get(0).get("value"));
				ja2.add(map21.get(0).get("value")==null||map22.get(0).get("value")==null?"":(df.format(Double.parseDouble(map21.get(0).get("value")==null?"0":map21.get(0).get("value").toString())
						-Double.parseDouble(map22.get(0).get("value")==null?"0":map22.get(0).get("value").toString()))));
			}else{
				ja2.add("");
				ja2.add("");
			}
		}else{
			ja2.add("");
			ja2.add("");
			if(!map22.isEmpty()){				
				ja2.add(map22.get(0).get("value"));
				ja2.add("");
			}else{
				ja2.add("");
				ja2.add("");
			}
		}
		
		JSONArray ja3 = new JSONArray();
		List<Map<String, Object>> map31 = jdbcTemplate.queryForList(sql23, new Object[] { areaId, year, month });
		List<Map<String, Object>> map32 = jdbcTemplate.queryForList(sql23, new Object[] { areaId, year-1, month });
		if(!map31.isEmpty()){
			ja3.add(map31.get(0).get("organization_name"));
			ja3.add(map31.get(0).get("value"));
			if(!map32.isEmpty()){				
				ja3.add(map32.get(0).get("value"));
				ja3.add(map31.get(0).get("value")==null||map32.get(0).get("value")==null?"":(df.format(Double.parseDouble(map31.get(0).get("value")==null?"0":map31.get(0).get("value").toString())
						-Double.parseDouble(map32.get(0).get("value")==null?"0":map32.get(0).get("value").toString()))));
			}else{
				ja3.add("");
				ja3.add("");
			}
		}else{
			ja3.add("");
			ja3.add("");
			if(!map32.isEmpty()){				
				ja3.add(map32.get(0).get("value"));
				ja3.add("");
			}else{
				ja3.add("");
				ja3.add("");
			}
		}
		
		JSONArray ja4 = new JSONArray();
		List<Map<String, Object>> map41 = jdbcTemplate.queryForList(sql24, new Object[] { areaId, year, month });
		List<Map<String, Object>> map42 = jdbcTemplate.queryForList(sql24, new Object[] { areaId, year-1, month });
		if(!map41.isEmpty()){
			ja4.add(map41.get(0).get("organization_name"));
			ja4.add(map41.get(0).get("value"));
			if(!map42.isEmpty()){				
				ja4.add(map42.get(0).get("value"));
				ja4.add(map41.get(0).get("value")==null||map42.get(0).get("value")==null?"":(df.format(Double.parseDouble(map41.get(0).get("value")==null?"0":map41.get(0).get("value").toString())
						-Double.parseDouble(map42.get(0).get("value")==null?"0":map42.get(0).get("value").toString()))));
			}else{
				ja4.add("");
				ja4.add("");
			}
		}else{
			ja4.add("");
			ja4.add("");
			if(!map42.isEmpty()){				
				ja4.add(map42.get(0).get("value"));
				ja4.add("");
			}else{
				ja4.add("");
				ja4.add("");
			}
		}
		
		map.put("div2_ja1", ja1);
		map.put("div2_ja2", ja2);
		map.put("div2_ja3", ja3);
		map.put("div2_ja4", ja4);
		
		return map;
	}

	@Override
	public Map<String, Object> selectParkBenefitAnalysisData(BigDecimal areaId, Integer year, Integer month) {
		Map<String, Object> map = new HashMap<>();
		DecimalFormat df = new DecimalFormat("#0.00");
		
		//div1 利润率对比
		String sql1 = "select * from( select a.organization_id, a.organization_name, decode(a.zyywsr_value, null, '', 0, '',round(nvl(a.lr_value,0)*100/a.zyywsr_value,1)) as value"
				+ " from r_pk_in_op_mn_ac_log a, t_park_info b where a.organization_id = b.park_id and b.area_id = ?  "
				+ " and a.year_caliber = ? and a.month_caliber = ? and a.month_caliber in (3,6,9,12) and a.organization_kind = 2 "
				+ " union all "
				+ " select a.organization_id, a.organization_name, decode(a.zyywsr_value, null, '', 0, '',round(nvl(a.lr_value,0)*100/a.zyywsr_value,1)) as value "
				+ " from r_pk_in_op_mn_ac_log a where a.organization_id = ?  "
				+ " and a.year_caliber = ? and a.month_caliber = ? and a.month_caliber in (3,6,9,12) and a.organization_kind = 1 "
				+ " )order by to_number(value) desc nulls last";
		
		List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql1.toString(), new Object[] { areaId, year, month, areaId, year, month });

		List<JSONObject> value = new ArrayList<>();
		Double total = 0.0;
		boolean flag = false;
		if (!list1.isEmpty()) {
			for (Map<String, Object>record:list1) {
				if(areaId.toString().compareTo(record.get("organization_id").toString())==0){
					map.put("div1_area_value", record.get("value"));
				}else{
					JSONObject jo = new JSONObject();
					jo.put("spaceId", record.get("organization_id"));
					jo.put("spaceName", record.get("organization_name"));
					jo.put("value", record.get("value"));
					if(record.get("value")!=null&&record.get("value")!=""){
						flag = true;
					}
					value.add(jo);
					total += (jo.getDouble("value")==null?0:jo.getDouble("value"));
				}
			}
		}
		map.put("div1_list", value);
		map.put("div1_total", df.format(total));
		map.put("div1_flag", flag);
		
		//div3 出口比重
		boolean pieFlag = false;
		boolean barFlag = false;
		String sql3 = "select * from (select a.organization_id, a.organization_name, decode(a.zyywsr_value, null, '', 0, '', round(nvl(a.ckjhz_value,0)*100/a.zyywsr_value,1)) as value "
					+ " from r_pk_in_op_mn_ac_log a, t_park_info b where a.organization_id = b.park_id and b.area_id = ?  "
					+ " and a.year_caliber = ? and a.month_caliber = ? and a.month_caliber in (3,6,9,12) and a.organization_kind = 2"
					+ " union all"
					+ " select a.organization_id, a.organization_name, decode(a.zyywsr_value, null, '', 0, '', round(nvl(a.ckjhz_value,0)*100/a.zyywsr_value,1)) as value "
					+ " from r_pk_in_op_mn_ac_log a where a.organization_id = ?  "
					+ " and a.year_caliber = ? and a.month_caliber = ? and a.month_caliber in (3,6,9,12) and a.organization_kind = 1"
					+ ") order by to_number(value) desc nulls last";
		
		List<Map<String, Object>> list3 = jdbcTemplate.queryForList(sql3.toString(), new Object[] { areaId, year, month, areaId, year, month });
		//value 饼图
		JSONArray legendPieLr = new JSONArray();
		JSONArray seriesPieLr = new JSONArray();
		Double totalLr = 0.0;
		//percent 柱形图
		/*JSONArray xAxisBarLr = new JSONArray();
		JSONArray seriesBarLr = new JSONArray();*/
		if(!list3.isEmpty()){
			for (Map<String, Object>record:list3) {
				if(areaId.toString().compareTo(record.get("organization_id").toString())==0){
					map.put("div3_area_value", record.get("value"));
				}else{
					legendPieLr.add(record.get("organization_name"));
					JSONObject jo = new JSONObject();
					jo.put("name", record.get("organization_name"));
					jo.put("value", record.get("value")==null||record.get("value")==""?0:record.get("value"));
					seriesPieLr.add(jo);
					totalLr += (record.get("value")!=null?Double.valueOf(record.get("value").toString()):0);
					
					if(record.get("value")!=null&&record.get("value")!=""){
						pieFlag = true;
					}
					
					/*xAxisBarLr.add(record.get("organization_name"));
					seriesBarLr.add(record.get("lr_percent"));*/
				}
			}
		}
		map.put("div3_legendPieLr", legendPieLr);
		map.put("div3_seriesPieLr", seriesPieLr);
		/*map.put("div3_xAxisBarLr", xAxisBarLr);
		map.put("div3_seriesBarLr", seriesBarLr);*/
		map.put("div3_totalLr", df.format(totalLr));
		map.put("div3_pieFlag", pieFlag);
		
		
		//div4 人均销售产值
		pieFlag = false;
		barFlag = false;
		String sql4 = "select * from (select organization_id, organization_name, value, decode(last_value, null, '', 0, '', round((nvl(value,0)-last_value)*100/last_value,1)) as percent from ( "
				+ " select a.organization_id, a.organization_name, decode(a.csgyschd_cyry_value, null, '', 0, '',round(nvl(a.gyxscz_value,0)/a.csgyschd_cyry_value,1)) as value, "
				+ " (select decode(a.csgyschd_cyry_value, null, 0, round(nvl(c.gyxscz_value,0)/c.csgyschd_cyry_value,1)) "
				+ " from r_pk_in_op_mn_ac_log c where c.organization_id = a.organization_id "
				+ " and c.year_caliber = (a.year_caliber - 1)  and c.month_caliber = a.month_caliber and c.organization_kind = a.organization_kind ) last_value "
				+ " from r_pk_in_op_mn_ac_log a, t_park_info b where a.organization_id = b.park_id and b.area_id = ?  "  
				+ " and a.year_caliber = ? and a.month_caliber = ? and a.month_caliber in (3,6,9,12) and a.organization_kind = 2 )"
				+ " union all "
				+ " select organization_id, organization_name, value, decode(last_value, null, '', 0, '', round((nvl(value,0)-last_value)*100/last_value,1)) as percent from ( "
				+ " select a.organization_id, a.organization_name, decode(a.csgyschd_cyry_value, null, '', 0, '',round(nvl(a.gyxscz_value,0)/a.csgyschd_cyry_value,1)) as value, "
				+ " (select decode(a.csgyschd_cyry_value, null, 0, round(nvl(c.gyxscz_value,0)/c.csgyschd_cyry_value,1)) "
				+ " from r_pk_in_op_mn_ac_log c where c.organization_id = a.organization_id "
				+ " and c.year_caliber = (a.year_caliber - 1)  and c.month_caliber = a.month_caliber and c.organization_kind = a.organization_kind ) last_value "
				+ " from r_pk_in_op_mn_ac_log a where a.organization_id = ?  "  
				+ " and a.year_caliber = ? and a.month_caliber = ? and a.month_caliber in (3,6,9,12) and a.organization_kind = 1 )"
				+ ") order by to_number(value) desc nulls last ";
		
		List<Map<String, Object>> list4 = jdbcTemplate.queryForList(sql4.toString(), new Object[] { areaId, year, month, areaId, year, month });
		//value 柱形图
		JSONArray legendPieZyywsr = new JSONArray();
		JSONArray seriesPieZyywsr = new JSONArray();
		//percent 饼图
		JSONArray xAxisBarZyywsr = new JSONArray();
		JSONArray seriesBarZyywsr = new JSONArray();
		Double totalZyywsr = 0.0;
		if(!list4.isEmpty()){
			for (Map<String, Object>record:list4) {
				if(areaId.toString().compareTo(record.get("organization_id").toString())==0){
					map.put("div4_area_barValue", record.get("percent")==null||record.get("percent")==""?"":record.get("percent"));
					map.put("div4_area_pieValue", record.get("value")!=null?record.get("value"):"");
				}else{					
					legendPieZyywsr.add(record.get("organization_name"));
					JSONObject jo = new JSONObject();
					jo.put("name", record.get("organization_name"));
					jo.put("value", record.get("value")!=null?record.get("value"):"");
					seriesPieZyywsr.add(jo);
					
					if(record.get("value")!=null&&record.get("value")!=""){
						pieFlag = true;
					}
					
					xAxisBarZyywsr.add(record.get("organization_name"));
					seriesBarZyywsr.add(record.get("percent")==null||record.get("percent")==""?0:record.get("percent"));
					totalZyywsr += (record.get("value")!=null?Double.valueOf(record.get("value").toString()):0);
					
					if(record.get("percent")!=null&&record.get("percent")!=""){
						barFlag = true;
					}
				}
			}
		}
		map.put("div4_legendPieZyywsr", legendPieZyywsr);
		map.put("div4_seriesPieZyywsr", seriesPieZyywsr);
		map.put("div4_xAxisBarZyywsr", xAxisBarZyywsr);
		map.put("div4_seriesBarZyywsr", seriesBarZyywsr);  
		map.put("div4_totalZyywsr", df.format(totalZyywsr));
		map.put("div4_pieFlag", pieFlag);
		map.put("div4_barFlag", barFlag);
		
		//div2
		String sql21 = "select t.*, rownum from ( "
				+"select * from (select a.organization_id, a.organization_name, decode(a.zyywsr_value, null, '', 0, '', round(nvl(a.lr_value,0)*100/a.zyywsr_value,1)) as value "
				+" from r_pk_in_op_mn_ac_log a, t_park_info b where a.organization_id = b.park_id and b.area_id = ?  "
				+"and a.year_caliber = ? and a.month_caliber = ? and a.month_caliber in (3,6,9,12) and a.organization_kind = 2) order by to_number(value) desc nulls last) t where rownum = 1";
		String sql22 = "select t.*, rownum from ( "
				+"select * from (select a.organization_id, a.organization_name, decode(a.zyywsr_value, null, '', 0, '', round(nvl(a.ckjhz_value,0)*100/a.zyywsr_value,1)) as value "
				+" from r_pk_in_op_mn_ac_log a, t_park_info b where a.organization_id = b.park_id and b.area_id = ?  "
				+"and a.year_caliber = ? and a.month_caliber = ? and a.month_caliber in (3,6,9,12) and a.organization_kind = 2) order by to_number(value) desc nulls last) t where rownum = 1";
		String sql23 = "select t.*, rownum from ( "
				+"select * from (select a.organization_id, a.organization_name, decode(a.csgyschd_cyry_value, null, '', 0, '',round(nvl(a.gyxscz_value,0)/a.csgyschd_cyry_value,1)) as value "
				+" from r_pk_in_op_mn_ac_log a, t_park_info b where a.organization_id = b.park_id and b.area_id = ?  "
				+"and a.year_caliber = ? and a.month_caliber = ? and a.month_caliber in (3,6,9,12) and a.organization_kind = 2) order by to_number(value) desc nulls last) t where rownum = 1";
		
		JSONArray ja1 = new JSONArray();
		List<Map<String, Object>> map11 = jdbcTemplate.queryForList(sql21, new Object[] { areaId, year, month });
		List<Map<String, Object>> map12 = jdbcTemplate.queryForList(sql21, new Object[] { areaId, year-1, month });
		if(!map11.isEmpty()){
			ja1.add(map11.get(0).get("organization_name"));
			ja1.add(map11.get(0).get("value"));
			if(!map12.isEmpty()){				
				ja1.add(map12.get(0).get("value"));
				ja1.add(map11.get(0).get("value")==null||map12.get(0).get("value")==null?"":(df.format(Double.parseDouble(map11.get(0).get("value")==null?"0":map11.get(0).get("value").toString())
						-Double.parseDouble(map12.get(0).get("value")==null?"0":map12.get(0).get("value").toString()))));
			}else{
				ja1.add("");
				ja1.add("");
			}
		}else{
			ja1.add("");
			ja1.add("");
			if(!map12.isEmpty()){				
				ja1.add(map12.get(0).get("value"));
				ja1.add("");
			}else{
				ja1.add("");
				ja1.add("");
			}
		}
		
		JSONArray ja2 = new JSONArray();
		List<Map<String, Object>> map21 = jdbcTemplate.queryForList(sql22, new Object[] { areaId, year, month });
		List<Map<String, Object>> map22 = jdbcTemplate.queryForList(sql22, new Object[] { areaId, year-1, month });
		if(!map21.isEmpty()){
			ja2.add(map21.get(0).get("organization_name"));
			ja2.add(map21.get(0).get("value"));
			if(!map22.isEmpty()){				
				ja2.add(map22.get(0).get("value"));
				ja2.add(map21.get(0).get("value")==null||map22.get(0).get("value")==null?"":(df.format(Double.parseDouble(map21.get(0).get("value")==null?"0":map21.get(0).get("value").toString())
						-Double.parseDouble(map22.get(0).get("value")==null?"0":map22.get(0).get("value").toString()))));
			}else{
				ja2.add("");
				ja2.add("");
			}
		}else{
			ja2.add("");
			ja2.add("");
			if(!map22.isEmpty()){				
				ja2.add(map22.get(0).get("value"));
				ja2.add("");
			}else{
				ja2.add("");
				ja2.add("");
			}
		}
		
		JSONArray ja3 = new JSONArray();
		List<Map<String, Object>> map31 = jdbcTemplate.queryForList(sql23, new Object[] { areaId, year, month });
		List<Map<String, Object>> map32 = jdbcTemplate.queryForList(sql23, new Object[] { areaId, year-1, month });
		if(!map31.isEmpty()){
			ja3.add(map31.get(0).get("organization_name"));
			ja3.add(map31.get(0).get("value"));
			if(!map32.isEmpty()){				
				ja3.add(map32.get(0).get("value"));
				ja3.add(map31.get(0).get("value")==null||map32.get(0).get("value")==null?"":(df.format(Double.parseDouble(map31.get(0).get("value")==null?"0":map31.get(0).get("value").toString())
						-Double.parseDouble(map32.get(0).get("value")==null?"0":map32.get(0).get("value").toString()))));
			}else{
				ja3.add("");
				ja3.add("");
			}
		}else{
			ja3.add("");
			ja3.add("");
			if(!map32.isEmpty()){				
				ja3.add(map32.get(0).get("value"));
				ja3.add("");
			}else{
				ja3.add("");
				ja3.add("");
			}
		}
		
		map.put("div2_ja1", ja1);
		map.put("div2_ja2", ja2);
		map.put("div2_ja3", ja3);
		
		return map;
	}
}
