package com.chinatelecom.jx.zone.management.service.personalCenter;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.company.info.bean.CompanyInfoBean;
import com.chinatelecom.jx.zone.management.bean.ResultBean;

public interface IPersonalCenterService {
	/**
	 * 判断是否为游客用户，true：是，false：否
	 */
	public boolean isVisitor();
	
	/**
	 * 园区
	 */
	
	/**
	 * 获取游客用户园区列表
	 */
	public List<?> selectParkListForVisitor(BigDecimal parentId, BigDecimal areaId);
	
	/**
	 * 更新游客用户账号组织信息
	 */
	public int updateAccountOrganizationInfoForVisitor(Map<String, BigDecimal> paramMap);
	
	/**
	 * 根据登录的账号id查找常用园区
	 */
	public List<?> selectCommonParkListForVisitor(BigDecimal accountId);
	
	/**
	 * 删除常用园区
	 */
	public ResultBean deleteCommonParkForVisitor(BigDecimal accountId, BigDecimal organizationId);
	
	/**
	 * 插入保存常用园区
	 */
	public int insertCommonPark(BigDecimal id, BigDecimal accountId,
			BigDecimal organizationId, BigDecimal rootId);

	/**
	 * 地区列表
	 */
	public List<?> selectAllAreaListByParentIdAndAreaKind(BigDecimal parentId, short kind);
	
	/**
	 * 企业
	 */
	
	/**
	 * 查找默认企业
	 */
	public CompanyInfoBean selectDefaultCompanyForVisitor(BigDecimal accountId);
	
	
	/**
	 * 查找常用企业
	 */
	public List<?> selectCommonComanyListForVisitor(BigDecimal accountId);
	
	
	/**
	 * 保存新建企业信息
	 */
	public ResultBean saveCompanyInfoForVisitor(BigDecimal parentId, CompanyInfoBean companyInfoBean);
	
	
	/**
	 * 保存默认企业
	 */
	public ResultBean saveDefaultCompanyInfoForVisitor(BigDecimal accountId, BigDecimal companyId);
	
	/**
	 * 删除常用企业
	 */
	public ResultBean deleteCommonCompanyForVisitor(BigDecimal accountId, BigDecimal companyId);

	/**
	 * 获取地址信息
	 * @param parentId
	 */
	public ResultBean selectAreaInfo(BigDecimal parentId);
	
	/**
	 * 企业归属园区
	 */
	public List<?> parkList();
	
	/**
	 * 新版企业编辑相关方法
	 */
	public List<JSONObject> selectCompanyListByAccountId(BigDecimal accountId);

	public ResultBean updateCompanyInfo(BigDecimal parentId, CompanyInfoBean companyInfoBean);

	public ResultBean connectCompanyInfo(BigDecimal currentAccountId, BigDecimal companyId);
}
