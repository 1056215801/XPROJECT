package com.chinatelecom.jx.zone.management.bean.projectActivity;

/***
 *** 活动投票报名表，维护管理所有针对活动的报名记录。
****/
public class ProjectActivityEnterBean {
	
	 /***
	 * 报名Id，记录主键。
	 */
	private java.math.BigDecimal enterId;
	 
	 /***
	 * 活动Id，值外键，见T_Project_Activity_Info表Activity_Id。
	 */
	private java.math.BigDecimal activityId;
	 
	 /***
	 * 报名账户，账户Id，值外键，见T_Account_Info表Account_Id。
	 */
	private java.math.BigDecimal enterAccount;
	 
	 /***
	 * 报名人名，冗余字段，值外键，见T_Account_Info表Account_Name。
	 */
	private java.lang.String enterUser;
	 
	 /***
	 * 报名时间
	 */
	private java.util.Date enterTime;
	 
	 /***
	 * 中奖序号。
	 */
	private java.lang.Integer prizeSeq;
	 
	 /***
	 * 状态，1：有效；-1：无效。
	 */
	private java.lang.Short status;
	 
	 /***
	 * 备注，内部查看。
	 */
	private java.lang.String remark;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	protected String orderByClause;
	
	/**
	 * 用户头像地址
	 */
	private String imageUrl;
	
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public ProjectActivityEnterBean(){
	}

	public ProjectActivityEnterBean(
		java.math.BigDecimal enterId
	){
		this.enterId = enterId;
	}

	 
	public void setEnterId(java.math.BigDecimal value) {
		this.enterId = value;
	}
	/***
	 * 报名Id，记录主键。
	 */
	public java.math.BigDecimal getEnterId() {
		return this.enterId;
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
	 
	public void setEnterAccount(java.math.BigDecimal value) {
		this.enterAccount = value;
	}
	/***
	 * 报名账户，账户Id，值外键，见T_Account_Info表Account_Id。
	 */
	public java.math.BigDecimal getEnterAccount() {
		return this.enterAccount;
	}
	 
	public void setEnterUser(java.lang.String value) {
		this.enterUser = value;
	}
	/***
	 * 报名人名，冗余字段，值外键，见T_Account_Info表Account_Name。
	 */
	public java.lang.String getEnterUser() {
		return this.enterUser;
	}
	 
	public void setEnterTime(java.util.Date value) {
		this.enterTime = value;
	}
	/***
	 * 报名时间
	 */
	public java.util.Date getEnterTime() {
		return this.enterTime;
	}
	 
	public void setPrizeSeq(java.lang.Integer value) {
		this.prizeSeq = value;
	}
	/***
	 * 中奖序号。
	 */
	public java.lang.Integer getPrizeSeq() {
		return this.prizeSeq;
	}
	 
	public void setStatus(java.lang.Short value) {
		this.status = value;
	}
	/***
	 * 状态，1：有效；-1：无效。
	 */
	public java.lang.Short getStatus() {
		return this.status;
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
}

