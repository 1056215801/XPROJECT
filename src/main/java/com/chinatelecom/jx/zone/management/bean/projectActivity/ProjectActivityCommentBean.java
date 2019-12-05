package com.chinatelecom.jx.zone.management.bean.projectActivity;

/***
 *** 活动投票评论表，维护活动投票的评论数据。
****/
public class ProjectActivityCommentBean {
	
	 /***
	 * 评论Id，记录主键。
	 */
	private java.math.BigDecimal commentId;
	 
	 /***
	 * 活动Id，值外键，见T_Project_Activity_Info表Activity_Id。
	 */
	private java.math.BigDecimal activityId;
	 
	 /***
	 * 评论账户，账户Id，值外键，见T_Account_Info表Account_Id。
	 */
	private java.math.BigDecimal commentAccount;
	 
	 /***
	 * 评论人名，冗余字段，值外键，见T_Account_Info表Account_Name。
	 */
	private java.lang.String commentUser;
	 
	 /***
	 * 评论内容
	 */
	private java.lang.String commentContent;
	 
	 /***
	 * 评论时间
	 */
	private java.util.Date commentTime;
	 
	 /***
	 * 评论针对的以往的评论Id。值外键，见T_Project_Activity_Comment表Comment_Id。
	 */
	private java.math.BigDecimal replyId;
	 
	 /***
	 * 评论针对的以往的评论账号。值外键，见T_Project_Activity_Comment表Comment_Account。
	 */
	private java.math.BigDecimal replyAccount;
	 
	 /***
	 * 评论针对的以往的评论人名。值外键，见T_Project_Activity_Comment表Comment_User。
	 */
	private java.lang.String replayUser;
	 
	 /***
	 * 备注，内部查看。
	 */
	private java.lang.String remark;
	 
	 /***
	 * 排序序号，序号越小越往前排序。
	 */
	private java.lang.Integer sortGrade;
	 
	/**
	 * 标签类型
	 */
	private  java.lang.Integer kind;
	
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	
	/***
	 * 主评论id
	 */
	private java.util.Date replyCommentId;
	 
	protected String orderByClause;

	/**
	 * 人物头像
	 */
	private String imageUrl;
	
	/**
	 * 评论时间字符串类型
	 */
	private String comTime;
	
	/**
	 * 是否为当前用户所发评论
	 */
	private String isCurComment;
	
	public String getIsCurComment() {
		return isCurComment;
	}

	public void setIsCurComment(String isCurComment) {
		this.isCurComment = isCurComment;
	}

	public String getComTime() {
		return comTime;
	}

	public void setComTime(String comTime) {
		this.comTime = comTime;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public ProjectActivityCommentBean(){
	}

	public ProjectActivityCommentBean(
		java.math.BigDecimal commentId
	){
		this.commentId = commentId;
	}

	 
	public void setCommentId(java.math.BigDecimal value) {
		this.commentId = value;
	}
	/***
	 * 评论Id，记录主键。
	 */
	public java.math.BigDecimal getCommentId() {
		return this.commentId;
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
	 
	public void setCommentAccount(java.math.BigDecimal value) {
		this.commentAccount = value;
	}
	/***
	 * 评论账户，账户Id，值外键，见T_Account_Info表Account_Id。
	 */
	public java.math.BigDecimal getCommentAccount() {
		return this.commentAccount;
	}
	 
	public void setCommentUser(java.lang.String value) {
		this.commentUser = value;
	}
	/***
	 * 评论人名，冗余字段，值外键，见T_Account_Info表Account_Name。
	 */
	public java.lang.String getCommentUser() {
		return this.commentUser;
	}
	 
	public void setCommentContent(java.lang.String value) {
		this.commentContent = value;
	}
	/***
	 * 评论内容
	 */
	public java.lang.String getCommentContent() {
		return this.commentContent;
	}
	 
	public void setCommentTime(java.util.Date value) {
		this.commentTime = value;
	}
	/***
	 * 评论时间
	 */
	public java.util.Date getCommentTime() {
		return this.commentTime;
	}
	 
	public void setReplyId(java.math.BigDecimal value) {
		this.replyId = value;
	}
	/***
	 * 评论针对的以往的评论Id。值外键，见T_Project_Activity_Comment表Comment_Id。
	 */
	public java.math.BigDecimal getReplyId() {
		return this.replyId;
	}
	 
	public void setReplyAccount(java.math.BigDecimal value) {
		this.replyAccount = value;
	}
	/***
	 * 评论针对的以往的评论账号。值外键，见T_Project_Activity_Comment表Comment_Account。
	 */
	public java.math.BigDecimal getReplyAccount() {
		return this.replyAccount;
	}
	 
	public void setReplayUser(java.lang.String value) {
		this.replayUser = value;
	}
	/***
	 * 评论针对的以往的评论人名。值外键，见T_Project_Activity_Comment表Comment_User。
	 */
	public java.lang.String getReplayUser() {
		return this.replayUser;
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
	 
	public void setSortGrade(java.lang.Integer value) {
		this.sortGrade = value;
	}
	/***
	 * 排序序号，序号越小越往前排序。
	 */
	public java.lang.Integer getSortGrade() {
		return this.sortGrade;
	}
	 
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	
	public java.lang.Integer getKind() {
		return kind;
	}

	public void setKind(java.lang.Integer kind) {
		this.kind = kind;
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

	public java.util.Date getReplyCommentId() {
		return replyCommentId;
	}

	public void setReplyCommentId(java.util.Date replyCommentId) {
		this.replyCommentId = replyCommentId;
	}
	
}

