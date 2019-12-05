package com.chinatelecom.jx.zone.management.bean.expShare;

/***
 *** ExpShareLabel
****/
public class ExpShareLabelBean {
	
	 /***
	 * 标题id，主键
	 */
	private java.math.BigDecimal labelId;
	 
	 /***
	 * 标签名称
	 */
	private java.lang.String labelTitle;
	 
	 /***
	 * 标签序号
	 */
	private java.lang.Integer labelSort;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	 
	protected String orderByClause;

	public ExpShareLabelBean(){
	}

	public ExpShareLabelBean(
		java.math.BigDecimal labelId
	){
		this.labelId = labelId;
	}

	 
	public void setLabelId(java.math.BigDecimal value) {
		this.labelId = value;
	}
	/***
	 * 标题id，主键
	 */
	public java.math.BigDecimal getLabelId() {
		return this.labelId;
	}
	 
	public void setLabelTitle(java.lang.String value) {
		this.labelTitle = value;
	}
	/***
	 * 标签名称
	 */
	public java.lang.String getLabelTitle() {
		return this.labelTitle;
	}
	 
	public void setLabelSort(java.lang.Integer value) {
		this.labelSort = value;
	}
	/***
	 * 标签序号
	 */
	public java.lang.Integer getLabelSort() {
		return this.labelSort;
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

