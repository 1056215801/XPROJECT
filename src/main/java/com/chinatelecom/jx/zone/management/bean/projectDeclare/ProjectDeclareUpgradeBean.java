package com.chinatelecom.jx.zone.management.bean.projectDeclare;

/***
 *** 账号升级
****/
public class ProjectDeclareUpgradeBean {
	
	 /***
	 * 主键
	 */
	private java.math.BigDecimal upgradeId;
	 
	 /***
	 * 关联账号ID
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 企业名称
	 */
	private java.lang.String companyName;
	 
	 /***
	 * 单位所在省
	 */
	private java.lang.String companyProvince;
	 
	 /***
	 * 单位所在市
	 */
	private java.lang.String companyCity;
	 
	 /***
	 * 单位所在县
	 */
	private java.lang.String companyCounty;
	 
	 /***
	 * 组织信用代码图片URL
	 */
	private java.lang.String companyCodeImage;
	 
	 /***
	 * 账号名称
	 */
	private java.lang.String accountName;
	 
	 /***
	 * 身份证号
	 */
	private java.lang.String idcardNum;
	 
	 /***
	 * 电话
	 */
	private java.lang.String telephone;
	 
	 /***
	 *  授权书图片URL
	 */
	private java.lang.String certificateImage;
	 
	 /***
	 * 状态  枚举值：0，不通过 1，通过 2,审核中
	 */
	private java.lang.Short status;
	 
	 /***
	 * 身份证复印件正面图片URL
	 */
	private java.lang.String idcardFront;
	 
	 /***
	 * 身份证复印件反面图片URL
	 */
	private java.lang.String idcardBack;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	 /***
	 * 类型 0，普通用户 1，政府用户
	 */
	private java.lang.Short type;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	 
	protected String orderByClause;

	public ProjectDeclareUpgradeBean(){
	}

	public ProjectDeclareUpgradeBean(
		java.math.BigDecimal upgradeId
	){
		this.upgradeId = upgradeId;
	}

	 
	public void setUpgradeId(java.math.BigDecimal value) {
		this.upgradeId = value;
	}
	/***
	 * 主键
	 */
	public java.math.BigDecimal getUpgradeId() {
		return this.upgradeId;
	}
	 
	public void setAccountId(java.math.BigDecimal value) {
		this.accountId = value;
	}
	/***
	 * 关联账号ID
	 */
	public java.math.BigDecimal getAccountId() {
		return this.accountId;
	}
	 
	public void setCompanyName(java.lang.String value) {
		this.companyName = value;
	}
	/***
	 * 企业名称
	 */
	public java.lang.String getCompanyName() {
		return this.companyName;
	}
	 
	public void setCompanyProvince(java.lang.String value) {
		this.companyProvince = value;
	}
	/***
	 * 单位所在省
	 */
	public java.lang.String getCompanyProvince() {
		return this.companyProvince;
	}
	 
	public void setCompanyCity(java.lang.String value) {
		this.companyCity = value;
	}
	/***
	 * 单位所在市
	 */
	public java.lang.String getCompanyCity() {
		return this.companyCity;
	}
	 
	public void setCompanyCounty(java.lang.String value) {
		this.companyCounty = value;
	}
	/***
	 * 单位所在县
	 */
	public java.lang.String getCompanyCounty() {
		return this.companyCounty;
	}
	 
	public void setCompanyCodeImage(java.lang.String value) {
		this.companyCodeImage = value;
	}
	/***
	 * 组织信用代码图片URL
	 */
	public java.lang.String getCompanyCodeImage() {
		return this.companyCodeImage;
	}
	 
	public void setAccountName(java.lang.String value) {
		this.accountName = value;
	}
	/***
	 * 账号名称
	 */
	public java.lang.String getAccountName() {
		return this.accountName;
	}
	 
	public void setIdcardNum(java.lang.String value) {
		this.idcardNum = value;
	}
	/***
	 * 身份证号
	 */
	public java.lang.String getIdcardNum() {
		return this.idcardNum;
	}
	 
	public void setTelephone(java.lang.String value) {
		this.telephone = value;
	}
	/***
	 * 电话
	 */
	public java.lang.String getTelephone() {
		return this.telephone;
	}
	 
	public void setCertificateImage(java.lang.String value) {
		this.certificateImage = value;
	}
	/***
	 *  授权书图片URL
	 */
	public java.lang.String getCertificateImage() {
		return this.certificateImage;
	}
	 
	public void setStatus(java.lang.Short value) {
		this.status = value;
	}
	/***
	 * 状态  枚举值：0，不通过 1，通过
	 */
	public java.lang.Short getStatus() {
		return this.status;
	}
	 
	public void setIdcardFront(java.lang.String value) {
		this.idcardFront = value;
	}
	/***
	 * 身份证复印件正面图片URL
	 */
	public java.lang.String getIdcardFront() {
		return this.idcardFront;
	}
	 
	public void setIdcardBack(java.lang.String value) {
		this.idcardBack = value;
	}
	/***
	 * 身份证复印件反面图片URL
	 */
	public java.lang.String getIdcardBack() {
		return this.idcardBack;
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
	 
	public void setType(java.lang.Short value) {
		this.type = value;
	}
	/***
	 * 类型 0，普通用户 1，政府用户
	 */
	public java.lang.Short getType() {
		return this.type;
	}
	 
	public void setRemark(java.lang.String value) {
		this.remark = value;
	}
	/***
	 * 备注
	 */
	public java.lang.String getRemark() {
		return this.remark;
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

