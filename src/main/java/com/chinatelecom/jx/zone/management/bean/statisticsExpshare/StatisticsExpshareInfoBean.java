package com.chinatelecom.jx.zone.management.bean.statisticsExpshare;

import java.math.BigDecimal;
import java.sql.Timestamp;

/***
 *** 园区动态统计结果表
****/
public class StatisticsExpshareInfoBean {
	
	 /***
	 * id
	 */
	private java.math.BigDecimal id;
	 
	 /***
	 * 地市Id
	 */
	private java.math.BigDecimal areaId;
	 
	 /***
	 * 地市名称
	 */
	private java.lang.String areaName;
	 
	 /***
	 * 园区Id
	 */
	private java.math.BigDecimal parkId;
	 
	 /***
	 * 园区名称
	 */
	private java.lang.String parkName;
	
	/**
	 * 省份id
	 */
	private BigDecimal provinceId;
	
	/**
	 * 省份名称
	 */
	private String provinceName;
	 
	 /***
	 * 县区Id
	 */
	private java.math.BigDecimal spaceId;
	 
	 /***
	 * 县区名称
	 */
	private java.lang.String spaceName;
	 
	 /***
	 * 园区动态总数
	 */
	private java.lang.Short sumCount;
	 
	 /***
	 * 有效动态总数
	 */
	private java.lang.Short trueCount;
	 
	 /***
	 * 浏览量
	 */
	private java.lang.Integer browseCount;
	 
	 /***
	 * 评论量
	 */
	private java.lang.Integer commentCount;
	 
	 /***
	 * 发布日期
	 */
	private java.util.Date createday;
	 
	 /***
	 * 更新时间
	 */
	private java.util.Date updatetime;
	 
	protected String orderByClause;

	public StatisticsExpshareInfoBean(){
	}

	public StatisticsExpshareInfoBean(
		java.math.BigDecimal id
	){
		this.id = id;
	}

	 
	public void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	/***
	 * id
	 */
	public java.math.BigDecimal getId() {
		return this.id;
	}
	 
	public void setAreaId(java.math.BigDecimal value) {
		this.areaId = value;
	}
	/***
	 * 地市Id
	 */
	public java.math.BigDecimal getAreaId() {
		return this.areaId;
	}
	 
	public void setAreaName(java.lang.String value) {
		this.areaName = value;
	}
	/***
	 * 地市名称
	 */
	public java.lang.String getAreaName() {
		return this.areaName;
	}
	 
	public void setParkId(java.math.BigDecimal value) {
		this.parkId = value;
	}
	/***
	 * 园区Id
	 */
	public java.math.BigDecimal getParkId() {
		return this.parkId;
	}
	 
	public void setParkName(java.lang.String value) {
		this.parkName = value;
	}
	/***
	 * 园区名称
	 */
	public java.lang.String getParkName() {
		return this.parkName;
	}
	 
	public void setSpaceId(java.math.BigDecimal value) {
		this.spaceId = value;
	}
	/***
	 * 县区Id
	 */
	public java.math.BigDecimal getSpaceId() {
		return this.spaceId;
	}
	 
	public void setSpaceName(java.lang.String value) {
		this.spaceName = value;
	}
	/***
	 * 县区名称
	 */
	public java.lang.String getSpaceName() {
		return this.spaceName;
	}
	 
	public void setSumCount(java.lang.Short value) {
		this.sumCount = value;
	}
	/***
	 * 园区动态总数
	 */
	public java.lang.Short getSumCount() {
		return this.sumCount;
	}
	 
	public void setTrueCount(java.lang.Short value) {
		this.trueCount = value;
	}
	/***
	 * 有效动态总数
	 */
	public java.lang.Short getTrueCount() {
		return this.trueCount;
	}
	 
	public void setBrowseCount(java.lang.Integer value) {
		this.browseCount = value;
	}
	/***
	 * 浏览量
	 */
	public java.lang.Integer getBrowseCount() {
		return this.browseCount;
	}
	 
	public void setCommentCount(java.lang.Integer value) {
		this.commentCount = value;
	}
	/***
	 * 评论量
	 */
	public java.lang.Integer getCommentCount() {
		return this.commentCount;
	}
	 
	public void setCreateday(java.util.Date value) {
		this.createday = value;
	}
	/***
	 * 发布日期
	 */
	public java.util.Date getCreateday() {
		return this.createday;
	}
	 
	public void setUpdatetime(java.util.Date value) {
		this.updatetime = value;
	}
	/***
	 * 更新时间
	 */
	public java.util.Date getUpdatetime() {
		return this.updatetime;
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
	
	private Timestamp startTime;
	
	private Timestamp endTime;
	
	private Integer countNum;

	public Timestamp getStartTime() {
		return startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public Integer getCountNum() {
		return countNum;
	}

	public void setCountNum(Integer countNum) {
		this.countNum = countNum;
	}
	
	/**
	 * 区域类型，0：默认类型；1：国家；2：省份；3：地市；4：县区。
	 */
	private Short kind;

	public Short getKind() {
		return kind;
	}

	public void setKind(Short kind) {
		this.kind = kind;
	}

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public BigDecimal getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(BigDecimal provinceId) {
		this.provinceId = provinceId;
	}
	
}

