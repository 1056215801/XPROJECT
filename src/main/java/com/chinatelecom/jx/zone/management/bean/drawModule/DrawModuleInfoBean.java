package com.chinatelecom.jx.zone.management.bean.drawModule;

/***
 *** 模块信息表
****/
public class DrawModuleInfoBean {
	
	 /***
	 * 编号
	 */
	private java.math.BigDecimal id;
	 
	 /***
	 * 模块名称
	 */
	private java.lang.String moduleName;
	 
	 /***
	 * 唯一标识
	 */
	private java.lang.String uniqueMark;
	 
	 /***
	 * 备注说明
	 */
	private java.lang.String description;
	 
	 /***
	 * 排序
	 */
	private java.lang.Integer sortGrade;
	 
	 /***
	 * 创建人ID
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 创建人名称
	 */
	private java.lang.String accountName;
	 
	 /***
	 * 归属园区ID
	 */
	private java.math.BigDecimal parkId;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	 /***
	 * 最后修改时间
	 */
	private java.util.Date updateTime;
	 
	 /***
	 * 类型：1模块、2分组、3具体表单
	 */
	private java.lang.String modelType;
	 
	 /***
	 * 总行数 副字段(绘制表格布局时用到)
	 */
	private java.lang.Integer rowNum;
	 
	 /***
	 * 总列数 副字段(绘制表格布局时用到)
	 */
	private java.lang.Integer colNum;
	 
	 /***
	 * 父节点ID 模块类型时，为-1
	 */
	private java.math.BigDecimal parentId;
	 
	 /***
	 * 表单布局 h标识横排 z标识纵排
	 */
	private java.lang.String formLayout;
	 
	protected String orderByClause;

	public DrawModuleInfoBean(){
	}

	public DrawModuleInfoBean(
		java.math.BigDecimal id
	){
		this.id = id;
	}

	 
	public void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	/***
	 * 编号
	 */
	public java.math.BigDecimal getId() {
		return this.id;
	}
	 
	public void setModuleName(java.lang.String value) {
		this.moduleName = value;
	}
	/***
	 * 模块名称
	 */
	public java.lang.String getModuleName() {
		return this.moduleName;
	}
	 
	public void setUniqueMark(java.lang.String value) {
		this.uniqueMark = value;
	}
	/***
	 * 唯一标识
	 */
	public java.lang.String getUniqueMark() {
		return this.uniqueMark;
	}
	 
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	/***
	 * 备注说明
	 */
	public java.lang.String getDescription() {
		return this.description;
	}
	 
	public void setSortGrade(java.lang.Integer value) {
		this.sortGrade = value;
	}
	/***
	 * 排序
	 */
	public java.lang.Integer getSortGrade() {
		return this.sortGrade;
	}
	 
	public void setAccountId(java.math.BigDecimal value) {
		this.accountId = value;
	}
	/***
	 * 创建人ID
	 */
	public java.math.BigDecimal getAccountId() {
		return this.accountId;
	}
	 
	public void setAccountName(java.lang.String value) {
		this.accountName = value;
	}
	/***
	 * 创建人名称
	 */
	public java.lang.String getAccountName() {
		return this.accountName;
	}
	 
	public void setParkId(java.math.BigDecimal value) {
		this.parkId = value;
	}
	/***
	 * 归属园区ID
	 */
	public java.math.BigDecimal getParkId() {
		return this.parkId;
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
	 
	public void setModelType(java.lang.String value) {
		this.modelType = value;
	}
	/***
	 * 类型：1模块、2分组、3具体表单
	 */
	public java.lang.String getModelType() {
		return this.modelType;
	}
	 
	public void setRowNum(java.lang.Integer value) {
		this.rowNum = value;
	}
	/***
	 * 总行数 副字段(绘制表格布局时用到)
	 */
	public java.lang.Integer getRowNum() {
		return this.rowNum;
	}
	 
	public void setColNum(java.lang.Integer value) {
		this.colNum = value;
	}
	/***
	 * 总列数 副字段(绘制表格布局时用到)
	 */
	public java.lang.Integer getColNum() {
		return this.colNum;
	}
	 
	public void setParentId(java.math.BigDecimal value) {
		this.parentId = value;
	}
	/***
	 * 父节点ID 模块类型时，为-1
	 */
	public java.math.BigDecimal getParentId() {
		return this.parentId;
	}
	 
	public void setFormLayout(java.lang.String value) {
		this.formLayout = value;
	}
	/***
	 * 表单布局 h标识横排 z标识纵排
	 */
	public java.lang.String getFormLayout() {
		return this.formLayout;
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

