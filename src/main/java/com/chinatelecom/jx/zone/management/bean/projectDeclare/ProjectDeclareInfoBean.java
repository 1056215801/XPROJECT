package com.chinatelecom.jx.zone.management.bean.projectDeclare;

import java.math.BigDecimal;

/***
 *** 项目申报主表 2019.4.20优化关于clob字段查询缓慢问题 增加fastQuery
 ****/
public class ProjectDeclareInfoBean {
	/***
	 * 编号
	 */
	private java.math.BigDecimal declareId;

	/***
	 * 模板ID
	 */
	private java.math.BigDecimal templateId;

	/***
	 * 项目标题
	 */
	private java.lang.String declareTitle;

	/***
	 * 批次
	 */
	private java.lang.String declareBatch;

	/***
	 * 项目级别
	 */
	private java.lang.String declareGrade;

	/***
	 * 状态，枚举值，需完善定义。
	 */
	private java.lang.Short declareStatus;

	/***
	 * 主管单位
	 */
	private java.lang.String supervisorName;

	/***
	 * 主管单位Id
	 */
	private java.math.BigDecimal supervisorId;

	/***
	 * 项目正文
	 */
	private java.lang.String declareText;

	/***
	 * 附件列表，URL列表，多个URL通过半角逗号分隔。
	 */
	private java.lang.String atUrlList;

	/***
	 * 附件列表，AttachmentI_Id列表，多个Attachment_Id通过半角逗号分隔。
	 */
	private java.lang.String atIdList;

	/**
	 * 是否宜春定制申报
	 */
	private java.lang.Short applyYc;

	/***
	 * 是否允许在线申报，枚举值，1：是，0：否。
	 */
	private java.lang.Short applyOnline;

	/***
	 * 是否允许查看申报进度，枚举值，1：是；0：否。
	 */
	private java.lang.Short scheduleOpen;

	/***
	 * 公示信息是否公开，枚举值，1：是，0：否。
	 */
	private java.lang.Short publicityOpen;

	/***
	 * 项目图片Id
	 */
	private java.math.BigDecimal declareImageId;

	/***
	 * 创建人ID
	 */
	private java.math.BigDecimal accountId;

	/***
	 * 创建人姓名
	 */
	private java.lang.String accountName;

	/***
	 * 已申报企业数
	 */
	private java.lang.Integer applyCount;

	/***
	 * 截止时间
	 */
	private java.lang.String endDate;

	/***
	 * 创建时间
	 */
	private java.util.Date createTime;

	/***
	 * 备注
	 */
	private java.lang.String declareRemark;

	/***
	 * 项目图片
	 */
	private java.lang.String declareImage;

	/***
	 * 是否发过公示
	 */
	private java.lang.String isPublicity;

	/***
	 * 是否推荐
	 */
	private java.lang.String isRecommend;

	/***
	 * 创建时间(字符串格式)
	 */
	private java.lang.String createTimeStr;

	/***
	 * 待审核申报数
	 */
	private java.lang.Integer auditingApplyCount;

	/***
	 * 已通过申报数
	 */
	private java.lang.Integer auditedApplyCount;

	/***
	 * 二维码
	 */
	private java.lang.String qrCode;

	/***
	 * 是否分配指标,枚举值：0：否 1：是
	 */
	private java.lang.Short isAllot;

	/***
	 * 指标总数
	 */
	private java.lang.Integer indexCount;

	/***
	 * 是否公开,枚举值：0：否 1：是
	 */
	private java.lang.Short declareOpen;

	/**
	 * 当前组织ID，关联查询字段
	 */
	private java.math.BigDecimal orgId;

	/**
	 * 当前地市ID
	 */
	private java.math.BigDecimal areaId;

	/**
	 * 当前地市名称
	 */
	private java.lang.String areaName;

	/**
	 * 当前地市名称
	 */
	private BigDecimal[] areaIdArray;

	/**
	 * 不查询项目申报正文clob字段
	 */
	private Short fastQuery;
	
	protected String orderByClause;

	public ProjectDeclareInfoBean() {
	}

	public ProjectDeclareInfoBean(java.math.BigDecimal declareId) {
		this.declareId = declareId;
	}

	public void setDeclareId(java.math.BigDecimal value) {
		this.declareId = value;
	}

	public java.lang.Short getDeclareOpen() {
		return declareOpen;
	}

	public void setDeclareOpen(java.lang.Short declareOpen) {
		this.declareOpen = declareOpen;
	}

	public java.lang.Integer getAuditingApplyCount() {
		return auditingApplyCount;
	}

	public void setAuditingApplyCount(java.lang.Integer auditingApplyCount) {
		this.auditingApplyCount = auditingApplyCount;
	}

	public java.lang.Integer getAuditedApplyCount() {
		return auditedApplyCount;
	}

	public void setAuditedApplyCount(java.lang.Integer auditedApplyCount) {
		this.auditedApplyCount = auditedApplyCount;
	}

	public java.lang.String getQrCode() {
		return qrCode;
	}

	public void setQrCode(java.lang.String qrCode) {
		this.qrCode = qrCode;
	}

	/***
	 * 编号
	 */
	public java.math.BigDecimal getDeclareId() {
		return this.declareId;
	}

	public void setTemplateId(java.math.BigDecimal value) {
		this.templateId = value;
	}

	/***
	 * 模板ID
	 */
	public java.math.BigDecimal getTemplateId() {
		return this.templateId;
	}

	public void setDeclareTitle(java.lang.String value) {
		this.declareTitle = value;
	}

