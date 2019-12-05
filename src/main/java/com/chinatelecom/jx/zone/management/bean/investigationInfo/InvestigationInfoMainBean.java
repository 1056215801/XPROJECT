package com.chinatelecom.jx.zone.management.bean.investigationInfo;

/***
 *** InvestigationInfoMain
****/
public class InvestigationInfoMainBean {
	
	 /***
	 * 主键id
	 */
	private java.math.BigDecimal id;
	 
	 /***
	 * 外键，关联关联模板表
	 */
	private java.math.BigDecimal formId;
	 
	 /***
	 * 调查表名
	 */
	private java.lang.String investigationName;
	 
	 /***
	 * 创建人id
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 创建人名
	 */
	private java.lang.String accountName;
	 
	 /***
	 * 二维码
	 */
	private java.lang.String qrCode;
	 
	 /***
	 * 调查表链接地址
	 */
	private java.lang.String investigationUrl;
	 
	 /***
	 * 是否可以匿名1:能 0：不能
	 */
	private java.lang.Short isanonymous;
	 
	 /***
	 * 是否查看统计结果1:能 0：不能
	 */
	private java.lang.Short iscount;
	 
	 /***
	 * 状态0：草稿、1：已发布、-1：已结束
	 */
	private java.lang.Short status;
	 
	 /***
	 * 发布时间
	 */
	private java.util.Date publishTime;
	 
	 /***
	 * 调查截止时间
	 */
	private java.util.Date endTime;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	 
	 /***
	 * 备份1
	 */
	private java.lang.String extend1;
	 
	 /***
	 * 备份2
	 */
	private java.lang.String extend2;
	 
	 /***
	 * 备份3
	 */
	private java.lang.String extend3;
	 
	protected String orderByClause;

	/**
	 * 结束时间字符串格式
	 */
	private String end;
	
	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public InvestigationInfoMainBean(){
	}

	public InvestigationInfoMainBean(
		java.math.BigDecimal id
	){
		this.id = id;
	}

	 
	public void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	/***
	 * 主键id
	 */
	public java.math.BigDecimal getId() {
		return this.id;
	}
	 
	public void setFormId(java.math.BigDecimal value) {
		this.formId = value;
	}
	/***
	 * 外键，关联关联模板表
	 */
	public java.math.BigDecimal getFormId() {
		return this.formId;
	}
	 
	public void setInvestigationName(java.lang.String value) {
		this.investigationName = value;
	}
	/***
	 * 调查表名
	 */
	public java.lang.String getInvestigationName() {
		return this.investigationName;
	}
	 
	public void setAccountId(java.math.BigDecimal value) {
		this.accountId = value;
	}
	/***
	 * 创建人id
	 */
	public java.math.BigDecimal getAccountId() {
		return this.accountId;
	}
	 
	public void setAccountName(java.lang.String value) {
		this.accountName = value;
	}
	/***
	 * 创建人名
	 */
	public java.lang.String getAccountName() {
		return this.accountName;
	}
	 
	public void setQrCode(java.lang.String value) {
		this.qrCode = value;
	}
	/***
	 * 二维码
	 */
	public java.lang.String getQrCode() {
		return this.qrCode;
	}
	 
	public void setInvestigationUrl(java.lang.String value) {
		this.investigationUrl = value;
	}
	/***
	 * 调查表链接地址
	 */
	public java.lang.String getInvestigationUrl() {
		return this.investigationUrl;
	}
	 
	public void setIsanonymous(java.lang.Short value) {
		this.isanonymous = value;
	}
	/***
	 * 是否可以匿名1:能 0：不能
	 */
	public java.lang.Short getIsanonymous() {
		return this.isanonymous;
	}
	 
	public void setIscount(java.lang.Short value) {
		this.iscount = value;
	}
	/***
	 * 是否查看统计结果1:能 0：不能
	 */
	public java.lang.Short getIscount() {
		return this.iscount;
	}
	 
	public void setStatus(java.lang.Short value) {
		this.status = value;
	}
	/***
	 * 状态0：草稿、1：已发布、-1：已结束
	 */
	public java.lang.Short getStatus() {
		return this.status;
	}
	 
	public void setPublishTime(java.util.Date value) {
		this.publishTime = value;
	}
	/***
	 * 发布时间
	 */
	public java.util.Date getPublishTime() {
		return this.publishTime;
	}
	 
	public void setEndTime(java.util.Date value) {
		this.endTime = value;
	}
	/***
	 * 调查截止时间
	 */
	public java.util.Date getEndTime() {
		return this.endTime;
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
	 
	public void setRemark(java.lang.String value) {
		this.remark = value;
	}
	/***
	 * 备注
	 */
	public java.lang.String getRemark() {
		return this.remark;
	}
	 
	public void setExtend1(java.lang.String value) {
		this.extend1 = value;
	}
	/***
	 * 备份1
	 */
	public java.lang.String getExtend1() {
		return this.extend1;
	}
	 
	public void setExtend2(java.lang.String value) {
		this.extend2 = value;
	}
	/***
	 * 备份2
	 */
	public java.lang.String getExtend2() {
		return this.extend2;
	}
	 
	public void setExtend3(java.lang.String value) {
		this.extend3 = value;
	}
	/***
	 * 备份3
	 */
	public java.lang.String getExtend3() {
		return this.extend3;
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
	
	/**
	 * status 数组
	 */
	private String[] statusArray;
	
	/**
	 * 参与人数
	 */
	private Integer totalCount;
	
	public String[] getStatusArray() {
		return statusArray;
	}

	public void setStatusArray(String[] statusArray) {
		this.statusArray = statusArray;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	
	
}

