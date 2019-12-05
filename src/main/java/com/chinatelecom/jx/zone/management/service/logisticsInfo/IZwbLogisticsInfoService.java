package com.chinatelecom.jx.zone.management.service.logisticsInfo;

import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.ZwbSourceSearchBean;
import com.chinatelecom.jx.zone.management.bean.zwbPublishgoods.ZwbPublishgoodsLogBean;

public interface IZwbLogisticsInfoService {
	
	/**
	 * 根据手机号获取token值
	 * @param paramMap
	 * @return
	 */
	public String getToken(String userName);
	
	/**
	 * 发布或修改货源
	 * @param zwbPublishgoodsLogBean
	 * @return
	 */
	public ResultBean publishOrModifyGoods(ZwbPublishgoodsLogBean zwbPublishgoodsLogBean);
	
	/**
	 * 删除货源
	 * @param token
	 * @param goodsId
	 * @return
	 */
	public ResultBean delGoods(String token, Integer goodsId);
	
	/**
	 * 按照搜索条件查找货源
	 * @param info
	 * @return
	 */
	public ResultBean findGoods(ZwbSourceSearchBean info); 
	
	/**
	 * 根据货源id查询货源详情
	 * @param token
	 * @param goodsId
	 * @return
	 */
	public ResultBean findGoodsDetailById(String token, Integer goodsId);
	
	/**
	 * 按照搜索条件查找车源
	 * @param zwbGoodsSearchBean
	 * @return
	 */
	public ResultBean findCar(ZwbSourceSearchBean info);
	
	/**
	 * 收藏车源
	 * @param token
	 * @param carSourceId
	 * @return
	 */
	public ResultBean collectCar(String token, Integer carSourceId);
	
	/**
	 * 根据货源id查找本地保存的货源信息
	 * @param goodsId
	 * @return
	 */
	public ZwbPublishgoodsLogBean selectByPrimaryKey(Integer goodsId);
	
	/**
	 * 根据区域类型，父节点id获取子节点
	 * @param kind
	 * @param parent
	 * @return
	 */
	public ResultBean getAddressInfo(Short kind, Integer parent);

	public ResultBean cancelCollect(String token, Integer carSourceId);
}