	/***
	 * 项目标题
	 */
	public java.lang.String getDeclareTitle() {
		return this.declareTitle;
	}

	public void setDeclareBatch(java.lang.String value) {
		this.declareBatch = value;
	}

	/***
	 * 批次
	 */
	public java.lang.String getDeclareBatch() {
		return this.declareBatch;
	}

	public void setDeclareGrade(java.lang.String value) {
		this.declareGrade = value;
	}

	/***
	 * 项目级别
	 */
	public java.lang.String getDeclareGrade() {
		return this.declareGrade;
	}

	public void setDeclareStatus(java.lang.Short value) {
		this.declareStatus = value;
	}

	/***
	 * 状态，枚举值，需完善定义。
	 */
	public java.lang.Short getDeclareStatus() {
		return this.declareStatus;
	}

	public void setSupervisorName(java.lang.String value) {
		this.supervisorName = value;
	}

	/***
	 * 主管单位
	 */
	public java.lang.String getSupervisorName() {
		return this.supervisorName;
	}

	public java.math.BigDecimal getSupervisorId() {
		return supervisorId;
	}

	public void setSupervisorId(java.math.BigDecimal supervisorId) {
		this.supervisorId = supervisorId;
	}

	public void setDeclareText(java.lang.String value) {
		this.declareText = value;
	}

	/***
	 * 项目正文
	 */
	public java.lang.String getDeclareText() {
		return this.declareText;
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

	public void setApplyOnline(java.lang.Short value) {
		this.applyOnline = value;
	}

	/***
	 * 是否允许在线申报，枚举值，1：是，0：否。
	 */
	public java.lang.Short getApplyOnline() {
		return this.applyOnline;
	}

	public void setScheduleOpen(java.lang.Short value) {
		this.scheduleOpen = value;
	}

	/***
	 * 是否允许查看申报进度，枚举值，1：是；0：否。
	 */
	public java.lang.Short getScheduleOpen() {
		return this.scheduleOpen;
	}

	public void setPublicityOpen(java.lang.Short value) {
		this.publicityOpen = value;
	}

	/***
	 * 公示信息是否公开，枚举值，1：是，0：否。
	 */
	public java.lang.Short getPublicityOpen() {
		return this.publicityOpen;
	}

	public void setAccountId(java.math.BigDecimal value) {
		this.accountId = value;
	}

	/***
	 * 创建人ID
	 */
	public java.math.BigDecimal getAccountId() {
		return this.accountId;
	}

	public void setAccountName(java.lang.String value) {
		this.accountName = value;
	}

	/***
	 * 创建人姓名
	 */
	public java.lang.String getAccountName() {
		return this.accountName;
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

	public java.lang.Integer getApplyCount() {
		return applyCount;
	}

	public void setApplyCount(java.lang.Integer applyCount) {
		this.applyCount = applyCount;
	}

	public java.lang.String getEndDate() {
		return endDate;
	}

	public void setEndDate(java.lang.String endDate) {
		this.endDate = endDate;
	}

	public java.lang.String getDeclareRemark() {
		return declareRemark;
	}

	public void setDeclareRemark(java.lang.String declareRemark) {
		this.declareRemark = declareRemark;
	}

	public java.lang.String getDeclareImage() {
		return declareImage;
	}

	public void setDeclareImage(java.lang.String declareImage) {
		this.declareImage = declareImage;
	}

	public java.lang.String getIsRecommend() {
		return isRecommend;
	}

	public void setIsRecommend(java.lang.String isRecommend) {
		this.isRecommend = isRecommend;
	}

	public java.lang.String getIsPublicity() {
		return isPublicity;
	}

	public void setIsPublicity(java.lang.String isPublicity) {
		this.isPublicity = isPublicity;
	}

	public java.lang.String getCreateTimeStr() {
		return createTimeStr;
	}

	public void setCreateTimeStr(java.lang.String createTimeStr) {
		this.createTimeStr = createTimeStr;
	}

	public java.lang.Short getIsAllot() {
		return isAllot;
	}

	public void setIsAllot(java.lang.Short isAllot) {
		this.isAllot = isAllot;
	}

	public java.lang.Integer getIndexCount() {
		return indexCount;
	}

	public void setIndexCount(java.lang.Integer indexCount) {
		this.indexCount = indexCount;
	}

	public java.math.BigDecimal getOrgId() {
		return orgId;
	}

	public void setOrgId(java.math.BigDecimal orgId) {
		this.orgId = orgId;
	}

	public java.math.BigDecimal getDeclareImageId() {
		return declareImageId;
	}

	public void setDeclareImageId(java.math.BigDecimal declareImageId) {
		this.declareImageId = declareImageId;
	}

	public java.math.BigDecimal getAreaId() {
		return areaId;
	}

	public void setAreaId(java.math.BigDecimal areaId) {
		this.areaId = areaId;
	}

	public java.lang.String getAreaName() {
		return areaName;
	}

	public void setAreaName(java.lang.String areaName) {
		this.areaName = areaName;
	}

	public BigDecimal[] getAreaIdArray() {
		return areaIdArray;
	}

	public void setAreaIdArray(BigDecimal[] areaIdArray) {
		this.areaIdArray = areaIdArray;
	}

	/***
	 * 排序
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	public java.lang.Short getApplyYc() {
		return applyYc;
	}

	public void setApplyYc(java.lang.Short applyYc) {
		this.applyYc = applyYc;
	}

	public Short getFastQuery() {
		return fastQuery;
	}

	public void setFastQuery(Short fastQuery) {
		this.fastQuery = fastQuery;
	}
}
