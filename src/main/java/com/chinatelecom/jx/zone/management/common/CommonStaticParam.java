package com.chinatelecom.jx.zone.management.common;

/**
 * 通用统一静态变量表
 * @author szc 2018-6-1
 *
 */
public class CommonStaticParam {
	/**
	 * 用户类型：国家
	 */
	public static final String ACCOUNT_TYPE_GUOJIA = "country";
	/**
	 * 用户类型：省级
	 */
	public static final String ACCOUNT_TYPE_SHENGFEN = "province";
	/**
	 * 用户类型：市级
	 */
	public static final String ACCOUNT_TYPE_DISHI = "area";
	/**
	 * 用户类型：区、县级
	 * 
	 */
	public static final String ACCOUNT_TYPE_QUXIAN = "space";
	/**
	 * 用户类型：园区
	 */
	public static final String ACCOUNT_TYPE_YUANQU = "park";
	/**
	 * 用户类型：企业
	 */
	public static final String ACCOUNT_TYPE_QIYE = "comp";
	/**
	 * 用户类型：未知
	 */
	public static final String ACCOUNT_TYPE_NONE = "none";
	
	/****************************
	 *** 区域类型 area_kind 同数据库表t_area_info
	 ****************************/
	/**
	 * 省份
	 */
	public static final String AREA_KIND_SHENG = "2";
	/**
	 * 地市
	 */
	public static final String AREA_KIND_SHI = "3";
	/**
	 * 区县
	 */
	public static final String AREA_KIND_QUXIAN = "4";
	
	/****************************************************
	 *** 组织类型 org_kind 同数据库表t_organization_info
	 ****************************************************/
	/**
	 * 区域
	 */
	public static final String ORG_KIND_AREA = "0";
	
	/**
	 * 政府
	 */
	public static final String ORG_KIND_GOV = "1";
	
	/**
	 * 园区
	 */
	public static final String ORG_KIND_PARK = "2";
	
	/**
	 * 企业
	 */
	public static final String ORG_KIND_COMP = "3";
	
	/**
	 * 部门
	 */
	public static final String ORG_KIND_DEPT = "4";
	
	/**
	 * 企业片区
	 */
	public static final String ORG_KIND_ZONE = "6";
	
	/****************************************************
	 *** 组织类型 branch_kind 同数据库表t_government_info
	 ****************************************************/
	/**
	 * 工信委
	 */
	public static final String GOV_BRANCH_KIND_GXW = "3";
}
