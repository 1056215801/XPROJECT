package com.chinatelecom.jx.zone.management.controller.cityDataCenter.yc;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.HtmlUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.util.StringUtil;

@Controller
public class YcLdDataCenterController {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private static final Logger logger = LoggerFactory.getLogger(YcCityDataCenterController.class);
	
	@RequestMapping(value = "/interface/json/ldDataCenter/yc/ldData")
	public String ldData(
			@RequestParam(value = "ids", required = false) String ids, 
			@RequestParam(value = "type", required = false) Short type, 
			HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(!StringUtil.checkNotNull(ids)){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数ids未设置！");
			}
			
			if(type==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数type未设置！");
			}
			
			String[] idArr = HtmlUtils.htmlEscape(ids).split(",");
			
			JSONObject jo = new JSONObject();
			for(int i=0;i<idArr.length;i++){
				String sql = "select * from (select t.*, rownum rn from "
						+ "(select * from X_OFFICE.r_ld_rst_log t "
						+ "where industry_id = ? order by t.time desc)t)where rn < ? ";
				int rn = 0;
				switch (type) {
				case 1:
					rn = 2;
					break;
				case 2:
					rn = 8;				
					break;
				case 3:
					rn = 366;
					break;

				default:
					rn = 0;
					break;
				}
				
				List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{idArr[i], rn});
				
				if(!list.isEmpty()){
					if(type==1){
						for(Map<String, Object>record:list){
							JSONObject jsonObject = new JSONObject();
							jsonObject.put("record", record);
							jo.put(idArr[i], jsonObject);
						}
					}else{
						JSONArray data = new JSONArray();
						JSONArray xAxis = new JSONArray();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						int j=list.size();
						for(int m=0; m<list.size();m++){
							JSONObject jsonObject = new JSONObject();
							if(type==2){
								xAxis.add(sdf.format(new Date(new Date().getTime()-(j-1)*24*3600*1000)));
							}
							jsonObject.put("value", list.get(list.size()-m-1).get("ave_price").toString());
							data.add(jsonObject);
							j--;
						}
						jo.put(idArr[i], data);
						jo.put("xAxis", xAxis);
					}
				}
				
			}
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "数据获取成功！");
			modelMap.addAttribute("ldData", jo);
			
		}catch (Exception e) {
			logger.error("【锂电数据中心-宜春】ldData方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}
}
