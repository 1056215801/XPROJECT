package com.chinatelecom.jx.zone.management.bean.drawTable;

/***
 *** 绘制表格信息表
****/
public class DrawTableInfoBean {
	
	 /***
	 * 编号
	 */
	private java.math.BigDecimal id;
	 
	 /***
	 * 业务名称
	 */
	private java.lang.String title;
	 
	 /***
	 * 唯一标记 用于跟业务绑定
	 */
	private java.lang.String mark;
	 
	 /***
	 * 说明
	 */
	private java.lang.String description;
	 
	 /***
	 * 总行数
	 */
	private java.lang.Integer rowNum;
	 
	 /***
	 * 总列数
	 */
	private java.lang.Integer colNum;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	 /***
	 * 创建人
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 创建人名称
	 */
	private java.lang.String accountName;
	 
	 /***
	 * 归属园区
	 */
	private java.math.BigDecimal parkId;
	 
	protected String orderByClause;

	public DrawTableInfoBean(){
	}

	public DrawTableInfoBean(
		java.math.BigDecimal id
	){
		this.id = id;
	}

	 
	public void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	/***
	 * 编号
	 */
	public java.math.BigDecimal getId() {
		return this.id;
	}
	 
	public void setTitle(java.lang.String value) {
		this.title = value;
	}
	/***
	 * 业务名称
	 */
	public java.lang.String getTitle() {
		return this.title;
	}
	 
	public void setMark(java.lang.String value) {
		this.mark = value;
	}
	/***
	 * 唯一标记 用于跟业务绑定
	 */
	public java.lang.String getMark() {
		return this.mark;
	}
	 
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	/***
	 * 说明
	 */
	public java.lang.String getDescription() {
		return this.description;
	}
	 
	public void setRowNum(java.lang.Integer value) {
		this.rowNum = value;
	}
	/***
	 * 总行数
	 */
	public java.lang.Integer getRowNum() {
		return this.rowNum;
	}
	 
	public void setColNum(java.lang.Integer value) {
		this.colNum = value;
	}
	/***
	 * 总列数
	 */
	public java.lang.Integer getColNum() {
		return this.colNum;
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
	 
	public void setAccountId(java.math.BigDecimal value) {
		this.accountId = value;
	}
	/***
	 * 创建人
	 */
	public java.math.BigDecimal getAccountId() {
		return this.accountId;
	}
	 
	public void setAccountName(java.lang.String value) {
		this.accountName = value;
	}
	/***
	 * 创建人名称
	 */
	public java.lang.String getAccountName() {
		return this.accountName;
	}
	 
	public void setParkId(java.math.BigDecimal value) {
		this.parkId = value;
	}
	/***
	 * 归属园区
	 */
	public java.math.BigDecimal getParkId() {
		return this.parkId;
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

