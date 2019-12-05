package com.chinatelecom.jx.zone.management.service.logisticsInfo;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiCollectLogBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiGoodsInfoBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiSourceSearchBean;
import com.github.pagehelper.Page;

/**
 * 万佶物流
 * @author MR_WU
 *
 */
public interface IWanjiLogisticsInfoService {
	/**
	 * 车源数据数据字典
	 */
	public Map<String, List<?>> getPlatCarDict(BigDecimal[] paramId);
	
	/**
	 * 查找车源
	 */
	public ResultBean getPlatCarSource(WanjiSourceSearchBean info);
	
	/**
	 * 城市地址字典
	 */
	public List<?> getAddress(Integer parent);
	
	/**
	 * 货源数据字典
	 */
	public Map<String, List<?>> getInitCargo(BigDecimal[] paramId);

	/**
	 * 发布货源
	 */
	public ResultBean publishCargo(WanjiGoodsInfoBean wanjiGoodsInfoBean);

	/**
	 * 我的货源列表
	 */
	public ResultBean getShipperCargoes(BigDecimal[] paramId);

	/**
	 * 收藏车源详细
	 */
	public WanjiCollectLogBean selectCollectCarDetail(BigDecimal collectId);

	/**
	 * 收藏车源
	 */
	public ResultBean collectCar(WanjiCollectLogBean wanjiCollectLogBean);

	/**
	 * 取消收藏
	 */
	public ResultBean cancelCollect(BigDecimal carId, BigDecimal accountId);

	/**
	 * 我收藏车源列表
	 */
	public ResultBean collectList(BigDecimal accountId, Page<WanjiCollectLogBean> page);

	public WanjiCollectLogBean jsonObjectToBean(JSONObject jsonObject, WanjiCollectLogBean info);

	/**
	 * 推送车源
	 */
	public ResultBean getPushCarSource(WanjiSourceSearchBean wanjiSourceSearchBean,BigDecimal goodsId);

	public List<Map<String, Object>> getJSONAddress();
	
	public JSONObject getSSOLoginUrlByAccountId(Map<String, String> parameters);
	
}
