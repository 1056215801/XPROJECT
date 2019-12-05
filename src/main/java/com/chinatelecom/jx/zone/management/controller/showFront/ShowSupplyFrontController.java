package com.chinatelecom.jx.zone.management.controller.showFront;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.showProduct.IshowProductService;
import com.chinatelecom.jx.zone.management.service.showSupply.IshowSupplyService;
import com.github.pagehelper.Page;

@Controller
public class ShowSupplyFrontController extends BaseController{
	@Autowired
	private IshowSupplyService showSupplyService;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private IshowProductService showProductService;
	
	private static final Logger logger = LoggerFactory.getLogger(ShowSupplyFrontController.class);

	/**
	 * 要素共享首页
	 */
	@RequestMapping(value = "/showSupply/main")
	public String main(@RequestParam(value = "isComplete", required = false)Boolean isComplete, Model model) {
		model.addAttribute("accountId",getCurrentAccountId());
		try{
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("collectAccountId", getCurrentAccountId());
			
			Map<String, Object> map = showSupplyService.supplyIndex(paramMap);
			
			if(!map.isEmpty()){
				List<JSONObject> companyList = (List<JSONObject>) map.get("companyList");
				List<JSONObject> compList = new ArrayList<>();
				for(int i=0;i<companyList.size();i++){
					String companyName = companyList.get(i).get("companyName").toString();
					if(!companyName.contains("融合")){
						compList.add(companyList.get(i));
					}
				}
				model.addAttribute("companyList", compList);
				model.addAttribute("pushSypplyList",map.get("pushSypplyList"));
				model.addAttribute("categoryList",map.get("categoryList"));
				model.addAttribute("supplyDemandCount",map.get("supplyDemandCount"));
			}
			model.addAttribute("isComplete", isComplete);
		} catch (Exception e) {
			logger.error("【要素共享】main方法发生异常，详细原因："+e.getMessage(),e);
		}
		
		return "/front/showFront/supply/main";
	}
	
	/**
	 * 要素共享详情
	 */
	@RequestMapping(value = "/showSupply/detail")
	public String detail(@RequestParam(value = "id", required = true) String id, Model model) {
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id", id);
			paramMap.put("collectAccountId", getCurrentAccountId());
			
			Map<String, Object> map = showSupplyService.supplyDetail(paramMap);
			
			if(!map.isEmpty()){
				model.addAttribute("supplyDemand", map.get("supplyDemand"));
				model.addAttribute("imageList", map.get("imageList"));
			}
			
			Map<String, Object> paramMap2 = new HashMap<>();
			paramMap2.put("relatedId", id);
			paramMap2.put("pageNum", 1);
			paramMap2.put("pageSize", 1000);
			
			JSONObject jo = showProductService.messageList(paramMap2);
			List<?> messageList = JSON.parseObject(jo.getString("messageList"), List.class);
			
			model.addAttribute("messageList", messageList);
			
		} catch (Exception e) {
			logger.error("【要素共享】detail方法发生异常，详细原因："+e.getMessage(),e);
		}
		return "/front/showFront/supply/supplyDetail";
	}
	
	
	
	@RequestMapping(value = "/interface/json/showSupply/searchList")
	public String searchList(
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "categoryId", required = false) BigDecimal categoryId,
			@RequestParam(value = "type", required = false) Short type,
			@RequestParam(value = "provinceName", required = false) String provinceName,
			@RequestParam(value = "areaName", required = false) String areaName,
			@ModelAttribute("page") Page<?> page, ModelMap modelMap) {
		try {
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("searchKey", searchKey);
			paramMap.put("categoryId", categoryId);
			paramMap.put("type", type);
			paramMap.put("provinceId", selectProvinceId(provinceName));
			paramMap.put("areaId", selectAreaId(selectProvinceId(provinceName), areaName));
			paramMap.put("pageNum", page.getPageNum());
			paramMap.put("pageSize", page.getPageSize());
			paramMap.put("collectAccountId", getCurrentAccountId());
			if(getCurrentAccountId()!=null){
				paramMap.put("accountName", getCurrentAccountName());
				paramMap.put("parkId", getCurrentParkId());
			}
			
			Map<String, Object> map = showSupplyService.searchList(paramMap);
			
			if(!map.isEmpty()){
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "获取供求列表成功！");
				modelMap.addAttribute("supplyList", map.get("supplyList"));
				modelMap.addAttribute("total", map.get("total"));
			}else{
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "获取供求列表失败！");
			}
			
		} catch (Exception e) {
			logger.error("【要素共享】searchList方法发生异常，详细原因："+e.getMessage(),e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取供求列表失败！");
		}
		return "jsonView";
	}
	
	private BigDecimal selectProvinceId(String provinceName){
		String sql = "select area_id from t_area_info where area_name = ? ";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{provinceName});
		if(!list.isEmpty()){
			return new BigDecimal(list.get(0).get("AREA_ID").toString());
		}else{
			return null;
		}
	}
	
	private BigDecimal selectAreaId(BigDecimal provinceId, String areaName){
		String sql = "select area_id from t_area_info where area_name = ? and parent_id = ? ";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{areaName, provinceId});
		if(!list.isEmpty()){
			return new BigDecimal(list.get(0).get("AREA_ID").toString());
		}else{
			return null;
		}
	}
}
