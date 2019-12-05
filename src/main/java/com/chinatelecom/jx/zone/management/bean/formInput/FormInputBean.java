package com.chinatelecom.jx.zone.management.bean.formInput;

/***
 *** 表单录入项详情表
****/
public class FormInputBean {
	
	 /***
	 * 录入项ID
	 */
	private java.math.BigDecimal id;
	 
	 /***
	 * 录入项类型 录入项类型，参考元素设计 text单行文本 number数值 textarea多行文本
		richtext富文本编辑器 radio单选 checkbox多选 select下拉 selectmore下拉多选 date日期 hidden隐藏域 file上传 sub子表单 line分割线
	 */
	private java.lang.String inputType;
	 
	 /***
	 * 录入项标题
	 */
	private java.lang.String inputTitle;
	 
	 /***
	 * 录入项字段名
	 */
	private java.lang.String filedName;
	 
	 /***
	 * 录入数据格式 有的元素有此属性，格式参考元素设计，日期格式
	 */
	private java.lang.String dataFormat;
	 
	 /***
	 * 默认值
	 */
	private java.lang.String defaultValue;
	 
	 /***
	 * 校验 0:否; 1:是;    非必填、必填
	 */
	private java.lang.String checkType;
	 
	 /***
	 * 权限   查看只读(read)、编辑(edit)、可见(show)、隐藏(hidden)
	 */
	private java.lang.String funcPermission;
	 
	 /***
	 * 排序 越小越靠前
	 */
	private java.lang.String sortGrade;
	 
	 /***
	 * 最小值 数值文本框特有属性
	 */
	private java.lang.String minValue;
	 
	 /***
	 * 最大值 数值文本框特有属性
	 */
	private java.lang.String maxValue;
	 
	 /***
	 * 小数点后几位 数值文本框特有属性
	 */
	private java.lang.String precision;
	 
	 /***
	 * 选项 手动输入，或数据源
	 */
	private java.lang.String options;
	 
	 /***
	 * 表单模板ID 所属模板（表单）ID 
	 */
	private java.math.BigDecimal formId;
	 
	 /***
	 * 录入项提示 提示信息，如提示输入数据格式等.功能同input的title提示
	 */
	private java.lang.String promptMsg;
	 
	 /***
	 * 数据来源 1.单选框、复选框数据来源，对应表单参数表； 2.子表单对应的模板ID；
	 */
	private java.lang.String inputParams;
	 
	 /***
	 * 重复处理时标识 1:更新、2:插入
	 */
	private java.lang.Short repeatFlag;
	 
	 /***
	 * 是否将此数据保存至数据区 0:否; 1:是; 
	 */
	private java.lang.Short isXml;
	 
	 /***
	 * 对应的变量名 流程校验时，检查是否存在相同的变量名，存入数据区是为了此值会进行线的流转
	 */
	private java.lang.String xmlName;
	 
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
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	protected String orderByClause;

	public FormInputBean(){
	}

	public FormInputBean(
		java.math.BigDecimal id
	){
		this.id = id;
	}

	 
	public void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	/***
	 * 录入项ID
	 */
	public java.math.BigDecimal getId() {
		return this.id;
	}
	 
	public void setInputType(java.lang.String value) {
		this.inputType = value;
	}
	/***
	 * 录入项类型 录入项类型，参考元素设计 text单行文本
number数值
textarea多行文本
richtext富文本编辑器
radio单选
checkbox多选
select下拉
selectmore下拉多选
date日期
hidden隐藏域
file上传
sub子表单
line分割线
	 */
	public java.lang.String getInputType() {
		return this.inputType;
	}
	 
	public void setInputTitle(java.lang.String value) {
		this.inputTitle = value;
	}
	/***
	 * 录入项标题
	 */
	public java.lang.String getInputTitle() {
		return this.inputTitle;
	}
	 
	public void setFiledName(java.lang.String value) {
		this.filedName = value;
	}
	/***
	 * 录入项字段名
	 */
	public java.lang.String getFiledName() {
		return this.filedName;
	}
	 
