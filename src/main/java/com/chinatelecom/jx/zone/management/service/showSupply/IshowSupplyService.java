package com.chinatelecom.jx.zone.management.service.showSupply;

import java.util.Map;

public interface IshowSupplyService {
	/**
	 * 供求保存 (审核中的商品，审核不通过的商品，由企业管理员再次编辑，然后保存提交审核)
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandSave(Map<String, Object> paramMap);
	/**
	 * 搜索供求
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandSearch(Map<String, Object> paramMap);
	/**
	 * 推荐供求
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandRecommend(Map<String, Object> paramMap);
	/**
	 * 已上架供求
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandUpList(Map<String, Object> paramMap);
	/**
	 * 已下架供求
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandDownList(Map<String, Object> paramMap);
	/**
	 * 我发布的供求
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandMyList(Map<String, Object> paramMap);
	/**
	 * 企业用户查看审核中列表供求
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandAuditList(Map<String, Object> paramMap);
	/**
	 * 审核不通过供求列表
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandNotPassedList(Map<String, Object> paramMap);
	/**
	 * 审核不通过供求详情
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandViewTemp(Map<String, Object> paramMap);
	/**
	 * 审核通过供求列表
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandAuditedList(Map<String, Object> paramMap);
	/**
	 * 待审供求列表
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandUnAuditedList(Map<String, Object> paramMap);
	/**
	 * 代理发布列表
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandAgentList(Map<String, Object> paramMap);
	/**
	 * 查看供求
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemanView(Map<String, Object> paramMap);
	/**
	 * 获取审核信息
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandShow(Map<String, Object> paramMap);
	/**
	 * 上架
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandGoUp(Map<String, Object> paramMap);
	/**
	 * 下架
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandGoDown(Map<String, Object> paramMap);
	/**
	 * 删除
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandGoDelete(Map<String, Object> paramMap);
	/**
	 * 保存审核信息（非代理商品）
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandSaveAudit(Map<String, Object> paramMap);
	/**
	 * 保存 (审核中的商品，审核不通过的商品，由企业管理员再次编辑，然后保存提交审核)
	 * @param paramMap
	 * @return
	 */
	public String getSupplyDemandSubmitToAudit(Map<String, Object> paramMap);
	
	
	/**
	 * ************************************************************************************
	 * 
	 * 									新版接口
	 * 
	 * ************************************************************************************
	 */
	
	/**
	 * 供求搜索列表
	 */
	public Map<String, Object> searchList(Map<String, Object> paramMap) throws Exception;
	
	/**
	 * 供求首页
	 */
	public Map<String, Object> supplyIndex(Map<String, Object> paramMap) throws Exception;
	
	/**
	 * 供求详情
	 */
	public Map<String, Object> supplyDetail(Map<String, Object> paramMap) throws Exception;
	
	
	
}
