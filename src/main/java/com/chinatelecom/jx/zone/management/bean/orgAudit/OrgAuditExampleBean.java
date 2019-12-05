package com.chinatelecom.jx.zone.management.bean.orgAudit;

/***
 *** 组织审批实例表
****/
public class OrgAuditExampleBean {
	
	 /***
	 * 主键
	 */
	private java.math.BigDecimal exampleId;
	 
	 /***
	 * 组织id，外键，关联表t_org_aduit_info
	 */
	private java.math.BigDecimal orgId;
	 
	 /***
	 * 项目id，外键，关联表t_project_declare_info
	 */
	private java.math.BigDecimal declareId;
	
	/***
	 * 项目名称
	 */
	private java.lang.String declareTitle;
	 
	 /***
	 * 组织名称
	 */
	private java.lang.String orgName;
	 
	 /***
	 * 组织类型，枚举值，0：政府 1：园区 2：企业
	 */
	private java.lang.Short orgKind;
	 
	 /***
	 * 上报截止时间
	 */
	private java.util.Date endTime;
	 
	 /***
	 * 指标个数
	 */
	private java.lang.Integer indexNum;
	 
	 /***
	 * 是否已上报上级部门，枚举值，0：否 1：是
	 */
	private java.lang.Short isReport;
	 
	 /***
	 * 状态，枚举值，0：失效 1：有效
	 */
	private java.lang.Short status;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	/***
	 * 标题
	 */
	private java.lang.String exampleTitle;
	/***
	 * 正文
	 */
	private java.lang.String exampleText;
	/***
	 * 附件
	 */
	private java.lang.String exampleAtt;
	/***
	 * 是否分配指标,枚举值：0：否 1：是
	 */
	private java.lang.Short isAllot;
	private java.lang.Short declareOpen;
	
	
	
	protected String orderByClause;

	public OrgAuditExampleBean(){
	}

	public OrgAuditExampleBean(
		java.math.BigDecimal exampleId
	){
		this.exampleId = exampleId;
	}

	 
	public void setExampleId(java.math.BigDecimal value) {
		this.exampleId = value;
	}
	/***
	 * 主键
	 */
	public java.math.BigDecimal getExampleId() {
		return this.exampleId;
	}
	 
	public void setOrgId(java.math.BigDecimal value) {
		this.orgId = value;
	}
	/***
	 * 组织id，外键，关联表t_org_aduit_info
	 */
	public java.math.BigDecimal getOrgId() {
		return this.orgId;
	}
	 
	public void setDeclareId(java.math.BigDecimal value) {
		this.declareId = value;
	}
	/***
	 * 项目id，外键，关联表t_project_declare_info
	 */
	public java.math.BigDecimal getDeclareId() {
		return this.declareId;
	}
	 
	public java.lang.String getDeclareTitle() {
		return declareTitle;
	}

	public void setDeclareTitle(java.lang.String declareTitle) {
		this.declareTitle = declareTitle;
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
	 * 组织类型，枚举值，0：政府 1：园区 2：企业
	 */
	public java.lang.Short getOrgKind() {
		return this.orgKind;
	}
	 
	public void setEndTime(java.util.Date value) {
		this.endTime = value;
	}
	/***
	 * 上报截止时间
	 */
	public java.util.Date getEndTime() {
		return this.endTime;
	}
	 
	public void setIndexNum(java.lang.Integer value) {
		this.indexNum = value;
	}
	/***
	 * 指标个数
	 */
	public java.lang.Integer getIndexNum() {
		return this.indexNum;
	}
	 
	public void setIsReport(java.lang.Short value) {
		this.isReport = value;
	}
	/***
	 * 是否已上报上级部门，枚举值，0：否 1：是
	 */
	public java.lang.Short getIsReport() {
		return this.isReport;
	}
	 
	public void setStatus(java.lang.Short value) {
		this.status = value;
	}
	/***
	 * 状态，枚举值，0：失效 1：有效
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
	
	public java.lang.String getExampleTitle() {
		return exampleTitle;
	}

	public void setExampleTitle(java.lang.String exampleTitle) {
		this.exampleTitle = exampleTitle;
	}

	public java.lang.String getExampleText() {
		return exampleText;
	}

	public void setExampleText(java.lang.String exampleText) {
		this.exampleText = exampleText;
	}

	public java.lang.String getExampleAtt() {
		return exampleAtt;
	}

	public void setExampleAtt(java.lang.String exampleAtt) {
		this.exampleAtt = exampleAtt;
	}

	public java.lang.Short getIsAllot() {
		return isAllot;
	}

	public void setIsAllot(java.lang.Short isAllot) {
		this.isAllot = isAllot;
	}

	public java.lang.Short getDeclareOpen() {
		return declareOpen;
	}

	public void setDeclareOpen(java.lang.Short declareOpen) {
		this.declareOpen = declareOpen;
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

