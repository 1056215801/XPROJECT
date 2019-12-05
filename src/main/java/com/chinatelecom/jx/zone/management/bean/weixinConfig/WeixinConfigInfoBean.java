package com.chinatelecom.jx.zone.management.bean.weixinConfig;

/***
 *** 微信配置表
****/
public class WeixinConfigInfoBean {
	
	 /***
	 * 主键
	 */
	private java.math.BigDecimal configId;
	 
	 /***
	 * 微信名称
	 */
	private java.lang.String wxName;
	 
	 /***
	 * 微信公众号
	 */
	private java.lang.String openid;
	 
	 /***
	 * 公众appid
	 */
	private java.lang.String appid;
	 
	 /***
	 * 公众appsecret
	 */
	private java.lang.String appsecret;
	 
	 /***
	 * 微信二维码
	 */
	private java.lang.String qrcode;
	 
	 /***
	 * token
	 */
	private java.lang.String token;
	 
	 /***
	 * 菜单描述
	 */
	private java.lang.String description;
	 
	 /***
	 * 关注时欢迎图
	 */
	private java.lang.String welcomeImg;
	 
	 /***
	 * 关注时欢迎词
	 */
	private java.lang.String welcomeText;
	 
	protected String orderByClause;

	public WeixinConfigInfoBean(){
	}

	public WeixinConfigInfoBean(
		java.math.BigDecimal configId
	){
		this.configId = configId;
	}

	 
	public void setConfigId(java.math.BigDecimal value) {
		this.configId = value;
	}
	/***
	 * 主键
	 */
	public java.math.BigDecimal getConfigId() {
		return this.configId;
	}
	 
	public void setWxName(java.lang.String value) {
		this.wxName = value;
	}
	/***
	 * 微信名称
	 */
	public java.lang.String getWxName() {
		return this.wxName;
	}
	 
	public void setOpenid(java.lang.String value) {
		this.openid = value;
	}
	/***
	 * 微信公众号
	 */
	public java.lang.String getOpenid() {
		return this.openid;
	}
	 
	public void setAppid(java.lang.String value) {
		this.appid = value;
	}
	/***
	 * 公众appid
	 */
	public java.lang.String getAppid() {
		return this.appid;
	}
	 
	public void setAppsecret(java.lang.String value) {
		this.appsecret = value;
	}
	/***
	 * 公众appsecret
	 */
	public java.lang.String getAppsecret() {
		return this.appsecret;
	}
	 
	public void setQrcode(java.lang.String value) {
		this.qrcode = value;
	}
	/***
	 * 微信二维码
	 */
	public java.lang.String getQrcode() {
		return this.qrcode;
	}
	 
	public void setToken(java.lang.String value) {
		this.token = value;
	}
	/***
	 * token
	 */
	public java.lang.String getToken() {
		return this.token;
	}
	 
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	/***
	 * 菜单描述
	 */
	public java.lang.String getDescription() {
		return this.description;
	}
	 
	public void setWelcomeImg(java.lang.String value) {
		this.welcomeImg = value;
	}
	/***
	 * 关注时欢迎图
	 */
	public java.lang.String getWelcomeImg() {
		return this.welcomeImg;
	}
	 
	public void setWelcomeText(java.lang.String value) {
		this.welcomeText = value;
	}
	/***
	 * 关注时欢迎词
	 */
	public java.lang.String getWelcomeText() {
		return this.welcomeText;
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

