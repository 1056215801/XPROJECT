package com.chinatelecom.jx.zone.management.bean.investigationInfo;

import java.util.Date;

/***
 *** InvestigationInfoExample
****/
public class InvestigationInfoExampleBean {
	
	 /***
	 * 主键id
	 */
	private java.math.BigDecimal id;
	 
	 /***
	 * 外键，关联调查表
	 */
	private java.math.BigDecimal investigationId;
	 
	 /***
	 * 创建人id
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 创建人名
	 */
	private java.lang.String accountName;
	 
	 /***
	 * ip地址
	 */
	private java.lang.String ipAddress;
	 
	 /***
	 * 数据来源1：PC 2：微信 
	 */
	private java.lang.Short source;
	 
	 /***
	 * 状态1：有效 0：无效
	 */
	private java.lang.Short status;
	 
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

	public InvestigationInfoExampleBean(){
	}

	public InvestigationInfoExampleBean(
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
	 
	public void setInvestigationId(java.math.BigDecimal value) {
		this.investigationId = value;
	}
	/***
	 * 外键，关联调查表
	 */
	public java.math.BigDecimal getInvestigationId() {
		return this.investigationId;
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
	 
	public void setIpAddress(java.lang.String value) {
		this.ipAddress = value;
	}
	/***
	 * ip地址
	 */
	public java.lang.String getIpAddress() {
		return this.ipAddress;
	}
	 
	public void setSource(java.lang.Short value) {
		this.source = value;
	}
	/***
	 * 数据来源1：PC 2：微信 
	 */
	public java.lang.Short getSource() {
		return this.source;
	}
	 
	public void setStatus(java.lang.Short value) {
		this.status = value;
	}
	/***
	 * 状态1：有效 0：无效
	 */
	public java.lang.Short getStatus() {
		return this.status;
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
	 * 查询开始时间
	 */
	private String start;
	
	/**
	 * 查询结束时间
	 */
	private String end;

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}
	
	
}

