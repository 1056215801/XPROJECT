package com.chinatelecom.jx.zone.management.service.showProduct;

import java.util.Map;

import com.alibaba.fastjson.JSONObject;

public interface IshowProductService {
	 /**
	  * 已上架产品列表
	  */
	public String getProductUpList(Map<String, Object> paramMap);
	/**
	 * 已下架产品列表
	 */
	public String getProductDownList(Map<String, Object> paramMap);
	/**
	 * 我发布的产品列表
	 */
	public String getProductMyList(Map<String, Object> paramMap);
	/**
	 * 企业审核待办产品列表
	 */
	public String getProductAuditList(Map<String, Object> paramMap);
	/**
	 * 审核不通过产品列表
	 */
	public String getProductNotPassedList(Map<String, Object> paramMap);
	/**
	 * 已审核上架产品列表
	 */
	public String getProductAuditedList(Map<String, Object> paramMap);
	/**
	 * 园区待办审核产品列表
	 */
	public String getProductUnAuditedList(Map<String, Object> paramMap);
	/**
	 * 代理发布产品列表
	 */
	public String getProductAgentList(Map<String, Object> paramMap);
	/**
	 * 产品详情
	 */
	public String getProductView(Map<String, Object> paramMap);
	/**
	 * 产品详情（非正式产品）
	 */
	public String getProductViewForTemp(Map<String, Object> paramMap);
	/**
	 * 保存（新增商品的保存，已上架的产品编辑的保存，审核中的商品保存 ）
	 */
	public String getProductSave(Map<String, Object> paramMap);
	/**
	 * 上架产品
	 */
	public String getProductGoUp(Map<String, Object> paramMap);
	/**
	 * 下架产品
	 */
	public String getProductGoDown(Map<String, Object> paramMap);
	/**
	 * 删除产品
	 */
	public String getProductGoDelete(Map<String, Object> paramMap);
	/**
	 * 保存审核信息
	 */
	public String getProductSaveAudit(Map<String, Object> paramMap);
	/**
	 * 保存 (审核中的商品，审核不通过的商品，由企业管理员再次编辑，然后保存提交审核)
	 */
	public String getProductSubmitToAudit(Map<String, Object> paramMap);
	/**
	 * 单位（吨，个等）列表
	 */
	public String getUnitList(Map<String, Object> paramMap);
	/**
	 * 查看审核信息
	 */
	public String getProductShow(Map<String, Object> paramMap);
	/**
	 * 搜索产品
	 */
	public String getProductSearch(Map<String, Object> paramMap);
	/**
	 * 企业详情
	 */
	public String getCompanyInfoView(Map<String, Object> paramMap);
	/**
	 * 我的收藏夹
	 */
	public String getMyCollect(Map<String, Object> paramMap);
	/**
	 * 企业列表
	 */
	public String getCompanyList(Map<String, Object> paramMap);
	/**
	 * 企业搜索
	 */
	public String getCompanySearch(Map<String, Object> paramMap);
	/**
	 * 推荐企业
	 */
	public String getCompanyRecomand(Map<String, Object> paramMap);
	/**
	 * 推荐供需统计
	 */
	public String getSupplyDemandCount(Map<String, Object> paramMap);
	/**
	 * 添加到收藏夹
	 */
	public String getAddToCollect(Map<String, Object> paramMap);
	/**
	 * 从收藏夹删除
	 */
	public String getDelFromCollect(Map<String, Object> paramMap);
	/**
	 * 附件下载
	 */
	public String getAjaxGetAtts(Map<String, Object> paramMap);
	/**
	 * pc端产业对接首页同步数据
	 */
	public String getProductMainData(Map<String, Object> paramMap);
	/**
	 * 热门企业
	 */
	public String getPopCompany(Map<String, Object> paramMap);
	/**
	 * 热门商品
	 */
	public String getPopProduct(Map<String, Object> paramMap);
	
	
	/**
	 * ************************************************************************************
	 * 
	 * 									新版接口
	 * 
	 * ************************************************************************************
	 */
	
	/**
	 * 产品搜索列表
	 */
	public Map<String, Object> searchList(Map<String, Object> paramMap) throws Exception;
	
	/**
	 * 产品首页
	 */
	public Map<String, Object> productIndex(Map<String, Object> paramMap) throws Exception;
	
	/**
	 * 产品详情
	 */
	public Map<String, Object> productDetail(Map<String, Object> paramMap) throws Exception;

	public JSONObject message(Map<String, Object> paramMap) throws Exception;
	
	public JSONObject collect(Map<String, Object> paramMap) throws Exception;
	
	public JSONObject cancelCollect(Map<String, Object> paramMap) throws Exception;
	//内网 接口调用使用
	public String getProductionUrl();
	//外网 链接跳转使用
	public String getProductionUrl2();
	
	public JSONObject messageList(Map<String, Object> paramMap) throws Exception;
}
