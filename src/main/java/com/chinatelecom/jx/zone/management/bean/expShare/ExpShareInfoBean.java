package com.chinatelecom.jx.zone.management.bean.expShare;

import java.sql.Timestamp;

/***
 *** ExpShareInfo
****/
public class ExpShareInfoBean {
	
	 /***
	 * 园区动态id，主键
	 */
	private java.math.BigDecimal expId;
	 
	 /***
	 * 园区动态标题
	 */
	private java.lang.String expTitle;
	 
	 /***
	 * 分享单位，可以为园区或者企业
	 */
	private java.lang.String expUnit;
	 
	 /***
	 * 海报url
	 */
	private java.lang.String expImage;
	 
	 /***
	 * 分享标签
	 */
	private java.lang.String expLabel;
	 
	 /***
	 * 分享正文
	 */
	private java.lang.String expText;
	 
	 /***
	 * 发布用户id
	 */
	private java.math.BigDecimal accountId;
	 
	 /***
	 * 发布用户名称
	 */
	private java.lang.String accountName;
	 
	 /***
	 * 二维码
	 */
	private java.lang.String qrCode;
	 
	 /***
	 * 状态，0：不通过 1：已发布 2：审核中 3：草稿
	 */
	private java.lang.Short status;
	 
	 /***
	 * 浏览量
	 */
	private java.lang.String browseCount;
	
	 /***
	 * 浏览量 可编辑
	 */
	private java.lang.String browseCountEdit;
	 
	/***
	 * 是否置顶 0：否 1：是
	 */
	private java.lang.Short isTop;
	 
	 /***
	 * 置顶截止时间
	 */
	private java.util.Date topTime;
	/***
	 * 附件url
	 */
	private java.lang.String  expAttachment;
	 
	 /***
	 * 备注
	 */
	private java.lang.String remark;
	 
	 /***
	 * 创建时间
	 */
	private java.util.Date createTime;
	/***
	 * 单位类型
	 */
	private java.lang.Short unitType;
	/***
	 * 单位id
	 */
	private java.math.BigDecimal unitId;
	/***
	 * 单位所在市名称
	 */
	private java.lang.String areaName;
	/***
	 * 单位所在省名称
	 */
	private java.lang.String provinceName;
	/***
	 * 评论量
	 */
	private java.lang.String commentCount;
	/***
	 * 海报id
	 */
	private java.math.BigDecimal imageId;
	/***
	 * 附件id
	 */
	private java.lang.String attachmentId;
	 
	protected String orderByClause;

	public ExpShareInfoBean(){
	}

	public ExpShareInfoBean(
		java.math.BigDecimal expId
	){
		this.expId = expId;
	}

	 
	public void setExpId(java.math.BigDecimal value) {
		this.expId = value;
	}
	/***
	 * 园区动态id，主键
	 */
	public java.math.BigDecimal getExpId() {
		return this.expId;
	}
	 
	public void setExpTitle(java.lang.String value) {
		this.expTitle = value;
	}
	/***
	 * 园区动态标题
	 */
	public java.lang.String getExpTitle() {
		return this.expTitle;
	}
	 
	public void setExpUnit(java.lang.String value) {
		this.expUnit = value;
	}
	/***
	 * 分享单位，可以为园区或者企业
	 */
	public java.lang.String getExpUnit() {
		return this.expUnit;
	}
	 
	public void setExpImage(java.lang.String value) {
		this.expImage = value;
	}
	/***
	 * 海报url
	 */
	public java.lang.String getExpImage() {
		return this.expImage;
	}
	 
	public void setExpLabel(java.lang.String value) {
		this.expLabel = value;
	}
	/***
	 * 分享标签
	 */
	public java.lang.String getExpLabel() {
		return this.expLabel;
	}
	 
	public void setExpText(java.lang.String value) {
		this.expText = value;
	}
	/***
	 * 分享正文
	 */
	public java.lang.String getExpText() {
		return this.expText;
	}
	 
	public void setAccountId(java.math.BigDecimal value) {
		this.accountId = value;
	}
	/***
	 * 发布用户id
	 */
	public java.math.BigDecimal getAccountId() {
		return this.accountId;
	}
	 
	public void setAccountName(java.lang.String value) {
		this.accountName = value;
	}
	/***
	 * 发布用户名称
	 */
	public java.lang.String getAccountName() {
		return this.accountName;
	}
	 
	public void setQrCode(java.lang.String value) {
		this.qrCode = value;
	}
	/***
	 * 二维码
	 */
	public java.lang.String getQrCode() {
		return this.qrCode;
	}
	 
	public void setStatus(java.lang.Short value) {
		this.status = value;
	}
	/***
	 * 状态，0：不通过 1：已发布 2：审核中 3：草稿
	 */
	public java.lang.Short getStatus() {
		return this.status;
	}
	 
	public void setBrowseCount(java.lang.String value) {
		this.browseCount = value;
	}
	/***
	 * 浏览量
	 */
	public java.lang.String getBrowseCount() {
		return this.browseCount;
	}
	
	public void setBrowseCountEdit(java.lang.String browseCountEdit) {
		this.browseCountEdit = browseCountEdit;
	}
	/***
	 * 浏览量 可编辑
	 */
	public java.lang.String getBrowseCountEdit() {
		return browseCountEdit;
	}
	
	public void setIsTop(java.lang.Short value) {
		this.isTop = value;
	}
	/***
	 * 是否置顶 0：否 1：是
	 */
	public java.lang.Short getIsTop() {
		return this.isTop;
	}
	 
	public void setTopTime(java.util.Date value) {
		this.topTime = value;
	}
	/***
	 * 置顶截止时间
	 */
	public java.util.Date getTopTime() {
		return this.topTime;
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
	 
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	/***
	 * 创建时间
	 */
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	
	public java.lang.String getExpAttachment() {
		return expAttachment;
	}

	public void setExpAttachment(java.lang.String expAttachment) {
		this.expAttachment = expAttachment;
	}

	public java.lang.Short getUnitType() {
		return unitType;
	}

	public void setUnitType(java.lang.Short unitType) {
		this.unitType = unitType;
	}

	public java.math.BigDecimal getUnitId() {
		return unitId;
	}

	public void setUnitId(java.math.BigDecimal unitId) {
		this.unitId = unitId;
	}

	public java.lang.String getAreaName() {
		return areaName;
	}

	public void setAreaName(java.lang.String areaName) {
		this.areaName = areaName;
	}

	public java.lang.String getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(java.lang.String commentCount) {
		this.commentCount = commentCount;
	}

	public java.lang.String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(java.lang.String provinceName) {
		this.provinceName = provinceName;
	}

	public java.math.BigDecimal getImageId() {
		return imageId;
	}

	public void setImageId(java.math.BigDecimal imageId) {
		this.imageId = imageId;
	}

	public java.lang.String getAttachmentId() {
		return attachmentId;
	}

	public void setAttachmentId(java.lang.String attachmentId) {
		this.attachmentId = attachmentId;
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
	
	
}

