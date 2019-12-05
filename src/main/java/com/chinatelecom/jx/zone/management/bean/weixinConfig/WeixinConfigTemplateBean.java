package com.chinatelecom.jx.zone.management.bean.weixinConfig;

/***
 *** 微信模板消息
****/
public class WeixinConfigTemplateBean {
	
	 /***
	 * 主键
	 */
	private java.math.BigDecimal templateId;
	 
	 /***
	 * 行业
	 */
	private java.lang.String business;
	 
	 /***
	 * 模板ID
	 */
	private java.lang.String templateMsgId;
	 
	 /***
	 * 模板标题
	 */
	private java.lang.String templateMsgTitle;
	 
	 /***
	 * 内容
	 */
	private java.lang.String content;
	 
	 /***
	 * 范例
	 */
	private java.lang.String examples;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	 
	protected String orderByClause;

	public WeixinConfigTemplateBean(){
	}

	public WeixinConfigTemplateBean(
		java.math.BigDecimal templateId
	){
		this.templateId = templateId;
	}

	 
	public void setTemplateId(java.math.BigDecimal value) {
		this.templateId = value;
	}
	/***
	 * 主键
	 */
	public java.math.BigDecimal getTemplateId() {
		return this.templateId;
	}
	 
	public void setBusiness(java.lang.String value) {
		this.business = value;
	}
	/***
	 * 行业
	 */
	public java.lang.String getBusiness() {
		return this.business;
	}
	 
	public void setTemplateMsgId(java.lang.String value) {
		this.templateMsgId = value;
	}
	/***
	 * 模板ID
	 */
	public java.lang.String getTemplateMsgId() {
		return this.templateMsgId;
	}
	 
	public void setTemplateMsgTitle(java.lang.String value) {
		this.templateMsgTitle = value;
	}
	/***
	 * 模板标题
	 */
	public java.lang.String getTemplateMsgTitle() {
		return this.templateMsgTitle;
	}
	 
	public void setContent(java.lang.String value) {
		this.content = value;
	}
	/***
	 * 内容
	 */
	public java.lang.String getContent() {
		return this.content;
	}
	 
	public void setExamples(java.lang.String value) {
		this.examples = value;
	}
	/***
	 * 范例
	 */
	public java.lang.String getExamples() {
		return this.examples;
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
	 
	public void setRemark(java.lang.String value) {
		this.remark = value;
	}
	/***
	 * 备注
	 */
	public java.lang.String getRemark() {
		return this.remark;
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

