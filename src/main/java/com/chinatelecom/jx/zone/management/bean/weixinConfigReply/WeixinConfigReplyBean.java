package com.chinatelecom.jx.zone.management.bean.weixinConfigReply;

/***
 *** 微信自动回复设置
****/
public class WeixinConfigReplyBean {
	
	 /***
	 * 主键
	 */
	private java.math.BigDecimal replyId;
	 
	 /***
	 * 输入语（为空表示匹配任何输入语）
	 */
	private java.lang.String inputWord;
	 
	 /***
	 * 点击跳转地址
	 */
	private java.lang.String jumpUrl;
	 
	 /***
	 * 回复内容
	 */
	private java.lang.String replyWord;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	 /***
	 * 创建人
	 */
	private java.lang.String createUser;
	 
	 /***
	 * 附件（声音图片视频）url
	 */
	private java.lang.String replyAttachment;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	 
	 /***
	 * 状态
	 */
	private java.lang.Short status;
	 
	 /***
	 * 类型（NewsMsg,TextMsg）
	 */
	private java.lang.String type;
	 
	 /***
	 * 回复标题
	 */
	private java.lang.String title;
	 
	 /***
	 * 图片地址
	 */
	private java.lang.String picUrl;
	 
	 /***
	 * 关注时是否显示
	 */
	private java.lang.Short showSubscribe;
	 
	 /***
	 * 排序
	 */
	private java.lang.Short showSubscribeOrder;
	 
	protected String orderByClause;

	public WeixinConfigReplyBean(){
	}

	public WeixinConfigReplyBean(
		java.math.BigDecimal replyId
	){
		this.replyId = replyId;
	}

	 
	public void setReplyId(java.math.BigDecimal value) {
		this.replyId = value;
	}
	/***
	 * 主键
	 */
	public java.math.BigDecimal getReplyId() {
		return this.replyId;
	}
	 
	public void setInputWord(java.lang.String value) {
		this.inputWord = value;
	}
	/***
	 * 输入语（为空表示匹配任何输入语）
	 */
	public java.lang.String getInputWord() {
		return this.inputWord;
	}
	 
	public void setJumpUrl(java.lang.String value) {
		this.jumpUrl = value;
	}
	/***
	 * 点击跳转地址
	 */
	public java.lang.String getJumpUrl() {
		return this.jumpUrl;
	}
	 
	public void setReplyWord(java.lang.String value) {
		this.replyWord = value;
	}
	/***
	 * 回复内容
	 */
	public java.lang.String getReplyWord() {
		return this.replyWord;
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
	 
	public void setCreateUser(java.lang.String value) {
		this.createUser = value;
	}
	/***
	 * 创建人
	 */
	public java.lang.String getCreateUser() {
		return this.createUser;
	}
	 
	public void setReplyAttachment(java.lang.String value) {
		this.replyAttachment = value;
	}
	/***
	 * 附件（声音图片视频）url
	 */
	public java.lang.String getReplyAttachment() {
		return this.replyAttachment;
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
	 
	public void setStatus(java.lang.Short value) {
		this.status = value;
	}
	/***
	 * 状态
	 */
	public java.lang.Short getStatus() {
		return this.status;
	}
	 
	public void setType(java.lang.String value) {
		this.type = value;
	}
	/***
	 * 类型（NewsMsg,TextMsg）
	 */
	public java.lang.String getType() {
		return this.type;
	}
	 
	public void setTitle(java.lang.String value) {
		this.title = value;
	}
	/***
	 * 回复标题
	 */
	public java.lang.String getTitle() {
		return this.title;
	}
	 
	public void setPicUrl(java.lang.String value) {
		this.picUrl = value;
	}
	/***
	 * 图片地址
	 */
	public java.lang.String getPicUrl() {
		return this.picUrl;
	}
	 
	public void setShowSubscribe(java.lang.Short value) {
		this.showSubscribe = value;
	}
	/***
	 * 关注时是否显示
	 */
	public java.lang.Short getShowSubscribe() {
		return this.showSubscribe;
	}
	 
	public void setShowSubscribeOrder(java.lang.Short value) {
		this.showSubscribeOrder = value;
	}
	/***
	 * 排序
	 */
	public java.lang.Short getShowSubscribeOrder() {
		return this.showSubscribeOrder;
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

