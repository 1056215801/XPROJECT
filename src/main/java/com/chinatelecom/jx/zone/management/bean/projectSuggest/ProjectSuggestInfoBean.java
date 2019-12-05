package com.chinatelecom.jx.zone.management.bean.projectSuggest;

/***
 *** ProjectSuggestInfo
****/
public class ProjectSuggestInfoBean {
	
	 /***
	 * 主键
	 */
	private java.math.BigDecimal suggestId;
	 
	 /***
	 * 建议主题
	 */
	private java.lang.String suggestTitle;
	 
	 /***
	 * 建议内容
	 */
	private java.lang.String suggestContent;
	 
	 /***
	 * 附件ID
	 */
	private java.lang.String attachmentId;
	 
	 /***
	 * 附件URL
	 */
	private java.lang.String attachmentUrl;
	 
	 /***
	 * 用户ID，游客为-1
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 用户名称，游客为游客
	 */
	private java.lang.String accountName;
	 
	 /***
	 * 用户头像URL
	 */
	private java.lang.String accountImage;
	 
	 /***
	 * 用户联系方式
	 */
	private java.lang.String accountTel;
	 
	 /***
	 * 用户IP
	 */
	private java.lang.String accountIp;
	 
	 /***
	 * 审批人ID
	 */
	private java.math.BigDecimal managerId;
	 
	 /***
	 * 审批人姓名
	 */
	private java.lang.String manaagerName;
	 
	 /***
	 * 回复内容
	 */
	private java.lang.String replyContent;
	 
	 /***
	 * 奖励内容
	 */
	private java.lang.String rewardContent;
	 
	 /***
	 * 建议来源，枚举值 0：微门户 1：工业门户
	 */
	private java.lang.Short suggestSource;
	 
	 /***
	 * 状态，枚举值 0：未采纳 1：已采纳 2：审核中
	 */
	private java.lang.Short status;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	
	private String createTimeS;	
	private String createTimeE;
	 
	 /***
	 * 审核时间
	 */
	private java.util.Date auditTime;
	 
	 /***
	 * 备用字段1
	 */
	private java.lang.String extend1;
	 
	 /***
	 * 备用字段2
	 */
	private java.lang.String extend2;
	 
	 /***
	 * 备用字段3
	 */
	private java.lang.String extend3;
	 
	protected String orderByClause;

	public ProjectSuggestInfoBean(){
	}

	public ProjectSuggestInfoBean(
		java.math.BigDecimal suggestId
	){
		this.suggestId = suggestId;
	}

	 
	public void setSuggestId(java.math.BigDecimal value) {
		this.suggestId = value;
	}
	/***
	 * 主键
	 */
	public java.math.BigDecimal getSuggestId() {
		return this.suggestId;
	}
	 
	public void setSuggestTitle(java.lang.String value) {
		this.suggestTitle = value;
	}
	/***
	 * 建议主题
	 */
	public java.lang.String getSuggestTitle() {
		return this.suggestTitle;
	}
	 
	public void setSuggestContent(java.lang.String value) {
		this.suggestContent = value;
	}
	/***
	 * 建议内容
	 */
	public java.lang.String getSuggestContent() {
		return this.suggestContent;
	}
	 
	public void setAttachmentId(java.lang.String value) {
		this.attachmentId = value;
	}
	/***
	 * 附件ID
	 */
	public java.lang.String getAttachmentId() {
		return this.attachmentId;
	}
	 
	public void setAttachmentUrl(java.lang.String value) {
		this.attachmentUrl = value;
	}
	/***
	 * 附件URL
	 */
	public java.lang.String getAttachmentUrl() {
		return this.attachmentUrl;
	}
	 
	public void setAccountId(java.math.BigDecimal value) {
		this.accountId = value;
	}
	/***
	 * 用户ID，游客为-1
	 */
	public java.math.BigDecimal getAccountId() {
		return this.accountId;
	}
	 
	public void setAccountName(java.lang.String value) {
		this.accountName = value;
	}
	/***
	 * 用户名称，游客为游客
	 */
	public java.lang.String getAccountName() {
		return this.accountName;
	}
	 
	public void setAccountImage(java.lang.String value) {
		this.accountImage = value;
	}
	/***
	 * 用户头像URL
	 */
	public java.lang.String getAccountImage() {
		return this.accountImage;
	}
	 
	public void setAccountTel(java.lang.String value) {
		this.accountTel = value;
	}
	/***
	 * 用户联系方式
	 */
	public java.lang.String getAccountTel() {
		return this.accountTel;
	}
	 
	public void setAccountIp(java.lang.String value) {
		this.accountIp = value;
	}
	/***
	 * 用户IP
	 */
	public java.lang.String getAccountIp() {
		return this.accountIp;
	}
	 
	public void setManagerId(java.math.BigDecimal value) {
		this.managerId = value;
	}
	/***
	 * 审批人ID
	 */
	public java.math.BigDecimal getManagerId() {
		return this.managerId;
	}
	 
	public void setManaagerName(java.lang.String value) {
		this.manaagerName = value;
	}
	/***
	 * 审批人姓名
	 */
	public java.lang.String getManaagerName() {
		return this.manaagerName;
	}
	 
	public void setReplyContent(java.lang.String value) {
		this.replyContent = value;
	}
	/***
	 * 回复内容
	 */
	public java.lang.String getReplyContent() {
		return this.replyContent;
	}
	 
	public void setRewardContent(java.lang.String value) {
		this.rewardContent = value;
	}
	/***
	 * 奖励内容
	 */
	public java.lang.String getRewardContent() {
		return this.rewardContent;
	}
	 
	public void setSuggestSource(java.lang.Short value) {
		this.suggestSource = value;
	}
	/***
	 * 建议来源，枚举值 0：微门户 1：工业门户
	 */
	public java.lang.Short getSuggestSource() {
		return this.suggestSource;
	}
	 
	public void setStatus(java.lang.Short value) {
		this.status = value;
	}
	/***
	 * 状态，枚举值 0：未采纳 1：已采纳 2：审核中
	 */
	public java.lang.Short getStatus() {
		return this.status;
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
	 
	public void setAuditTime(java.util.Date value) {
		this.auditTime = value;
	}
	/***
	 * 审核时间
	 */
	public java.util.Date getAuditTime() {
		return this.auditTime;
	}
	 
	public void setExtend1(java.lang.String value) {
		this.extend1 = value;
	}
	/***
	 * 备用字段1
	 */
	public java.lang.String getExtend1() {
		return this.extend1;
	}
	 
	public void setExtend2(java.lang.String value) {
		this.extend2 = value;
	}
	/***
	 * 备用字段2
	 */
	public java.lang.String getExtend2() {
		return this.extend2;
	}
	 
	public void setExtend3(java.lang.String value) {
		this.extend3 = value;
	}
	/***
	 * 备用字段3
	 */
	public java.lang.String getExtend3() {
		return this.extend3;
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

	public String getCreateTimeS() {
		return createTimeS;
	}

	public void setCreateTimeS(String createTimeS) {
		this.createTimeS = createTimeS;
	}

	public String getCreateTimeE() {
		return createTimeE;
	}

	public void setCreateTimeE(String createTimeE) {
		this.createTimeE = createTimeE;
	}
	
}

