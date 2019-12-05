package com.chinatelecom.jx.zone.management.bean.expBrowse;

/***
 *** ExpBrowseLog
****/
public class ExpBrowseLogBean {
	
	 /***
	 * 浏览id，主键
	 */
	private java.math.BigDecimal logId;
	 
	 /***
	 * 园区动态id，外键 见t_exp_info
	 */
	private java.math.BigDecimal expId;
	 
	 /***
	 * 类型，0：游客 1：注册用户
	 */
	private java.lang.Short type;
	 
	 /***
	 * 浏览人id
	 */
	private java.math.BigDecimal browseId;
	 
	 /***
	 * 浏览人名称
	 */
	private java.lang.String browseName;
	 
	 /***
	 * 浏览人ip
	 */
	private java.lang.String browseIp;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	protected String orderByClause;

	public ExpBrowseLogBean(){
	}

	public ExpBrowseLogBean(
		java.math.BigDecimal logId
	){
		this.logId = logId;
	}

	 
	public void setLogId(java.math.BigDecimal value) {
		this.logId = value;
	}
	/***
	 * 浏览id，主键
	 */
	public java.math.BigDecimal getLogId() {
		return this.logId;
	}
	 
	public void setExpId(java.math.BigDecimal value) {
		this.expId = value;
	}
	/***
	 * 园区动态id，外键 见t_exp_info
	 */
	public java.math.BigDecimal getExpId() {
		return this.expId;
	}
	 
	public void setType(java.lang.Short value) {
		this.type = value;
	}
	/***
	 * 类型，0：游客 1：注册用户
	 */
	public java.lang.Short getType() {
		return this.type;
	}
	 
	public void setBrowseId(java.math.BigDecimal value) {
		this.browseId = value;
	}
	/***
	 * 浏览人id
	 */
	public java.math.BigDecimal getBrowseId() {
		return this.browseId;
	}
	 
	public void setBrowseName(java.lang.String value) {
		this.browseName = value;
	}
	/***
	 * 浏览人名称
	 */
	public java.lang.String getBrowseName() {
		return this.browseName;
	}
	 
	public void setBrowseIp(java.lang.String value) {
		this.browseIp = value;
	}
	/***
	 * 浏览人ip
	 */
	public java.lang.String getBrowseIp() {
		return this.browseIp;
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
}

