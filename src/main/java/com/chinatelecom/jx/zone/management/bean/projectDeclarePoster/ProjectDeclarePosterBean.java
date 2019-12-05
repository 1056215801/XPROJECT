package com.chinatelecom.jx.zone.management.bean.projectDeclarePoster;

/***
 *** ProjectDeclarePoster
****/
public class ProjectDeclarePosterBean {
	
	 /***
	 * 海报Id,主键
	 */
	private java.math.BigDecimal posterId;
	/***
	 * 海报主题
	 */
	private java.lang.String posterTitle;
	 
	 /***
	 * 海报附件Id
	 */
	private java.math.BigDecimal attachmentId;
	 
	 /***
	 * 海报附件URL
	 */
	private java.lang.String attachmentUrl;
	 
	 /***
	 * 上传用户Id
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 上传用户名称
	 */
	private java.lang.String accountName;
	 
	 /***
	 * 组织ID
	 */
	private java.math.BigDecimal organizationId;
	 
	 /***
	 * 组织名称
	 */
	private java.lang.String organizationName;
	 
	 /***
	 * 单位ID
	 */
	private java.math.BigDecimal rootId;
	 
	 /***
	 * 单位名称
	 */
	private java.lang.String rootName;
	 
	 /***
	 * 园区ID
	 */
	private java.math.BigDecimal parkId;
	 
	 /***
	 * 园区名称
	 */
	private java.lang.String parkName;
	 
	 /***
	 * 地区Id
	 */
	private java.math.BigDecimal areaId;
	 
	 /***
	 * 地区名称
	 */
	private java.lang.String areaName;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	 
	 /***
	 * 序号
	 */
	private java.lang.Integer sortGrade;
	 
	protected String orderByClause;

	public ProjectDeclarePosterBean(){
	}

	public ProjectDeclarePosterBean(
		java.math.BigDecimal posterId
	){
		this.posterId = posterId;
	}

	 
	public void setPosterId(java.math.BigDecimal value) {
		this.posterId = value;
	}
	/***
	 * 海报Id,主键
	 */
	public java.math.BigDecimal getPosterId() {
		return this.posterId;
	}
	 
	public void setAttachmentId(java.math.BigDecimal value) {
		this.attachmentId = value;
	}
	/***
	 * 海报附件Id
	 */
	public java.math.BigDecimal getAttachmentId() {
		return this.attachmentId;
	}
	 
	public void setAttachmentUrl(java.lang.String value) {
		this.attachmentUrl = value;
	}
	/***
	 * 海报附件URL
	 */
	public java.lang.String getAttachmentUrl() {
		return this.attachmentUrl;
	}
	 
	public void setAccountId(java.math.BigDecimal value) {
		this.accountId = value;
	}
	/***
	 * 上传用户Id
	 */
	public java.math.BigDecimal getAccountId() {
		return this.accountId;
	}
	 
	public void setAccountName(java.lang.String value) {
		this.accountName = value;
	}
	/***
	 * 上传用户名称
	 */
	public java.lang.String getAccountName() {
		return this.accountName;
	}
	 
	public void setOrganizationId(java.math.BigDecimal value) {
		this.organizationId = value;
	}
	/***
	 * 组织ID
	 */
	public java.math.BigDecimal getOrganizationId() {
		return this.organizationId;
	}
	 
	public void setOrganizationName(java.lang.String value) {
		this.organizationName = value;
	}
	/***
	 * 组织名称
	 */
	public java.lang.String getOrganizationName() {
		return this.organizationName;
	}
	 
	public void setRootId(java.math.BigDecimal value) {
		this.rootId = value;
	}
	/***
	 * 单位ID
	 */
	public java.math.BigDecimal getRootId() {
		return this.rootId;
	}
	 
	public void setRootName(java.lang.String value) {
		this.rootName = value;
	}
	/***
	 * 单位名称
	 */
	public java.lang.String getRootName() {
		return this.rootName;
	}
	 
	public void setParkId(java.math.BigDecimal value) {
		this.parkId = value;
	}
	/***
	 * 园区ID
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
	 
	public void setAreaId(java.math.BigDecimal value) {
		this.areaId = value;
	}
	/***
	 * 地区Id
	 */
	public java.math.BigDecimal getAreaId() {
		return this.areaId;
	}
	 
	public void setAreaName(java.lang.String value) {
		this.areaName = value;
	}
	/***
	 * 地区名称
	 */
	public java.lang.String getAreaName() {
		return this.areaName;
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
	 
	public void setSortGrade(java.lang.Integer value) {
		this.sortGrade = value;
	}
	/***
	 * 序号
	 */
	public java.lang.Integer getSortGrade() {
		return this.sortGrade;
	}
	
	public java.lang.String getPosterTitle() {
		return posterTitle;
	}

	public void setPosterTitle(java.lang.String posterTitle) {
		this.posterTitle = posterTitle;
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

