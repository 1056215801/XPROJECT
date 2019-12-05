package com.chinatelecom.jx.zone.management.service.externalInterface;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.bean.ResultBean;

@Service
public class InterfaceServiceImpl implements IInterfaceService{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public ResultBean queryCompanyValueListByTJ(Integer type, Integer query,
			String year, String month) {
		String v_sql_query = "";
		switch (type) {
		case 1:
			switch (query) {
			case 1:
				 v_sql_query = "t.total_output";
				break;
			case 2:
				v_sql_query = "t.total_output_year"; 		
				break;
			case 3:
				v_sql_query = "t.total_output_pre";  
				break;
			case 4:
				v_sql_query = "t.total_output_year_pre";  
				break;
			default:
				break;
			}
			break;
		case 2:
			switch (query) {
			case 1:
				 v_sql_query = "t.PRIME_REVENUE";
				break;
			case 2:
				v_sql_query = "t.PRIME_REVENUE_year"; 		
				break;
			case 3:
				v_sql_query = "t.PRIME_REVENUE_pre";  
				break;
			case 4:
				v_sql_query = "t.PRIME_REVENUE_year_pre";  
				break;
			default:
				break;
			}
			break;
		case 3:
			switch (query) {
			case 1:
				 v_sql_query = "t.PRIME_REVENUE";
				break;
			case 2:
				v_sql_query = "t.PRIME_REVENUE_year"; 		
				break;
			case 3:
				v_sql_query = "t.PRIME_REVENUE_pre";  
				break;
			case 4:
				v_sql_query = "t.PRIME_REVENUE_year_pre";  
				break;
			default:
				break;
			}
			break;
		case 4:
			switch (query) {
			case 1:
				 v_sql_query = "t.ydl";
				break;
			case 2:
				v_sql_query = "t.ydl_year"; 		
				break;
			case 3:
				v_sql_query = "t.ydl_pre";  
				break;
			case 4:
				v_sql_query = "t.ydl_year_pre";  
				break;
			default:
				break;
			}
			break;
		default:
			break;
		}     
		
		StringBuilder sql = new StringBuilder();
		if(type==4){
			sql.append("select tt.*,ROWNUM from ")
			.append("(select t.company_id,t.company_name, "+v_sql_query+" as comp_value ")
			.append("from T_SERVICE_MAP_CONSUMPTIONPOWER t ")
			.append("where t.year = ? and t.yearmonth = ?")
			.append(" order by "+v_sql_query+" desc ) tt where ROWNUM <=10");
		}else{
			sql.append("select tt.*,ROWNUM from ")
			.append("(select t.company_id,t.company_name, "+v_sql_query+" as comp_value ")
			.append("from T_SERVICE_MAP_PROJECT_VALUE t ")
			.append("where t.year = ? and t.yearmonth = ?")
			.append(" order by "+v_sql_query+" desc ) tt where ROWNUM <=10");
		}
		
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(),
				new Object[]{year, month});
		
		List<JSONObject> joList = new ArrayList<>();
		
		for (int i=0;i<list.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("companyId", list.get(i).get("COMPANY_ID"));
			jo.put("companyName", list.get(i).get("COMPANY_NAME"));
			jo.put("companyValue", list.get(i).get("COMP_VALUE"));
			jo.put("sortGrade", list.get(i).get("ROWNUM"));
			
			joList.add(jo);
		}
		
		JSONObject jo1 = new JSONObject();
		jo1.put("value", joList);
		
		ResultBean resultBean = new ResultBean();
		resultBean.setCode(0);
		resultBean.setJsonValue(jo1);
		return resultBean;
	}
	
}
