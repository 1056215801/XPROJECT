package com.chinatelecom.jx.zone.management.bean.entranceParam;

import java.math.BigDecimal;

/***
 *** EntrancePageCustom
 ****/
public class EntrancePageCustomBean implements java.io.Serializable {
	/**
	  * 
	  */
	private static final long serialVersionUID = 1L;

	/***
	 * customId
	 */
	private java.math.BigDecimal customId;

	/***
	 * parameterId
	 */
	private java.math.BigDecimal parameterId;
	
	private String parameterCode;
	
	private String parameterType;
	
	private String parameterName;
	
	private BigDecimal systemId;

	private EntrancePageParameterBean parameter;

	/***
	 * organizationId
	 */
	private java.math.BigDecimal organizationId;

	/***
	 * parameterValue
	 */
	private java.lang.String parameterValue;

	/***
	 * createTime
	 */
	private java.util.Date createTime;

	protected String orderByClause;

	public EntrancePageCustomBean() {
	}

	public EntrancePageCustomBean(java.math.BigDecimal customId) {
		this.customId = customId;
	}

	public void setCustomId(java.math.BigDecimal value) {
		this.customId = value;
	}

	/***
	 * customId
	 */
	public java.math.BigDecimal getCustomId() {
		return this.customId;
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

	public void setOrganizationId(java.math.BigDecimal value) {
		this.organizationId = value;
	}

	/***
	 * organizationId
	 */
	public java.math.BigDecimal getOrganizationId() {
		return this.organizationId;
	}

	public void setParameterValue(java.lang.String value) {
		this.parameterValue = value;
	}

	/***
	 * parameterValue
	 */
	public java.lang.String getParameterValue() {
		return this.parameterValue;
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

	public EntrancePageParameterBean getParameter() {
		return parameter;
	}

	public void setParameter(EntrancePageParameterBean parameter) {
		this.parameter = parameter;
	}

	/***
	 * 排序
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	public BigDecimal getSystemId() {
		return systemId;
	}

	public void setSystemId(BigDecimal systemId) {
		this.systemId = systemId;
	}

	public String getParameterCode() {
		return parameterCode;
	}

	public void setParameterCode(String parameterCode) {
		this.parameterCode = parameterCode;
	}

	public String getParameterType() {
		return parameterType;
	}

	public void setParameterType(String parameterType) {
		this.parameterType = parameterType;
	}

	public String getParameterName() {
		return parameterName;
	}

	public void setParameterName(String parameterName) {
		this.parameterName = parameterName;
	}
}
