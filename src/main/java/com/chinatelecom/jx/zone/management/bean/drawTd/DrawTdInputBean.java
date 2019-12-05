package com.chinatelecom.jx.zone.management.bean.drawTd;

/***
 *** 单元格与控件关系表
****/
public class DrawTdInputBean {
	
	 /***
	 * 编号
	 */
	private java.math.BigDecimal id;
	 
	 /***
	 * 单元格ID
	 */
	private java.math.BigDecimal tdId;
	 
	 /***
	 * 控件ID
	 */
	private java.math.BigDecimal inputId;
	 
	 /***
	 * 表格ID
	 */
	private java.math.BigDecimal tableId;
	 
	 /***
	 * 排序号
	 */
	private java.math.BigDecimal sortGrade;
	 
	 /***
	 * 归属园区ID
	 */
	private java.math.BigDecimal parkId;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	protected String orderByClause;

	public DrawTdInputBean(){
	}

	public DrawTdInputBean(
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
	 
	public void setTdId(java.math.BigDecimal value) {
		this.tdId = value;
	}
	/***
	 * 单元格ID
	 */
	public java.math.BigDecimal getTdId() {
		return this.tdId;
	}
	 
	public void setInputId(java.math.BigDecimal value) {
		this.inputId = value;
	}
	/***
	 * 控件ID
	 */
	public java.math.BigDecimal getInputId() {
		return this.inputId;
	}
	 
	public void setTableId(java.math.BigDecimal value) {
		this.tableId = value;
	}
	/***
	 * 表格ID
	 */
	public java.math.BigDecimal getTableId() {
		return this.tableId;
	}
	 
	public void setSortGrade(java.math.BigDecimal value) {
		this.sortGrade = value;
	}
	/***
	 * 排序号
	 */
	public java.math.BigDecimal getSortGrade() {
		return this.sortGrade;
	}
	 
	public void setParkId(java.math.BigDecimal value) {
		this.parkId = value;
	}
	/***
	 * 归属园区ID
	 */
	public java.math.BigDecimal getParkId() {
		return this.parkId;
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

