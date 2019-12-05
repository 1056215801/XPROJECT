package com.chinatelecom.jx.zone.management.bean.orgAudit;

/***
 *** 组织审批架构表
****/
public class OrgAuditInfoBean {
	
	 /***
	 * 主键
	 */
	private java.math.BigDecimal orgId;
	 
	 /***
	 * 组织名称
	 */
	private java.lang.String orgName;
	 
	 /***
	 * 组织类型，枚举值：0：政府 1：园区 2：企业
	 */
	private java.lang.Short orgKind;
	 
	 /***
	 * 上级组织id，外键，关联表t_org_audit_info
	 */
	private java.math.BigDecimal parentId;
	 
	 /***
	 * 上级组织名称
	 */
	private java.lang.String parentName;
	 
	 /***
	 * 上级组织类型，枚举值：0：政府 1：园区 2：企业
	 */
	private java.lang.Short parentKind;
	 
	 /***
	 * 排序等级，越大越靠后
	 */
	private java.lang.Integer sortGrade;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	 
	 /***
	 * 状态，枚举值：0：注销 1：有效
	 */
	private java.lang.Short status;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	/***
	 * 项目ID，关联查询使用
	 */
	private java.math.BigDecimal declareId;
	 
	protected String orderByClause;

	public OrgAuditInfoBean(){
	}

	public OrgAuditInfoBean(
		java.math.BigDecimal orgId
	){
		this.orgId = orgId;
	}

	 
	public void setOrgId(java.math.BigDecimal value) {
		this.orgId = value;
	}
	/***
	 * 主键
	 */
	public java.math.BigDecimal getOrgId() {
		return this.orgId;
	}
	 
	public void setOrgName(java.lang.String value) {
		this.orgName = value;
	}
	/***
	 * 组织名称
	 */
	public java.lang.String getOrgName() {
		return this.orgName;
	}
	 
	public void setOrgKind(java.lang.Short value) {
		this.orgKind = value;
	}
	/***
	 * 组织类型，枚举值：0：政府 1：园区 2：企业
	 */
	public java.lang.Short getOrgKind() {
		return this.orgKind;
	}
	 
	public void setParentId(java.math.BigDecimal value) {
		this.parentId = value;
	}
	/***
	 * 上级组织id，外键，关联表t_org_audit_info
	 */
	public java.math.BigDecimal getParentId() {
		return this.parentId;
	}
	 
	public void setParentName(java.lang.String value) {
		this.parentName = value;
	}
	/***
	 * 上级组织名称
	 */
	public java.lang.String getParentName() {
		return this.parentName;
	}
	 
	public void setParentKind(java.lang.Short value) {
		this.parentKind = value;
	}
	/***
	 * 上级组织类型，枚举值：0：政府 1：园区 2：企业
	 */
	public java.lang.Short getParentKind() {
		return this.parentKind;
	}
	 
	public void setSortGrade(java.lang.Integer value) {
		this.sortGrade = value;
	}
	/***
	 * 排序等级，越大越靠后
	 */
	public java.lang.Integer getSortGrade() {
		return this.sortGrade;
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
	 
	public void setStatus(java.lang.Short value) {
		this.status = value;
	}
	/***
	 * 状态，枚举值：0：注销 1：有效
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
	
	public java.math.BigDecimal getDeclareId() {
		return declareId;
	}

	public void setDeclareId(java.math.BigDecimal declareId) {
		this.declareId = declareId;
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