	public void setDataFormat(java.lang.String value) {
		this.dataFormat = value;
	}
	/***
	 * 录入数据格式 有的元素有此属性，格式参考元素设计，日期格式
	 */
	public java.lang.String getDataFormat() {
		return this.dataFormat;
	}
	 
	public void setDefaultValue(java.lang.String value) {
		this.defaultValue = value;
	}
	/***
	 * 默认值
	 */
	public java.lang.String getDefaultValue() {
		return this.defaultValue;
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
	 
	public void setFuncPermission(java.lang.String value) {
		this.funcPermission = value;
	}
	/***
	 * 权限   查看只读(read)、编辑(edit)、可见(show)、隐藏(hidden)
	 */
	public java.lang.String getFuncPermission() {
		return this.funcPermission;
	}
	 
	public void setSortGrade(java.lang.String value) {
		this.sortGrade = value;
	}
	/***
	 * 排序 越小越靠前
	 */
	public java.lang.String getSortGrade() {
		return this.sortGrade;
	}
	 
	public void setMinValue(java.lang.String value) {
		this.minValue = value;
	}
	/***
	 * 最小值 数值文本框特有属性
	 */
	public java.lang.String getMinValue() {
		return this.minValue;
	}
	 
	public void setMaxValue(java.lang.String value) {
		this.maxValue = value;
	}
	/***
	 * 最大值 数值文本框特有属性
	 */
	public java.lang.String getMaxValue() {
		return this.maxValue;
	}
	 
	public void setPrecision(java.lang.String value) {
		this.precision = value;
	}
	/***
	 * 小数点后几位 数值文本框特有属性
	 */
	public java.lang.String getPrecision() {
		return this.precision;
	}
	 
	public void setOptions(java.lang.String value) {
		this.options = value;
	}
	/***
	 * 选项 手动输入，或数据源
	 */
	public java.lang.String getOptions() {
		return this.options;
	}
	 
	public void setFormId(java.math.BigDecimal value) {
		this.formId = value;
	}
	/***
	 * 表单模板ID 所属模板（表单）ID 
	 */
	public java.math.BigDecimal getFormId() {
		return this.formId;
	}
	 
	public void setPromptMsg(java.lang.String value) {
		this.promptMsg = value;
	}
	/***
	 * 录入项提示 提示信息，如提示输入数据格式等.功能同input的title提示
	 */
	public java.lang.String getPromptMsg() {
		return this.promptMsg;
	}
	 
	public void setInputParams(java.lang.String value) {
		this.inputParams = value;
	}
	/***
	 * 数据来源 1.单选框、复选框数据来源，对应表单参数表； 2.子表单对应的模板ID；
	 */
	public java.lang.String getInputParams() {
		return this.inputParams;
	}
	 
	public void setRepeatFlag(java.lang.Short value) {
		this.repeatFlag = value;
	}
	/***
	 * 重复处理时标识 1:更新、2:插入
	 */
	public java.lang.Short getRepeatFlag() {
		return this.repeatFlag;
	}
	 
	public void setIsXml(java.lang.Short value) {
		this.isXml = value;
	}
	/***
	 * 是否将此数据保存至数据区 0:否; 1:是; 
	 */
	public java.lang.Short getIsXml() {
		return this.isXml;
	}
	 
	public void setXmlName(java.lang.String value) {
		this.xmlName = value;
	}
	/***
	 * 对应的变量名 流程校验时，检查是否存在相同的变量名，存入数据区是为了此值会进行线的流转
	 */
	public java.lang.String getXmlName() {
		return this.xmlName;
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
	
	
	/**
	 * 对于勾选框对应选项数据量
	 */
	private String quantity;
	
	/**
	 * 数据所占百分比
	 */
	private String percentage;

	private String[][] count;
	
	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getPercentage() {
		return percentage;
	}

	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}

	public String[][] getCount() {
		return count;
	}

	public void setCount(String[][] strings) {
		this.count = strings;
	}
	
	
}

