package com.chinatelecom.jx.zone.management.bean.showInfo;

/***
 *** 产品展示主表 
****/
public class ShowProductInfoBean {
	
	 /***
	 * 主键
	 */
	private java.math.BigDecimal id;
	 
	 /***
	 * 产品名称
	 */
	private java.lang.String productName;
	 
	 /***
	 * 产品描述
	 */
	private java.lang.String description;
	 
	 /***
	 * 上架时间
	 */
	private java.util.Date upTime;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	 /***
	 * 创建人ID
	 */
	private java.math.BigDecimal createUserId;
	 
	 /***
	 * 下架时间
	 */
	private java.util.Date downTime;
	 
	 /***
	 * 价格
	 */
	private java.lang.Short price;
	 
	 /***
	 * 单位
	 */
	private java.lang.Short unit;
	 
	 /***
	 * 主图URL
	 */
	private java.lang.String priceDesc;
	 
	 /***
	 * 最小订货数量
	 */
	private java.lang.Short orderNum;
	 
	 /***
	 * 库存数量
	 */
	private java.lang.Short store;
	 
	 /***
	 * 最小订货单位
	 */
	private java.lang.Short orderUnit;
	 
	 /***
	 * 关键字
	 */
	private java.lang.String searchKeys;
	 
	 /***
	 * 分类ID(关联t_show_category_info)
	 */
	private java.math.BigDecimal categoryId;
	 
	 /***
	 * 是否代理发布
	 */
	private java.lang.Short isProxy;
	 
	 /***
	 * 代理发布人ID
	 */
	private java.math.BigDecimal proxyAccountId;
	 
	 /***
	 * 代理发布人名称
	 */
	private java.lang.String proxyAccountName;
	 
	 /***
	 * 0=下架（无效），1=上架(有效)，-1=删除
	 */
	private java.lang.String status;
	 
	 /***
	 * 园区ID
	 */
	private java.math.BigDecimal parkId;
	 
	 /***
	 * 企业ID
	 */
	private java.math.BigDecimal companyId;
	 
	 /***
	 * 企业名称
	 */
	private java.lang.String companyName;
	 
	 /***
	 * 主图
	 */
	private java.lang.String picUrl;
	 
	 /***
	 * 相关产业ID(关联t_industry_park)
	 */
	private java.lang.String industryId;
	 
	 /***
	 * 更多关键字
	 */
	private java.lang.String moreKeys;
	 
	 /***
	 * 库存单位
	 */
	private java.lang.Short storeUnit;
	 
	 /***
	 * 创建人名称
	 */
	private java.lang.String createUserName;
	 
	protected String orderByClause;

	public ShowProductInfoBean(){
	}

	public ShowProductInfoBean(
		java.math.BigDecimal id
	){
		this.id = id;
	}

	 
	public void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	/***
	 * 主键
	 */
	public java.math.BigDecimal getId() {
		return this.id;
	}
	 
	public void setProductName(java.lang.String value) {
		this.productName = value;
	}
	/***
	 * 产品名称
	 */
	public java.lang.String getProductName() {
		return this.productName;
	}
	 
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	/***
	 * 产品描述
	 */
	public java.lang.String getDescription() {
		return this.description;
	}
	 
	public void setUpTime(java.util.Date value) {
		this.upTime = value;
	}
	/***
	 * 上架时间
	 */
	public java.util.Date getUpTime() {
		return this.upTime;
	}
	 
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	/***
	 * 创建时间
	 */
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	 
	public void setCreateUserId(java.math.BigDecimal value) {
		this.createUserId = value;
	}
	/***
	 * 创建人ID
	 */
	public java.math.BigDecimal getCreateUserId() {
		return this.createUserId;
	}
	 
	public void setDownTime(java.util.Date value) {
		this.downTime = value;
	}
	/***
	 * 下架时间
	 */
	public java.util.Date getDownTime() {
		return this.downTime;
	}
	 
	public void setPrice(java.lang.Short value) {
		this.price = value;
	}
	/***
	 * 价格
	 */
	public java.lang.Short getPrice() {
		return this.price;
	}
	 
	public void setUnit(java.lang.Short value) {
		this.unit = value;
	}
	/***
	 * 单位
	 */
	public java.lang.Short getUnit() {
		return this.unit;
	}
	 
