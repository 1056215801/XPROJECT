package com.chinatelecom.jx.zone.management.bean.statisticsInve;

import java.util.Date;

/***
 *** StatisticsInveInfo
****/
public class StatisticsInveInfoBean {
	
	 /***
	 * 编号ID
	 */
	private java.math.BigDecimal id;
	 
	 /***
	 * 调查ID
	 */
	private java.math.BigDecimal investigationId;
	 
	 /***
	 * 模板ID
	 */
	private java.math.BigDecimal formId;
	 
	 /***
	 * 数据总量
	 */
	private java.lang.Short countExampleSum;
	 
	 /***
	 * PC端数据量
	 */
	private java.lang.Short countExamplePc;
	 
	 /***
	 * 移动端数据量
	 */
	private java.lang.Short countExampleWx;
	 
	 /***
	 * 浏览量
	 */
	private java.lang.Short countBrowse;
	 
	 /***
	 * 日期
	 */
	private java.lang.String createday;
	 
	 /***
	 * 填写率
	 */
	private java.lang.String examplePrc;
	 
	 /***
	 * 处理时间
	 */
	private java.util.Date updateDate;
	 
	protected String orderByClause;

	public StatisticsInveInfoBean(){
	}

	public StatisticsInveInfoBean(
		java.math.BigDecimal id
	){
		this.id = id;
	}

	 
	public void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	/***
	 * 编号ID
	 */
	public java.math.BigDecimal getId() {
		return this.id;
	}
	 
	public void setInvestigationId(java.math.BigDecimal value) {
		this.investigationId = value;
	}
	/***
	 * 调查ID
	 */
	public java.math.BigDecimal getInvestigationId() {
		return this.investigationId;
	}
	 
	public void setFormId(java.math.BigDecimal value) {
		this.formId = value;
	}
	/***
	 * 模板ID
	 */
	public java.math.BigDecimal getFormId() {
		return this.formId;
	}
	 
	public void setCountExampleSum(java.lang.Short value) {
		this.countExampleSum = value;
	}
	/***
	 * 数据总量
	 */
	public java.lang.Short getCountExampleSum() {
		return this.countExampleSum;
	}
	 
	public void setCountExamplePc(java.lang.Short value) {
		this.countExamplePc = value;
	}
	/***
	 * PC端数据量
	 */
	public java.lang.Short getCountExamplePc() {
		return this.countExamplePc;
	}
	 
	public void setCountExampleWx(java.lang.Short value) {
		this.countExampleWx = value;
	}
	/***
	 * 移动端数据量
	 */
	public java.lang.Short getCountExampleWx() {
		return this.countExampleWx;
	}
	 
	public void setCountBrowse(java.lang.Short value) {
		this.countBrowse = value;
	}
	/***
	 * 浏览量
	 */
	public java.lang.Short getCountBrowse() {
		return this.countBrowse;
	}
	 
	public void setCreateday(java.lang.String value) {
		this.createday = value;
	}
	/***
	 * 日期
	 */
	public java.lang.String getCreateday() {
		return this.createday;
	}
	 
	public void setExamplePrc(java.lang.String value) {
		this.examplePrc = value;
	}
	/***
	 * 填写率
	 */
	public java.lang.String getExamplePrc() {
		return this.examplePrc;
	}
	 
	public void setUpdateDate(java.util.Date value) {
		this.updateDate = value;
	}
	/***
	 * 处理时间
	 */
	public java.util.Date getUpdateDate() {
		return this.updateDate;
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

