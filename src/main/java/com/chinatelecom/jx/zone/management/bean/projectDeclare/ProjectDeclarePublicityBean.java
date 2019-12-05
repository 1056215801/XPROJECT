package com.chinatelecom.jx.zone.management.bean.projectDeclare;

/***
 *** 公示信息表
****/
public class ProjectDeclarePublicityBean {
	
	 /***
	 * 公示编号
	 */
	private java.math.BigDecimal publicityId;
	 
	 /***
	 * 关联编号
	 */
	private java.math.BigDecimal declareId;
	 
	 /***
	 * 公式单位
	 */
	private java.lang.String publicityUnit;
	 
	 /***
	 * 公示标题
	 */
	private java.lang.String publicityTitle;
	 
	 /***
	 * 公示正文
	 */
	private java.lang.String publicityText;
	 
	 /***
	 * 附件列表，URL列表，多个URL通过半角逗号分隔。
	 */
	private java.lang.String atUrlList;
	 
	 /***
	 * 附件列表，AttachmentI_Id列表，多个Attachment_Id通过半角逗号分隔。
	 */
	private java.lang.String atIdList;
	 
	 /***
	 * 公示时间
	 */
	private java.util.Date createTime;
	 
	 /***
	 * 1=已发布，0=草稿
	 */
	private java.lang.Short status;
	/**
	 * 原项目级别
	 */
	private java.lang.String declareGrade;
	/**
	 * 原项目状态
	 */
	private java.lang.Short declareStatus;
	/**
	 * 截止时间信息
	 */
	private java.lang.String endData;
	/**
	 * 组织ID，关联查询用
	 */
	private java.math.BigDecimal orgId;
	/**
	 * 项目名称
	 */
	private java.lang.String declareTitle;
	
	protected String orderByClause;

	public ProjectDeclarePublicityBean(){
	}

	public ProjectDeclarePublicityBean(
		java.math.BigDecimal publicityId
	){
		this.publicityId = publicityId;
	}

	 
	public void setPublicityId(java.math.BigDecimal value) {
		this.publicityId = value;
	}
	
	


	public java.lang.String getDeclareGrade() {
		return declareGrade;
	}

	public void setDeclareGrade(java.lang.String declareGrade) {
		this.declareGrade = declareGrade;
	}

	public java.lang.String getEndData() {
		return endData;
	}

	public void setEndData(java.lang.String endData) {
		this.endData = endData;
	}

	/***
	 * 公示编号
	 */
	public java.math.BigDecimal getPublicityId() {
		return this.publicityId;
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
	 
	public void setPublicityUnit(java.lang.String value) {
		this.publicityUnit = value;
	}
	/***
	 * 公式单位
	 */
	public java.lang.String getPublicityUnit() {
		return this.publicityUnit;
	}
	 
	public void setPublicityTitle(java.lang.String value) {
		this.publicityTitle = value;
	}
	/***
	 * 公示标题
	 */
	public java.lang.String getPublicityTitle() {
		return this.publicityTitle;
	}
	 
	public void setPublicityText(java.lang.String value) {
		this.publicityText = value;
	}
	/***
	 * 公示正文
	 */
	public java.lang.String getPublicityText() {
		return this.publicityText;
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
	 
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	/***
	 * 公示时间
	 */
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	 
	public void setStatus(java.lang.Short value) {
		this.status = value;
	}
	/***
	 * 1=已发布，0=草稿
	 */
	public java.lang.Short getStatus() {
		return this.status;
	}
	
	public java.math.BigDecimal getOrgId() {
		return orgId;
	}

	public void setOrgId(java.math.BigDecimal orgId) {
		this.orgId = orgId;
	}

	public java.lang.String getDeclareTitle() {
		return declareTitle;
	}

	public void setDeclareTitle(java.lang.String declareTitle) {
		this.declareTitle = declareTitle;
	}

	public java.lang.Short getDeclareStatus() {
		return declareStatus;
	}

	public void setDeclareStatus(java.lang.Short declareStatus) {
		this.declareStatus = declareStatus;
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

