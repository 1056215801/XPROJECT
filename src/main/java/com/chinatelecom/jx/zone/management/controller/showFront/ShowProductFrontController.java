package com.chinatelecom.jx.zone.management.controller.showFront;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.util.HtmlUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.hcdy.util.StringUtil;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.showProduct.IshowProductService;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;
import com.github.pagehelper.Page;


@Controller
public class ShowProductFrontController extends BaseController {

	@Autowired
	private IshowProductService showProductService;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper;
	
	private static final Logger logger = LoggerFactory.getLogger(ShowProductFrontController.class);

	/**
	 * 首页 
	 */
	@RequestMapping(value = "/front/showProduct/main")
	public String main(
			@RequestParam(value = "isComplete", required = false)Boolean isComplete, 
			Model model, HttpServletRequest request) {
		try {
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("collectAccountId", getCurrentAccountId());
			paramMap.put("pageNum", 1);
			paramMap.put("pageSize", 6);
			
			Map<String, Object> map = showProductService.productIndex(paramMap);
			
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
				model.addAttribute("pushProductList",map.get("pushProductList"));
				model.addAttribute("industryList",map.get("industryList"));
			}
			model.addAttribute("isComplete", isComplete);
		} catch (Exception e) {
			logger.error("【产业对接】main方法发生异常，详细原因：" + e.getMessage(), e);
		}
		return "/front/showFront/product/main";
	}

	/**
	 * 详情
	 */
	@RequestMapping(value = "/front/showProduct/view")
	public String view(@RequestParam(value = "id") BigDecimal id, Model model) {
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id", id);
			paramMap.put("collectAccountId", getCurrentAccountId());
			
			Map<String, Object> map = showProductService.productDetail(paramMap);
			
			if(!map.isEmpty()){
				model.addAttribute("productInfo", map.get("productInfo"));
				model.addAttribute("companyInfo", map.get("companyInfo"));
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
			logger.error("【产业对接】view方法发生异常，详细原因：" + e.getMessage(), e);
		}
		return "/front/showFront/product/productDetail";
	}

	/**
	 * 搜索列表
	 * orderType 排序条件
	 * 0：综合 1：人气 2：价格
	 */
	@RequestMapping(value = "/interface/json/showProduct/searchList")
	public String searchList(
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "industryId", required = false) BigDecimal industryId,
			@RequestParam(value = "orderType", defaultValue = "0") Short orderType,
			@RequestParam(value = "orderNumMin", required = false) Integer orderNumMin,
			@RequestParam(value = "orderNumMax", required = false) Integer orderNumMax,
			@RequestParam(value = "provinceName", required = false) String provinceName,
			@RequestParam(value = "areaName", required = false) String areaName,
			@ModelAttribute("page") Page<?> page, ModelMap modelMap) {
		try {
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("searchKey", searchKey);
			paramMap.put("industryId", industryId);
			paramMap.put("orderType", orderType);
			paramMap.put("orderNumMin", orderNumMin);
			paramMap.put("orderNumMax", orderNumMax);
			paramMap.put("provinceId", selectProvinceId(provinceName));
			paramMap.put("areaId", selectAreaId(selectProvinceId(provinceName), areaName));
			paramMap.put("pageNum", page.getPageNum());
			paramMap.put("pageSize", page.getPageSize());
			paramMap.put("collectAccountId", getCurrentAccountId());
			if(getCurrentAccountId()!=null){
				paramMap.put("accountName", getCurrentAccountName());
				paramMap.put("parkId", getCurrentParkId());
			}
			
			Map<String, Object> map = showProductService.searchList(paramMap);
			
			if(!map.isEmpty()){
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "获取产品列表成功！");
				modelMap.addAttribute("productList", map.get("productList"));
				modelMap.addAttribute("total", map.get("total"));
			}else{
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "获取产品列表失败！");
			}
			
		} catch (Exception e) {
			logger.error("【产业对接】searchList方法发生异常，详细原因："+e.getMessage(),e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取产品列表失败！");
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
	
	
	/**
	 * 留言
	 */
	@RequestMapping(value = "/interface/json/showProduct/message")
	public String message(
			@RequestParam(value = "type", required = false) Short type, 
			@RequestParam(value = "relatedId", required = false) BigDecimal relatedId, 
			@RequestParam(value = "relatedName", required = false) String relatedName, 
			@RequestParam(value = "relatedCompanyId", required = false) BigDecimal relatedCompanyId, 
			@RequestParam(value = "title", required = false) String title, 
			@RequestParam(value = "content", required = false) String content, ModelMap modelMap){
		try{
			if(getCurrentAccountId()==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "亲，您还没有登录！");
				return "jsonView";
			}
			
			if(type==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数type未设置！");
				return "jsonView";
			}
			
			if(relatedId==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数relatedId未设置！");
				return "jsonView";
			}
			
			if(!StringUtil.checkNotNull(relatedName)){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数relatedName未设置！");
				return "jsonView";
			}
			
			if(relatedCompanyId==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数relatedCompanyId未设置！");
				return "jsonView";
			}
			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("type", type);
			paramMap.put("relatedId", relatedId);
			paramMap.put("relatedName", relatedName);
			paramMap.put("relatedCompanyId", relatedCompanyId);
			paramMap.put("createAccountId", relatedCompanyId);
			paramMap.put("relatedCompanyId", relatedCompanyId);
			paramMap.put("createAccountId", getCurrentAccountId());
			paramMap.put("createAccountName", getCurrentAccountName());
			paramMap.put("parkId", getCurrentParkId());
			paramMap.put("title", HtmlUtils.htmlEscape(title));
			paramMap.put("content", HtmlUtils.htmlEscape(content));
			
			JSONObject jo = showProductService.message(paramMap);
			
			modelMap.addAttribute("success", jo.getBoolean("success"));
			modelMap.addAttribute("errorCode", jo.getInteger("errorCode"));
			modelMap.addAttribute("errorMsg", jo.getString("errorMsg"));
			
		}catch (Exception e) {
			logger.error("【产业对接】message方法发生异常，详细原因："+e.getMessage(),e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "留言失败！");
		}
		return "jsonView";
	}
	
	/**
	 * 留言列表
	 */
	@RequestMapping(value = "/interface/json/showProduct/messageList")
	public String messageList( 
			@RequestParam(value = "relatedId", required = false) BigDecimal relatedId, ModelMap modelMap){
		try{
			
			if(relatedId==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数relatedId未设置！");
				return "jsonView";
			}
			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("relatedId", relatedId);
			paramMap.put("pageNum", 1);
			paramMap.put("pageSize", 1000);
			
			JSONObject jo = showProductService.messageList(paramMap);
			
			modelMap.addAttribute("success", jo.getBoolean("success"));
			modelMap.addAttribute("errorCode", jo.getInteger("errorCode"));
			modelMap.addAttribute("errorMsg", jo.getString("errorMsg"));
			modelMap.addAttribute("value", jo.getJSONArray("messageList"));
			modelMap.addAttribute("total", jo.getString("total"));
			
		}catch (Exception e) {
			logger.error("【产业对接】messageList方法发生异常，详细原因："+e.getMessage(),e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取留言列表失败！");
		}
		return "jsonView";
	}
	
	
	/**
	 * 收藏
	 */
	@RequestMapping(value = "/interface/json/showProduct/collect")
	public String collect(
			@RequestParam(value = "type", required = false) Short type, 
			@RequestParam(value = "relatedId", required = false) BigDecimal relatedId, 
			@RequestParam(value = "relatedName", required = false) String relatedName, ModelMap modelMap){
		try{
			if(getCurrentAccountId()==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "亲，您还没有登录！");
				return "jsonView";
			}
			
			if(type==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数type未设置！");
				return "jsonView";
			}
			
			if(relatedId==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数relatedId未设置！");
				return "jsonView";
			}
			
			if(!StringUtil.checkNotNull(relatedName)){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数relatedName未设置！");
				return "jsonView";
			}
			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("type", type);
			paramMap.put("relatedId", relatedId);
			paramMap.put("relatedName", relatedName);
			paramMap.put("createAccountId", getCurrentAccountId());
			paramMap.put("createAccountName", getCurrentAccountName());
			paramMap.put("organizationId", organizationIdSessionHelper.getOrganizationIdBySessionAttribute());
			paramMap.put("rootId", organizationIdSessionHelper.getRootIdBySessionAttribute());
			paramMap.put("parkId", getCurrentParkId());
			
			JSONObject jo = showProductService.collect(paramMap);
			
			modelMap.addAttribute("success", jo.getBoolean("success"));
			modelMap.addAttribute("errorCode", jo.getInteger("errorCode"));
			modelMap.addAttribute("errorMsg", jo.getString("errorMsg"));
			
			
		}catch (Exception e) {
			logger.error("【产业对接】collect方法发生异常，详细原因："+e.getMessage(),e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "收藏失败！");
		}
		return "jsonView";
	}
	
	
	/**
	 * 取消收藏
	 */
	@RequestMapping(value = "/interface/json/showProduct/cancelCollect")
	public String cancelCollect(
			@RequestParam(value = "relatedId") BigDecimal relatedId, ModelMap modelMap){
		try{
			if(getCurrentAccountId()==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "亲，您还没有登录！");
				return "jsonView";
			}
			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("relatedId", relatedId);
			paramMap.put("createAccountId", getCurrentAccountId());
			
			JSONObject jo = showProductService.cancelCollect(paramMap);
			
			modelMap.addAttribute("success", jo.getBoolean("success"));
			modelMap.addAttribute("errorCode", jo.getInteger("errorCode"));
			modelMap.addAttribute("errorMsg", jo.getString("errorMsg"));
			
		}catch (Exception e) {
			logger.error("【产业对接】cancelCollect方法发生异常，详细原因："+e.getMessage(),e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "取消收藏失败！");
		}
		return "jsonView";
	}
}
