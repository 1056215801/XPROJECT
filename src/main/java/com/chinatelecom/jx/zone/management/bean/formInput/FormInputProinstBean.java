package com.chinatelecom.jx.zone.management.bean.formInput;

/***
 *** 表单录入项初始化实例表
****/
public class FormInputProinstBean {
	
	 /***
	 * 录入项ID
	 */
	private java.math.BigDecimal id;
	 
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
	 * 录入值
	 */
	private java.lang.String inputValue;
	
	/**
	 * 其他录入值
	 */
	private String otherInputValue;
	
	/***
	 * 录入项ID
	 */
	private java.math.BigDecimal inputId;
	 
	 /***
	 * 录入状态  0未录入 1已录入 3无效
	 */
	private java.lang.Short statusFlag;
	 
	 /***
	 * 创建人ID
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
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
	 * 权限 查看只读、编辑、可见、隐藏
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
	 * 工作项ID
	 */
	private java.math.BigDecimal workitemid;
	 
	 /***
	 * 环节ID
	 */
	private java.math.BigDecimal actionid;
	 
	 /***
	 * 环节名称
	 */
	private java.lang.String actionname;
	 
	 /***
	 * 业务表主键
	 */
	private java.math.BigDecimal relationId;
	 
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
	
	//姓名
	protected String accountName;
	
	protected String orderByClause;

	public FormInputProinstBean(){
	}

	public FormInputProinstBean(
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
	 
	public void setInputValue(java.lang.String value) {
		this.inputValue = value;
	}
	/***
	 * 录入值
	 */
	public java.lang.String getInputValue() {
		return this.inputValue;
	}
	 
	public void setStatusFlag(java.lang.Short value) {
		this.statusFlag = value;
	}
	/***
	 * 录入状态  0未录入 1已录入 3无效
	 */
	public java.lang.Short getStatusFlag() {
		return this.statusFlag;
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
	 
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	/***
	 * 创建时间
	 */
	public java.util.Date getCreateTime() {
		return this.createTime;
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
	 * 权限 查看只读、编辑、可见、隐藏
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
	 
	public void setWorkitemid(java.math.BigDecimal value) {
		this.workitemid = value;
	}
	/***
	 * 工作项ID
	 */
	public java.math.BigDecimal getWorkitemid() {
		return this.workitemid;
	}
	 
	public void setActionid(java.math.BigDecimal value) {
		this.actionid = value;
	}
	/***
	 * 环节ID
	 */
	public java.math.BigDecimal getActionid() {
		return this.actionid;
	}
	 
	public void setActionname(java.lang.String value) {
		this.actionname = value;
	}
	/***
	 * 环节名称
	 */
	public java.lang.String getActionname() {
		return this.actionname;
	}
	 
	public void setRelationId(java.math.BigDecimal value) {
		this.relationId = value;
	}
	/***
	 * 业务表主键
	 */
	public java.math.BigDecimal getRelationId() {
		return this.relationId;
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
	 * 数据来源ip,接收关联查询数据
	 */
	private String ipAddress;

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getOtherInputValue() {
		return otherInputValue;
	}

	public void setOtherInputValue(String otherInputValue) {
		this.otherInputValue = otherInputValue;
	}

	public java.math.BigDecimal getInputId() {
		return inputId;
	}

	public void setInputId(java.math.BigDecimal inputId) {
		this.inputId = inputId;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	
	/**
	 * 查询开始时间
	 */
	private String start;
	/**
	 * 查询结束时间
	 */
	private String end;

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}
}

