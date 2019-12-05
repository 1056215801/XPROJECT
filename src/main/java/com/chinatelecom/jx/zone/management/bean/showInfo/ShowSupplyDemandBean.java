package com.chinatelecom.jx.zone.management.bean.showInfo;

/***
 *** 供求主表
****/
public class ShowSupplyDemandBean {
	
	 /***
	 * 主键
	 */
	private java.math.BigDecimal id;
	 
	 /***
	 * 名称
	 */
	private java.lang.String productName;
	 
	 /***
	 * 上架时间
	 */
	private java.util.Date upTime;
	 
	 /***
	 * 创建人ID
	 */
	private java.math.BigDecimal createUserId;
	 
	 /***
	 * 创建人
	 */
	private java.lang.String createUserName;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	 /***
	 * 下架时间
	 */
	private java.util.Date downTime;
	 
	 /***
	 * 主图
	 */
	private java.lang.String picUrl;
	 
	 /***
	 * 搜索关键字
	 */
	private java.lang.String searchKeys;
	 
	 /***
	 * 1=有效（上架），0=无效(下架)，-1=已删除
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
	 * 0=求购,1=供应
	 */
	private java.lang.Short type;
	 
	 /***
	 * 分类ID(关联：t_show_sort_info)
	 */
	private java.math.BigDecimal categoryId;
	 
	 /***
	 * 是否代理
	 */
	private java.math.BigDecimal isProxy;
	 
	 /***
	 * 代理发布人Id
	 */
	private java.math.BigDecimal proxyAccountId;
	 
	 /***
	 * 代理发布人名称
	 */
	private java.lang.String proxyAccountName;
	 
	 /***
	 * 联系人
	 */
	private java.lang.String contactName;
	 
	 /***
	 * 联系电话
	 */
	private java.lang.String contactPhone;
	 
	 /***
	 * 描述
	 */
	private java.lang.String description;
	 
	 /***
	 * 更多关键字
	 */
	private java.lang.String moreKeys;
	 
	 /***
	 * 企业名称
	 */
	private java.lang.String companyName;
	 
	protected String orderByClause;

	public ShowSupplyDemandBean(){
	}

	public ShowSupplyDemandBean(
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
	 * 名称
	 */
	public java.lang.String getProductName() {
		return this.productName;
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
	 
	public void setCreateUserId(java.math.BigDecimal value) {
		this.createUserId = value;
	}
	/***
	 * 创建人ID
	 */
	public java.math.BigDecimal getCreateUserId() {
		return this.createUserId;
	}
	 
	public void setCreateUserName(java.lang.String value) {
		this.createUserName = value;
	}
	/***
	 * 创建人
	 */
	public java.lang.String getCreateUserName() {
		return this.createUserName;
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
	 
	public void setDownTime(java.util.Date value) {
		this.downTime = value;
	}
	/***
	 * 下架时间
	 */
	public java.util.Date getDownTime() {
		return this.downTime;
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
	 
	public void setSearchKeys(java.lang.String value) {
		this.searchKeys = value;
	}
	/***
	 * 搜索关键字
	 */
	public java.lang.String getSearchKeys() {
		return this.searchKeys;
	}
	 
	public void setStatus(java.lang.String value) {
		this.status = value;
	}
	/***
	 * 1=有效（上架），0=无效(下架)，-1=已删除
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
	 
	public void setType(java.lang.Short value) {
		this.type = value;
	}
	/***
	 * 0=求购,1=供应
	 */
	public java.lang.Short getType() {
		return this.type;
	}
	 
	public void setCategoryId(java.math.BigDecimal value) {
		this.categoryId = value;
	}
	/***
	 * 分类ID(关联：t_show_sort_info)
	 */
	public java.math.BigDecimal getCategoryId() {
		return this.categoryId;
	}
	 
	public void setIsProxy(java.math.BigDecimal value) {
		this.isProxy = value;
	}
	/***
	 * 是否代理
	 */
	public java.math.BigDecimal getIsProxy() {
		return this.isProxy;
	}
	 
	public void setProxyAccountId(java.math.BigDecimal value) {
		this.proxyAccountId = value;
	}
	/***
	 * 代理发布人Id
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
	 
	public void setContactName(java.lang.String value) {
		this.contactName = value;
	}
	/***
	 * 联系人
	 */
	public java.lang.String getContactName() {
		return this.contactName;
	}
	 
	public void setContactPhone(java.lang.String value) {
		this.contactPhone = value;
	}
	/***
	 * 联系电话
	 */
	public java.lang.String getContactPhone() {
		return this.contactPhone;
	}
	 
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	/***
	 * 描述
	 */
	public java.lang.String getDescription() {
		return this.description;
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
	 
	public void setCompanyName(java.lang.String value) {
		this.companyName = value;
	}
	/***
	 * 企业名称
	 */
	public java.lang.String getCompanyName() {
		return this.companyName;
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

