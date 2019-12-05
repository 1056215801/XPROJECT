package com.chinatelecom.jx.zone.management.bean.formTemplate;

/***
 *** 模板(表单
****/
public class FormTemplateBean {
	
	 /***
	 * 表单模板ID
	 */
	private java.math.BigDecimal id;
	 
	 /***
	 * 表单名称
	 */
	private java.lang.String formName;
	 
	 /***
	 * 表单描述
	 */
	private java.lang.String formDesc;
	 
	 /***
	 * 状态 0:无效; 1:有效 ;
	 */
	private java.lang.Short statusFlag;
	 
	 /***
	 * 创建人
	 */
	private java.math.BigDecimal createOperatorId;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	 /***
	 * 最后修改时间
	 */
	private java.util.Date updateTime;
	 
	 /***
	 * 所属园区 可为空
	 */
	private java.math.BigDecimal parkId;
	 
	 /***
	 * 引用模板ID 在其他表单基础上修改用到，与子表单概念不要混淆
	 */
	private java.math.BigDecimal quoteFormId;
	 
	 /***
	 * 业务类型 对应的业务类型 1：项目申报 2：在线调查
	 */
	private java.lang.Short relationType;
	 
	 /***
	 * 查看页面URL
	 */
	private java.lang.String showUrl;
	 
	 /***
	 * 编辑页面URL
	 */
	private java.lang.String editUrl;
	 
	 /***
	 * 备注
	 */
	private java.lang.String brief;
	 
	 /***
	 * 备份1
	 */
	private java.lang.String extend1;
	 
	 /***
	 * 备份2
	 */
	private java.lang.String extend2;
	 
	 /***
	 * 备份3
	 */
	private java.lang.String extend3;
	/***
	 * 表单布局 h标识横排 z标识纵排
	 */
	private java.lang.String formLayout;
	 
	protected String orderByClause;

	public FormTemplateBean(){
	}

	public FormTemplateBean(
		java.math.BigDecimal id
	){
		this.id = id;
	}

	 
	public void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	/***
	 * 表单模板ID
	 */
	public java.math.BigDecimal getId() {
		return this.id;
	}
	 
	public void setFormName(java.lang.String value) {
		this.formName = value;
	}
	/***
	 * 表单名称
	 */
	public java.lang.String getFormName() {
		return this.formName;
	}
	 
	public void setFormDesc(java.lang.String value) {
		this.formDesc = value;
	}
	/***
	 * 表单描述
	 */
	public java.lang.String getFormDesc() {
		return this.formDesc;
	}
	 
	public void setStatusFlag(java.lang.Short value) {
		this.statusFlag = value;
	}
	/***
	 * 状态 0:无效; 1:有效 ;
	 */
	public java.lang.Short getStatusFlag() {
		return this.statusFlag;
	}
	 
	public void setCreateOperatorId(java.math.BigDecimal value) {
		this.createOperatorId = value;
	}
	/***
	 * 创建人
	 */
	public java.math.BigDecimal getCreateOperatorId() {
		return this.createOperatorId;
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
	 
	public void setUpdateTime(java.util.Date value) {
		this.updateTime = value;
	}
	/***
	 * 最后修改时间
	 */
	public java.util.Date getUpdateTime() {
		return this.updateTime;
	}
	 
	public void setParkId(java.math.BigDecimal value) {
		this.parkId = value;
	}
	/***
	 * 所属园区 可为空
	 */
	public java.math.BigDecimal getParkId() {
		return this.parkId;
	}
	 
	public void setQuoteFormId(java.math.BigDecimal value) {
		this.quoteFormId = value;
	}
	/***
	 * 引用模板ID 在其他表单基础上修改用到，与子表单概念不要混淆
	 */
	public java.math.BigDecimal getQuoteFormId() {
		return this.quoteFormId;
	}
	 
	public void setRelationType(java.lang.Short value) {
		this.relationType = value;
	}
	/***
	 * 业务类型 对应的业务类型 1：项目申报 2：在线调查
	 */
	public java.lang.Short getRelationType() {
		return this.relationType;
	}
	 
	public void setShowUrl(java.lang.String value) {
		this.showUrl = value;
	}
	/***
	 * 查看页面URL
	 */
	public java.lang.String getShowUrl() {
		return this.showUrl;
	}
	 
	public void setEditUrl(java.lang.String value) {
		this.editUrl = value;
	}
	/***
	 * 编辑页面URL
	 */
	public java.lang.String getEditUrl() {
		return this.editUrl;
	}
	 
	public void setBrief(java.lang.String value) {
		this.brief = value;
	}
	/***
	 * 备注
	 */
	public java.lang.String getBrief() {
		return this.brief;
	}
	 
	public void setExtend1(java.lang.String value) {
		this.extend1 = value;
	}
	/***
	 * 备份1
	 */
	public java.lang.String getExtend1() {
		return this.extend1;
	}
	 
	public void setExtend2(java.lang.String value) {
		this.extend2 = value;
	}
	/***
	 * 备份2
	 */
	public java.lang.String getExtend2() {
		return this.extend2;
	}
	 
	public void setExtend3(java.lang.String value) {
		this.extend3 = value;
	}
	/***
	 * 备份3
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

	public java.lang.String getFormLayout() {
		return formLayout;
	}

	public void setFormLayout(java.lang.String formLayout) {
		this.formLayout = formLayout;
	}
}

