package com.chinatelecom.jx.zone.management.bean.projectActivity;

/***
 *** 活动投票举报表，维护管理所有针对活动的举报记录。
****/
public class ProjectActivityComplainBean {
	
	 /***
	 * 举报Id，记录主键。
	 */
	private java.math.BigDecimal complainId;
	 
	 /***
	 * 活动Id，值外键，见T_Project_Activity_Info表Activity_Id。
	 */
	private java.math.BigDecimal activityId;
	 
	 /***
	 * 举报账户，账户Id，值外键，见T_Account_Info表Account_Id。
	 */
	private java.math.BigDecimal submitAccount;
	 
	 /***
	 * 举报人名，冗余字段，值外键，见T_Account_Info表Account_Name。
	 */
	private java.lang.String submitUser;
	 
	 /***
	 * 举报内容。
	 */
	private java.lang.String submitContent;
	 
	 /***
	 * 举报时间
	 */
	private java.util.Date submitTime;
	 
	 /***
	 * 处理结果标识，枚举值，0：未处理；1：已处理。
	 */
	private java.lang.Short responseRst;
	 
	 /***
	 * 举报处理回复内容。
	 */
	private java.lang.String responseContent;
	 
	 /***
	 * 举报处理时间。
	 */
	private java.util.Date responseTime;
	 
	 /***
	 * 备注，内部查看。
	 */
	private java.lang.String remark;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	protected String orderByClause;

	public ProjectActivityComplainBean(){
	}

	public ProjectActivityComplainBean(
		java.math.BigDecimal complainId
	){
		this.complainId = complainId;
	}

	 
	public void setComplainId(java.math.BigDecimal value) {
		this.complainId = value;
	}
	/***
	 * 举报Id，记录主键。
	 */
	public java.math.BigDecimal getComplainId() {
		return this.complainId;
	}
	 
	public void setActivityId(java.math.BigDecimal value) {
		this.activityId = value;
	}
	/***
	 * 活动Id，值外键，见T_Project_Activity_Info表Activity_Id。
	 */
	public java.math.BigDecimal getActivityId() {
		return this.activityId;
	}
	 
	public void setSubmitAccount(java.math.BigDecimal value) {
		this.submitAccount = value;
	}
	/***
	 * 举报账户，账户Id，值外键，见T_Account_Info表Account_Id。
	 */
	public java.math.BigDecimal getSubmitAccount() {
		return this.submitAccount;
	}
	 
	public void setSubmitUser(java.lang.String value) {
		this.submitUser = value;
	}
	/***
	 * 举报人名，冗余字段，值外键，见T_Account_Info表Account_Name。
	 */
	public java.lang.String getSubmitUser() {
		return this.submitUser;
	}
	 
	public void setSubmitContent(java.lang.String value) {
		this.submitContent = value;
	}
	/***
	 * 举报内容。
	 */
	public java.lang.String getSubmitContent() {
		return this.submitContent;
	}
	 
	public void setSubmitTime(java.util.Date value) {
		this.submitTime = value;
	}
	/***
	 * 举报时间
	 */
	public java.util.Date getSubmitTime() {
		return this.submitTime;
	}
	 
	public void setResponseRst(java.lang.Short value) {
		this.responseRst = value;
	}
	/***
	 * 处理结果标识，枚举值，0：未处理；1：已处理。
	 */
	public java.lang.Short getResponseRst() {
		return this.responseRst;
	}
	 
	public void setResponseContent(java.lang.String value) {
		this.responseContent = value;
	}
	/***
	 * 举报处理回复内容。
	 */
	public java.lang.String getResponseContent() {
		return this.responseContent;
	}
	 
	public void setResponseTime(java.util.Date value) {
		this.responseTime = value;
	}
	/***
	 * 举报处理时间。
	 */
	public java.util.Date getResponseTime() {
		return this.responseTime;
	}
	 
	public void setRemark(java.lang.String value) {
		this.remark = value;
	}
	/***
	 * 备注，内部查看。
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
	
	//关联查询字段，用于页面展示
	/**
	 * 活动名称
	 */
	private String activityName;
	
	/**
	 * 活动状态
	 */
	private Short status;

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public Short getStatus() {
		return status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}
	
	
}

