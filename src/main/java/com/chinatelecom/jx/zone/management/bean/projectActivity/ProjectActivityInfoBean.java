package com.chinatelecom.jx.zone.management.bean.projectActivity;

import java.math.BigDecimal;

/***
 *** 活动信息表，活动基本表。
****/
public class ProjectActivityInfoBean {
	
	 /***
	 * 活动Id，记录主键。
	 */
	private java.math.BigDecimal activityId;
	 
	 /***
	 * 活动名称
	 */
	private java.lang.String activityName;
	 
	 /***
	 * 活动描述
	 */
	private java.lang.String activityDescription;
	 
	 /***
	 * 活动地址
	 */
	private java.lang.String activityLocation;
	 
	 /***
	 * 活动链接地址
	 */
	private java.lang.String activityUrl;
	 
	 /***
	 * 活动海报
	 */
	private java.lang.String activityImage;
	 
	 /***
	 * 活动标签，多个标签，通过逗号风格。
	 */
	private java.lang.String activityTags;
	 
	 /***
	 * 活动二维码
	 */
	private java.lang.String qrCode;
	 
	 /***
	 * 活动开始时间，可细化到分钟。
	 */
	private java.util.Date startTime;
	 
	 /***
	 * 活动结束时间，可细化到分钟。
	 */
	private java.util.Date endTime;
	 
	 /***
	 * 活动状态，枚举值，-1：下架，人为下架；-2：结束，自然结束；0：待审；1：有效。
	 */
	private java.lang.Short status;
	 
	 /***
	 * 是否置顶，1：是置顶；0：不置顶。
	 */
	private java.lang.Short isTop;
	 
	 /***
	 * 设置置顶，联带把当前序号减去50；取消置顶，联带把当前序号加上50。
	 */
	private java.lang.Integer enterCount;
	 
	 /***
	 * 当前报名人数，默认0。
	 */
	private java.lang.String remark;
	 
	 /***
	 * 备注，内部查看信息。
	 */
	private java.math.BigDecimal createAccount;
	 
	 /***
	 * 创建账户，账户Id，值外键，见T_Account_Info表Account_Id。
	 */
	private java.lang.String createUser;
	 
	 /***
	 * 创建人名，冗余字段，值外键，见T_Account_Info表Account_Name。
	 */
	private java.lang.Integer sortGrade;
	 
	 /***
	 * 序号，越大排序越靠后。默认序号为100。
	 */
	private java.util.Date createTime;
	 
	/**
	 * 不查询项目申报正文clob字段
	 */
	private Short fastQuery;
	
	protected String orderByClause;
	
	/**
	 * 字符串型开始时间
	 */
	private String start;
	/**
	 * 字符串型结束时间
	 */
	private String end;
	/**
	 * 标签数组化
	 */
	private String[] tags;
	/**
	 * 如果查询当前用户参与活动，则用来传递当前用户id
	 */
	private BigDecimal accountId;

	public BigDecimal getAccountId() {
		return accountId;
	}

	public void setAccountId(BigDecimal accountId) {
		this.accountId = accountId;
	}

	public String[] getTags() {
		return tags;
	}

