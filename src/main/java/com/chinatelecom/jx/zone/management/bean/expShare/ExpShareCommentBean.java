package com.chinatelecom.jx.zone.management.bean.expShare;

/***
 *** ExpShareComment
****/
public class ExpShareCommentBean {
	
	 /***
	 * 评论id，主键
	 */
	private java.math.BigDecimal commentId;
	 
	 /***
	 * 园区动态id，外键 见t_exp_info
	 */
	private java.math.BigDecimal expId;
	 
	 /***
	 * 评论用户id
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 评论用户名称
	 */
	private java.lang.String accountName;
	 
	 /***
	 * 评论内容
	 */
	private java.lang.String commentText;
	 
	 /***
	 * 回复的评论id，外键 见t_exp_comment
	 */
	private java.math.BigDecimal replyCommentId;
	 
	 /***
	 * 回复评论用户id，外键 见t_exp_comment
	 */
	private java.math.BigDecimal replyAccountId;
	 
	 /***
	 * 回复评论用户名称，外键 见t_exp_comment
	 */
	private java.lang.String replyAccountName;
	 
	 /***
	 * 是否匿名评论 0：否 1：是
	 */
	private java.lang.Short isAnonymous;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	protected String orderByClause;

	public ExpShareCommentBean(){
	}

	public ExpShareCommentBean(
		java.math.BigDecimal commentId
	){
		this.commentId = commentId;
	}

	 
	public void setCommentId(java.math.BigDecimal value) {
		this.commentId = value;
	}
	/***
	 * 评论id，主键
	 */
	public java.math.BigDecimal getCommentId() {
		return this.commentId;
	}
	 
	public void setExpId(java.math.BigDecimal value) {
		this.expId = value;
	}
	/***
	 * 园区动态id，外键 见t_exp_info
	 */
	public java.math.BigDecimal getExpId() {
		return this.expId;
	}
	 
	public void setAccountId(java.math.BigDecimal value) {
		this.accountId = value;
	}
	/***
	 * 评论用户id
	 */
	public java.math.BigDecimal getAccountId() {
		return this.accountId;
	}
	 
	public void setAccountName(java.lang.String value) {
		this.accountName = value;
	}
	/***
	 * 评论用户名称
	 */
	public java.lang.String getAccountName() {
		return this.accountName;
	}
	 
	public void setCommentText(java.lang.String value) {
		this.commentText = value;
	}
	/***
	 * 评论内容
	 */
	public java.lang.String getCommentText() {
		return this.commentText;
	}
	 
	public void setReplyCommentId(java.math.BigDecimal value) {
		this.replyCommentId = value;
	}
	/***
	 * 回复的评论id，外键 见t_exp_comment
	 */
	public java.math.BigDecimal getReplyCommentId() {
		return this.replyCommentId;
	}
	 
	public void setReplyAccountId(java.math.BigDecimal value) {
		this.replyAccountId = value;
	}
	/***
	 * 回复评论用户id，外键 见t_exp_comment
	 */
	public java.math.BigDecimal getReplyAccountId() {
		return this.replyAccountId;
	}
	 
	public void setReplyAccountName(java.lang.String value) {
		this.replyAccountName = value;
	}
	/***
	 * 回复评论用户名称，外键 见t_exp_comment
	 */
	public java.lang.String getReplyAccountName() {
		return this.replyAccountName;
	}
	 
	public void setIsAnonymous(java.lang.Short value) {
		this.isAnonymous = value;
	}
	/***
	 * 是否匿名评论 0：否 1：是
	 */
	public java.lang.Short getIsAnonymous() {
		return this.isAnonymous;
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

