package com.chinatelecom.jx.zone.management.bean.projectDeclare;

/***
 *** 在线申报表
****/
public class ProjectDeclareApplyBean {
	
	 /***
	 * 编号
	 */
	private java.math.BigDecimal applyId;
	 
	 /***
	 * 关联编号
	 */
	private java.math.BigDecimal declareId;
	 
	 /***
	 * 申请人ID
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 申请人名称
	 */
	private java.lang.String accountName;
	 
	 /***
	 * 申请企业名称
	 */
	private java.lang.String companyName;
	/***
	 * 申请企业ID
	 */
	private java.math.BigDecimal companyId;
	 
	 /***
	 * 申请人联系方式
	 */
	private java.lang.String accountTel;
	 
	 /***
	 * 附件列表，URL列表，多个URL通过半角逗号分隔。
	 */
	private java.lang.String atUrlList;
	 
	 /***
	 * 附件列表，AttachmentI_Id列表，多个Attachment_Id通过半角逗号分隔。
	 */
	private java.lang.String atIdList;
	 
	 /***
	 * 状态
	 */
	private java.lang.Short applyStatus;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	/***
	 * 审核时间
	 */
	private java.util.Date auditTime;
	 
	 /***
	 * 来源组织id
	 */
	private java.math.BigDecimal sourceOrgId;
	/***
	 * 来源组织名称
	 */
	private java.lang.String sourceOrgName;
	/***
	 * 来源组织类型
	 */
	private java.lang.Short sourceOrgKind;
	/***
	 * 推荐排序
	 */
	private java.lang.Integer sortNum;
	/***
	 * 当前审核企业id
	 */
	private java.math.BigDecimal auditOrgId;
	/***
	 * 日志表排序
	 */
	private java.lang.Integer sortNumLog;
	/***
	 * 日志表状态
	 */
	private java.lang.Short status;
	/***
	 * 日志表审核时来源组织
	 */
	private java.lang.String applySourceOrg;
	/***
	 * 关联项目名称
	 */
	private java.lang.String declareTitle;
	 
	 
	protected String orderByClause;

	public ProjectDeclareApplyBean(){
	}

	public ProjectDeclareApplyBean(
		java.math.BigDecimal applyId
	){
		this.applyId = applyId;
	}

	 
	public void setApplyId(java.math.BigDecimal value) {
		this.applyId = value;
	}
	/***
	 * 编号
	 */
	public java.math.BigDecimal getApplyId() {
		return this.applyId;
	}
	 
	public void setDeclareId(java.math.BigDecimal value) {
		this.declareId = value;
	}
	/***
	 * 关联编号
	 */
	public java.math.BigDecimal getDeclareId() {
		return this.declareId;
	}
	 
	public void setAccountId(java.math.BigDecimal value) {
		this.accountId = value;
	}
	/***
	 * 申请人ID
	 */
	public java.math.BigDecimal getAccountId() {
		return this.accountId;
	}
	 
	public void setAccountName(java.lang.String value) {
		this.accountName = value;
	}
	/***
	 * 申请人名称
	 */
	public java.lang.String getAccountName() {
		return this.accountName;
	}
	 
	public void setCompanyName(java.lang.String value) {
		this.companyName = value;
	}
	/***
	 * 申请企业名称
	 */
	public java.lang.String getCompanyName() {
		return this.companyName;
	}
	 
	public java.math.BigDecimal getCompanyId() {
		return companyId;
	}

	public void setCompanyId(java.math.BigDecimal companyId) {
		this.companyId = companyId;
	}

	public void setAccountTel(java.lang.String value) {
		this.accountTel = value;
	}
	/***
	 * 申请人联系方式
	 */
	public java.lang.String getAccountTel() {
		return this.accountTel;
	}
	 
	public void setAtUrlList(java.lang.String value) {
		this.atUrlList = value;
	}
	/***
	 * 附件列表，URL列表，多个URL通过半角逗号分隔。
	 */
	public java.lang.String getAtUrlList() {
		return this.atUrlList;
	}
	 
	public void setAtIdList(java.lang.String value) {
		this.atIdList = value;
	}
	/***
	 * 附件列表，AttachmentI_Id列表，多个Attachment_Id通过半角逗号分隔。
	 */
	public java.lang.String getAtIdList() {
		return this.atIdList;
	}
	 
	public void setApplyStatus(java.lang.Short value) {
		this.applyStatus = value;
	}
	/***
	 * 状态
	 */
	public java.lang.Short getApplyStatus() {
		return this.applyStatus;
	}
	 
	public void setRemark(java.lang.String value) {
		this.remark = value;
	}
	
	

	public java.math.BigDecimal getSourceOrgId() {
		return sourceOrgId;
	}

	public void setSourceOrgId(java.math.BigDecimal sourceOrgId) {
		this.sourceOrgId = sourceOrgId;
	}

	public java.lang.String getSourceOrgName() {
		return sourceOrgName;
	}

	public void setSourceOrgName(java.lang.String sourceOrgName) {
		this.sourceOrgName = sourceOrgName;
	}

	public java.lang.Short getSourceOrgKind() {
		return sourceOrgKind;
	}

	public void setSourceOrgKind(java.lang.Short sourceOrgKind) {
		this.sourceOrgKind = sourceOrgKind;
	}

	public java.lang.Integer getSortNum() {
		return sortNum;
	}

	public void setSortNum(java.lang.Integer sortNum) {
		this.sortNum = sortNum;
	}

	public java.math.BigDecimal getAuditOrgId() {
		return auditOrgId;
	}

	public void setAuditOrgId(java.math.BigDecimal auditOrgId) {
		this.auditOrgId = auditOrgId;
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
	 
	public void setAuditTime(java.util.Date value) {
		this.auditTime = value;
	}
	/***
	 * 审核时间
	 */
	public java.util.Date getAuditTime() {
		return this.auditTime;
	}
	
	public java.lang.Integer getSortNumLog() {
		return sortNumLog;
	}

	public void setSortNumLog(java.lang.Integer sortNumLog) {
		this.sortNumLog = sortNumLog;
	}

	public java.lang.Short getStatus() {
		return status;
	}

	public void setStatus(java.lang.Short status) {
		this.status = status;
	}

	public java.lang.String getApplySourceOrg() {
		return applySourceOrg;
	}

	public void setApplySourceOrg(java.lang.String applySourceOrg) {
		this.applySourceOrg = applySourceOrg;
	}

	public java.lang.String getDeclareTitle() {
		return declareTitle;
	}

	public void setDeclareTitle(java.lang.String declareTitle) {
		this.declareTitle = declareTitle;
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