	public void setTags(String[] tags) {
		this.tags = tags;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public ProjectActivityInfoBean(){
	}

	public ProjectActivityInfoBean(
		java.math.BigDecimal activityId
	){
		this.activityId = activityId;
	}

	 
	public void setActivityId(java.math.BigDecimal value) {
		this.activityId = value;
	}
	/***
	 * 活动Id，记录主键。
	 */
	public java.math.BigDecimal getActivityId() {
		return this.activityId;
	}
	 
	public void setActivityName(java.lang.String value) {
		this.activityName = value;
	}
	/***
	 * 活动名称
	 */
	public java.lang.String getActivityName() {
		return this.activityName;
	}
	 
	public void setActivityDescription(java.lang.String value) {
		this.activityDescription = value;
	}
	/***
	 * 活动描述
	 */
	public java.lang.String getActivityDescription() {
		return this.activityDescription;
	}
	 
	public void setActivityLocation(java.lang.String value) {
		this.activityLocation = value;
	}
	/***
	 * 活动地址
	 */
	public java.lang.String getActivityLocation() {
		return this.activityLocation;
	}
	 
	public void setActivityUrl(java.lang.String value) {
		this.activityUrl = value;
	}
	/***
	 * 活动链接地址
	 */
	public java.lang.String getActivityUrl() {
		return this.activityUrl;
	}
	 
	public void setActivityImage(java.lang.String value) {
		this.activityImage = value;
	}
	/***
	 * 活动海报
	 */
	public java.lang.String getActivityImage() {
		return this.activityImage;
	}
	 
	public void setActivityTags(java.lang.String value) {
		this.activityTags = value;
	}
	/***
	 * 活动标签，多个标签，通过逗号风格。
	 */
	public java.lang.String getActivityTags() {
		return this.activityTags;
	}
	 
	public void setQrCode(java.lang.String value) {
		this.qrCode = value;
	}
	/***
	 * 活动二维码
	 */
	public java.lang.String getQrCode() {
		return this.qrCode;
	}
	 
	public void setStartTime(java.util.Date value) {
		this.startTime = value;
	}
	/***
	 * 活动开始时间，可细化到分钟。
	 */
	public java.util.Date getStartTime() {
		return this.startTime;
	}
	 
	public void setEndTime(java.util.Date value) {
		this.endTime = value;
	}
	/***
	 * 活动结束时间，可细化到分钟。
	 */
	public java.util.Date getEndTime() {
		return this.endTime;
	}
	 
	public void setStatus(java.lang.Short value) {
		this.status = value;
	}
	/***
	 * 活动状态，枚举值，-1：下架，人为下架；-2：结束，自然结束；0：待审；1：有效。
	 */
	public java.lang.Short getStatus() {
		return this.status;
	}
	 
	public void setIsTop(java.lang.Short value) {
		this.isTop = value;
	}
	/***
	 * 是否置顶，1：是置顶；0：不置顶。
	 */
	public java.lang.Short getIsTop() {
		return this.isTop;
	}
	 
	public void setEnterCount(java.lang.Integer value) {
		this.enterCount = value;
	}
	/***
	 * 设置置顶，联带把当前序号减去50；取消置顶，联带把当前序号加上50。
	 */
	public java.lang.Integer getEnterCount() {
		return this.enterCount;
	}
	 
	public void setRemark(java.lang.String value) {
		this.remark = value;
	}
	/***
	 * 当前报名人数，默认0。
	 */
	public java.lang.String getRemark() {
		return this.remark;
	}
	 
	public void setCreateAccount(java.math.BigDecimal value) {
		this.createAccount = value;
	}
	/***
	 * 备注，内部查看信息。
	 */
	public java.math.BigDecimal getCreateAccount() {
		return this.createAccount;
	}
	 
	public void setCreateUser(java.lang.String value) {
		this.createUser = value;
	}
	/***
	 * 创建账户，账户Id，值外键，见T_Account_Info表Account_Id。
	 */
	public java.lang.String getCreateUser() {
		return this.createUser;
	}
	 
	public void setSortGrade(java.lang.Integer value) {
		this.sortGrade = value;
	}
	/***
	 * 创建人名，冗余字段，值外键，见T_Account_Info表Account_Name。
	 */
	public java.lang.Integer getSortGrade() {
		return this.sortGrade;
	}
	 
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	/***
	 * 序号，越大排序越靠后。默认序号为100。
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
	
	/**
	 * status 数组
	 */
	private String[] statusArray;

	public String[] getStatusArray() {
		return statusArray;
	}

	public void setStatusArray(String[] statusArray) {
		this.statusArray = statusArray;
	}

	public Short getFastQuery() {
		return fastQuery;
	}

	public void setFastQuery(Short fastQuery) {
		this.fastQuery = fastQuery;
	}
	
	
}

