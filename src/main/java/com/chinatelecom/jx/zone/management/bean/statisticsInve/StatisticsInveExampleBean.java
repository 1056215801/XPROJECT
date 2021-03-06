package com.chinatelecom.jx.zone.management.bean.statisticsInve;

/***
 *** StatisticsInveExample
****/
public class StatisticsInveExampleBean {
	
	 /***
	 * ID ，主键
	 */
	private java.math.BigDecimal id;
	 
	 /***
	 * t_investigation_info_main主键
	 */
	private java.math.BigDecimal investigationId;
	 
	 /***
	 * 模板ID
	 */
	private java.math.BigDecimal formId;
	 
	 /***
	 * 录入项ID
	 */
	private java.math.BigDecimal inputId;
	 
	 /***
	 * 录入项类型 录入项类型
	 */
	private java.lang.String inputType;
	 
	 /***
	 * 校验 0:否; 1:是;    非必填、必填
	 */
	private java.lang.String checkType;
	 
	 /***
	 * 录入项名称
	 */
	private java.lang.String inputTitle;
	 
	 /***
	 * 录入项对应的标准值
	 */
	private java.lang.String inputOptions;
	 
	 /***
	 * 录入项作答数
	 */
	private java.lang.Short inputTrue;
	 
	 /***
	 * 录入项排序 越小越靠前
	 */
	private java.lang.String sortGrade;
	 
	 /***
	 * 录入项数据总量
	 */
	private java.lang.Short countExampleSum;
	 
	 /***
	 * 录入项填写率
	 */
	private java.lang.String examplePrc;
	 
	 /***
	 * 录入项对应的分解值
	 */
	private java.lang.String options;
	 
	 /***
	 * 对应的分解值录入次数
	 */
	private java.lang.Short inputProinstNum;
	 
	 /***
	 * 对应的分解值录入百分比
	 */
	private java.lang.String inputProinstPrc;
	 
	 /***
	 * 更新时间
	 */
	private java.util.Date updateDate;
	 
	protected String orderByClause;

	public StatisticsInveExampleBean(){
	}

	public StatisticsInveExampleBean(
		java.math.BigDecimal id
	){
		this.id = id;
	}

	 
	public void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	/***
	 * ID ，主键
	 */
	public java.math.BigDecimal getId() {
		return this.id;
	}
	 
	public void setInvestigationId(java.math.BigDecimal value) {
		this.investigationId = value;
	}
	/***
	 * t_investigation_info_main主键
	 */
	public java.math.BigDecimal getInvestigationId() {
		return this.investigationId;
	}
	 
	public void setFormId(java.math.BigDecimal value) {
		this.formId = value;
	}
	/***
	 * 模板ID
	 */
	public java.math.BigDecimal getFormId() {
		return this.formId;
	}
	 
	public void setInputId(java.math.BigDecimal value) {
		this.inputId = value;
	}
	/***
	 * 录入项ID
	 */
	public java.math.BigDecimal getInputId() {
		return this.inputId;
	}
	 
	public void setInputType(java.lang.String value) {
		this.inputType = value;
	}
	/***
	 * 录入项类型 录入项类型
	 */
	public java.lang.String getInputType() {
		return this.inputType;
	}
	 
	public void setCheckType(java.lang.String value) {
		this.checkType = value;
	}
	/***
	 * 校验 0:否; 1:是;    非必填、必填
	 */
	public java.lang.String getCheckType() {
		return this.checkType;
	}
	 
	public void setInputTitle(java.lang.String value) {
		this.inputTitle = value;
	}
	/***
	 * 录入项名称
	 */
	public java.lang.String getInputTitle() {
		return this.inputTitle;
	}
	 
	public void setInputOptions(java.lang.String value) {
		this.inputOptions = value;
	}
	/***
	 * 录入项对应的标准值
	 */
	public java.lang.String getInputOptions() {
		return this.inputOptions;
	}
	 
	public void setInputTrue(java.lang.Short value) {
		this.inputTrue = value;
	}
	/***
	 * 录入项作答数
	 */
	public java.lang.Short getInputTrue() {
		return this.inputTrue;
	}
	 
	public void setSortGrade(java.lang.String value) {
		this.sortGrade = value;
	}
	/***
	 * 录入项排序 越小越靠前
	 */
	public java.lang.String getSortGrade() {
		return this.sortGrade;
	}
	 
	public void setCountExampleSum(java.lang.Short value) {
		this.countExampleSum = value;
	}
	/***
	 * 录入项数据总量
	 */
	public java.lang.Short getCountExampleSum() {
		return this.countExampleSum;
	}
	 
	public void setExamplePrc(java.lang.String value) {
		this.examplePrc = value;
	}
	/***
	 * 录入项填写率
	 */
	public java.lang.String getExamplePrc() {
		return this.examplePrc;
	}
	 
	public void setOptions(java.lang.String value) {
		this.options = value;
	}
	/***
	 * 录入项对应的分解值
	 */
	public java.lang.String getOptions() {
		return this.options;
	}
	 
	public void setInputProinstNum(java.lang.Short value) {
		this.inputProinstNum = value;
	}
	/***
	 * 对应的分解值录入次数
	 */
	public java.lang.Short getInputProinstNum() {
		return this.inputProinstNum;
	}
	 
	public void setInputProinstPrc(java.lang.String value) {
		this.inputProinstPrc = value;
	}
	/***
	 * 对应的分解值录入百分比
	 */
	public java.lang.String getInputProinstPrc() {
		return this.inputProinstPrc;
	}
	 
	public void setUpdateDate(java.util.Date value) {
		this.updateDate = value;
	}
	/***
	 * 更新时间
	 */
	public java.util.Date getUpdateDate() {
		return this.updateDate;
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

