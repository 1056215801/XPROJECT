package com.chinatelecom.jx.zone.management.bean.logisticsInfo;

import java.math.BigDecimal;

public class WanjiGoodsInfoBean {
	
	private BigDecimal accountId;
	
	private BigDecimal companyId;
	/**
	 * 发货地省名
	 */
	private String SrcProvince;
	
	/**
	 * 发货地市名
	 */
	private String SrcCity;
	
	/**
	 * 发货地区县名
	 */
	private String SrcArea;
	
	/**
	 * 不可为空，发货地行政区域代码
	 */
	private Integer SrcAdCode;
	
	/**
	 * 目的地省名
	 */
	private String DestProvince;
	
	/**
	 * 目的地市名
	 */
	private String DestCity;
	
	/**
	 * 目的地区县名
	 */
	private String DestArea;
	
	/**
	 * 不可为空，目的地行政区域代码
	 */
	private Integer DestAdCode;
	
	/**
	 * 总里程，单位：公里（KM）
	 */
	private BigDecimal TotalMileage;
	
	/**
	 * 货物主类型（1：重货，2：泡货）
	 */
	private Integer TypeCode;
	
	/**
	 * 货物子类型，取字典代码
	 */
	private Integer SubTypeCode;
	
	/**
	 * 货物子类型，取字典释义
	 */
	private String SubTypeName;
	
	/**
	 * 可空，货物数量预估下限。
	 */
	private BigDecimal MinCount;
	
	/**
	 * 可空，货物数量预估上限。
	 */
	private BigDecimal MaxCount;
	
	/**
	 * [货物数量单位]重货：吨，泡货：方
	 */
	private String CountUnit;
	
	/**
	 * 车辆数量要求
	 */
	private Integer CarCount;
	
	/**
	 * 货物需求，位控。（0x01：超长，0x02：超宽，0x04：超高，0x08：超重，0x10：包来回）
	 */
	private Integer RequireCode;
	
	/**
	 * 车型要求，传字典代码，无要求时传-1
	 */
	private Integer LimCarTypeCode;
	
	/**
	 * 车型要求名称
	 */
	private String LimCarTypeName;
	
	/**
	 * 车辆装载类型要求，传字典代码，无要求时传-1
	 */
	private Integer LimCarLoadTypeCode;
	
	
	/**
	 * 车辆装载类型名称
	 */
	private String LimCarLoadTypeName;
	
	/**
	 * 车宽要求，传字典代码，无要求时传-1
	 */
	private BigDecimal LimCarWidth;
	
	/**
	 * 车长要求 1，传字典代码，无要求时传-1
	 */
	private BigDecimal LimCarLength1;
	
	/**
	 * 车长要求 2，传字典代码，无要求时传-1
	 */
	private BigDecimal LimCarLength2;
	
	/**
	 * 车长要求3，传字典代码，无要求时传-1
	 */
	private BigDecimal LimCarLength3;
	
	/**
	 * 意向报价，面议填 0
	 */
	private BigDecimal Price;
	
	
	/**
	 * 联系人
	 */
	private String Contact;
	
	/**
	 * 联系电话
	 */
	private String Phone;
	
	/**
	 * [备选联系电话]可存多个号码，使用|分隔
	 */
	private String PhoneBak;
	
	/**
	 * [报价方式]0:无限制，1：元/车，2：元/吨，3：元/方
	 */
	private Integer OfferType;
	
	/**
	 * 重发总数
	 */
	private Integer RepeatSum;
	
	/**
	 * 重发间隔(单位：分钟)
	 */
	private Integer RepeatInterval;
	
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

	public String getSrcProvince() {
		return SrcProvince;
	}

	public void setSrcProvince(String srcProvince) {
		SrcProvince = srcProvince;
	}

	public String getSrcCity() {
		return SrcCity;
	}

	public void setSrcCity(String srcCity) {
		SrcCity = srcCity;
	}

	public String getSrcArea() {
		return SrcArea;
	}

	public void setSrcArea(String srcArea) {
		SrcArea = srcArea;
	}

	public Integer getSrcAdCode() {
		return SrcAdCode;
	}

	public void setSrcAdCode(Integer srcAdCode) {
		SrcAdCode = srcAdCode;
	}

	public String getDestProvince() {
		return DestProvince;
	}

	public void setDestProvince(String destProvince) {
		DestProvince = destProvince;
	}

	public String getDestCity() {
		return DestCity;
	}

