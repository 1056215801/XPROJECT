package com.chinatelecom.jx.zone.management.service.showProduct;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.hcdy.util.StringUtil;
import com.chinatelecom.jx.zone.management.util.HttpToolkit;
import com.chinatelecom.jx.zone.management.util.SynConsts;

@Service
@Transactional(rollbackFor=Exception.class)
public class ShowProductServiceImpl implements IshowProductService{
	@Value("${goodShowPaltform}")
	private String goodShowPaltform;
	@Value("${XProduction}")
	private String XProduction;
	@Value("${XProduction2}")
	private String XProduction2;
	
	public final static String searchList = "/interface/json/showProductInfo/searchList";
	public final static String productIndex = "/interface/json/showProductInfo/productIndex";
	public final static String productDetail = "/interface/json/showProductInfo/detail";
	public final static String message = "/interface/json/showMessageInfo/message";
	public final static String collect = "/interface/json/showCollectInfo/collect";
	public final static String cancelCollect = "/interface/json/showCollectInfo/cancelCollect";
	public final static String messageList = "/interface/json/showMessageInfo/replyList";
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
		

	@Override
	public String getProductUpList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productUpList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductDownList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productDownList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductMyList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productMyList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductAuditList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productAuditList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductNotPassedList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productNotPassedList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductAuditedList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productAuditedList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductUnAuditedList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productUnAuditedList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductAgentList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productAgentList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductView(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productView_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductViewForTemp(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productViewForTemp_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductSave(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productSave_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductGoUp(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productGoUp_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductGoDown(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productGoDown_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductGoDelete(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productGoDelete_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductSaveAudit(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productSaveAudit_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductSubmitToAudit(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productSubmitToAudit_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getUnitList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.unitList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductShow(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productShow_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductSearch(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			logger.info("=============产品搜索入参==============="+paramMap);
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productSearch_Url, paramMap);
			logger.info("=============产品搜索返回结果backJson==============="+backJson);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	

	@Override
	public String getCompanyInfoView(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.companyInfoView_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getMyCollect(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.myCollect_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getCompanyList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.companyList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getCompanySearch(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.companySearch_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getPopCompany(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.popCompany_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	public String getCompanyRecomand(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.companyRecomand_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}
	
	@Override
	public String getSupplyDemandCount(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.supplyDemandCount_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}
	
	@Override
	public String getAddToCollect(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.addToCollect_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getDelFromCollect(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.delFromCollect_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getAjaxGetAtts(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.ajaxGetAtts_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getProductMainData(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.productMainData_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	@Override
	public String getPopProduct(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.popProduct_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			
		}
		return backJson;
	}

	
	/**
	 * ************************************************************************************
	 * 
	 * 									新版接口
	 * 
	 * 
	 * ************************************************************************************
	 */
	
	
	@Override
	public Map<String, Object> searchList(Map<String, Object> paramMap) throws Exception {
		String backJson = HttpToolkit.POSTMethod(XProduction+searchList, paramMap);
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.checkNotNull(backJson)){
			JSONObject jo = JSONObject.parseObject(backJson);
			if(jo.getBoolean("success")){
				@SuppressWarnings("unchecked")
				List<JSONObject> list = JSON.parseObject(jo.getString("productList"), List.class);
				map.put("productList", list);
				map.put("total", jo.getInteger("total"));
			}
		}
		return map;
	}

	@Override
	public Map<String, Object> productIndex(Map<String, Object> paramMap) throws Exception {
		String backJson = HttpToolkit.POSTMethod(XProduction+productIndex, paramMap);
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.checkNotNull(backJson)){
			JSONObject jo = JSONObject.parseObject(backJson);
			if(jo.getBoolean("success")){
				map.put("companyList", jo.get("companyList"));
				map.put("pushProductList", jo.get("pushProductList"));
				map.put("industryList", jo.get("industryList"));
			}
		}
		return map;
	}

	@Override
	public Map<String, Object> productDetail(Map<String, Object> paramMap) throws Exception {
		String backJson = HttpToolkit.POSTMethod(XProduction+productDetail, paramMap);
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.checkNotNull(backJson)){
			JSONObject jo = JSONObject.parseObject(backJson);
			if(jo.getBoolean("success")){
				map.put("productInfo", jo.get("showProductInfo"));
				map.put("companyInfo", jo.get("companyInfo"));
				map.put("imageList", jo.get("imageList"));
			}
		}
		return map;
	}

	@Override
	public JSONObject message(Map<String, Object> paramMap) throws Exception {
		String backJson = HttpToolkit.POSTMethod(XProduction+message, paramMap);
		JSONObject jo = new JSONObject();
		if(StringUtil.checkNotNull(backJson)){
			jo = JSONObject.parseObject(backJson);
		}
		return jo;
	}

	@Override
	public JSONObject collect(Map<String, Object> paramMap) throws Exception {
		String backJson = HttpToolkit.POSTMethod(XProduction+collect, paramMap);
		JSONObject jo = new JSONObject();
		if(StringUtil.checkNotNull(backJson)){
			jo = JSONObject.parseObject(backJson);
		}
		return jo;
	}

	@Override
	public JSONObject cancelCollect(Map<String, Object> paramMap) throws Exception {
		String backJson = HttpToolkit.POSTMethod(XProduction+cancelCollect, paramMap);
		JSONObject jo = new JSONObject();
		if(StringUtil.checkNotNull(backJson)){
			jo = JSONObject.parseObject(backJson);
		}
		return jo;
	}

	@Override
	public String getProductionUrl() {
		return XProduction;
	}

	@Override
	public String getProductionUrl2() {
		return XProduction2;
	}

	@Override
	public JSONObject messageList(Map<String, Object> paramMap) throws Exception {
		String backJson = HttpToolkit.POSTMethod(XProduction+messageList, paramMap);
		JSONObject jo = new JSONObject();
		if(StringUtil.checkNotNull(backJson)){
			jo = JSONObject.parseObject(backJson);
		}
		return jo;
	}

}
