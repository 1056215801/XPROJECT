package com.chinatelecom.jx.zone.management.bean.browseLog;

/***
 *** BrowseLogMain
****/
public class BrowseLogMainBean {
	
	 /***
	 * 主键id
	 */
	private java.math.BigDecimal id;
	 
	 /***
	 * 外键，关联id
	 */
	private java.math.BigDecimal relatedId;
	 
	 /***
	 * 日志来源，填写来源数据表名
	 */
	private java.lang.String source;
	 
	 /***
	 * 创建人id
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	
	/***
	 * 记录数
	 */
	private java.math.BigDecimal logCount;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	protected String orderByClause;

	public BrowseLogMainBean(){
	}

	public BrowseLogMainBean(
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
	 
	public void setRelatedId(java.math.BigDecimal value) {
		this.relatedId = value;
	}
	/***
	 * 外键，关联id
	 */
	public java.math.BigDecimal getRelatedId() {
		return this.relatedId;
	}
	 
	public void setSource(java.lang.String value) {
		this.source = value;
	}
	/***
	 * 日志来源，填写来源数据表名
	 */
	public java.lang.String getSource() {
		return this.source;
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
	 
	public void setRemark(java.lang.String value) {
		this.remark = value;
	}
	/***
	 * 备注
	 */
	public java.lang.String getRemark() {
		return this.remark;
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

	public java.math.BigDecimal getLogCount() {
		return logCount;
	}

	public void setLogCount(java.math.BigDecimal logCount) {
		this.logCount = logCount;
	}
}

