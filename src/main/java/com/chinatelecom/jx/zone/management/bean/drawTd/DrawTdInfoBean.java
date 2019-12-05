package com.chinatelecom.jx.zone.management.bean.drawTd;

/***
 *** 行列信息表
****/
public class DrawTdInfoBean {
	
	 /***
	 * 编号
	 */
	private java.math.BigDecimal id;
	 
	 /***
	 * 表格ID
	 */
	private java.math.BigDecimal tableId;
	 
	 /***
	 * 单元格编号
	 */
	private java.lang.String tdNo;
	 
	 /***
	 * 行号
	 */
	private java.math.BigDecimal rowNum;
	 
	 /***
	 * 列号
	 */
	private java.math.BigDecimal colNum;
	 
	 /***
	 * 跨行数量
	 */
	private java.lang.Integer rowspanNum;
	 
	 /***
	 * 跨列数量
	 */
	private java.lang.Integer colspanNum;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	 /***
	 * 归属园区ID
	 */
	private java.math.BigDecimal parkId;
	 
	protected String orderByClause;

	public DrawTdInfoBean(){
	}

	public DrawTdInfoBean(
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
	 
	public void setTableId(java.math.BigDecimal value) {
		this.tableId = value;
	}
	/***
	 * 表格ID
	 */
	public java.math.BigDecimal getTableId() {
		return this.tableId;
	}
	 
	public void setTdNo(java.lang.String value) {
		this.tdNo = value;
	}
	/***
	 * 单元格编号
	 */
	public java.lang.String getTdNo() {
		return this.tdNo;
	}
	 
	public void setRowNum(java.math.BigDecimal value) {
		this.rowNum = value;
	}
	/***
	 * 行号
	 */
	public java.math.BigDecimal getRowNum() {
		return this.rowNum;
	}
	 
	public void setColNum(java.math.BigDecimal value) {
		this.colNum = value;
	}
	/***
	 * 列号
	 */
	public java.math.BigDecimal getColNum() {
		return this.colNum;
	}
	 
	public void setRowspanNum(java.lang.Integer value) {
		this.rowspanNum = value;
	}
	/***
	 * 跨行数量
	 */
	public java.lang.Integer getRowspanNum() {
		return this.rowspanNum;
	}
	 
	public void setColspanNum(java.lang.Integer value) {
		this.colspanNum = value;
	}
	/***
	 * 跨列数量
	 */
	public java.lang.Integer getColspanNum() {
		return this.colspanNum;
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
	 
	public void setParkId(java.math.BigDecimal value) {
		this.parkId = value;
	}
	/***
	 * 归属园区ID
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

