package com.chinatelecom.jx.zone.management.bean.weixinReceivedMsg;

/***
 *** 微信公众号收到的消息
****/
public class WeixinReceivedMsgBean {
	
	 /***
	 * 主键
	 */
	private java.math.BigDecimal id;
	 
	 /***
	 * 文本消息内容
	 */
	private java.lang.String content;
	 
	 /***
	 * 发送方微信号
	 */
	private java.lang.String fromUserName;
	 
	 /***
	 * 接收方微信号
	 */
	private java.lang.String toUserName;
	 
	 /***
	 * 消息创建时间 （整型）
	 */
	private java.lang.String createTime;
	 
	 /***
	 * 状态（1=有效，-1已删）
	 */
	private java.lang.String status;
	 
	 /***
	 * 媒体ID
	 */
	private java.lang.String mediaId;
	 
	 /***
	 * 图片链接
	 */
	private java.lang.String picUrl;
	 
	 /***
	 * 语音格式，如amr，speex等
	 */
	private java.lang.String format;
	 
	 /***
	 * 收到的类型类型（文本text，图片image，语音voice，视频video，小视频shortvideo，地理位置location，链接link）
	 */
	private java.lang.String type;
	 
	 /***
	 * 回复标题
	 */
	private java.lang.String title;
	 
	 /***
	 * 消息链接
	 */
	private java.lang.String url;
	 
	 /***
	 * 消息描述
	 */
	private java.lang.String description;
	 
	 /***
	 * 消息ID
	 */
	private java.lang.String msgId;
	 
	 /***
	 * 媒体缩略图ID
	 */
	private java.lang.String thumbMediaId;
	 
	 /***
	 * 地理位置维度
	 */
	private java.lang.String locationY;
	 
	 /***
	 * 地理位置经度
	 */
	private java.lang.String locationX;
	 
	 /***
	 * 地图缩放大小
	 */
	private java.lang.String scale;
	 
	 /***
	 * 地理位置信息
	 */
	private java.lang.String label;
	 
	protected String orderByClause;

	public WeixinReceivedMsgBean(){
	}

	public WeixinReceivedMsgBean(
		java.math.BigDecimal id
	){
		this.id = id;
	}

	 
	public void setId(java.math.BigDecimal value) {
		this.id = value;
	}
	/***
	 * 主键
	 */
	public java.math.BigDecimal getId() {
		return this.id;
	}
	 
	public void setContent(java.lang.String value) {
		this.content = value;
	}
	/***
	 * 文本消息内容
	 */
	public java.lang.String getContent() {
		return this.content;
	}
	 
	public void setFromUserName(java.lang.String value) {
		this.fromUserName = value;
	}
	/***
	 * 发送方微信号
	 */
	public java.lang.String getFromUserName() {
		return this.fromUserName;
	}
	 
	public void setToUserName(java.lang.String value) {
		this.toUserName = value;
	}
	/***
	 * 接收方微信号
	 */
	public java.lang.String getToUserName() {
		return this.toUserName;
	}
	 
	public void setCreateTime(java.lang.String value) {
		this.createTime = value;
	}
	/***
	 * 消息创建时间 （整型）
	 */
	public java.lang.String getCreateTime() {
		return this.createTime;
	}
	 
	public void setStatus(java.lang.String value) {
		this.status = value;
	}
	/***
	 * 状态（1=有效，-1已删）
	 */
	public java.lang.String getStatus() {
		return this.status;
	}
	 
	public void setMediaId(java.lang.String value) {
		this.mediaId = value;
	}
	/***
	 * 媒体ID
	 */
	public java.lang.String getMediaId() {
		return this.mediaId;
	}
	 
	public void setPicUrl(java.lang.String value) {
		this.picUrl = value;
	}
	/***
	 * 图片链接
	 */
	public java.lang.String getPicUrl() {
		return this.picUrl;
	}
	 
	public void setFormat(java.lang.String value) {
		this.format = value;
	}
	/***
	 * 语音格式，如amr，speex等
	 */
	public java.lang.String getFormat() {
		return this.format;
	}
	 
	public void setType(java.lang.String value) {
		this.type = value;
	}
	/***
	 * 收到的类型类型（文本text，图片image，语音voice，视频video，小视频shortvideo，地理位置location，链接link）
	 */
	public java.lang.String getType() {
		return this.type;
	}
	 
	public void setTitle(java.lang.String value) {
		this.title = value;
	}
	/***
	 * 回复标题
	 */
	public java.lang.String getTitle() {
		return this.title;
	}
	 
	public void setUrl(java.lang.String value) {
		this.url = value;
	}
	/***
	 * 消息链接
	 */
	public java.lang.String getUrl() {
		return this.url;
	}
	 
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	/***
	 * 消息描述
	 */
	public java.lang.String getDescription() {
		return this.description;
	}
	 
	public void setMsgId(java.lang.String value) {
		this.msgId = value;
	}
	/***
	 * 消息ID
	 */
	public java.lang.String getMsgId() {
		return this.msgId;
	}
	 
	public void setThumbMediaId(java.lang.String value) {
		this.thumbMediaId = value;
	}
	/***
	 * 媒体缩略图ID
	 */
	public java.lang.String getThumbMediaId() {
		return this.thumbMediaId;
	}
	 
	public void setLocationY(java.lang.String value) {
		this.locationY = value;
	}
	/***
	 * 地理位置维度
	 */
	public java.lang.String getLocationY() {
		return this.locationY;
	}
	 
	public void setLocationX(java.lang.String value) {
		this.locationX = value;
	}
	/***
	 * 地理位置经度
	 */
	public java.lang.String getLocationX() {
		return this.locationX;
	}
	 
	public void setScale(java.lang.String value) {
		this.scale = value;
	}
	/***
	 * 地图缩放大小
	 */
	public java.lang.String getScale() {
		return this.scale;
	}
	 
	public void setLabel(java.lang.String value) {
		this.label = value;
	}
	/***
	 * 地理位置信息
	 */
	public java.lang.String getLabel() {
		return this.label;
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