	public void setDestCity(String destCity) {
		DestCity = destCity;
	}

	public String getDestArea() {
		return DestArea;
	}

	public void setDestArea(String destArea) {
		DestArea = destArea;
	}

	public Integer getDestAdCode() {
		return DestAdCode;
	}

	public void setDestAdCode(Integer destAdCode) {
		DestAdCode = destAdCode;
	}

	public BigDecimal getTotalMileage() {
		return TotalMileage;
	}

	public void setTotalMileage(BigDecimal totalMileage) {
		TotalMileage = totalMileage;
	}

	public Integer getTypeCode() {
		return TypeCode;
	}

	public void setTypeCode(Integer typeCode) {
		TypeCode = typeCode;
	}

	public Integer getSubTypeCode() {
		return SubTypeCode;
	}

	public void setSubTypeCode(Integer subTypeCode) {
		SubTypeCode = subTypeCode;
	}

	public String getSubTypeName() {
		return SubTypeName;
	}

	public void setSubTypeName(String subTypeName) {
		SubTypeName = subTypeName;
	}

	public BigDecimal getMinCount() {
		return MinCount;
	}

	public void setMinCount(BigDecimal minCount) {
		MinCount = minCount;
	}

	public BigDecimal getMaxCount() {
		return MaxCount;
	}

	public void setMaxCount(BigDecimal maxCount) {
		MaxCount = maxCount;
	}

	public String getCountUnit() {
		return CountUnit;
	}

	public void setCountUnit(String countUnit) {
		CountUnit = countUnit;
	}

	public Integer getCarCount() {
		return CarCount;
	}

	public void setCarCount(Integer carCount) {
		CarCount = carCount;
	}

	public Integer getRequireCode() {
		return RequireCode;
	}

	public void setRequireCode(Integer requireCode) {
		RequireCode = requireCode;
	}

	public Integer getLimCarTypeCode() {
		return LimCarTypeCode;
	}

	public void setLimCarTypeCode(Integer limCarTypeCode) {
		LimCarTypeCode = limCarTypeCode;
	}

	public String getLimCarTypeName() {
		return LimCarTypeName;
	}

	public void setLimCarTypeName(String limCarTypeName) {
		LimCarTypeName = limCarTypeName;
	}

	public Integer getLimCarLoadTypeCode() {
		return LimCarLoadTypeCode;
	}

	public void setLimCarLoadTypeCode(Integer limCarLoadTypeCode) {
		LimCarLoadTypeCode = limCarLoadTypeCode;
	}

	public String getLimCarLoadTypeName() {
		return LimCarLoadTypeName;
	}

	public void setLimCarLoadTypeName(String limCarLoadTypeName) {
		LimCarLoadTypeName = limCarLoadTypeName;
	}

	public BigDecimal getLimCarWidth() {
		return LimCarWidth;
	}

	public void setLimCarWidth(BigDecimal limCarWidth) {
		LimCarWidth = limCarWidth;
	}

	public BigDecimal getLimCarLength1() {
		return LimCarLength1;
	}

	public void setLimCarLength1(BigDecimal limCarLength1) {
		LimCarLength1 = limCarLength1;
	}

	public BigDecimal getLimCarLength2() {
		return LimCarLength2;
	}

	public void setLimCarLength2(BigDecimal limCarLength2) {
		LimCarLength2 = limCarLength2;
	}

	public BigDecimal getLimCarLength3() {
		return LimCarLength3;
	}

	public void setLimCarLength3(BigDecimal limCarLength3) {
		LimCarLength3 = limCarLength3;
	}

	public BigDecimal getPrice() {
		return Price;
	}

	public void setPrice(BigDecimal price) {
		Price = price;
	}

	public String getContact() {
		return Contact;
	}

	public void setContact(String contact) {
		Contact = contact;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getPhoneBak() {
		return PhoneBak;
	}

	public void setPhoneBak(String phoneBak) {
		PhoneBak = phoneBak;
	}

	public Integer getOfferType() {
		return OfferType;
	}

	public void setOfferType(Integer offerType) {
		OfferType = offerType;
	}

	public Integer getRepeatSum() {
		return RepeatSum;
	}

	public void setRepeatSum(Integer repeatSum) {
		RepeatSum = repeatSum;
	}

	public Integer getRepeatInterval() {
		return RepeatInterval;
	}

	public void setRepeatInterval(Integer repeatInterval) {
		RepeatInterval = repeatInterval;
	}

}
