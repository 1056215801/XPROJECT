package com.chinatelecom.jx.zone.management.bean.projectDeclare;

/***
 *** ProjectDeclareAuditlog
****/
public class ProjectDeclareAuditlogBean {
	
	 /***
	 * 主键
	 */
	private java.math.BigDecimal auditId;
	 
	 /***
	 * 申报id，外键，关联表t_project_declare_apply
	 */
	private java.math.BigDecimal applyId;
	 
	 /***
	 * 审核组织id
	 */
	private java.math.BigDecimal orgId;
	 
	 /***
	 * 审核组织名称
	 */
	private java.lang.String orgName;
	 
	 /***
	 * 审核组织类型，枚举值：1：政府 2：园区
	 */
	private java.lang.Short orgKind;
	 
	 /***
	 * 审核人ID
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 审核人名称
	 */
	private java.lang.String accountName;
	 
	 /***
	 * 状态，枚举值：0：审核未通过 1：审核已通过
	 */
	private java.lang.Short status;
	 
	 /***
	 * 审核时间
	 */
	private java.util.Date auditTime;
	/***
	 * 审核时来源组织名称
	 */
	private java.lang.String applySourceOrg;
	 
	protected String orderByClause;

	public ProjectDeclareAuditlogBean(){
	}

	public ProjectDeclareAuditlogBean(
		java.math.BigDecimal auditId
	){
		this.auditId = auditId;
	}

	 
	public void setAuditId(java.math.BigDecimal value) {
		this.auditId = value;
	}
	/***
	 * 主键
	 */
	public java.math.BigDecimal getAuditId() {
		return this.auditId;
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
	 
	public void setOrgId(java.math.BigDecimal value) {
		this.orgId = value;
	}
	/***
	 * 审核组织id
	 */
	public java.math.BigDecimal getOrgId() {
		return this.orgId;
	}
	 
	public void setOrgName(java.lang.String value) {
		this.orgName = value;
	}
	/***
	 * 审核组织名称
	 */
	public java.lang.String getOrgName() {
		return this.orgName;
	}
	 
	public void setOrgKind(java.lang.Short value) {
		this.orgKind = value;
	}
	/***
	 * 审核组织类型，枚举值：1：政府 2：园区
	 */
	public java.lang.Short getOrgKind() {
		return this.orgKind;
	}
	 
	public void setAccountId(java.math.BigDecimal value) {
		this.accountId = value;
	}
	/***
	 * 审核人ID
	 */
	public java.math.BigDecimal getAccountId() {
		return this.accountId;
	}
	 
	public void setAccountName(java.lang.String value) {
		this.accountName = value;
	}
	/***
	 * 审核人名称
	 */
	public java.lang.String getAccountName() {
		return this.accountName;
	}
	 
	public void setStatus(java.lang.Short value) {
		this.status = value;
	}
	/***
	 * 状态，枚举值：0：审核未通过 1：审核已通过
	 */
	public java.lang.Short getStatus() {
		return this.status;
	}
	 
	public void setAuditTime(java.util.Date value) {
		this.auditTime = value;
	}
	/***
	 * 审核时间
	 */
	public java.util.Date getAuditTime() {
		return this.auditTime;
	}
	
	public java.lang.String getApplySourceOrg() {
		return applySourceOrg;
	}

	public void setApplySourceOrg(java.lang.String applySourceOrg) {
		this.applySourceOrg = applySourceOrg;
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

