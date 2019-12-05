package com.chinatelecom.jx.zone.management.bean.projectDeclare;

/***
 *** ProjectDeclareOrg
****/
public class ProjectDeclareOrgBean {
	
	 /***
	 * 主键
	 */
	private java.math.BigDecimal relatedId;
	 
	 /***
	 * 外键，关联表t_project_declare_info
	 */
	private java.math.BigDecimal declareId;
	 
	 /***
	 * 组织id
	 */
	private java.math.BigDecimal orgId;
	 
	 /***
	 * 组织名称
	 */
	private java.lang.String orgName;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	protected String orderByClause;

	public ProjectDeclareOrgBean(){
	}

	public ProjectDeclareOrgBean(
		java.math.BigDecimal relatedId
	){
		this.relatedId = relatedId;
	}

	 
	public void setRelatedId(java.math.BigDecimal value) {
		this.relatedId = value;
	}
	/***
	 * 主键
	 */
	public java.math.BigDecimal getRelatedId() {
		return this.relatedId;
	}
	 
	public void setDeclareId(java.math.BigDecimal value) {
		this.declareId = value;
	}
	/***
	 * 外键，关联表t_project_declare_info
	 */
	public java.math.BigDecimal getDeclareId() {
		return this.declareId;
	}
	 
	public void setOrgId(java.math.BigDecimal value) {
		this.orgId = value;
	}
	/***
	 * 组织id
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

