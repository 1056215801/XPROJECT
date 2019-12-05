package com.chinatelecom.jx.zone.management.bean.projectDeclare;

/***
 *** 项目申报日志表
****/
public class ProjectDeclareLogBean {
	
	 /***
	 * 主键
	 */
	private java.math.BigDecimal logId;
	 
	 /***
	 * 申报id，外键，关联表t_project_declare_apply
	 */
	private java.math.BigDecimal applyId;
	 
	 /***
	 * 排序
	 */
	private java.lang.Integer sortNum;
	 
	 /***
	 * 审核单位id
	 */
	private java.math.BigDecimal orgId;
	 
	 /***
	 * 审核单位名称
	 */
	private java.lang.String orgName;
	 
	 /***
	 * 审核单位类型，枚举值：0：政府 1：园区
	 */
	private java.lang.Short orgKind;
	 
	 /***
	 * 用户id
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 用户名称
	 */
	private java.lang.String accountName;
	 
	 /***
	 * 状态，枚举值：0：上报未通过 1：上报已通过 2：上报审核中
	 */
	private java.lang.Short status;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	protected String orderByClause;

	public ProjectDeclareLogBean(){
	}

	public ProjectDeclareLogBean(
		java.math.BigDecimal logId
	){
		this.logId = logId;
	}

	 
	public void setLogId(java.math.BigDecimal value) {
		this.logId = value;
	}
	/***
	 * 主键
	 */
	public java.math.BigDecimal getLogId() {
		return this.logId;
	}
	 
	public void setApplyId(java.math.BigDecimal value) {
		this.applyId = value;
	}
	/***
	 * 申报id，外键，关联表t_project_declare_apply
	 */
	public java.math.BigDecimal getApplyId() {
		return this.applyId;
	}
	 
	public void setSortNum(java.lang.Integer value) {
		this.sortNum = value;
	}
	/***
	 * 排序
	 */
	public java.lang.Integer getSortNum() {
		return this.sortNum;
	}
	 
	 
	public java.math.BigDecimal getOrgId() {
		return orgId;
	}

	public void setOrgId(java.math.BigDecimal orgId) {
		this.orgId = orgId;
	}

	public java.lang.String getOrgName() {
		return orgName;
	}

	public void setOrgName(java.lang.String orgName) {
		this.orgName = orgName;
	}

	public java.lang.Short getOrgKind() {
		return orgKind;
	}

	public void setOrgKind(java.lang.Short orgKind) {
		this.orgKind = orgKind;
	}

	public void setAccountId(java.math.BigDecimal value) {
		this.accountId = value;
	}
	/***
	 * 用户id
	 */
	public java.math.BigDecimal getAccountId() {
		return this.accountId;
	}
	 
	public void setAccountName(java.lang.String value) {
		this.accountName = value;
	}
	/***
	 * 用户名称
	 */
	public java.lang.String getAccountName() {
		return this.accountName;
	}
	 
	public void setStatus(java.lang.Short value) {
		this.status = value;
	}
	/***
	 * 状态，枚举值：0：上报未通过 1：上报已通过 2：上报审核中
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