	public void setPriceDesc(java.lang.String value) {
		this.priceDesc = value;
	}
	/***
	 * 主图URL
	 */
	public java.lang.String getPriceDesc() {
		return this.priceDesc;
	}
	 
	public void setOrderNum(java.lang.Short value) {
		this.orderNum = value;
	}
	/***
	 * 最小订货数量
	 */
	public java.lang.Short getOrderNum() {
		return this.orderNum;
	}
	 
	public void setStore(java.lang.Short value) {
		this.store = value;
	}
	/***
	 * 库存数量
	 */
	public java.lang.Short getStore() {
		return this.store;
	}
	 
	public void setOrderUnit(java.lang.Short value) {
		this.orderUnit = value;
	}
	/***
	 * 最小订货单位
	 */
	public java.lang.Short getOrderUnit() {
		return this.orderUnit;
	}
	 
	public void setSearchKeys(java.lang.String value) {
		this.searchKeys = value;
	}
	/***
	 * 关键字
	 */
	public java.lang.String getSearchKeys() {
		return this.searchKeys;
	}
	 
	public void setCategoryId(java.math.BigDecimal value) {
		this.categoryId = value;
	}
	/***
	 * 分类ID(关联t_show_category_info)
	 */
	public java.math.BigDecimal getCategoryId() {
		return this.categoryId;
	}
	 
	public void setIsProxy(java.lang.Short value) {
		this.isProxy = value;
	}
	/***
	 * 是否代理发布
	 */
	public java.lang.Short getIsProxy() {
		return this.isProxy;
	}
	 
	public void setProxyAccountId(java.math.BigDecimal value) {
		this.proxyAccountId = value;
	}
	/***
	 * 代理发布人ID
	 */
	public java.math.BigDecimal getProxyAccountId() {
		return this.proxyAccountId;
	}
	 
	public void setProxyAccountName(java.lang.String value) {
		this.proxyAccountName = value;
	}
	/***
	 * 代理发布人名称
	 */
	public java.lang.String getProxyAccountName() {
		return this.proxyAccountName;
	}
	 
	public void setStatus(java.lang.String value) {
		this.status = value;
	}
	/***
	 * 0=下架（无效），1=上架(有效)，-1=删除
	 */
	public java.lang.String getStatus() {
		return this.status;
	}
	 
	public void setParkId(java.math.BigDecimal value) {
		this.parkId = value;
	}
	/***
	 * 园区ID
	 */
	public java.math.BigDecimal getParkId() {
		return this.parkId;
	}
	 
	public void setCompanyId(java.math.BigDecimal value) {
		this.companyId = value;
	}
	/***
	 * 企业ID
	 */
	public java.math.BigDecimal getCompanyId() {
		return this.companyId;
	}
	 
	public void setCompanyName(java.lang.String value) {
		this.companyName = value;
	}
	/***
	 * 企业名称
	 */
	public java.lang.String getCompanyName() {
		return this.companyName;
	}
	 
	public void setPicUrl(java.lang.String value) {
		this.picUrl = value;
	}
	/***
	 * 主图
	 */
	public java.lang.String getPicUrl() {
		return this.picUrl;
	}
	 
	public void setIndustryId(java.lang.String value) {
		this.industryId = value;
	}
	/***
	 * 相关产业ID(关联t_industry_park)
	 */
	public java.lang.String getIndustryId() {
		return this.industryId;
	}
	 
	public void setMoreKeys(java.lang.String value) {
		this.moreKeys = value;
	}
	/***
	 * 更多关键字
	 */
	public java.lang.String getMoreKeys() {
		return this.moreKeys;
	}
	 
	public void setStoreUnit(java.lang.Short value) {
		this.storeUnit = value;
	}
	/***
	 * 库存单位
	 */
	public java.lang.Short getStoreUnit() {
		return this.storeUnit;
	}
	 
	public void setCreateUserName(java.lang.String value) {
		this.createUserName = value;
	}
	/***
	 * 创建人名称
	 */
	public java.lang.String getCreateUserName() {
		return this.createUserName;
	}
	
	/***
	*  排序
	*/
	public String getOrderByClause() {
		return orderByClause;
	}
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}
}

