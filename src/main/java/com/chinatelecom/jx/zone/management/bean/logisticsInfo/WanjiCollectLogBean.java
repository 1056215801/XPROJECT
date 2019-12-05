package com.chinatelecom.jx.zone.management.bean.logisticsInfo;

public class WanjiCollectLogBean {
	
	 /***
	 * 收藏id
	 */
	private java.math.BigDecimal collectId;
	 
	 /***
	 * 收藏账户id
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 车源id
	 */
	private java.math.BigDecimal carId;
	 
	 /***
	 * 车牌号
	 */
	private java.lang.String plateNum;
	 
	/***
	 * 车主名
	 */
	private java.lang.String driverId;
	 
	 /***
	 * 车主电话
	 */
	private java.lang.String driverAvatar;
	
	 /***
	 * 车主名
	 */
	private java.lang.String driverName;
	 
	 /***
	 * 车主电话
	 */
	private java.lang.String driverTelphone;
	 
	/**
	 * 当前位置
	 */
	private String curPlace;
	
	 /***
	 * 个人认证
	 */
	private java.lang.Short isAuth;
	 
	 /***
	 * 车辆认证
	 */
	private java.lang.Short isCarauth;
	 
	 /***
	 * 企业认证
	 */
	private java.lang.Short isCompany;
	 
	 /***
	 * 车宽
	 */
	private java.math.BigDecimal carWidth;
	 
	 /***
	 * 车长
	 */
	private java.math.BigDecimal carLength;
	 
	 /***
	 * 载重
	 */
	private java.math.BigDecimal carLoad;
	 
	 /***
	 * 车型
	 */
	private java.lang.String carTypeName;
	 
	 /***
	 * 载型
	 */
	private java.lang.String carLoadTypeName;
	 
	 /***
	 * 状态：1：收藏，0未收藏
	 */
	private java.lang.Short status;
	 
	 /***
	 * 车源发布时间
	 */
	private java.util.Date activeDate;
	
	/***
	 * 车源发布时间接收前台String
	 */
	private String activeDt;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	
	/**
	 * 是否被收藏
	 */
	private String isCollect; 
	
	protected String orderByClause;

	public java.math.BigDecimal getCollectId() {
		return collectId;
	}

	public void setCollectId(java.math.BigDecimal collectId) {
		this.collectId = collectId;
	}

	public java.math.BigDecimal getAccountId() {
		return accountId;
	}

	public void setAccountId(java.math.BigDecimal accountId) {
		this.accountId = accountId;
	}

	public java.math.BigDecimal getCarId() {
		return carId;
	}

	public void setCarId(java.math.BigDecimal carId) {
		this.carId = carId;
	}

	public java.lang.String getPlateNum() {
		return plateNum;
	}

	public void setPlateNum(java.lang.String plateNum) {
		this.plateNum = plateNum;
	}

	public java.lang.String getDriverId() {
		return driverId;
	}

	public void setDriverId(java.lang.String driverId) {
		this.driverId = driverId;
	}

	public java.lang.String getDriverAvatar() {
		return driverAvatar;
	}

	public void setDriverAvatar(java.lang.String driverAvatar) {
		this.driverAvatar = driverAvatar;
	}

	public java.lang.String getDriverName() {
		return driverName;
	}

	public void setDriverName(java.lang.String driverName) {
		this.driverName = driverName;
	}

	public java.lang.String getDriverTelphone() {
		return driverTelphone;
	}

	public void setDriverTelphone(java.lang.String driverTelphone) {
		this.driverTelphone = driverTelphone;
	}

	public String getCurPlace() {
		return curPlace;
	}

	public void setCurPlace(String curPlace) {
		this.curPlace = curPlace;
	}

	public java.lang.Short getIsAuth() {
		return isAuth;
	}

	public void setIsAuth(java.lang.Short isAuth) {
		this.isAuth = isAuth;
	}

	public java.lang.Short getIsCarauth() {
		return isCarauth;
	}

	public void setIsCarauth(java.lang.Short isCarauth) {
		this.isCarauth = isCarauth;
	}

	public java.lang.Short getIsCompany() {
		return isCompany;
	}

	public void setIsCompany(java.lang.Short isCompany) {
		this.isCompany = isCompany;
	}

	public java.math.BigDecimal getCarWidth() {
		return carWidth;
	}

	public void setCarWidth(java.math.BigDecimal carWidth) {
		this.carWidth = carWidth;
	}

	public java.math.BigDecimal getCarLength() {
		return carLength;
	}

	public void setCarLength(java.math.BigDecimal carLength) {
		this.carLength = carLength;
	}

	public java.math.BigDecimal getCarLoad() {
		return carLoad;
	}

	public void setCarLoad(java.math.BigDecimal carLoad) {
		this.carLoad = carLoad;
	}

	public java.lang.String getCarTypeName() {
		return carTypeName;
	}

	public void setCarTypeName(java.lang.String carTypeName) {
		this.carTypeName = carTypeName;
	}

	public java.lang.String getCarLoadTypeName() {
		return carLoadTypeName;
	}

	public void setCarLoadTypeName(java.lang.String carLoadTypeName) {
		this.carLoadTypeName = carLoadTypeName;
	}

	public java.lang.Short getStatus() {
		return status;
	}

	public void setStatus(java.lang.Short status) {
		this.status = status;
	}

	public java.util.Date getActiveDate() {
		return activeDate;
	}

	public void setActiveDate(java.util.Date activeDate) {
		this.activeDate = activeDate;
	}

	public String getActiveDt() {
		return activeDt;
	}

	public void setActiveDt(String activeDt) {
		this.activeDt = activeDt;
	}

	public java.lang.String getRemark() {
		return remark;
	}

	public void setRemark(java.lang.String remark) {
		this.remark = remark;
	}

	public java.util.Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}

	public String getIsCollect() {
		return isCollect;
	}

	public void setIsCollect(String isCollect) {
		this.isCollect = isCollect;
	}

	public String getOrderByClause() {
		return orderByClause;
	}

	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	
}

