package com.chinatelecom.jx.zone.management.bean.projectActivity;

/***
 *** 活动标签字典表，维护管理活动标签字典数据。
****/
public class ProjectActivityTagBean {
	
	 /***
	 * 标签Id，记录主键。
	 */
	private java.math.BigDecimal  tagId;
	 
	 /***
	 * 标签名称。
	 */
	private java.lang.String tagName;
	 
	 /***
	 * 备注，内部查看。
	 */
	private java.lang.String remark;
	 
	 /***
	 * 排序序号，序号越小越往前排序。
	 */
	private java.lang.Integer sortGrade;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	
	/**
	 * 标签类型
	 */
	private  java.lang.Integer kind;
	/**
	 * 状态 0：已删除（隐藏） 1：使用中
	 */
	private  java.lang.Short status;
	
	protected String orderByClause;

	public ProjectActivityTagBean(){
	}

	public ProjectActivityTagBean(
			java.math.BigDecimal tagId
	){
		this.tagId = tagId;
	}

	 
	public void setTagId(java.math.BigDecimal value) {
		this.tagId = value;
	}
	/***
	 * 标签Id，记录主键。
	 */
	public java.math.BigDecimal getTagId() {
		return this.tagId;
	}
	 
	public void setTagName(java.lang.String value) {
		this.tagName = value;
	}
	/***
	 * 标签名称。
	 */
	public java.lang.String getTagName() {
		return this.tagName;
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
	/***
	 * 创建时间
	 */
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	
	public java.lang.Integer getKind() {
		return kind;
	}

	public void setKind(java.lang.Integer kind) {
		this.kind = kind;
	}

	public java.lang.Short getStatus() {
		return status;
	}

	public void setStatus(java.lang.Short status) {
		this.status = status;
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

