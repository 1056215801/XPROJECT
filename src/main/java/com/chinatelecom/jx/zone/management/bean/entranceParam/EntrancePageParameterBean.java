package com.chinatelecom.jx.zone.management.bean.entranceParam;

/***
 *** EntrancePageParameter
****/
public class EntrancePageParameterBean implements java.io.Serializable {
	 /**
	   * 
	   */
	private static final long serialVersionUID = 1L;
	 /***
	 * parameterId
	 */
	private java.math.BigDecimal parameterId;
	 
	 /***
	 * parameterCode
	 */
	private java.lang.String parameterCode;
	 
	 /***
	 * parameterType
	 */
	private java.lang.String parameterType;
	 
	 /***
	 * systemId
	 */
	private java.math.BigDecimal systemId;
	 
	 /***
	 * pageCode
	 */
	private java.lang.String pageCode;
	 
	 /***
	 * parameterName
	 */
	private java.lang.String parameterName;
	 
	 /***
	 * remark
	 */
	private java.lang.String remark;
	 
	 /***
	 * createTime
	 */
	private java.util.Date createTime;
	 
	protected String orderByClause;

	public EntrancePageParameterBean(){
	}

	public EntrancePageParameterBean(
		java.math.BigDecimal parameterId
	){
		this.parameterId = parameterId;
	}

	 
	public void setParameterId(java.math.BigDecimal value) {
		this.parameterId = value;
	}
	/***
	 * parameterId
	 */
	public java.math.BigDecimal getParameterId() {
		return this.parameterId;
	}
	 
	public void setParameterCode(java.lang.String value) {
		this.parameterCode = value;
	}
	/***
	 * parameterCode
	 */
	public java.lang.String getParameterCode() {
		return this.parameterCode;
	}
	 
	public void setParameterType(java.lang.String value) {
		this.parameterType = value;
	}
	/***
	 * parameterType
	 */
	public java.lang.String getParameterType() {
		return this.parameterType;
	}
	 
	public void setSystemId(java.math.BigDecimal value) {
		this.systemId = value;
	}
	/***
	 * systemId
	 */
	public java.math.BigDecimal getSystemId() {
		return this.systemId;
	}
	 
	public void setPageCode(java.lang.String value) {
		this.pageCode = value;
	}
	/***
	 * pageCode
	 */
	public java.lang.String getPageCode() {
		return this.pageCode;
	}
	 
	public void setParameterName(java.lang.String value) {
		this.parameterName = value;
	}
	/***
	 * parameterName
	 */
	public java.lang.String getParameterName() {
		return this.parameterName;
	}
	 
	public void setRemark(java.lang.String value) {
		this.remark = value;
	}
	/***
	 * remark
	 */
	public java.lang.String getRemark() {
		return this.remark;
	}
	 
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	/***
	 * createTime
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
}

