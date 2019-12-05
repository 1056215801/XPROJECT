package com.chinatelecom.jx.zone.management.bean.zwbPublishgoods;

/***
 *** ZwbPublishgoodsLog
****/
public class ZwbPublishgoodsLogBean {
	
	 /***
	 * 货源id
	 */
	private java.lang.Integer goodsId;
	 
	 /***
	 * 账户id
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 组织id
	 */
	private java.math.BigDecimal organizationId;
	 
	 /***
	 * 货源类型
	 */
	private java.lang.Short goodsTypeId;
	 
	 /***
	 * 货源名称
	 */
	private java.lang.String goodsName;
	 
	 /***
	 * 货源重量
	 */
	private java.lang.Integer goodsWeight;
	 
	 /***
	 * 运费总价
	 */
	private java.math.BigDecimal totalPrice;
	 
	 /***
	 * 配送方式，零担填0，整车填1
	 */
	private java.lang.Short sendType;
	 
	 /***
	 * 装货时间，不填写默认当前时间，格式：yyyy-MM-dd
	 */
	private java.util.Date loadTime;
	 
	 /***
	 * 发货地址
	 */
	private java.lang.Integer beginAreaId;
	 
	 /***
	 * 发货详细地址
	 */
	private java.lang.String beginDetailAddress;
	 
	 /***
	 * 发货联系人电话
	 */
	private java.lang.String beginContacts;
	 
	 /***
	 * 收货地址
	 */
	private java.lang.Integer endAreaId;
	 
	 /***
	 * 收货详细地址
	 */
	private java.lang.String endDetailAddress;
	 
	 /***
	 * 收货联系人电话
	 */
	private java.lang.String endContacts;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	protected String orderByClause;

	/**
	 * 地址id数组
	 */
	private Integer[] beginAreaIds; 
	
	private Integer[] endAreaIds; 

	/**
	 * 接口token参数
	 */
	private String token;
	
	/**
	 * 装货时间String
	 */
	private String loadTimeStr;

	public java.lang.Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(java.lang.Integer goodsId) {
		this.goodsId = goodsId;
	}

	public java.math.BigDecimal getAccountId() {
		return accountId;
	}

	public void setAccountId(java.math.BigDecimal accountId) {
		this.accountId = accountId;
	}

	public java.math.BigDecimal getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(java.math.BigDecimal organizationId) {
		this.organizationId = organizationId;
	}

	public java.lang.Short getGoodsTypeId() {
		return goodsTypeId;
	}

	public void setGoodsTypeId(java.lang.Short goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
	}

	public java.lang.String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(java.lang.String goodsName) {
		this.goodsName = goodsName;
	}

	public java.lang.Integer getGoodsWeight() {
		return goodsWeight;
	}

	public void setGoodsWeight(java.lang.Integer goodsWeight) {
		this.goodsWeight = goodsWeight;
	}

	public java.math.BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(java.math.BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

	public java.lang.Short getSendType() {
		return sendType;
	}

	public void setSendType(java.lang.Short sendType) {
		this.sendType = sendType;
	}

	public java.util.Date getLoadTime() {
		return loadTime;
	}

	public void setLoadTime(java.util.Date loadTime) {
		this.loadTime = loadTime;
	}

	public java.lang.Integer getBeginAreaId() {
		return beginAreaId;
	}

	public void setBeginAreaId(java.lang.Integer beginAreaId) {
		this.beginAreaId = beginAreaId;
	}

	public java.lang.String getBeginDetailAddress() {
		return beginDetailAddress;
	}

	public void setBeginDetailAddress(java.lang.String beginDetailAddress) {
		this.beginDetailAddress = beginDetailAddress;
	}

	public java.lang.String getBeginContacts() {
		return beginContacts;
	}

	public void setBeginContacts(java.lang.String beginContacts) {
		this.beginContacts = beginContacts;
	}

	public java.lang.Integer getEndAreaId() {
		return endAreaId;
	}

	public void setEndAreaId(java.lang.Integer endAreaId) {
		this.endAreaId = endAreaId;
	}

	public java.lang.String getEndDetailAddress() {
		return endDetailAddress;
	}

	public void setEndDetailAddress(java.lang.String endDetailAddress) {
		this.endDetailAddress = endDetailAddress;
	}

	public java.lang.String getEndContacts() {
		return endContacts;
	}

	public void setEndContacts(java.lang.String endContacts) {
		this.endContacts = endContacts;
	}

	public java.lang.String getRemark() {
		return remark;
	}

	public void setRemark(java.lang.String remark) {
		this.remark = remark;
	}

	public java.util.Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}

	public String getOrderByClause() {
		return orderByClause;
	}

	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	public Integer[] getBeginAreaIds() {
		return beginAreaIds;
	}

	public void setBeginAreaIds(Integer[] beginAreaIds) {
		this.beginAreaIds = beginAreaIds;
	}

	public Integer[] getEndAreaIds() {
		return endAreaIds;
	}

	public void setEndAreaIds(Integer[] endAreaIds) {
		this.endAreaIds = endAreaIds;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getLoadTimeStr() {
		return loadTimeStr;
	}

	public void setLoadTimeStr(String loadTimeStr) {
		this.loadTimeStr = loadTimeStr;
	}

	
	
}

