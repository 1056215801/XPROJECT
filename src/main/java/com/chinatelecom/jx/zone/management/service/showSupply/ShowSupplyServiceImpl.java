package com.chinatelecom.jx.zone.management.service.showSupply;

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
public class ShowSupplyServiceImpl implements IshowSupplyService{
	@Value("${goodShowPaltform}")
	private String goodShowPaltform;
	@Value("${XProduction}")
	private String XProduction;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public final static String searchList = "/interface/json/showSupplyDemand/searchList";
	public final static String supplyIndex = "/interface/json/showSupplyDemand/supplyIndex";
	public final static String supplyDetail = "/interface/json/showSupplyDemand/detail";
	
	@Override
	public String getSupplyDemandSave(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandSave, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandSearch(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.supplyDemandSearch_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}
	
	@Override
	public String getSupplyDemandRecommend(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.POSTMethod(goodShowPaltform + SynConsts.supplyDemandRecommend_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandUpList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandUpList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandDownList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandDownList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandMyList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandMyList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandAuditList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandAuditList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandNotPassedList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandNotPassedList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandViewTemp(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandViewTemp_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandAuditedList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandAuditedList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandUnAuditedList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandUnAuditedList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandAgentList(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandAgentList_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemanView(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemanView_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandShow(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandShow_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandGoUp(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandGoUp_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandGoDown(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandGoDown_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandGoDelete(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandGoDelete_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandSaveAudit(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandSaveAudit_Url, paramMap);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return backJson;
	}

	@Override
	public String getSupplyDemandSubmitToAudit(Map<String, Object> paramMap) {
		String backJson = "";
		try {
			backJson = HttpToolkit.GETMethod(goodShowPaltform + SynConsts.supplyDemandSubmitToAudit_Url, paramMap);
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
	
	
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> searchList(Map<String, Object> paramMap) throws Exception {
		String backJson = HttpToolkit.POSTMethod(XProduction+searchList, paramMap);
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.checkNotNull(backJson)){
			JSONObject jo = JSONObject.parseObject(backJson);
			if(jo.getBoolean("success")){
				List<JSONObject> list = JSON.parseObject(jo.getString("supplyList"), List.class);
				map.put("supplyList", list);
				map.put("total", jo.getJSONObject("total"));
			}
		}
		return map;
	}

	@Override
	public Map<String, Object> supplyIndex(Map<String, Object> paramMap) throws Exception {
		String backJson = HttpToolkit.POSTMethod(XProduction+supplyIndex, paramMap);
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.checkNotNull(backJson)){
			JSONObject jo = JSONObject.parseObject(backJson);
			if(jo.getBoolean("success")){
				map.put("companyList", jo.get("companyList"));
				map.put("pushSypplyList", jo.get("pushSypplyList"));
				map.put("categoryList", jo.get("categoryList"));
				map.put("supplyDemandCount", jo.get("supplyDemandCount"));
			}
		}
		return map;
	}

	
	@Override
	public Map<String, Object> supplyDetail(Map<String, Object> paramMap) throws Exception {
		String backJson = HttpToolkit.POSTMethod(XProduction+supplyDetail, paramMap);
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.checkNotNull(backJson)){
			JSONObject jo = JSONObject.parseObject(backJson);
			if(jo.getBoolean("success")){
				map.put("supplyDemand", jo.get("showSupplyDemand"));
				map.put("imageList", jo.get("imageList"));
			}
		}
		return map;
	}
		


}
