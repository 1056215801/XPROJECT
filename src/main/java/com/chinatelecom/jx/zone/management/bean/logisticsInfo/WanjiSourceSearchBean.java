package com.chinatelecom.jx.zone.management.bean.logisticsInfo;

import java.math.BigDecimal;

public class WanjiSourceSearchBean {
	/**
	 * 账户Id
	 */
	private BigDecimal accountId;
	
	/**
	 * 公司Id
	 */
	private BigDecimal companyId;
	
	/**
	 * 略过记录数
	 */
	private Integer Skip;
	
	/**
	 * 单页返回记录数
	 */
	private Integer Take;
	
	/**
	 * 所在位置的区域代码
	 */
	private Integer AdCode;
	/**
	 * 所在位置的区域代码
	 */
	private String AdCodes;
	
	/**
	 * 目标流向的区域代码
	 */
	private Integer TargetAdCode;
	
	/**
	 * 目标流向的区域代码
	 */
	private String TargetAdCodes;
	/**
	 * 车辆类型
	 */
	private Integer TypeCode;
	
	/**
	 * 装载类型
	 */
	private Integer CarLoadType;
	
	/**
	 * 载重下限
	 */
	private BigDecimal MinCarLoad;
	
	/**
	 * 载重上限
	 */
	private BigDecimal MaxCarLoad;
	
	/**
	 * 车长下限
	 */
	private BigDecimal MinCarLength;
	
	/**
	 * 车长上限
	 */
	private BigDecimal MaxCarLength;
	
	/**
	 * 车宽
	 */
	private BigDecimal CarWidth;
	
	/**
	 * 车牌号
	 */
	private String PlateNum;
	
	public BigDecimal getAccountId() {
		return accountId;
	}

	public void setAccountId(BigDecimal accountId) {
		this.accountId = accountId;
	}

	public BigDecimal getCompanyId() {
		return companyId;
	}

	public void setCompanyId(BigDecimal companyId) {
		this.companyId = companyId;
	}

	public Integer getSkip() {
		return Skip;
	}

	public void setSkip(Integer skip) {
		Skip = skip;
	}

	public Integer getTake() {
		return Take;
	}

	public void setTake(Integer take) {
		Take = take;
	}

	public Integer getAdCode() {
		return AdCode;
	}

	public void setAdCode(Integer adCode) {
		AdCode = adCode;
	}

	public String getAdCodes() {
		return AdCodes;
	}

	public void setAdCodes(String adCodes) {
		AdCodes = adCodes;
	}

	public Integer getTargetAdCode() {
		return TargetAdCode;
	}

	public void setTargetAdCode(Integer targetAdCode) {
		TargetAdCode = targetAdCode;
	}

	public String getTargetAdCodes() {
		return TargetAdCodes;
	}

	public void setTargetAdCodes(String targetAdCodes) {
		TargetAdCodes = targetAdCodes;
	}

	public Integer getTypeCode() {
		return TypeCode;
	}

	public void setTypeCode(Integer typeCode) {
		TypeCode = typeCode;
	}
	
	public Integer getCarLoadType() {
		return CarLoadType;
	}

	public void setCarLoadType(Integer carLoadType) {
		CarLoadType = carLoadType;
	}

	public BigDecimal getMinCarLoad() {
		return MinCarLoad;
	}

	public void setMinCarLoad(BigDecimal minCarLoad) {
		MinCarLoad = minCarLoad;
	}

	public BigDecimal getMaxCarLoad() {
		return MaxCarLoad;
	}

	public void setMaxCarLoad(BigDecimal maxCarLoad) {
		MaxCarLoad = maxCarLoad;
	}

	public BigDecimal getMinCarLength() {
		return MinCarLength;
	}

	public void setMinCarLength(BigDecimal minCarLength) {
		MinCarLength = minCarLength;
	}

	public BigDecimal getMaxCarLength() {
		return MaxCarLength;
	}

	public void setMaxCarLength(BigDecimal maxCarLength) {
		MaxCarLength = maxCarLength;
	}

	public BigDecimal getCarWidth() {
		return CarWidth;
	}

	public void setCarWidth(BigDecimal carWidth) {
		CarWidth = carWidth;
	}

	public String getPlateNum() {
		return PlateNum;
	}

	public void setPlateNum(String plateNum) {
		PlateNum = plateNum;
	}
	
}
